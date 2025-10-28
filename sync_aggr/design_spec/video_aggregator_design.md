# 视频汇聚与自动黑像素填充：设计方案

本文档提供了一个数字电路设计方案，用于实现一个4通道视频汇聚器。当任何一路视频流丢失时，该模块能自动用黑像素数据填充该通道，同时不影响其他正常视频流的传输。

---

## 功能列表

1. frame_sync_lock信号拉起后，开始正常输出图像，以及对齐检测；
2. 若用户置高 auto_mask_en[3:0]，对应的pipe[3:0] 检测到超时未进入数据，则对pipe[3:0]补黑像素；
3. 若用户触发 video_mask_restart[3:0],则撤离 pipe[3:0] 补黑像素；
4. 若用户拉低 auto_mask_en[3:0]，检测到pipe[3:0] 超时未进入数据，则暂停所有数据输出，本地所有pipe_mask_bitmap置1；
5. 若用户触发 video_mask_latch_reset,则将汇聚器中的pipe_mask_bitmap清至初始态；
6. 若用户置高 force_video_mask,则强制pipe[3:0]补黑像素；
7. 若用户拉低 force_video_mask,则撤离pipe[3:0]补黑像素；

## 模块说明

设计采用分层和模块化的架构，主要由四个核心部分组成：

1.  **四个并行的“视频管道” (Video Pipe)**：每个管道独立处理一路输入视频，包含视频丢失检测模块，入口数据可关断。
2.  **每个汇聚器含一个“视频状态管理” (video_status_management)**：作为管理单元,响应mask配置变更和入口数据检测，管理视频状态，切换黑像素的填充和撤离。
3.  **每个汇聚器含一个“同步汇聚调度器” (schedule_concat)**：作为执行单元，按配置顺序调度pipe，同时区分mask pipe和normal pipe。
4.  **每个汇聚器含一个“黑像素生成器” (black_pixel_generator)**：作为操作单元，提供填充用的黑像素数据。
5.  **四个“视频管道像素写入控制” (pipe_wr_mode_ctrl)**：作为中央时序仲裁器，从多路输入中生成统一的帧同步信号。

## 原理图
![系统架构图](.\sync_aggr.svg)

## 1. 工作流程
- 同步汇聚Wx4h模式正常输出图像依赖于配置的**所有pipe按时就位**，此时不启动黑像素填充；
- 当检测到有pipe数据就位，但**空pipe等待超时**或**数据就位但不正确**，此时会进行黑像素填充；
- pipe_mask_bitmap作为黑像素填充的pipe标志位，在一个模块中维护，控制**pipe入口关断**和**黑像素填充**；

1.  **本地pipe_mask_bitmap[3:0]重置**：
芯片上电后，frame_sync_lock自动或非自动置1后，本地 pipe_mask_bitmap 重置；
手动触发video_mask_latch_reset，本地 pipe_mask_bitmap 重置；
2.  **pipe_mask_bitmap[3:0]置1**：
用户触发Force_Video_Mask置1，对应pipe_mask_bitmap[3:0]置1；
数据触发空pipe等待超时或数据就位但不正确，对应pipe_mask_bitmap[3:0]置1；
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
| `packet_header_en_(0-3)` | I | 1 | 四路视频数据IDI部分接口 |
| `packet_datatype_(0-3)`| I | 6 | 四路视频数据IDI部分接口 |
| `packet_wordcount_(0-3)`| I | 16 | 四路视频数据IDI部分接口 |
| `aggr_clk` | I | 1 | 汇聚器时钟 |
| `aggr_clk_rst_n` | I | 1 | 汇聚器复位 |
| `clk_1M` | I | 1 | us计数器时钟 |
| `start_sch_pulse`| O | 1 | 送出开始调度脉冲到schedule_concat模块 |
| `start_sch_pipe_mask_bitmap`| O | 4 | 对齐start_sch_pulse信号，表示mask pipe的序号 |
| `end_sch_pulse`| I | 1 | 接收结束调度脉冲从schedule_concat模块 |
| `pipe_wr_mode_ctrl`| O | 4 | 清空pipe的序号 |

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
  - [ ] 检查LONG_PKT行号16bit，要求加串器传输LS/LE，行号由解串器接收LS-LE后开窗生成；
  - [ ] 检查LONG_PKT行号3bit，不要求加串器传输LS/LE，行号由加串器将LS/LE行号打到像素包中(3bit)；
  - [ ] 不检查LONG_PKT行号，仅检查FS/FE帧号；

#### 2.1.1 管道屏蔽管理-pipe_mask_ctrl

##### 模块说明-pipe_mask_ctrl

- pipe_mask_ctrl FSM 维护本地 pipe_mask_bitmap
- pipe_normal_bitmap 由 pipe_mask_bitmap组合逻辑生成，表示待检查fifo序号
- timstamp_align_determination和video_status_determing分别判断**空pipe等待超时**或**就位数据是否正确**

##### 原理图-pipe_mask_ctrl

![管道屏蔽管理](.\pipe_mask_ctrl.svg)

##### 工作流程-pipe_mask_ctrl

- local_pkt_datatype 控制汇聚器按固定pkt序列输出图像FS->LONG_PKT->FE
- local_short_pkt_id 记录本地帧号，复位后无效，锁存收到的第一帧帧号
- local_long_pkt_id 记录本地行号，调度FE后，重置到0(启用时要求加串器传输LS/LE，或者加串器将LS/LE行号打到像素包中)

### 2.2 同步汇聚调度器 (schedule_concat)

- **功能**：作为**执行单元**，按照 `video_status_management` 的指令和来自Video Pipe的**反馈**，执行Wx4H模式的行交错汇聚。

#### 输入与输出-schedule_concat

| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `aggr_clk` | I | 1 | 汇聚器时钟 |
| `aggr_clk_rst_n` | I | 1 | 汇聚器复位 |
| `start_sch_pulse`| I | 1 | 送出开始调度脉冲到schedule_concat模块 |
| `start_sch_pipe_mask_bitmap`| I | 4 | 对齐start_sch_pulse信号，表示mask pipe的序号 |
| `end_sch_pulse`| O | 1 | 接收结束调度脉冲从schedule_concat模块 |

#### 原理-schedule_concat

#### 原理图-schedule_concat

![同步汇聚状态机](.\sch_concat.svg)

#### 工作流程-schedule_concat

### 2.3 视频失锁检测器 (Video Loss Detector - VLD)

- **功能**：解码IDI短包和长包头，监控视频有效性，实现“视频丢失”判断。

#### 输入与输出-VLD

#### 原理-VLD

#### 状态机-VLD

### 2.4 视频管道像素写入控制（pipe_wr_mode_ctrl）

- **功能**：控制video_pipe的像素写入状态

#### 输入与输出-pipe_wr_mode_ctrl

| 端口名     | I/O | 位宽 | 描述                            |
|:-----------|:---:|:-----|:--------------------------------|
| pipe_wr_mode   |  I  | 2    | 像素写入控制<br> 11:全写入<br> 10:于FS-FE之间开窗写入<br> 0x:全禁止       |
| frame_active   |  O  | 1    | 像素写入状态<br> 1:允许 <br> 0:禁止       |

### 2.4 黑像素生成器 (Black Pixel Generator - BPG)

- **功能**：提供统一的黑像素数据源。

#### 输入与输出-BPG

| 端口名 | I/O | 位宽 | 描述 |
| :--- | :-: | :--- | :--- |
| `reg_BPG_datatype` | I | 6 | 用于软件配置的寄存器接口 |
| `reg_BPG_wordcount` | I | 16 | 用于软件配置的寄存器接口 |
| `reg_BPG_vc` | I | 3 | 用于软件配置的寄存器接口 |
| `black_pixel_data`| O | 1 | 黑像素数据有效态 |
| `black_pixel_data`| O | 140 | 黑像素数据输出 |

#### 原理-BPG
该模块内部包含`reg_BPG_*`配置寄存器。该系列寄存器控制填充包的类型和字节长度（对应IDI接口）。

---
