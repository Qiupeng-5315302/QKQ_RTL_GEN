
// ------------------------------------------------------------------------------
// 
// Copyright 2015 - 2021 Synopsys, INC.
// 
// This Synopsys IP and all associated documentation are proprietary to
// Synopsys, Inc. and may only be used pursuant to the terms and conditions of a
// written license agreement with Synopsys, Inc. All other use, reproduction,
// modification, or distribution of the Synopsys IP or the associated
// documentation is strictly prohibited.
// 
// Component Name   : DWC_mipicsi2_device
// Component Version: 1.32a
// Release Type     : GA
// Build ID         : 85.222.61.51
// ------------------------------------------------------------------------------

`define _GUARD_APP_DEVICE_CONSTANTS_

//-- Description : Constants definition
// -----------------------------------------------------------
// -- BCM's configuration
// -----------------------------------------------------------

`define DWC_NO_TST_MODE                 1
`define DWC_NO_CDC_INIT                 1
`define DWC_BCM06_NO_DIAG_N             1

// ------------------------------------------------------------
// -- Register address offset macros
// -- All registers are on 32-bit boundaries
// ------------------------------------------------------------
  // General Control Register Address
  `define  CSI2_DEVICE_VERSION_OS                 12'h000
  `define  CSI2_DEVICE_CSI2_RESETN_OS             12'h004
  `define  CSI2_DEVICE_DATA_SCRAMBLING_OS         12'h008
  `define  CSI2_DEVICE_VER_TYPE_OS                12'h00c
  `define  CSI2_DEVICE_SS_CTRL_OS                 12'h010


  // Interrupt Related Register Address
  `define  CSI2_DEVICE_INT_ST_MAIN_OS             12'h100
  `define  CSI2_DEVICE_INT_ST_VPG_OS              12'h104
  `define  CSI2_DEVICE_INT_ST_IDI_OS              12'h108
  `define  CSI2_DEVICE_INT_ST_PHY_OS              12'h110
  `define  CSI2_DEVICE_INT_ST_IDI_VCX_OS          12'h114
  `define  CSI2_DEVICE_INT_ST_IDI_VCX2_OS         12'h118


  `define  CSI2_DEVICE_INT_MASK_N_VPG_OS          12'h160
  `define  CSI2_DEVICE_INT_FORCE_VPG_OS           12'h164
  `define  CSI2_DEVICE_INT_MASK_N_IDI_OS          12'h168
  `define  CSI2_DEVICE_INT_FORCE_IDI_OS           12'h16c
  `define  CSI2_DEVICE_INT_MASK_N_PHY_OS          12'h178
  `define  CSI2_DEVICE_INT_FORCE_PHY_OS           12'h17C
  `define  CSI2_DEVICE_INT_MASK_N_IDI_VCX_OS      12'h180
  `define  CSI2_DEVICE_INT_FORCE_IDI_VCX_OS       12'h184
  `define  CSI2_DEVICE_INT_MASK_N_IDI_VCX2_OS     12'h188
  `define  CSI2_DEVICE_INT_FORCE_IDI_VCX2_OS      12'h18c


  // VPG Related Register Address
  `define  CSI2_DEVICE_VPG_EN_OS                  12'h200
  `define  CSI2_DEVICE_VPG_ACTIVE_OS              12'h204
  `define  CSI2_DEVICE_VPG_MODE_CFG_OS            12'h208
  `define  CSI2_DEVICE_VPG_PKT_CFG_OS             12'h20c
  `define  CSI2_DEVICE_VPG_PKT_SIZE_OS            12'h210
  `define  CSI2_DEVICE_VPG_HSA_TIME_OS            12'h214
  `define  CSI2_DEVICE_VPG_HBP_TIME_OS            12'h218
  `define  CSI2_DEVICE_VPG_HLINE_TIME_OS          12'h21c
  `define  CSI2_DEVICE_VPG_VSA_LINES_OS           12'h220
  `define  CSI2_DEVICE_VPG_VBP_LINES_OS           12'h224
  `define  CSI2_DEVICE_VPG_VFP_LINES_OS           12'h228
  `define  CSI2_DEVICE_VPG_ACT_LINES_OS           12'h22c
  `define  CSI2_DEVICE_VPG_MAX_FRAME_NUM_OS       12'h230
  `define  CSI2_DEVICE_VPG_START_LINE_NUM_OS      12'h234
  `define  CSI2_DEVICE_VPG_STEP_LINE_NUM_OS       12'h238
  `define  CSI2_DEVICE_VPG_BK_LINES_OS            12'h23c

  // PHY Related Register Address
  `define  CSI2_DEVICE_PHY_INIT_CTRL_OS           12'h300
  `define  CSI2_DEVICE_PHY_IF_CFG_OS              12'h304
  `define  CSI2_DEVICE_PHY_TXREQCLKHS_CON_OS      12'h308
  `define  CSI2_DEVICE_PHY_ULPS_CTRL_OS           12'h30c
  `define  CSI2_DEVICE_CLKMGR_CFG_OS              12'h310
  `define  CSI2_DEVICE_PHY_CAL_OS                 12'h314
  `define  CSI2_DEVICE_PHY_CAL_STS_OS             12'h318
  `define  CSI2_DEVICE_TO_CNT_CFG_OS              12'h31c
  `define  CSI2_DEVICE_PHY_MODE_OS                12'h320


  `define  CSI2_DEVICE_PHY_TIMING_CALC_CTRL_OS    12'h328
  `define  CSI2_DEVICE_PHY_TIMING_CALC_STATUS_OS  12'h32c
  `define  CSI2_DEVICE_PHY_SWITCH_TIME_AUTO_OS    12'h330
  `define  CSI2_DEVICE_PHY_STATUS_ALL_OS          12'h334
  `define  CSI2_DEVICE_PHY0_TEST_CTRL0_OS         12'h338
  `define  CSI2_DEVICE_PHY0_TEST_CTRL1_OS         12'h33c


  `define  CSI2_DEVICE_TX_REG_CSI_EPD_EN_SSP_OS       12'h348
  `define  CSI2_DEVICE_TX_REG_CSI_EPD_OP_SLP_OS       12'h34c
  `define  CSI2_DEVICE_TX_REG_CSI_EPD_MISC_OPTIONS_OS 12'h350
  `define  CSI2_DEVICE_TX_REG_CSI_EPD_MAX_OS          12'h354
  `define  CSI2_DEVICE_PHY_HS_IDLE_TIME_AUTO_OS       12'h35c

  // IDI Related Register Address
  `define  CSI2_DEVICE_IDI_FIFO_STATUS_OS         12'h400











  // Diagnosis Interrupt Related Register Address
  `define  CSI2_DEVICE_INT_ST_DIAG_MAIN_OS               12'h800
  `define  CSI2_DEVICE_INT_ST_DIAG0_OS                   12'h804
  `define  CSI2_DEVICE_INT_ST_FAP_VPG_OS                 12'h808
  `define  CSI2_DEVICE_INT_ST_FAP_IDI_OS                 12'h80c
  `define  CSI2_DEVICE_INT_ST_FAP_PHY_OS                 12'h814
  `define  CSI2_DEVICE_INT_ST_FAP_IDI_VCX_OS             12'h818
  `define  CSI2_DEVICE_INT_ST_FAP_IDI_VCX2_OS            12'h81c


  `define  CSI2_DEVICE_INT_MASK_N_DIAG0_OS               12'h860
  `define  CSI2_DEVICE_INT_FORCE_DIAG0_OS                12'h864

  `define  CSI2_DEVICE_INT_MASK_N_FAP_VPG_OS             12'h868
  `define  CSI2_DEVICE_INT_FORCE_FAP_VPG_OS              12'h86c
  `define  CSI2_DEVICE_INT_MASK_N_FAP_IDI_OS             12'h870
  `define  CSI2_DEVICE_INT_FORCE_FAP_IDI_OS              12'h874
  `define  CSI2_DEVICE_INT_MASK_N_FAP_PHY_OS             12'h880
  `define  CSI2_DEVICE_INT_FORCE_FAP_PHY_OS              12'h884
  `define  CSI2_DEVICE_INT_MASK_N_FAP_IDI_VCX_OS         12'h888
  `define  CSI2_DEVICE_INT_FORCE_FAP_IDI_VCX_OS          12'h88c
  `define  CSI2_DEVICE_INT_MASK_N_FAP_IDI_VCX2_OS        12'h890
  `define  CSI2_DEVICE_INT_FORCE_FAP_IDI_VCX2_OS         12'h894

  `define  CSI2_DEVICE_IDI_AP_STATUS_OS                  12'h904
  `define  CSI2_DEVICE_AMBAAPBINTF_AP_STATUS_OS          12'h908
  `define  CSI2_DEVICE_PHY_IF_CTRL_AP_STATUS_OS          12'h90c
  `define  CSI2_DEVICE_REG_BANK_AP_STATUS_OS             12'h910
  `define  CSI2_DEVICE_IDI_FIFOCTRL_AP_STATUS_OS         12'h918
  `define  CSI2_DEVICE_PKT_BUILDER_AP_STATUS_OS          12'h91c
  `define  CSI2_DEVICE_ERR_HANDLER_AP_STATUS_OS          12'h920
  `define  CSI2_DEVICE_SYNC_AP_STATUS_OS                 12'h924
  `define  CSI2_DEVICE_PKT_IF_AP_STATUS_OS               12'h928
  `define  CSI2_DEVICE_ECF_AP_STATUS_OS                  12'h92c
  `define  CSI2_DEVICE_CMU_AP_STATUS_OS                  12'h930

  `define  CSI2_DEVICE_MASK_N_IDI_AP_STATUS_OS           12'h9c8
  `define  CSI2_DEVICE_FORCE_IDI_AP_STATUS_OS            12'h9cc
  `define  CSI2_DEVICE_MASK_N_AMBAAPBINTF_AP_STATUS_OS   12'h9d0
  `define  CSI2_DEVICE_FORCE_AMBAAPBINTF_AP_STATUS_OS    12'h9d4
  `define  CSI2_DEVICE_MASK_N_PHY_IF_CTRL_AP_STATUS_OS   12'h9d8
  `define  CSI2_DEVICE_FORCE_PHY_IF_CTRL_AP_STATUS_OS    12'h9dc
  `define  CSI2_DEVICE_MASK_N_REG_BANK_AP_STATUS_OS      12'h9e0
  `define  CSI2_DEVICE_FORCE_REG_BANK_AP_STATUS_OS       12'h9e4
  `define  CSI2_DEVICE_MASK_N_IDI_FIFOCTRL_AP_STATUS_OS  12'h9f0
  `define  CSI2_DEVICE_FORCE_IDI_FIFOCTRL_AP_STATUS_OS   12'h9f4
  `define  CSI2_DEVICE_MASK_N_PKT_BUILDER_AP_STATUS_OS   12'h9f8
  `define  CSI2_DEVICE_FORCE_PKT_BUILDER_AP_STATUS_OS    12'h9fc
  `define  CSI2_DEVICE_MASK_N_ERR_HANDLER_AP_STATUS_OS   12'ha00
  `define  CSI2_DEVICE_FORCE_ERR_HANDLER_AP_STATUS_OS    12'ha04
  `define  CSI2_DEVICE_MASK_N_SYNC_AP_STATUS_OS          12'ha08
  `define  CSI2_DEVICE_FORCE_SYNC_AP_STATUS_OS           12'ha0c
  `define  CSI2_DEVICE_MASK_N_PKT_IF_AP_STATUS_OS        12'ha10
  `define  CSI2_DEVICE_FORCE_PKT_IF_AP_STATUS_OS         12'ha14
  `define  CSI2_DEVICE_MASK_N_ECF_AP_STATUS_OS           12'ha18
  `define  CSI2_DEVICE_FORCE_ECF_AP_STATUS_OS            12'ha1c
  `define  CSI2_DEVICE_MASK_N_CMU_AP_STATUS_OS           12'ha20
  `define  CSI2_DEVICE_FORCE_CMU_AP_STATUS_OS            12'ha24

  `define  CSI2_DEVICE_ERR_INJ_CTRL_OS                   12'hb00
  `define  CSI2_DEVICE_ERR_INJ_STATUS_OS                 12'hb04
  `define  CSI2_DEVICE_ERR_INJ_CHK_MASK_OS               12'hb08
  `define  CSI2_DEVICE_ERR_INJ_D31_0_MASK_OS             12'hb0c
  `define  CSI2_DEVICE_ERR_INJ_D63_32_MASK_OS            12'hb10
  `define  CSI2_DEVICE_ERR_INJ_D95_64_MASK_OS            12'hb14
  `define  CSI2_DEVICE_ERR_INJ_D127_96_MASK_OS           12'hb18

  // Faulty Address Logger
  `define CSI2_DEVICE_IDI_RAM_ERR_LOG_AP_OS              12'hb2c
  `define CSI2_DEVICE_IDI_RAM_ADDR_LOG_AP_OS             12'hb30


// -----------------------------------------------------------
// -- Register bit Width macros
// -----------------------------------------------------------
  // General control register
  `define  CSI2_DEVICE_VERSION_RS                      32
  `define  CSI2_DEVICE_CSI2_RESETN_RS                   2

  `define  CSI2_DEVICE_DATA_SCRAMBLING_EN_RS            1

  `define  CSI2_DEVICE_DATA_SCRAMBLING_RS               5
  `define  CSI2_DEVICE_SINGLE_SEED_EN_RS                1

  `define  CSI2_DEVICE_VER_TYPE_RS                     32
  `define  CSI2_DEVICE_SS_ENABLE_RS                     1


  // Interruption related registers
  `define  CSI2_DEVICE_INT_ST_MAIN_RS                   6
  `define  CSI2_DEVICE_INT_VPG_RS                       1
  `define  CSI2_DEVICE_INT_IDI_RS                       6
  `define  CSI2_DEVICE_INT_IDI_VCX_RS                   12
  `define  CSI2_DEVICE_INT_IDI_VCX2_RS                  16



  `define  CSI2_DEVICE_INT_PHY_RS                       3


  // Video pattern generator registers
  `define  CSI2_DEVICE_VPG_EN_RS                        1
  `define  CSI2_DEVICE_VPG_ACTIVE_RS                    1

  `define  CSI2_DEVICE_VPG_MODE_CFG_RS                 17
  `define  CSI2_DEVICE_VPG_MODE_RS                      1
  `define  CSI2_DEVICE_VPG_ORIENTATION_RS               1

  `define  CSI2_DEVICE_VPG_PKT_CFG_RS                  15
  `define  CSI2_DEVICE_VPG_DT_RS                        6
  `define  CSI2_DEVICE_VPG_VC_RS                        2
  `define  CSI2_DEVICE_VPG_HSYNC_EN_RS                  1
  `define  CSI2_DEVICE_VPG_LINE_NUM_MODE_RS             2
  `define  CSI2_DEVICE_VPG_FRAME_NUM_MODE_RS            1

  `define  CSI2_DEVICE_VPG_PKT_SIZE_RS                 14
  `define  CSI2_DEVICE_VPG_HSA_TIME_RS                 12
  `define  CSI2_DEVICE_VPG_HBP_TIME_RS                 12
  `define  CSI2_DEVICE_VPG_HLINE_TIME_RS               15
  `define  CSI2_DEVICE_VPG_VSA_LINES_RS                10
  `define  CSI2_DEVICE_VPG_VBP_LINES_RS                10
  `define  CSI2_DEVICE_VPG_VFP_LINES_RS                10
  `define  CSI2_DEVICE_VPG_ACT_LINES_RS                14
  `define  CSI2_DEVICE_VPG_BK_LINES_RS                 10

  `define  CSI2_DEVICE_VPG_MAX_FRAME_NUM_RS            16
  `define  CSI2_DEVICE_VPG_START_LINE_NUM_RS           16
  `define  CSI2_DEVICE_VPG_STEP_LINE_NUM_RS            16

  //PHY related registers
  `define  CSI2_DEVICE_PHY_INIT_CTRL_RS                 5
  `define  CSI2_DEVICE_PHY_SHUTDOWNZ_RS                 1
  `define  CSI2_DEVICE_PHY_RSTZ_RS                      1
  `define  CSI2_DEVICE_PHY_ENABLECLK_RS                 1
  `define  CSI2_DEVICE_PHY_FORCEPLL_RS                  1
  `define  CSI2_DEVICE_PHY_FORCETXSTOPMODE_RS           1
  `define  CSI2_DEVICE_PHY_IF_CFG_RS                   16
  `define  CSI2_DEVICE_LANE_EN_NUM_RS                   3
  `define  CSI2_DEVICE_CPHY_ALP_EN_RS                   1
  `define  CSI2_DEVICE_STOP_WAIT_TIME_RS                8

  `define  CSI2_DEVICE_PHY_TXREQCLKHS_CON_RS            1
  `define  CSI2_DEVICE_PHY_ULPS_CTRL_RS                 4

  `define  CSI2_DEVICE_CLKMGR_CFG_RS                   16
  `define  CSI2_DEVICE_TX_ESC_CLK_DIVISION_RS           8
  `define  CSI2_DEVICE_TO_CLK_DIVISION_RS               8
  `define  CSI2_DEVICE_TO_CNT_CFG_QST_RS               16

  `define  CSI2_DEVICE_PHY_CAL_ALL_RS                   3
  `define  CSI2_DEVICE_PHY_CAL_RS                       1
  `define  CSI2_DEVICE_PHY_EQ_RS                        2

  `define  CSI2_DEVICE_PHY_STATUS_RS                   11

  `define  CSI2_DEVICE_PHY_STATUS_ALL_RS               (`CSI2_DEVICE_PHY_STATUS_RS+3)

  `define  CSI2_DEVICE_PHY0_TEST_CTRL0_RS               2
  `define  CSI2_DEVICE_PHY0_TEST_CTRL1_RS              17


  `define  CSI2_DEVICE_TX_DATAWIDTH_RS                  2
  `define  CSI2_DEVICE_PHY_MODE_RS                      1

  `define  CSI2_DEVICE_PHY_TEST_CTRL_RS                11

  `define  CSI2_DEVICE_TX_REG_CSI_EPD_EN_SSP_RS        16
  `define  CSI2_DEVICE_EPD_SSP_NUM_RS                  15
  `define  CSI2_DEVICE_EPD_EN_RS                        1

  `define  CSI2_DEVICE_TX_REG_CSI_EPD_OP_SLP_RS        16
  `define  CSI2_DEVICE_EPD_OP_DPHY_RS                   1
  `define  CSI2_DEVICE_EPD_SLP_NUM_RS                  15

  `define  CSI2_DEVICE_TX_REG_CSI_EPD_MISC_OPTIONS_RS   8
  `define  CSI2_DEVICE_EPD_SPA_LEN_OP2_RS               2
  `define  CSI2_DEVICE_EOTP_EN_RS                       1
  `define  CSI2_DEVICE_EPD_SPA_WO_PDQ_EN_RS             1

  `define  CSI2_DEVICE_EPD_SSP_BYTE_RS                 (`CSI2_DEVICE_EPD_SSP_NUM_RS + 4)
  `define  CSI2_DEVICE_EPD_SLP_BYTE_RS                 (`CSI2_DEVICE_EPD_SLP_NUM_RS + 4)

  `define  CSI2_DEVICE_TX_REG_CSI_EPD_MAX_RS           32
  `define  CSI2_DEVICE_TX_HS_IDLE_TIME_RS              16

  // PHY Timing Auto-calculation related registers
  `define  CSI2_DEVICE_PHY_TIMING_CALC_EN_RS            1
  `define  CSI2_DEVICE_PHY_TIMING_CALC_ACTIVE_RS        1
  `define  CSI2_DEVICE_PHY_SWITCH_TIME_AUTO_RS         32
  `define  CSI2_DEVICE_PHY_HS2LP_TIME_AUTO_RS          16
  `define  CSI2_DEVICE_PHY_LP2HS_TIME_AUTO_RS          16
  `define  CSI2_DEVICE_PHY_HS_IDLE_TIME_AUTO_RS        16






  `define  CSI2_DEVICE_TX_HS_IDLE_BYTES_RS             (`CSI2_DEVICE_TX_HS_IDLE_TIME_RS+`CSI2_DEVICE_PLD_BYTEEN_WIDTH)

  // IDI related registers
  `define  CSI2_DEVICE_IDI_FIFO_STATUS_RS              4


  // Diagnosis Interrupt Related Register Width
  `define  CSI2_DEVICE_INT_ST_DIAG_MAIN_RS             7
  `define  CSI2_DEVICE_INT_DIAG0_RS                    21

  `define CSI2_DEVICE_ERR_INJ_CTRL_RS                  3
  `define CSI2_DEVICE_ERR_INJ_STATUS_RS                1
  `define CSI2_DEVICE_ERR_INJ_CHK_MASK_RS              10
  `define CSI2_DEVICE_ERR_INJ_DATA_MASK_RS             32

  `define CSI2_DEVICE_RAM_ERR_LOG_AP_RS                5
  `define CSI2_DEVICE_RAM_ADDR_LOG_AP_RS               14


  `define  CSI2_DEVICE_IDI_AP_STATUS_RS                2
  `define  CSI2_DEVICE_IDI_FIFOCTRL_AP_STATUS_RS       6





  `define  CSI2_DEVICE_SYNC_AP_STATUS_RS               1
`define  CSI2_DEVICE_PHY_IF_CTRL_AP_STATUS_RS        (4 +1)
  `define  CSI2_DEVICE_REG_BANK_AP_STATUS_RS           2
  `define  CSI2_DEVICE_PKT_BUILDER_AP_STATUS_RS        3
  `define  CSI2_DEVICE_ERR_HANDLER_AP_STATUS_RS        1
  `define  CSI2_DEVICE_ECF_AP_STATUS_RS                1
  `define  CSI2_DEVICE_CMU_AP_STATUS_RS                1
  `define  CSI2_DEVICE_AMBAAPBINTF_AP_STATUS_RS        3
`define  CSI2_DEVICE_PKT_IF_AP_STATUS_RS             (2)

  `define  CSI2_DEVICE_DIAG_FAULTS_RS                  16

// -----------------------------------------------------------
// -- PACKET BUILDER
// -----------------------------------------------------------
    `define  CSI2_DEVICE_PLD_BYTEEN_WIDTH               3
    `define  CSI2_DEVICE_PLD_WIDTH_64

    `define  CSI2_DEVICE_PKT_DATA_REG_WIDTH             (`CSI2_DEVICE_NAP_PLD_WIDTH+32)

`define CSI2_DEVICE_PB_ELASTBUF_DWIDTH                (2+ 1+\
                                                        `CSI2_DEVICE_NAP_PLD_WIDTH+`CSI2_DEVICE_PLD_BYTEEN_WIDTH+1)

// -----------------------------------------------------------
// -- LANE MANEGEMENT
// -----------------------------------------------------------
  `define  CSI2_DEVICE_LM_SHIFT_REG_RS                  (`CSI2_DEVICE_NAP_PLD_WIDTH+`CSI2_DEVICE_SHIFT_REST_REG_RS)

    `define  CSI2_DEVICE_TX_DATA_DIST_RS                  (`CSI2_DEVICE_PHY_LANE0_WIDTH*3 +`CSI2_DEVICE_PHY_LANE3_WIDTH)

  `define CSI2_DEVICE_TX_SHIFT_REG_WIDTH                (2*`CSI2_DEVICE_NAP_PLD_WIDTH)

  `define CSI2_DEVICE_TX_EOTP_SHIFT_RS                  (`CSI2_DEVICE_TX_DATA_DIST_RS+24)

    `define  CSI2_DEVICE_CPHY_SS_ALL_WIDTH                 `CSI2_DEVICE_CPHY_NUM_OF_LANES
  `define  CSI2_DEVICE_LM_ELASTBUF_DWIDTH               (`CSI2_DEVICE_TX_DATA_DIST_RS+\
 `CSI2_DEVICE_CPHY_ALP_HS_RS+`CSI2_DEVICE_CPHY_ALP_CODE_RS+\
 `CSI2_DEVICE_CPHY_SS_ALL_WIDTH+`CSI2_DEVICE_CPHY_NUM_OF_LANES+ `CSI2_DEVICE_CPHY_ST_WIDTH+\
\
\
                                                       `CSI2_DEVICE_LANE_NUM_QST_RST_VAL+1)



// -----------------------------------------------------------
// -- Packet Type
// -----------------------------------------------------------
  `define  CSI2_FRAME_START_CODE            6'h0
  `define  CSI2_FRAME_END_CODE              6'h1
  `define  CSI2_LINE_START_CODE             6'h2
  `define  CSI2_LINE_END_CODE               6'h3

// -----------------------------------------------------------
// -- Data Type
// -----------------------------------------------------------
  `define  CSI2_Y420_8B                     6'h18
  `define  CSI2_Y420_10B                    6'h19
  `define  CSI2_LY420_8B                    6'h1A
  `define  CSI2_CSPS_Y420_8B                6'h1C
  `define  CSI2_CSPS_Y420_10B               6'h1D
  `define  CSI2_Y422_8B                     6'h1E
  `define  CSI2_Y422_10B                    6'h1F

  `define  CSI2_RGB444                      6'h20
  `define  CSI2_RGB555                      6'h21
  `define  CSI2_RGB565                      6'h22
  `define  CSI2_RGB666                      6'h23
  `define  CSI2_RGB888                      6'h24

  `define  CSI2_RAW6                        6'h28
  `define  CSI2_RAW7                        6'h29
  `define  CSI2_RAW8                        6'h2A
  `define  CSI2_RAW10                       6'h2B
  `define  CSI2_RAW12                       6'h2C
  `define  CSI2_RAW14                       6'h2D
  `define  CSI2_RAW16                       6'h2E
  `define  CSI2_RAW20                       6'h2F
  `define  CSI2_RAW24                       6'h27

  `define  CSI2_USER_DEF0                   6'h30
  `define  CSI2_USER_DEF1                   6'h31
  `define  CSI2_USER_DEF2                   6'h32
  `define  CSI2_USER_DEF3                   6'h33
  `define  CSI2_USER_DEF4                   6'h34
  `define  CSI2_USER_DEF5                   6'h35
  `define  CSI2_USER_DEF6                   6'h36
  `define  CSI2_USER_DEF7                   6'h37

  `define  CSI2_EOTP                        32'h0D_00_00_04

  `define CSI2_FLUSH_SR_STAGES 3

    `define CSI2_DEVICE_VC_NUM              32

  `define CSI2_DEVICE_ECC_DWIDTH            26

  `define CSI2_DEVICE_HD_WIDTH             (24+`CSI2_DEVICE_VCX_DWIDTH)

  `define CSI2_DEVICE_HD_ECC_WIDTH         7

  `define CSI2_DEVICE_PL_ECC_WIDTH         8

  `define CSI2_DEVICE_PH_ECC_WIDTH        16

  `define CSI2_DEVICE_HD_FIFO_DWIDTH       (`CSI2_DEVICE_HD_WIDTH+`CSI2_DEVICE_HD_ECC_WIDTH)

// Name:         SSM_BUS_ADDR_SIZE
// Default:      1 Byte
// Values:       1 Byte (0), 2 Bytes (1)
// Enabled:      Always
//
// Indicates the APB Address size. 0 indicates 1 Byte (ssm_paddr[7:0] + 1 bit optional parity), 1 indicates 2 Bytes
// (ssm_paddr[15:0] + 2 bits optional parity)
`define SSM_BUS_ADDR_SIZE 0

// Name:         SSM_BUS_PARITY_TYPE
// Default:      EVEN PARITY
// Values:       NO PARITY (0), EVEN PARITY (1), ODD PARITY (2)
// Enabled:      Always
//
// Indicates the APB Parity.0-No Data Parity Protected for PADDR, PWDATA, PSTRB and PRDATA. 1-Even Byte Parity Protected
// for PADDR, PWDATA, PSTRB and PRDATA.2-Odd Byte Parity Protected for PADDR, PWDATA , PSTRB and PRDATA
`define SSM_BUS_PARITY_TYPE 1

// Name:         SS_CORE_URERR_MON_SIZE
// Default:      32
// Values:       1, ..., 32
// Enabled:      Always
//
// Indicates the Core Unrecoverable monitor signal size. Minimum Size = 1 (2-bit unrecoverable error port input), Maximum
// Size = 32 (32 pairs or 64-bit anti-valent port input), 0 is invalid
`define SS_CORE_URERR_MON_SIZE 6


// Name:         SS_CORE_RERR_MON_SIZE
// Default:      32
// Values:       1, ..., 32
// Enabled:      Always
//
// Indicates the Core recoverable monitor signal size. Minimum Size = 1 (2-bit recoverable error port input), Maximum Size
// = 32 (32 pairs or 64-bit anti-valent port input), 0 is invalid
`define SS_CORE_RERR_MON_SIZE 2


// Name:         SS_CORE_REGPORT_PARITY_TYPE
// Default:      NO CORE PARITY
// Values:       NO CORE PARITY (0), EVEN CORE PARITY (1), ODD CORE PARITY (2)
// Enabled:      Always
//
// Indicates the Core Bus Parity.0-No Data Parity Protected for Core Diagnostic Registers. 1-Even Byte Parity Protected for
// Core Diagnostic Registers.2-Odd Byte Parity Protected for Core Diagnostic Registers
`define SS_CORE_REGPORT_PARITY_TYPE 1


// Name:         SS_COREDIAG_WIDTH
// Default:      36 ((SS_CORE_REGPORT_PARITY_TYPE!=0) ? 36 : 32)
// Values:       -2147483648, ..., 2147483647
//
// Core diagnostic and version port width
`define SS_COREDIAG_WIDTH 36


// Name:         SS_PAUSER_WIDTH
// Default:      5 ((SSM_BUS_PARITY_TYPE!=0) ? ((SSM_BUS_ADDR_SIZE==0) ? 5 : 6) : 4)
// Values:       -2147483648, ..., 2147483647
//
// paddr user signal width
`define SS_PAUSER_WIDTH 5


// Name:         SS_PRUSER_WIDTH
// Default:      6 ((SSM_BUS_PARITY_TYPE!=0) ? 6 : 2)
// Values:       -2147483648, ..., 2147483647
//
// paddr user signal width
`define SS_PRUSER_WIDTH 6

`define DW_SS_HAS_PARITY

`define SS_CORE_HAS_PARITY

`define CORE_HAS_DIAG_REG0

`define CORE_HAS_DIAG_REG1

`define CORE_HAS_DIAG_REG2

`define CORE_HAS_DIAG_REG3

`define CORE_HAS_DIAG_REG4

`define CORE_HAS_DIAG_REG5

`define CORE_HAS_DIAG_REG6

`define CORE_HAS_DIAG_REG7

`define CORE_HAS_DIAG_REG8

`define CORE_HAS_DIAG_REG9

`define CORE_HAS_DIAG_REG10

`define CORE_HAS_DIAG_REG11

`define CORE_HAS_DIAG_REG12

`define CORE_HAS_DIAG_REG13

`define CORE_HAS_DIAG_REG14

`define CORE_HAS_DIAG_REG15

`define CORE_HAS_DIAG_REG16

`define CORE_HAS_DIAG_REG17

`define CORE_HAS_DIAG_REG18

`define CORE_HAS_DIAG_REG19

`define CORE_HAS_DIAG_REG20

`define CORE_HAS_DIAG_REG21

`define CORE_HAS_DIAG_REG22

`define CORE_HAS_DIAG_REG23

`define CORE_HAS_DIAG_REG24

`define CORE_HAS_DIAG_REG25

`define CORE_HAS_DIAG_REG26

`define CORE_HAS_DIAG_REG27

`define CORE_HAS_DIAG_REG28

`define CORE_HAS_DIAG_REG29

`define CORE_HAS_DIAG_REG30

`define CORE_HAS_DIAG_REG31

`define CORE_HAS_DIAG_REG32

`define CORE_HAS_DIAG_REG33

`define CORE_HAS_DIAG_REG34

`define CORE_HAS_DIAG_REG35

`define CORE_HAS_DIAG_REG36

`define CORE_HAS_DIAG_REG37

`define CORE_HAS_DIAG_REG38

`define CORE_HAS_DIAG_REG39

`define CORE_HAS_DIAG_REG40

`define CORE_HAS_DIAG_REG41

`define CORE_HAS_DIAG_REG42

`define APB_DATA_WIDTH 32

// Name:         SS_INCLUDE_BCM_VERIFY_MODULES
// Default:      0
// Values:       0, 1
// Enabled:      Always
//
// To include bcm verification modules
`define SS_INCLUDE_BCM_VERIFY_MODULES 0


// Name:         F_S2C_SYNC_TYPE
// Default:      2
// Values:       2, ..., 4
// Enabled:      Always
//
// Depth of BCM data bus synchronizers From APB Clock domain to Core Clock domain
`define F_S2C_SYNC_TYPE `CSI2_DEVICE_DFLT_F_SYNC_TYPE


// Name:         F_C2S_SYNC_TYPE
// Default:      2
// Values:       2, ..., 4
// Enabled:      Always
//
// Depth of BCM data bus synchronizers From Core Clock domain to APB Clock domain
`define F_C2S_SYNC_TYPE `CSI2_DEVICE_DFLT_F_SYNC_TYPE


`define CORE_HAS_DIAG1_SET

`define CORE_HAS_DIAG0_SET

//-------------------------------------------------------------
// SAFETY COMMON PARAMS
//-------------------------------------------------------------
`define SFTY_HI   2'b01
`define SFTY_LO   2'b10

//-------------------------------------------------------------
//SSM State machine params
//-------------------------------------------------------------
`define  DEFAULT       7'b0000001
`define  SETUP_PH      7'b0000010
`define  WRITE_PH      7'b0000100
`define  READ_PH       7'b0001000
`define  WAIT_DONE     7'b0010000
`define  WRITE_WAIT    7'b0100000
`define  READ_WAIT     7'b1000000

`define  M_SSM_BUS_ADDR_SIZE             ((`SSM_BUS_ADDR_SIZE+1)*8)             //0-1 Byte (ssm_paddr[7:0]
                                                                                         //1-2 Bytes (ssm_paddr[15:0]

`define  M_SSM_BUS_PARITY_TYPE           `SSM_BUS_PARITY_TYPE                   //0-No Data Parity Protected for PADDR, PWDATA, PSTRB and PRDATA
                                                                                         //1-Even Byte Parity Protected for PADDR, PWDATA, PSTRB and PRDATA
                                                                                         //2-Odd Byte Parity Protected for PADDR, PWDATA , PSTRB and PRDATA
`define  M_SS_CORE_PARITY_TYPE           `SS_CORE_REGPORT_PARITY_TYPE          //0-No Data Parity Protected for Core Diagnostic Register inputs
                                                                                        //1-Even Byte Parity Protected for Core Diagnostic Register inputs
                                                                                        //2-Odd Byte Parity Protected for Core Diagnostic Register inputs
`define  M_SS_CORE_REG_DEPTH             `SS_CORE_REG_DEPTH                     //Minimum Depth = 1, Maximum Depth = 64 (including core version register and diagnostic registers)

`define  M_SS_CORE_REG_START_OFFSET      `SS_CORE_REG_START_OFFSET              //This parameter is used to select the starting offset of the core diagnostic register.
                                                                                         //Minimum Value = 0x20, Maximum = (based on the SSM_BUS_ADDR_SIZE)
`define  M_SS_CORE_URERR_MON_SIZE        (`SS_CORE_URERR_MON_SIZE*2)              //Minimum Size = 1 (2-bit unrecoverable error port input), Maximum Size = 32 (32 pairs or 64-bit anti-valent port input)
                                                                                         //0-Invalid
`define  M_SS_CORE_RERR_MON_SIZE         (`SS_CORE_RERR_MON_SIZE*2)                //Minimum Size = 1 (2-bit unrecoverable error port input), Maximum Size = 32 (32 pairs or 64-bit anti-valent port input)

`define  SS_CORE_DIAG_REG52_63 ((`M_SSM_BUS_ADDR_SIZE <= 16) ? 16 : `M_SSM_BUS_ADDR_SIZE) //width of parameter S_CORE_DIAG_REG52 to S_CORE_DIAG_REG63; applicable when M_SSM_BUS_ADDR_SIZE = 16






//Revision: $Id: APP_device_constants.vh 1 2023/12/24 06:48:27 GMT qiupeng Exp $
