
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


`include "DWC_mipicsi2_device_all_rtl_includes.vh"

//-- Description : video Pattern Generator
module DWC_mipicsi2_device_vpg
(//---- PORT DECLARATION ------------------------------------------

  //System Interface
    input wire                                           ppi_clk                  ,
    input wire                                           ppi_clkrstz              ,

  //Configuration Interface
    input wire                                           vpg_en                   ,
    output reg                                           vpg_active               ,

    input wire                                           vpg_packet_lost_ack      ,
    output reg                                           vpg_packet_lost          ,

    input wire                                           vpg_orientation_qst      ,
    input wire                                           vpg_mode_qst             ,
    input wire                                           vpg_hsync_packet_en_qst  ,
    input wire  [`CSI2_DEVICE_VPG_VC_RS-1:0]             vpg_vc_qst               ,
    input  wire [`CSI2_DEVICE_VCX_DWIDTH-1:0]            vpg_vcx_qst              ,
    input wire  [`CSI2_DEVICE_VPG_DT_RS-1:0]             vpg_dt_qst               ,
    input wire  [`CSI2_DEVICE_VPG_PKT_SIZE_RS-1:0]       vpg_pkt_size_qst         ,
    input wire  [`CSI2_DEVICE_VPG_HSA_TIME_RS-1:0]       vpg_hsa_time_qst         ,
    input wire  [`CSI2_DEVICE_VPG_HBP_TIME_RS-1:0]       vpg_hbp_time_qst         ,
    input wire  [`CSI2_DEVICE_VPG_HLINE_TIME_RS-1:0]     vpg_hline_time_qst       ,
    input wire  [`CSI2_DEVICE_VPG_VSA_LINES_RS-1:0]      vpg_vsa_lines_qst        ,
    input wire  [`CSI2_DEVICE_VPG_VBP_LINES_RS-1:0]      vpg_vbp_lines_qst        ,
    input wire  [`CSI2_DEVICE_VPG_VFP_LINES_RS-1:0]      vpg_vfp_lines_qst        ,
    input wire  [`CSI2_DEVICE_VPG_ACT_LINES_RS-1:0]      vpg_vactive_lines_qst    ,
    input wire  [`CSI2_DEVICE_VPG_BK_LINES_RS -1:0]      vpg_bk_lines_qst         ,

    input wire  [`CSI2_DEVICE_VPG_FRAME_NUM_MODE_RS-1:0] vpg_frame_num_mode_qst   ,
    input wire  [`CSI2_DEVICE_VPG_MAX_FRAME_NUM_RS-1:0]  vpg_max_frame_num_qst    ,

    input wire  [`CSI2_DEVICE_VPG_LINE_NUM_MODE_RS-1:0]  vpg_line_num_mode_qst    ,
    input wire  [`CSI2_DEVICE_VPG_START_LINE_NUM_RS-1:0] vpg_start_line_num_qst   ,
    input wire  [`CSI2_DEVICE_VPG_STEP_LINE_NUM_RS-1:0]  vpg_step_line_num_qst    ,

  //Packet Interface
    output reg                                           vpg_packet_req           ,
    input  wire                                          vpg_header_gen_en        ,
    input  wire                                          vpg_payload_gen_en       ,
    output reg  [`CSI2_DEVICE_HD_WIDTH-1:0]              vpg_header               ,
    output wire [`CSI2_DEVICE_NAP_PLD_WIDTH-1:0]         vpg_payload              ,
    output wire                                          vpg_elastbuf_emptyz
  );

  //---- PARAMETERS DECLARATION ------------------------------------
  //Color components
  //For RAW and RGB
  localparam  [41:0]          WHITE      = {14'b11111111111111,14'b11111111111111,14'b11111111111111};  //RAW/RGB
  localparam  [41:0]          YELLOW     = {14'b11111111111111,14'b11111111111111,14'b00000000000000};
  localparam  [41:0]          CYAN       = {14'b00000000000000,14'b11111111111111,14'b11111111111111};
  localparam  [41:0]          GREEN      = {14'b00000000000000,14'b11111111111111,14'b00000000000000};
  localparam  [41:0]          MAGENTA    = {14'b11111111111111,14'b00000000000000,14'b11111111111111};
  localparam  [41:0]          RED        = {14'b11111111111111,14'b00000000000000,14'b00000000000000};
  localparam  [41:0]          BLUE       = {14'b00000000000000,14'b00000000000000,14'b11111111111111};
  localparam  [41:0]          BLACK      = {14'b00000000000000,14'b00000000000000,14'b00000000000000};

  //For YUV
  localparam  [29:0]          YUV_WHITE  = {10'd940, 10'd512,10'd512}; //YUV
  localparam  [29:0]          YUV_YELLOW = {10'd840, 10'd64 ,10'd584};
  localparam  [29:0]          YUV_CYAN   = {10'd680, 10'd664,10'd64 };
  localparam  [29:0]          YUV_GREEN  = {10'd580, 10'd216,10'd136};
  localparam  [29:0]          YUV_MAGENTA= {10'd424, 10'd808,10'd888};
  localparam  [29:0]          YUV_RED    = {10'd324, 10'd360,10'd960};
  localparam  [29:0]          YUV_BLUE   = {10'd164, 10'd960,10'd440};
  localparam  [29:0]          YUV_BLACK  = {10'd64 , 10'd512,10'd512};

  //For BER
  localparam  [7:0]           BER_COLOR1_COMPONENT = 8'b10101010;
  localparam  [7:0]           BER_COLOR2_COMPONENT = 8'b00110011;
  localparam  [7:0]           BER_COLOR3_COMPONENT = 8'b11110000;
  localparam  [7:0]           BER_COLOR4_COMPONENT = 8'b01111111;
  localparam  [7:0]           BER_COLOR5_COMPONENT = 8'b01010101;
  localparam  [7:0]           BER_COLOR6_COMPONENT = 8'b11001100;
  localparam  [7:0]           BER_COLOR7_COMPONENT = 8'b00001111;
  localparam  [7:0]           BER_COLOR8_COMPONENT = 8'b10000000;

  //---- SIGNALS DECLARATION -----------------------------------------------------
  reg                                         vpg_en_1d_r;
  reg                                         vpg_en_2d_r;
  wire                                        vpg_en_re;

  wire                                        all_request_finish;
  reg                                         vpg_packet_req_1d_r;
  wire                                        vpg_packet_req_fe;
  wire                                        vpg_active_clr;

  wire                                        count_en_clr;
  reg                                         count_en;
  reg  [14:0]                                 vcounter;
  reg  [15:0]                                 hcounter;
  wire [14:0]                                 vpg_vsa_vbp_lines_qst_sum;
  wire [14:0]                                 vpg_vsa_vbp_vactive_lines_qst_sum;
  wire [14:0]                                 frameline;
  wire [14:0]                                 frame_bk_line;
  wire [15:0]                                 linecycle;
  wire [15:0]                                 vpg_hsa_hbp_time_qst_sum;
  wire                                        vactline;
  wire                                        last_le_en;
  reg                                         frame_end;
  wire                                        vsync_start;

  wire                                        fs_req_en;
  wire                                        fe_req_en;
  wire                                        ls_req_en;
  wire                                        le_req_en;
  wire                                        vp_req_en;
  reg                                         fs_req;
  reg  [4:0]                                  fs_priority;
  reg                                         fe_req;
  reg  [4:0]                                  fe_priority;
  wire                                        hsync_start;
  reg                                         ls_req;
  reg  [4:0]                                  ls_priority;
  reg                                         le_req;
  reg  [4:0]                                  le_priority;
  wire                                        hactcycle_start;
  reg                                         vp_req;
  reg  [4:0]                                  vp_priority;
  wire  [2:0]                                 fs_priority_val;
  wire  [2:0]                                 fe_priority_val;
  wire  [2:0]                                 ls_priority_val;
  wire  [2:0]                                 le_priority_val;
  wire  [2:0]                                 vp_priority_val;
  wire                                        fs_req_lost_set;
  wire                                        fs_req_set;
  wire                                        fs_req_clr;
  wire                                        fs_priority_gen;
  wire                                        fs_priority_shift;
  wire                                        fe_req_lost_set;
  wire                                        fe_req_set;
  wire                                        fe_req_clr;
  wire                                        fe_priority_gen;
  wire                                        fe_priority_shift;
  wire                                        ls_req_lost_set;
  wire                                        ls_req_set;
  wire                                        ls_req_clr;
  wire                                        ls_priority_gen;
  wire                                        ls_priority_shift;
  wire                                        le_req_lost_set;
  wire                                        le_req_set;
  wire                                        le_req_clr;
  wire                                        le_priority_gen;
  wire                                        le_priority_shift;
  wire                                        vp_req_lost_set;
  wire                                        vp_req_set;
  wire                                        vp_req_clr;
  wire                                        vp_priority_gen;
  wire                                        vp_priority_shift;
  wire                                        fs_req_ack;
  wire                                        fe_req_ack;
  wire                                        ls_req_ack;
  wire                                        le_req_ack;
  wire                                        vp_req_ack;
  wire                                        req_ack;

  reg                                         odd_line;
  reg  [`CSI2_DEVICE_VPG_ACT_LINES_RS-1:0]    current_line;

  reg   [18:0]                                vpg_pkt_bits;

  wire  [15:0]                                vpg_wc;
  wire  [4:0]                                 req_ack_val;
  reg                                         fs_req_lost;
  reg                                         fe_req_lost;
  reg                                         ls_req_lost;
  reg                                         le_req_lost;
  reg                                         vp_req_lost;

  wire                                        vpg_packet_lost_en;

  reg [15:0]                                  line_number;
  reg [15:0]                                  frame_number;

  wire [10:0]                                 vertical_color_pixels;

  wire                                        vpg_orientation;

  wire [13:0]                                 horizontal_color1_position;
  wire [13:0]                                 horizontal_color2_position;
  wire [13:0]                                 horizontal_color3_position;
  wire [13:0]                                 horizontal_color4_position;
  wire [13:0]                                 horizontal_color5_position;
  wire [13:0]                                 horizontal_color6_position;
  wire [13:0]                                 horizontal_color7_position;

  reg  [13:0]                                 vertical_color1_position;
  reg  [13:0]                                 vertical_color2_position;
  reg  [13:0]                                 vertical_color3_position;
  reg  [13:0]                                 vertical_color4_position;
  reg  [13:0]                                 vertical_color5_position;
  reg  [13:0]                                 vertical_color6_position;
  reg  [13:0]                                 vertical_color7_position;

  wire [13:0]                                 vcolor1_pos_sent_pix_sub;
  wire [13:0]                                 vcolor2_pos_sent_pix_sub;
  wire [13:0]                                 vcolor3_pos_sent_pix_sub;
  wire [13:0]                                 vcolor4_pos_sent_pix_sub;
  wire [13:0]                                 vcolor5_pos_sent_pix_sub;
  wire [13:0]                                 vcolor6_pos_sent_pix_sub;
  wire [13:0]                                 vcolor7_pos_sent_pix_sub;

  reg  [5:0]                                  gen_pixels;
  reg  [13:0]                                 sent_pixels;
  wire [13:0]                                 sent_gen_pixels_sum;

  reg  [ 3:0]                                 gen_cnt_period;
  reg  [ 3:0]                                 current_gen_cnt;
  reg  [ 3:0]                                 next_gen_cnt;
  reg  [ 3:0]                                 current_gen_cnt_d1_r;
  reg  [ 3:0]                                 current_gen_cnt_d2_r;

  wire                                        data_in_zone0;
  wire                                        data_in_zone2;
  wire                                        data_in_zone4;
  wire                                        data_in_zone6;
  wire                                        data_in_zone8;
  wire                                        data_in_zone10;
  wire                                        data_in_zone12;
  wire                                        data_in_zone14;

  wire                                        data_in_zone1;
  wire                                        data_in_zone3;
  wire                                        data_in_zone5;
  wire                                        data_in_zone7;
  wire                                        data_in_zone9;
  wire                                        data_in_zone11;
  wire                                        data_in_zone13;

  reg                                         color_x_y;
  reg                                         color_2x_y;
  reg                                         color_3x_y;
  reg                                         color_4x_y;
  reg                                         color_5x_y;
  reg                                         color_6x_y;
  reg                                         color_7x_y;
  reg                                         color_8x_y;
  reg                                         color_9x_y;
  reg                                         color_10x_y;
  reg                                         color_11x_y;
  reg                                         color_12x_y;
  reg                                         color_13x_y;
  reg                                         color_14x_y;
  reg                                         color_15x_y;

  reg  [29:0]                                 odd_line_p_color1;
  reg  [29:0]                                 odd_line_p_color2;
  reg  [29:0]                                 odd_line_p_color3;
  reg  [29:0]                                 odd_line_p_color4;
  reg  [29:0]                                 odd_line_p_color5;
  reg  [29:0]                                 odd_line_p_color6;
  reg  [29:0]                                 odd_line_p_color7;
  reg  [29:0]                                 odd_line_p_color8;

  reg  [29:0]                                 even_line_p_color1;
  reg  [29:0]                                 even_line_p_color2;
  reg  [29:0]                                 even_line_p_color3;
  reg  [29:0]                                 even_line_p_color4;
  reg  [29:0]                                 even_line_p_color5;
  reg  [29:0]                                 even_line_p_color6;
  reg  [29:0]                                 even_line_p_color7;
  reg  [29:0]                                 even_line_p_color8;

  wire [29:0]                                 p_color1;
  wire [29:0]                                 p_color2;
  wire [29:0]                                 p_color3;
  wire [29:0]                                 p_color4;
  wire [29:0]                                 p_color5;
  wire [29:0]                                 p_color6;
  wire [29:0]                                 p_color7;
  wire [29:0]                                 p_color8;

  wire                                        color_0_is_p_color1;
  wire                                        color_0_is_p_color2;
  wire                                        color_0_is_p_color3;
  wire                                        color_0_is_p_color4;
  wire                                        color_0_is_p_color5;
  wire                                        color_0_is_p_color6;
  wire                                        color_0_is_p_color7;
  wire                                        color_0_is_p_color8;

  wire                                        color_1_is_p_color2;
  wire                                        color_1_is_p_color3;
  wire                                        color_1_is_p_color4;
  wire                                        color_1_is_p_color5;
  wire                                        color_1_is_p_color6;
  wire                                        color_1_is_p_color7;
  wire                                        color_1_is_p_color8;

  wire                                        color_2_is_p_color3;
  wire                                        color_2_is_p_color4;
  wire                                        color_2_is_p_color5;
  wire                                        color_2_is_p_color6;
  wire                                        color_2_is_p_color7;
  wire                                        color_2_is_p_color8;

  wire                                        color_3_is_p_color4;
  wire                                        color_3_is_p_color5;
  wire                                        color_3_is_p_color6;
  wire                                        color_3_is_p_color7;
  wire                                        color_3_is_p_color8;

  wire                                        color_4_is_p_color5;
  wire                                        color_4_is_p_color6;
  wire                                        color_4_is_p_color7;
  wire                                        color_4_is_p_color8;

  wire                                        color_5_is_p_color6;
  wire                                        color_5_is_p_color7;
  wire                                        color_5_is_p_color8;

  wire                                        color_6_is_p_color7;
  wire                                        color_6_is_p_color8;

  wire                                        color_7_is_p_color8;

  wire [7:0]                                  color_0_cal_nxt;
  wire [6:0]                                  color_1_cal_nxt;
  wire [5:0]                                  color_2_cal_nxt;
  wire [4:0]                                  color_3_cal_nxt;
  wire [3:0]                                  color_4_cal_nxt;
  wire [2:0]                                  color_5_cal_nxt;
  wire [1:0]                                  color_6_cal_nxt;
  wire                                        color_7_cal_nxt;

  reg  [7:0]                                  color_0_cal;
  reg  [6:0]                                  color_1_cal;
  reg  [5:0]                                  color_2_cal;
  reg  [4:0]                                  color_3_cal;
  reg  [3:0]                                  color_4_cal;
  reg  [2:0]                                  color_5_cal;
  reg  [1:0]                                  color_6_cal;
  reg                                         color_7_cal;

  reg  [29:0]                                 vpg_payload_color_0;
  reg  [29:0]                                 vpg_payload_color_1;
  reg  [29:0]                                 vpg_payload_color_2;
  reg  [29:0]                                 vpg_payload_color_3;
  reg  [29:0]                                 vpg_payload_color_4;
  reg  [29:0]                                 vpg_payload_color_5;
  reg  [29:0]                                 vpg_payload_color_6;
  reg  [29:0]                                 vpg_payload_color_7;

  reg                                         p2_index;
  reg  [1:0]                                  p3_index;
  reg  [1:0]                                  p4_index;
  reg  [2:0]                                  p5_index;
  reg  [2:0]                                  p6_index;
  reg  [2:0]                                  p7_index;
  reg  [2:0]                                  p8_index;
  reg  [2:0]                                  p9_index;
  reg  [2:0]                                  p10_index;
  reg  [2:0]                                  p11_index;
  reg  [2:0]                                  p12_index;
  reg  [2:0]                                  p13_index;
  reg  [2:0]                                  p14_index;
  reg  [2:0]                                  p15_index;
  reg  [2:0]                                  p16_index;

  reg                                        p2_index_nxt;
  reg [1:0]                                  p3_index_nxt;
  reg [1:0]                                  p4_index_nxt;
  reg [2:0]                                  p5_index_nxt;
  reg [2:0]                                  p6_index_nxt;
  reg [2:0]                                  p7_index_nxt;
  reg [2:0]                                  p8_index_nxt;
  reg [2:0]                                  p9_index_nxt;
  reg [2:0]                                  p10_index_nxt;
  reg [2:0]                                  p11_index_nxt;
  reg [2:0]                                  p12_index_nxt;
  reg [2:0]                                  p13_index_nxt;
  reg [2:0]                                  p14_index_nxt;
  reg [2:0]                                  p15_index_nxt;
  reg [2:0]                                  p16_index_nxt;



  wire [29:0]                                 p1;
  reg  [29:0]                                 p2;
  reg  [29:0]                                 p3;
  reg  [29:0]                                 p4;
  reg  [29:0]                                 p5;
  reg  [29:0]                                 p6;
  reg  [29:0]                                 p7;
  reg  [29:0]                                 p8;
  reg  [29:0]                                 p9;
  reg  [29:0]                                 p10;
  reg  [29:0]                                 p11;
  reg  [29:0]                                 p12;
  reg  [29:0]                                 p13;
  reg  [29:0]                                 p14;
  reg  [29:0]                                 p15;
  reg  [29:0]                                 p16;


  reg  [71:0]                                 first_category_pixels;
  reg  [63:0]                                 second_category_pixels;
  reg  [79:0]                                 third_category_pixels;
  reg  [111:0]                                fourth_category_pixels;
  reg  [95:0]                                 fifth_category_pixels;
  reg  [111:0]                                vpg_payload_shifter;
  wire                                        vpg_hdr_req;
  wire                                        vpg_pld_req;
  wire                                        vpg_pld_req_pre;
  reg                                         vpg_pld_req_1d_r;
  wire [15:0]                                 vpg_wc_minus1;
  reg  [15:0]                                 vpg_wc_init;
  wire                                        vpg_wc_init_mt_tx_num;
  reg  [15-`CSI2_DEVICE_PLD_BYTEEN_WIDTH:0]   vpg_pld_req_cnt;
  reg  [15-`CSI2_DEVICE_PLD_BYTEEN_WIDTH:0]   vpg_pld_req_cnt_nxt;
  reg                                         vpg_pld_gen_end;
  reg                                         vpg_pld_gen_end_nxt;
  wire                                        vpg_pld_req_cnt_lt_2;
  reg                                         vpg_pld_req_mt1_prd_nxt;
  reg                                         vpg_pld_req_mt1_prd;
  reg                                         vpg_pld_1st_req;
  wire                                        vpg_pld_1st_req_nxt;
  reg                                         buf_wr_req;
  reg                                         buf_wr_req_nxt;
  wire                                        buf_wr;
  wire                                        almost_full;
  wire                                        fullz;
  reg                                         vpg_packet_req_nxt;
  wire                                        vpg_hdr_req_ack;
  reg                                         vpg_packet_req_pre2;
  reg                                         vpg_packet_req_pre2_nxt;
  wire                                        vpg_header_req_ack_pre2;
  reg  [`CSI2_DEVICE_HD_WIDTH-1:0]            vpg_header_pre2;
  reg                                         vpg_packet_req_pre1;
  reg                                         vpg_packet_req_pre1_nxt;
  wire                                        vpg_header_req_ack_pre1;
  reg  [`CSI2_DEVICE_HD_WIDTH-1:0]            vpg_header_pre1;
  wire [`CSI2_DEVICE_NAP_PLD_WIDTH-1:0]       vpg_pld_shift_out;


  //---- COMBINATIONAL/SEQUENTIAL PROCESSES --------------------------------------

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// VPG CRTL ////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////

  //The rising edge detection pulse of vpg_en
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_en_PROC
      if(~ppi_clkrstz) begin
          vpg_en_1d_r <= 1'b0;
          vpg_en_2d_r <= 1'b0;
      end else begin
          vpg_en_1d_r <= vpg_en;
          vpg_en_2d_r <= vpg_en_1d_r;
      end
  end //vpg_en_PROC

  assign vpg_en_re = vpg_en_1d_r & (~vpg_en_2d_r);

  //The counter enable generation
  //When vpg_en is de-asserted, complete frame timing should be finished and count_en should be de-asserted.
  assign count_en_clr = (hcounter == linecycle) & (vcounter == frameline) & (~vpg_en_1d_r);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : count_en_PROC
      if(~ppi_clkrstz)
          count_en <= 1'b0;
      else
          if(vpg_en_re)
              count_en <= 1'b1;
          else
              if(count_en_clr)
                  count_en <= 1'b0;
  end //count_en_PROC

  //The vpg_active generation
  //When vpg_en is de-asserted, complete frame should be finished to send and vpg_active should be de-asserted.
  assign all_request_finish = (fs_priority == 5'b0) &
                              (fe_priority == 5'b0) &
                              (ls_priority == 5'b0) &
                              (le_priority == 5'b0) &
                              (vp_priority == 5'b0);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_packet_req_1d_r_PROC
      if(~ppi_clkrstz)
          vpg_packet_req_1d_r <= 1'b0;
      else
          vpg_packet_req_1d_r <= vpg_packet_req;
  end //vpg_packet_req_1d_r_PROC

  assign vpg_packet_req_fe = (~vpg_packet_req) & vpg_packet_req_1d_r;

  //In normal case, when frame_end is one, all request is finished and vpg_packet_req is zero, so vpg_actvie will be de-asserted.
  //In error case, when all request is finished, vpg_packet_req will be de-asserted. So vpg_actvie will be de-asserted in the falling edge of vpg_packet_req.
  assign vpg_active_clr = (~count_en) & all_request_finish & (frame_end & (~vpg_packet_req)| vpg_packet_req_fe);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_active_PROC
      if(~ppi_clkrstz)
          vpg_active <= 1'b0;
      else
          if(vpg_en_re)
              vpg_active <= 1'b1;
          else
              if(vpg_active_clr)
                  vpg_active <= 1'b0;
  end //vpg_active_PROC

  //Vertical counter for frame lines
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vcounter_PROC
      if(~ppi_clkrstz)
          vcounter <= 15'd0;
      else
          if(count_en) begin
              if(hcounter == linecycle) begin
                  if(vcounter == frame_bk_line)
                      vcounter <= 15'b0;
                  else
                  // spyglass disable_block W484
                  // SMD: Possible assignment overflow.
                  // SJ: Overflow can't occur. Protected by protocol.
                      vcounter <= vcounter + 15'd1;
                  // spyglass enable_block W484
              end else
                  vcounter <= vcounter;
          end else
              vcounter <= 15'b0;
  end //vcounter_PROC

  //Horizontal counter for ppi_clk cycles of line
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : hcounter_PROC
      if(~ppi_clkrstz)
          hcounter <= 16'd0;
      else
          if(count_en) begin
              if(hcounter == linecycle)   // End of line
                  hcounter <= 16'b0;
              else
              // spyglass disable_block W484
              // SMD: Possible assignment overflow.
              // SJ: Overflow can't occur. Protected by protocol.
                  hcounter <= hcounter + 16'b1;
              // spyglass enable_block W484
          end else
              hcounter <= 16'b0;
  end //hcounter_PROC

  //The number of frame lines
  //VSA + VBP + VACTIVE + VFP
  // spyglass disable_block STARC05-2.10.6.6
  // SMD: The expression has more than one arithmetic operators
  // SJ: Better for code readability
  assign vpg_vsa_vbp_lines_qst_sum = (({5'd0,vpg_vsa_lines_qst} + {5'd0,vpg_vbp_lines_qst}) - 15'b1);
  // spyglass enable_block STARC05-2.10.6.6
  // spyglass disable_block W484
  // SMD: Possible assignment overflow.
  // SJ: Overflow can't occur. Protected by protocol.
  // spyglass disable_block W164a
  // SMD: LHS width is less than RHS width of assignment.
  // SJ: Overflow can't occur. Protected by protocol.
  assign vpg_vsa_vbp_vactive_lines_qst_sum = vpg_vsa_vbp_lines_qst_sum + {1'd0,vpg_vactive_lines_qst};
  assign frameline = vpg_vsa_vbp_vactive_lines_qst_sum + {5'd0,vpg_vfp_lines_qst};
  assign frame_bk_line = frameline + {5'd0,vpg_bk_lines_qst};
  // spyglass enable_block W164a
  // spyglass enable_block W484

  //The number of ppi_clk cycles of line
  //HLINE
  assign linecycle = {1'b0,vpg_hline_time_qst} - 16'b1;

  //The indication of VACTIVE
  //> VSA + VBP, <= VSA + VBP + VACTIVE
  assign vactline = (vcounter >  vpg_vsa_vbp_lines_qst_sum) &
                    (vcounter <= vpg_vsa_vbp_vactive_lines_qst_sum);

  //The end point of frame
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : frame_end_PROC
      if(~ppi_clkrstz)
          frame_end <= 1'b0;
      else
          frame_end <= (hcounter == linecycle) & (vcounter == frameline);
  end //frame_end_PROC

  //Frame start packet request
  //If a request is not accepted and the same request is generated again, the same request will be lost.
  //When the condition of request is generated, check the other request and set the priority number of this request.
  //The 5'b00001 is highest priority and the 5'b10000 is lowest priority.
  //The request of FS is generated when the hcounter is 0.
  assign vsync_start = count_en & (hcounter == 16'b0) & (vcounter == 15'b0);
  assign fs_req_en   = vsync_start;

  // spyglass disable_block STARC05-2.10.6.6
  // SMD: The expression has more than one arithmetic operators
  // SJ: Better for code readability
  assign fs_priority_val = {2'b0,fe_req & (~fe_req_ack)} + {2'b0,ls_req & (~ls_req_ack)} +
                           {2'b0,le_req & (~le_req_ack)} + {2'b0,vp_req & (~vp_req_ack)};
  // spyglass enable_block STARC05-2.10.6.6

  // The generation of frame start request lost, frame start request and frame start request priority .
  // The -> means the fs_priority shift one bit to right.
  // The * means it generates the packet for the request which is highest priority base on the priority of all requests.
  // Current                                |     Next
  // fs_req_en  fs_req  fs_req_ack  req_ack | fs_req_lost    fs_req    fs_priority
  // ______________________________________ |_________________________________________
  //     0        0         0          0    |       0        fs_req    fs_priority
  //     0        0         0          1    |       0        fs_req    fs_priority
  //     0        1         0          0    |       0        fs_req    fs_priority
  //     0        1         0          1    |       0        fs_req    fs_priority->
  //     0        1         1          1    |       0           0      fs_priority->
  //
  //     1        0         0          0    |       0           1      fs_priority*
  //     1        0         0          1    |       0           1      fs_priority*
  //     1        1         0          0    |       1        fs_req    fs_priority
  //     1        1         0          1    |       1        fs_req    fs_priority->
  //     1        1         1          1    |       0        fs_req    fs_priority*

  // Current                                |     Next
  // fs_req_en  fs_req  fs_req_ack  req_ack | fs_req_lost
  // ______________________________________ |_____________
  //     1        1         0          0    |       1
  //     1        1         0          1    |       1
    assign fs_req_lost_set = fs_req_en & fs_req & (~fs_req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : fs_req_lost_PROC
      if(~ppi_clkrstz)
          fs_req_lost  <= 1'd0;
      else
          if(vpg_en_re)
              fs_req_lost  <= 1'd0;
          else
              if(fs_req_lost_set)
                  fs_req_lost <= 1'b1;
              else
                  fs_req_lost <= 1'b0;
  end //fs_req_lost_PROC

  // Current                                |Next
  // fs_req_en  fs_req  fs_req_ack  req_ack |fs_req
  // ______________________________________ |______
  //     0        1         1          1    |   0
  //     1        0         0          0    |   1
  //     1        0         0          1    |   1
  assign fs_req_set = fs_req_en & (~fs_req) ;
  assign fs_req_clr = (~fs_req_en) & fs_req_ack;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : fs_req_PROC
      if(~ppi_clkrstz)
          fs_req  <= 1'd0;
      else
          if(vpg_en_re)
              fs_req  <= 1'd0;
          else
              if(fs_req_set)
                  fs_req <= 1'b1;
              else
                  if(fs_req_clr)
                      fs_req <= 1'b0;
  end //fs_req_PROC

  // Current                                |Next
  // fs_req_en  fs_req  fs_req_ack  req_ack |fs_priority
  // ______________________________________ |_______________
  //     0        1         1          1    |fs_priority->
  //     0        1         0          1    |fs_priority->
  //     1        1         0          1    |fs_priority->
  //     1        0         0          0    |fs_priority*
  //     1        0         0          1    |fs_priority*
  //     1        1         1          1    |fs_priority*
  assign fs_priority_gen  =  (fs_req_en & (~fs_req))|
                             (fs_req_en & fs_req_ack) ;

  assign fs_priority_shift = ((~fs_req_en) & fs_req & req_ack) |
                              (fs_req & (~fs_req_ack) & req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : fs_priority_PROC
      if(~ppi_clkrstz)
          fs_priority  <= 5'b0;
      else
          if(vpg_en_re)
              fs_priority  <= 5'b0;
          else
              if(fs_priority_gen)
                  case(fs_priority_val)
                      3'd0: fs_priority <= 5'b00001;
                      3'd1: fs_priority <= 5'b00010;
                      3'd2: fs_priority <= 5'b00100;
                      3'd3: fs_priority <= 5'b01000;
                      default: fs_priority <= 5'b10000;
                  endcase
              else
                  if(fs_priority_shift)
                      fs_priority   <= {1'b0,fs_priority[4:1]};
  end //fs_priority_PROC

  //Frame end packet request
  //When vpg_en is de-asserted, complete frame timing should be finished and a Frame End Packet should be sent.
  //If a request is not accepted and the same request is generated again, the same request will be lost.
  //When the condition of request is generated, check the other request and set the priority number of this request.
  //The 5'b00001 is highest priority and the 5'b10000 is lowest priority.
  //The request of LS is generated when the hcounter is 3. When hline is less than 3, the request of LS is generated when the hcounter is hline.
  assign fe_req_en   = count_en & (vcounter == frameline) & ((linecycle < 16'h3)? (hcounter == linecycle):
                                                                                  (hcounter == 16'h3));
  // spyglass disable_block STARC05-2.10.6.6
  // SMD: The expression has more than one arithmetic operators
  // SJ: Better for code readability
  assign fe_priority_val = {2'b0,fs_req & (~fs_req_ack)} + {2'b0,ls_req & (~ls_req_ack)} +
                           {2'b0,le_req & (~le_req_ack)} + {2'b0,vp_req & (~vp_req_ack)};
  // spyglass enable_block STARC05-2.10.6.6

  // The generation of frame start request lost, frame start request and frame start request priority .
  // The -> means the fs_priority shift one bit to right.
  // The * means it generates the packet for the request which is highest priority base on the priority of all requests.
  // Current                                |     Next
  // fe_req_en  fe_req  fe_req_ack  req_ack | fe_req_lost    fe_req    fe_priority
  // ______________________________________ |_________________________________________
  //     0        0         0          0    |       0        fe_req    fe_priority
  //     0        0         0          1    |       0        fe_req    fe_priority
  //     0        1         0          0    |       0        fe_req    fe_priority
  //     0        1         0          1    |       0        fe_req    fe_priority->
  //     0        1         1          1    |       0           0      fe_priority->
  //
  //     1        0         0          0    |       0           1      fe_priority*
  //     1        0         0          1    |       0           1      fe_priority*
  //     1        1         0          0    |       1        fe_req    fe_priority
  //     1        1         0          1    |       1        fe_req    fe_priority->
  //     1        1         1          1    |       0        fe_req    fe_priority*

  // Current                                |     Next
  // fe_req_en  fe_req  fe_req_ack  req_ack | fe_req_lost
  // ______________________________________ |_____________
  //     1        1         0          0    |       1
  //     1        1         0          1    |       1
  assign fe_req_lost_set = fe_req_en & fe_req & (~fe_req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : fe_req_lost_PROC
      if(~ppi_clkrstz)
          fe_req_lost  <= 1'd0;
      else
          if(vpg_en_re)
              fe_req_lost  <= 1'd0;
          else
              if(fe_req_lost_set)
                  fe_req_lost <= 1'b1;
              else
                  fe_req_lost <= 1'b0;
  end //fe_req_lost_PROC

  // Current                                |Next
  // fe_req_en  fe_req  fe_req_ack  req_ack |fe_req
  // ______________________________________ |______
  //     0        1         1          1    |   0
  //     1        0         0          0    |   1
  //     1        0         0          1    |   1
  assign fe_req_set = fe_req_en & (~fe_req);
  assign fe_req_clr = (~fe_req_en) & fe_req_ack;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : fe_req_PROC
      if(~ppi_clkrstz)
          fe_req  <= 1'd0;
      else
          if(vpg_en_re)
              fe_req  <= 1'd0;
          else
              if(fe_req_set)
                  fe_req <= 1'b1;
              else
                  if(fe_req_clr)
                      fe_req <= 1'b0;
  end //fe_req_PROC

  // Current                                |Next
  // fe_req_en  fe_req  fe_req_ack  req_ack |fe_priority
  // ______________________________________ |_______________
  //     0        1         1          1    |fe_priority->
  //     0        1         0          1    |fe_priority->
  //     1        1         0          1    |fe_priority->
  //     1        0         0          0    |fe_priority*
  //     1        0         0          1    |fe_priority*
  //     1        1         1          1    |fe_priority*
  assign fe_priority_gen  =  (fe_req_en & (~fe_req))|
                             (fe_req_en & fe_req_ack) ;

  assign fe_priority_shift = ((~fe_req_en) & fe_req & req_ack) |
                              (fe_req & (~fe_req_ack) & req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : fe_priority_PROC
      if(~ppi_clkrstz)
          fe_priority  <= 5'b0;
      else
          if(vpg_en_re)
              fe_priority  <= 5'b0;
          else
              if(fe_priority_gen)
                  case(fe_priority_val)
                      3'd0: fe_priority <= 5'b00001;
                      3'd1: fe_priority <= 5'b00010;
                      3'd2: fe_priority <= 5'b00100;
                      3'd3: fe_priority <= 5'b01000;
                      default: fe_priority <= 5'b10000;
                  endcase
              else
                  if(fe_priority_shift)
                      fe_priority   <= {1'b0,fe_priority[4:1]};
  end //fe_priority_PROC

  //Line start packet request
  //If a request is not accepted and the same request is generated again, the same request will be lost.
  //When the condition of request is generated, check the other request and set the priority number of this request.
  //The 5'b00001 is highest priority and the 5'b10000 is lowest priority.
  //The request of LS is generated when the hcounter is 1. When hline is less than 1, the request of LS is generated when the hcounter is hline.
  assign ls_req_en         = count_en & (vcounter <= frameline) & ((linecycle < 16'h1)? (hcounter == linecycle):
                                                                                        (hcounter == 16'h1));
  // spyglass disable_block STARC05-2.10.6.6
  // SMD: The expression has more than one arithmetic operators
  // SJ: Better for code readability
  assign ls_priority_val = {2'b0,fe_req & (~fe_req_ack)} + {2'b0,fs_req & (~fs_req_ack)} +
                           {2'b0,le_req & (~le_req_ack)} + {2'b0,vp_req & (~vp_req_ack)};
  // spyglass enable_block STARC05-2.10.6.6

  // The generation of frame start request lost, frame start request and frame start request priority .
  // The -> means the fs_priority shift one bit to right.
  // The * means it generates the packet for the request which is highest priority base on the priority of all requests.
  // Current                                |     Next
  // ls_req_en  ls_req  ls_req_ack  req_ack | ls_req_lost    ls_req    ls_priority
  // ______________________________________ |_________________________________________
  //     0        0         0          0    |       0        ls_req    ls_priority
  //     0        0         0          1    |       0        ls_req    ls_priority
  //     0        1         0          0    |       0        ls_req    ls_priority
  //     0        1         0          1    |       0        ls_req    ls_priority->
  //     0        1         1          1    |       0           0      ls_priority->
  //
  //     1        0         0          0    |       0           1      ls_priority*
  //     1        0         0          1    |       0           1      ls_priority*
  //     1        1         0          0    |       1        ls_req    ls_priority
  //     1        1         0          1    |       1        ls_req    ls_priority->
  //     1        1         1          1    |       0        ls_req    ls_priority*

  // Current                                |     Next
  // ls_req_en  ls_req  ls_req_ack  req_ack | ls_req_lost
  // ______________________________________ |_____________
  //     1        1         0          0    |       1
  //     1        1         0          1    |       1
  assign ls_req_lost_set = ls_req_en & ls_req & (~ls_req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : ls_req_lost_PROC
      if(~ppi_clkrstz)
          ls_req_lost  <= 1'd0;
      else
          if(vpg_en_re|(~vpg_hsync_packet_en_qst))
              ls_req_lost  <= 1'd0;
          else
              if(ls_req_lost_set)
                  ls_req_lost <= 1'b1;
              else
                  ls_req_lost <= 1'b0;
  end //ls_req_lost_PROC

  // Current                                |Next
  // ls_req_en  ls_req  ls_req_ack  req_ack |ls_req
  // ______________________________________ |______
  //     0        1         1          1    |   0
  //     1        0         0          0    |   1
  //     1        0         0          1    |   1
  assign ls_req_set = ls_req_en & (~ls_req);
  assign ls_req_clr = (~ls_req_en) & ls_req_ack;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : ls_req_PROC
      if(~ppi_clkrstz)
          ls_req  <= 1'd0;
      else
          if(vpg_en_re|(~vpg_hsync_packet_en_qst))
              ls_req  <= 1'd0;
          else
              if(ls_req_set)
                  ls_req <= 1'b1;
              else
                  if(ls_req_clr)
                      ls_req <= 1'b0;
  end //ls_req_PROC

  // Current                                |Next
  // ls_req_en  ls_req  ls_req_ack  req_ack |ls_priority
  // ______________________________________ |_______________
  //     0        1         1          1    |ls_priority->
  //     0        1         0          1    |ls_priority->
  //     1        1         0          1    |ls_priority->
  //     1        0         0          0    |ls_priority*
  //     1        0         0          1    |ls_priority*
  //     1        1         1          1    |ls_priority*
  assign ls_priority_gen  =  (ls_req_en & (~ls_req))|
                             (ls_req_en & ls_req_ack) ;

  assign ls_priority_shift = ((~ls_req_en) & ls_req & req_ack) |
                              (ls_req & (~ls_req_ack) & req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : ls_priority_PROC
      if(~ppi_clkrstz)
          ls_priority  <= 5'b0;
      else
          if(vpg_en_re|(~vpg_hsync_packet_en_qst))
              ls_priority  <= 5'b0;
          else
              if(ls_priority_gen)
                  case(ls_priority_val)
                      3'd0: ls_priority <= 5'b00001;
                      3'd1: ls_priority <= 5'b00010;
                      3'd2: ls_priority <= 5'b00100;
                      3'd3: ls_priority <= 5'b01000;
                      default: ls_priority <= 5'b10000;
                  endcase
              else
                  if(ls_priority_shift)
                      ls_priority   <= {1'b0,ls_priority[4:1]};
  end //ls_priority_PROC

  //Line end packet request
  //If a request is not accepted and the same request is generated again, the same request will be lost.
  //When the condition of request is generated, check the other request and set the priority number of this request.
  //The 5'b00001 is highest priority and the 5'b10000 is lowest priority.
  //The request of LE is generated when the hcounter is 0. The request of Last LE is generated when the hcounter is 2.
  //When hline is less than 2, the request of Last LS is generated when the hcounter is hline.
  assign hsync_start    = count_en & (hcounter == 16'b0) & (vcounter <= frameline);
  assign last_le_en     = count_en & (vcounter == frameline) & ((linecycle < 16'h2)? (hcounter == linecycle):
                                                                                     (hcounter == 16'h2));
  assign le_req_en      = (hsync_start & (~vsync_start)) | last_le_en;

  // spyglass disable_block STARC05-2.10.6.6
  // SMD: The expression has more than one arithmetic operators
  // SJ: Better for code readability
  assign le_priority_val = {2'b0,fe_req & (~fe_req_ack)} + {2'b0,fs_req & (~fs_req_ack)} +
                           {2'b0,ls_req & (~ls_req_ack)} + {2'b0,vp_req & (~vp_req_ack)};
  // spyglass enable_block STARC05-2.10.6.6

  // The generation of frame start request lost, frame start request and frame start request priority .
  // The -> means the fs_priority shift one bit to right.
  // The * means it generates the packet for the request which is highest priority base on the priority of all requests.
  // Current                                |     Next
  // le_req_en  le_req  le_req_ack  req_ack | le_req_lost    le_req    le_priority
  // ______________________________________ |_________________________________________
  //     0        0         0          0    |       0        le_req    le_priority
  //     0        0         0          1    |       0        le_req    le_priority
  //     0        1         0          0    |       0        le_req    le_priority
  //     0        1         0          1    |       0        le_req    le_priority->
  //     0        1         1          1    |       0           0      le_priority->
  //
  //     1        0         0          0    |       0           1      le_priority*
  //     1        0         0          1    |       0           1      le_priority*
  //     1        1         0          0    |       1        le_req    le_priority
  //     1        1         0          1    |       1        le_req    le_priority->
  //     1        1         1          1    |       0        le_req    le_priority*

  // Current                                |     Next
  // le_req_en  le_req  le_req_ack  req_ack | le_req_lost
  // ______________________________________ |_____________
  //     1        1         0          0    |       1
  //     1        1         0          1    |       1
  assign le_req_lost_set = le_req_en & le_req & (~le_req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : le_req_lost_PROC
      if(~ppi_clkrstz)
          le_req_lost  <= 1'd0;
      else
          if(vpg_en_re|(~vpg_hsync_packet_en_qst))
              le_req_lost  <= 1'd0;
          else
              if(le_req_lost_set)
                  le_req_lost <= 1'b1;
              else
                  le_req_lost <= 1'b0;
  end //le_req_lost_PROC

  // Current                                |Next
  // le_req_en  le_req  le_req_ack  req_ack |le_req
  // ______________________________________ |______
  //     0        1         1          1    |   0
  //     1        0         0          0    |   1
  //     1        0         0          1    |   1
  assign le_req_set = le_req_en & (~le_req);
  assign le_req_clr = (~le_req_en) & le_req_ack;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : le_req_PROC
      if(~ppi_clkrstz)
          le_req  <= 1'd0;
      else
          if(vpg_en_re|(~vpg_hsync_packet_en_qst))
              le_req  <= 1'd0;
          else
              if(le_req_set)
                  le_req <= 1'b1;
              else
                  if(le_req_clr)
                      le_req <= 1'b0;
  end //le_req_PROC

  // Current                                |Next
  // le_req_en  le_req  le_req_ack  req_ack |le_priority
  // ______________________________________ |_______________
  //     0        1         1          1    |le_priority->
  //     0        1         0          1    |le_priority->
  //     1        1         0          1    |le_priority->
  //     1        0         0          0    |le_priority*
  //     1        0         0          1    |le_priority*
  //     1        1         1          1    |le_priority*
  assign le_priority_gen  =  (le_req_en & (~le_req))|
                             (le_req_en & le_req_ack) ;

  assign le_priority_shift = ((~le_req_en) & le_req & req_ack) |
                              (le_req & (~le_req_ack) & req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : le_priority_PROC
      if(~ppi_clkrstz)
          le_priority  <= 5'b0;
      else
          if(vpg_en_re|(~vpg_hsync_packet_en_qst))
              le_priority  <= 5'b0;
          else
              if(le_priority_gen)
                  case(le_priority_val)
                      3'd0: le_priority <= 5'b00001;
                      3'd1: le_priority <= 5'b00010;
                      3'd2: le_priority <= 5'b00100;
                      3'd3: le_priority <= 5'b01000;
                      default: le_priority <= 5'b10000;
                  endcase
              else
                  if(le_priority_shift)
                      le_priority   <= {1'b0,le_priority[4:1]};
  end //le_priority_PROC

  //video pattern packet request
  //If a request is not accepted and the same request is generated again, the same request will be lost.
  //When the condition of request is generated, check the other request and set the priority number of this request.
  //The 5'b00001 is highest priority and the 5'b10000 is lowest priority.
  //The request of Data Packet is generated when the hcounter is vpg_hsa_time_qst + vpg_hbp_time_qst.
  //When hline is less than vpg_hsa_time_qst + vpg_hbp_time_qst, the request of LS is generated when the hcounter is hline.
  assign vpg_hsa_hbp_time_qst_sum = ({4'd0,vpg_hsa_time_qst} + {4'd0,vpg_hbp_time_qst});
  assign hactcycle_start  = vactline & ((linecycle < vpg_hsa_hbp_time_qst_sum)?(hcounter == linecycle):
                                                                               (hcounter == vpg_hsa_hbp_time_qst_sum));
//  assign vline_end = vactline & (hcounter == linecycle);
  assign vp_req_en        = hactcycle_start;

  // spyglass disable_block STARC05-2.10.6.6
  // SMD: The expression has more than one arithmetic operators
  // SJ: Better for code readability
  assign vp_priority_val = {2'b0,fs_req & (~fs_req_ack)} + {2'b0,fe_req & (~fe_req_ack)} +
                           {2'b0,ls_req & (~ls_req_ack)} + {2'b0,le_req & (~le_req_ack)};
  // spyglass enable_block STARC05-2.10.6.6

  // The generation of frame start request lost, frame start request and frame start request priority .
  // The -> means the fs_priority shift one bit to right.
  // The * means it generates the packet for the request which is highest priority base on the priority of all requests.
  // Current                                |     Next
  // vp_req_en  vp_req  vp_req_ack  req_ack | vp_req_lost   vp_req    vp_priority
  // _______________________________________|_________________________________________________
  //     0         0        0          0    |      0        vp_req    vp_priority
  //     0         0        0          1    |      0        vp_req    vp_priority
  //     0         1        0          0    |      0        vp_req    vp_priority
  //     0         1        0          1    |      0        vp_req    vp_priority->
  //     0         1        1          1    |      0           0      vp_priority->
  //
  //     1         0        0          0    |      0           1      vp_priority*
  //     1         0        0          1    |      0           1      vp_priority*
  //     1         1        0          0    |      1        vp_req    vp_priority
  //     1         1        0          1    |      1        vp_req    vp_priority->
  //     1         1        1          1    |      0        vp_req    vp_priority*

  // Current                                |     Next
  // vp_req_en  vp_req  vp_req_ack  req_ack | vp_req_lost
  // _______________________________________|_____________
  //     1        1          0         0    |       1
  //     1        1          0         1    |       1
  assign vp_req_lost_set = vp_req_en & vp_req & (~vp_req_ack);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vp_req_lost_PROC
      if(~ppi_clkrstz)
          vp_req_lost  <= 1'd0;
      else
          if(vpg_en_re)
              vp_req_lost  <= 1'd0;
          else
              if(vp_req_lost_set)
                  vp_req_lost <= 1'b1;
              else
                  vp_req_lost <= 1'b0;
  end //vp_req_lost_PROC

  // Current                                |Next
  // vp_req_en  vp_req  vp_req_ack  req_ack |vp_req
  // ______________________________________ |______
  //     0        1         1          1    |   0
  //     1        0         0          0    |   1
  //     1        0         0          1    |   1
  assign vp_req_set = vp_req_en & (~vp_req) ;
  assign vp_req_clr = (~vp_req_en) & vp_req_ack;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vp_req_PROC
      if(~ppi_clkrstz)
          vp_req  <= 1'd0;
      else
          if(vpg_en_re)
              vp_req  <= 1'd0;
          else
              if(vp_req_set)
                  vp_req <= 1'b1;
              else
                  if(vp_req_clr)
                      vp_req <= 1'b0;
  end //vp_req_PROC

  // Current                                |Next
  // vp_req_en  vp_req  vp_req_ack  req_ack |vp_priority
  // ______________________________________ |_______________
  //     0        1         1          1    |vp_priority->
  //     0        1         0          1    |vp_priority->
  //     1        1         0          1    |vp_priority->
  //     1        0         0          0    |vp_priority*
  //     1        0         0          1    |vp_priority*
  //     1        1         1          1    |vp_priority*
  assign vp_priority_gen  =  (vp_req_en & (~vp_req))|
                             (vp_req_en & vp_req_ack) ;

  assign vp_priority_shift = (((~vp_req_en) & vp_req & req_ack) |
                              (vp_req & (~vp_req_ack) & req_ack)) & (sent_pixels == 14'b0);

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vp_priority_PROC
      if(~ppi_clkrstz)
          vp_priority  <= 5'b0;
      else
          if(vpg_en_re)
              vp_priority  <= 5'b0;
          else
              if(vp_priority_gen)
                  case(vp_priority_val)
                      3'd0: vp_priority <= 5'b00001;
                      3'd1: vp_priority <= 5'b00010;
                      3'd2: vp_priority <= 5'b00100;
                      3'd3: vp_priority <= 5'b01000;
                      default: vp_priority <= 5'b10000;
                  endcase
              else
                  if(vp_priority_shift)
                      vp_priority   <= {1'b0,vp_priority[4:1]};
  end //vp_priority_PROC

  //Current Line and Odd/Even Lineindication in VACTIVE
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : current_line_PROC
      if(~ppi_clkrstz)begin
          current_line <= `CSI2_DEVICE_VPG_ACT_LINES_RS'b0;
      end else begin
          if(fs_req_ack)begin
              current_line <= `CSI2_DEVICE_VPG_ACT_LINES_RS'b1;
          end else begin
              if(vpg_pld_gen_end)begin
              // spyglass disable_block W484
              // SMD: Possible assignment overflow.
              // SJ: Overflow can't occur. Protected by protocol.
                  current_line <= current_line + `CSI2_DEVICE_VPG_ACT_LINES_RS'b1;
              // spyglass enable_block W484
              end
          end
      end
  end //current_odd_line_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_PROC
      if(~ppi_clkrstz)
          odd_line     <= 1'b0;
      else
          if(fs_req_ack)
              odd_line <= 1'b1;
          else
              if(vpg_pld_gen_end)
                  odd_line <= ~odd_line;
  end //odd_line_PROC

  assign vpg_hdr_req = fs_req | fe_req | ls_req | le_req | vp_req;

  //The ack for packet request
  //The requested order should be guaranteed.
  assign req_ack           = ~(vpg_packet_req_pre2 & (~vpg_header_req_ack_pre2));
  assign vpg_hdr_req_ack   = vpg_hdr_req & req_ack;

  assign vp_req_ack         = vp_priority[0] & req_ack & (sent_pixels == 14'b0);
  assign fs_req_ack         = fs_priority[0] & req_ack;
  assign fe_req_ack         = fe_priority[0] & req_ack;
  assign ls_req_ack         = ls_priority[0] & req_ack;
  assign le_req_ack         = le_priority[0] & req_ack;

  //If there is a request is not accepted by state machine and the same request is happened again, the second request will be lost.
  //If a packet request is lost, the packet lost alarm will happen.
  assign vpg_packet_lost_en = fs_req_lost | fe_req_lost | ls_req_lost | le_req_lost| vp_req_lost;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_packet_lost_PROC
      if(~ppi_clkrstz)
          vpg_packet_lost <= 1'b0;
      else
          if(vpg_packet_lost_ack)
              vpg_packet_lost <= 1'b0;
          else
              if(vpg_packet_lost_en)
                  vpg_packet_lost <= 1'b1;
  end //vpg_packet_lost_PROC

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// HEADER INFORMATION GENERATION ///////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  //Calculate the bit number of one packet based on data type and packet size and odd/even line
//  assign next_odd_line = ~odd_line;
  always @* begin : vpg_pkt_bits_PROC
      case(vpg_dt_qst)
          `CSI2_RAW6: begin // Bits of one pixel is 6
              vpg_pkt_bits    = {3'b0,vpg_pkt_size_qst,2'b0} +
                                {4'b0,vpg_pkt_size_qst,1'b0} ;
          end
          `CSI2_RAW7: begin // Bits of one pixel is 7
              // spyglass disable_block STARC05-2.10.6.6
              // SMD: The expression has more than one arithmetic operators
              // SJ: Better for code readability
              vpg_pkt_bits    = {3'b0,vpg_pkt_size_qst,2'b0} +
                                {4'b0,vpg_pkt_size_qst,1'b0} +
                                {5'b0,vpg_pkt_size_qst} ;
              // spyglass enable_block STARC05-2.10.6.6
          end
          `CSI2_RAW8:begin // Bits of one pixel is 8
              vpg_pkt_bits    = {2'b0,vpg_pkt_size_qst,3'b0};
          end
          `CSI2_CSPS_Y420_8B,
          `CSI2_Y420_8B:begin
              if(odd_line)  // Bits of one pixel is 8
                  vpg_pkt_bits    = {2'b0,vpg_pkt_size_qst,3'b0};
              else         // Bits of one pixel is 16
                  vpg_pkt_bits    = {1'b0,vpg_pkt_size_qst,4'b0};
          end
          `CSI2_RAW10:begin // Bits of one pixel is 10
              vpg_pkt_bits    = {2'b0,vpg_pkt_size_qst,3'b0} +
                                {4'b0,vpg_pkt_size_qst,1'b0};
          end
          `CSI2_CSPS_Y420_10B,
          `CSI2_Y420_10B:begin
              if(odd_line)  // Bits of one pixel is 8
                  vpg_pkt_bits    = {2'b0,vpg_pkt_size_qst,3'b0} +
                                    {4'b0,vpg_pkt_size_qst,1'b0};
              else        // Bits of one pixel is 20
                  vpg_pkt_bits    = {1'b0,vpg_pkt_size_qst,4'b0} +
                                    {3'b0,vpg_pkt_size_qst,2'b0} ;
          end
          `CSI2_RAW12,
          `CSI2_LY420_8B:begin // Bits of one pixel is 12
              vpg_pkt_bits    = {2'b0,vpg_pkt_size_qst,3'b0} +
                                {3'b0,vpg_pkt_size_qst,2'b0};
          end
          `CSI2_RAW14:begin // Bits of one pixel is 14
              // spyglass disable_block STARC05-2.10.6.6
              // SMD: The expression has more than one arithmetic operators
              // SJ: Better for code readability
              vpg_pkt_bits    = {2'b0,vpg_pkt_size_qst,3'b0} +
                                {3'b0,vpg_pkt_size_qst,2'b0} +
                                {4'b0,vpg_pkt_size_qst,1'b0} ;
              // spyglass enable_block STARC05-2.10.6.6
          end
          `CSI2_RGB444,
          `CSI2_RGB555,
          `CSI2_RGB565,
          `CSI2_Y422_8B,
          `CSI2_RAW16:begin // Bits of one pixel is 16
              vpg_pkt_bits    = {1'b0,vpg_pkt_size_qst,4'b0};
          end
          `CSI2_RGB666:begin // Bits of one pixel is 18
              vpg_pkt_bits    = {1'b0,vpg_pkt_size_qst,4'b0} +
                                {4'b0,vpg_pkt_size_qst,1'b0};
          end
          `CSI2_Y422_10B,
          `CSI2_RAW20:begin // Bits of one pixel is 20
              vpg_pkt_bits    = {1'b0,vpg_pkt_size_qst,4'b0} +
                                {3'b0,vpg_pkt_size_qst,2'b0};
          end
          `CSI2_RAW24,
          `CSI2_RGB888:begin // Bits of one pixel is 24
              vpg_pkt_bits    = {1'b0,vpg_pkt_size_qst,4'b0} +
                                {2'b0,vpg_pkt_size_qst,3'b0};
          end
          default:begin
              // spyglass disable_block UnloadedNet-ML
              // SMD: Unloaded but driven net detected in the design
              // SJ: Some bits of the signal may not be needed in different configurations
              // spyglass disable_block checkNetReceiver
              // SMD: Each internal net must have at least one receiver.
              // SJ: Some bits of the signal may not be needed in different configurations.
              vpg_pkt_bits = 19'b0;
              // spyglass enable_block checkNetReceiver
              // spyglass enable_block UnloadedNet-ML
          end
      endcase
  end //vpg_pkt_bits_PROC

  //word count = one_packet_bits/8
  assign vpg_wc = vpg_pkt_bits[18:3];

  //Frame number
  //0: Frame Number Zero mode.
  //1: Frame Number Increments One mode
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : frame_number_PROC
    if(~ppi_clkrstz)
        frame_number    <= 16'b0;
    else
        if(vpg_frame_num_mode_qst)
            if(vpg_en_re)
                frame_number    <= 16'b1;
            else
                if(fe_req_ack)
                    if(frame_number == vpg_max_frame_num_qst)
                        frame_number    <= 16'b1;
                    else
                    // spyglass disable_block W484
                    // SMD: Possible assignment overflow.
                    // SJ: Overflow can't occur. Protected by protocol.
                        frame_number    <= frame_number + 16'b1;
                    // spyglass enable_block W484
                else
                    frame_number    <= frame_number;
        else
            frame_number    <= 16'b0;
  end //frame_number_PROC

  //Line number
  //00: Line Number Zero mode.
  //01: Line Number Increments One mode
  //10: Line Number Increments Arbitrary Value mode
  //11: Reserved
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : line_number_PROC
    if(~ppi_clkrstz)
        line_number    <= 16'b0;
    else
        case(vpg_line_num_mode_qst)
            2'b01:begin
                if(fs_req_ack|vpg_en_re)
                    line_number    <= 16'b1;
                else
                    if(le_req_ack)
                    // spyglass disable_block W484
                    // SMD: Possible assignment overflow.
                    // SJ: Overflow can't occur. Protected by protocol.
                        line_number    <= line_number + 16'b1;
                    // spyglass enable_block W484
                    else
                        line_number    <= line_number;
            end
            2'b10:begin
                if(fs_req_ack|vpg_en_re)
                    line_number    <= vpg_start_line_num_qst;
                else
                    if(le_req_ack)
                    // spyglass disable_block W484
                    // SMD: Possible assignment overflow.
                    // SJ: Overflow can't occur. Protected by protocol.
                    // spyglass disable_block W164a
                    // SMD: LHS width is less than RHS width of assignment.
                    // SJ: Overflow can't occur. Protected by protocol.
                        line_number    <= line_number + vpg_step_line_num_qst;
                    // spyglass enable_block W164a
                    // spyglass enable_block W484
                    else
                        line_number    <= line_number;
            end
            default:begin
                line_number    <= 16'b0;
            end
        endcase
  end //line_number_PROC

  //Header information generation
  assign req_ack_val = {vp_req_ack,fs_req_ack,fe_req_ack,ls_req_ack,le_req_ack};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : header_gen_PROC
    if(~ppi_clkrstz) begin
      vpg_header_pre2  <= {`CSI2_DEVICE_HD_WIDTH{1'b0}};
    end else begin
        if(vpg_hdr_req_ack) begin
            vpg_header_pre2[`CSI2_DEVICE_HD_WIDTH-1:24] <= vpg_vcx_qst;
            case(req_ack_val)
                5'b00001:begin //Line End Packet
                    vpg_header_pre2[23:0] <= {line_number[15:0],vpg_vc_qst,`CSI2_LINE_END_CODE};
                end
                5'b00010:begin //Line Start Packet
                    vpg_header_pre2[23:0] <= {line_number[15:0],vpg_vc_qst,`CSI2_LINE_START_CODE};
                end
                5'b00100:begin //Frame EnPROCd Packet
                    vpg_header_pre2[23:0] <= {frame_number[15:0],vpg_vc_qst,`CSI2_FRAME_END_CODE};
                end
                5'b01000:begin //Frame Start Packet
                    vpg_header_pre2[23:0] <= {frame_number[15:0],vpg_vc_qst,`CSI2_FRAME_START_CODE};
                end
                default:begin //5'b10000 video pattern packet
                    vpg_header_pre2[23:0] <= {vpg_wc[15:0],vpg_vc_qst,vpg_dt_qst};
                end
            endcase
        end
    end
  end //header_gen_PROC

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// PIXEL ENCODING //////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  //The position of the previous seven color bar in vertical mode
  //1 * vertical_color_pixels
  //2 * vertical_color_pixels
  //3 * vertical_color_pixels
  //4 * vertical_color_pixels
  //5 * vertical_color_pixels
  //6 * vertical_color_pixels
  //7 * vertical_color_pixels
  assign vertical_color_pixels = vpg_pkt_size_qst[13:3];
  // spyglass disable_block FlopDataConstant
  // SMD: Flip-flop data pin driven by a constant value
  // SJ: Extra bits are added intentionally
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vertical_color_position_PROC
      if(~ppi_clkrstz) begin
          vertical_color1_position <= 14'b0;
          vertical_color2_position <= 14'b0;
          vertical_color3_position <= 14'b0;
          vertical_color4_position <= 14'b0;
          vertical_color5_position <= 14'b0;
          vertical_color6_position <= 14'b0;
          vertical_color7_position <= 14'b0;
      end else begin
          if(hsync_start)begin
              vertical_color1_position <= {3'b0,vertical_color_pixels};
              vertical_color2_position <= {2'b0,vertical_color_pixels,1'b0};
              vertical_color3_position <= {2'b0,vertical_color_pixels,1'b0} +
                                          {3'b0,vertical_color_pixels};
              vertical_color4_position <= {1'b0,vertical_color_pixels,2'b0};
              vertical_color5_position <= {1'b0,vertical_color_pixels,2'b0} +
                                          {3'b0,vertical_color_pixels};
              vertical_color6_position <= {1'b0,vertical_color_pixels,2'b0} +
                                          {2'b0,vertical_color_pixels,1'b0};
              // spyglass disable_block STARC05-2.10.6.6
              // SMD: The expression has more than one arithmetic operators
              // SJ: Better for code readability
              vertical_color7_position <= {1'b0,vertical_color_pixels,2'b0} +
                                          {2'b0,vertical_color_pixels,1'b0} +
                                          {3'b0,vertical_color_pixels};
              // spyglass enable_block STARC05-2.10.6.6
          end
      end
  end //vertical_color_position_PROC
  // spyglass enable_block FlopDataConstant

  //Calculate the number of each generated pixels based on data type and packet size and odd/even line
//  assign line_for_gen_pixels = vp_req_ack ? next_odd_line : odd_line;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : gen_pixels_PROC
      if(~ppi_clkrstz)
          gen_pixels    <= 6'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW6: begin
               if((next_gen_cnt == 4'd0) | (next_gen_cnt == 4'd1))
                   gen_pixels <= 6'd12;
               else
                   gen_pixels <= 6'd8;
          end
          `CSI2_RAW12,
          `CSI2_LY420_8B: begin
               if((next_gen_cnt == 4'd0) | (next_gen_cnt == 4'd1))
                   gen_pixels <= 6'd6;
               else
                   gen_pixels <= 6'd4;
          end
          `CSI2_RAW24,
          `CSI2_RGB888: begin
               if(next_gen_cnt == 4'd0)
                   gen_pixels <= 6'd4;
               else
                   gen_pixels <= 6'd2;
          end
          `CSI2_RAW8: begin
               gen_pixels <= 6'd8;
          end
          `CSI2_RAW16,
          `CSI2_RGB444,
          `CSI2_RGB555,
          `CSI2_RGB565,
          `CSI2_Y422_8B: begin
               gen_pixels <= 6'd4;
          end
          `CSI2_CSPS_Y420_8B,
          `CSI2_Y420_8B:begin
              if(odd_line)
                  gen_pixels <= 6'd8;
              else
                  gen_pixels <= 6'd4;
          end
          `CSI2_RAW10: begin
               if((next_gen_cnt == 4'd0) | (next_gen_cnt == 4'd1) | (next_gen_cnt == 4'd3))
                   gen_pixels <= 6'd8;
               else
                   gen_pixels <= 6'd4;
          end
          `CSI2_Y422_10B,
          `CSI2_RAW20: begin
               if((next_gen_cnt == 4'd0) | (next_gen_cnt == 4'd1) | (next_gen_cnt == 4'd3))
                   gen_pixels <= 6'd4;
               else
                   gen_pixels <= 6'd2;
          end
          `CSI2_CSPS_Y420_10B,
          `CSI2_Y420_10B:begin
              if(odd_line)
                  if((next_gen_cnt == 4'd0) | (next_gen_cnt == 4'd1) | (next_gen_cnt == 4'd3))
                      gen_pixels <= 6'd8;
                  else
                      gen_pixels <= 6'd4;
              else
                  if((next_gen_cnt == 4'd0) | (next_gen_cnt == 4'd1) | (next_gen_cnt == 4'd3))
                      gen_pixels <= 6'd4;
                  else
                      gen_pixels <= 6'd2;
          end
          `CSI2_RAW7: begin
               if(next_gen_cnt == 4'd0)
                   gen_pixels <= 6'd16;
               else
                   gen_pixels <= 6'd8;
          end
          `CSI2_RAW14: begin
               if(next_gen_cnt == 4'd0)
                   gen_pixels <= 6'd8;
               else
                   gen_pixels <= 6'd4;
          end
          `CSI2_RGB666:begin
               if((next_gen_cnt == 4'd4) | (next_gen_cnt == 4'd8))
                   gen_pixels <= 6'd2;
               else
                   gen_pixels <= 6'd4;
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              gen_pixels <= 6'd0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //gen_pixels_PROC

  //The bits of the video pattern has been sent
  //Every time send 128bits vpg_payload
  // spyglass disable_block W484
  // SMD: Possible assignment overflow.
  // SJ: Overflow can't occur. Protected by protocol.
  // spyglass disable_block W164a
  // SMD: LHS width is less than RHS width of assignment.
  // SJ: Overflow can't occur. Protected by protocol.
  assign sent_gen_pixels_sum = (sent_pixels + {8'b0,gen_pixels});
  // spyglass enable_block W164a
  // spyglass enable_block W484

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : sent_bits_PROC
      if(~ppi_clkrstz)
          sent_pixels    <= 14'b0;
      else
          if(vpg_pld_gen_end)
                sent_pixels    <= 14'b0;
          else
              if(vpg_pld_req_pre)
                sent_pixels    <= sent_gen_pixels_sum;
  end //sent_bits_PROC

  //The position of the previous seven color bar in horizontal mode
  //1 * horizontal_color_lines
  assign horizontal_color1_position = {3'b0,vpg_vactive_lines_qst[13:3]};

  //2 * horizontal_color_lines
  assign horizontal_color2_position = {2'b0,vpg_vactive_lines_qst[13:3],1'b0};

  //3 * horizontal_color_lines
  assign horizontal_color3_position = {2'b0,vpg_vactive_lines_qst[13:3],1'b0} +
                                      {3'b0,vpg_vactive_lines_qst[13:3]};

  //4 * horizontal_color_lines
  assign horizontal_color4_position = {1'b0,vpg_vactive_lines_qst[13:3],2'b0};

  //5 * horizontal_color_lines
  assign horizontal_color5_position = {1'b0,vpg_vactive_lines_qst[13:3],2'b0} +
                                      {3'b0,vpg_vactive_lines_qst[13:3]};

  //6 * horizontal_color_lines
  assign horizontal_color6_position = {1'b0,vpg_vactive_lines_qst[13:3],2'b0} +
                                      {2'b0,vpg_vactive_lines_qst[13:3],1'b0};

  //7 * horizontal_color_lines
  // spyglass disable_block STARC05-2.10.6.6
  // SMD: The expression has more than one arithmetic operators
  // SJ: Better for code readability
  assign horizontal_color7_position = {1'b0,vpg_vactive_lines_qst[13:3],2'b0} +
                                      {2'b0,vpg_vactive_lines_qst[13:3],1'b0} +
                                      {3'b0,vpg_vactive_lines_qst[13:3]};
  // spyglass enable_block STARC05-2.10.6.6

  //The zones of vpg_payload which is ready to be sent
  //In zone0/ zone2/ zone4/ zone6/ zone8/ zone10/ zone12/ zone14 the values of all the pixels are the same.
  //zone0/ zone2/ zone4/ zone6/ zone8/ zone10/ zone12/ zone14 are Respective for 8 kinds of color from left to right in video pattern.
  //In vertical mode or horizontal mode.
  assign vpg_orientation = vpg_mode_qst? 1'b0 : vpg_orientation_qst;

  assign data_in_zone0  = vpg_orientation ? (current_line <= horizontal_color1_position) :
                                            (sent_gen_pixels_sum <= vertical_color1_position);

  assign data_in_zone2  = vpg_orientation ? ((current_line <= horizontal_color2_position) & (current_line > horizontal_color1_position)) :
                                            ((sent_gen_pixels_sum <= vertical_color2_position) & (sent_pixels >= vertical_color1_position));

  assign data_in_zone4  = vpg_orientation ? ((current_line <= horizontal_color3_position) & (current_line > horizontal_color2_position)) :
                                            ((sent_gen_pixels_sum <= vertical_color3_position) & (sent_pixels >= vertical_color2_position));

  assign data_in_zone6  = vpg_orientation ? ((current_line <= horizontal_color4_position) & (current_line > horizontal_color3_position)) :
                                            ((sent_gen_pixels_sum <= vertical_color4_position) & (sent_pixels >= vertical_color3_position));

  assign data_in_zone8  = vpg_orientation ? ((current_line <= horizontal_color5_position) & (current_line > horizontal_color4_position)) :
                                            ((sent_gen_pixels_sum <= vertical_color5_position) & (sent_pixels >= vertical_color4_position));

  assign data_in_zone10 = vpg_orientation ? ((current_line <= horizontal_color6_position) & (current_line > horizontal_color5_position)) :
                                            ((sent_gen_pixels_sum <= vertical_color6_position) & (sent_pixels >= vertical_color5_position));

  assign data_in_zone12 = vpg_orientation ? ((current_line <= horizontal_color7_position) & (current_line > horizontal_color6_position)) :
                                            ((sent_gen_pixels_sum <= vertical_color7_position) & (sent_pixels >= vertical_color6_position));

  assign data_in_zone14 = vpg_orientation ? (current_line > horizontal_color7_position) :
                                            (sent_pixels >= vertical_color7_position);


  //In vertical mode, there are different values of pixels in zone1/ zone3/ zone5/ zone7/ zone9/ zone11/ zone13.
  //The zones of vpg_payload which is ready to be sent
  assign data_in_zone1  = (~vpg_orientation) & (sent_gen_pixels_sum > vertical_color1_position)&
                                               ( sent_pixels        < vertical_color1_position);
  assign data_in_zone3  = (~vpg_orientation) & (sent_gen_pixels_sum > vertical_color2_position)&
                                               ( sent_pixels        < vertical_color2_position);
  assign data_in_zone5  = (~vpg_orientation) & (sent_gen_pixels_sum > vertical_color3_position)&
                                               ( sent_pixels        < vertical_color3_position);
  assign data_in_zone7  = (~vpg_orientation) & (sent_gen_pixels_sum > vertical_color4_position)&
                                               ( sent_pixels        < vertical_color4_position);
  assign data_in_zone9  = (~vpg_orientation) & (sent_gen_pixels_sum > vertical_color5_position)&
                                               ( sent_pixels        < vertical_color5_position);
  assign data_in_zone11 = (~vpg_orientation) & (sent_gen_pixels_sum > vertical_color6_position)&
                                               ( sent_pixels        < vertical_color6_position);
  assign data_in_zone13 = (~vpg_orientation) & (sent_gen_pixels_sum > vertical_color7_position)&
                                               ( sent_pixels        < vertical_color7_position);
  //In zone0/ zone2/ zone4/ zone6/ zone8/ zone10/ zone12/ zone14 the values of all the pixels are the same, so the color mode is color_x.
  //To detect color mode in  zone1/ zone3/ zone5/ zone7/ zone9/ zone11/ zone13
  //To detect whether there is color_x_y in the generated pixels which is ready to be sent
  // spyglass disable_block W484
  // SMD: Possible assignment overflow.
  // SJ: Overflow can't occur. Protected by protocol.
  // spyglass disable_block W164a
  // SMD: LHS width is less than RHS width of assignment.
  // SJ: Overflow can't occur. Protected by protocol.
  assign vcolor1_pos_sent_pix_sub = (vertical_color1_position - sent_pixels );
  assign vcolor2_pos_sent_pix_sub = (vertical_color2_position - sent_pixels );
  assign vcolor3_pos_sent_pix_sub = (vertical_color3_position - sent_pixels );
  assign vcolor4_pos_sent_pix_sub = (vertical_color4_position - sent_pixels );
  assign vcolor5_pos_sent_pix_sub = (vertical_color5_position - sent_pixels );
  assign vcolor6_pos_sent_pix_sub = (vertical_color6_position - sent_pixels );
  assign vcolor7_pos_sent_pix_sub = (vertical_color7_position - sent_pixels );
  // spyglass enable_block W164a
  // spyglass enable_block W484

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_x_y_PROC
      if(~ppi_clkrstz)
         color_x_y <= 1'b0;
//      else if(vpg_payload_gen_en_pre)
      else if(vpg_pld_req_pre)
         color_x_y <=  ((vcolor1_pos_sent_pix_sub == 14'd1 ) & data_in_zone1 ) |
                       ((vcolor3_pos_sent_pix_sub == 14'd1 ) & data_in_zone5 ) |
                       ((vcolor5_pos_sent_pix_sub == 14'd1 ) & data_in_zone9 ) |
                       ((vcolor7_pos_sent_pix_sub == 14'd1 ) & data_in_zone13) ;
  end
  //To detect whether there is color_2x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_2x_y_PROC
      if(~ppi_clkrstz)
        color_2x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_2x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd2 ) & data_in_zone1 ) |
                        ((vcolor2_pos_sent_pix_sub == 14'd2 ) & data_in_zone3 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd2 ) & data_in_zone5 ) |
                        ((vcolor4_pos_sent_pix_sub == 14'd2 ) & data_in_zone7 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd2 ) & data_in_zone9 ) |
                        ((vcolor6_pos_sent_pix_sub == 14'd2 ) & data_in_zone11) |
                        ((vcolor7_pos_sent_pix_sub == 14'd2 ) & data_in_zone13) ;
  end
  //To detect whether there is color_3x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_3x_y_PROC
      if(~ppi_clkrstz)
        color_3x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_3x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd3 ) & data_in_zone1 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd3 ) & data_in_zone5 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd3 ) & data_in_zone9 ) |
                        ((vcolor7_pos_sent_pix_sub == 14'd3 ) & data_in_zone13) ;
  end
  //To detect whether there is color_4x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_4x_y_PROC
      if(~ppi_clkrstz)
        color_4x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_4x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd4 ) & data_in_zone1 ) |
                        ((vcolor2_pos_sent_pix_sub == 14'd4 ) & data_in_zone3 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd4 ) & data_in_zone5 ) |
                        ((vcolor4_pos_sent_pix_sub == 14'd4 ) & data_in_zone7 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd4 ) & data_in_zone9 ) |
                        ((vcolor6_pos_sent_pix_sub == 14'd4 ) & data_in_zone11) |
                        ((vcolor7_pos_sent_pix_sub == 14'd4 ) & data_in_zone13) ;
  end
  //To detect whether there is color_5x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_5x_y_PROC
      if(~ppi_clkrstz)
        color_5x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_5x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd5 ) & data_in_zone1 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd5 ) & data_in_zone5 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd5 ) & data_in_zone9 ) |
                        ((vcolor7_pos_sent_pix_sub == 14'd5 ) & data_in_zone13) ;
  end
  //To detect whether there is color_6x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_6x_y_PROC
      if(~ppi_clkrstz)
        color_6x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_6x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd6 ) & data_in_zone1 ) |
                        ((vcolor2_pos_sent_pix_sub == 14'd6 ) & data_in_zone3 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd6 ) & data_in_zone5 ) |
                        ((vcolor4_pos_sent_pix_sub == 14'd6 ) & data_in_zone7 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd6 ) & data_in_zone9 ) |
                        ((vcolor6_pos_sent_pix_sub == 14'd6 ) & data_in_zone11) |
                        ((vcolor7_pos_sent_pix_sub == 14'd6 ) & data_in_zone13) ;
  end
  //To detect whether there is color_7x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_7x_y_PROC
      if(~ppi_clkrstz)
        color_7x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_7x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd7 ) & data_in_zone1 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd7 ) & data_in_zone5 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd7 ) & data_in_zone9 ) |
                        ((vcolor7_pos_sent_pix_sub == 14'd7 ) & data_in_zone13) ;
  end
  //To detect whether there is color_8x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_8x_y_PROC
      if(~ppi_clkrstz)
        color_8x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_8x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd8 ) & data_in_zone1 ) |
                        ((vcolor2_pos_sent_pix_sub == 14'd8 ) & data_in_zone3 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd8 ) & data_in_zone5 ) |
                        ((vcolor4_pos_sent_pix_sub == 14'd8 ) & data_in_zone7 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd8 ) & data_in_zone9 ) |
                        ((vcolor6_pos_sent_pix_sub == 14'd8 ) & data_in_zone11) |
                        ((vcolor7_pos_sent_pix_sub == 14'd8 ) & data_in_zone13) ;
  end
  //To detect whether there is color_9x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_9x_y_PROC
      if(~ppi_clkrstz)
        color_9x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_9x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd9 ) & data_in_zone1 ) |
                        ((vcolor3_pos_sent_pix_sub == 14'd9 ) & data_in_zone5 ) |
                        ((vcolor5_pos_sent_pix_sub == 14'd9 ) & data_in_zone9 ) |
                        ((vcolor7_pos_sent_pix_sub == 14'd9 ) & data_in_zone13) ;
  end
  //To detect whether there is color_10x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_10x_y_PROC
      if(~ppi_clkrstz)
        color_10x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_10x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd10 ) & data_in_zone1 ) |
                         ((vcolor2_pos_sent_pix_sub == 14'd10 ) & data_in_zone3 ) |
                         ((vcolor3_pos_sent_pix_sub == 14'd10 ) & data_in_zone5 ) |
                         ((vcolor4_pos_sent_pix_sub == 14'd10 ) & data_in_zone7 ) |
                         ((vcolor5_pos_sent_pix_sub == 14'd10 ) & data_in_zone9 ) |
                         ((vcolor6_pos_sent_pix_sub == 14'd10 ) & data_in_zone11) |
                         ((vcolor7_pos_sent_pix_sub == 14'd10 ) & data_in_zone13) ;
  end
  //To detect whether there is color_11x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_11x_y_PROC
      if(~ppi_clkrstz)
        color_11x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_11x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd11 ) & data_in_zone1 ) |
                         ((vcolor3_pos_sent_pix_sub == 14'd11 ) & data_in_zone5 ) |
                         ((vcolor5_pos_sent_pix_sub == 14'd11 ) & data_in_zone9 ) |
                         ((vcolor7_pos_sent_pix_sub == 14'd11 ) & data_in_zone13) ;
  end
  //To detect whether there is color_12x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_12x_y_PROC
      if(~ppi_clkrstz)
        color_12x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_12x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd12 ) & data_in_zone1 ) |
                         ((vcolor2_pos_sent_pix_sub == 14'd12 ) & data_in_zone3 ) |
                         ((vcolor3_pos_sent_pix_sub == 14'd12 ) & data_in_zone5 ) |
                         ((vcolor4_pos_sent_pix_sub == 14'd12 ) & data_in_zone7 ) |
                         ((vcolor5_pos_sent_pix_sub == 14'd12 ) & data_in_zone9 ) |
                         ((vcolor6_pos_sent_pix_sub == 14'd12 ) & data_in_zone11) |
                         ((vcolor7_pos_sent_pix_sub == 14'd12 ) & data_in_zone13) ;
  end
  //To detect whether there is color_13x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_13x_y_PROC
      if(~ppi_clkrstz)
        color_13x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_13x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd13 ) & data_in_zone1 ) |
                         ((vcolor3_pos_sent_pix_sub == 14'd13 ) & data_in_zone5 ) |
                         ((vcolor5_pos_sent_pix_sub == 14'd13 ) & data_in_zone9 ) |
                         ((vcolor7_pos_sent_pix_sub == 14'd13 ) & data_in_zone13) ;
  end
  //To detect whether there is color_14x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_14x_y_PROC
      if(~ppi_clkrstz)
        color_14x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_14x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd14 ) & data_in_zone1 ) |
                         ((vcolor2_pos_sent_pix_sub == 14'd14 ) & data_in_zone3 ) |
                         ((vcolor3_pos_sent_pix_sub == 14'd14 ) & data_in_zone5 ) |
                         ((vcolor4_pos_sent_pix_sub == 14'd14 ) & data_in_zone7 ) |
                         ((vcolor5_pos_sent_pix_sub == 14'd14 ) & data_in_zone9 ) |
                         ((vcolor6_pos_sent_pix_sub == 14'd14 ) & data_in_zone11) |
                         ((vcolor7_pos_sent_pix_sub == 14'd14 ) & data_in_zone13) ;
  end
  //To detect whether there is color_15x_y in the generated pixels which is ready to be sent
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_15x_y_PROC
      if(~ppi_clkrstz)
        color_15x_y  <= 1'b0;
      else if(vpg_pld_req_pre)
        color_15x_y  <=  ((vcolor1_pos_sent_pix_sub == 14'd15 ) & data_in_zone1 ) |
                         ((vcolor3_pos_sent_pix_sub == 14'd15 ) & data_in_zone5 ) |
                         ((vcolor5_pos_sent_pix_sub == 14'd15 ) & data_in_zone9 ) |
                         ((vcolor7_pos_sent_pix_sub == 14'd15 ) & data_in_zone13) ;
  end
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// Color Components ////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  //using different components in different data type and different lines
  //Supprot that swap_bayer is 2'b00 for RAW format
  //The p_color1 is used for the first color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color1_PROC
      if(~ppi_clkrstz)
        odd_line_p_color1  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color1[29:0] <= {WHITE[27],WHITE[27:14],WHITE[13],WHITE[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              odd_line_p_color1[29:0] <= {WHITE[27:14],1'b0,WHITE[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color1[29:0] <= {BER_COLOR1_COMPONENT,7'b0,BER_COLOR1_COMPONENT,7'b0};
              else
                  odd_line_p_color1[29:0] <= {WHITE[27:14],1'b0,WHITE[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
              odd_line_p_color1[29:0] <= {WHITE[41:38],6'b100000,WHITE[27:24],6'b100000,WHITE[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              odd_line_p_color1[29:0] <= {WHITE[41:37],5'b0,WHITE[27:23],5'b0,WHITE[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color1[29:0] <= {WHITE[41:36],4'b0,WHITE[27:22],4'b0,WHITE[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color1[29:0] <= {BER_COLOR1_COMPONENT,2'b0,BER_COLOR1_COMPONENT,2'b0,BER_COLOR1_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color1[29:0] <= {WHITE[41:34],2'b0,WHITE[27:20],2'b0,WHITE[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color1[29:0] <= YUV_WHITE;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color1[29:0] <= {YUV_WHITE[29:20],5'b0,YUV_WHITE[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color1[29:0] <= {YUV_WHITE[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color1 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color1_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color1_PROC
      if(~ppi_clkrstz)
        even_line_p_color1  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color1[29:0] <= {WHITE[41],WHITE[41:28],WHITE[27],WHITE[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              even_line_p_color1[29:0] <= {WHITE[41:28],1'b0,WHITE[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color1[29:0] <= {BER_COLOR1_COMPONENT,7'b0,BER_COLOR1_COMPONENT,7'b0};
              else
                  even_line_p_color1[29:0] <= {WHITE[41:28],1'b0,WHITE[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
              even_line_p_color1[29:0] <= {WHITE[41:38],6'b100000,WHITE[27:24],6'b100000,WHITE[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              even_line_p_color1[29:0] <= {WHITE[41:37],5'b0,WHITE[27:23],5'b0,WHITE[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color1[29:0] <= {WHITE[41:36],4'b0,WHITE[27:22],4'b0,WHITE[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color1[29:0] <= {BER_COLOR1_COMPONENT,2'b0,BER_COLOR1_COMPONENT,2'b0,BER_COLOR1_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color1[29:0] <= {WHITE[41:34],2'b0,WHITE[27:20],2'b0,WHITE[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color1[29:0] <= YUV_WHITE;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color1[29:0] <= {YUV_WHITE[29:20],5'b0,YUV_WHITE[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color1[29:0] <= YUV_WHITE;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color1 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color1_PROC

  assign p_color1 = odd_line ? odd_line_p_color1 : even_line_p_color1;

  //The p_color2 is used for the second color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color2_PROC
      if(~ppi_clkrstz)
        odd_line_p_color2  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color2[29:0] <= {YELLOW[27],YELLOW[27:14],YELLOW[13],YELLOW[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              odd_line_p_color2[29:0] <= {YELLOW[27:14],1'b0,YELLOW[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color2[29:0] <= {BER_COLOR2_COMPONENT,7'b0,BER_COLOR2_COMPONENT,7'b0};
              else
                  odd_line_p_color2[29:0] <= {YELLOW[27:14],1'b0,YELLOW[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
              odd_line_p_color2[29:0] <= {YELLOW[41:38],6'b100000,YELLOW[27:24],6'b100000,YELLOW[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              odd_line_p_color2[29:0] <= {YELLOW[41:37],5'b0,YELLOW[27:23],5'b0,YELLOW[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color2[29:0] <= {YELLOW[41:36],4'b0,YELLOW[27:22],4'b0,YELLOW[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color2[29:0] <= {BER_COLOR2_COMPONENT,2'b0,BER_COLOR2_COMPONENT,2'b0,BER_COLOR2_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color2[29:0] <= {YELLOW[41:34],2'b0,YELLOW[27:20],2'b0,YELLOW[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color2[29:0] <= YUV_YELLOW;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color2[29:0] <= {YUV_YELLOW[29:20],5'b0,YUV_YELLOW[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color2[29:0] <= {YUV_YELLOW[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color2 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color2_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color2_PROC
      if(~ppi_clkrstz)
        even_line_p_color2  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color2[29:0] <= {YELLOW[41],YELLOW[41:28],YELLOW[27],YELLOW[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              even_line_p_color2[29:0] <= {YELLOW[41:28],1'b0,YELLOW[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color2[29:0] <= {BER_COLOR2_COMPONENT,7'b0,BER_COLOR2_COMPONENT,7'b0};
              else
                  even_line_p_color2[29:0] <= {YELLOW[41:28],1'b0,YELLOW[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
              even_line_p_color2[29:0] <= {YELLOW[41:38],6'b100000,YELLOW[27:24],6'b100000,YELLOW[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              even_line_p_color2[29:0] <= {YELLOW[41:37],5'b0,YELLOW[27:23],5'b0,YELLOW[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color2[29:0] <= {YELLOW[41:36],4'b0,YELLOW[27:22],4'b0,YELLOW[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color2[29:0] <= {BER_COLOR2_COMPONENT,2'b0,BER_COLOR2_COMPONENT,2'b0,BER_COLOR2_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color2[29:0] <= {YELLOW[41:34],2'b0,YELLOW[27:20],2'b0,YELLOW[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color2[29:0] <= YUV_YELLOW;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color2[29:0] <= {YUV_YELLOW[29:20],5'b0,YUV_YELLOW[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color2[29:0] <= YUV_YELLOW;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color2 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color2_PROC

  assign p_color2 = odd_line ? odd_line_p_color2 : even_line_p_color2;

  //The p_color3 is used for the third color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color3_PROC
      if(~ppi_clkrstz)
        odd_line_p_color3  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color3[29:0] <= {CYAN[27],CYAN[27:14],CYAN[13],CYAN[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              odd_line_p_color3[29:0] <= {CYAN[27:14],1'b0,CYAN[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color3[29:0] <= {BER_COLOR3_COMPONENT,7'b0,BER_COLOR3_COMPONENT,7'b0};
              else
                  odd_line_p_color3[29:0] <= {CYAN[27:14],1'b0,CYAN[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
              odd_line_p_color3[29:0] <= {CYAN[41:38],6'b100000,CYAN[27:24],6'b100000,CYAN[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              odd_line_p_color3[29:0] <= {CYAN[41:37],5'b0,CYAN[27:23],5'b0,CYAN[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color3[29:0] <= {CYAN[41:36],4'b0,CYAN[27:22],4'b0,CYAN[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst)//BER video
                  odd_line_p_color3[29:0] <= {BER_COLOR3_COMPONENT,2'b0,BER_COLOR3_COMPONENT,2'b0,BER_COLOR3_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color3[29:0] <= {CYAN[41:34],2'b0,CYAN[27:20],2'b0,CYAN[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color3[29:0] <= YUV_CYAN;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color3[29:0] <= {YUV_CYAN[29:20],5'b0,YUV_CYAN[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color3[29:0] <= {YUV_CYAN[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color3 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color3_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color3_PROC
      if(~ppi_clkrstz)
        even_line_p_color3  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color3[29:0] <= {CYAN[41],CYAN[41:28],CYAN[27],CYAN[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              even_line_p_color3[29:0] <= {CYAN[41:28],1'b0,CYAN[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color3[29:0] <= {BER_COLOR3_COMPONENT,7'b0,BER_COLOR3_COMPONENT,7'b0};
              else
                  even_line_p_color3[29:0] <= {CYAN[41:28],1'b0,CYAN[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
              even_line_p_color3[29:0] <= {CYAN[41:38],6'b100000,CYAN[27:24],6'b100000,CYAN[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              even_line_p_color3[29:0] <= {CYAN[41:37],5'b0,CYAN[27:23],5'b0,CYAN[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color3[29:0] <= {CYAN[41:36],4'b0,CYAN[27:22],4'b0,CYAN[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst)//BER video
                  even_line_p_color3[29:0] <= {BER_COLOR3_COMPONENT,2'b0,BER_COLOR3_COMPONENT,2'b0,BER_COLOR3_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color3[29:0] <= {CYAN[41:34],2'b0,CYAN[27:20],2'b0,CYAN[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color3[29:0] <= YUV_CYAN;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color3[29:0] <= {YUV_CYAN[29:20],5'b0,YUV_CYAN[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color3[29:0] <= YUV_CYAN;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color3 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color3_PROC

  assign p_color3 = odd_line ? odd_line_p_color3 : even_line_p_color3;

  //The p_color4 is used for the forth color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color4_PROC
      if(~ppi_clkrstz)
        odd_line_p_color4  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color4[29:0] <= {GREEN[27],GREEN[27:14],GREEN[13],GREEN[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
             odd_line_p_color4[29:0] <= {GREEN[27:14],1'b0,GREEN[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color4[29:0] <= {BER_COLOR4_COMPONENT,7'b0,BER_COLOR4_COMPONENT,7'b0};
              else
                  odd_line_p_color4[29:0] <= {GREEN[27:14],1'b0,GREEN[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
              odd_line_p_color4[29:0] <= {GREEN[41:38],6'b100000,GREEN[27:24],6'b100000,GREEN[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              odd_line_p_color4[29:0] <= {GREEN[41:37],5'b0,GREEN[27:23],5'b0,GREEN[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color4[29:0] <= {GREEN[41:36],4'b0,GREEN[27:22],4'b0,GREEN[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color4[29:0] <= {BER_COLOR4_COMPONENT,2'b0,BER_COLOR4_COMPONENT,2'b0,BER_COLOR4_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color4[29:0] <= {GREEN[41:34],2'b0,GREEN[27:20],2'b0,GREEN[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color4[29:0] <= YUV_GREEN;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color4[29:0] <= {YUV_GREEN[29:20],5'b0,YUV_GREEN[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color4[29:0] <= {YUV_GREEN[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color4 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color4_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color4_PROC
      if(~ppi_clkrstz)
        even_line_p_color4  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color4[29:0] <= {GREEN[41],GREEN[41:28],GREEN[27],GREEN[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
             even_line_p_color4[29:0] <= {GREEN[41:28],1'b0,GREEN[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color4[29:0] <= {BER_COLOR4_COMPONENT,7'b0,BER_COLOR4_COMPONENT,7'b0};
              else
                  even_line_p_color4[29:0] <= {GREEN[41:28],1'b0,GREEN[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
              even_line_p_color4[29:0] <= {GREEN[41:38],6'b100000,GREEN[27:24],6'b100000,GREEN[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              even_line_p_color4[29:0] <= {GREEN[41:37],5'b0,GREEN[27:23],5'b0,GREEN[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color4[29:0] <= {GREEN[41:36],4'b0,GREEN[27:22],4'b0,GREEN[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color4[29:0] <= {BER_COLOR4_COMPONENT,2'b0,BER_COLOR4_COMPONENT,2'b0,BER_COLOR4_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color4[29:0] <= {GREEN[41:34],2'b0,GREEN[27:20],2'b0,GREEN[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color4[29:0] <= YUV_GREEN;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color4[29:0] <= {YUV_GREEN[29:20],5'b0,YUV_GREEN[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color4[29:0] <= YUV_GREEN;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color4 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color4_PROC

  assign p_color4 = odd_line ? odd_line_p_color4 : even_line_p_color4;

  //The p_color5 is used for the fifth color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color5_PROC
      if(~ppi_clkrstz)
        odd_line_p_color5  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color5[29:0] <= {MAGENTA[27],MAGENTA[27:14],MAGENTA[13],MAGENTA[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              odd_line_p_color5[29:0] <= {MAGENTA[27:14],1'b0,MAGENTA[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
            if(vpg_mode_qst) //BER video
                odd_line_p_color5[29:0] <= {BER_COLOR5_COMPONENT,7'b0,BER_COLOR5_COMPONENT,7'b0};
            else
                odd_line_p_color5[29:0] <= {MAGENTA[27:14],1'b0,MAGENTA[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
              odd_line_p_color5[29:0] <= {MAGENTA[41:38],6'b100000,MAGENTA[27:24],6'b100000,MAGENTA[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              odd_line_p_color5[29:0] <= {MAGENTA[41:37],5'b0,MAGENTA[27:23],5'b0,MAGENTA[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color5[29:0] <= {MAGENTA[41:36],4'b0,MAGENTA[27:22],4'b0,MAGENTA[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color5[29:0] <= {BER_COLOR5_COMPONENT,2'b0,BER_COLOR5_COMPONENT,2'b0,BER_COLOR5_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color5[29:0] <= {MAGENTA[41:34],2'b0,MAGENTA[27:20],2'b0,MAGENTA[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color5[29:0] <= YUV_MAGENTA;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color5[29:0] <= {YUV_MAGENTA[29:20],5'b0,YUV_MAGENTA[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color5[29:0] <= {YUV_MAGENTA[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color5 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color5_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color5_PROC
      if(~ppi_clkrstz)
        even_line_p_color5  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color5[29:0] <= {MAGENTA[41],MAGENTA[41:28],MAGENTA[27],MAGENTA[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              even_line_p_color5[29:0] <= {MAGENTA[41:28],1'b0,MAGENTA[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
            if(vpg_mode_qst) //BER video
                even_line_p_color5[29:0] <= {BER_COLOR5_COMPONENT,7'b0,BER_COLOR5_COMPONENT,7'b0};
            else
                even_line_p_color5[29:0] <= {MAGENTA[41:28],1'b0,MAGENTA[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
              even_line_p_color5[29:0] <= {MAGENTA[41:38],6'b100000,MAGENTA[27:24],6'b100000,MAGENTA[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              even_line_p_color5[29:0] <= {MAGENTA[41:37],5'b0,MAGENTA[27:23],5'b0,MAGENTA[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color5[29:0] <= {MAGENTA[41:36],4'b0,MAGENTA[27:22],4'b0,MAGENTA[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color5[29:0] <= {BER_COLOR5_COMPONENT,2'b0,BER_COLOR5_COMPONENT,2'b0,BER_COLOR5_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color5[29:0] <= {MAGENTA[41:34],2'b0,MAGENTA[27:20],2'b0,MAGENTA[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color5[29:0] <= YUV_MAGENTA;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color5[29:0] <= {YUV_MAGENTA[29:20],5'b0,YUV_MAGENTA[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color5[29:0] <= YUV_MAGENTA;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color5 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color5_PROC

  assign p_color5 = odd_line ? odd_line_p_color5 : even_line_p_color5;

  //The p_color6 is used for the sixth color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color6_PROC
      if(~ppi_clkrstz)
        odd_line_p_color6  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color6[29:0] <= {RED[27],RED[27:14],RED[13],RED[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              odd_line_p_color6[29:0] <= {RED[27:14],1'b0,RED[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color6[29:0] <= {BER_COLOR6_COMPONENT,7'b0,BER_COLOR6_COMPONENT,7'b0};
              else
                  odd_line_p_color6[29:0] <= {RED[27:14],1'b0,RED[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
               odd_line_p_color6[29:0] <= {RED[41:38],6'b100000,RED[27:24],6'b100000,RED[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
               odd_line_p_color6[29:0] <= {RED[41:37],5'b0,RED[27:23],5'b0,RED[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color6[29:0] <= {RED[41:36],4'b0,RED[27:22],4'b0,RED[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color6[29:0] <= {BER_COLOR6_COMPONENT,2'b0,BER_COLOR6_COMPONENT,2'b0,BER_COLOR6_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color6[29:0] <= {RED[41:34],2'b0,RED[27:20],2'b0,RED[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color6[29:0] <= YUV_RED;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color6[29:0] <= {YUV_RED[29:20],5'b0,YUV_RED[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color6[29:0] <= {YUV_RED[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color6 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color6_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color6_PROC
      if(~ppi_clkrstz)
        even_line_p_color6  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color6[29:0] <= {RED[41],RED[41:28],RED[27],RED[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              even_line_p_color6[29:0] <= {RED[41:28],1'b0,RED[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color6[29:0] <= {BER_COLOR6_COMPONENT,7'b0,BER_COLOR6_COMPONENT,7'b0};
              else
                  even_line_p_color6[29:0] <= {RED[41:28],1'b0,RED[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
               even_line_p_color6[29:0] <= {RED[41:38],6'b100000,RED[27:24],6'b100000,RED[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
               even_line_p_color6[29:0] <= {RED[41:37],5'b0,RED[27:23],5'b0,RED[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color6[29:0] <= {RED[41:36],4'b0,RED[27:22],4'b0,RED[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color6[29:0] <= {BER_COLOR6_COMPONENT,2'b0,BER_COLOR6_COMPONENT,2'b0,BER_COLOR6_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color6[29:0] <= {RED[41:34],2'b0,RED[27:20],2'b0,RED[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color6[29:0] <= YUV_RED;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color6[29:0] <= {YUV_RED[29:20],5'b0,YUV_RED[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color6[29:0] <= YUV_RED;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color6 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color6_PROC

  assign p_color6 = odd_line ? odd_line_p_color6 : even_line_p_color6;

  //The p_color7 is used for the seventh color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color7_PROC
      if(~ppi_clkrstz)
        odd_line_p_color7  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color7[29:0] <= {BLUE[27],BLUE[27:14],BLUE[13],BLUE[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              odd_line_p_color7[29:0] <= {BLUE[27:14],1'b0,BLUE[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
            if(vpg_mode_qst) //BER video
                odd_line_p_color7[29:0] <= {BER_COLOR7_COMPONENT,7'b0,BER_COLOR7_COMPONENT,7'b0};
            else
                odd_line_p_color7[29:0] <= {BLUE[27:14],1'b0,BLUE[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
               odd_line_p_color7[29:0] <= {BLUE[41:38],6'b100000,BLUE[27:24],6'b100000,BLUE[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
               odd_line_p_color7[29:0] <= {BLUE[41:37],5'b0,BLUE[27:23],5'b0,BLUE[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color7[29:0] <= {BLUE[41:36],4'b0,BLUE[27:22],4'b0,BLUE[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color7[29:0] <= {BER_COLOR7_COMPONENT,2'b0,BER_COLOR7_COMPONENT,2'b0,BER_COLOR7_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color7[29:0] <= {BLUE[41:34],2'b0,BLUE[27:20],2'b0,BLUE[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color7[29:0] <= YUV_BLUE;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color7[29:0] <= {YUV_BLUE[29:20],5'b0,YUV_BLUE[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color7[29:0] <= {YUV_BLUE[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color7 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color7_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color7_PROC
      if(~ppi_clkrstz)
        even_line_p_color7  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color7[29:0] <= {BLUE[41],BLUE[41:28],BLUE[27],BLUE[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              even_line_p_color7[29:0] <= {BLUE[41:28],1'b0,BLUE[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
            if(vpg_mode_qst) //BER video
                even_line_p_color7[29:0] <= {BER_COLOR7_COMPONENT,7'b0,BER_COLOR7_COMPONENT,7'b0};
            else
                even_line_p_color7[29:0] <= {BLUE[41:28],1'b0,BLUE[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
               even_line_p_color7[29:0] <= {BLUE[41:38],6'b100000,BLUE[27:24],6'b100000,BLUE[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
               even_line_p_color7[29:0] <= {BLUE[41:37],5'b0,BLUE[27:23],5'b0,BLUE[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color7[29:0] <= {BLUE[41:36],4'b0,BLUE[27:22],4'b0,BLUE[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color7[29:0] <= {BER_COLOR7_COMPONENT,2'b0,BER_COLOR7_COMPONENT,2'b0,BER_COLOR7_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color7[29:0] <= {BLUE[41:34],2'b0,BLUE[27:20],2'b0,BLUE[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color7[29:0] <= YUV_BLUE;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color7[29:0] <= {YUV_BLUE[29:20],5'b0,YUV_BLUE[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color7[29:0] <= YUV_BLUE;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color7 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color7_PROC

  assign p_color7 = odd_line ? odd_line_p_color7 : even_line_p_color7;

  //The p_color8 is used for the eighth color
  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : odd_line_p_color8_PROC
      if(~ppi_clkrstz)
        odd_line_p_color8  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              odd_line_p_color8[29:0] <= {BLACK[27],BLACK[27:14],BLACK[13],BLACK[13:0]};  //gb
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              odd_line_p_color8[29:0] <= {BLACK[27:14],1'b0,BLACK[13:0],1'b0};  //gb
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color8[29:0] <= {BER_COLOR8_COMPONENT,7'b0,BER_COLOR8_COMPONENT,7'b0};
              else
                  odd_line_p_color8[29:0] <= {BLACK[27:14],1'b0,BLACK[13:0],1'b0};  //gb
          end
          `CSI2_RGB444:begin
              odd_line_p_color8[29:0] <= {BLACK[41:38],6'b100000,BLACK[27:24],6'b100000,BLACK[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              odd_line_p_color8[29:0] <= {BLACK[41:37],5'b0,BLACK[27:23],5'b0,BLACK[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              odd_line_p_color8[29:0] <= {BLACK[41:36],4'b0,BLACK[27:22],4'b0,BLACK[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  odd_line_p_color8[29:0] <= {BER_COLOR8_COMPONENT,2'b0,BER_COLOR8_COMPONENT,2'b0,BER_COLOR8_COMPONENT,2'b0};//rgb
              else
                  odd_line_p_color8[29:0] <= {BLACK[41:34],2'b0,BLACK[27:20],2'b0,BLACK[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              odd_line_p_color8[29:0] <= YUV_BLACK;//YUV
          end
          `CSI2_LY420_8B:begin
              odd_line_p_color8[29:0] <= {YUV_BLACK[29:20],5'b0,YUV_BLACK[19:10],5'b0};//YU
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              odd_line_p_color8[29:0] <= {YUV_BLACK[29:20],20'b0};//Y
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              odd_line_p_color8 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //odd_line_p_color8_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : even_line_p_color8_PROC
      if(~ppi_clkrstz)
        even_line_p_color8  <= 30'b0;
      else
      case(vpg_dt_qst)
          `CSI2_RAW24,
          `CSI2_RAW20,
          `CSI2_RAW16:begin
              even_line_p_color8[29:0] <= {BLACK[41],BLACK[41:28],BLACK[27],BLACK[27:14]};  //rg
          end
          `CSI2_RAW6,
          `CSI2_RAW7,
          `CSI2_RAW10,
          `CSI2_RAW12,
          `CSI2_RAW14:begin
              even_line_p_color8[29:0] <= {BLACK[41:28],1'b0,BLACK[27:14],1'b0}; //rg
          end
          `CSI2_RAW8:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color8[29:0] <= {BER_COLOR8_COMPONENT,7'b0,BER_COLOR8_COMPONENT,7'b0};
              else
                  even_line_p_color8[29:0] <= {BLACK[41:28],1'b0,BLACK[27:14],1'b0}; //rg
          end
          `CSI2_RGB444:begin
              even_line_p_color8[29:0] <= {BLACK[41:38],6'b100000,BLACK[27:24],6'b100000,BLACK[13:10],6'b100000};//rgb
          end
          `CSI2_RGB555:begin
              even_line_p_color8[29:0] <= {BLACK[41:37],5'b0,BLACK[27:23],5'b0,BLACK[13:9],5'b0};//rgb
          end
          `CSI2_RGB565,
          `CSI2_RGB666:begin
              even_line_p_color8[29:0] <= {BLACK[41:36],4'b0,BLACK[27:22],4'b0,BLACK[13:8],4'b0};//rgb
          end
          `CSI2_RGB888:begin
              if(vpg_mode_qst) //BER video
                  even_line_p_color8[29:0] <= {BER_COLOR8_COMPONENT,2'b0,BER_COLOR8_COMPONENT,2'b0,BER_COLOR8_COMPONENT,2'b0};//rgb
              else
                  even_line_p_color8[29:0] <= {BLACK[41:34],2'b0,BLACK[27:20],2'b0,BLACK[13:6],2'b0};//rgb
          end
          `CSI2_Y422_8B,
          `CSI2_Y422_10B:begin
              even_line_p_color8[29:0] <= YUV_BLACK;//YUV
          end
          `CSI2_LY420_8B:begin
              even_line_p_color8[29:0] <= {YUV_BLACK[29:20],5'b0,YUV_BLACK[9:0],5'b0};  //YV
          end
          `CSI2_Y420_8B,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_CSPS_Y420_10B:begin
              even_line_p_color8[29:0] <= YUV_BLACK;  //YUV
          end
          default:begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: Default value for this signal
              even_line_p_color8 <= 30'b0;
          // spyglass enable_block FlopDataConstant
          end
      endcase
  end //even_line_p_color8_PROC

  assign p_color8 = odd_line ? odd_line_p_color8 : even_line_p_color8;

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// Pixel Bus Calculation ///////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  //The vpg_payload_color[i] is using to successively save the color in a vpg_payload.
  //There are up to eight different colors in a vpg_payload.
  //Calculation of the colors in a vpg_payload

  // In Zone0, all pixels belong to color1
  // In Zone2, all pixels belong to color2
  // In Zone4, all pixels belong to color3
  // In Zone6, all pixels belong to color4
  // In Zone8, all pixels belong to color5
  // In Zone10, all pixels belong to color6
  // In Zone12, all pixels belong to color7
  // In Zone14, all pixels belong to color8

  // The Zones in a vpg_payload                     vpg_payload_color[i] - the colors in a vpg_payload
  // Zone1 Zone3 Zone5 Zone7 Zone9 Zone11 Zone13     0      1      2      3      4      5      6      7
  //   1     0     0     0     0     0     0       Color1 Color2   x      x      x      x      x      x
  //   0     1     0     0     0     0     0       Color2 Color3   x      x      x      x      x      x
  //   0     0     1     0     0     0     0       Color3 Color4   x      x      x      x      x      x
  //   0     0     0     1     0     0     0       Color4 Color5   x      x      x      x      x      x
  //   0     0     0     0     1     0     0       Color5 Color6   x      x      x      x      x      x
  //   0     0     0     0     0     1     0       Color6 Color7   x      x      x      x      x      x
  //   0     0     0     0     0     0     1       Color7 Color8   x      x      x      x      x      x
  //   1     1     0     0     0     0     0       Color1 Color2 Color3   x      x      x      x      x
  //   0     1     1     0     0     0     0       Color2 Color3 Color4   x      x      x      x      x
  //   0     0     1     1     0     0     0       Color3 Color4 Color5   x      x      x      x      x
  //   0     0     0     1     1     0     0       Color4 Color5 Color6   x      x      x      x      x
  //   0     0     0     0     1     1     0       Color5 Color6 Color7   x      x      x      x      x
  //   0     0     0     0     0     1     1       Color6 Color7 Color8   x      x      x      x      x
  //   1     1     1     0     0     0     0       Color1 Color2 Color3 Color4   x      x      x      x
  //   0     1     1     1     0     0     0       Color2 Color3 Color4 Color5   x      x      x      x
  //   0     0     1     1     1     0     0       Color3 Color4 Color5 Color6   x      x      x      x
  //   0     0     0     1     1     1     0       Color4 Color5 Color6 Color7   x      x      x      x
  //   0     0     0     0     1     1     1       Color5 Color6 Color7 Color8   x      x      x      x
  //   1     1     1     1     0     0     0       Color1 Color2 Color3 Color4 Color5   x      x      x
  //   0     1     1     1     1     0     0       Color2 Color3 Color4 Color5 Color6   x      x      x
  //   0     0     1     1     1     1     0       Color3 Color4 Color5 Color6 Color7   x      x      x
  //   0     0     0     1     1     1     1       Color4 Color5 Color6 Color7 Color8   x      x      x
  //   1     1     1     1     1     0     0       Color1 Color2 Color3 Color4 Color5 Color6   x      x
  //   0     1     1     1     1     1     0       Color2 Color3 Color4 Color5 Color6 Color7   x      x
  //   0     0     1     1     1     1     1       Color3 Color4 Color5 Color6 Color7 Color8   x      x
  //   1     1     1     1     1     1     0       Color1 Color2 Color3 Color4 Color5 Color6 Color7   x
  //   0     1     1     1     1     1     1       Color2 Color3 Color4 Color5 Color6 Color7 Color8   x
  //   1     1     1     1     1     1     1       Color1 Color2 Color3 Color4 Color5 Color6 Color7 Color8

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : color_N_cal_PROC
      if(~ppi_clkrstz) begin
          color_0_cal <= 8'b0;
          color_1_cal <= 7'b0;
          color_2_cal <= 6'b0;
          color_3_cal <= 5'b0;
          color_4_cal <= 4'b0;
          color_5_cal <= 3'b0;
          color_6_cal <= 2'b0;
          color_7_cal <= 1'b0;
      end else if(vpg_pld_req_pre) begin
          color_0_cal <= color_0_cal_nxt;
          color_1_cal <= color_1_cal_nxt;
          color_2_cal <= color_2_cal_nxt;
          color_3_cal <= color_3_cal_nxt;
          color_4_cal <= color_4_cal_nxt;
          color_5_cal <= color_5_cal_nxt;
          color_6_cal <= color_6_cal_nxt;
          color_7_cal <= color_7_cal_nxt;
      end
  end //color_N_cal_PROC

  //The first color in a vpg_payload
  assign color_0_is_p_color1 =   data_in_zone0  | data_in_zone1  ;

  assign color_0_is_p_color2 =   data_in_zone2  | ((~data_in_zone1) &   data_in_zone3)  ;

  assign color_0_is_p_color3 =   data_in_zone4  | ((~data_in_zone3) &   data_in_zone5)  ;

  assign color_0_is_p_color4 =   data_in_zone6  | ((~data_in_zone5) &   data_in_zone7)  ;

  assign color_0_is_p_color5 =   data_in_zone8  | ((~data_in_zone7) &   data_in_zone9)  ;

  assign color_0_is_p_color6 =   data_in_zone10 | ((~data_in_zone9) &   data_in_zone11) ;

  assign color_0_is_p_color7 =   data_in_zone12 | ((~data_in_zone11)&   data_in_zone13) ;

  assign color_0_is_p_color8 =   data_in_zone14 ;

  assign color_0_cal_nxt = {color_0_is_p_color8,color_0_is_p_color7,color_0_is_p_color6,color_0_is_p_color5,
                            color_0_is_p_color4,color_0_is_p_color3,color_0_is_p_color2,color_0_is_p_color1};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_0_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_0 <= 30'b0;
      else
      case(color_0_cal)
          8'b00000001:vpg_payload_color_0 <= p_color1;
          8'b00000010:vpg_payload_color_0 <= p_color2;
          8'b00000100:vpg_payload_color_0 <= p_color3;
          8'b00001000:vpg_payload_color_0 <= p_color4;
          8'b00010000:vpg_payload_color_0 <= p_color5;
          8'b00100000:vpg_payload_color_0 <= p_color6;
          8'b01000000:vpg_payload_color_0 <= p_color7;
          8'b10000000:vpg_payload_color_0 <= p_color8;
          default    :vpg_payload_color_0 <= 30'b0;
      endcase
  end //vpg_payload_color_0_PROC

  //The second color in a vpg_payload
  assign color_1_is_p_color2 =   data_in_zone1  ;

  assign color_1_is_p_color3 = (~data_in_zone1) & data_in_zone3  ;

  assign color_1_is_p_color4 = (~data_in_zone3) & data_in_zone5  ;

  assign color_1_is_p_color5 = (~data_in_zone5) & data_in_zone7  ;

  assign color_1_is_p_color6 = (~data_in_zone7) & data_in_zone9  ;

  assign color_1_is_p_color7 = (~data_in_zone9) & data_in_zone11 ;

  assign color_1_is_p_color8 = (~data_in_zone11)& data_in_zone13 ;

  assign color_1_cal_nxt = {color_1_is_p_color8,color_1_is_p_color7,color_1_is_p_color6,color_1_is_p_color5,
                            color_1_is_p_color4,color_1_is_p_color3,color_1_is_p_color2};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_1_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_1 <= 30'b0;
      else
      case(color_1_cal)
          7'b0000001:vpg_payload_color_1 <= p_color2;
          7'b0000010:vpg_payload_color_1 <= p_color3;
          7'b0000100:vpg_payload_color_1 <= p_color4;
          7'b0001000:vpg_payload_color_1 <= p_color5;
          7'b0010000:vpg_payload_color_1 <= p_color6;
          7'b0100000:vpg_payload_color_1 <= p_color7;
          7'b1000000:vpg_payload_color_1 <= p_color8;
          default   :vpg_payload_color_1 <= 30'b0;
      endcase
  end //vpg_payload_color_1_PROC

  //The third color in a vpg_payload
  assign color_2_is_p_color3 =   data_in_zone1  & data_in_zone3  ;

  assign color_2_is_p_color4 = (~data_in_zone1) & data_in_zone3  & data_in_zone5  ;

  assign color_2_is_p_color5 = (~data_in_zone3) & data_in_zone5  & data_in_zone7  ;

  assign color_2_is_p_color6 = (~data_in_zone5) & data_in_zone7  & data_in_zone9  ;

  assign color_2_is_p_color7 = (~data_in_zone7) & data_in_zone9  & data_in_zone11 ;

  assign color_2_is_p_color8 = (~data_in_zone9) & data_in_zone11 & data_in_zone13 ;

  assign color_2_cal_nxt = {color_2_is_p_color8,color_2_is_p_color7,color_2_is_p_color6,color_2_is_p_color5,
                            color_2_is_p_color4,color_2_is_p_color3};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_2_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_2 <= 30'b0;
      else
      case(color_2_cal)
          6'b000001:vpg_payload_color_2 <= p_color3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          6'b000010:vpg_payload_color_2 <= p_color4;
          //ccx_line_end
          6'b000100:vpg_payload_color_2 <= p_color5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          6'b001000:vpg_payload_color_2 <= p_color6;
          //ccx_line_end
          6'b010000:vpg_payload_color_2 <= p_color7;
          6'b100000:vpg_payload_color_2 <= p_color8;
          default  :vpg_payload_color_2 <= 30'b0;
      endcase
  end //vpg_payload_color_2_PROC

  //The fourth color in a vpg_payload
  assign color_3_is_p_color4 =   data_in_zone1  & data_in_zone5 ;

  assign color_3_is_p_color5 = (~data_in_zone1) & data_in_zone3 & data_in_zone7  ;

  assign color_3_is_p_color6 = (~data_in_zone3) & data_in_zone5 & data_in_zone9  ;

  assign color_3_is_p_color7 = (~data_in_zone5) & data_in_zone7 & data_in_zone11 ;

  assign color_3_is_p_color8 = (~data_in_zone7) & data_in_zone9 & data_in_zone13 ;

  assign color_3_cal_nxt = {color_3_is_p_color8,color_3_is_p_color7,color_3_is_p_color6,color_3_is_p_color5,
                            color_3_is_p_color4};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_3_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_3 <= 30'b0;
      else
      case(color_3_cal)
          5'b00001:vpg_payload_color_3 <= p_color4;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          5'b00010:vpg_payload_color_3 <= p_color5;
          //ccx_line_end
          5'b00100:vpg_payload_color_3 <= p_color6;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          5'b01000:vpg_payload_color_3 <= p_color7;
          //ccx_line_end
          5'b10000:vpg_payload_color_3 <= p_color8;
          // spyglass disable_block UnUsedFlopOutput-ML
          // SMD: Unreachable sequential element must be removed from the design
          // SJ: Depending of the configuration, this line can be unreachable.
          default :vpg_payload_color_3 <= 30'b0;
          // spyglass enable_block UnUsedFlopOutput-ML
      endcase
  end //vpg_payload_color_3_PROC

  //The fifth color in a vpg_payload
  assign color_4_is_p_color5 =   data_in_zone1  & data_in_zone7 ;

  assign color_4_is_p_color6 = (~data_in_zone1) & data_in_zone3 & data_in_zone9  ;

  assign color_4_is_p_color7 = (~data_in_zone3) & data_in_zone5 & data_in_zone11 ;

  assign color_4_is_p_color8 = (~data_in_zone5) & data_in_zone7 & data_in_zone13 ;

  assign color_4_cal_nxt = {color_4_is_p_color8,color_4_is_p_color7,color_4_is_p_color6,color_4_is_p_color5};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_4_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_4 <= 30'b0;
      else
      case(color_4_cal)
          4'b0001:vpg_payload_color_4 <= p_color5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          4'b0010:vpg_payload_color_4 <= p_color6;
          //ccx_line_end
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          4'b0100:vpg_payload_color_4 <= p_color7;
          //ccx_line_end
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          4'b1000:vpg_payload_color_4 <= p_color8;
          //ccx_line_end
          // spyglass disable_block UnUsedFlopOutput-ML
          // SMD: Unreachable sequential element must be removed from the design
          // SJ: Depending of the configuration, this line can be unreachable.
          default:vpg_payload_color_4 <= 30'b0;
          // spyglass enable_block UnUsedFlopOutput-ML
      endcase
  end //vpg_payload_color_4_PROC

  //The sixth color in a vpg_payload
  assign color_5_is_p_color6 =   data_in_zone1  & data_in_zone9 ;

  assign color_5_is_p_color7 = (~data_in_zone1) & data_in_zone3 & data_in_zone11 ;

  assign color_5_is_p_color8 = (~data_in_zone3) & data_in_zone5 & data_in_zone13 ;

  assign color_5_cal_nxt = {color_5_is_p_color8,color_5_is_p_color7,color_5_is_p_color6};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_5_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_5 <= 30'b0;
      else
      case(color_5_cal)
          3'b001 :vpg_payload_color_5 <= p_color6;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'b010 :vpg_payload_color_5 <= p_color7;
          //ccx_line_end
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'b100 :vpg_payload_color_5 <= p_color8;
          //ccx_line_end
          // spyglass disable_block UnUsedFlopOutput-ML
          // SMD: Unreachable sequential element must be removed from the design
          // SJ: Depending of the configuration, this line can be unreachable.
          default:vpg_payload_color_5 <= 30'b0;
          // spyglass enable_block UnUsedFlopOutput-ML
      endcase
  end //vpg_payload_color_5_PROC

  //The seventh color in a vpg_payload
  assign color_6_is_p_color7 =   data_in_zone1 & data_in_zone11 ;

  assign color_6_is_p_color8 = (~data_in_zone1)& data_in_zone3 & data_in_zone13 ;

  assign color_6_cal_nxt = {color_6_is_p_color8,color_6_is_p_color7};

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_6_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_6 <= 30'b0;
      else
      case(color_6_cal)
          2'b01  :vpg_payload_color_6 <= p_color7;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          2'b10  :vpg_payload_color_6 <= p_color8;
          //ccx_line_end
          // spyglass disable_block UnUsedFlopOutput-ML
          // SMD: Unreachable sequential element must be removed from the design
          // SJ: Depending of the configuration, this line can be unreachable.
          default:vpg_payload_color_6 <= 30'b0;
          // spyglass enable_block UnUsedFlopOutput-ML
      endcase
  end //vpg_payload_color_6_PROC

  //The eighth color in a vpg_payload
  assign color_7_is_p_color8 = data_in_zone1 & data_in_zone13 ;

  assign color_7_cal_nxt = color_7_is_p_color8;

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_color_7_PROC
      if(~ppi_clkrstz)
          vpg_payload_color_7 <= 30'b0;
      else
      case(color_7_cal)
          1'b1   :vpg_payload_color_7 <= p_color8;
          // spyglass disable_block UnUsedFlopOutput-ML
          // SMD: Unreachable sequential element must be removed from the design
          // SJ: Depending of the configuration, this line can be unreachable.
          default:vpg_payload_color_7 <= 30'b0;
          // spyglass enable_block UnUsedFlopOutput-ML
      endcase
  end //vpg_payload_color_7_PROC

  //Only up to eight kinds of color and color modes are up to seven as color cut-off points, so index of color is not more than 7.
  // spyglass disable_block W484
  // SMD: Possible assignment overflow.
  // SJ: Overflow can't occur. Protected by protocol.

  always @ * begin: p2_index_nxt_PROC
      case(color_x_y)
           1'b1 :    p2_index_nxt = 1'b1;
           default:  p2_index_nxt = 1'b0;
      endcase
  end // p2_index_nxt_PROC

  always @ * begin: p3_index_nxt_PROC
      case({p2_index_nxt,color_2x_y})
           {1'd1,1'b1} :   p3_index_nxt = 2'd2;
           {1'd1,1'b0},
           {1'd0,1'b1} :   p3_index_nxt = 2'd1;
           default     :   p3_index_nxt = 2'd0;
      endcase
  end // p3_index_nxt_PROC

  always @ * begin: p4_index_nxt_PROC
      case({p3_index_nxt,color_3x_y})
           {2'd2,1'b1} :   p4_index_nxt = 2'd3;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.           
           {2'd2,1'b0},
           {2'd1,1'b1} :   p4_index_nxt = 2'd2;
           //ccx_line_end
           {2'd1,1'b0},
           {2'd0,1'b1} :   p4_index_nxt = 2'd1;
           default     :   p4_index_nxt = 2'd0;
      endcase
  end // p4_index_nxt_PROC

  always @ * begin: p5_index_nxt_PROC
      case({p4_index_nxt,color_4x_y})
           {2'd3,1'b1} :   p5_index_nxt = 3'd4;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {2'd3,1'b0},
           {2'd2,1'b1} :   p5_index_nxt = 3'd3;
           //ccx_line_end
           {2'd2,1'b0},
           {2'd1,1'b1} :   p5_index_nxt = 3'd2;
           {2'd1,1'b0},
           {2'd0,1'b1} :   p5_index_nxt = 3'd1;
           default     :   p5_index_nxt = 3'd0;
      endcase
  end // p5_index_nxt_PROC

  always @ * begin: p6_index_nxt_PROC
      case({p5_index_nxt,color_5x_y})
           {3'd4,1'b1} :   p6_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd4,1'b0},
           {3'd3,1'b1} :   p6_index_nxt = 3'd4;
           //ccx_line_end
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd3,1'b0},
           {3'd2,1'b1} :   p6_index_nxt = 3'd3;
           //ccx_line_end
           {3'd2,1'b0},
           {3'd1,1'b1} :   p6_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p6_index_nxt = 3'd1;
           default     :   p6_index_nxt = 3'd0;
      endcase
  end // p6_index_nxt_PROC

  always @ * begin: p7_index_nxt_PROC
      case({p6_index_nxt,color_6x_y})
           {3'd5,1'b1} :   p7_index_nxt = 3'd6;
           {3'd5,1'b0},
           {3'd4,1'b1} :   p7_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd4,1'b0},
           {3'd3,1'b1} :   p7_index_nxt = 3'd4;
           //ccx_line_end
           {3'd3,1'b0},
           {3'd2,1'b1} :   p7_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p7_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p7_index_nxt = 3'd1;
           default     :   p7_index_nxt = 3'd0;
      endcase
  end // p7_index_nxt_PROC

  always @ * begin: p8_index_nxt_PROC
      case({p7_index_nxt,color_7x_y})
           {3'd6,1'b1} :   p8_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd6,1'b0},
           {3'd5,1'b1} :   p8_index_nxt = 3'd6;
           //ccx_line_end
           {3'd5,1'b0},
           {3'd4,1'b1} :   p8_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd4,1'b0},
           {3'd3,1'b1} :   p8_index_nxt = 3'd4;
           //ccx_line_end
           {3'd3,1'b0},
           {3'd2,1'b1} :   p8_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p8_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p8_index_nxt = 3'd1;
           default     :   p8_index_nxt = 3'd0;
      endcase
  end // p8_index_nxt_PROC

  always @ * begin: p9_index_nxt_PROC
      case({p8_index_nxt,color_8x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p9_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd6,1'b0},
           {3'd5,1'b1} :   p9_index_nxt = 3'd6;
           //ccx_line_end
           {3'd5,1'b0},
           {3'd4,1'b1} :   p9_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd4,1'b0},
           {3'd3,1'b1} :   p9_index_nxt = 3'd4;
           //ccx_line_end
           {3'd3,1'b0},
           {3'd2,1'b1} :   p9_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p9_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p9_index_nxt = 3'd1;
           default     :   p9_index_nxt = 3'd0;
      endcase
  end // p9_index_nxt_PROC

  always @ * begin: p10_index_nxt_PROC
      case({p9_index_nxt,color_9x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p10_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd6,1'b0},
           {3'd5,1'b1} :   p10_index_nxt = 3'd6;
           //ccx_line_end
           {3'd5,1'b0},
           {3'd4,1'b1} :   p10_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.           
           {3'd4,1'b0},
           {3'd3,1'b1} :   p10_index_nxt = 3'd4;
           //ccx_line_end           
           {3'd3,1'b0},
           {3'd2,1'b1} :   p10_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p10_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p10_index_nxt = 3'd1;
           default     :   p10_index_nxt = 3'd0;
      endcase
  end // p10_index_nxt_PROC

  always @ * begin: p11_index_nxt_PROC
      case({p10_index_nxt,color_10x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p11_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd6,1'b0},
           {3'd5,1'b1} :   p11_index_nxt = 3'd6;
           //ccx_line_end
           {3'd5,1'b0},
           {3'd4,1'b1} :   p11_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.           
           {3'd4,1'b0},
           {3'd3,1'b1} :   p11_index_nxt = 3'd4;
           //ccx_line_end           
           {3'd3,1'b0},
           {3'd2,1'b1} :   p11_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p11_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p11_index_nxt = 3'd1;
           default     :   p11_index_nxt = 3'd0;
      endcase
  end // p11_index_nxt_PROC

  always @ * begin: p12_index_nxt_PROC
      case({p11_index_nxt,color_11x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p12_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
           {3'd6,1'b0},
           {3'd5,1'b1} :   p12_index_nxt = 3'd6;
           //ccx_line_end
           {3'd5,1'b0},
           {3'd4,1'b1} :   p12_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.           
           {3'd4,1'b0},
           {3'd3,1'b1} :   p12_index_nxt = 3'd4;
           //ccx_line_end           
           {3'd3,1'b0},
           {3'd2,1'b1} :   p12_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p12_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p12_index_nxt = 3'd1;
           default     :   p12_index_nxt = 3'd0;
      endcase
  end // p12_index_nxt_PROC

  always @ * begin: p13_index_nxt_PROC
      case({p12_index_nxt,color_12x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p13_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.             
           {3'd6,1'b0},
           {3'd5,1'b1} :   p13_index_nxt = 3'd6;
           //ccx_line_end            
           {3'd5,1'b0},
           {3'd4,1'b1} :   p13_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.             
           {3'd4,1'b0},
           {3'd3,1'b1} :   p13_index_nxt = 3'd4;
           //ccx_line_end              
           {3'd3,1'b0},
           {3'd2,1'b1} :   p13_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p13_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p13_index_nxt = 3'd1;
           default     :   p13_index_nxt = 3'd0;
      endcase
  end // p13_index_nxt_PROC

  always @ * begin: p14_index_nxt_PROC
      case({p13_index_nxt,color_13x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p14_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.            
           {3'd6,1'b0},
           {3'd5,1'b1} :   p14_index_nxt = 3'd6;
           //ccx_line_end              
           {3'd5,1'b0},
           {3'd4,1'b1} :   p14_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.            
           {3'd4,1'b0},
           {3'd3,1'b1} :   p14_index_nxt = 3'd4;
           //ccx_line_end              
           {3'd3,1'b0},
           {3'd2,1'b1} :   p14_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p14_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p14_index_nxt = 3'd1;
           default     :   p14_index_nxt = 3'd0;
      endcase
  end // p14_index_nxt_PROC

  always @ * begin: p15_index_nxt_PROC
      case({p14_index_nxt,color_14x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p15_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.             
           {3'd6,1'b0},
           {3'd5,1'b1} :   p15_index_nxt = 3'd6;
           //ccx_line_end              
           {3'd5,1'b0},
           {3'd4,1'b1} :   p15_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.             
           {3'd4,1'b0},
           {3'd3,1'b1} :   p15_index_nxt = 3'd4;
           //ccx_line_end             
           {3'd3,1'b0},
           {3'd2,1'b1} :   p15_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p15_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p15_index_nxt = 3'd1;
           default     :   p15_index_nxt = 3'd0;
      endcase
  end // p15_index_nxt_PROC

  always @ * begin: p16_index_nxt_PROC
      case({p15_index_nxt,color_15x_y})
           {3'd7,1'b0},
           {3'd6,1'b1} :   p16_index_nxt = 3'd7;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.             
           {3'd6,1'b0},
           {3'd5,1'b1} :   p16_index_nxt = 3'd6;
           //ccx_line_end            
           {3'd5,1'b0},
           {3'd4,1'b1} :   p16_index_nxt = 3'd5;
           //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.             
           {3'd4,1'b0},
           {3'd3,1'b1} :   p16_index_nxt = 3'd4;
           //ccx_line_end             
           {3'd3,1'b0},
           {3'd2,1'b1} :   p16_index_nxt = 3'd3;
           {3'd2,1'b0},
           {3'd1,1'b1} :   p16_index_nxt = 3'd2;
           {3'd1,1'b0},
           {3'd0,1'b1} :   p16_index_nxt = 3'd1;
           default     :   p16_index_nxt = 3'd0;
      endcase
  end // p16_index_nxt_PROC

  // spyglass enable_block W484

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : pN_index_PROC
      if(~ppi_clkrstz) begin
          p2_index  <= 1'b0;
          p3_index  <= 2'b0;
          p4_index  <= 2'b0;
          p5_index  <= 3'b0;
          p6_index  <= 3'b0;
          p7_index  <= 3'b0;
          p8_index  <= 3'b0;
          p9_index  <= 3'b0;
          p10_index <= 3'b0;
          p11_index <= 3'b0;
          p12_index <= 3'b0;
          p13_index <= 3'b0;
          p14_index <= 3'b0;
          p15_index <= 3'b0;
          p16_index <= 3'b0;
      end else begin
          // spyglass disable_block FlopDataConstant
          // SMD: Flip-flop data pin driven by a constant value
          // SJ: High bits are intentionally tiew to low
          p2_index  <= p2_index_nxt;
          // spyglass enable_block FlopDataConstant
          p3_index  <= p3_index_nxt;
          p4_index  <= p4_index_nxt;
          p5_index  <= p5_index_nxt;
          p6_index  <= p6_index_nxt;
          p7_index  <= p7_index_nxt;
          p8_index  <= p8_index_nxt;
          p9_index  <= p9_index_nxt;
          p10_index <= p10_index_nxt;
          p11_index <= p11_index_nxt;
          p12_index <= p12_index_nxt;
          p13_index <= p13_index_nxt;
          p14_index <= p14_index_nxt;
          p15_index <= p15_index_nxt;
          p16_index <= p16_index_nxt;
      end
  end //pN_index_PROC

  //Use some pixel buses to contain the components of different color in different color mode.
  //Such as p1, p2 and so on, every pixel bus is used for one pixel in a vpg_payload.
  //The p1 is used for the first pixel component and p2 is used for the second pixel component and others can be reasoned.

  // spyglass disable_block UnloadedNet-ML
  // SMD: Unloaded but driven net detected in the design
  // SJ: Some bits of the signal may not be needed in different configurations.
  // spyglass disable_block checkNetReceiver
  // SMD: Each internal net must have at least one receiver.
  // SJ: Some bits of the signal may not be needed in different configurations.
  // spyglass disable_block OutNotUsed
  // SMD: No output of a gate is used
  // SJ: Some bits of the signal may not be needed in different configurations.
  assign p1 = vpg_payload_color_0;

  always@* begin : p2_PROC
      case(p2_index)
          1'b0   :p2 = vpg_payload_color_0;
          default:p2 = vpg_payload_color_1;
      endcase
  end //p2_PROC

  always@* begin : p3_PROC
      case(p3_index)
          2'd0   :p3 = vpg_payload_color_0;
          2'd1   :p3 = vpg_payload_color_1;
          default:p3 = vpg_payload_color_2;
      endcase
  end //p3_PROC

  always@* begin : p4_PROC
      case(p4_index)
          2'd0   :p4 = vpg_payload_color_0;
          2'd1   :p4 = vpg_payload_color_1;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          2'd2   :p4 = vpg_payload_color_2;
          //ccx_line_end
          default:p4 = vpg_payload_color_3;
      endcase
  end //p4_PROC

  always@* begin : p5_PROC
      case(p5_index)
          3'd0   :p5 = vpg_payload_color_0;
          3'd1   :p5 = vpg_payload_color_1;
          3'd2   :p5 = vpg_payload_color_2;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd3   :p5 = vpg_payload_color_3;
          //ccx_line_end
          default:p5 = vpg_payload_color_4;
      endcase
  end //p5_PROC

  always@* begin : p6_PROC
      case(p6_index)
          3'd0   :p6 = vpg_payload_color_0;
          3'd1   :p6 = vpg_payload_color_1;
          3'd2   :p6 = vpg_payload_color_2;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd3   :p6 = vpg_payload_color_3;
          //ccx_line_end
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd4   :p6 = vpg_payload_color_4;
          //ccx_line_end
          default:p6 = vpg_payload_color_5;
      endcase
  end //p6_PROC

  always@* begin : p7_PROC
      case(p7_index)
          3'd0   :p7 = vpg_payload_color_0;
          3'd1   :p7 = vpg_payload_color_1;
          3'd2   :p7 = vpg_payload_color_2;
          3'd3   :p7 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd4   :p7 = vpg_payload_color_4;
          //ccx_line_end
          3'd5   :p7 = vpg_payload_color_5;
          default:p7 = vpg_payload_color_6;
      endcase
  end //p7_PROC

  always@* begin : p8_PROC
      case(p8_index)
          3'd0   :p8 = vpg_payload_color_0;
          3'd1   :p8 = vpg_payload_color_1;
          3'd2   :p8 = vpg_payload_color_2;
          3'd3   :p8 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd4   :p8 = vpg_payload_color_4;
          //ccx_line_end
          3'd5   :p8 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd6   :p8 = vpg_payload_color_6;
          //ccx_line_end
          default:p8 = vpg_payload_color_7;
      endcase
  end //p8_PROC

  always@* begin : p9_PROC
      case(p9_index)
          3'd0   :p9 = vpg_payload_color_0;
          3'd1   :p9 = vpg_payload_color_1;
          3'd2   :p9 = vpg_payload_color_2;
          3'd3   :p9 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.          
          3'd4   :p9 = vpg_payload_color_4;
          //ccx_line_end          
          3'd5   :p9 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd6   :p9 = vpg_payload_color_6;
          //ccx_line_end
          default:p9 = vpg_payload_color_7;
      endcase
  end //p9_PROC

  always@* begin : p10_PROC
      case(p10_index)
          3'd0   :p10 = vpg_payload_color_0;
          3'd1   :p10 = vpg_payload_color_1;
          3'd2   :p10 = vpg_payload_color_2;
          3'd3   :p10 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.          
          3'd4   :p10 = vpg_payload_color_4;
          //ccx_line_end          
          3'd5   :p10 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd6   :p10 = vpg_payload_color_6;
          //ccx_line_end
          default:p10 = vpg_payload_color_7;
      endcase
  end //p10_PROC

  always@* begin : p11_PROC
      case(p11_index)
          3'd0   :p11 = vpg_payload_color_0;
          3'd1   :p11 = vpg_payload_color_1;
          3'd2   :p11 = vpg_payload_color_2;
          3'd3   :p11 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd4   :p11 = vpg_payload_color_4;
          //ccx_line_end
          3'd5   :p11 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd6   :p11 = vpg_payload_color_6;
          //ccx_line_end
          default:p11 = vpg_payload_color_7;
      endcase
  end //p11_PROC

  always@* begin : p12_PROC
      case(p12_index)
          3'd0   :p12 = vpg_payload_color_0;
          3'd1   :p12 = vpg_payload_color_1;
          3'd2   :p12 = vpg_payload_color_2;
          3'd3   :p12 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd4   :p12 = vpg_payload_color_4;
          //ccx_line_end
          3'd5   :p12 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd6   :p12 = vpg_payload_color_6;
          //ccx_line_end
          default:p12 = vpg_payload_color_7;
      endcase
  end //p12_PROC

  always@* begin : p13_PROC
      case(p13_index)
          3'd0   :p13 = vpg_payload_color_0;
          3'd1   :p13 = vpg_payload_color_1;
          3'd2   :p13 = vpg_payload_color_2;
          3'd3   :p13 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.          
          3'd4   :p13 = vpg_payload_color_4;
          //ccx_line_end          
          3'd5   :p13 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.           
          3'd6   :p13 = vpg_payload_color_6;
          //ccx_line_end            
          default:p13 = vpg_payload_color_7;
      endcase
  end //p13_PROC

  always@* begin : p14_PROC
      case(p14_index)
          3'd0   :p14 = vpg_payload_color_0;
          3'd1   :p14 = vpg_payload_color_1;
          3'd2   :p14 = vpg_payload_color_2;
          3'd3   :p14 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.           
          3'd4   :p14 = vpg_payload_color_4;
          //ccx_line_end          
          3'd5   :p14 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.            
          3'd6   :p14 = vpg_payload_color_6;
          //ccx_line_end          
          default:p14 = vpg_payload_color_7;
      endcase
  end //p14_PROC

  always@* begin : p15_PROC
      case(p15_index)
          3'd0   :p15 = vpg_payload_color_0;
          3'd1   :p15 = vpg_payload_color_1;
          3'd2   :p15 = vpg_payload_color_2;
          3'd3   :p15 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.          
          3'd4   :p15 = vpg_payload_color_4;
          //ccx_line_end          
          3'd5   :p15 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd6   :p15 = vpg_payload_color_6;
          //ccx_line_end
          default:p15 = vpg_payload_color_7;
      endcase
  end //p15_PROC

  always@* begin : p16_PROC
      case(p16_index)
          3'd0   :p16 = vpg_payload_color_0;
          3'd1   :p16 = vpg_payload_color_1;
          3'd2   :p16 = vpg_payload_color_2;
          3'd3   :p16 = vpg_payload_color_3;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd4   :p16 = vpg_payload_color_4;
          //ccx_line_end
          3'd5   :p16 = vpg_payload_color_5;
          //ccx_line_begin: ; It is a unreachable condition, just for coding integrity to be kept.
          3'd6   :p16 = vpg_payload_color_6;
          //ccx_line_end
          default:p16 = vpg_payload_color_7;
      endcase
  end //p16_PROC

  // spyglass enable_block OutNotUsed
  // spyglass enable_block checkNetReceiver
  // spyglass enable_block UnloadedNet-ML

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// vpg_payload build ////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  //Pattern package payload data (LSB transmission first)
  //Be jointed by pixel bus based on encoding map.

  //According to the color encode, the pixels generation can be divided into 4 categories
  //The counter for pixels generation is cyclical repetition.
  //The gen_cnt_period is used to define the cycles of repetition period.
  always@* begin : gen_cnt_period_PROC
      case(vpg_dt_qst)
          `CSI2_RAW6,
          `CSI2_RAW12,
          `CSI2_RAW24,
          `CSI2_LY420_8B,
          `CSI2_RGB888:begin
              gen_cnt_period = 4'd2;
          end
          `CSI2_RGB666:begin
              gen_cnt_period = 4'd8;
          end
          `CSI2_RAW8,
          `CSI2_Y420_8B,
          `CSI2_CSPS_Y420_8B,
          `CSI2_Y422_8B,
          `CSI2_RAW16,
          `CSI2_RGB444,
          `CSI2_RGB555,
          `CSI2_RGB565:begin
              gen_cnt_period = 4'd0;
          end
          `CSI2_RAW10,
          `CSI2_RAW20,
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_10B,
          `CSI2_Y422_10B:begin
              gen_cnt_period = 4'd4;
          end
          default:begin // `CSI2_RAW7,`CSI2_RAW14
              gen_cnt_period = 4'd6;
          end
      endcase
  end //gen_cnt_period_PROC

  //Current gen_cnt indication
  always@* begin : next_gen_cnt_PROC
      if(vpg_pld_gen_end)
          next_gen_cnt    = 4'd0;
      else
          if(vpg_pld_req_pre)
              if(current_gen_cnt == gen_cnt_period)
                  next_gen_cnt = 4'd0;
              else
              // spyglass disable_block W484
              // SMD: Possible assignment overflow.
              // SJ: Overflow can't occur. Protected by protocol.
                  next_gen_cnt = current_gen_cnt + 4'd1;
              // spyglass enable_block W484
          else
              next_gen_cnt = current_gen_cnt;
  end //next_gen_cnt_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : current_gen_cnt_PROC
    if(~ppi_clkrstz)
        current_gen_cnt    <= 4'd0;
    else
        current_gen_cnt    <= next_gen_cnt;
  end //current_gen_cnt_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : current_gen_cnt_d1_r_PROC
    if(~ppi_clkrstz)
        current_gen_cnt_d1_r <= 4'd0;
    else
        if(vpg_pld_gen_end)
            current_gen_cnt_d1_r <= 4'd0;
        else
            if(vpg_pld_req_pre)
                current_gen_cnt_d1_r <= current_gen_cnt;
  end // current_gen_cnt_d1_r_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : current_gen_cnt_d2_r_PROC
    if(~ppi_clkrstz)
        current_gen_cnt_d2_r <= 4'd0;
    else
        if(vpg_pld_gen_end)
            current_gen_cnt_d2_r <= 4'd0;
        else
            if(vpg_pld_req)
                current_gen_cnt_d2_r <= current_gen_cnt_d1_r;
  end // current_gen_cnt_d2_r_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_pld_req_1d_r_PROC
    if(~ppi_clkrstz)
        vpg_pld_req_1d_r <= 1'd0;
    else
        vpg_pld_req_1d_r <= vpg_pld_req;
  end  //vpg_pld_req_1d_r_PROC

  assign vpg_pld_shift_out = vpg_payload_shifter[63:0];

  always@* begin : first_category_pixels_PROC
      case(vpg_dt_qst)
          `CSI2_RAW6:begin
              first_category_pixels[71:0]    = {p12[29:24],p11[14: 9],p10[29:24], p9[14: 9],
                                                 p8[29:24], p7[14: 9], p6[29:24], p5[14: 9],
                                                 p4[29:24], p3[14: 9], p2[29:24], p1[14: 9]};
          end
          `CSI2_RAW12:begin
              first_category_pixels[71:0]    = { p6[21:18], p5[ 6: 3], p6[29:22], p5[14: 7],
                                                 p4[21:18], p3[ 6: 3], p4[29:22], p3[14: 7],
                                                 p2[21:18], p1[ 6: 3], p2[29:22], p1[14: 7]};
          end
          `CSI2_LY420_8B:begin
              first_category_pixels[71:0]   =  { p6[29:22], p5[29:22], p5[14: 7],
                                                 p4[29:22], p3[29:22], p3[14: 7],
                                                 p2[29:22], p1[29:22], p1[14: 7]};
          end
          `CSI2_RGB666:begin
              first_category_pixels[71:0]    = { p4[29:24], p4[19:14], p4[ 9: 4], p3[29:24], p3[19:14], p3[ 9: 4], p2[29:24], p2[19:14], p2[ 9: 4], p1[29:24], p1[19:14], p1[ 9: 4]};
          end
          default:begin
              first_category_pixels[71:0]    = {p3[29:22], p3[19:12], p3[ 9: 2], p2[29:22], p2[19:12], p2[ 9: 2], p1[29:22], p1[19:12], p1[ 9: 2]};
          end
      endcase
  end //first_category_pixels_PROC

  always@* begin : second_category_pixels_PROC
      case(vpg_dt_qst)
          `CSI2_RAW16:begin
              second_category_pixels[63:0]    = {p4[22: 15], p4[29], p4[29: 23], p3[7: 0], p3[14], p3[14: 8],
                                                 p2[22: 15], p2[29], p2[29: 23], p1[7: 0], p1[14], p1[14: 8]};
          end

          `CSI2_RAW8:begin
              second_category_pixels[63:0]    = { p8[29:22], p7[14: 7], p6[29:22], p5[14: 7], p4[29:22], p3[14: 7], p2[29:22], p1[14: 7]};
          end
          `CSI2_CSPS_Y420_8B,
          `CSI2_Y420_8B:begin
              if(odd_line)begin
                  second_category_pixels[63:0]    = { p8[29:22], p7[29:22], p6[29:22], p5[29:22], p4[29:22], p3[29:22], p2[29:22], p1[29:22]};
              end
                  else begin
                      second_category_pixels[63:0]    = {p4[29:22], p3[ 9: 2], p3[29:22], p3[19:12], p2[29:22], p1[ 9: 2], p1[29:22], p1[19:12]};
                  end
          end
          `CSI2_Y422_8B:begin
                  second_category_pixels[63:0]    = {p4[29:22], p3[ 9: 2], p3[29:22], p3[19:12], p2[29:22], p1[ 9: 2], p1[29:22], p1[19:12]};
          end
          default:begin //`CSI2_RGB444,`CSI2_RGB555,`CSI2_RGB565
                  second_category_pixels[63:0]    = {p4[29:25], p4[19:14], p4[9:5], p3[29:25], p3[19:14], p3[9:5], p2[29:25], p2[19:14], p2[9:5], p1[29:25], p1[19:14], p1[9:5]};
          end
      endcase
  end //second_category_pixels_PROC

  always@* begin : third_category_pixels_PROC
      case(vpg_dt_qst)
          `CSI2_RAW10:begin
              third_category_pixels[79:0]    = { p8[21:20], p7[ 6: 5], p6[21:20], p5[ 6: 5], p8[29:22], p7[14: 7], p6[29:22], p5[14: 7],
                                                 p4[21:20], p3[ 6: 5], p2[21:20], p1[ 6: 5], p4[29:22], p3[14: 7], p2[29:22], p1[14: 7]};
          end
          `CSI2_Y420_10B,
          `CSI2_CSPS_Y420_10B:begin
              if(odd_line) begin
                  third_category_pixels[79:0]    = { p8[21:20], p7[21:20], p6[21:20], p5[21:20], p8[29:22], p7[29:22], p6[29:22], p5[29:22],
                                                     p4[21:20], p3[21:20], p2[21:20], p1[21:20], p4[29:22], p3[29:22], p2[29:22], p1[29:22]};
              end
                  else begin
                      third_category_pixels[79:0]    = { p4[21:20], p3[ 1: 0], p3[21:20], p3[11:10], p4[29:22], p3[ 9: 2], p3[29:22], p3[19:12],
                                                         p2[21:20], p1[ 1: 0], p1[21:20], p1[11:10], p2[29:22], p1[ 9: 2], p1[29:22], p1[19:12]};
                  end
          end
          `CSI2_RAW20:begin
                  third_category_pixels[79:0]    = { p4[16:15], p4[26:25], p3[ 1: 0], p3[11:10], p4[24:17], {5{p4[29]}}, p4[29:27], p3[ 9: 2], {5{p3[14]}}, p3[14:12],
                                                     p2[16:15], p2[26:25], p1[ 1: 0], p1[11:10], p2[24:17], {5{p2[29]}}, p2[29:27], p1[ 9: 2], {5{p1[14]}}, p1[14:12]};
          end
          default:begin // CSI2_Y422_10B
                  third_category_pixels[79:0]    = { p4[21:20], p3[ 1: 0], p3[21:20], p3[11:10], p4[29:22], p3[ 9: 2], p3[29:22], p3[19:12],
                                                     p2[21:20], p1[ 1: 0], p1[21:20], p1[11:10], p2[29:22], p1[ 9: 2], p1[29:22], p1[19:12]};
          end
      endcase
  end //third_category_pixels_PROC

  always@* begin : fourth_category_pixels_PROC
      case(vpg_dt_qst)
          `CSI2_RAW7:begin
                   fourth_category_pixels[111:0]   = {p16[29:23],p15[14: 8],p14[29:23],p13[14: 8],p12[29:23],p11[14: 8],p10[29:23], p9[14: 8],
                                                       p8[29:23], p7[14: 8], p6[29:23], p5[14: 8], p4[29:23], p3[14: 8], p2[29:23], p1[14: 8]};
          end
          default:begin // `CSI2_RAW14
                  fourth_category_pixels[111:0]   = { p8[21:16], p7[6 : 1], p6[21:16], p5[ 6: 1], p8[29:22], p7[14: 7], p6[29:22], p5[14: 7],
                                                      p4[21:16], p3[6 : 1], p2[21:16], p1[ 6: 1], p4[29:22], p3[14: 7], p2[29:22], p1[14: 7]};
          end
      endcase
  end //fourth_category_pixels_PROC

  always@* begin : fifth_category_pixels_PROC
      case(vpg_dt_qst)
          `CSI2_RGB888:begin
              fifth_category_pixels[95:0] = {p4[29:22], p4[19:12], p4[ 9: 2], p3[29:22], p3[19:12], p3[ 9: 2], p2[29:22], p2[19:12], p2[ 9: 2], p1[29:22], p1[19:12], p1[ 9: 2]};
          end
          default:begin // `CSI2_RAW24
              fifth_category_pixels[95:0]    = { p4[18:15], p4[29], p4[29:27], p4[26:19], {8{p4[29]}}, p3[ 3: 0], p3[14], p3[14: 12], p3[11: 4], {8{p3[14]}},
                                                 p2[18:15], p2[29], p2[29:27], p2[26:19], {8{p2[29]}}, p1[ 3: 0], p1[14], p1[14: 12], p1[11: 4], {8{p1[14]}}};
          end
      endcase
  end //fifth_category_pixels_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_payload_shifter_64_PROC
      if(~ppi_clkrstz)
          vpg_payload_shifter    <= 112'b0;
      else
          if(vpg_pld_req_1d_r)
              case(vpg_dt_qst)
                  `CSI2_RAW6,
                  `CSI2_RAW12,
                  `CSI2_LY420_8B:begin
                      case(current_gen_cnt_d2_r)
                          4'd0:begin //72
                              vpg_payload_shifter[71:0] <= first_category_pixels[71:0];
                          end
                          4'd1:begin //72
                              vpg_payload_shifter[79:8] <= first_category_pixels[71:0];
                              vpg_payload_shifter[7:0]  <= vpg_payload_shifter[71:64];
                          end
                          default:begin   //4'd2 //48
                              vpg_payload_shifter[63:16] <= first_category_pixels[47:0];
                              vpg_payload_shifter[15:0]  <= vpg_payload_shifter[79:64];
                          end
                      endcase
                  end
                  `CSI2_RGB666:begin
                      case(current_gen_cnt_d2_r)
                          4'd0:begin //72
                              vpg_payload_shifter[71:0] <= first_category_pixels[71:0];
                          end
                          4'd1:begin //72
                              vpg_payload_shifter[79:8] <= first_category_pixels[71:0];
                              vpg_payload_shifter[7:0]  <= vpg_payload_shifter[71:64];
                          end
                          4'd2:begin //72
                              vpg_payload_shifter[87:16] <= first_category_pixels[71:0];
                              vpg_payload_shifter[15:0]  <= vpg_payload_shifter[79:64];
                          end
                          4'd3:begin //72
                              vpg_payload_shifter[95:24] <= first_category_pixels[71:0];
                              vpg_payload_shifter[23:0]  <= vpg_payload_shifter[87:64];
                          end
                          4'd4:begin //36
                              vpg_payload_shifter[67:32] <= first_category_pixels[35:0];
                              vpg_payload_shifter[31:0]  <= vpg_payload_shifter[95:64];
                          end
                          4'd5:begin //72
                              vpg_payload_shifter[75:4] <= first_category_pixels[71:0];
                              vpg_payload_shifter[3:0]  <= vpg_payload_shifter[67:64];
                          end
                          4'd6:begin //72
                              vpg_payload_shifter[83:12] <= first_category_pixels[71:0];
                              vpg_payload_shifter[11:0]  <= vpg_payload_shifter[75:64];
                          end
                          4'd7:begin //72
                              vpg_payload_shifter[91:20] <= first_category_pixels[71:0];
                              vpg_payload_shifter[19:0]  <= vpg_payload_shifter[83:64];
                          end
                          default:begin   //4'd8   //36
                              vpg_payload_shifter[63:28] <= first_category_pixels[35:0];
                              vpg_payload_shifter[27:0]   <= vpg_payload_shifter[91:64];
                          end
                      endcase
                  end
                  `CSI2_RAW16,
                  `CSI2_RAW8,
                  `CSI2_Y420_8B,
                  `CSI2_CSPS_Y420_8B,
                  `CSI2_Y422_8B,
                  `CSI2_RGB444,
                  `CSI2_RGB555,
                  `CSI2_RGB565:begin
                      vpg_payload_shifter[63:0] <= second_category_pixels[63:0];
                  end
                  `CSI2_RAW10,
                  `CSI2_RAW20,
                  `CSI2_Y420_10B,
                  `CSI2_CSPS_Y420_10B,
                  `CSI2_Y422_10B:begin
                      case(current_gen_cnt_d2_r)
                          4'd0:begin //80
                              vpg_payload_shifter[79:0] <= third_category_pixels[79:0];
                          end
                          4'd1:begin //80
                              vpg_payload_shifter[95:16] <= third_category_pixels[79:0];
                              vpg_payload_shifter[15:0]  <= vpg_payload_shifter[79:64];
                          end
                          4'd2:begin //40
                              vpg_payload_shifter[71:32] <= third_category_pixels[39:0];
                              vpg_payload_shifter[31:0]  <= vpg_payload_shifter[95:64];
                          end
                          4'd3:begin //80
                              vpg_payload_shifter[87:8]  <= third_category_pixels[79:0];
                              vpg_payload_shifter[7:0]   <= vpg_payload_shifter[71:64];
                          end
                          default:begin   //4'd4 //40
                              vpg_payload_shifter[63:24]  <= third_category_pixels[39:0];
                              vpg_payload_shifter[23:0]   <= vpg_payload_shifter[87:64];
                          end
                      endcase
                  end
                  `CSI2_RAW24,
                  `CSI2_RGB888:begin
                      case(current_gen_cnt_d2_r)
                          4'd0:begin //96
                              vpg_payload_shifter[95:0] <= fifth_category_pixels[95:0];
                          end
                          4'd1:begin //48
                              vpg_payload_shifter[79:32] <= fifth_category_pixels[47:0];
                              vpg_payload_shifter[31:0]  <= vpg_payload_shifter[95:64];
                          end
                          default:begin   //4'd2 //48
                              vpg_payload_shifter[63:16] <= fifth_category_pixels[47:0];
                              vpg_payload_shifter[15:0]  <= vpg_payload_shifter[79:64];
                          end
                      endcase
                  end
                  default:begin //`CSI2_RAW7, `CSI2_RAW14
                      case(current_gen_cnt_d2_r)
                          4'd0:begin //112
                              vpg_payload_shifter[111:0] <= fourth_category_pixels[111:0];
                          end
                          4'd1:begin //56
                              vpg_payload_shifter[103:48] <= fourth_category_pixels[55:0];
                              vpg_payload_shifter[47:0]   <= vpg_payload_shifter[111:64];
                          end
                          4'd2:begin //56
                              vpg_payload_shifter[95:40] <= fourth_category_pixels[55:0];
                              vpg_payload_shifter[39:0]   <= vpg_payload_shifter[103:64];
                          end
                          4'd3:begin //56
                              vpg_payload_shifter[87:32] <= fourth_category_pixels[55:0];
                              vpg_payload_shifter[31:0]   <= vpg_payload_shifter[95:64];
                          end
                          4'd4:begin //56
                              vpg_payload_shifter[79:24] <= fourth_category_pixels[55:0];
                              vpg_payload_shifter[23:0]   <= vpg_payload_shifter[87:64];
                          end
                          4'd5:begin //56
                              vpg_payload_shifter[71:16] <= fourth_category_pixels[55:0];
                              vpg_payload_shifter[15:0]   <= vpg_payload_shifter[79:64];
                          end
                          default:begin   //4'd6 //56
                              vpg_payload_shifter[63:8] <= fourth_category_pixels[55:0];
                              vpg_payload_shifter[7:0]   <= vpg_payload_shifter[71:64];
                          end
                      endcase
                  end
              endcase
  end //vpg_payload_shifter_64_PROC

  // spyglass disable_block W484
  // SMD: Possible assignment overflow.
  // SJ: Overflow can't occur. Protected by protocol.
  assign vpg_wc_minus1 = vpg_wc - 16'h1;
  // spyglass enable_block W484

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_wc_init_PROC
    if(~ppi_clkrstz)
        vpg_wc_init    <= 16'b0;
    else
        if(vp_req_ack)
            vpg_wc_init    <= vpg_wc_minus1;
  end //vpg_wc_init_PROC

  assign vpg_wc_init_mt_tx_num = |vpg_wc_init[15:`CSI2_DEVICE_PLD_BYTEEN_WIDTH];  //vpg_wc_init > `TX_BYTE_NUM
  assign vpg_pld_req_cnt_lt_2 = ~(|vpg_pld_req_cnt[15-`CSI2_DEVICE_PLD_BYTEEN_WIDTH:1]);  //vpg_pld_req_cnt < 2
  assign vpg_pld_1st_req_nxt  = vp_req_ack; // only video packet includes payload
  assign vpg_pld_req     = vpg_pld_1st_req | (vpg_pld_req_mt1_prd & ((~(almost_full & vpg_pld_req_1d_r)) & fullz));
  assign vpg_pld_req_pre = vp_req_ack | vpg_pld_req;
  assign buf_wr          = fullz & buf_wr_req;

  assign vpg_header_req_ack_pre2 = ~(vpg_packet_req_pre1 & (~vpg_header_req_ack_pre1));
  assign vpg_header_req_ack_pre1 = ~(vpg_packet_req      & (~vpg_header_gen_en));

  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: vpg_packet_req_pre2_PROC
      if(~ppi_clkrstz)
          vpg_packet_req_pre2 <= 1'h0;
      else
          vpg_packet_req_pre2 <= vpg_packet_req_pre2_nxt;
  end //vpg_packet_req_pre2_PROC

  always@* begin: vpg_packet_req_pre2_nxt_PROC
      if(vpg_hdr_req)
          vpg_packet_req_pre2_nxt = 1'h1;
      else
          if(vpg_header_req_ack_pre2)
              vpg_packet_req_pre2_nxt = 1'h0;
          else
              vpg_packet_req_pre2_nxt = vpg_packet_req_pre2;
  end //vpg_packet_req_pre2_nxt_PROC

  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: vpg_packet_req_pre1_PROC
      if(~ppi_clkrstz)
          vpg_packet_req_pre1 <= 1'h0;
      else
          vpg_packet_req_pre1 <= vpg_packet_req_pre1_nxt;
  end //vpg_packet_req_pre1_PROC

  always@* begin: vpg_packet_req_pre1_nxt_PROC
      if(vpg_packet_req_pre2)
          vpg_packet_req_pre1_nxt = 1'h1;
      else
          if(vpg_header_req_ack_pre1)
              vpg_packet_req_pre1_nxt = 1'h0;
          else
              vpg_packet_req_pre1_nxt = vpg_packet_req_pre1;
  end //vpg_packet_req_pre1_nxt_PROC

  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: vpg_packet_req_PROC
      if(~ppi_clkrstz)
          vpg_packet_req <= 1'h0;
      else
          vpg_packet_req <= vpg_packet_req_nxt;
  end //vpg_packet_req_PROC

  always@* begin: vpg_packet_req_nxt_PROC
      if(vpg_packet_req_pre1)
          vpg_packet_req_nxt = 1'h1;
      else
          if(vpg_header_gen_en)
              vpg_packet_req_nxt = 1'h0;
          else
              vpg_packet_req_nxt = vpg_packet_req;
  end //vpg_packet_req_nxt_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_header_pre1_PROC
      if(~ppi_clkrstz)
          vpg_header_pre1 <= {`CSI2_DEVICE_HD_WIDTH{1'b0}};
      else
          if(vpg_header_req_ack_pre2)
              vpg_header_pre1 <= vpg_header_pre2;
  end // vpg_header_pre1_PROC

  always @ (posedge ppi_clk or negedge ppi_clkrstz) begin : vpg_header_PROC
      if(~ppi_clkrstz)
          vpg_header <= {`CSI2_DEVICE_HD_WIDTH{1'b0}};
      else
          if(vpg_header_req_ack_pre1)
              vpg_header <= vpg_header_pre1;
  end // vpg_header_PROC

  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: vpg_pld_1st_req_PROC
      if(~ppi_clkrstz)
          vpg_pld_1st_req <= 1'h0;
      else
          vpg_pld_1st_req <= vpg_pld_1st_req_nxt;
  end //vpg_pld_1st_req_PROC

  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: vpg_pld_req_mt1_prd_PROC
      if(~ppi_clkrstz)
          vpg_pld_req_mt1_prd <= 1'h0;
      else
          vpg_pld_req_mt1_prd <= vpg_pld_req_mt1_prd_nxt;
  end //vpg_pld_req_mt1_prd_PROC

  always@* begin: vpg_pld_req_mt1_prd_nxt_PROC
      if(vpg_pld_1st_req & vpg_wc_init_mt_tx_num)
          vpg_pld_req_mt1_prd_nxt = 1'h1;
      else
          if(vpg_pld_req_cnt_lt_2 & vpg_pld_req)
              vpg_pld_req_mt1_prd_nxt = 1'h0;
          else
              vpg_pld_req_mt1_prd_nxt = vpg_pld_req_mt1_prd;
  end //vpg_pld_req_mt1_prd_nxt_PROC

  //vpg_pld_req_cnt is derived from vpg_wc (long pkt), if (vpg_pld_req_cnt > 0), every time read payload, vpg_pld_req_cnt minus 1;
  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: vpg_pld_req_cnt_PROC
      if(~ppi_clkrstz)
          vpg_pld_req_cnt <= {(16-`CSI2_DEVICE_PLD_BYTEEN_WIDTH){1'h0}};
      else
          vpg_pld_req_cnt <= vpg_pld_req_cnt_nxt;
  end // vpg_pld_req_cnt_PROC

  always@* begin: vpg_pld_req_cnt_nxt_PROC
      if(vpg_pld_1st_req)
          vpg_pld_req_cnt_nxt = vpg_wc_init[15:`CSI2_DEVICE_PLD_BYTEEN_WIDTH];
      else
          if(vpg_pld_req)
          // spyglass disable_block W484
          // SMD: Possible assignment overflow.
          // SJ: Overflow can't occur. Protected by protocol.
              vpg_pld_req_cnt_nxt = vpg_pld_req_cnt - {{(15-`CSI2_DEVICE_PLD_BYTEEN_WIDTH){1'h0}},1'h1};
          // spyglass enable_block W484
          else
              vpg_pld_req_cnt_nxt = vpg_pld_req_cnt;
  end // vpg_pld_req_cnt_nxt_PROC

  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: vpg_pld_gen_end_PROC
      if(~ppi_clkrstz)
          vpg_pld_gen_end <= 1'h0;
      else
          vpg_pld_gen_end <= vpg_pld_gen_end_nxt;
  end //vpg_pld_gen_end_PROC

  always@* begin: vpg_pld_gen_end_nxt_PROC
      if(vpg_pld_1st_req & ~vpg_wc_init_mt_tx_num)
          vpg_pld_gen_end_nxt = 1'h1;
      else
          if(vpg_pld_req_mt1_prd & vpg_pld_req_cnt_lt_2 & vpg_pld_req)
              vpg_pld_gen_end_nxt = 1'h1;
          else
              vpg_pld_gen_end_nxt = 1'h0;
  end //vpg_pld_gen_end_nxt_PROC

  always@(posedge ppi_clk or negedge ppi_clkrstz) begin: buf_wr_req_PROC
      if(~ppi_clkrstz)
          buf_wr_req <= 1'h0;
      else
          buf_wr_req <= buf_wr_req_nxt;
  end // buf_wr_req_PROC

  always@* begin: buf_wr_req_nxt_PROC
      if(vpg_pld_req_1d_r)
          buf_wr_req_nxt = 1'h1;
      else
          if(buf_wr)
              buf_wr_req_nxt = 1'h0;
          else
              buf_wr_req_nxt = buf_wr_req;
  end // buf_wr_req_nxt_PROC

  DWC_mipicsi2_device_elastbuf
   #(
    .ADDR_DEPTH (4),
    .DATA_WIDTH (`CSI2_DEVICE_NAP_PLD_WIDTH)
    )
    u_elastbuf_wrapper (
    .clk                 ( ppi_clk                 ),  //- clock input
    .rstz                ( ppi_clkrstz             ),  //- asynchronous rstz = reset_n
    .write               ( buf_wr                  ),  //- write enable, active high
    .datain              ( vpg_pld_shift_out       ),  //- data input
    .read                ( vpg_payload_gen_en      ),  //- read enable, active high
    .dataout             ( vpg_payload             ),  //- data output

    .clrbuff             ( 1'b0                    ),  //- synchronous clear FIFO, active high
    .emptyz              ( vpg_elastbuf_emptyz     ),  //- empty, active low
    .fullz               ( fullz                   ),  //- full,  active low
    .almost_full         ( almost_full             )   //- almost full, remain 1, active high
    );

// Revision: $Id: DWC_mipicsi2_device_vpg.v 1 2023/12/21 14:03:37 GMT qiupeng Exp $
endmodule
