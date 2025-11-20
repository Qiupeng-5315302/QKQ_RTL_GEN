
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

`define _GUARD_APP_DEVICE_CC_CONSTANTS_

// Changeable parameters via GUI


// Name:         CSI2_DEVICE_AP
// Default:      0
// Values:       0, 1
// 
// Enable Automotive Package 
// To generate a DWC_mipicsi2_device controller with support for automotive package, you must have an associated 
// DWC_ap_mipicsi2_device license.
`define CSI2_DEVICE_AP


// Name:         CSI2_DEVICE_DFLT_F_SYNC_TYPE
// Default:      2
// Values:       2 3 4
// 
// This parameter selects the number of synchronization stages used for clock domain crossing. 
//  
// All stages capture the data on the rising edge of the clock.
`define CSI2_DEVICE_DFLT_F_SYNC_TYPE 2


// Name:         CSI2_DEVICE_DATAINTERFACE
// Default:      IDI
// Values:       IDI (1), IPI (2), IDI&IPI (3), SDI (4)
// 
// This parameter specifies the system data interface: 
//  - IDI: Image Data Interface 
//  - IPI: Image Pixel Interface 
//  - IDI&IPI: Both IDI and IPI interfaces 
//  - SDI: Stream Data Interface
`define CSI2_DEVICE_DATAINTERFACE


// Name:         CSI2_DEVICE_VPG
// Default:      1
// Values:       0, 1
// 
// VPG enable, active high.
`define CSI2_DEVICE_VPG


// Name:         CSI2_DEVICE_IDI_IF
// Default:      1 ((CSI2_DEVICE_DATAINTERFACE == 1)||(CSI2_DEVICE_DATAINTERFACE == 
//               3))
// Values:       0, 1
// 
// When set, it means Image Data Interface is present.
`define CSI2_DEVICE_IDI_IF


// Name:         CSI2_DEVICE_IPI_IF
// Default:      0 ((CSI2_DEVICE_DATAINTERFACE == 2)||(CSI2_DEVICE_DATAINTERFACE == 
//               3))
// Values:       0, 1
// 
// When set, it means Image Pixel Interface is present.
// `define CSI2_DEVICE_IPI_IF


// Name:         CSI2_DEVICE_SDI_IF
// Default:      0 (CSI2_DEVICE_DATAINTERFACE == 4)
// Values:       0, 1
// 
// When set, it means Stream Data Interface is present.
// `define CSI2_DEVICE_SDI_IF


// Name:         CSI2_DEVICE_NR_IPI
// Default:      1
// Values:       1 2 3 4
// Enabled:      CSI2_DEVICE_DATAINTERFACE == 2
// 
// This parameter specifies the Number of IPI interfaces in the controller.
`define CSI2_DEVICE_NR_IPI 1


// Name:         CSI2_DEVICE_IPI2_IF
// Default:      0 (CSI2_DEVICE_NR_IPI >= 2)
// Values:       0, 1
// 
// CSI2_DEVICE_IPI_IF2: 
// When set, it means Image Pixel Interface 2 is present.
// `define CSI2_DEVICE_IPI2_IF


// Name:         CSI2_DEVICE_IPI3_IF
// Default:      0 (CSI2_DEVICE_NR_IPI >= 3)
// Values:       0, 1
// 
// CSI2_DEVICE_IPI_IF3: 
// When set, it means Image Pixel Interface 3 is present.
// `define CSI2_DEVICE_IPI3_IF


// Name:         CSI2_DEVICE_IPI4_IF
// Default:      0 (CSI2_DEVICE_NR_IPI >= 4)
// Values:       0, 1
// 
// CSI2_DEVICE_IPI_IF3: 
// When set, it means Image Pixel Interface 3 is present.
// `define CSI2_DEVICE_IPI4_IF


// Name:         CSI2_DEVICE_IDI_IPI_IF
// Default:      0 (CSI2_DEVICE_DATAINTERFACE == 3)
// Values:       0, 1
// 
// When set, it means IDI and IPI are both present. By default, simultaneous working mode are supported.
// `define CSI2_DEVICE_IDI_IPI_IF


// Name:         CSI2_DEVICE_MULTI_IF
// Default:      0 ((CSI2_DEVICE_IDI_IPI_IF == 1)||(CSI2_DEVICE_NR_IPI >= 2))
// Values:       0, 1
// 
// CSI2_DEVICE_IDI_IPI_IF: 
// When set, it means Multiple interfaces are present.
// `define CSI2_DEVICE_MULTI_IF


// Name:         CSI2_DEVICE_IPI_LANE_NUM
// Default:      48BIT
// Values:       48BIT (1), 192BIT (4)
// Enabled:      ((CSI2_DEVICE_DATAINTERFACE == 2)||(CSI2_DEVICE_DATAINTERFACE == 
//               3))
// 
// This parameter specifies the Data Width of IPI interfaces.
`define CSI2_DEVICE_IPI_LANE_NUM 1


// Name:         CSI2_DEVICE_IDI_DATA_WIDTH
// Default:      64BIT
// Values:       64BIT (64), 128BIT (128)
// Enabled:      ((CSI2_DEVICE_DATAINTERFACE == 1)||(CSI2_DEVICE_DATAINTERFACE == 
//               3))
// 
// This parameter specifies the Data Width of IDI Interfaces
`define CSI2_DEVICE_IDI_DATA_WIDTH 128


// Name:         CSI2_DEVICE_IPI_MULTI_LANE
// Default:      0 (CSI2_DEVICE_IPI_LANE_NUM > 1)
// Values:       0, 1
// 
// CSI2_DEVICE_IPI_LANE3: 
// Image Pixel Interface Lane3 exists.
// `define CSI2_DEVICE_IPI_MULTI_LANE


// Name:         CSI2_DEVICE_DATA_SCRAMBLING
// Default:      1
// Values:       0, 1
// 
// Data scrambling enable, active high.
`define CSI2_DEVICE_DATA_SCRAMBLING


// Name:         CSI2_DEVICE_IDI_IPI_OR_MULTI_IPI
// Default:      0 ((CSI2_DEVICE_IDI_IPI_IF == 1)||(CSI2_DEVICE_IPI2_IF == 1))
// Values:       0, 1
// 
// When set, it means IDI and IPI are both present or Multiple Image Pixel Interface is present
// `define CSI2_DEVICE_IDI_IPI_OR_MULTI_IPI


// Name:         CSI2_DEVICE_EXT_RAM_TYPE
// Default:      DPRAM
// Values:       DPRAM (1), SPRAM (2)
// Enabled:      ((CSI2_DEVICE_DATAINTERFACE == 1)||(CSI2_DEVICE_DATAINTERFACE == 
//               2)||(CSI2_DEVICE_DATAINTERFACE == 3))
// 
// This parameter specifies External RAM Type: 
//  - DPRAM: Dual-port synchronous RAMs 
//  - SPRAM: Single-port synchronous RAMs
`define CSI2_DEVICE_EXT_RAM_TYPE


// Name:         CSI2_DEVICE_USE_DPRAM
// Default:      1 (CSI2_DEVICE_EXT_RAM_TYPE == 1)
// Values:       0, 1
// 
// When set, it means to select DPRAM for external payload RAM
`define CSI2_DEVICE_USE_DPRAM


// Name:         CSI2_DEVICE_USE_SPRAM
// Default:      0 (CSI2_DEVICE_EXT_RAM_TYPE == 2)
// Values:       0, 1
// 
// When set, it means to select SPRAM for external payload RAM
// `define CSI2_DEVICE_USE_SPRAM


// Name:         CSI2_DEVICE_IDI_PLD_FIFO_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_DPRAM == 1) && (CSI2_DEVICE_IDI_IF == 1))
// 
// This parameter specifies the depth of the IDI payload FIFO. This FIFO requires an external asynchronous DPRAM.
`define CSI2_DEVICE_IDI_PLD_FIFO_DEPTH 2048


// Name:         CSI2_DEVICE_IDI_PLD_RAM_DEPTH
// Default:      2048 ([<functionof> CSI2_DEVICE_IDI_PLD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter specifies the depth of the RAM required for the IDI payload FIFO. 
//  - If value of CSI2_DEVICE_IDI_PLD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IDI_PLD_RAM_DEPTH is required 
//  to be (CSI2_DEVICE_IDI_PLD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IDI_PLD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IDI_PLD_RAM_DEPTH is required to be (CSI2_DEVICE_IDI_PLD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IDI_PLD_RAM_DEPTH 2048


// Name:         CSI2_DEVICE_IDI_HD_FIFO_DEPTH
// Default:      8
// Values:       4, ..., 256
// Enabled:      CSI2_DEVICE_IDI_IF == 1
// 
// This parameter specifies the depth of the IDI header FIFO. This FIFO is implemented with logic gates (flip-flops).
`define CSI2_DEVICE_IDI_HD_FIFO_DEPTH 8


// Name:         CSI2_DEVICE_IDI_HD_RAM_DEPTH
// Default:      8 ([<functionof> CSI2_DEVICE_IDI_HD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter is the depth of the memory required for the IDI header FIFO. 
//  - If value of CSI2_DEVICE_IDI_HD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IDI_HD_RAM_DEPTH is required to 
//  be (CSI2_DEVICE_IDI_HD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IDI_HD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IDI_HD_RAM_DEPTH is required to be (CSI2_DEVICE_IDI_HD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IDI_HD_RAM_DEPTH 8


// Name:         CSI2_DEVICE_IPI_PLD_FIFO_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_DPRAM == 1) && (CSI2_DEVICE_IPI_IF == 1))
// 
// This parameter is the depth of the IPI payload FIFO. This FIFO requires an external asynchronous DPRAM.
`define CSI2_DEVICE_IPI_PLD_FIFO_DEPTH 1024


// Name:         CSI2_DEVICE_IPI_PLD_RAM_DEPTH
// Default:      1024 ([<functionof> CSI2_DEVICE_IPI_PLD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter is the depth of the RAM required for IPI payload FIFO. 
//  - If value of CSI2_DEVICE_IPI_PLD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI_PLD_RAM_DEPTH is required 
//  to be (CSI2_DEVICE_IPI_PLD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IPI_PLD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI_PLD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI_PLD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI_PLD_RAM_DEPTH 1024


// Name:         CSI2_DEVICE_IPI_HD_FIFO_DEPTH
// Default:      8
// Values:       8, ..., 256
// Enabled:      CSI2_DEVICE_IPI_IF == 1
// 
// The parameter specifies the depth of the IPI header FIFO. This FIFO is implemented with logic gates (flip-flops).
`define CSI2_DEVICE_IPI_HD_FIFO_DEPTH 8


// Name:         CSI2_DEVICE_IPI_HD_RAM_DEPTH
// Default:      8 ([<functionof> CSI2_DEVICE_IPI_HD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter is the depth of the memory required for IPI header FIFO. 
//  - If value of CSI2_DEVICE_IPI_HD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI_HD_RAM_DEPTH is required to 
//  be (CSI2_DEVICE_IPI_HD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IPI_HD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI_HD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI_HD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI_HD_RAM_DEPTH 8


// Name:         CSI2_DEVICE_IPI2_PLD_FIFO_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_DPRAM == 1) && (CSI2_DEVICE_IPI2_IF == 1))
// 
// This parameter is the depth of the IPI2 payload FIFO. This FIFO requires an external asynchronous DPRAM.
`define CSI2_DEVICE_IPI2_PLD_FIFO_DEPTH 1024


// Name:         CSI2_DEVICE_IPI2_PLD_RAM_DEPTH
// Default:      1024 ([<functionof> CSI2_DEVICE_IPI2_PLD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter is the depth of the RAM required for IPI2 payload FIFO. 
//  - If value of CSI2_DEVICE_IPI2_PLD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI2_PLD_RAM_DEPTH is 
//  required to be (CSI2_DEVICE_IPI2_PLD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IPI2_PLD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI2_PLD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI2_PLD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI2_PLD_RAM_DEPTH 1024


// Name:         CSI2_DEVICE_IPI2_HD_FIFO_DEPTH
// Default:      8
// Values:       8, ..., 256
// Enabled:      CSI2_DEVICE_IPI2_IF == 1
// 
// This parameter specifies the depth of the IPI2 header FIFO. This FIFO is implemented with logic gates (flip-flops).
`define CSI2_DEVICE_IPI2_HD_FIFO_DEPTH 8


// Name:         CSI2_DEVICE_IPI2_HD_RAM_DEPTH
// Default:      8 ([<functionof> CSI2_DEVICE_IPI2_HD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// Depth of the memory required for IPI2 header FIFO. 
//  - If value of CSI2_DEVICE_IPI2_HD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI2_HD_RAM_DEPTH is required 
//  to be (CSI2_DEVICE_IPI2_HD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IPI2_HD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI2_HD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI2_HD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI2_HD_RAM_DEPTH 8


// Name:         CSI2_DEVICE_IPI3_PLD_FIFO_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_DPRAM == 1) && (CSI2_DEVICE_IPI3_IF == 1))
// 
// This parameter specifies the depth of the IPI3 payload FIFO. This FIFO requires an external asynchronous DPRAM.
`define CSI2_DEVICE_IPI3_PLD_FIFO_DEPTH 1024


// Name:         CSI2_DEVICE_IPI3_PLD_RAM_DEPTH
// Default:      1024 ([<functionof> CSI2_DEVICE_IPI3_PLD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// Depth of the RAM required for IPI3 payload FIFO. 
//  If tvalue of CSI2_DEVICE_IPI3_PLD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI3_PLD_RAM_DEPTH is required 
//  to be (CSI2_DEVICE_IPI3_PLD_FIFO_DEPTH + 1). 
//  If value of CSI2_DEVICE_IPI3_PLD_FIFO_DEPTH parameter is even value but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI3_PLD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI3_PLD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI3_PLD_RAM_DEPTH 1024


// Name:         CSI2_DEVICE_IPI3_HD_FIFO_DEPTH
// Default:      8
// Values:       8, ..., 256
// Enabled:      CSI2_DEVICE_IPI3_IF == 1
// 
// This parameter is the depth of the IPI3 header FIFO. This FIFO is implemented with logic gates (flip-flops).
`define CSI2_DEVICE_IPI3_HD_FIFO_DEPTH 8


// Name:         CSI2_DEVICE_IPI3_HD_RAM_DEPTH
// Default:      8 ([<functionof> CSI2_DEVICE_IPI3_HD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// Depth of the memory required for IPI3 header FIFO. 
//  - If value of CSI2_DEVICE_IPI3_HD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI3_HD_RAM_DEPTH is required 
//  to be (CSI2_DEVICE_IPI3_HD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IPI3_HD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI3_HD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI3_HD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI3_HD_RAM_DEPTH 8


// Name:         CSI2_DEVICE_IPI4_PLD_FIFO_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_DPRAM == 1) && (CSI2_DEVICE_IPI4_IF == 1))
// 
// This parameter specifies the depth of the IPI4 payload FIFO. This FIFO requires an external asynchronous DPRAM.
`define CSI2_DEVICE_IPI4_PLD_FIFO_DEPTH 1024


// Name:         CSI2_DEVICE_IPI4_PLD_RAM_DEPTH
// Default:      1024 ([<functionof> CSI2_DEVICE_IPI4_PLD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter is the depth of the RAM required for IPI4 payload FIFO. 
//  - If value of CSI2_DEVICE_IPI4_PLD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI4_PLD_RAM_DEPTH is 
//  required to be (CSI2_DEVICE_IPI4_PLD_FIFO_DEPTH + 1). 
//  - If value of CSI2_DEVICE_IPI4_PLD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI4_PLD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI4_PLD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI4_PLD_RAM_DEPTH 1024


// Name:         CSI2_DEVICE_IPI4_HD_FIFO_DEPTH
// Default:      8
// Values:       8, ..., 256
// Enabled:      CSI2_DEVICE_IPI4_IF == 1
// 
// This parameter is the depth of the IPI4 header FIFO. This FIFO is implemented with logic gates (flip-flops).
`define CSI2_DEVICE_IPI4_HD_FIFO_DEPTH 8


// Name:         CSI2_DEVICE_IPI4_HD_RAM_DEPTH
// Default:      8 ([<functionof> CSI2_DEVICE_IPI4_HD_FIFO_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// Depth of the memory required for IPI4 header FIFO. 
//  - If the of CSI2_DEVICE_IPI4_HD_FIFO_DEPTH parameter is odd, the value of CSI2_DEVICE_IPI4_HD_RAM_DEPTH is required to 
//  be (CSI2_DEVICE_IPI4_HD_FIFO_DEPTH + 1). 
//  - If the of CSI2_DEVICE_IPI4_HD_FIFO_DEPTH parameter is even but not an integer power of two, the value of 
//  CSI2_DEVICE_IPI4_HD_RAM_DEPTH is required to be (CSI2_DEVICE_IPI4_HD_FIFO_DEPTH + 2).
`define CSI2_DEVICE_IPI4_HD_RAM_DEPTH 8


// Name:         CSI2_DEVICE_IDI_PLD_PUSH_AF_LVL
// Default:      4 (CSI2_DEVICE_AP+3)
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IDI payload fifo.
`define CSI2_DEVICE_IDI_PLD_PUSH_AF_LVL 4


// Name:         CSI2_DEVICE_IDI_PLD_FIFO_TOTAL_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IDI_IF == 1))
// 
// This parameter specifies the total depth of the IDI payload FIFO. This FIFO requires two external SPRAM. 
// Provided value must be a multiple of 2.  
//  
// The total depth includes: 
//  - External RAM depth. 
//  - Internal CDC FIFO depth which is based on the level of almost full and cdc sync stage.
`define CSI2_DEVICE_IDI_PLD_FIFO_TOTAL_DEPTH 1024


// Name:         CSI2_DEVICE_IDI_PLD_FIFO_CDC_FIFO_DEPTH
// Default:      14 ([<functionof> CSI2_DEVICE_IDI_PLD_PUSH_AF_LVL 
//               CSI2_DEVICE_DFLT_F_SYNC_TYPE ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IDI_IF == 1))
// 
// This parameter specifies the depth of CDC FIFO used in IDI payload FIFO. The value must be larger than 
// CSI2_DEVICE_IDI_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IDI_PLD_FIFO_CDC_FIFO_DEPTH 14


// Name:         CSI2_DEVICE_IDI_PLD_FIFO_PTP_DEPTH
// Default:      1010 (CSI2_DEVICE_IDI_PLD_FIFO_TOTAL_DEPTH - 
//               CSI2_DEVICE_IDI_PLD_FIFO_CDC_FIFO_DEPTH)
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IDI_IF == 1))
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IDI payload FIFO. The value must 
// be larger than CSI2_DEVICE_IDI_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IDI_PLD_FIFO_PTP_DEPTH 1010


// Name:         CSI2_DEVICE_IDI_PLD_PTP_SPRAM_DEPTH
// Default:      1012 ([<functionof> CSI2_DEVICE_IDI_PLD_FIFO_PTP_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IDI payload FIFO. 
// This depth should be equally divided by the external odd and even ram.
`define CSI2_DEVICE_IDI_PLD_PTP_SPRAM_DEPTH 1012


// Name:         CSI2_DEVICE_IPI_PLD_PUSH_AF_LVL
// Default:      6 (CSI2_DEVICE_AP+5)
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI payload fifo.
`define CSI2_DEVICE_IPI_PLD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IPI_PLD_FIFO_TOTAL_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI_IF == 1))
// 
// This parameter specifies the total depth of the IPI payload FIFO. This FIFO requires two external SPRAM. 
// Provided value must be a multiple of 2.  
//  
// The total depth includes: 
//  - External RAM depth. 
//  - Internal CDC FIFO depth which is based on the level of almost full and cdc sync stage.
`define CSI2_DEVICE_IPI_PLD_FIFO_TOTAL_DEPTH 1024


// Name:         CSI2_DEVICE_IPI_PLD_FIFO_CDC_FIFO_DEPTH
// Default:      16 ([<functionof> CSI2_DEVICE_IPI_PLD_PUSH_AF_LVL 
//               CSI2_DEVICE_DFLT_F_SYNC_TYPE ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI_IF == 1))
// 
// This parameter specifies the depth of CDC FIFO used in IPI payload FIFO. The value must be larger than 
// CSI2_DEVICE_IPI_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI_PLD_FIFO_CDC_FIFO_DEPTH 16


// Name:         CSI2_DEVICE_IPI_PLD_FIFO_PTP_DEPTH
// Default:      1008 (CSI2_DEVICE_IPI_PLD_FIFO_TOTAL_DEPTH - 
//               CSI2_DEVICE_IPI_PLD_FIFO_CDC_FIFO_DEPTH)
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI_IF == 1))
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI payload FIFO. The value must 
// be larger than CSI2_DEVICE_IPI_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI_PLD_FIFO_PTP_DEPTH 1008


// Name:         CSI2_DEVICE_IPI_PLD_PTP_SPRAM_DEPTH
// Default:      1010 ([<functionof> CSI2_DEVICE_IPI_PLD_FIFO_PTP_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI payload FIFO. 
// This depth should be equally divided by the external odd and even ram.
`define CSI2_DEVICE_IPI_PLD_PTP_SPRAM_DEPTH 1010


// Name:         CSI2_DEVICE_IPI2_PLD_PUSH_AF_LVL
// Default:      6 (CSI2_DEVICE_AP+5)
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI2 payload fifo.
`define CSI2_DEVICE_IPI2_PLD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IPI2_PLD_FIFO_TOTAL_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI2_IF == 1))
// 
// This parameter specifies the total depth of the IPI2 payload FIFO. This FIFO requires two external SPRAM. 
// Provided value must be a multiple of 2.  
//  
// The total depth includes: 
//  - External RAM depth. 
//  - Internal CDC FIFO depth which is based on the level of almost full and cdc sync stage.
`define CSI2_DEVICE_IPI2_PLD_FIFO_TOTAL_DEPTH 1024


// Name:         CSI2_DEVICE_IPI2_PLD_FIFO_CDC_FIFO_DEPTH
// Default:      16 ([<functionof> CSI2_DEVICE_IPI2_PLD_PUSH_AF_LVL 
//               CSI2_DEVICE_DFLT_F_SYNC_TYPE ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI2_IF == 1))
// 
// This parameter specifies the depth of CDC FIFO used in IPI2 payload FIFO. The value must be larger than 
// CSI2_DEVICE_IPI2_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI2_PLD_FIFO_CDC_FIFO_DEPTH 16


// Name:         CSI2_DEVICE_IPI2_PLD_FIFO_PTP_DEPTH
// Default:      1008 (CSI2_DEVICE_IPI2_PLD_FIFO_TOTAL_DEPTH - 
//               CSI2_DEVICE_IPI2_PLD_FIFO_CDC_FIFO_DEPTH)
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI2_IF == 1))
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI2 payload FIFO. The value must 
// be larger than CSI2_DEVICE_IPI2_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI2_PLD_FIFO_PTP_DEPTH 1008


// Name:         CSI2_DEVICE_IPI2_PLD_PTP_SPRAM_DEPTH
// Default:      1010 ([<functionof> CSI2_DEVICE_IPI2_PLD_FIFO_PTP_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI2 payload FIFO. 
// This depth should be equally divided by the external odd and even ram.
`define CSI2_DEVICE_IPI2_PLD_PTP_SPRAM_DEPTH 1010


// Name:         CSI2_DEVICE_IPI3_PLD_PUSH_AF_LVL
// Default:      6 (CSI2_DEVICE_AP+5)
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI3 payload fifo.
`define CSI2_DEVICE_IPI3_PLD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IPI3_PLD_FIFO_TOTAL_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI3_IF == 1))
// 
// This parameter specifies the total depth of the IPI3 payload FIFO. This FIFO requires two external SPRAM. 
// Provided value must be a multiple of 2.  
//  
// The total depth includes: 
//  - External RAM depth. 
//  - Internal CDC FIFO depth which is based on the level of almost full and cdc sync stage.
`define CSI2_DEVICE_IPI3_PLD_FIFO_TOTAL_DEPTH 1024


// Name:         CSI2_DEVICE_IPI3_PLD_FIFO_CDC_FIFO_DEPTH
// Default:      16 ([<functionof> CSI2_DEVICE_IPI3_PLD_PUSH_AF_LVL 
//               CSI2_DEVICE_DFLT_F_SYNC_TYPE ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI3_IF == 1))
// 
// This parameter specifies the depth of CDC FIFO used in IPI3 payload FIFO. The value must be larger than 
// CSI2_DEVICE_IPI3_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI3_PLD_FIFO_CDC_FIFO_DEPTH 16


// Name:         CSI2_DEVICE_IPI3_PLD_FIFO_PTP_DEPTH
// Default:      1008 (CSI2_DEVICE_IPI3_PLD_FIFO_TOTAL_DEPTH - 
//               CSI2_DEVICE_IPI3_PLD_FIFO_CDC_FIFO_DEPTH)
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI3_IF == 1))
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI3 payload FIFO. The value must 
// be larger than CSI2_DEVICE_IPI3_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI3_PLD_FIFO_PTP_DEPTH 1008


// Name:         CSI2_DEVICE_IPI3_PLD_PTP_SPRAM_DEPTH
// Default:      1010 ([<functionof> CSI2_DEVICE_IPI3_PLD_FIFO_PTP_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI3 payload FIFO. 
// This depth should be equally divided by the external odd and even ram.
`define CSI2_DEVICE_IPI3_PLD_PTP_SPRAM_DEPTH 1010


// Name:         CSI2_DEVICE_IPI4_PLD_PUSH_AF_LVL
// Default:      6 (CSI2_DEVICE_AP+5)
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI4 payload fifo.
`define CSI2_DEVICE_IPI4_PLD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IPI4_PLD_FIFO_TOTAL_DEPTH
// Default:      1024
// Values:       128, ..., 16384
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI4_IF == 1))
// 
// This parameter specifies the total depth of the IPI4 payload FIFO. This FIFO requires two external SPRAM. 
// Provided value must be a multiple of 2.  
//  
// The total depth includes: 
//  - External RAM depth. 
//  - Internal CDC FIFO depth which is based on the level of almost full and cdc sync stage.
`define CSI2_DEVICE_IPI4_PLD_FIFO_TOTAL_DEPTH 1024


// Name:         CSI2_DEVICE_IPI4_PLD_FIFO_CDC_FIFO_DEPTH
// Default:      16 ([<functionof> CSI2_DEVICE_IPI4_PLD_PUSH_AF_LVL 
//               CSI2_DEVICE_DFLT_F_SYNC_TYPE ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI4_IF == 1))
// 
// This parameter specifies the depth of CDC FIFO used in IPI4 payload FIFO. The value must be larger than 
// CSI2_DEVICE_IPI4_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI4_PLD_FIFO_CDC_FIFO_DEPTH 16


// Name:         CSI2_DEVICE_IPI4_PLD_FIFO_PTP_DEPTH
// Default:      1008 (CSI2_DEVICE_IPI4_PLD_FIFO_TOTAL_DEPTH - 
//               CSI2_DEVICE_IPI4_PLD_FIFO_CDC_FIFO_DEPTH)
// Values:       -2147483648, ..., 2147483647
// Enabled:      ((CSI2_DEVICE_USE_SPRAM == 1) && (CSI2_DEVICE_IPI4_IF == 1))
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI4 payload FIFO. The value must 
// be larger than CSI2_DEVICE_IPI4_PLD_PUSH_AF_LVL.
`define CSI2_DEVICE_IPI4_PLD_FIFO_PTP_DEPTH 1008


// Name:         CSI2_DEVICE_IPI4_PLD_PTP_SPRAM_DEPTH
// Default:      1010 ([<functionof> CSI2_DEVICE_IPI4_PLD_FIFO_PTP_DEPTH ])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// This parameter specifies the depth of RAM to the underlying PTP RAM controller of the IPI4 payload FIFO. 
// This depth should be equally divided by the external odd and even ram.
`define CSI2_DEVICE_IPI4_PLD_PTP_SPRAM_DEPTH 1010


// Name:         CSI2_DEVICE_SNPS_PHY
// Default:      0
// Values:       0, 1
// 
// This parameter enables the Synopsys D-PHY as an internal sub-module in the design. 
//  
// You need to have access to the Synopsys D-PHY package and set up the following variables: 
//  - setenv CSI2_DEVICE_PHY_PATH <path where D-PHY is installed> 
//  - setenv CSI2_DEVICE_PLL_PATH <path where D-PHY is installed> 
//  - setenv CSI2_DEVICE_PHY_LIBNAME <.lib file name> 
//  - setenv CSI2_DEVICE_PLL_LIBNAME <.lib file name>
// `define CSI2_DEVICE_SNPS_PHY


// Name:         CSI2_DEVICE_PHY_TYPE
// Default:      D-PHY
// Values:       D-PHY (1), C-PHY (2), COMBO_PHY (3)
// Enabled:      CSI2_DEVICE_SNPS_PHY == 0
// 
// This parameter specifies the PHY interface used in the design.
`define CSI2_DEVICE_PHY_TYPE 3


// Name:         CSI2_DEVICE_COMBO_PHY_CONFIG
// Default:      4L3T
// Values:       4L3T (1), 2L2T (2)
// Enabled:      CSI2_DEVICE_PHY_TYPE == 3
`define CSI2_DEVICE_COMBO_PHY_CONFIG 1


// Name:         CSI2_DEVICE_DPHY_TYPE
// Default:      1 ((CSI2_DEVICE_PHY_TYPE == 1)||(CSI2_DEVICE_PHY_TYPE == 3))
// Values:       0, 1
// Enabled:      ((CSI2_DEVICE_PHY_TYPE == 1)||(CSI2_DEVICE_PHY_TYPE == 3))
`define CSI2_DEVICE_DPHY_TYPE


// Name:         CSI2_DEVICE_CPHY_TYPE
// Default:      1 ((CSI2_DEVICE_PHY_TYPE == 2)||(CSI2_DEVICE_PHY_TYPE == 3))
// Values:       0, 1
// Enabled:      ((CSI2_DEVICE_PHY_TYPE == 2)||(CSI2_DEVICE_PHY_TYPE == 3))
`define CSI2_DEVICE_CPHY_TYPE


// Name:         CSI2_DEVICE_DPHY_WIDTH_MODE
// Default:      8BIT
// Values:       8BIT (1), 16BIT (2), 32BIT (3)
// Enabled:      ((CSI2_DEVICE_DPHY_TYPE)&(CSI2_DEVICE_SNPS_PHY == 0))
`define CSI2_DEVICE_DPHY_WIDTH_MODE 1


// Name:         CSI2_DEVICE_DPHY_NUM_OF_LANES
// Default:      4 ((CSI2_DEVICE_COMBO_PHY_CONFIG == 2) ? 2 : 4)
// Values:       1 2 3 4 5 6 7 8
// Enabled:      CSI2_DEVICE_PHY_TYPE == 1
// 
// This parameter specifies the maximum number of data lanes supported by the D-PHY.
`define CSI2_DEVICE_DPHY_NUM_OF_LANES 4


// Name:         CSI2_DEVICE_DPHY_8BIT_MODE
// Default:      1 ((CSI2_DEVICE_DPHY_TYPE) & (CSI2_DEVICE_DPHY_WIDTH_MODE >= 1))
// Values:       0, 1
`define CSI2_DEVICE_DPHY_8BIT_MODE


// Name:         CSI2_DEVICE_DPHY_16BIT_MODE
// Default:      0 ((CSI2_DEVICE_DPHY_TYPE) & (CSI2_DEVICE_DPHY_WIDTH_MODE >= 2))
// Values:       0, 1
// `define CSI2_DEVICE_DPHY_16BIT_MODE


// Name:         CSI2_DEVICE_DPHY_32BIT_MODE
// Default:      0 ((CSI2_DEVICE_DPHY_TYPE) & (CSI2_DEVICE_DPHY_WIDTH_MODE == 3))
// Values:       0, 1
// `define CSI2_DEVICE_DPHY_32BIT_MODE


// Name:         CSI2_DEVICE_CPHY_WIDTH_MODE
// Default:      16BIT
// Values:       16BIT (1), 32BIT (2)
// Enabled:      CSI2_DEVICE_CPHY_TYPE
`define CSI2_DEVICE_CPHY_WIDTH_MODE 1


// Name:         CSI2_DEVICE_CPHY_NUM_OF_LANES
// Default:      3 ((CSI2_DEVICE_COMBO_PHY_CONFIG == 2) ? 2 : 3)
// Values:       1 2 3 4
// Enabled:      CSI2_DEVICE_PHY_TYPE == 2
// 
// This parameter specifies the maximum number of data lanes supported by the C-PHY.
`define CSI2_DEVICE_CPHY_NUM_OF_LANES 3


// Name:         CSI2_DEVICE_CPHY_16BIT_MODE
// Default:      1 ((CSI2_DEVICE_CPHY_TYPE) & (CSI2_DEVICE_CPHY_WIDTH_MODE >= 1))
// Values:       0, 1
`define CSI2_DEVICE_CPHY_16BIT_MODE


// Name:         CSI2_DEVICE_CPHY_32BIT_MODE
// Default:      0 ((CSI2_DEVICE_CPHY_TYPE) & (CSI2_DEVICE_CPHY_WIDTH_MODE == 2))
// Values:       0, 1
// `define CSI2_DEVICE_CPHY_32BIT_MODE


// Name:         CSI2_DEVICE_PHY_16BIT_MODE
// Default:      1 ((CSI2_DEVICE_DPHY_16BIT_MODE) | (CSI2_DEVICE_CPHY_16BIT_MODE))
// Values:       0, 1
`define CSI2_DEVICE_PHY_16BIT_MODE


// Name:         CSI2_DEVICE_PHY_32BIT_MODE
// Default:      0 ((CSI2_DEVICE_DPHY_32BIT_MODE) | (CSI2_DEVICE_CPHY_32BIT_MODE))
// Values:       0, 1
// `define CSI2_DEVICE_PHY_32BIT_MODE


// Name:         CSI2_DEVICE_DPHY_16BIT_OR_CPHY_32BIT_MODE
// Default:      0 ((CSI2_DEVICE_DPHY_16BIT_MODE) | (CSI2_DEVICE_CPHY_32BIT_MODE))
// Values:       0, 1
// `define CSI2_DEVICE_DPHY_16BIT_OR_CPHY_32BIT_MODE


// Name:         CSI2_DEVICE_CPHY_WIDTH_GT_DPHY_WIDTH
// Default:      1 ((CSI2_DEVICE_PHY_TYPE == 3) & (((CSI2_DEVICE_CPHY_32BIT_MODE == 
//               1) & (CSI2_DEVICE_DPHY_32BIT_MODE == 0)) | 
//               ((CSI2_DEVICE_CPHY_16BIT_MODE == 1) & (CSI2_DEVICE_DPHY_16BIT_MODE == 0))))
// Values:       0, 1
`define CSI2_DEVICE_CPHY_WIDTH_GT_DPHY_WIDTH


// Name:         CSI2_DEVICE_DPHY_LANE_WIDTH
// Default:      8 ((CSI2_DEVICE_DPHY_32BIT_MODE) ? 32 : 
//               (CSI2_DEVICE_DPHY_16BIT_MODE) ? 16 : 8)
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_DPHY_LANE_WIDTH 8


// Name:         CSI2_DEVICE_CPHY_LANE_WIDTH
// Default:      16 ((CSI2_DEVICE_CPHY_32BIT_MODE) ? 32 : 16)
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_CPHY_LANE_WIDTH 16


// Name:         CSI2_DEVICE_PHY_VALID_WIDTH
// Default:      1 ((CSI2_DEVICE_DPHY_32BIT_MODE) ? 4 : 
//               CSI2_DEVICE_DPHY_16BIT_OR_CPHY_32BIT_MODE ? 2 : 1)
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_PHY_VALID_WIDTH 1


// Name:         CSI2_DEVICE_CPHY_SS_WIDTH
// Default:      1 ((CSI2_DEVICE_CPHY_32BIT_MODE) ? 2 : 1)
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_CPHY_SS_WIDTH 1


// Name:         CSI2_DEVICE_CPHY_ST_WIDTH
// Default:      3
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_CPHY_ST_WIDTH 3


// Name:         CSI2_DEVICE_CPHY_ALP_HS_RS
// Default:      1 ((CSI2_DEVICE_CPHY_32BIT_MODE) ? 2 : 1)
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_CPHY_ALP_HS_RS 1


// Name:         CSI2_DEVICE_CPHY_ALP_CODE_RS
// Default:      4
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_CPHY_ALP_CODE_RS 4


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH
// Default:      48 ([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_WIDTH_MODE 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_WIDTH_MODE 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES])
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_MAX_PPI_WIDTH 48


// Name:         CSI2_DEVICE_GEN1DPHY
// Default:      1 ([<functionof>]==1)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available when SNPS PHY is selected.
`define CSI2_DEVICE_GEN1DPHY


// Name:         CSI2_DEVICE_GEN2DPHY
// Default:      0 ([<functionof>]==2)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available when SNPS PHY is selected.
// `define CSI2_DEVICE_GEN2DPHY


// Name:         CSI2_DEVICE_GEN22DPHY
// Default:      0 ([<functionof>]==3)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available when SNPS PHY is selected.
// `define CSI2_DEVICE_GEN22DPHY


// Name:         CSI2_DEVICE_GEN3DPHY
// Default:      0 ([<functionof>]>=4)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY


// Name:         CSI2_DEVICE_GEN3DPHY_PRE
// Default:      0 ([<functionof>]==4)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY_PRE


// Name:         CSI2_DEVICE_GEN3DPHY_CUMN_PRAH
// Default:      0 ([<functionof>]==6 | [<functionof>]==10)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY_CUMN_PRAH


// Name:         CSI2_DEVICE_GEN3DPHY_CUMN_PRAJ
// Default:      0 ([<functionof>]==8)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY_CUMN_PRAJ


// Name:         CSI2_DEVICE_GEN3DPHY_CUMN_PRAI
// Default:      0 ([<functionof>]==9)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// CSI2_DEVICE_GEN3DPHY_CUMN_PRAJ: 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY_CUMN_PRAI


// Name:         CSI2_DEVICE_GEN3DPHY_BIDIR
// Default:      0 ([<functionof>]==11 | [<functionof>]==12)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY_BIDIR


// Name:         CSI2_DEVICE_GEN3DPHY_BIDIR_AP
// Default:      0 ([<functionof>]==12)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY_BIDIR_AP


// Name:         CSI2_DEVICE_GEN3DPHY_UMC
// Default:      0 ([<functionof>]==13)
// Values:       0, 1
// Enabled:      (CSI2_DEVICE_SNPS_PHY) & (CSI2_DEVICE_DPHY_TYPE)
// 
// By selecting this you identify the version of the SNPS PHY used 
// Only available if SNPS PHY is selected.
// `define CSI2_DEVICE_GEN3DPHY_UMC


// Name:         CSI2_DEVICE_CALIBRATION
// Default:      1 ((CSI2_DEVICE_GEN3DPHY == 1) || (CSI2_DEVICE_SNPS_PHY == 0))
// Values:       0, 1
// Enabled:      ((CSI2_DEVICE_GEN3DPHY == 1) || (CSI2_DEVICE_SNPS_PHY == 0))
// 
// By selecting this CALIBRATION feature is suported
`define CSI2_DEVICE_CALIBRATION


// Name:         CSI2_DEVICE_VC_EXTENSION
// Default:      1
// Values:       0, 1
// 
// Virtual Channel Extension enable: 
//  - 0: Up to 4 virtual channels 
//  - 1: Up to 16 virtual channels for DPHY; Up to 32 virtual channels for CPHY
`define CSI2_DEVICE_VC_EXTENSION


// Name:         CSI2_DEVICE_VCX_DWIDTH
// Default:      3 ((CSI2_DEVICE_CPHY_TYPE) ? 3 : 2)
// Values:       -2147483648, ..., 2147483647
// Enabled:      CSI2_DEVICE_VC_EXTENSION
`define CSI2_DEVICE_VCX_DWIDTH 3


// Name:         CSI2_DEVICE_CPHY_ALP_EN
// Default:      1 (CSI2_DEVICE_CPHY_TYPE)
// Values:       0, 1
// Enabled:      CSI2_DEVICE_CPHY_TYPE
`define CSI2_DEVICE_CPHY_ALP_EN


// Name:         CSI2_DEVICE_PARITY_MODE
// Default:      Even
// Values:       Even (0), Odd (1)
// Enabled:      CSI2_DEVICE_AP
// 
// Define parity mode, but not affect the parity mode of Safety Slave 0-Even Mode 1-Odd Mode
`define CSI2_DEVICE_PARITY_MODE 0


// Name:         CSI2_DEVICE_SS
// Default:      0
// Values:       0, 1
// Enabled:      CSI2_DEVICE_AP
// 
// Enable Safety Slave
`define CSI2_DEVICE_SS

// ####### Read-Only Parameters #######

// Name:         CSI2_DEVICE_ODD_MODE
// Default:      0 (CSI2_DEVICE_PARITY_MODE == 1)
// Values:       0, 1
// Enabled:      CSI2_DEVICE_AP
// 
// Define Odd Mode macro
// `define CSI2_DEVICE_ODD_MODE


// Name:         CSI2_DEVICE_ADDR_LOG_SIZE
// Default:      15
// Values:       -2147483648, ..., 2147483647
// 
// Configure FIFO size or number of faulty addresses logged.
`define CSI2_DEVICE_ADDR_LOG_SIZE 15


// Name:         CSI2_DEVICE_DFLT_TST_MODE
// Default:      0
// Values:       -2147483648, ..., 2147483647
// 
// No hold inserted (in BCM parts)
`define CSI2_DEVICE_DFLT_TST_MODE 0


// Name:         CSI2_DEVICE_DFLT_VERIF_EN
// Default:      1
// Values:       -2147483648, ..., 2147483647
// 
// when DW_MODEL_MISSAMPLES defined, randomly insert 0 to 1 cycle delay, for modeling sampling errors
`define CSI2_DEVICE_DFLT_VERIF_EN 1


// Name:         CSI2_DEVICE_BCM36_DFLT_DATA_DELAY
// Default:      3
// Values:       -2147483648, ..., 2147483647
// 
// When using BCM36_nhs, Randomly insert delay on datapath for simulation verification
`define CSI2_DEVICE_BCM36_DFLT_DATA_DELAY 3

//####### Hidden but Changeable Parameters #######

// Name:         CSI2_DEVICE_NAP_PLD_WIDTH
// Default:      64 (CSI2_DEVICE_MAX_PPI_WIDTH > 128 ? 256 : 
//               CSI2_DEVICE_MAX_PPI_WIDTH > 64 ? 128 : 64)
// Values:       -2147483648, ..., 2147483647
// 
// Selects the data interface width when transmit payload without Automotive Package function
`define CSI2_DEVICE_NAP_PLD_WIDTH 64


// Name:         CSI2_DEVICE_NAP_IDI_PL_FIFO_WIDTH
// Default:      128 (CSI2_DEVICE_MAX_PPI_WIDTH > 128 ? 256 : 
//               (CSI2_DEVICE_MAX_PPI_WIDTH > 64 | CSI2_DEVICE_IDI_DATA_WIDTH > 64) ? 128 : 64)
// Values:       -2147483648, ..., 2147483647
// 
// Selects the width when push IDI payload into FIFO without Automotive Package function
`define CSI2_DEVICE_NAP_IDI_PL_FIFO_WIDTH 128


// Name:         CSI2_DEVICE_IDI_DATA_WIDTH_IS_128
// Default:      1 (CSI2_DEVICE_IDI_DATA_WIDTH == 128)
// Values:       0, 1
// 
// Selects the IDI data width is 128bita
`define CSI2_DEVICE_IDI_DATA_WIDTH_IS_128


// Name:         CSI2_DEVICE_SDI_IN_PARITY_WIDTH
// Default:      9 (CSI2_DEVICE_MAX_PPI_WIDTH > 128 ? 33 : 
//               (CSI2_DEVICE_MAX_PPI_WIDTH > 64 ? 17 : 9))
// Values:       -2147483648, ..., 2147483647
// 
// SDI input parity width
`define CSI2_DEVICE_SDI_IN_PARITY_WIDTH 9


// Name:         CSI2_DEVICE_SDI_PLD_BYTEEN_WIDTH
// Default:      4 (CSI2_DEVICE_MAX_PPI_WIDTH > 128 ? 6 : (CSI2_DEVICE_MAX_PPI_WIDTH 
//               > 64 ? 5 : 4))
// Values:       -2147483648, ..., 2147483647
// 
// CSI2_DEVICE_PLD_BYTEEN_WIDTH: 
// The width of Datapath valid bytes
`define CSI2_DEVICE_SDI_PLD_BYTEEN_WIDTH 4


// Name:         CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH
// Default:      4 (CSI2_DEVICE_IDI_DATA_WIDTH == 128 ? 4 : 3)
// Values:       -2147483648, ..., 2147483647
// 
// The width of IDI data valid bytes
`define CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH 4


// Name:         CSI2_DEVICE_IDI_DATA_PARITY_WIDTH
// Default:      21 (CSI2_DEVICE_IDI_DATA_WIDTH == 128 ? 21 : 13)
// Values:       -2147483648, ..., 2147483647
// 
// IDI input parity width
`define CSI2_DEVICE_IDI_DATA_PARITY_WIDTH 21


// Name:         CSI2_DEVICE_IPI_DATA_PARITY_WIDTH
// Default:      9 (CSI2_DEVICE_IPI_LANE_NUM > 1 ? 27 : 9)
// Values:       -2147483648, ..., 2147483647
// 
// IPI input parity width
`define CSI2_DEVICE_IPI_DATA_PARITY_WIDTH 9


// Name:         CSI2_DEVICE_NAP_IDI_PL_FIFO_WIDTH_GT_64
// Default:      1 (CSI2_DEVICE_MAX_PPI_WIDTH > 64 | CSI2_DEVICE_IDI_DATA_WIDTH > 
//               64)
// Values:       0, 1
// 
// The width of IDI payload FIFO without AP function is greater than 64
`define CSI2_DEVICE_NAP_IDI_PL_FIFO_WIDTH_GT_64


// Name:         CSI2_DEVICE_IDI_PL_ECC_WIDTH
// Default:      9 (CSI2_DEVICE_MAX_PPI_WIDTH > 128 ? 10 : 
//               (CSI2_DEVICE_MAX_PPI_WIDTH > 64 | CSI2_DEVICE_IDI_DATA_WIDTH > 64) ? 9 : 8)
// Values:       -2147483648, ..., 2147483647
// 
// Select the IDI output payload ecc width
`define CSI2_DEVICE_IDI_PL_ECC_WIDTH 9


// Name:         CSI2_DEVICE_IDI_PLD_WIDTH
// Default:      137 ([<functionof> CSI2_DEVICE_AP CSI2_DEVICE_NAP_IDI_PL_FIFO_WIDTH 
//               CSI2_DEVICE_IDI_PL_ECC_WIDTH])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// The width of the external payload RAM for IDI
`define CSI2_DEVICE_IDI_PLD_WIDTH 137


// Name:         CSI2_DEVICE_IPI_PL_O_WIDTH
// Default:      64 (CSI2_DEVICE_IPI_LANE_NUM > 1 ? 256 : 64)
// Values:       -2147483648, ..., 2147483647
// 
// Select the IPI output payload width
`define CSI2_DEVICE_IPI_PL_O_WIDTH 64


// Name:         CSI2_DEVICE_NAP_IPI_PL_FIFO_WIDTH
// Default:      64 (CSI2_DEVICE_IPI_LANE_NUM > 1 ? 256 : CSI2_DEVICE_MAX_PPI_WIDTH 
//               > 64 ? 128 : 64)
// Values:       -2147483648, ..., 2147483647
// 
// Selects the width when push IPI payload into FIFO without Automotive Package function
`define CSI2_DEVICE_NAP_IPI_PL_FIFO_WIDTH 64


// Name:         CSI2_DEVICE_NAP_IPI_PL_FIFO_WIDTH_GT_64
// Default:      0 ((CSI2_DEVICE_IPI_LANE_NUM > 1) || (CSI2_DEVICE_MAX_PPI_WIDTH > 
//               64))
// Values:       0, 1
// 
// The width of IPI payload FIFO without AP function is greater than 64
// `define CSI2_DEVICE_NAP_IPI_PL_FIFO_WIDTH_GT_64


// Name:         CSI2_DEVICE_IPI_PL_ECC_WIDTH
// Default:      8 (((CSI2_DEVICE_IPI_LANE_NUM > 1) || (CSI2_DEVICE_MAX_PPI_WIDTH > 
//               128)) ? 10 : CSI2_DEVICE_MAX_PPI_WIDTH > 64 ? 9 : 8)
// Values:       -2147483648, ..., 2147483647
// 
// Select the IPI output payload ecc width
`define CSI2_DEVICE_IPI_PL_ECC_WIDTH 8


// Name:         CSI2_DEVICE_IPI_PLD_WIDTH
// Default:      72 ([<functionof> CSI2_DEVICE_AP CSI2_DEVICE_NAP_IPI_PL_FIFO_WIDTH 
//               CSI2_DEVICE_IPI_PL_ECC_WIDTH])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// The width of the external payload RAM for IPI
`define CSI2_DEVICE_IPI_PLD_WIDTH 72


// Name:         CSI2_DEVICE_PL_ERR_INJ_WIDTH_GT_64
// Default:      1 ((CSI2_DEVICE_IPI_LANE_NUM > 1) || (CSI2_DEVICE_MAX_PPI_WIDTH > 
//               64) || (CSI2_DEVICE_IDI_DATA_WIDTH > 64))
// Values:       0, 1
// 
// The err injection width of payload data is greater than 64
`define CSI2_DEVICE_PL_ERR_INJ_WIDTH_GT_64


// Name:         CSI2_DEVICE_PL_ERR_INJ_WIDTH_GT_128
// Default:      0 ((CSI2_DEVICE_IPI_LANE_NUM > 1) || (CSI2_DEVICE_MAX_PPI_WIDTH > 
//               128))
// Values:       0, 1
// 
// The err injection width of payload data is greater than 128
// `define CSI2_DEVICE_PL_ERR_INJ_WIDTH_GT_128


// Name:         CSI2_DEVICE_PLD_WIDTH
// Default:      72 ([<functionof> CSI2_DEVICE_AP CSI2_DEVICE_NAP_PLD_WIDTH])
// Values:       -2147483648, ..., 2147483647
// Enabled:      0
// 
// The width of the external payload RAM
`define CSI2_DEVICE_PLD_WIDTH 72


// Name:         CSI2_DEVICE_PLD_WIDTH_GT_64
// Default:      0 (CSI2_DEVICE_NAP_PLD_WIDTH > 64)
// Values:       0, 1
// 
// When CSI2_DEVICE_NAP_PLD_WIDTH is greater than 64 bits, this parameter is defined.
// `define CSI2_DEVICE_PLD_WIDTH_GT_64


// Name:         CSI2_DEVICE_PLD_WIDTH_GT_128
// Default:      0 (CSI2_DEVICE_NAP_PLD_WIDTH > 128)
// Values:       0, 1
// 
// When CSI2_DEVICE_NAP_PLD_WIDTH is greater than 128 bits, this parameter is defined.
// `define CSI2_DEVICE_PLD_WIDTH_GT_128


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_16
// Default:      1 (CSI2_DEVICE_MAX_PPI_WIDTH >= 16)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 16 bits, this parameter is defined.
`define CSI2_DEVICE_MAX_PPI_WIDTH_GE_16


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_24
// Default:      1 (CSI2_DEVICE_MAX_PPI_WIDTH >= 24)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 24 bits, this parameter is defined.
`define CSI2_DEVICE_MAX_PPI_WIDTH_GE_24


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_32
// Default:      1 (CSI2_DEVICE_MAX_PPI_WIDTH >= 32)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 32 bits, this parameter is defined.
`define CSI2_DEVICE_MAX_PPI_WIDTH_GE_32


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_40
// Default:      1 (CSI2_DEVICE_MAX_PPI_WIDTH >= 40)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 40 bits, this parameter is defined.
`define CSI2_DEVICE_MAX_PPI_WIDTH_GE_40


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_48
// Default:      1 (CSI2_DEVICE_MAX_PPI_WIDTH >= 48)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 48 bits, this parameter is defined.
`define CSI2_DEVICE_MAX_PPI_WIDTH_GE_48


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_56
// Default:      0 (CSI2_DEVICE_MAX_PPI_WIDTH >= 56)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 56 bits, this parameter is defined.
// `define CSI2_DEVICE_MAX_PPI_WIDTH_GE_56


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_64
// Default:      0 (CSI2_DEVICE_MAX_PPI_WIDTH >= 64)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 64 bits, this parameter is defined.
// `define CSI2_DEVICE_MAX_PPI_WIDTH_GE_64


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_80
// Default:      0 (CSI2_DEVICE_MAX_PPI_WIDTH >= 80)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 96 bits, this parameter is defined.
// `define CSI2_DEVICE_MAX_PPI_WIDTH_GE_80


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_96
// Default:      0 (CSI2_DEVICE_MAX_PPI_WIDTH >= 96)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 96 bits, this parameter is defined.
// `define CSI2_DEVICE_MAX_PPI_WIDTH_GE_96


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_112
// Default:      0 (CSI2_DEVICE_MAX_PPI_WIDTH >= 112)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 96 bits, this parameter is defined.
// `define CSI2_DEVICE_MAX_PPI_WIDTH_GE_112


// Name:         CSI2_DEVICE_MAX_PPI_WIDTH_GE_128
// Default:      0 (CSI2_DEVICE_MAX_PPI_WIDTH >= 128)
// Values:       0, 1
// 
// When CSI2_DEVICE_MAX_PPI_WIDTH is less than 128 bits, this parameter is defined.
// `define CSI2_DEVICE_MAX_PPI_WIDTH_GE_128


// Name:         CSI2_DEVICE_TB_TYPE
// Default:      TS
// Values:       UVM (0), VTB (1), TS (2)
// 
// Specifies the type of testbench. 
//  - 0: UVM 
//  - 1: VTB 
//  - 2: TS
`define CSI2_DEVICE_TB_TYPE 2


// Name:         CSI2_DEVICE_UVM_12
// Default:      1
// Values:       0, 1
// 
// Enable UVM 1.2
`define CSI2_DEVICE_UVM_12


// Name:         CSI2_DEVICE_VTB
// Default:      0 (CSI2_DEVICE_TB_TYPE == 1 ? 1:0)
// Values:       0, 1
// 
// When (1) defined   implies testbench is a VTB testbench 
// When (0) undefined implies testbench is not a VTB testbench
// `define CSI2_DEVICE_VTB


// Name:         CSI2_DEVICE_UVM
// Default:      0 (CSI2_DEVICE_TB_TYPE == 0 ? 1:0)
// Values:       0, 1
// 
// When (1) defined   implies testbench is a UVM testbench 
// When (0) undefined implies testbench is not a UVM testbench
// `define CSI2_DEVICE_UVM


// Name:         CSI2_DEVICE_TS
// Default:      1 (CSI2_DEVICE_TB_TYPE == 2 ? 1:0)
// Values:       0, 1
// 
// When (1) defined   implies testbench is a TS testbench 
// When (0) undefined implies testbench is not a TS testbench
`define CSI2_DEVICE_TS

// ####### Derived Parameters #######


`define CSI2_DEVICE_DPHY_INCLUDE_LANE_1


`define CSI2_DEVICE_DPHY_INCLUDE_LANE_2


`define CSI2_DEVICE_DPHY_INCLUDE_LANE_3


`define CSI2_DEVICE_DPHY_INCLUDE_LANE_4


// `define CSI2_DEVICE_DPHY_INCLUDE_LANE_5


// `define CSI2_DEVICE_DPHY_INCLUDE_LANE_6


// `define CSI2_DEVICE_DPHY_INCLUDE_LANE_7


// `define CSI2_DEVICE_DPHY_INCLUDE_LANE_8


`define CSI2_DEVICE_CPHY_INCLUDE_LANE_1


`define CSI2_DEVICE_CPHY_INCLUDE_LANE_2


`define CSI2_DEVICE_CPHY_INCLUDE_LANE_3


// `define CSI2_DEVICE_CPHY_INCLUDE_LANE_4


`define CSI2_DEVICE_INCLUDE_LANE_1


`define CSI2_DEVICE_INCLUDE_LANE_2


`define CSI2_DEVICE_INCLUDE_LANE_3


`define CSI2_DEVICE_INCLUDE_LANE_4


// `define CSI2_DEVICE_INCLUDE_LANE_5


// `define CSI2_DEVICE_INCLUDE_LANE_6


// `define CSI2_DEVICE_INCLUDE_LANE_7


// `define CSI2_DEVICE_INCLUDE_LANE_8


`define CSI2_DEVICE_PHY_LANE0_WIDTH 16


`define CSI2_DEVICE_PHY_LANE3_WIDTH 8


`define CSI2_DEVICE_PHY_LANE3_WIDTH_EQ_8


`define CSI2_DEVICE_PHY_LANE3_VALID_WIDTH 1


`define CSI2_DEVICE_DPHY_VALID_WIDTH 1


// Name:         CSI2_DEVICE_CHANNEL_NUM
// Default:      2 (CSI2_DEVICE_IDI_IF + CSI2_DEVICE_IPI_IF + CSI2_DEVICE_VPG + 
//               CSI2_DEVICE_SDI_IF)
// Values:       1 2 3 4
// 
// CSI2_DEVICE_INTERFACE_NUM: 
// Select the number of system data interface
`define CSI2_DEVICE_CHANNEL_NUM 2


`define CSI2_DEVICE_CHANNEL_NUM_1


`define CSI2_DEVICE_CHANNEL_NUM_2


// `define CSI2_DEVICE_CHANNEL_NUM_3


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS
// Default:      32 ([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES])
// Values:       -2147483648, ..., 2147483647
// 
// shift_rest register width in lane_mgr module
`define CSI2_DEVICE_SHIFT_REST_REG_RS 32


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_GT_96
// Default:      0 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) > 96)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS > 96
// `define CSI2_DEVICE_SHIFT_REST_REG_RS_GT_96


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_GT_80
// Default:      0 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) > 80)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS > 80
// `define CSI2_DEVICE_SHIFT_REST_REG_RS_GT_80


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_GT_72
// Default:      0 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) > 72)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS > 72
// `define CSI2_DEVICE_SHIFT_REST_REG_RS_GT_72


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_GT_64
// Default:      0 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) > 64)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS > 64
// `define CSI2_DEVICE_SHIFT_REST_REG_RS_GT_64


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_GT_48
// Default:      0 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) > 48)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS > 48
// `define CSI2_DEVICE_SHIFT_REST_REG_RS_GT_48


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_GT_32
// Default:      0 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) > 32)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS > 32
// `define CSI2_DEVICE_SHIFT_REST_REG_RS_GT_32


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_GT_16
// Default:      1 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) > 16)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS > 16
`define CSI2_DEVICE_SHIFT_REST_REG_RS_GT_16


// Name:         CSI2_DEVICE_SHIFT_REST_REG_RS_EQ_0
// Default:      0 (([<functionof> CSI2_DEVICE_PHY_TYPE CSI2_DEVICE_DPHY_LANE_WIDTH 
//               CSI2_DEVICE_DPHY_NUM_OF_LANES CSI2_DEVICE_CPHY_LANE_WIDTH 
//               CSI2_DEVICE_CPHY_NUM_OF_LANES]) == 0)
// Values:       0, 1
// 
// CSI2_DEVICE_SHIFT_REST_REG_RS == 0
// `define CSI2_DEVICE_SHIFT_REST_REG_RS_EQ_0



// Name:         CSI2_DEVICE_LANE_NUM_QST_RST_VAL
// Default:      3 (CSI2_DEVICE_DPHY_TYPE ? (CSI2_DEVICE_DPHY_NUM_OF_LANES-1) : 
//               (CSI2_DEVICE_CPHY_NUM_OF_LANES-1))
// Values:       -2147483648, ..., 2147483647
`define CSI2_DEVICE_LANE_NUM_QST_RST_VAL 3


// Name:         CSI2_DEVICE_VERSION_ID
// Default:      0x3133322a
// Values:       0x0, ..., 0xffffffff
// 
// Defines the CSI2 device version ID
`define CSI2_DEVICE_VERSION_ID 32'h3133322a


// Name:         CSI2_DEVICE_VER_TYPE_ENUM
// Default:      0x0
// Values:       0x0, ..., 0xf
// 
// Defines the coreKit release type 
// 0x0: GA release 
// 0x1: LCA release 
// 0x2: EA release 
// 0x3: LP release 
// 0x4: Reserved 
// 0x5: SOW release 
// 0x6: EC release 
// Others: Reserved
`define CSI2_DEVICE_VER_TYPE_ENUM 4'h0


// Name:         CSI2_DEVICE_VER_TYPE_PKG
// Default:      0xa
// Values:       0x0, ..., 0xf
// 
// 4'b1010: 'a' 
// 4'b1011: 'b' 
// 4'b1100: 'c' 
// ... 
// 4'b1000: 'o' 
// 4'b1001: 'p' 
// Defines the CSI2 device Alphabetical packaging number
`define CSI2_DEVICE_VER_TYPE_PKG 4'ha


// Name:         CSI2_DEVICE_VER_TYPE_NUM
// Default:      0x0
// Values:       0x0, ..., 0xff
// 
// Defines the CSI2 device release version in BCD format
`define CSI2_DEVICE_VER_TYPE_NUM 8'h0


// Name:         CSI2_DEVICE_VER_NUMBER
// Default:      0x132
// Values:       0x0, ..., 0xffff
// 
// CSI2_DEVICE_VER_NUMBER 
// Defines the CSI2 device version number
`define CSI2_DEVICE_VER_NUMBER 16'h132


// Name:         CSI2_DEVICE_IDI_PLD_FIFO_AWIDTH
// Default:      11 ([<functionof> CSI2_DEVICE_IDI_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IDI payload FIFO
`define CSI2_DEVICE_IDI_PLD_FIFO_AWIDTH 11


// Name:         CSI2_DEVICE_IDI_PLD_FIFO_CWIDTH
// Default:      12 ([<functionof> CSI2_DEVICE_IDI_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IDI payload fifo.
`define CSI2_DEVICE_IDI_PLD_FIFO_CWIDTH 12


// Name:         CSI2_DEVICE_IDI_HD_FIFO_AWIDTH
// Default:      3 ([<functionof> CSI2_DEVICE_IDI_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IDI Header FIFO.
`define CSI2_DEVICE_IDI_HD_FIFO_AWIDTH 3


// Name:         CSI2_DEVICE_IDI_HD_FIFO_CWIDTH
// Default:      4 ([<functionof> CSI2_DEVICE_IDI_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IDI header fifo.
`define CSI2_DEVICE_IDI_HD_FIFO_CWIDTH 4


// Name:         CSI2_DEVICE_IDI_HD_PUSH_AF_LVL
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IDI header fifo.
`define CSI2_DEVICE_IDI_HD_PUSH_AF_LVL 2


// Name:         CSI2_DEVICE_IPI_PLD_FIFO_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI payload FIFO
`define CSI2_DEVICE_IPI_PLD_FIFO_AWIDTH 10


// Name:         CSI2_DEVICE_IPI_PLD_FIFO_CWIDTH
// Default:      11 ([<functionof> CSI2_DEVICE_IPI_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI payload fifo.
`define CSI2_DEVICE_IPI_PLD_FIFO_CWIDTH 11


// Name:         CSI2_DEVICE_IPI_HD_FIFO_AWIDTH
// Default:      3 ([<functionof> CSI2_DEVICE_IPI_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI Header FIFO.
`define CSI2_DEVICE_IPI_HD_FIFO_AWIDTH 3


// Name:         CSI2_DEVICE_IPI_HD_FIFO_CWIDTH
// Default:      4 ([<functionof> CSI2_DEVICE_IPI_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI header fifo.
`define CSI2_DEVICE_IPI_HD_FIFO_CWIDTH 4


// Name:         CSI2_DEVICE_IPI_HD_PUSH_AF_LVL
// Default:      6
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI header fifo.
`define CSI2_DEVICE_IPI_HD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IPI2_PLD_FIFO_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI2_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI2 payload FIFO
`define CSI2_DEVICE_IPI2_PLD_FIFO_AWIDTH 10


// Name:         CSI2_DEVICE_IPI2_PLD_FIFO_CWIDTH
// Default:      11 ([<functionof> CSI2_DEVICE_IPI2_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI2 payload fifo.
`define CSI2_DEVICE_IPI2_PLD_FIFO_CWIDTH 11


// Name:         CSI2_DEVICE_IPI2_HD_FIFO_AWIDTH
// Default:      3 ([<functionof> CSI2_DEVICE_IPI2_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI2 Header FIFO.
`define CSI2_DEVICE_IPI2_HD_FIFO_AWIDTH 3


// Name:         CSI2_DEVICE_IPI2_HD_FIFO_CWIDTH
// Default:      4 ([<functionof> CSI2_DEVICE_IPI2_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI2 header fifo.
`define CSI2_DEVICE_IPI2_HD_FIFO_CWIDTH 4


// Name:         CSI2_DEVICE_IPI2_HD_PUSH_AF_LVL
// Default:      6
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI2 header fifo.
`define CSI2_DEVICE_IPI2_HD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IPI3_PLD_FIFO_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI3_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI3 payload FIFO
`define CSI2_DEVICE_IPI3_PLD_FIFO_AWIDTH 10


// Name:         CSI2_DEVICE_IPI3_PLD_FIFO_CWIDTH
// Default:      11 ([<functionof> CSI2_DEVICE_IPI3_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI3 payload fifo.
`define CSI2_DEVICE_IPI3_PLD_FIFO_CWIDTH 11


// Name:         CSI2_DEVICE_IPI3_HD_FIFO_AWIDTH
// Default:      3 ([<functionof> CSI2_DEVICE_IPI3_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI3 Header FIFO.
`define CSI2_DEVICE_IPI3_HD_FIFO_AWIDTH 3


// Name:         CSI2_DEVICE_IPI3_HD_FIFO_CWIDTH
// Default:      4 ([<functionof> CSI2_DEVICE_IPI3_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI3 header fifo.
`define CSI2_DEVICE_IPI3_HD_FIFO_CWIDTH 4


// Name:         CSI2_DEVICE_IPI3_HD_PUSH_AF_LVL
// Default:      6
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI3 header fifo.
`define CSI2_DEVICE_IPI3_HD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IPI4_PLD_FIFO_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI4_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI4 payload FIFO
`define CSI2_DEVICE_IPI4_PLD_FIFO_AWIDTH 10


// Name:         CSI2_DEVICE_IPI4_PLD_FIFO_CWIDTH
// Default:      11 ([<functionof> CSI2_DEVICE_IPI4_PLD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI4 payload fifo.
`define CSI2_DEVICE_IPI4_PLD_FIFO_CWIDTH 11


// Name:         CSI2_DEVICE_IPI4_HD_FIFO_AWIDTH
// Default:      3 ([<functionof> CSI2_DEVICE_IPI4_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Address bus width in the IPI4 Header FIFO.
`define CSI2_DEVICE_IPI4_HD_FIFO_AWIDTH 3


// Name:         CSI2_DEVICE_IPI4_HD_FIFO_CWIDTH
// Default:      4 ([<functionof> CSI2_DEVICE_IPI4_HD_RAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// Bus width to report the number of words in the IPI4 header fifo.
`define CSI2_DEVICE_IPI4_HD_FIFO_CWIDTH 4


// Name:         CSI2_DEVICE_IPI4_HD_PUSH_AF_LVL
// Default:      6
// Values:       -2147483648, ..., 2147483647
// 
// Almost full level for push_af output port for the IPI4 header fifo.
`define CSI2_DEVICE_IPI4_HD_PUSH_AF_LVL 6


// Name:         CSI2_DEVICE_IDI_PLD_PTP_SPRAM_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IDI_PLD_PTP_SPRAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// CSI2_DEVICE_IDI_PLD_FIFO_PTP_RAM_AWIDTH: 
// Address bus width in the IDI payload FIFO with PTP RAM
`define CSI2_DEVICE_IDI_PLD_PTP_SPRAM_AWIDTH 10


// Name:         CSI2_DEVICE_IPI_PLD_PTP_SPRAM_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI_PLD_PTP_SPRAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// CSI2_DEVICE_IPI_PLD_FIFO_PTP_RAM_AWIDTH: 
// Address bus width in the IPI payload FIFO with PTP RAM
`define CSI2_DEVICE_IPI_PLD_PTP_SPRAM_AWIDTH 10


// Name:         CSI2_DEVICE_IPI2_PLD_PTP_SPRAM_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI2_PLD_PTP_SPRAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// CSI2_DEVICE_IPI2_PLD_FIFO_PTP_RAM_AWIDTH: 
// Address bus width in the IPI2 payload FIFO with PTP RAM
`define CSI2_DEVICE_IPI2_PLD_PTP_SPRAM_AWIDTH 10


// Name:         CSI2_DEVICE_IPI3_PLD_PTP_SPRAM_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI3_PLD_PTP_SPRAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// CSI2_DEVICE_IPI3_PLD_FIFO_PTP_RAM_AWIDTH: 
// Address bus width in the IPI3 payload FIFO with PTP RAM
`define CSI2_DEVICE_IPI3_PLD_PTP_SPRAM_AWIDTH 10


// Name:         CSI2_DEVICE_IPI4_PLD_PTP_SPRAM_AWIDTH
// Default:      10 ([<functionof> CSI2_DEVICE_IPI4_PLD_PTP_SPRAM_DEPTH])
// Values:       -2147483648, ..., 2147483647
// 
// CSI2_DEVICE_IPI4_PLD_FIFO_PTP_RAM_AWIDTH: 
// Address bus width in the IPI4 payload FIFO with PTP RAM
`define CSI2_DEVICE_IPI4_PLD_PTP_SPRAM_AWIDTH 10


// Name:         CSI2_DEVICE_IDI_PLD_FIFO_PWIDTH
// Default:      2 ([<functionof> CSI2_DEVICE_USE_DPRAM 
//               CSI2_DEVICE_IDI_PLD_FIFO_AWIDTH CSI2_DEVICE_IDI_PLD_PTP_SPRAM_AWIDTH])
// Values:       -2147483648, ..., 2147483647
// 
// The parity width of address bus for the IDI payload FIFO
`define CSI2_DEVICE_IDI_PLD_FIFO_PWIDTH 2


// Name:         CSI2_DEVICE_IPI_PLD_FIFO_PWIDTH
// Default:      2 ([<functionof> CSI2_DEVICE_USE_DPRAM 
//               CSI2_DEVICE_IPI_PLD_FIFO_AWIDTH CSI2_DEVICE_IPI_PLD_PTP_SPRAM_AWIDTH])
// Values:       -2147483648, ..., 2147483647
// 
// The parity width of address bus for the IPI payload FIFO
`define CSI2_DEVICE_IPI_PLD_FIFO_PWIDTH 2


// Name:         CSI2_DEVICE_IPI2_PLD_FIFO_PWIDTH
// Default:      2 ([<functionof> CSI2_DEVICE_USE_DPRAM 
//               CSI2_DEVICE_IPI2_PLD_FIFO_AWIDTH CSI2_DEVICE_IPI2_PLD_PTP_SPRAM_AWIDTH])
// Values:       -2147483648, ..., 2147483647
// 
// The parity width of address bus for the IPI2 payload FIFO
`define CSI2_DEVICE_IPI2_PLD_FIFO_PWIDTH 2


// Name:         CSI2_DEVICE_IPI3_PLD_FIFO_PWIDTH
// Default:      2 ([<functionof> CSI2_DEVICE_USE_DPRAM 
//               CSI2_DEVICE_IPI3_PLD_FIFO_AWIDTH CSI2_DEVICE_IPI3_PLD_PTP_SPRAM_AWIDTH])
// Values:       -2147483648, ..., 2147483647
// 
// The parity width of address bus for the IPI3 payload FIFO
`define CSI2_DEVICE_IPI3_PLD_FIFO_PWIDTH 2


// Name:         CSI2_DEVICE_IPI4_PLD_FIFO_PWIDTH
// Default:      2 ([<functionof> CSI2_DEVICE_USE_DPRAM 
//               CSI2_DEVICE_IPI4_PLD_FIFO_AWIDTH CSI2_DEVICE_IPI4_PLD_PTP_SPRAM_AWIDTH])
// Values:       -2147483648, ..., 2147483647
// 
// The parity width of address bus for the IPI4 payload FIFO
`define CSI2_DEVICE_IPI4_PLD_FIFO_PWIDTH 2


// Name:         SS_CORE_REG_START_OFFSET
// Default:      32
// Values:       -2147483648, ..., 2147483647
// 
// Indicates the Core register start offset.
`define SS_CORE_REG_START_OFFSET 32


// Name:         SS_CORE_REG_DEPTH
// Default:      47
// Values:       -2147483648, ..., 2147483647
// 
// Indicates the Core register depth.
`define SS_CORE_REG_DEPTH 47


// Name:         SLAVE_INTERFACE_TYPE
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// Selects the Safety Slave Register Interface type as APB4.
`define SLAVE_INTERFACE_TYPE 2


// Name:         DWC_BCM_ATV_ERR_RPT
// Default:      1 (CSI2_DEVICE_AP==1)
// Values:       0, 1
// 
// BCM TRMV mechanism error reporting
`define DWC_BCM_ATV_ERR_RPT

//Revision: $Id: APP_device_cc_constants.vh 2 2023/12/07 03:56:54 GMT qiupeng Exp qiupeng $
