# IDI (图像数据接口) 时序规范

本文档根据 DWC MIPI CSI-2 主机数据手册，详细描述了 IDI (图像数据接口) 的时序规范，用于 testbench 开发和验证。

## 1. 概述

图像数据接口 (IDI) 是 Synopsys 的专有并行总线，用于将 CSI-2 数据包信息传送到系统。它为每个 CSI-2 数据包字段（例如虚拟通道、数据类型、字数、ECC 和 CSI 数据）都提供了专用信号。

**关键特性**：

- 支持 64 位数据总线宽度
- 支持 CSI-2 短数据包和长数据包
- 提供独立的报头使能和数据使能信号
- 同步接口，所有信号在 `clk_data` 上升沿采样

## 2. 接口信号定义

数据包有效负载信息以 64 位像素内存组织形式提供。

### 2.1 信号列表

| 信号名 | 位宽 | 方向 | 有效电平 | 描述 |
|--------|------|------|----------|------|
| `clk_data` | 1 | Input | - | 接口时钟，所有信号在上升沿采样 |
| `header_en` | 1 | Output | High | 数据包报头有效指示，标识新数据包开始 |
| `data_en` | 1 | Output | High | 数据有效指示，表示 `csi_data` 上有效数据 |
| `virtual_channel` | 2 | Output | - | CSI-2 虚拟通道 ID (0~3) |
| `data_type[5:0]` | 6 | Output | - | CSI-2 数据类型 (参见 MIPI 规范) |
| `word_count[15:0]` | 16 | Output | - | 数据包的有效载荷字节数 (0~65535) |
| `ecc[7:0]` | 8 | Output | - | 数据包报头的 ECC 校验码 |
| `csi_data[63:0]` | 64 | Output | - | 数据有效负载 (64位总线) |

### 2.2 时序行为约定

**基本约定**：

- 所有信号在 `clk_data` 上升沿有效
- `header_en` 最小脉宽：1 个时钟周期（短数据包）
- 包间最小间隔：1 个时钟周期（`header_en` 为低）
- `data_en` 延迟：`header_en` 有效后 1~4 个时钟周期，取决于配置

## 3. 短数据包时序

### 3.1 时序描述

短数据包没有数据载荷，只传输报头信息。报头字段在 `header_en` 有效期间保持稳定。

**关键时序特征**：
- `header_en` 在时钟上升沿置为高电平，表示数据包开始
- 报头字段 (`virtual_channel`, `data_type`, `word_count`, `ecc`) 在 `header_en` 上升沿有效
- 对于短数据包，`word_count` 字段通常用于传输附加数据（如帧号、行号等）
- `header_en` 持续 1 个时钟周期后下降
- `data_en` 在短数据包传输期间始终为低电平
- 连续数据包之间至少间隔 1 个时钟周期（`header_en` 为低）

### 3.2 波形图

**场景**：连续传输两个短数据包

```wavedrom
时钟周期:   T0    T1    T2    T3    T4    T5    T6    T7
            |     |     |     |     |     |     |     |
               __/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__   clk_data
               ___/‾‾‾‾\_____/‾‾‾‾\______________________________   header_en
               _____________________________________________________   data_en
               ___<VC1 >_____<VC2 >____________________________   virtual_channel[1:0]
               ___<DT1 >_____<DT2 >____________________________   data_type[5:0]
               ___<WC1 >_____<WC2 >____________________________   word_count[15:0]
               ___<ECC1>_____<ECC2>____________________________   ecc[7:0]
               ___<XXXX>_____<XXXX>____________________________   csi_data[63:0] (无效)

说明：
- T0: 空闲状态，所有信号无效
- T1: header_en 上升沿，同时报头字段全部有效
      VC1=2'b00, DT1=6'h00 (帧起始), WC1=16'h0001, ECC1=8'hXX
- T2: 包间间隔，header_en 下降，报头字段失效
- T3: header_en 再次上升，第二个短数据包的报头字段同时有效
      VC2=2'b00, DT2=6'h01 (帧结束), WC2=16'h0002, ECC2=8'hXX
- T4+: 空闲状态
- 关键：data_en 在整个短数据包传输期间保持低电平
- 关键：报头字段在 header_en 上升沿同时有效，在下降沿同时失效
```

### 3.3 典型短数据包类型

| 数据类型 | data_type[5:0] | word_count 用途 | 说明 |
|----------|----------------|-----------------|------|
| 帧起始 (FS) | 0x00 | 帧号 | 标识新帧开始 |
| 帧结束 (FE) | 0x01 | 帧号 | 标识帧传输完成 |
| 行起始 (LS) | 0x02 | 行号 | 标识新行开始 |
| 行结束 (LE) | 0x03 | 行号 | 标识行传输完成 |
| 通用短包 0~7 | 0x08~0x0F | 自定义数据 | 用户自定义用途 |

## 4. 长数据包时序

### 4.1 时序描述

长数据包包含报头和有效载荷数据。报头字段在整个数据包传输期间保持稳定，有效载荷通过 `csi_data` 总线传输。

**关键时序特征**：
- `header_en` 在数据包开始时置为高电平，直到数据包传输完成
- 报头字段在 `header_en` 有效的第一个时钟周期有效
- `data_en` 延迟若干时钟周期后置为高电平，具体延迟取决于配置
- `csi_data` 在 `data_en` 有效期间传输数据载荷
- 数据按字节顺序排列：`csi_data[7:0]` = Byte0, `csi_data[15:8]` = Byte1, 依此类推
- `header_en` 和 `data_en` 同时下降，标识数据包传输完成

### 4.2 数据对齐规则

**64 位总线**：

- 每个时钟周期传输 8 个字节
- 字节序：`csi_data[7:0]`=Byte[N], `csi_data[15:8]`=Byte[N+1], ..., `csi_data[63:56]`=Byte[N+7]
- 如果 `word_count` 不是 8 的倍数，最后一拍的高位字节无效（填充为 0x00）

### 4.3 波形图 - 4 通道配置 (PPI-8, 64位 IDI)

**配置**：

- 通道数：4 Lane
- PPI 模式：PPI-8
- IDI 位宽：64 位
- 数据吞吐量：每时钟周期 8 字节

**场景**：传输一个长数据包，`word_count` = 24 (传输 24 字节数据)

```wavedrom
时钟周期:   T0    T1    T2    T3    T4    T5
            |     |     |     |     |     |
               __/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__   clk_data
               ___/‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\__________   header_en
               _______/‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\__________   data_en
               ___<VC=0                    >__________   virtual_channel[1:0]
               ___<DT=0x2B                 >__________   data_type[5:0] (RGB888)
               ___<WC=24                   >__________   word_count[15:0]
               ___<ECC                     >__________   ecc[7:0]
               _______<  D0  ><  D1  ><  D2  >   csi_data[63:0]
                      Byte   Byte    Byte
                      [0:7]  [8:15]  [16:23]

说明：
- T0: 空闲状态
- T1: header_en 上升沿，报头字段同时有效
      VC=2'b00, DT=6'h2B, WC=16'h0018, ECC=8'hXX
      报头字段在整个数据包传输期间保持稳定
- T2: data_en 上升（延迟 1 周期），开始传输数据
      D0 = {Byte7, Byte6, Byte5, Byte4, Byte3, Byte2, Byte1, Byte0}
- T3: 传输第二个数据字
      D1 = {Byte15, Byte14, Byte13, Byte12, Byte11, Byte10, Byte9, Byte8}
- T4: 传输第三个数据字
      D2 = {Byte23, Byte22, Byte21, Byte20, Byte19, Byte18, Byte17, Byte16}
- T5: header_en 和 data_en 同时下降，数据包传输完成
- 关键：报头字段在 T1~T4 期间保持稳定不变
- 关键：data_en 有效期间，每个时钟上升沿传输一个 64-bit 数据字
```

### 4.4 波形图 - 2 通道配置 (PPI-8, 64位 IDI)

**配置**：

- 通道数：2 Lane
- PPI 模式：PPI-8
- IDI 位宽：64 位
- 数据吞吐量：每 2 个时钟周期 8 字节

**场景**：传输一个长数据包，`word_count` = 16 (传输 16 字节数据)

```wavedrom
时钟周期:      T0    T1    T2    T3    T4    T5    T6    T7
               |     |     |     |     |     |     |     |
               __/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__   clk_data
               ___/‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\______________   header_en
               _______/‾‾‾‾\______/‾‾‾‾\__________________   data_en
               ___<VC=1                        >______________   virtual_channel[1:0]
               ___<DT=0x1E                     >______________   data_type[5:0] (YUV422)
               ___<WC=16                       >______________   word_count[15:0]
               ___<ECC                         >______________   ecc[7:0]
               _______<  D0  >______<  D1  >__________   csi_data[63:0]
                      Byte[0:7]    Byte[8:15]

说明：
- T1: header_en 上升沿，报头字段同时有效
      VC=2'b01, DT=6'h1E, WC=16'h0010, ECC=8'hXX
- T2: data_en 首次有效，传输 Byte[0:7]
      D0 = {Byte7, Byte6, Byte5, Byte4, Byte3, Byte2, Byte1, Byte0}
- T3: data_en 无效（2 通道带宽限制，无法连续传输）
- T4: data_en 再次有效，传输 Byte[8:15]
      D1 = {Byte15, Byte14, Byte13, Byte12, Byte11, Byte10, Byte9, Byte8}
- T5: data_en 下降，数据传输完成
- T6: header_en 下降，数据包结束
- 关键：2 通道配置时，data_en 每 2 个时钟周期有效 1 次
- 关键：报头字段在 header_en 有效期间始终保持稳定
```

### 4.5 波形图 - 1 通道配置 (PPI-8, 64位 IDI)

**配置**：

- 通道数：1 Lane
- PPI 模式：PPI-8
- IDI 位宽：64 位
- 数据吞吐量：每 4 个时钟周期 8 字节

**场景**：传输一个长数据包，`word_count` = 8 (传输 8 字节数据)

```wavedrom
时钟周期:      T0    T1    T2    T3    T4    T5    T6
               |     |     |     |     |     |     |
               __/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__   clk_data
               ___/‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\__________________   header_en
               _______/‾‾‾‾\__________________________   data_en
               ___<VC=2                >__________________   virtual_channel[1:0]
               ___<DT=0x30             >__________________   data_type[5:0] (User-8)
               ___<WC=8                >__________________   word_count[15:0]
               ___<ECC                 >__________________   ecc[7:0]
               _______<     D0     >__________________   csi_data[63:0]
                      Byte[0:7]

说明：
- T1: header_en 上升沿，报头字段同时有效
      VC=2'b10, DT=6'h30, WC=16'h0008, ECC=8'hXX
- T2: data_en 有效，传输全部 8 字节数据
      D0 = {Byte7, Byte6, Byte5, Byte4, Byte3, Byte2, Byte1, Byte0}
- T3: data_en 下降，数据传输完成
- T5: header_en 下降，数据包结束（1通道需要更多周期处理内部逻辑）
- 关键：1 通道配置时，吞吐量最低，每个数据字传输间隔较长
- 关键：header_en 持续时间比实际数据传输时间长
```

### 4.6 非对齐数据传输示例

**场景**：`word_count` = 20 字节，64位总线，4通道配置

```wavedrom
时钟周期:      T0    T1    T2    T3    T4    T5
               |     |     |     |     |     |
               __/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__   clk_data
               ___/‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\__________   header_en
               _______/‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\__________   data_en
               _______<  D0  ><  D1  ><  D2  >   csi_data[63:0]

字节分布：
D0: csi_data[63:0] = {Byte7,  Byte6,  Byte5,  Byte4,  Byte3,  Byte2,  Byte1,  Byte0}
D1: csi_data[63:0] = {Byte15, Byte14, Byte13, Byte12, Byte11, Byte10, Byte9,  Byte8}
D2: csi_data[63:0] = {8'h00,  8'h00,  8'h00,  8'h00,  Byte19, Byte18, Byte17, Byte16}
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  ← 高位填充 0 (无效字节)

说明：
- word_count=20 不是 8 的倍数，需要 3 拍传输
- 前 2 拍传输 16 字节，第 3 拍只传输 4 个有效字节
- 最后一拍的高 4 字节 (csi_data[63:32]) 填充为 0x00000000
- 关键：接收端需要根据 word_count 判断最后一拍哪些字节有效
- 关键：字节序从低位到高位：Byte16 → Byte17 → Byte18 → Byte19 → PAD
```

## 5. 数据吞吐量与配置关系

### 5.1 各配置下的 data_en 行为

**4 通道配置**：

- `data_en` 连续有效，每个时钟周期都有新数据
- 延迟最小，通常为 1 个时钟周期

**2 通道配置**：

- `data_en` 间隔有效，每 2 个时钟周期有 1 次有效
- 延迟为 1-2 个时钟周期

**1 通道配置**：

- `data_en` 稀疏有效，每 4 个时钟周期有 1 次有效
- 延迟可能达到 2-4 个时钟周期

## 6. 异常场景与边界条件

### 6.1 最小数据包 (word_count = 0)

某些短数据包的 `word_count` 可能为 0（例如帧起始/结束标记）。

```wavedrom
时钟周期:      T0    T1    T2
               |     |     |
               __/‾‾\__/‾‾\__/‾‾\__   clk_data
               ___/‾‾‾‾\__________   header_en
               ___________________   data_en (始终无效)
               ___<VC=0>__________   virtual_channel[1:0]
               ___<0x00>__________   data_type[5:0] (帧起始 FS)
               ___<  0 >__________   word_count[15:0]
               ___<ECC >__________   ecc[7:0]

说明：
- word_count=0 表示短数据包，无数据载荷
- data_en 在整个传输期间保持低电平
- 典型应用：帧起始(FS)、帧结束(FE)、行起始(LS)、行结束(LE)
```

### 6.2 最大数据包 (word_count = 65535)

最大数据包需要 65535 / 8 = 8192 个时钟周期传输（64位总线，4通道）。

**验证要点**：

- `header_en` 持续时间可能超过 8K 时钟周期
- 确保计数器位宽足够（至少 16 位）
- 验证长时间稳定的信号保持

### 6.3 连续数据包传输

最小包间间隔为 1 个时钟周期，但实际应用中可能连续传输。

```wavedrom
时钟周期:      T0    T1    T2    T3    T4    T5    T6    T7
               |     |     |     |     |     |     |     |
               __/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__/‾‾\__   clk_data
               ___/‾‾‾‾‾‾‾‾‾‾‾‾\__/‾‾‾‾‾‾‾‾‾‾‾‾\__________________   header_en
               _______/‾‾‾‾‾‾\______/‾‾‾‾‾‾\__________________   data_en
               _______< D0  >______< D0  >______________   csi_data[63:0]
                      PKT1         PKT2

说明：
- T1-T3: 第一个数据包传输
- T3: 仅有 1 个时钟周期间隔 (header_en 为低)
- T4-T6: 第二个数据包传输
- 关键：包间间隔最小为 1 个时钟周期
- 关键：背靠背传输时，两个 header_en 之间必须有下降沿
```

## 8. 激励规范与驱动器实现指南

本章节为 testbench 开发者提供清晰、可直接实现的激励驱动规范。

### 8.1 驱动合约（信号驱动契约）

#### 8.1.1 时钟与采样

- **时钟信号**：`clk_data`
- **采样规则**：所有信号在 `clk_data` 上升沿采样
- **驱动规则**：驱动器应在上升沿前稳定好信号值

#### 8.1.2 报头信号驱动规则

**关键约束**：报头字段必须在 `header_en` 上升沿**同时有效**并保持稳定。

| 信号 | 驱动时机 | 保持时间 | 失效时机 |
|------|----------|----------|----------|
| `header_en` | 数据包开始的上升沿置高 | 短包：≥1 clk<br>长包：直到数据传输完成 | 数据包结束时同步下降 |
| `virtual_channel[1:0]` | 与 `header_en` 上升沿同步 | 与 `header_en` 高电平期间保持 | 与 `header_en` 同步失效 |
| `data_type[5:0]` | 与 `header_en` 上升沿同步 | 与 `header_en` 高电平期间保持 | 与 `header_en` 同步失效 |
| `word_count[15:0]` | 与 `header_en` 上升沿同步 | 与 `header_en` 高电平期间保持 | 与 `header_en` 同步失效 |
| `ecc[7:0]` | 与 `header_en` 上升沿同步 | 与 `header_en` 高电平期间保持 | 与 `header_en` 同步失效 |

**代码示例**（同步驱动）：

```systemverilog
// 在同一个上升沿同时驱动所有报头字段
@(posedge clk_data);
header_en <= 1'b1;
virtual_channel <= 2'b00;
data_type <= 6'h2B;
word_count <= 16'd24;
ecc <= 8'hXX;
```

#### 8.1.3 数据信号驱动规则

**data_en 行为**：

- `data_en` 高电平表示当前周期 `csi_data[63:0]` 上有有效数据字
- `data_en` 在 `header_en` 上升后延迟 `data_delay` 个时钟周期开始有效
- `data_delay` 范围：1~4 clk（取决于配置，推荐默认值 1 或 2）
- 持续拍数：`N = ceil(word_count / 8)`（64-bit 总线）

**csi_data 布局**（Little-endian）：

```
csi_data[63:0] = {Byte[N+7], Byte[N+6], ..., Byte[N+1], Byte[N]}
                  MSB                                      LSB
                  [63:56]  [55:48]       [15:8]   [7:0]
```

- 第一拍：`Byte[0]` 在 `csi_data[7:0]`，`Byte[7]` 在 `csi_data[63:56]`
- 最后一拍不足 8 字节时：高位字节填充 `0x00`

**示例**（20 字节数据）：

```
拍 0: csi_data = {Byte7,  Byte6,  Byte5,  Byte4,  Byte3,  Byte2,  Byte1,  Byte0}
拍 1: csi_data = {Byte15, Byte14, Byte13, Byte12, Byte11, Byte10, Byte9,  Byte8}
拍 2: csi_data = {8'h00,  8'h00,  8'h00,  8'h00,  Byte19, Byte18, Byte17, Byte16}
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  填充零
```

#### 8.1.4 通道数对 data_en 的影响

`data_en` 的稀疏性由物理通道数决定：

| 通道数 | data_en 模式 | 说明 |
|--------|--------------|------|
| 4 Lane | 连续有效 | `data_en` 可连续为 1，每个时钟传输一个 64-bit 字 |
| 2 Lane | 间隔有效 | `data_en` 每 2 个时钟周期有效 1 次（pattern: 1,0,1,0,...） |
| 1 Lane | 稀疏有效 | `data_en` 每 4 个时钟周期有效 1 次（pattern: 1,0,0,0,1,0,0,0,...） |

**驱动器实现**：

```systemverilog
// 计算 gap（两次 data_en 有效之间的周期数）
int gap = (lanes == 4) ? 1 : ((lanes == 2) ? 2 : 4);

// 在循环中应用 gap
for (int beat = 0; beat < total_beats; beat++) begin
  data_en <= 1'b1;
  csi_data <= word64[beat];
  @(posedge clk_data);
  
  // 插入 gap-1 个空闲周期
  if (beat < total_beats - 1) begin
    data_en <= 1'b0;
    repeat(gap - 1) @(posedge clk_data);
  end
end
```

### 8.2 数据包驱动状态机

#### 8.2.1 状态定义

```
IDLE → HEADER → WAIT_DATA_DELAY → DATA → END → IDLE
```

**状态转移说明**：

1. **IDLE**：空闲状态
   - `header_en = 0`, `data_en = 0`, `csi_data = 0`

2. **HEADER**：驱动报头
   - 在上升沿同时断言 `header_en` 和所有报头字段
   - 短包：保持 1 个时钟周期后转 END
   - 长包：保持 `header_en` 高并转 WAIT_DATA_DELAY

3. **WAIT_DATA_DELAY**：等待数据延迟
   - 保持 `header_en = 1` 和报头字段稳定
   - 持续 `data_delay` 个时钟周期

4. **DATA**：传输数据
   - 按 `data_en` 模式逐拍驱动 `csi_data`
   - 保持 `header_en = 1` 和报头字段稳定

5. **END**：结束数据包
   - 同时下降 `header_en` 和 `data_en`
   - 转回 IDLE

#### 8.2.2 状态机伪代码

```systemverilog
typedef enum {IDLE, HEADER, WAIT_DELAY, DATA, END} state_t;
state_t state = IDLE;

always @(posedge clk_data or negedge rst_n) begin
  if (!rst_n) begin
    state <= IDLE;
    header_en <= 0;
    data_en <= 0;
  end else begin
    case (state)
      IDLE: begin
        if (packet_valid) begin
          state <= HEADER;
        end
      end
      
      HEADER: begin
        header_en <= 1;
        drive_header_fields();
        if (word_count == 0) begin
          state <= END;
        end else begin
          state <= WAIT_DELAY;
        end
      end
      
      WAIT_DELAY: begin
        if (delay_counter == data_delay) begin
          state <= DATA;
        end
      end
      
      DATA: begin
        drive_data_beats();
        if (beat_counter == total_beats) begin
          state <= END;
        end
      end
      
      END: begin
        header_en <= 0;
        data_en <= 0;
        state <= IDLE;
      end
    endcase
  end
end
```

### 8.3 完整驱动器实现模板

#### 8.3.1 数据包结构定义

```systemverilog
typedef struct {
  bit [1:0]       vc;           // 虚拟通道
  bit [5:0]       dt;           // 数据类型
  int unsigned    word_count;   // 字节数
  byte            payload[];    // 有效载荷（长度 = word_count）
  bit [7:0]       ecc;          // ECC 校验码
  int             data_delay;   // data_en 延迟周期数（1~4）
  int             lanes;        // 物理通道数（1/2/4）
  string          tag;          // 调试标签
  
  // 错误注入标志
  bit             ecc_single_bit_err;
  bit             ecc_double_bit_err;
} idi_packet_t;
```

#### 8.3.2 ECC 计算与错误注入

```systemverilog
function bit [7:0] compute_ecc(bit [1:0] vc, bit [5:0] dt, bit [15:0] wc);
  // 简化版 ECC 计算（实际应按 CSI-2 规范实现汉明码）
  bit [23:0] header = {wc, dt, vc};
  return header[7:0] ^ header[15:8] ^ header[23:16];
endfunction

function bit [7:0] inject_ecc_error(bit [7:0] ecc, bit single, bit double_err);
  if (single) begin
    return ecc ^ 8'h01; // 翻转第 0 位
  end else if (double_err) begin
    return ecc ^ 8'h03; // 翻转第 0、1 位
  end else begin
    return ecc;
  end
endfunction
```

#### 8.3.3 主驱动任务

```systemverilog
task automatic drive_packet(idi_packet_t pkt);
  int total_beats;
  int byte_index;
  logic [63:0] word64;
  int gap;
  
  // ========== HEADER 状态 ==========
  @(posedge clk_data);
  header_en <= 1'b1;
  virtual_channel <= pkt.vc;
  data_type <= pkt.dt;
  word_count <= pkt.word_count;
  
  // 计算或注入 ECC
  if (pkt.ecc_single_bit_err || pkt.ecc_double_bit_err) begin
    ecc <= inject_ecc_error(
      compute_ecc(pkt.vc, pkt.dt, pkt.word_count),
      pkt.ecc_single_bit_err,
      pkt.ecc_double_bit_err
    );
  end else begin
    ecc <= pkt.ecc; // 使用预设值或默认计算
  end
  
  $display("[%t] %s: PKT START - VC=%0d, DT=0x%02X, WC=%0d", 
           $time, pkt.tag, pkt.vc, pkt.dt, pkt.word_count);
  
  @(posedge clk_data);
  
  // ========== 短包处理 ==========
  if (pkt.word_count == 0) begin
    data_en <= 1'b0;
    header_en <= 1'b0;
    $display("[%t] %s: Short packet completed", $time, pkt.tag);
    @(posedge clk_data);
    return;
  end
  
  // ========== WAIT_DATA_DELAY 状态 ==========
  repeat (pkt.data_delay) @(posedge clk_data);
  
  // ========== DATA 状态 ==========
  total_beats = (pkt.word_count + 7) / 8;
  byte_index = 0;
  gap = (pkt.lanes == 4) ? 1 : ((pkt.lanes == 2) ? 2 : 4);
  
  for (int beat = 0; beat < total_beats; beat++) begin
    // 构造 64-bit 数据字
    word64 = '0;
    for (int j = 0; j < 8; j++) begin
      if (byte_index < pkt.word_count) begin
        word64[(8*j) +: 8] = pkt.payload[byte_index];
      end else begin
        word64[(8*j) +: 8] = 8'h00; // 高位填充 0
      end
      byte_index++;
    end
    
    // 驱动数据
    data_en <= 1'b1;
    csi_data <= word64;
    $display("[%t] %s: Beat %0d/%0d - DATA=0x%016X", 
             $time, pkt.tag, beat+1, total_beats, word64);
    @(posedge clk_data);
    
    // 插入 gap（除最后一拍外）
    if (beat < total_beats - 1) begin
      data_en <= 1'b0;
      csi_data <= 64'h0; // 可选：空闲期间清零或保持
      repeat(gap - 1) @(posedge clk_data);
    end
  end
  
  // ========== END 状态 ==========
  header_en <= 1'b0;
  data_en <= 1'b0;
  csi_data <= 64'h0;
  $display("[%t] %s: PKT END", $time, pkt.tag);
  @(posedge clk_data);
endtask
```

### 8.4 典型测试序列示例

#### 8.4.1 短包：帧起始（FS）

```systemverilog
idi_packet_t fs_pkt;
fs_pkt.vc = 2'b00;
fs_pkt.dt = 6'h00; // Frame Start
fs_pkt.word_count = 0;
fs_pkt.data_delay = 1;
fs_pkt.lanes = 4;
fs_pkt.tag = "FS";

drive_packet(fs_pkt);
```

**预期时序**：

```
T0: IDLE
T1: header_en=1, VC=0, DT=0x00, WC=0
T2: header_en=0, data_en=0
```

#### 8.4.2 长包：24 字节 RGB888（4-lane）

```systemverilog
idi_packet_t rgb_pkt;
rgb_pkt.vc = 2'b00;
rgb_pkt.dt = 6'h24; // RGB888
rgb_pkt.word_count = 24;
rgb_pkt.payload = new[24];
for (int i = 0; i < 24; i++) rgb_pkt.payload[i] = i; // 0x00~0x17
rgb_pkt.data_delay = 1;
rgb_pkt.lanes = 4;
rgb_pkt.tag = "RGB888";

drive_packet(rgb_pkt);
```

**预期时序**：

```
T0: IDLE
T1: header_en=1, VC=0, DT=0x24, WC=24
T2: header_en=1 (delay)
T3: header_en=1, data_en=1, csi_data={Byte7..Byte0}
T4: header_en=1, data_en=1, csi_data={Byte15..Byte8}
T5: header_en=1, data_en=1, csi_data={Byte23..Byte16}
T6: header_en=0, data_en=0
```

#### 8.4.3 非对齐长包：20 字节（4-lane）

```systemverilog
idi_packet_t unalign_pkt;
unalign_pkt.vc = 2'b01;
unalign_pkt.dt = 6'h30; // User Defined
unalign_pkt.word_count = 20;
unalign_pkt.payload = new[20];
for (int i = 0; i < 20; i++) unalign_pkt.payload[i] = 8'hAA + i;
unalign_pkt.data_delay = 2;
unalign_pkt.lanes = 4;
unalign_pkt.tag = "UNALIGNED";

drive_packet(unalign_pkt);
```

**预期数据拍**：

```
Beat 0: {0xB1, 0xB0, 0xAF, 0xAE, 0xAD, 0xAC, 0xAB, 0xAA}
Beat 1: {0xB9, 0xB8, 0xB7, 0xB6, 0xB5, 0xB4, 0xB3, 0xB2}
Beat 2: {0x00, 0x00, 0x00, 0x00, 0xBD, 0xBC, 0xBB, 0xBA}  ← 高位填充 0
```

#### 8.4.4 背靠背数据包

```systemverilog
idi_packet_t pkt1, pkt2;

// 第一个包
pkt1.vc = 2'b00; pkt1.dt = 6'h00; pkt1.word_count = 0;
pkt1.data_delay = 1; pkt1.lanes = 4; pkt1.tag = "PKT1";
drive_packet(pkt1);

// 第二个包（立即跟随，包间间隔 = 1 clk）
pkt2.vc = 2'b00; pkt2.dt = 6'h01; pkt2.word_count = 0;
pkt2.data_delay = 1; pkt2.lanes = 4; pkt2.tag = "PKT2";
drive_packet(pkt2);
```

**预期时序**：

```
T1: header_en=1 (PKT1)
T2: header_en=0
T3: header_en=1 (PKT2)
T4: header_en=0
```

- 关键：两个 `header_en` 之间有下降沿（T2）

#### 8.4.5 ECC 单比特错误注入

```systemverilog
idi_packet_t ecc_err_pkt;
ecc_err_pkt.vc = 2'b10;
ecc_err_pkt.dt = 6'h1E; // YUV422
ecc_err_pkt.word_count = 16;
ecc_err_pkt.payload = new[16];
ecc_err_pkt.data_delay = 1;
ecc_err_pkt.lanes = 4;
ecc_err_pkt.ecc_single_bit_err = 1; // 注入单比特错误
ecc_err_pkt.tag = "ECC_ERR";

drive_packet(ecc_err_pkt);

// 监视器应检测到 ECC 错误并记录修正/丢弃行为
```

#### 8.4.6 2-lane 配置（data_en 间隔）

```systemverilog
idi_packet_t lane2_pkt;
lane2_pkt.vc = 2'b11;
lane2_pkt.dt = 6'h2A; // RAW8
lane2_pkt.word_count = 16;
lane2_pkt.payload = new[16];
lane2_pkt.data_delay = 2;
lane2_pkt.lanes = 2; // ← 2-lane 配置
lane2_pkt.tag = "2LANE";

drive_packet(lane2_pkt);
```

**预期 data_en 模式**：

```
T2: data_en=0 (delay)
T3: data_en=0 (delay)
T4: data_en=1, csi_data={Byte7..Byte0}
T5: data_en=0 (gap)
T6: data_en=1, csi_data={Byte15..Byte8}
T7: data_en=0
```

### 8.5 监视器与断言映射

#### 8.5.1 报头字段同步检查

```systemverilog
// Assertion: 报头字段必须在 header_en 上升沿同时有效
property p_header_fields_sync;
  @(posedge clk_data) 
    $rose(header_en) |-> $stable(virtual_channel) && 
                         $stable(data_type) && 
                         $stable(word_count) && 
                         $stable(ecc);
endproperty
assert property (p_header_fields_sync) else 
  $error("Header fields not synchronized with header_en rise");
```

#### 8.5.2 包间间隔检查

```systemverilog
// 已在文档 7.2 中定义，确保两个包之间至少有 1 个周期间隔
// p_packet_gap 保持不变
```

#### 8.5.3 数据计数验证

```systemverilog
// 监视器：累计 data_en 有效期间传输的字节数
int monitored_bytes = 0;
int expected_bytes;

always @(posedge clk_data) begin
  if ($rose(header_en)) begin
    expected_bytes = word_count;
    monitored_bytes = 0;
  end
  
  if (data_en) begin
    monitored_bytes += 8; // 每拍 8 字节
  end
  
  if ($fell(header_en)) begin
    // 实际字节数应 = word_count（允许最后一拍填充）
    int actual_bytes = (monitored_bytes >= expected_bytes) ? 
                       expected_bytes : monitored_bytes;
    assert (actual_bytes == expected_bytes) else
      $error("Byte count mismatch: expected=%0d, got=%0d", 
             expected_bytes, monitored_bytes);
  end
end
```

#### 8.5.4 payload 数据完整性检查

```systemverilog
// Scoreboard: 比对驱动器发送的 payload 与监视器接收的数据
class idi_scoreboard;
  byte expected_queue[$];
  byte received_queue[$];
  
  function void record_sent_packet(idi_packet_t pkt);
    foreach (pkt.payload[i]) expected_queue.push_back(pkt.payload[i]);
  endfunction
  
  function void record_received_beat(logic [63:0] data, int valid_bytes);
    for (int i = 0; i < valid_bytes; i++) begin
      received_queue.push_back(data[(8*i) +: 8]);
    end
  endfunction
  
  function void check();
    assert (expected_queue.size() == received_queue.size()) else
      $error("Size mismatch");
    foreach (expected_queue[i]) begin
      assert (expected_queue[i] == received_queue[i]) else
        $error("Byte[%0d] mismatch: exp=0x%02X, got=0x%02X", 
               i, expected_queue[i], received_queue[i]);
    end
  endfunction
endclass
```

### 8.6 驱动器配置参数

驱动器应暴露以下可配置参数：

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `lanes` | int | 4 | 物理通道数（1/2/4） |
| `data_delay` | int | 1 | `header_en` 到 `data_en` 的延迟周期数 |
| `ecc_auto_calc` | bit | 1 | 是否自动计算 ECC（0=使用预设值） |
| `hold_csi_during_gap` | bit | 0 | gap 期间是否保持 `csi_data`（0=清零） |
| `packet_gap_cycles` | int | 1 | 连续数据包之间的最小间隔周期数 |
| `max_packet_queue` | int | 64 | 数据包队列最大深度 |

**使用示例**：

```systemverilog
initial begin
  idi_driver drv = new();
  drv.lanes = 2;
  drv.data_delay = 2;
  drv.ecc_auto_calc = 1;
  
  // 发送测试序列
  drv.send_packet(fs_pkt);
  drv.send_packet(rgb_pkt);
  drv.send_packet(fe_pkt);
end
```

### 8.7 调试建议

#### 8.7.1 波形检查要点

1. **报头对齐**：所有报头字段在 `header_en` 上升沿同时变化
2. **data_en 延迟**：从 `header_en` 上升到首次 `data_en=1` 的周期数
3. **data_en 模式**：验证 gap 是否符合 lanes 配置
4. **字节序**：第一个 payload 字节应出现在 `csi_data[7:0]`
5. **填充字节**：最后一拍高位是否正确填充 0

#### 8.7.2 常见错误与排查

| 现象 | 可能原因 | 排查方法 |
|------|----------|----------|
| 报头字段不对齐 | 未在同一上升沿驱动 | 检查驱动代码是否使用单个 `@(posedge clk_data)` |
| data_en 提前/延迟 | `data_delay` 设置错误 | 确认配置值与波形一致 |
| 字节序错误 | 数组索引错误 | 验证 `word64[(8*j) +: 8]` 位切片 |
| 最后一拍数据错误 | 填充逻辑遗漏 | 检查 `byte_index >= word_count` 分支 |
| 包间冲突 | `header_en` 未正确下降 | 确保包间有 ≥1 个周期的低电平 |

#### 8.7.3 仿真日志建议

```systemverilog
// 在驱动器中添加详细日志
$display("[%t] HEADER: VC=%0d, DT=0x%02X, WC=%0d, ECC=0x%02X", 
         $time, vc, dt, word_count, ecc);

$display("[%t] DATA[%0d]: 0x%016X", $time, beat, csi_data);

$display("[%t] PKT_END: Total %0d beats sent", $time, total_beats);
```

## 9. 配置参数表

### 9.1 支持的配置组合

| 配置名称 | 通道数 | PPI | IDI位宽 | 最大带宽 | data_en 延迟 |
|----------|--------|-----|---------|----------|--------------|
| CFG_4L8B64 | 4 | PPI-8 | 64-bit | 6 Gbps | 1-2 clk |
| CFG_2L8B64 | 2 | PPI-8 | 64-bit | 3 Gbps | 1-2 clk |
| CFG_2L16B64 | 2 | PPI-16 | 64-bit | 6 Gbps | 1-2 clk |
| CFG_1L8B64 | 1 | PPI-8 | 64-bit | 1.5 Gbps | 2-4 clk |

### 9.2 常见数据类型参考

| 数据类型 | data_type[5:0] | 说明 | word_count 范围 |
|----------|----------------|------|-----------------|
| 帧起始 | 0x00 | 短包 | 0 或 2 |
| 帧结束 | 0x01 | 短包 | 0 或 2 |
| 行起始 | 0x02 | 短包 | 0 或 2 |
| 行结束 | 0x03 | 短包 | 0 或 2 |
| RAW8 | 0x2A | 长包 | 图像宽度 × 1 |
| RAW10 | 0x2B | 长包 | 图像宽度 × 1.25 |
| RGB565 | 0x22 | 长包 | 图像宽度 × 2 |
| RGB888 | 0x24 | 长包 | 图像宽度 × 3 |
| YUV422-8 | 0x1E | 长包 | 图像宽度 × 2 |
| User Defined | 0x30-0x37 | 长包 | 任意 |

