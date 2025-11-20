# 黑像素撤离方案设计文档

**项目**: 视频汇聚与自动黑像素填充  
**模块**: pipe_mask_ctrl / video_status_management  
**日期**: 2025-11-04  
**版本**: v1.0

---

## 一、背景与核心概念

### 1.1 黑像素填充（Mask）
- **控制信号**: `pipe_mask_bitmap[3:0]`
- **触发时机**: 在取4个 `video_status_buffer` 数据之前进行检测
- **检测内容**:
  - **延迟检测**: 通过 `timestamp_align_determination` 检查包的时间戳是否超过 `reg_sync_aggr_video_timeout_threshold`
  - **正确性检测**: 通过 `video_status_determination` 检查包类型(datatype)、帧号、行号是否正确
- **结果处理**:
  - 检测失败 → `video_status_fail_bitmap[i]=1` → 新增 `pipe_mask_bitmap[i]=1`
  - 后续该 pipe 由 BPG (Black Pixel Generator) 提供黑像素数据

### 1.2 黑像素撤离（Withdraw）
- **控制信号**: `Video_Mask_Restart_En[3:0]`
- **触发条件**: 
  - 用户置高 `Video_Mask_Restart_En[i]=1`
  - **且** 识别到 `pipe_frame_active[i]=1` (active frame)
  - **且** 对应 pipe 的 `pipe_mask_bitmap[i]=1` (当前正在补黑)
- **工作原理**:
  - 允许该 pipe 进行检测
  - 检测成功 → `video_status_pass_bitmap[i]=1` → 清除 `pipe_mask_bitmap[i]`
  - 后续该 pipe 恢复使用真实视频数据

### 1.3 关键理解点 ⚠️
- **黑像素撤离不是立即/延迟切换的timing问题**，而是**有条件检测后恢复**的机制
- `timestamp_align_fail` **不是"超时无数据"**，而是**"延迟过大"**（数据存在但时间戳不满足对齐条件）
- **只要有 `data_vld`，最多 `reg_sync_aggr_video_timeout_threshold` 时间后就会进入检测，3拍后必然得到判决结果**
- `timestamp_align_fail` 意味着回到 `IDLE` 状态，在 `us_cnt` 递增的同时**重新进行时戳对齐检测**（重试机制）

---

## 二、方案A：条件控制写入 + 脉冲清空（当前实现）

### 2.1 实现机制

#### 写入控制
```verilog
// pipe_mask_ctrl.v line 253-260
always @(*) begin
    integer i;
    for (i = 0; i < 4; i = i + 1) begin
        if ((current_state == INIT) || (pipe_mask_bitmap[i] && !Video_Mask_Restart_En[i])) begin
            pipe_wr_mode[2*i+1 : 2*i] = 2'b00;  // 禁止写入
        end
        else begin
            pipe_wr_mode[2*i+1 : 2*i] = 2'b10;  // 允许写入（FS-FE开窗）
        end
    end
end
```

**逻辑**:
- 当 `pipe_mask_bitmap[i]=1` **且** `Video_Mask_Restart_En[i]=0` → 禁止写入
- 当 `Video_Mask_Restart_En[i]=1` → **立即允许写入**

#### FIFO清空
```verilog
// pipe_mask_ctrl.v line 238-245
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pipe_clear_pulse <= 4'b0;
    end
    else if (current_state != CLEAR_MASK_PIPE && next_state == CLEAR_MASK_PIPE) begin
        pipe_clear_pulse <= pipe_mask_bitmap;  // 仅在进入CLEAR_MASK_PIPE时产生一次脉冲
    end
    else begin
        pipe_clear_pulse <= 4'b0;
    end
end
```

**逻辑**:
- 仅在进入 `CLEAR_MASK_PIPE` 状态时产生**单个时钟周期脉冲**
- FIFO 在脉冲到来时清空

### 2.2 时序分析

```
t0: pipe_mask_bitmap[0]=1, Video_Mask_Restart_En[0]=0
    → pipe_wr_mode[0]=00 (禁止写入)
    
t1: Video_Mask_Restart_En[0]=1 (用户置高，尝试撤离)
    → pipe_wr_mode[0]=10 (允许写入！)
    → video_pipe 开始接收数据
    
t2-t5: 数据持续写入 video_pipe FIFO 和 video_status_buffer
       ⚠️ 可能接收到错误/无效数据（video_loss、帧错误等）
       
t6: FSM 进入 CLEAR_MASK_PIPE 状态
    → pipe_clear_pulse[0]=1 (一个时钟周期脉冲)
    → 清空 FIFO
```

### 2.3 关键问题

1. **写入时机不当**: `Video_Mask_Restart_En[0]=1` 后立即允许写入，但此时：
   - 可能还在补黑像素阶段
   - 还未检测到 `frame_active`
   - 可能接收到的是错误/残留数据

2. **清空时机晚**: 只有进入 `CLEAR_MASK_PIPE` 状态才清空，此时错误数据已累积

3. **脉冲清空不彻底**: 单次脉冲清空可能无法完全清除 FIFO 中的所有数据（特别是正在传输的数据）

4. **数据紊乱风险**: t1-t6 期间累积的错误数据可能无法完全清除，导致后续检测失败，影响撤离成功率

---

## 三、方案B：持续清空 + 开窗准入机制（推荐）⭐

### 3.1 核心思路

- **持续清空**: `pipe_mask_bitmap` 直接驱动 FIFO 和 `video_status_buffer` 的 `clear` 端（电平控制）
- **定时器触发**: 每隔 1s 触发一次撤离尝试（通过 `restart_timer_en`）
- **开窗准入**: 在 `frame_active` 检测到时，将 `clear` 信号清0，**开窗**允许有效数据进入
- **统一关窗**: 只在 `CLEAR_MASK_PIPE` 状态统一关闭所有窗口

### 3.2 关键信号定义

| 信号名 | 位宽 | 功能 |
|:------|:-----|:-----|
| `restart_timer_en[3:0]` | 4 bit | 定时器触发信号（每1s置1一次） |
| `restart_timer_cnt[3:0][19:0]` | 4x20 bit | 定时器计数器（@1MHz） |
| `pipe_data_window_open_reg[3:0]` | 4 bit | 开窗准入标志（1=允许数据进入） |
| `pipe_fifo_clear[3:0]` | 4 bit | FIFO清空控制（1=清空） |

### 3.3 信号关系

```verilog
// FIFO持续清空控制
assign pipe_fifo_clear = pipe_mask_bitmap & ~pipe_data_window_open_reg;
```

**逻辑**:
- 当 `pipe_mask_bitmap[i]=1` 且 `pipe_data_window_open_reg[i]=0` → 持续清空
- 当 `pipe_data_window_open_reg[i]=1` → 停止清空，允许数据进入

### 3.4 开窗条件（在 IDLE 状态）

```verilog
if (restart_timer_en[i] &&          // 定时器到期（1s）
    pipe_frame_active[i] &&         // 检测到活跃帧
    pipe_mask_bitmap[i]) begin      // 当前正在补黑
    pipe_data_window_open_reg[i] <= 1'b1;  // 开窗
end
```

### 3.5 关窗条件 ⚠️ **关键设计点**

**统一关窗点**: 只在 `CLEAR_MASK_PIPE` 状态关窗

```verilog
if (current_state == CLEAR_MASK_PIPE) begin
    pipe_data_window_open_reg <= 4'b0;  // 统一关闭所有窗
end
```

**为什么不在 `timestamp_align_fail` 时关窗？**

因为 `timestamp_align_fail` 表示**延迟过大**，需要回到 `IDLE` 状态在 `us_cnt` 递增的同时**重新进行时戳对齐检测**（重试机制）。如果此时关窗，会导致：
- 窗口被关闭，无法继续接收数据
- 失去重试机会，撤离失败

**正确行为**:
- `timestamp_align_fail` → 回到 `IDLE` → **窗口保持开启** → 等待 `us_cnt` 增长 → 再次检测
- 只有在 `CLEAR_MASK_PIPE` 状态（检测完成，无论成功/失败）才统一关窗

### 3.6 完整时序图

```wavedrom
{signal: [
  {name: 'clk', wave: 'p....................................................................'},
  {name: 'video_mask_restart', wave: '0.1..................................................................', data: ['head', 'body', 'tail', 'data'], "node": "..a...."},
  {name: 'video_mask_restart_hold_cnt', wave: '2..2|2...........2.........2.|2..................0...................', data: ['1', '...', '1000','1', '...', '1000'], "node": ".....c...........h"},
  {name: 'video_mask_restart_hold_window', wave: '0...|1...........0...........|1..................0...................', data: ['1', '...', '1000']},
  {name: 'evacuate_mem_clear', wave: '2...|.22222.......2..........|.22222..............2..................', data: ['1', '2', '3', '4', '5', '6','1', '2', '3', '4', '5', '6','1'],"node": "..........d"},
  {name: 'mem_clear', wave: '1...|.0....................1.|.0.....................................', data: ['1', '2', '3', '4', '5']},
  {name: 'wr_mode', wave: '2...|......2...............2.|......2................................', data: ['00', '10', '00', '10'] ,"node": "...........e"},
  {name: 'idi', wave: '0...|........20....2..02..0..|.......20......20....2..02..02..0....20', data: ['FS','LONG_PKT','LONG_PKT','FE','FS','LONG_PKT','LONG_PKT','LONG_PKT','FE'],"node": ".............f"},
  {name: 'frame_active', wave: '0...|........1.............0.|...............1......................0'},
  {name: 'pipe_mask_bitmap', wave: '1...|...........0.........1..|..................0....................', "node": "..b.............g"},
],
  "edge": [
    "a~>c ",  
    "b~>c ", 
  	"c~>d ",
  	"d~>e ",
  	"e~>f ",
  	"f~>g ",
  	"g~>h ",
  ]
}
```

### 3.7 边界条件与防护

#### 1. 长时间无数据情况
- **现象**: 开窗后长时间没有 `data_vld`
- **行为**: 窗口保持开启（符合"继续等待并重试"策略）
- **保护**: 
  - 用户可通过 `video_mask_latch_reset` 强制退出
  - 用户可清除 `Video_Mask_Restart_En[i]` 取消撤离尝试
  - **可选扩展**: 增加 `retry_limit` 逻辑，超过次数后自动放弃

#### 2. 外部取消撤离
```verilog
// 全局取消条件（优先级高于状态机内动作）
if (video_mask_latch_reset) begin
    pipe_data_window_open_reg <= 4'b0;
end
// 当 pipe_mask_bitmap 某位被外部清0时也应立即关窗对应位
pipe_data_window_open_reg <= pipe_data_window_open_reg & pipe_mask_bitmap;
```

#### 3. 防止窗口泄漏
- 在 `INIT` 状态强制关闭所有窗
- 在 `CLEAR_MASK_PIPE` 状态统一关闭所有窗
- 与 `pipe_mask_bitmap` 联动，mask清除时自动关窗

---

## 四、方案对比总结

| 维度 | 方案A（当前实现） | 方案B（推荐）⭐ |
|:-----|:-----------------|:-------------|
| **FIFO清空方式** | 脉冲清空（单次） | 持续清空（电平控制） |
| **写入控制** | `pipe_wr_mode` 条件控制 | `pipe_fifo_clear` + 开窗准入 |
| **清空时机** | 进入 `CLEAR_MASK_PIPE` 时 | `pipe_mask_bitmap=1` 期间持续 |
| **数据准入条件** | `!Video_Mask_Restart_En` | `frame_active` + 定时器 + 开窗 |
| **开窗时机** | 无明确开窗概念 | IDLE状态，定时器到期 + frame_active |
| **关窗时机** | 无明确关窗概念 | 统一在 `CLEAR_MASK_PIPE` 状态 |
| **错误数据风险** | ⚠️ 高（可能累积） | ✅ 低（持续清除） |
| **撤离成功率** | ⚠️ 低（FIFO可能紊乱） | ✅ 高（FIFO干净） |
| **重试机制** | 依赖定时器 | 明确的开窗/关窗 + 重试 |
| **timestamp_align_fail处理** | 回IDLE，写入仍开启 | 回IDLE，**窗口保持开启**以重试 |
| **实现复杂度** | 简单 | 中等（需增加开窗逻辑） |
| **定时器需求** | ❌ 无 | ✅ 1s定时器 |
| **资源占用** | 低 | 中（额外状态机+计数器） |

---

## 五、方案B的关键设计点（必须理解）

### 5.1 开窗/关窗的本质
- **开窗** = 允许"新鲜有效数据"进入 FIFO 和 `video_status_buffer`，用于后续检测
- **关窗** = 停止数据进入，FIFO 被持续清空
- **窗口状态** 独立于 FSM 状态，通过 `pipe_data_window_open_reg` 维护

### 5.2 为什么不在 `timestamp_align_fail` 时关窗？ ⚠️
**这是最容易误解的地方！**

- `timestamp_align_fail` **不是失败终结状态**，而是"当前时刻时间戳未对齐，需要重试"
- 设计意图：回到 `IDLE` → 等待 `us_cnt` 增长 → 再次检测
- 如果此时关窗：
  - 数据停止进入
  - 失去重试机会
  - 撤离永远无法成功
  
**正确做法**: 窗口保持开启，等待下一次 `data_vld` 再次进入检测

### 5.3 统一关窗的优势
- **逻辑简单**: 只在一个地方关窗（`CLEAR_MASK_PIPE`）
- **易于维护**: 避免在多个状态分散关窗逻辑
- **覆盖所有场景**:
  - `video_status_pass` → 撤离成功 → 关窗
  - `video_status_fail` → 撤离失败 → 关窗
  - 无论哪种结果，都经过 `CLEAR_MASK_PIPE`

### 5.4 定时器的作用
- **避免频繁尝试**: 每隔1s才触发一次撤离尝试
- **减少功耗**: 不是每个 IDLE 周期都检测
- **符合设计文档**: "每隔1s执行一次清0"

### 5.5 与现有FSM的兼容性
- **完全兼容**: 不修改 FSM 状态转换逻辑
- **仅增强**: 增加开窗/关窗机制，提供更精确的数据控制
- **性能影响**: 微小（仅增加开窗判断逻辑）

---

## 六、方案B完整实现（定时/可配置触发）

### 6.1 实现策略说明

#### 核心思路
采用**可配置定时器 + 开窗准入控制**的混合策略，确保：
1. 软件通过 `Video_Mask_Restart_En` 表达"允许尝试撤离"的意图
2. 硬件通过定时器控制实际开窗时机（避免频繁尝试）
3. 在开窗前保持 `pipe_fifo_clear=1` 持续清空，确保缓存干净
4. 只有在满足条件时才释放清空并允许数据进入

#### 为什么不能直接用 `Video_Mask_Restart_En` 开窗？⚠️
如果 `Video_Mask_Restart_En=1` 就立即开窗（`pipe_fifo_clear=0`），会导致：
- **问题1**: 两个缓存（video_pipe FIFO 和 video_status_buffer）停止清空
- **问题2**: 如果写端仍在写入错误/残留数据，缓存会被污染
- **问题3**: 后续检测时无法保证"正确数据到来时管道是干净的"
- **结果**: 检测失败率高，撤离成功率低

**正确做法**:
- `Video_Mask_Restart_En` 只是"允许撤离"的意图信号
- 实际开窗时机由硬件根据定时器 + `pipe_frame_active` 决定
- 在开窗前始终保持 `pipe_fifo_clear=1`（持续清空）

#### 定时器的作用
1. **避免频繁尝试**: 不是每次回到 IDLE 就立即开窗，而是有节奏地尝试
2. **给恢复时间**: 视频从 `video_loss` 恢复需要时间（重新锁相、同步等）
3. **可配置**: 通过寄存器 `reg_mask_restart_interval` 可调整间隔（默认1s）
4. **保证干净**: 在定时器到期前始终保持清空，确保缓存干净

### 6.2 需要新增/修改的信号

#### 6.2.1 顶层模块端口（pipe_mask_ctrl.v）

**新增输入**:
```verilog
input  wire [19:0]  reg_mask_restart_interval,      // 撤离重试间隔（单位：us，默认1,000,000=1s）
input  wire [3:0]   video_loss,                     // 视频丢失标志（已有，需确认连接）
```

**新增输出**:
```verilog
output wire [3:0]   pipe_fifo_clear,                // FIFO持续清空控制
output reg  [3:0]   pipe_data_window_open_reg,      // 开窗准入标志（调试用）
```

#### 6.2.2 内部信号

```verilog
// 定时器相关
reg  [3:0]          restart_timer_en;                // 定时器触发标志
reg  [19:0]         restart_timer_cnt [3:0];         // 定时器计数器（每个pipe独立）

// 开窗控制
reg  [3:0]          pipe_data_window_open_reg;       // 开窗准入寄存器

// FIFO清空控制
wire [3:0]          pipe_fifo_clear;                 // 持续清空信号
```

### 6.3 完整代码实现

#### 6.3.1 定时器逻辑（在 pipe_mask_ctrl.v 中添加）

```verilog
//==========================================================================
// Restart Timer Logic (Per-Pipe Independent)
//==========================================================================
// Purpose: Control the retry interval for mask withdrawal attempts
// Each pipe has independent 20-bit counter counting from 0 to reg_mask_restart_interval

reg  [3:0]  restart_timer_en;
reg  [19:0] restart_timer_cnt [3:0];

always @(posedge clk or negedge rst_n) begin : restart_timer_logic
    integer i;
    if (!rst_n) begin
        for (i = 0; i < 4; i = i + 1) begin
            restart_timer_cnt[i] <= 20'd0;
            restart_timer_en[i] <= 1'b0;
        end
    end
    else begin
        for (i = 0; i < 4; i = i + 1) begin
            // Start/continue counting when:
            // 1. pipe is masked (pipe_mask_bitmap[i]==1)
            // 2. user enables restart (Video_Mask_Restart_En[i]==1)
            // 3. video is lost (video_loss[i]==1)
            if (pipe_mask_bitmap[i] && Video_Mask_Restart_En[i] && video_loss[i]) begin
                // Timer expired, trigger restart attempt
                if (restart_timer_cnt[i] >= reg_mask_restart_interval) begin
                    restart_timer_en[i] <= 1'b1;        // Trigger (1 cycle pulse)
                    restart_timer_cnt[i] <= 20'd0;      // Reset counter
                end
                else begin
                    // Increment counter (1us per pulse_1m_sync)
                    restart_timer_cnt[i] <= restart_timer_cnt[i] + {19'd0, pulse_1m_sync};
                    restart_timer_en[i] <= 1'b0;
                end
            end
            else begin
                // Not in restart condition, reset timer
                restart_timer_cnt[i] <= 20'd0;
                restart_timer_en[i] <= 1'b0;
            end
        end
    end
end
```

#### 6.3.2 开窗/关窗控制逻辑

```verilog
//==========================================================================
// Window Open/Close Control
//==========================================================================
// Purpose: Control when to stop clearing FIFOs and allow data ingress
// 
// Open Window (in IDLE state):
//   - restart_timer_en[i] triggers (timer expired)
//   - pipe_frame_active[i] is high (active frame detected)
//   - pipe_mask_bitmap[i] is high (currently masked)
//
// Close Window (unified at CLEAR_MASK_PIPE state):
//   - All windows closed when entering CLEAR_MASK_PIPE
//   - OR when video_mask_latch_reset
//   - OR when pipe_mask_bitmap[i] cleared

reg [3:0] pipe_data_window_open_reg;

always @(posedge clk or negedge rst_n) begin : window_control_logic
    integer i;
    if (!rst_n) begin
        pipe_data_window_open_reg <= 4'b0;
    end
    else begin
        // Priority 1: Force close all windows on reset/init
        if (video_mask_latch_reset) begin
            pipe_data_window_open_reg <= 4'b0;
        end
        
        // Priority 2: State-based control
        else begin
            case (current_state)
                INIT: begin
                    // Close all windows during initialization
                    pipe_data_window_open_reg <= 4'b0;
                end
                
                IDLE: begin
                    // Open window when conditions met
                    for (i = 0; i < 4; i = i + 1) begin
                        if (restart_timer_en[i] &&          // Timer expired
                            pipe_frame_active[i] &&         // Active frame present
                            pipe_mask_bitmap[i]) begin      // Currently masked
                            pipe_data_window_open_reg[i] <= 1'b1;  // Open window
                        end
                        // Keep existing state otherwise (important for retry)
                    end
                end
                
                CLEAR_MASK_PIPE: begin
                    // Unified close point: close all windows
                    pipe_data_window_open_reg <= 4'b0;
                end
                
                default: begin
                    // Maintain current state in other states
                    pipe_data_window_open_reg <= pipe_data_window_open_reg;
                end
            endcase
        end
        
        // Priority 3: Auto-close when pipe_mask_bitmap cleared
        // (pipe successfully recovered, no longer needs window)
        pipe_data_window_open_reg <= pipe_data_window_open_reg & pipe_mask_bitmap;
    end
end
```

#### 6.3.3 FIFO持续清空控制

```verilog
//==========================================================================
// FIFO Continuous Clear Control
//==========================================================================
// Purpose: Generate continuous clear signal for video_pipe FIFO and video_status_buffer
//
// Logic: Clear when pipe is masked AND window is closed
//   pipe_fifo_clear[i] = pipe_mask_bitmap[i] & ~pipe_data_window_open_reg[i]
//
// Behavior:
//   - When pipe_mask_bitmap[i]=1 and window closed: Clear continuously
//   - When window opens: Stop clearing, allow data ingress
//   - When pipe_mask_bitmap[i]=0: No clearing (pipe recovered)

wire [3:0] pipe_fifo_clear;

assign pipe_fifo_clear = pipe_mask_bitmap & ~pipe_data_window_open_reg;
```

#### 6.3.4 修改 pipe_wr_mode 生成逻辑

```verilog
//==========================================================================
// pipe_wr_mode Generation (Modified)
//==========================================================================
// Purpose: Control video_pipe write enable based on FIFO clear status
//
// Original logic (方案A):
//   - Disabled when: INIT OR (pipe_mask_bitmap[i] && !Video_Mask_Restart_En[i])
//   - Enabled otherwise
//
// New logic (方案B):
//   - Disabled when: INIT OR pipe_fifo_clear[i]==1
//   - Enabled when: pipe_fifo_clear[i]==0 (window open, clean data expected)

always @(*) begin : pipe_wr_mode_generation
    integer i;
    for (i = 0; i < 4; i = i + 1) begin
        if ((current_state == INIT) || pipe_fifo_clear[i]) begin
            // Disable write: during init or when FIFO is being cleared
            pipe_wr_mode[2*i+1 : 2*i] = 2'b00;
        end
        else begin
            // Enable write: window open, allow data (FS-FE windowed write)
            pipe_wr_mode[2*i+1 : 2*i] = 2'b10;
        end
    end
end
```

### 6.4 需要修改的其他文件

#### 6.4.1 as6d_app_video_status_management.v

**修改点**: 连接 `pipe_fifo_clear` 到 AFIFO wrapper 的复位端

```verilog
// 原有端口增加
input  wire [3:0]  pipe_fifo_clear,   // From pipe_mask_ctrl

// AFIFO wrapper 实例化修改（以 pipe_0 为例）
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper u_video_status_buffer_0 (
    .wr_clk         (fifo_wr_clk_0),
    .wr_rst_n       (fifo_wr_clk_rst_n_0 & ~pipe_fifo_clear[0]),  // 持续清空控制
    .rd_clk         (aggr_clk),
    .rd_rst_n       (aggr_clk_rst_n & ~pipe_fifo_clear[0]),       // 持续清空控制
    // ... 其他连接
);

// 对 pipe_1/2/3 重复相同修改
```

#### 6.4.2 video_pipe 模块（假设路径）

**修改点**: 连接 `pipe_fifo_clear` 到数据 FIFO 的复位/清空端

```verilog
// 在 video_pipe 模块中
input  wire        pipe_fifo_clear,   // From pipe_mask_ctrl

// FIFO 控制逻辑修改
always @(posedge fifo_wr_clk or negedge fifo_wr_clk_rst_n) begin
    if (!fifo_wr_clk_rst_n || pipe_fifo_clear) begin
        // Clear FIFO: reset read/write pointers
        fifo_wr_ptr <= '0;
        fifo_rd_ptr <= '0;
        fifo_count  <= '0;
        // ... 其他清空操作
    end
    else begin
        // Normal FIFO operation
        // ...
    end
end
```

### 6.5 寄存器配置

#### 新增寄存器定义

| 寄存器名 | 位宽 | 默认值 | 说明 |
|:--------|:-----|:------|:-----|
| `reg_mask_restart_interval` | 20 bit | 1,000,000 | 撤离重试间隔（单位：us）<br>默认1s，可配置范围：1us~1,048,575us |
| `reg_mask_restart_retry_limit` | 8 bit | 10 | （可选）最大重试次数，超过后放弃<br>0表示无限重试 |

#### 寄存器地址映射（示例）

```verilog
// 在寄存器模块中
localparam ADDR_MASK_RESTART_INTERVAL = 12'hXXX;  // 根据实际地址分配
localparam ADDR_MASK_RESTART_RETRY_LIMIT = 12'hYYY;

// 寄存器读写逻辑
always @(posedge reg_clk or negedge reg_rst_n) begin
    if (!reg_rst_n) begin
        reg_mask_restart_interval <= 20'd1000000;  // 默认1s
        reg_mask_restart_retry_limit <= 8'd10;
    end
    else if (reg_write_en) begin
        case (reg_addr)
            ADDR_MASK_RESTART_INTERVAL: 
                reg_mask_restart_interval <= reg_wdata[19:0];
            ADDR_MASK_RESTART_RETRY_LIMIT:
                reg_mask_restart_retry_limit <= reg_wdata[7:0];
        endcase
    end
end
```

### 6.6 验证要点

#### 测试场景

1. **场景1: 正常恢复流程**
   - 初始: `pipe_mask_bitmap[0]=1`, `Video_Mask_Restart_En[0]=1`
   - 等待定时器到期（1s）
   - 检测到 `pipe_frame_active[0]=1`
   - 窗口打开 → 正确数据进入 → 检测通过 → 撤离成功
   - **验证**: FIFO在开窗前被持续清空，开窗后只接收干净数据

2. **场景2: timestamp_align_fail 重试**
   - 开窗后接收数据
   - `timestamp_align_fail=1` → 回到 IDLE
   - **验证**: 窗口保持开启（不关闭）
   - 等待 `us_cnt` 增长，再次进入检测
   - 重复直到成功或达到 retry_limit

3. **场景3: 长时间无数据**
   - 开窗后长时间没有 `data_vld`
   - **验证**: 窗口保持开启，等待数据
   - 可通过 `video_mask_latch_reset` 或清除 `Video_Mask_Restart_En` 退出

4. **场景4: 外部强制退出**
   - 撤离过程中触发 `video_mask_latch_reset`
   - **验证**: 立即关闭所有窗口，FIFO重新清空

5. **场景5: 数据错误导致失败**
   - 开窗 → 数据进入 → `video_status_fail=1`
   - 进入 `CLEAR_MASK_PIPE` → 统一关窗
   - **验证**: 窗口关闭，FIFO重新清空，等待下次定时器触发

6. **场景6: 可配置间隔测试**
   - 配置 `reg_mask_restart_interval=100,000` (100ms)
   - **验证**: 定时器每100ms触发一次，而非1s

#### Testbench 关键检查点

```verilog
// 伪代码示例
initial begin
    // 场景1: 正常恢复
    @(posedge restart_timer_en[0]);
    assert(pipe_fifo_clear[0] == 1) else $error("FIFO should be clearing before window opens");
    
    @(posedge pipe_data_window_open_reg[0]);
    assert(pipe_fifo_clear[0] == 0) else $error("FIFO clear should stop when window opens");
    
    @(posedge video_status_pass_bitmap[0]);
    @(current_state == CLEAR_MASK_PIPE);
    assert(pipe_data_window_open_reg[0] == 0) else $error("Window should close at CLEAR_MASK_PIPE");
    
    // 场景2: timestamp_align_fail 重试
    @(timestamp_align_fail);
    @(current_state == IDLE);
    assert(pipe_data_window_open_reg[0] == 1) else $error("Window should remain open for retry");
end
```

### 6.7 优势总结

| 方面 | 方案A（当前） | 方案B（定时触发） |
|:-----|:------------|:----------------|
| FIFO干净度保证 | ❌ 弱 | ✅ 强（持续清空） |
| 撤离成功率 | ⚠️ 低（可能被污染） | ✅ 高（干净数据） |
| 尝试频率控制 | ❌ 无 | ✅ 可配置 |
| 重试机制 | ⚠️ 不明确 | ✅ 明确（保持窗口） |
| 软件可控性 | ⚠️ 有限 | ✅ 高（可配置间隔） |
| 调试能力 | ⚠️ 弱 | ✅ 强（状态可见） |
| 实现复杂度 | 低 | 中等 |

---

## 七、待讨论问题

1. 是否需要增加 `retry_limit` 逻辑，避免"永远等待"？
2. `restart_timer` 的超时时间是否固定为1s，还是需要可配置寄存器？
3. 是否需要增加调试信号（例如 `restart_attempt_cnt` 记录重试次数）？
4. `timestamp_align_fail` 后是否需要额外的退避策略（例如指数退避）？

---

## 八、参考资料

- `video_aggregator_design.md` - 整体设计文档
- `pipe_mask_ctrl.v` - 当前实现代码
- `as6d_app_video_status_management.v` - 视频状态管理模块

---

**文档版本历史**
- v1.0 (2025-11-04): 初始版本，记录两个方案及关键设计点
