
`ifndef IDI_INTERFACE_SV
`define IDI_INTERFACE_SV


interface idi_interface();

    parameter  CSI2_HOST_IDI_CSIDATA_SIZE =   8'd64;
    parameter  CSI2_HOST_BYTES_EN_SIZE    =   8'd3;
    parameter  CSI2_HOST_N_VIRT_CH        =   8'd16;
    parameter  CSI2_HOST_VC_WIDTH         =   8'd4;

    //default input #1ns output #1ns;

    /*
     *idi bus signals
     */
    logic                                                   clk_data;
    logic                                                   data_en;
    logic                                                   header_en;
    logic[CSI2_HOST_IDI_CSIDATA_SIZE-1             : 0]     csi_data;
    logic[CSI2_HOST_IDI_CSIDATA_SIZE-1             : 0]     csi_data_msb;
    logic[CSI2_HOST_BYTES_EN_SIZE-1                : 0]     byte_en;
    logic[5                                        : 0]     data_type;
    logic[CSI2_HOST_N_VIRT_CH-1                    : 0]     dvalid;
    logic[CSI2_HOST_N_VIRT_CH-1                    : 0]     hvalid;
    logic[CSI2_HOST_N_VIRT_CH-1                    : 0]     vvalid;
    logic[7                                        : 0]     ecc;
    logic[15                                       : 0]     world_count;
    logic[(CSI2_HOST_VC_WIDTH-1)                   : 0]     virtual_channel;

    logic                                                   drv_enable = 1'b1;

endinterface : idi_interface

`endif
