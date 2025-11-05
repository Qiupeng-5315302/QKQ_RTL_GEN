`ifndef __AS6D_MEP_ALL_INCLUDES__
`define __AS6D_MEP_ALL_INCLUDES__

//defines
//mep data width
`define MEP_CSI2_HOST_IDI_CSIDATA_SIZE        64
`define MEP_CSI2_HOST_BYTES_EN_SIZE           3
`define MEP_CSI2_HOST_N_VIRT_CH               16
`define MEP_CSI2_HOST_VC_WIDTH                4
`define MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE      64
`define MEP_CSI2_DEVICE_VCX_DWIDTH            2
`define MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH 3
`define MEP_CSI2_DEVICE_IDI_DATA_PARITY_WIDTH 13
`define MEP_PACKET_SLICE_WIDTH                2

//CSI packet type
`define CSI_FRAME_START                   6'h00 //CSI帧开始
`define CSI_FRAME_END                     6'h01 //CSI帧结束
`define CSI_LINE_START                    6'h02 //CSI行开始
`define CSI_LINE_END                      6'h03 //CSI行结束
//CSI data type
`define CSI_NULL_BYTE                     6'h10 //无效数据
`define CSI_BLANKING_DATA                 6'h11 //消隐
`define CSI_EMBEDDED_DATA                 6'h12 //嵌入数据
`define CSI_YUV420_8_BIT                  6'h18
`define CSI_YUV420_10_BIT                 6'h19
`define CSI_YUV420_8_BIT_LEGACY           6'h1A
`define CSI_YUV422_8_BIT                  6'h1E
`define CSI_YUV422_10_BIT                 6'h1F
`define CSI_RGB555                        6'h21
`define CSI_RGB565                        6'h22
`define CSI_RGB666                        6'h23
`define CSI_RGB888                        6'h24
`define CSI_RAW28                         6'h26
`define CSI_RAW24                         6'h27
`define CSI_RAW6                          6'h28
`define CSI_RAW7                          6'h29
`define CSI_RAW8                          6'h2A
`define CSI_RAW10                         6'h2B
`define CSI_RAW12                         6'h2C
`define CSI_RAW14                         6'h2D
`define CSI_RAW16                         6'h2E
`define CSI_RAW20                         6'h2F
`define CSI_TUNNEL_MODE                   6'h31

//packet type
`define IMAGE                             4'h0 //TypeA
`define AUDIO                             4'h1 //TypeB
`define I2C_UART_SPI_CTRL                 4'h2 //TypeB
`define GPIO_CTRL                         4'h5 //TypeB
`define USER_DEFINED_PACKETTYPE0          4'h6 //Type
`define USER_DEFINED_PACKETTYPE1          4'h7 //Type
`define USER_DEFINED_PACKETTYPE2          4'h8 //Type
`define USER_DEFINED_PACKETTYPE3          4'h9 //Type
`define MSG_SEC                           4'hE //TypeA
`define MEP_TRANS_ACK                     4'hF //TypeC

//subPacketType
//辅助业务类型
`define FRAME_START                       6'h0 //帧开始
`define FRAME_END                         6'h1 //帧结束
`define FRONT_EMBEDDED_DATA               6'h2 //帧首嵌入数据
`define REAR_EMBEDDED_DATA                6'h3 //帧尾嵌入数据
`define BLANKING_DATA                     6'h5 //消隐
`define LINE_START                        6'h6 //行开始
`define LINE_END                          6'h7 //行结束
`define NULL_BYTE                         6'h8 //无效数据
//RAW 图像类型
`define RAW8                              6'h18
`define RAW10                             6'h19
`define RAW12                             6'h1A
`define RAW14                             6'h1B
`define RAW16                             6'h1C
`define RAW20                             6'h1D
`define RAW24                             6'h1E
`define YUV420_8_BIT                      6'h20
`define YUV420_10_BIT                     6'h21
`define YUV422_8_BIT                      6'h23
`define YUV422_10_BIT                     6'h24
`define YUV420_8_BIT_LEGACY               6'h27
`define RGB666                            6'h28
`define RGB888                            6'h2A
`define RGB565                            6'h2D
`define RGB555                            6'h2E
`define TUNNEL_MODE                       6'h31
//sub packet type
`define I2C_BYPASS                        2'b00
`define I2C_WR_RD_CTRL                    2'b01
`define I2C_WR_RD_ACK                     2'b10
`define GPIO_OVERSAMPLING                 2'b00
`define GPIO_TRIGGER                      2'b01
`define GPIO_TRIGGER_DELAY                2'b10
`define MEP_TRANS_ACK_SUB				  2'b00
//operate code
`define OPCODE_I2C_WR                     3'b000
`define OPCODE_UART_DATASTREAM_WR         3'b110
`define OPCODE_I2C_RD                     3'b001
`define OPCODE_I2C_WR_SUCCEED             3'b000
`define OPCODE_I2C_WR_FAIL                3'b001
`define OPCODE_I2C_RD_SUCCEED_WITH_DATA   3'b010
`define OPCODE_I2C_RD_FAIL_WITHOUT_DATA   3'b011
`define OPCODE_I2C_RD_FAIL_WITH_DATA      3'b100

//state machine tx
`define MEP_TX_SILENT                     4'h0
`define MEP_TX_IDLE                       4'h1
`define MEP_TX_HEADER_GPIO_TRIGGER_DELAY  4'h2
`define MEP_TX_HEADER_GPIO_SINGLE         4'h3
`define MEP_TX_HEADER_GPIO_MULTI          4'h4
`define MEP_TX_HEADER_CTRL_I2C_SINGLE     4'h5
`define MEP_TX_HEADER_CTRL_I2C_MULTI      4'h6
`define MEP_TX_HEADER_CTRL_I2C_INVALID    4'h7
`define MEP_TX_HEADER_DATA                4'h8
`define MEP_TX_HEADER_WITH_CRC            4'h9
`define MEP_TX_HEADER_WITHOUT_CRC         4'ha
`define MEP_TX_DATA                       4'hb
`define MEP_TX_FOOTER                     4'hc
`define MEP_TX_IDI_CRC                    4'hd
`define MEP_TX_CTRL_CRC                   4'he
`define MEP_TX_GPIO_CRC                   4'hf

//state machine rx
`define MEP_RX_SILENT                     5'h0
`define MEP_RX_IDLE                       5'h1
`define MEP_RX_HEADER_GPIO_TRIGGER_DELAY  5'h2
`define MEP_RX_HEADER_GPIO_SINGLE         5'h3
`define MEP_RX_HEADER_GPIO_MULTI          5'h4
`define MEP_RX_HEADER_CTRL_I2C_SINGLE     5'h5
`define MEP_RX_HEADER_CTRL_I2C_MULTI      5'h6
`define MEP_RX_HEADER_CTRL_I2C_MIDDLE     5'h7
`define MEP_RX_HEADER_MEP_TRANS_ACK		  5'h8
`define MEP_RX_HEADER_DATA                5'h9
`define MEP_RX_HEADER_WITH_CRC            5'ha
`define MEP_RX_HEADER_WITHOUT_CRC         5'hb
`define MEP_RX_DATA                       5'hc
`define MEP_RX_IDI_CRC                    5'hd
`define MEP_RX_CTRL_CRC                   5'he
`define MEP_RX_GPIO_CRC                   5'hf
`define MEP_RX_IDI_CRC_EX                 5'h10

//typedef struct
//packet define
typedef struct packed {
    logic        rsv;                          //保留字段
    logic [3:0]  packetType;                   //业务类型
    logic [15:0] mediaAccessControl;           //媒体接入控制
    logic        mediaAccessControlFlag;       //媒体接入控制标识符
    logic        linkID;                       //链路序列号
    logic        packedFlag;                   //封装协议指示
} mepPubHeaderWithMAC;

typedef struct packed {
    logic       rsv;                           //保留字段
    logic [3:0] packetType;                    //业务类型
    logic       mediaAccessControlFlag;        //媒体接入控制标识符
    logic       linkID;                        //链路序列号
    logic       packetFlag;                    //封装协议指示
} mepPubHeaderWithoutMAC;

typedef struct packed {
    logic rsv;                                 //保留字段
    logic [2:0] QoS;                           //服务质量QoS
    logic [5:0] destinationAddr;               //目的地址
    logic [5:0] sourceAddr;                    //源地址
} mediaAccessControlCode;

typedef struct packed {
    logic       errFlameFlag; //错误帧指示
    logic [2:0] lineSegment;  //行分段
    logic [2:0] lineNum;      //行号
    logic       flameFlip;    //帧翻转
} subPacketInfoA;

typedef struct packed {
    logic [15:0]         datalength;    //数据长度，以Byte为单位
    logic [2:0]          packetID;      //同一数据流的数据包序列号
    logic [4:0]          flowID;        //数据流ID
    logic [7:0]          subPacketInfo; //子业务信息
    logic                rsv1;          //保留字段1
    logic                rsv;           //保留字段
    logic [5:0]          subPacketType; //子业务类型
} packageTypeA;

typedef struct packed {
    logic [6:0]          remoteAddr;
    logic                rsv1;
    logic                rsv;
    logic [6:0]          dataLengthHigh;
    logic [3:0]          dataLengthLow;
    logic                dataLengthExFlag;
    logic [2:0]          opCode;
} subPacketInfoB_exLong;

typedef struct packed {
    logic                rsv1;
    logic [6:0]          dataLengthHighRd;
    logic [3:0]          dataLengthLowRd;
    logic                dataLengthExFlagRd;
    logic [1:0]          rsv;
    logic                gapWrRdFlag;
} subPacketInfoB_exLong_rd;

typedef struct packed {
    logic [6:0]          remoteAddr;
    logic                rsv1;
    logic [3:0]          dataLengthLow;
    logic                dataLengthExFlag;
    logic [2:0]          opCode;
} subPacketInfoB_exShort;

typedef struct packed {
    logic [3:0]          dataLengthLowRd;
    logic                dataLengthExFlagRd;
    logic [1:0]          rsv;
    logic                gapWrRdFlag;
} subPacketInfoB_exShort_rd;

typedef struct packed {
    logic [4:0]          destinationPort;
    logic [4:0]          sourcePort;
    logic [2:0]          busStat;
} subPacketInfoB;

typedef struct packed {
    logic [4:0]          destinationPort;
    logic [4:0]          timestampLow;
    logic [1:0]          trigType;
    logic                rsv;
} subPacketInfoB_gpioTrigger;

typedef struct packed {
    logic [12:0]      subPacketInfo;    //子业务信息
    logic             rsv;              //保留字段
    logic [1:0]       subPacketType;    //子业务类型
} packageTypeB;

typedef struct packed {
    logic [1:0]       rsv2;						//保留字段
    logic [5:0]       confirmedSubPacketType;	//conf子业务类型
    logic             rsv1;						//保留字段
    logic [3:0]       confirmedPacketType;		//conf业务类型
    logic [8:0]       rsv;						//保留字段
    logic [1:0]       subPacketType;			//子业务类型
} packageTypeC;

//mipi header define
typedef struct packed {
    logic                                                data_en;
    logic                                                short_packet_en;
    logic                                                footer_en_flag;
    logic                                                header_en_flag;
    logic [29:0]                                         rsv;
    logic [7:0]                                          ecc;
    logic [15:0]                                         word_count;
    logic [5:0]                                          data_type;
    logic [(`MEP_CSI2_HOST_VC_WIDTH-1):0]                virtual_channel;
} mep_tx_idi_header;

typedef struct packed {
    logic                                                data_en;
    logic                                                short_packet_en;
    logic                                                footer_en_flag;
    logic                                                header_en_flag;
    logic [(`MEP_CSI2_HOST_IDI_CSIDATA_SIZE-1):0]        csi_data;
} mep_tx_idi_data;

typedef struct packed {
    logic                                                data_en;
    logic                                                short_packet_en;
    logic                                                footer_en_flag;
    logic                                                header_en_flag;
    logic [24:0]                                         rsv;
    logic [(`MEP_CSI2_DEVICE_IDI_DATA_PARITY_WIDTH-1):0] idi_data_parity;
    logic [15:0]                                         idi_word_count;
    logic [5:0]                                          idi_data_type;
    logic [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]            idi_virtual_channel_x;
    logic [1:0]                                          idi_virtual_channel;
} mep_rx_idi_header;

typedef struct packed {
    logic                                                data_en;
    logic                                                short_packet_en;
    logic                                                footer_en_flag;
    logic                                                header_en_flag;
    logic [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] idi_byte_en;
    logic [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      idi_data;
} mep_rx_idi_data;

`endif
