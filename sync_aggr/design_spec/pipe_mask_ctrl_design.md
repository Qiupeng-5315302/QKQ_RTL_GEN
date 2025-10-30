## 视频管道屏蔽详细设计 - pipe_mask_ctrl

### 1. 模块概述

#### 1.1 功能说明

本模块作为视频管道屏蔽的顶层控制器，负责管理4路视频pipe的屏蔽状态。

- 通过配置信号实现本地 pipe_mask_bitmap 维护
- 输出 pipe_normal_bitmap/pipe_restart_bitmap 给子模块进行判定
- 子模块 timestamp_align_determination 通过检查4路fwft_fifo的有效出口数据，判断pipe是否对齐成功
- 子模块 video_status_determination 检查数据包的datatype序列和pkt_id正确性，输出pass/fail位图
- **配置锁定**: `Force_Video_Mask`和`Auto_Mask_En`仅在INIT状态采样并锁存（防止中途修改），`Video_Mask_Restart_En`实时响应
- **输出信号**: `pipe_clear_pulse`和`start_sch_pulse`为单周期边沿脉冲，`pipe_wr_mode`为8-bit电平信号(2bit×4pipe扩展自pipe_mask_bitmap)

### 2. 接口定义

#### 2.1 输入输出端口
| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `clk` | I | 1 | 入口时钟 |
| `rst_n` | I | 1 | 异步复位，低有效 |
| `pipe_concat_en`| I | 4 |   **【配置寄存器】**  同步汇聚pipe使能 |
| `Force_Video_Mask`| I | 4 |   **【配置寄存器】**  强制屏蔽-使能 |
| `Auto_Mask_En` | I | 4 |   **【配置寄存器】**  自动屏蔽-使能 |
| `Video_Mask_Restart_En` | I | 4 |    **【配置寄存器】**  自动屏蔽-退出屏蔽  |
| `pipe_frame_active` | I | 4 |    **【from video_pipe】**  识别到有FS进入pipe  |
| `frame_sync_lock`| I | 1 |  **【配置寄存器】** 帧锁定标志位 |
| `aggre_mode`| I | 2 | **【配置寄存器】** 汇聚模式<br> 2'b01: 同步汇聚w4h模式 <br> 2'b10: 异步汇聚模式1<br> 2'b11: 异步汇聚模式2|
| `video_mask_latch_reset`| I | 1 | **【配置寄存器】** 重置pipe_mask_bitmap到初始状态 |
| `data_vld`| I | 4 | **【from fwft_fifo】** FIFO出口数据有效位 |
| `data_0`| I | 102 | **【from fwft_fifo】** FIFO_0出口数据 |
| `data_1`| I | 102 | **【from fwft_fifo】** FIFO_1出口数据 |
| `data_2`| I | 102 | **【from fwft_fifo】** FIFO_2出口数据 |
| `data_3`| I | 102 | **【from fwft_fifo】** FIFO_3出口数据 |
| `local_timestamp`| I | 80 | **【from us_counter】** 本地us计数器值 |
| `reg_sync_aggr_video_timeout_threshold`| I | 20 | **【配置寄存器】** 同步汇聚超时阈值 |
| `pipe_clear_pulse`| O | 4 | **【to video_pipe】** 控制video_pipe 缓存清空（脉冲信号） |
| `pipe_wr_mode`| O | 8 | **【to video_pipe】** 控制video_pipe 入口写入状态（2bit×4pipe） |
| `start_sch_pulse`| O | 1 | **【to sch_concat】** 启动同步汇聚（脉冲信号） |
| `end_sch_pulse`| I | 1 | **【from sch_concat】** 结束同步汇聚 |
| `pipe_mask_bitmap`| O | 4 | **【状态输出】** 当前pipe屏蔽位图 |
| `pipe_normal_bitmap`| O | 4 | **【状态输出】** 正常工作pipe位图 |
| `pipe_restart_bitmap`| O | 4 | **【状态输出】** 尝试恢复pipe位图 |

#### 2.2 内部信号

| 内部关键变量 | 类型 | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `delay_cnt`| reg | 4 | 延迟计数器（用于3拍流水线） |
| `local_force_video_mask`| reg | 4 | INIT状态锁存的Force_Video_Mask |
| `local_auto_mask_en`| reg | 4 | INIT状态锁存的Auto_Mask_En |
| `fault_clear_mask_pipe_error`| reg | 1 | 内部debug故障标志 |
| `pipe_normal_bitmap`| wire | 4 | 等于~pipe_mask_bitmap & pipe_concat_en |
| `pipe_restart_bitmap`| wire | 4 | 等于 pipe_mask_bitmap & Video_Mask_Restart_En & pipe_frame_active |
| `start_timestamp_align`| wire | 1 | 状态转换触发的脉冲信号（IDLE→DURING_TIMESTAMP_ALIGN_DETERMING） |
| `timestamp_align_pass`| wire | 1 | 由timestamp_align_determination子模块输出 |
| `timestamp_align_fail`| wire | 1 | 由timestamp_align_determination子模块输出 |
| `timestamp_align_pass_bitmap`| wire | 4 | 由timestamp_align_determination子模块输出 |
| `start_video_status_determing`| wire | 1 | 状态转换触发的脉冲信号 |
| `video_status_pass_bitmap`| wire | 4 | 由video_status_determination子模块输出 |
| `video_status_fail_bitmap`| wire | 4 | 由video_status_determination子模块输出 |

### 3. 子模块集成

#### 3.1 timestamp_align_determination 子模块

**功能**: 时戳对齐判定

**连接关系**:
- 触发: start_timestamp_align (IDLE→DURING_TIMESTAMP_ALIGN_DETERMING状态转换边沿脉冲)
- 输入: pipe_normal_bitmap, pipe_restart_bitmap, data_vld[3:0], data_[0-3], local_timestamp, reg_sync_aggr_video_timeout_threshold
- 输出: timestamp_align_pass, timestamp_align_fail, timestamp_align_pass_bitmap

#### 3.2 video_status_determination 子模块

**功能**: 视频状态判定

**连接关系**:
- 触发: start_video_status_determing (DURING_TIMESTAMP_ALIGN_DETERMING→DURING_VIDEO_STATUS_DETERMING状态转换边沿)
- 输入: timestamp_align_pass_bitmap, data_vld[3:0], data_[0-3], local_auto_mask_en
- 输出: video_status_pass_bitmap, video_status_fail_bitmap

**特殊功能**:
- 当local_auto_mask_en[i]=0且检测到超时时，强制video_status_fail_bitmap=4'b1111（全局暂停）

### 4. 状态机设计

#### 4.1 状态转换图

```mermaid
%% pipe_mask_ctrl machine status
stateDiagram-v2
    
    %% 初始状态入口
    [*] --> INIT: 解复位

    %% 状态流转定义
    
    %% 0. 初始化与IDLE
    INIT --> IDLE : aggre_mode=1 &<br/>frame_sync_lock
    IDLE --> INIT :  video_mask_latch_reset

    %% 1. 时间戳对齐以及数据正确判定
    IDLE --> DURING_TIMESTAMP_ALIGN_DETERMING : start_timestamp_align
    DURING_TIMESTAMP_ALIGN_DETERMING --> IDLE : delay_cnt=3 &<br/>timestamp_align_fail
    DURING_TIMESTAMP_ALIGN_DETERMING --> DURING_VIDEO_STATUS_DETERMING : delay_cnt=3 &<br/>timestamp_align_pass

    %% 2. 视频恢复
    DURING_VIDEO_STATUS_DETERMING --> MASK_BITMAP_SUB_RECOVER : (delay_cnt == 3) /<br/>pipe_restart_bitmap &<br>video_status_pass_bitmap

    %% 3. 视频屏蔽
    MASK_BITMAP_SUB_RECOVER --> MASK_BITMAP_ADD_TIME_OUT : pipe_normal_bitmap &<br/>video_status_fail_bitmap 
    
    %% 4. 清除缓存
    MASK_BITMAP_ADD_TIME_OUT --> CLEAR_MASK_PIPE : 无条件 /<br/> clear_mask_pipe_pulse 

    %% 5. 调度与重置
    CLEAR_MASK_PIPE --> DURING_SCHEDULING_PIPE : |video_status_pass_bitmap /<br/>start_sch_pulse
    DURING_SCHEDULING_PIPE --> IDLE : end_sch_pulse
    CLEAR_MASK_PIPE --> INIT : &pipe_mask_bitmap/

```

#### 4.2 状态详细描述

**INIT - 初始化状态**
- next触发：无
- curt跳转：等待frame_sync_lock和aggre_mode=2'b01信号，跳转至IDLE

**IDLE - 空闲状态**
- next触发：从INIT跳转，则重置pipe_mask_bitmap到初始状态（`pipe_concat_en & local_force_video_mask`，使用INIT状态锁存的配置）
- curt跳转：
  - 手动触发video_mask_latch_reset跳转至INIT
  - 条件触发(|(pipe_normal_bitmap|pipe_restart_bitmap & data_vld))跳转至DURING_TIMESTAMP_ALIGN_DETERMING

**DURING_TIMESTAMP_ALIGN_DETERMING - 判断视频包对齐**
- next触发：
  - 进行视频包对齐检测，仅检测当前 pipe_normal_bitmap 置高的pipe，计算过程需要3拍
  - 进入该状态时 delay_cnt 置为1，然后递增：1→2→3
- curt跳转：
  - delay_cnt=3（第3拍）时结束该状态，对齐成功 timestamp_align_pass 则携带 timestamp_align_pass_bitmap ，跳转至DURING_VIDEO_STATUS_DETERMING
  - delay_cnt=3（第3拍）时结束该状态，对齐失败timestamp_align_fail则跳转至IDLE

**DURING_VIDEO_STATUS_DETERMING - 判断视频包正确**
- next触发：
  - 进行视频状态判定，仅判定 timestamp_align_pass_bitmap 至高的pipe, 计算过程需要3拍
  - 进入该状态时 delay_cnt 置为1，然后递增：1→2→3
- curt跳转：delay_cnt=3（第3拍）时结束该状态，跳转至 MASK_BITMAP_SUB_RECOVER

**MASK_BITMAP_SUB_RECOVER - 根据视频restart状态对mask清0**
- next触发：按 `pipe_mask_bitmap <= pipe_mask_bitmap & (~(pipe_restart_bitmap & video_status_pass_bitmap))` 逻辑，将通过对齐的pipe从mask中移除
- curt跳转：下拍跳转至 MASK_BITMAP_ADD_TIME_OUT

**MASK_BITMAP_ADD_TIME_OUT - 根据视频normal状态对mask置1**
- next触发：
  - 按 `pipe_mask_bitmap <= pipe_mask_bitmap | (pipe_normal_bitmap & video_status_fail_bitmap)` 逻辑，将检测失败的pipe加入mask
  - 特殊情况：当`local_auto_mask_en==4'b0000`时，任何fail触发全局屏蔽(`video_status_fail_bitmap=4'b1111`)
- curt跳转：下拍跳转至 CLEAR_MASK_PIPE

**CLEAR_MASK_PIPE - 对mask状态的pipe发起缓存清空脉冲**
- next触发：触发 pipe_clear_pulse 脉冲，清空相应video_pipe缓存
- curt跳转：
  - 条件 |video_status_pass_bitmap 判断成功，跳转至DURING_SCHEDULING_PIPE
  - 条件 &pipe_mask_bitmap 判断成功，跳转至INIT

**DURING_SCHEDULING_PIPE - pipe_mask_bitmap清0状态**
- next触发：触发start_sch_pulse脉冲
- curt跳转：收到 end_sch_pulse脉冲，跳转至IDLE

---

## 子模块详细设计

### 子模块1: timestamp_align_determination - 时戳对齐判定

#### 1. 输入输出接口

| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `clk` | I | 1 | 入口时钟 |
| `rst_n` | I | 1 | 异步复位，低有效 |
| `reg_sync_aggr_video_timeout_threshold` | I | 20 | 同步汇聚视频包等待超时阈值 |
| `pipe_normal_bitmap` | I | 4 | 指示哪些normal pipe需要检测时戳对齐-来自pipe_mask_bitmap |
| `pipe_restart_bitmap` | I | 4 | 指示哪些restart pipe需要检测时戳对齐-来自pipe_frame_active |
| `data_vld_0` | I | 1 | fwft_fifo_0出口数据有效位 |
| `data_vld_1` | I | 1 | fwft_fifo_1出口数据有效位 |
| `data_vld_2` | I | 1 | fwft_fifo_2出口数据有效位 |
| `data_vld_3` | I | 1 | fwft_fifo_3出口数据有效位 |
| `data_0` | I | 102 | fwft_fifo_0出口数据 |
| `data_1` | I | 102 | fwft_fifo_1出口数据 |
| `data_2` | I | 102 | fwft_fifo_2出口数据 |
| `data_3` | I | 102 | fwft_fifo_3出口数据 |
| `local_timestamp` | I | 80 | 当前本地us计数器值 |
| `start_timestamp_align` | I | 1 | 开始进行时戳对齐判定 |
| `timestamp_align_pass` | O | 1 | 时戳对齐成功 |
| `timestamp_align_fail` | O | 1 | 时戳对齐失败 |
| `timestamp_align_pass_bitmap` | O | 4 |  表示时戳对齐成功时，对应的pipe位 |

#### 2. 功能原理

本模块通过比较4个fwft_fifo的空满状态和本地时戳,判断当前需要检测的pipe（pipe_normal_bitmap | pipe_restart_bitmap）中哪些可以不再等待。

##### 2.1 数据格式定义

FWFT_FIFO data[101:0] 位域定义：

| 位域 | 描述 |
| :--- | :--- |
| `[79:0]` | pkt_timestamp[79:0]: 接收到包结束时，us计数器的值（video_pipe模块中维护） |
| `[95:80]` | pkt_id[15:0]: 接收到包的id，表示帧号或行号 |
| `[101:96]` | pkt_datatype[5:0]: 接收到的包类型，含FS/FE/LONG_PACKET/LS/LE |

##### 2.2 核心逻辑

1. **所有数据已就位：** 如果检测位图（`pipe_normal_bitmap | pipe_restart_bitmap`）对应的所有FIFO都非空（`((pipe_normal_bitmap | pipe_restart_bitmap) & data_vld) == (pipe_normal_bitmap | pipe_restart_bitmap)`），直接判定对齐成功，交给后续逻辑判断包是否正确
2. **部分数据未就位：** 如果有FIFO为空（`data_vld`为0），则：
   - 从非空FIFO中找出最老的包时间戳（the_oldest_pkt_timestamp）
   - 计算：time_offset = local_timestamp - the_oldest_pkt_timestamp
   - 若 time_offset >= 阈值：说明未就位的pipe已经晚了很长时间，不再等待，输出align_pass
   - 若 time_offset < 阈值：可以继续等待，输出align_fail，状态机返回IDLE重新触发

##### 2.3 触发机制

- 顶层状态机在IDLE时，只要`(pipe_normal_bitmap | pipe_restart_bitmap) & data_vld`有任意位为1，就会触发`start_timestamp_align`（脉冲信号）
- 同时检测正常工作的pipe（pipe_normal_bitmap）和尝试恢复的pipe（pipe_restart_bitmap）

##### 2.4 FIFO状态判断

- 采用FWFT（First Word Fall Through）FIFO，通过`data_vld`信号判断FIFO是否有有效数据
- `data_vld[i] = 1`表示FIFO_i有有效数据（非空）
- `data_vld[i] = 0`表示FIFO_i无有效数据（空）

##### 2.5 时间戳特性

- 80bit us计数器不会溢出回绕，足够运行多年
- 所有信号在统一时钟域下工作，无需跨时钟域处理

#### 3. 流程图

##### 3.1 流水线实现

本模块采用3拍流水线处理（从`start_timestamp_align`脉冲触发开始计数，3拍后输出结果）：

**第1拍：采样与第一级比较**
- 采样输入信号，合并检测位图：`check_bitmap = pipe_normal_bitmap | pipe_restart_bitmap`
- 检查`(check_bitmap & data_vld) == check_bitmap`是否成立（所有需要检测的pipe数据都就位）
- 从有效FIFO（`check_bitmap & data_vld`对应位为1）中提取时间戳字段：`data[79:0]`
- 进行第一级时间戳比较：`pkt_timestamp0 vs pkt_timestamp1`得到`result0`，`pkt_timestamp2 vs pkt_timestamp3`得到`result1`

**第2拍：第二级比较**
- 完成第二级时间戳比较：`result0 vs result1`，找出最老的时间戳（the_oldest_pkt_timestamp）

**第3拍：超时判定与输出**
- 计算：`time_offset = local_timestamp - the_oldest_pkt_timestamp`
- 判断输出结果：
  - 若`(check_bitmap & data_vld) == check_bitmap`：所有数据已就位，输出`timestamp_align_pass = 1, timestamp_align_pass_bitmap = check_bitmap`
  - 若部分数据未就位且`time_offset >= threshold`：等待超时，输出`timestamp_align_pass = 1, timestamp_align_pass_bitmap = check_bitmap & data_vld`
  - 若部分数据未就位且`time_offset < threshold`：继续等待，输出`timestamp_align_fail = 1, timestamp_align_pass_bitmap = 4'b0000`

##### 3.2 Mermaid流程图

```mermaid
flowchart TD
    Start([start_timestamp_align<br/>脉冲触发]) --> Pipe1["第1拍：采样与第一级比较<br/>check_bitmap = pipe_normal_bitmap | pipe_restart_bitmap<br/>检查(check_bitmap & data_vld) == check_bitmap<br/>提取时间戳并比较:<br/>result0 = min(pkt_timestamp0, pkt_timestamp1)<br/>result1 = min(pkt_timestamp2, pkt_timestamp3)"]
    
    Pipe1 --> Pipe2["第2拍：第二级比较<br/>the_oldest_pkt_timestamp = min(result0, result1)"]
    
    Pipe2 --> Pipe3["第3拍：超时判定与输出<br/>计算time_offset = local_timestamp - the_oldest_pkt_timestamp<br/>判断条件并输出结果"]
    
    Pipe3 --> Judge{判断条件}
    
    Judge -->|所有数据已就位| AllSuccess[timestamp_align_pass = 1<br/>timestamp_align_pass_bitmap = check_bitmap<br/>timestamp_align_fail = 0]
    
    Judge -->|部分未就位<br/>且超时| Success[timestamp_align_pass = 1<br/>timestamp_align_pass_bitmap = check_bitmap & data_vld<br/>timestamp_align_fail = 0]
    
    Judge -->|部分未就位<br/>且未超时| Fail[timestamp_align_fail = 1<br/>timestamp_align_pass_bitmap = 4'b0000<br/>timestamp_align_pass = 0]
    
    AllSuccess --> End([3拍后输出结果])
    Success --> End
    Fail --> End
    
    style Start fill:#cce5ff
    style Pipe1 fill:#e1f5ff
    style Pipe2 fill:#e1f5ff
    style Pipe3 fill:#e1f5ff
    style Judge fill:#fff3cd
    style AllSuccess fill:#d4edda
    style Success fill:#d4edda
    style Fail fill:#f8d7da
```

#### 4. 硬件资源与实现细节

##### 4.1 触发机制
- `start_timestamp_align`为脉冲信号，从IDLE状态触发时需满足`|((pipe_normal_bitmap | pipe_restart_bitmap) & data_vld)`
- 检测位图内部合并：`check_bitmap = pipe_normal_bitmap | pipe_restart_bitmap`，同时检测正常和重启pipe

##### 4.2 流水线结构
- 固定3拍流水线，无预检查快速通路，统一在第3拍输出结果

##### 4.3 运算资源
- **比较器**: 使用3个80bit比较器进行流水线比较（找出最老的包时间戳）
- **减法器**: 1个80bit减法器计算 time_offset = local_timestamp - the_oldest_pkt_timestamp
- **阈值比较**: 1个80bit比较器判断是否超过阈值，阈值扩展到80bit：`time_offset >= {60'b0, reg_sync_aggr_video_timeout_threshold}`

##### 4.4 输出规则
- 所有数据就位时：`timestamp_align_pass_bitmap = check_bitmap`（包含normal和restart pipe）
- 部分数据超时时：`timestamp_align_pass_bitmap = check_bitmap & data_vld`
- 继续等待时：`timestamp_align_pass_bitmap = 4'b0000`

##### 4.5 复位行为
异步复位`rst_n`时：
- `timestamp_align_pass = 1'b0`
- `timestamp_align_fail = 1'b1`（默认失败状态，等待触发）
- `timestamp_align_pass_bitmap = 4'b0000`

##### 4.6 时钟域与时间戳
- 所有信号在统一时钟域下工作，无CDC问题
- 时间戳提取：直接使用`data[79:0]`作为时间戳，无需额外字段校验



