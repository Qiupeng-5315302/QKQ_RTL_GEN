# 视频汇聚与自动黑像素填充：设计方案

本文档提供了一个数字电路设计方案，用于实现一个4通道视频汇聚器。当任何一路视频流丢失时，该模块能自动用黑像素数据填充(按照Wx4h模式)该通道，同时不影响其他正常视频流的传输。

---

## 配置列表

1. frame_sync_lock信号拉起后，开始对齐检测，正常输出图像；
2. 若用户置高 auto_mask_en[3:0]，对应的pipe[3:0] 检测到超时未进入数据，则对pipe[3:0]补黑像素；
3. 若用户置高 video_mask_restart[3:0],则撤离 pipe[3:0] 填充黑像素；
4. ⚠️ 若用户拉低 auto_mask_en[3:0]，检测到pipe[3:0] 超时未进入数据，则**暂停所有数据输出**，本地所有pipe_mask_bitmap 置1，停止发起同步汇聚；
5. 若用户触发 video_mask_latch_reset,则将汇聚器中的pipe_mask_bitmap 清至初始态；
6. 若用户置高 force_video_mask,则强制pipe[3:0]补黑像素；
7. 若用户拉低 force_video_mask,则撤离pipe[3:0]补黑像素；

## 功能说明

1. force_video_mask 配置不支持带流更改，仅支持在frame_sync_lock信号为低 或者 video_mask_latch_reset触发时，本地pipe_mask_bitmap更新至 force_video_mask；
2. 对于 force_video_mask 为低的pipe,识别 auto_mask_en ，具体功能按照 **配置列表 2-4** 描述；
3. 对于 **配置列表 4** ，当停止起同步汇聚后，会上报video_sync_aggr_halt标志。用户识别后更改force_video_mask或auto_mask_en配置，再触发video_mask_latch_reset，重启同步汇聚；

## 模块说明

设计采用分层和模块化的架构，主要由四个核心部分组成：

1.  **四个并行的“视频管道” (Video Pipe)**：每个管道独立处理一路输入视频，包含视频丢失检测模块，入口数据可关断。
2.  **每个汇聚器含一个“同步汇聚模块” (schedule_concat)**：位于在汇聚器中，作为同步汇聚功能的顶层模块，下辖三个模块。
3.  **每个schedule_concat含一个“视频状态管理” (video_status_management)**：作为管理单元,响应mask配置变更和入口数据检测，管理视频状态，切换黑像素的填充和撤离。
4.  **每个schedule_concat含一个“同步汇聚调度器” (schedule_concat_line_interleaved)**：作为执行单元，按配置顺序调度pipe，同时区分mask pipe和normal pipe。
5.  **每个schedule_concat含一个“黑像素生成器” (black_pixel_generator)**：作为操作单元，提供填充用的黑像素数据。
6.  **四个“视频管道像素写入控制” (pipe_wr_mode_ctrl)**：位于video_pipe模块之前，作为视频管道的写入控制单元，负责管理视频数据的写入开关。

**模块层级结构**

as6d_app_pipe_sch_concat (TOP)
├── as6d_app_video_status_management
│   ├── video_status_buffer_wr_ctrl (x4 instances)
│   ├── as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper (x4 instances)
│   └── pipe_mask_ctrl
│       ├── timestamp_align_determination
│       └── video_status_determination
├── as6d_app_pipe_sch_concat_line_interleaved
│   └── multi_value_comparator
└── black_pixel_generator

## 原理图
![系统架构图](.\sync_aggr.svg)

## 1. 工作流程

- 同步汇聚Wx4h模式正常输出图像依赖于配置的**所有pipe按时就位**，此时不启动黑像素填充；
- 当检测到有pipe数据就位，但**空pipe等待超时**或**数据就位但不正确**，此时会进行黑像素填充；
- pipe_mask_bitmap作为黑像素填充的pipe标志位，在一个模块中维护，控制**pipe入口关断**和**黑像素填充**；

### 1.1 超时处理的两种模式

系统根据 `auto_mask_en` 配置，对超时事件采取不同的处理策略：

| 模式 | auto_mask_en | 超时后的行为 | 影响范围 | 典型应用场景 |
|:-----|:------------:|:------------|:---------|:------------|
| **自动补黑模式** | 1 | 对超时pipe补黑像素 | 仅该pipe | 允许部分通道故障时继续工作 |
| **全局暂停模式** | 0 | 暂停所有输出 | 所有pipe | 关键任务，不允许任何数据丢失 |

⚠️ **重要提示**：`auto_mask_en=0` 时，任意一个pipe超时都会导致整个系统冻结！

### 1.2 pipe_mask_bitmap 状态转换

1.  **本地pipe_mask_bitmap[3:0]重置**：
芯片上电后，frame_sync_lock自动或非自动置1后，本地 pipe_mask_bitmap 重置；
手动触发video_mask_latch_reset，本地 pipe_mask_bitmap 重置；

2.  **pipe_mask_bitmap[3:0]置1**：
用户触发Force_Video_Mask置1，对应pipe_mask_bitmap[3:0]置1；
数据触发空pipe等待超时或数据就位但不正确时：
   - 若 `auto_mask_en[i]=1`：仅对应 pipe_mask_bitmap[i] 置1
   - 若 `auto_mask_en[i]=0`：**强制所有 pipe_mask_bitmap[3:0] 置1**

3.  **pipe_mask_bitmap[3:0]清0**：
用户触发 video_mask_restart 置1，且video_loss为1，则对应 pipe_mask_bitmap[3:0]每隔1s执行一次清0；

4.  **pipe 清空**：
pipe清空由pipe_mask_bitmap对应位置1触发；执行video_pipe FIFO清空操作；执行video_pipe 入口关断操作；

5.  **黑像素填充**：
黑像素填充由pipe_mask_bitmap对应位置1触发；

---

## 2. 组件详细设计

### 2.1 视频状态管理 (video_status_management)

- **功能**：作为管理单元,响应mask配置变更和入口数据检测，管理视频状态，切换黑像素的填充和撤离。

#### 输入与输出-video_status_management

| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `fifo_wr_clk_(0-3)` | I | 1 | 四路视频数据写时钟 |
| `fifo_wr_clk_rst_n_(0-3)` | I | 1 | 四路视频数据写复位 |
| `idi_header_en_(0-3)` | I | 1 | 四路视频数据IDI部分接口 |
| `idi_datatype_(0-3)`| I | 6 | 四路视频数据IDI部分接口 |
| `idi_wordcount_(0-3)`| I | 16 | 四路视频数据IDI部分接口 |
| `idi_linecount_(0-3)`| I |  3 | 四路视频数据IDI部分接口 |
| `aggr_clk` | I | 1 | 汇聚器时钟 |
| `aggr_clk_rst_n` | I | 1 | 汇聚器复位 |
| `clk_1M` | I | 1 | us计数器时钟 |
| `start_sch_pulse`| O | 1 | 送出开始调度脉冲到schedule_concat模块 |
| `start_sch_pipe_mask_bitmap`| O | 4 | 对齐start_sch_pulse信号，表示mask pipe的序号 |
| `end_sch_pulse`| I | 1 | 接收结束调度脉冲从schedule_concat模块 |
| `pipe_wr_mode_ctrl`| O | 8 | 清空pipe的序号 |

#### 模块说明-video_status_management

该模块的核心是识别**空pipe等待超时**或**数据就位但不正确**。

- 四个afifo写侧各自video_pipe的pkt_datatype/pkt_id(帧号或行号)/pkt_timestamp(包结尾处打上us_cnt的值)
- 四个afifo读测由 pipe_mask_ctrl 模块控制
- pipe_mask_ctrl 模块维护本地pipe_mask_bitmap

#### 原理图-video_status_management

![系统架构图](.\video_status_management.svg)

#### 工作流程-video_status_management

- 当一个pipe数据就位后，同步汇聚判决启动，每一次判决成功都会取出对应fwft_afifo数据
- 其中**空pipe等待超时**由pkt_timestamp字段和本地us_cnt值判断
- 其中**数据就位但不正确**由pkt_datatype字段/pkt_id字段 与 本地存放的local值比较得出
- pkt_datatype 字段说明加串器 MIPI RX 的包类型
- pkt_id 字段说明FS/FE携带的帧号，LONG_PKT携带的行号，由于加串器 MIPI RX的协议 LONG_PKT无行号字段，按照以下方案实现：
  - [ ] 检查LONG_PKT行号16bit，行号由MIPI TX生成，要求加串器传输LS/LE，行号由解串器接收LS-LE后开窗生成；
  - [x] 检查LONG_PKT行号3bit，不要求加串器传输LS/LE，行号由加串器生成，将3bit自增（循环计数）行号打到像素包中（即每行递增，溢出后回到0）；
  - [ ] 不检查LONG_PKT行号，仅检查FS/FE帧号；

#### 2.1.1 管道屏蔽管理-pipe_mask_ctrl

##### 模块说明-pipe_mask_ctrl

- pipe_mask_ctrl FSM 维护本地 pipe_mask_bitmap
- pipe_normal_bitmap 由 pipe_mask_bitmap组合逻辑生成，表示待检查fifo序号
- timstamp_align_determination和video_status_determing分别判断**空pipe等待超时**或**就位数据是否正确**
- **关键逻辑**：当 `auto_mask_en[i]=0` 且检测到超时时，强制 `pipe_mask_bitmap[3:0]=1111` 并停止发起 `start_sch_pulse`

##### 原理图-pipe_mask_ctrl

![管道屏蔽管理](.\pipe_mask_ctrl.svg)

##### 工作流程-pipe_mask_ctrl

- local_pkt_datatype 控制汇聚器按固定pkt序列输出图像
  - [x] FS->LONG_PKT->FE
  - [ ] FS-> LS -> LONG_PKT -> LE ->FE
- local_short_pkt_id 记录本地帧号，复位后无效，锁存收到的第一帧帧号
- local_long_pkt_id 记录本地行号，调度FE后，重置到0(启用时要求加串器传输LS/LE，或者加串器将3bit行号打到像素包中)

### 2.2 同步汇聚调度器 (schedule_concat)

- **功能**：作为**执行单元**，按照 `video_status_management` 的指令和来自Video Pipe的**反馈**，执行Wx4H模式的行交错汇聚。

#### 输入与输出-schedule_concat

| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `aggr_clk` | I | 1 | 汇聚器时钟 |
| `aggr_clk_rst_n` | I | 1 | 汇聚器复位 |
| `start_sch_pulse`| I | 1 | 从video_status_management接收开始调度脉冲 |
| `start_sch_pipe_mask_bitmap`| I | 4 | 对齐start_sch_pulse信号，表示mask pipe的序号 |
| `end_sch_pulse`| O | 1 | 发送结束调度脉冲到video_status_management模块 |

#### 原理-schedule_concat

本模块负责实际的视频数据输出调度，调度启动完全由 `start_sch_pulse` 握手信号控制。当 `auto_mask_en[i]=0` 且超时时，`pipe_mask_ctrl` 停止发起 `start_sch_pulse`，本模块因缺少启动信号自然保持空闲状态，无需额外控制信号。

#### 原理图-schedule_concat

![同步汇聚状态机](.\sch_concat.svg)

#### 工作流程-schedule_concat (待补充)

### 2.3 视频管道像素写入控制 (pipe_wr_mode_ctrl)

- **功能**：控制video_pipe的像素写入状态

#### 输入与输出-pipe_wr_mode_ctrl

| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `pipe_wr_mode` | I | 2 | 像素写入控制 |
| `frame_active` | O | 1 | 像素写入状态 |

### 2.4 黑像素生成器 (Black Pixel Generator - BPG)

- **功能**：提供统一的黑像素数据源。

#### 输入与输出-BPG

| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `reg_BPG_datatype` | I | 6 | 用于软件配置的寄存器接口 |
| `reg_BPG_wordcount` | I | 16 | 用于软件配置的寄存器接口 |
| `reg_BPG_vc` | I | 3 | 用于软件配置的寄存器接口 |
| `black_pixel_data_vld`| O | 1 | 黑像素数据有效态 |
| `black_pixel_data`| O | 140 | 黑像素数据输出 |
| `empty`| O | 1 | 申请输出行像素 |
| `up_state`| I | 1 | 允许输出行像素 |
| `ack`| O | 1 | BPG模块确认 |
| `line_end`| O | 1 | BPG模块输出行结束 |

#### 原理-BPG

- [x] 该模块内部包含`reg_BPG_*`配置寄存器。该系列寄存器控制填充包的类型和字节长度（对应IDI接口）。
- [ ] 由最老时戳包的 datatype 和 wordcount

##### 数据格式定义

black_pixel_data[139:0] 数据分片格式定义如下：

| 位域 | 说明 |
| :-: | :--- |
| `[127:0]` | header_flag=0,data_flag为1时:<br>[127:0]表示黑像素数据:全0或全1<br>header_flag=1,data_flag为0时:<br>[4:0]表示mipi virtual channel;<br>[10:5]表示mipi data type;<br>[26:11]表示mipi word count;<br>[127:27]保留; |
| `[131:128]` | byte_en[3:0]:黑像素数据字节使能，data_flag=1启用 |
| `[132]` | header_flag:包头标识  |
| `[133]` | footer_flag:包尾标识  |
| `[134]` | short_flag:短包标识  |
| `[135]` | data_flag:长包数据标识  |
| `[138:136]` | aggre_id[2:0]:异步汇聚2模式使用，其余模式不关注  |
| `[139]` | tunnel_mode_en:隧道模式使能，暂不关注  |

示例1：
填充一个IDI短包分片,vc=5'd1,datatype=0x1，wordcount=128(像素长度)
| 位域 | 说明 |值 |
| :-: | :--- | :-: |
| `[4:0]` | virtual channel:mipi协议定义 | 5'd1 |
| `[10:5]` | data type:mipi协议定义 | 6'd1 |
| `[26:11]` | word count:mipi协议定义 | 16'd128 |
| `[127:27` | 保留 |  |
| `[131:128]` | byte_en[3:0]:黑像素数据字节使能，data_flag=1启用 | 4'd0 |
| `[132]` | header_flag:包头标识  | 1'd1 |
| `[133]` | footer_flag:包尾标识  | 1'd0 |
| `[134]` | short_flag:短包标识  | 1'd1 |
| `[135]` | data_flag:长包数据标识  | 1'd0 |
| `[138:136]` | aggre_id[2:0]:异步汇聚2模式使用，其余模式不关注  | 3'd0 |
| `[139]` | tunnel_mode_en:隧道模式使能，暂不关注  | 1'd0 |

示例2：
填充一个IDI长包包头分片,vc=5'd1,datatype=0x2a，wordcount=256(行号256)
| 位域 | 说明 |值 |
| :-: | :--- | :-: |
| `[4:0]` | virtual channel:mipi协议定义 | 5'd1 |
| `[10:5]` | data type:mipi协议定义 | 6'd2a |
| `[26:11]` | word count:mipi协议定义 | 16'd256 |
| `[127:27` | 保留 |  |
| `[131:128]` | byte_en[3:0]:黑像素数据字节使能，data_flag=1启用 | 4'd0 |
| `[132]` | header_flag:包头标识  | 1'd1 |
| `[133]` | footer_flag:包尾标识  | 1'd0 |
| `[134]` | short_flag:短包标识  | 1'd0 |
| `[135]` | data_flag:长包数据标识  | 1'd0 |
| `[138:136]` | aggre_id[2:0]:异步汇聚2模式使用，其余模式不关注  | 3'd0 |
| `[139]` | tunnel_mode_en:隧道模式使能，暂不关注  | 1'd0 |

填充一个IDI长包像素分片，datatype=0x2a，wordcount=256(行号256)
| 位域 | 说明 |值 |
| :-: | :--- | :-: |
| `[127:0]` | 黑像素数据:全0 | 128'h0 |
| `[131:128]` | byte_en[3:0]:黑像素数据字节使能 | 4'd15 |
| `[132]` | header_flag:包头标识  | 1'd1 |
| `[133]` | footer_flag:包尾标识  | 1'd0 |
| `[134]` | short_flag:短包标识  | 1'd0 |
| `[135]` | data_flag:长包数据标识  | 1'd1 |
| `[138:136]` | aggre_id[2:0]:异步汇聚2模式使用，其余模式不关注  | 3'd0 |
| `[139]` | tunnel_mode_en:隧道模式使能，暂不关注  | 1'd0 |

填充一个IDI长包包尾分片，vc=5'd1,datatype=0x2a，wordcount=256(行号256)，最后分片有2个字节数据
| 位域 | 说明 |值 |
| :-: | :--- | :-: |
| `[127:0]` | 黑像素数据:全0 | 128'h0 |
| `[131:128]` | byte_en[3:0]:黑像素数据字节使能 | 4'd1 |
| `[132]` | header_flag:包头标识  | 1'd0 |
| `[133]` | footer_flag:包尾标识  | 1'd1 |
| `[134]` | short_flag:短包标识  | 1'd0 |
| `[135]` | data_flag:长包数据标识  | 1'd1 |
| `[138:136]` | aggre_id[2:0]:异步汇聚2模式使用，其余模式不关注  | 3'd0 |
| `[139]` | tunnel_mode_en:隧道模式使能，暂不关注  | 1'd0 |
---
