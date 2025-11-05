
`include "as6d_app_all_includes.vh"
module as6d_app_idi_gen #(
    parameter    VIDEO_DATA_SIZE        = 140
)(/*AUTOARG*/
   // Outputs
   reg_rd_send_pkt_cnt_sp_ls, reg_rd_send_pkt_cnt_sp_le,
   reg_rd_send_pkt_cnt_sp_fs, reg_rd_send_pkt_cnt_sp_fe,
   reg_rd_send_pkt_cnt_lp_ph, reg_rd_send_pkt_cnt_lp_pf,
   csi2device_idi_tunnel_mode_en, csi2device_idi_header_en,
   csi2device_idi_virtual_channel, csi2device_idi_virtual_channel_x,
   csi2device_idi_data_type, csi2device_idi_word_count,
   csi2device_idi_data, csi2device_idi_data_en,
   csi2device_idi_byte_en, csi2device_idi_data_parity,
   app_aggr_idi_crc_err_int,
   // Inputs
   reg_send_pkt_match_lp_dt_en, reg_send_pkt_match_lp_dt,
   reg_clear_send_pkt_cnt_sp_ls, reg_clear_send_pkt_cnt_sp_le,
   reg_clear_send_pkt_cnt_sp_fs, reg_clear_send_pkt_cnt_sp_fe,
   reg_clear_send_pkt_cnt_lp_ph, reg_clear_send_pkt_cnt_lp_pf,
   aggre_clk, aggre_clk_rst_n, csi2device_idi_halt,
   csi2device_idi_anti_halt, video_data_vld, video_data,
   video_pipe_data_aggre_bypass, video_pipe_vld_aggre_bypass,
   app_aggregation_bypass, reg_delete_lp_depend_on_wc_mux,
   reg_app_aggr_vc_bit_override_en,
   reg_app_aggr_vc_bit_override_value, reg_app_aggr_idi_crc_chk_en
   );
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			reg_clear_send_pkt_cnt_lp_pf;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_clear_send_pkt_cnt_lp_ph;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_clear_send_pkt_cnt_sp_fe;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_clear_send_pkt_cnt_sp_fs;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_clear_send_pkt_cnt_sp_le;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_clear_send_pkt_cnt_sp_ls;// To u_monitor_idi_packet of monitor_idi_packet.v
input [5:0]		reg_send_pkt_match_lp_dt;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_send_pkt_match_lp_dt_en;// To u_monitor_idi_packet of monitor_idi_packet.v
// End of automatics
input                                                    aggre_clk                              ;
input                                                    aggre_clk_rst_n                        ;
input                                                    csi2device_idi_halt                    ;
input                                                    csi2device_idi_anti_halt               ;
input                                                    video_data_vld                         ;
input       [VIDEO_DATA_SIZE-1:0]                        video_data                             ;
input       [139:0]                                      video_pipe_data_aggre_bypass           ;
input                                                    video_pipe_vld_aggre_bypass            ;
input                                                    app_aggregation_bypass                 ;
input                                                    reg_delete_lp_depend_on_wc_mux         ;
input       [2:0]                                        reg_app_aggr_vc_bit_override_en        ;
input       [2:0]                                        reg_app_aggr_vc_bit_override_value     ;
input                                                    reg_app_aggr_idi_crc_chk_en            ;
                                                                                          
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [31:0]		reg_rd_send_pkt_cnt_lp_pf;// From u_monitor_idi_packet of monitor_idi_packet.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph;// From u_monitor_idi_packet of monitor_idi_packet.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe;// From u_monitor_idi_packet of monitor_idi_packet.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs;// From u_monitor_idi_packet of monitor_idi_packet.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le;// From u_monitor_idi_packet of monitor_idi_packet.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls;// From u_monitor_idi_packet of monitor_idi_packet.v
// End of automatics
output                                                   csi2device_idi_tunnel_mode_en          ;
output                                                   csi2device_idi_header_en               ;
output      [ 1:0]                                       csi2device_idi_virtual_channel         ;
output      [`CSI2_DEVICE_VCX_DWIDTH-1:0]                csi2device_idi_virtual_channel_x       ;
output      [ 5:0]                                       csi2device_idi_data_type               ;
output      [15:0]                                       csi2device_idi_word_count              ;
output      [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]            csi2device_idi_data                    ;
output                                                   csi2device_idi_data_en                 ;
output      [4-1:0]                                      csi2device_idi_byte_en                 ;
output      [21-1:0]                                     csi2device_idi_data_parity             ;
output                                                   app_aggr_idi_crc_err_int               ;
wire                                        data_flag                                   ;
wire                                        short_flag                                  ;
wire                                        footer_flag                                 ;
wire                                        header_flag                                 ;
wire [83:0]                                 rsv                                         ;
wire [20:0]                                 parity                                      ;
wire [15:0]                                 word_count                                  ;
wire [5:0]                                  data_type                                   ;
wire [4:0]                                  virtual_channel                             ;
wire                                        tunnel_mode_en                              ;
wire                                        video_data_vld_mux                          ;
reg                                         short_header_down                           ;
reg                                         footer_en_d1                                ;
reg                                         video_data_vld_mux_d1                       ;
wire                                        csi2device_idi_header_en                    ;
wire [ 1:0]                                 csi2device_idi_virtual_channel              ;
wire [`CSI2_DEVICE_VCX_DWIDTH-1:0]          csi2device_idi_virtual_channel_x            ;
wire [ 5:0]                                 csi2device_idi_data_type                    ;
wire [15:0]                                 csi2device_idi_word_count                   ;
wire                                        csi2device_idi_data_en                      ;
wire [4-1:0]                                csi2device_idi_byte_en                      ;
wire [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]      csi2device_idi_data                         ;
wire                                        csi2device_idi_tunnel_mode_en               ;
reg                                         csi2device_pre_ov_idi_tunnel_mode_en        ;
reg                                         csi2device_pre_ov_idi_header_en             ;
reg  [ 1:0]                                 csi2device_pre_ov_idi_virtual_channel       ;
reg  [`CSI2_DEVICE_VCX_DWIDTH-1:0]          csi2device_pre_ov_idi_virtual_channel_x     ;
reg  [ 5:0]                                 csi2device_pre_ov_idi_data_type             ;
reg  [15:0]                                 csi2device_pre_ov_idi_word_count            ;
reg                                         csi2device_pre_ov_idi_data_en               ;
reg  [4-1:0]                                csi2device_pre_ov_idi_byte_en               ;
reg  [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]      csi2device_pre_ov_idi_data                  ;
reg                                         csi2device_pre_ov_d1_idi_tunnel_mode_en     ;
reg                                         csi2device_pre_ov_d1_idi_header_en          ;
reg  [ 1:0]                                 csi2device_pre_ov_d1_idi_virtual_channel    ;
reg  [`CSI2_DEVICE_VCX_DWIDTH-1:0]          csi2device_pre_ov_d1_idi_virtual_channel_x  ;
reg  [ 5:0]                                 csi2device_pre_ov_d1_idi_data_type          ;
reg  [15:0]                                 csi2device_pre_ov_d1_idi_word_count         ;
reg                                         csi2device_pre_ov_d1_idi_data_en            ;
reg  [4-1:0]                                csi2device_pre_ov_d1_idi_byte_en            ;
reg  [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]      csi2device_pre_ov_d1_idi_data               ;
reg                                         csi2device_post_ov_idi_header_en            ;
reg   [ 1:0]                                csi2device_post_ov_idi_virtual_channel      ;
reg   [`CSI2_DEVICE_VCX_DWIDTH-1:0]         csi2device_post_ov_idi_virtual_channel_x    ;
reg   [ 5:0]                                csi2device_post_ov_idi_data_type            ;
reg   [15:0]                                csi2device_post_ov_idi_word_count           ;
reg                                         csi2device_post_ov_idi_data_en              ;
reg   [4-1:0]                               csi2device_post_ov_idi_byte_en              ;
reg   [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]     csi2device_post_ov_idi_data                 ;
wire                                        csi2device_shorten_pkt_idi_header_en        ;
wire [ 1:0]                                 csi2device_shorten_pkt_idi_virtual_channel  ;
wire [`CSI2_DEVICE_VCX_DWIDTH-1:0]          csi2device_shorten_pkt_idi_virtual_channel_x_pre_override;
wire [`CSI2_DEVICE_VCX_DWIDTH-1:0]          csi2device_shorten_pkt_idi_virtual_channel_x;
wire [ 5:0]                                 csi2device_shorten_pkt_idi_data_type        ;
wire [15:0]                                 csi2device_shorten_pkt_idi_word_count       ;
wire                                        csi2device_shorten_pkt_idi_data_en          ;
wire [4-1:0]                                csi2device_shorten_pkt_idi_byte_en          ;
wire [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]      csi2device_shorten_pkt_idi_data             ;
reg                                         lock_tunnel_mode_en                         ;
wire                                        video_crc_err                               ;
wire [5:0]                                  idi_data_type                               ;
wire                                        idi_data_en                                 ;
wire                                        idi_header_en                               ;
wire [15:0]                                 idi_word_count                              ;
wire [3:0]                                  idi_byte_en                                 ;
wire [2:0]                                  idi_virtual_channel_x                       ;
wire [1:0]                                  idi_virtual_channel                         ;
wire [127:0]                                idi_data                                    ;
wire [3:0]                                  byte_en                                     ;
reg  [15:0]                                 word_count_lock                             ;
reg  [15:0]                                 video_pipe_data_wc_cnt                      ;
wire [15:0]                                 video_pipe_data_wc_present                  ;
wire                                        video_pipe_data_wc_overflow                 ;
wire [3:0]                                  video_pipe_data_last_bytes                  ;
wire [15:0]                                 video_pipe_data_last_bytes_pre              ;
wire [15:0]                                 video_pipe_data_wc_present_pre              ;
reg                                         video_pipe_data_wc_overflow_d1              ;
wire                                        video_pipe_data_wc_overflow_up              ;
reg                                         data_en_d1                                  ;
reg  [3:0]                                  idigen_current_state                        ;
reg  [3:0]                                  idigen_next_state                           ;


//  debug state_machine start****************
parameter       IDI_IDLE               = 4'd0; 
parameter       IDI_LONG_PKT_H         = 4'd1;
parameter       IDI_LONG_PKT_B         = 4'd2;
parameter       IDI_LONG_PKT_F         = 4'd3;
parameter       IDI_SHRT_PKT           = 4'd4;

app_header idi_app_header;
app_data idi_app_data;

assign  app_aggr_idi_crc_err_int = reg_app_aggr_idi_crc_chk_en ? video_crc_err : 1'd0;

/*as6d_app_crc_chk_lane AUTO_TEMPLATE(
    .clk		(aggre_clk),
    .rst_n		(aggre_clk_rst_n),
    .pcs2mep_data_stat(reg_app_aggr_idi_crc_chk_en),
    .video_crc_err(video_crc_err),
)*/
as6d_app_crc_chk_lane u_as6d_app_crc_chk_lane(
					      .video_crc_err	(video_crc_err),
                            /*AUTOINST*/
					      // Inputs
					      .clk		(aggre_clk),	 // Templated
					      .rst_n		(aggre_clk_rst_n), // Templated
					      .video_data_vld	(video_data_vld),
					      .video_data	(video_data[139:0]),
					      .pcs2mep_data_stat(reg_app_aggr_idi_crc_chk_en)); // Templated


always @ (posedge aggre_clk or negedge aggre_clk_rst_n) begin
    if (!aggre_clk_rst_n)
       idigen_current_state <= 4'd0;
    else
        idigen_current_state <= idigen_next_state;
end

always @ (*) begin
    idigen_next_state = idigen_current_state;
    case (idigen_current_state)
        IDI_IDLE:
		   if ( header_flag) 
		     idigen_next_state =   IDI_LONG_PKT_H ;
		   else if ( short_flag)
		     idigen_next_state =   IDI_SHRT_PKT ;
		   else 
             idigen_next_state =   IDI_IDLE ;

	   IDI_LONG_PKT_H:
	      if ( data_flag)
		     idigen_next_state =   IDI_LONG_PKT_B ;
		  else 
		    idigen_next_state =   IDI_LONG_PKT_H ;

       IDI_LONG_PKT_B:
	      if ( footer_flag)
		     idigen_next_state =   IDI_LONG_PKT_F ;
		  else 
		    idigen_next_state =   IDI_LONG_PKT_B ;

       IDI_LONG_PKT_F:
	      if ( header_flag)
		     idigen_next_state =   IDI_LONG_PKT_H ;
		  else if (short_flag)
		    idigen_next_state =   IDI_SHRT_PKT ;
		 else 
		    idigen_next_state =   IDI_IDLE ;
	   default:  
	        idigen_next_state =   IDI_IDLE ;

	 endcase


end

//  debug state_machine end ****************


assign idi_app_header.data_flag         = app_aggregation_bypass ? video_pipe_data_aggre_bypass[135]     : video_data[135]      ;
assign idi_app_header.short_flag        = app_aggregation_bypass ? video_pipe_data_aggre_bypass[134]     : video_data[134]      ;
assign idi_app_header.footer_flag       = app_aggregation_bypass ? video_pipe_data_aggre_bypass[133]     : video_data[133]      ;
assign idi_app_header.header_flag       = app_aggregation_bypass ? video_pipe_data_aggre_bypass[132]     : video_data[132]      ;
assign idi_app_header.rsv               = app_aggregation_bypass ? video_pipe_data_aggre_bypass[131:48]  : video_data[131:48]   ;
assign idi_app_header.parity            = app_aggregation_bypass ? video_pipe_data_aggre_bypass[47:27]   : video_data[47:27]    ;
assign idi_app_header.word_count        = app_aggregation_bypass ? video_pipe_data_aggre_bypass[26:11]   : video_data[26:11]    ;
assign idi_app_header.data_type         = app_aggregation_bypass ? video_pipe_data_aggre_bypass[10:5]    : video_data[10:5]     ;
assign idi_app_header.virtual_channel   = app_aggregation_bypass ? video_pipe_data_aggre_bypass[4:0]     : video_data[4:0]      ;
                                                                                                 
assign idi_app_data.data_flag           = app_aggregation_bypass ? video_pipe_data_aggre_bypass[135]     : video_data[135]      ;
assign idi_app_data.short_flag          = app_aggregation_bypass ? video_pipe_data_aggre_bypass[134]     : video_data[134]      ;
assign idi_app_data.footer_flag         = app_aggregation_bypass ? video_pipe_data_aggre_bypass[133]     : video_data[133]      ;
assign idi_app_data.header_flag         = app_aggregation_bypass ? video_pipe_data_aggre_bypass[132]     : video_data[132]      ;
assign idi_app_data.byte_en             = app_aggregation_bypass ? video_pipe_data_aggre_bypass[131:128] : video_data[131:128]  ;
assign idi_app_data.csi_data            = app_aggregation_bypass ? video_pipe_data_aggre_bypass[127:0]   : video_data[127:0]    ;

assign tunnel_mode_en                   = app_aggregation_bypass ? video_pipe_data_aggre_bypass[139]     : video_data[139]      ;

assign video_data_vld_mux           = app_aggregation_bypass ? video_pipe_vld_aggre_bypass           : video_data_vld      ;

assign data_flag        = idi_app_header.data_flag          ;
assign short_flag       = idi_app_header.short_flag         ;
assign footer_flag      = idi_app_header.footer_flag        ;
assign header_flag      = idi_app_header.header_flag        ;
assign rsv              = idi_app_header.rsv                ;
assign parity           = idi_app_header.parity             ;
assign word_count       = idi_app_header.word_count         ;
assign data_type        = idi_app_header.data_type          ;
assign virtual_channel  = idi_app_header.virtual_channel    ;

assign byte_en          = idi_app_data.byte_en              ;

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        data_en_d1 <= 1'd0;
    else if(video_data_vld_mux & idi_app_header.data_flag)
        data_en_d1 <= 1'd1;
    else 
        data_en_d1 <= 1'd0;
end

//word_count pre overflow logic
always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        short_header_down <= 1'd0;
    else if(video_data_vld_mux & idi_app_header.short_flag)
        short_header_down <= 1'd1;
    else 
        short_header_down <= 1'd0;
end


always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        footer_en_d1 <= 1'd0;
    else if(video_data_vld_mux & idi_app_header.footer_flag)
        footer_en_d1 <= 1'd1;
    else 
        footer_en_d1 <= 1'd0;
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        video_data_vld_mux_d1 <= 1'd0;
    else 
        video_data_vld_mux_d1 <= video_data_vld_mux;
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        csi2device_pre_ov_idi_header_en <= 1'd0;
    else if(video_data_vld_mux & idi_app_header.header_flag)
        csi2device_pre_ov_idi_header_en <= 1'd1;
    else if(video_data_vld_mux_d1 & footer_en_d1)
        csi2device_pre_ov_idi_header_en <= 1'd0;
    else if(video_data_vld_mux & idi_app_header.short_flag)
        csi2device_pre_ov_idi_header_en <= 1'd1;
    else if(short_header_down)
        csi2device_pre_ov_idi_header_en <= 1'd0;
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)begin
        csi2device_pre_ov_idi_virtual_channel       <=    2'd0;
        csi2device_pre_ov_idi_virtual_channel_x     <=    `CSI2_DEVICE_VCX_DWIDTH'd0;
        csi2device_pre_ov_idi_data_type             <=    6'd0;
        csi2device_pre_ov_idi_word_count            <=    16'd0;
    end
    else if(video_data_vld_mux&(idi_app_header.header_flag|idi_app_header.short_flag))begin
        csi2device_pre_ov_idi_virtual_channel       <=    idi_app_header.virtual_channel[1:0];
        csi2device_pre_ov_idi_virtual_channel_x     <=    idi_app_header.virtual_channel[4:2];
        csi2device_pre_ov_idi_data_type             <=    idi_app_header.data_type;
        csi2device_pre_ov_idi_word_count            <=    idi_app_header.word_count;
    end
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)begin
        csi2device_pre_ov_idi_data_en  <=  1'd0;
        csi2device_pre_ov_idi_byte_en  <=  4'd0;
        csi2device_pre_ov_idi_data     <=  `CSI2_DEVICE_IDI_DATA_WIDTH'd0;
    end
    else if(video_data_vld_mux&idi_app_header.data_flag)begin
        csi2device_pre_ov_idi_data_en  <=  idi_app_header.data_flag;
        csi2device_pre_ov_idi_byte_en  <=  idi_app_data.byte_en;
        csi2device_pre_ov_idi_data     <=  idi_app_data.csi_data;
    end                             
    else begin
        csi2device_pre_ov_idi_data_en  <=  1'd0;
        csi2device_pre_ov_idi_byte_en  <=  4'd0;
        csi2device_pre_ov_idi_data     <=  `CSI2_DEVICE_IDI_DATA_WIDTH'd0;
    end                             
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        csi2device_pre_ov_idi_tunnel_mode_en  <=  1'd0;
    else if(video_data_vld_mux&tunnel_mode_en)
        csi2device_pre_ov_idi_tunnel_mode_en  <=  1'd1;
    else 
        csi2device_pre_ov_idi_tunnel_mode_en  <=  1'd0;
end

//word_count_overflow logic
always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        word_count_lock <= 16'd0;
    else if(header_flag&video_data_vld_mux)
        word_count_lock <= idi_app_header.word_count;
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        video_pipe_data_wc_cnt <= 16'd0;
    else if(header_flag&video_data_vld_mux)
        video_pipe_data_wc_cnt <= 16'd0;
    else if(data_en_d1&video_data_vld_mux)
        video_pipe_data_wc_cnt <= video_pipe_data_wc_cnt + 5'd16;
end
assign video_pipe_data_wc_present_pre   = video_pipe_data_wc_cnt + byte_en + 1'd1;
assign video_pipe_data_last_bytes_pre   = (word_count_lock - video_pipe_data_wc_cnt - 1'd1);
//if wc_cnt + byte_en + 1> wc_lock,then last_bytes = wc_lock - wc_cnt - 1
assign video_pipe_data_wc_present   = data_en_d1 ? video_pipe_data_wc_present_pre : 16'd0;
assign video_pipe_data_wc_overflow  = video_pipe_data_wc_present > word_count_lock ;
assign video_pipe_data_last_bytes   = data_en_d1 ? video_pipe_data_last_bytes_pre[3:0] : 4'd0;

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        video_pipe_data_wc_overflow_d1 <= 1'd0;
    else if(video_pipe_data_wc_overflow)
        video_pipe_data_wc_overflow_d1 <= 1'd1;
    else
        video_pipe_data_wc_overflow_d1 <= 1'd0;
end

assign  video_pipe_data_wc_overflow_up  =  ~video_pipe_data_wc_overflow_d1 & video_pipe_data_wc_overflow;
//**** shorten pkt that length longer than wc field for pixel mode ****//
always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)begin
        csi2device_post_ov_idi_header_en            <=  1'd0;
        csi2device_post_ov_idi_data_en              <=  1'd0;
        csi2device_post_ov_idi_byte_en              <=  4'd0;
        csi2device_post_ov_idi_data                 <=  `CSI2_DEVICE_IDI_DATA_WIDTH'd0;
        csi2device_post_ov_idi_word_count           <=  16'd0;
        csi2device_post_ov_idi_virtual_channel_x    <=  `CSI2_DEVICE_VCX_DWIDTH'd0;
        csi2device_post_ov_idi_virtual_channel      <=  2'd0;
        csi2device_post_ov_idi_data_type            <=  6'd0;
    end
    else if(video_pipe_data_wc_overflow_d1)begin
        csi2device_post_ov_idi_header_en            <=  1'd0;
        csi2device_post_ov_idi_data_en              <=  1'd0;
        csi2device_post_ov_idi_byte_en              <=  4'd0;
        csi2device_post_ov_idi_data                 <=  `CSI2_DEVICE_IDI_DATA_WIDTH'd0;
        csi2device_post_ov_idi_word_count           <=  16'd0;
        csi2device_post_ov_idi_virtual_channel_x    <=  `CSI2_DEVICE_VCX_DWIDTH'd0;
        csi2device_post_ov_idi_virtual_channel      <=  2'd0;
        csi2device_post_ov_idi_data_type            <=  6'd0;
    end                             
    else if(video_pipe_data_wc_overflow_up)begin
        csi2device_post_ov_idi_header_en            <=  csi2device_pre_ov_idi_header_en;  
        csi2device_post_ov_idi_data_en              <=  csi2device_pre_ov_idi_data_en;
        csi2device_post_ov_idi_byte_en              <=  video_pipe_data_last_bytes;
        csi2device_post_ov_idi_data                 <=  csi2device_pre_ov_idi_data;
        csi2device_post_ov_idi_word_count           <=  csi2device_pre_ov_idi_word_count;
        csi2device_post_ov_idi_virtual_channel_x    <=  csi2device_pre_ov_idi_virtual_channel_x;
        csi2device_post_ov_idi_virtual_channel      <=  csi2device_pre_ov_idi_virtual_channel;
        csi2device_post_ov_idi_data_type            <=  csi2device_pre_ov_idi_data_type;
    end                             
    else begin
        csi2device_post_ov_idi_header_en            <=  csi2device_pre_ov_idi_header_en;  
        csi2device_post_ov_idi_data_en              <=  csi2device_pre_ov_idi_data_en;
        csi2device_post_ov_idi_byte_en              <=  csi2device_pre_ov_idi_byte_en;
        csi2device_post_ov_idi_data                 <=  csi2device_pre_ov_idi_data;
        csi2device_post_ov_idi_word_count           <=  csi2device_pre_ov_idi_word_count;
        csi2device_post_ov_idi_virtual_channel_x    <=  csi2device_pre_ov_idi_virtual_channel_x;
        csi2device_post_ov_idi_virtual_channel      <=  csi2device_pre_ov_idi_virtual_channel;
        csi2device_post_ov_idi_data_type            <=  csi2device_pre_ov_idi_data_type;
    end                             
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)begin
        csi2device_pre_ov_d1_idi_header_en            <=  1'd0;
        csi2device_pre_ov_d1_idi_data_en              <=  1'd0;
        csi2device_pre_ov_d1_idi_byte_en              <=  4'd0;
        csi2device_pre_ov_d1_idi_data                 <=  `CSI2_DEVICE_IDI_DATA_WIDTH'd0;
        csi2device_pre_ov_d1_idi_word_count           <=  16'd0;
        csi2device_pre_ov_d1_idi_virtual_channel_x    <=  `CSI2_DEVICE_VCX_DWIDTH'd0;
        csi2device_pre_ov_d1_idi_virtual_channel      <=  2'd0;
        csi2device_pre_ov_d1_idi_data_type            <=  6'd0;
    end
    else begin
        csi2device_pre_ov_d1_idi_header_en            <=  csi2device_pre_ov_idi_header_en;  
        csi2device_pre_ov_d1_idi_data_en              <=  csi2device_pre_ov_idi_data_en;
        csi2device_pre_ov_d1_idi_byte_en              <=  csi2device_pre_ov_idi_byte_en;
        csi2device_pre_ov_d1_idi_data                 <=  csi2device_pre_ov_idi_data;
        csi2device_pre_ov_d1_idi_word_count           <=  csi2device_pre_ov_idi_word_count;
        csi2device_pre_ov_d1_idi_virtual_channel_x    <=  csi2device_pre_ov_idi_virtual_channel_x;
        csi2device_pre_ov_d1_idi_virtual_channel      <=  csi2device_pre_ov_idi_virtual_channel;
        csi2device_pre_ov_d1_idi_data_type            <=  csi2device_pre_ov_idi_data_type;
    end                             
end


//**** shorten pkt func and normal transmit mux for pixel mode ****//
assign    csi2device_shorten_pkt_idi_data_type                      = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_data_type         : csi2device_pre_ov_d1_idi_data_type         ;
assign    csi2device_shorten_pkt_idi_data_en                        = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_data_en           : csi2device_pre_ov_d1_idi_data_en           ;
assign    csi2device_shorten_pkt_idi_header_en                      = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_header_en         : csi2device_pre_ov_d1_idi_header_en         ;
assign    csi2device_shorten_pkt_idi_word_count                     = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_word_count        : csi2device_pre_ov_d1_idi_word_count        ;
assign    csi2device_shorten_pkt_idi_byte_en                        = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_byte_en           : csi2device_pre_ov_d1_idi_byte_en           ;
assign    csi2device_shorten_pkt_idi_virtual_channel_x_pre_override = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_virtual_channel_x : csi2device_pre_ov_d1_idi_virtual_channel_x ;
assign    csi2device_shorten_pkt_idi_virtual_channel                = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_virtual_channel   : csi2device_pre_ov_d1_idi_virtual_channel   ;
assign    csi2device_shorten_pkt_idi_data                           = reg_delete_lp_depend_on_wc_mux ? csi2device_post_ov_idi_data              : csi2device_pre_ov_d1_idi_data              ;

assign    csi2device_shorten_pkt_idi_virtual_channel_x[0] = reg_app_aggr_vc_bit_override_en[0] ? reg_app_aggr_vc_bit_override_value[0] : csi2device_shorten_pkt_idi_virtual_channel_x_pre_override[0] ;
assign    csi2device_shorten_pkt_idi_virtual_channel_x[1] = reg_app_aggr_vc_bit_override_en[1] ? reg_app_aggr_vc_bit_override_value[1] : csi2device_shorten_pkt_idi_virtual_channel_x_pre_override[1] ;
assign    csi2device_shorten_pkt_idi_virtual_channel_x[2] = reg_app_aggr_vc_bit_override_en[2] ? reg_app_aggr_vc_bit_override_value[2] : csi2device_shorten_pkt_idi_virtual_channel_x_pre_override[2] ;

//**** dont touch any field for tunnel mode ****//
always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
    if(~aggre_clk_rst_n)
        lock_tunnel_mode_en       <=  1'd0;
    else if(csi2device_pre_ov_idi_header_en & ~csi2device_pre_ov_d1_idi_header_en)
        lock_tunnel_mode_en       <=  csi2device_pre_ov_idi_tunnel_mode_en;
end

//**** pixel mode and tunnel mode mux ****//
assign    csi2device_idi_header_en          = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_header_en         : csi2device_shorten_pkt_idi_header_en             ;
assign    csi2device_idi_data_en            = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_data_en           : csi2device_shorten_pkt_idi_data_en               ;
assign    csi2device_idi_byte_en            = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_byte_en           : csi2device_shorten_pkt_idi_byte_en               ;
assign    csi2device_idi_data               = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_data              : csi2device_shorten_pkt_idi_data                  ;
assign    csi2device_idi_word_count         = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_word_count        : csi2device_shorten_pkt_idi_word_count            ;
assign    csi2device_idi_virtual_channel_x  = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_virtual_channel_x : csi2device_shorten_pkt_idi_virtual_channel_x     ;
assign    csi2device_idi_virtual_channel    = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_virtual_channel   : csi2device_shorten_pkt_idi_virtual_channel       ;
assign    csi2device_idi_data_type          = lock_tunnel_mode_en ? csi2device_pre_ov_d1_idi_data_type         : csi2device_shorten_pkt_idi_data_type             ;
assign    csi2device_idi_tunnel_mode_en     = lock_tunnel_mode_en ? 1'b1                                       : 1'b0                                             ;

assign    idi_data_type          = csi2device_idi_data_type         ;
assign    idi_data_en            = csi2device_idi_data_en           ;
assign    idi_header_en          = csi2device_idi_header_en         ;
assign    idi_word_count         = csi2device_idi_word_count        ;
assign    idi_byte_en            = csi2device_idi_byte_en           ;
assign    idi_virtual_channel_x  = csi2device_idi_virtual_channel_x ;
assign    idi_virtual_channel    = csi2device_idi_virtual_channel   ;
assign    idi_data               = csi2device_idi_data              ;

assign    csi2device_idi_data_parity[ 0] = parity_calc({idi_data_type,idi_data_en,idi_header_en});
assign    csi2device_idi_data_parity[ 1] = parity_calc(idi_word_count[7:0]);
assign    csi2device_idi_data_parity[ 2] = parity_calc(idi_word_count[15:8]);
assign    csi2device_idi_data_parity[ 3] = parity_calc({4'b0,idi_byte_en});
assign    csi2device_idi_data_parity[ 4] = parity_calc({3'b0,idi_virtual_channel_x,idi_virtual_channel});
assign    csi2device_idi_data_parity[ 5] = parity_calc(idi_data[ 7: 0]);
assign    csi2device_idi_data_parity[ 6] = parity_calc(idi_data[15: 8]);
assign    csi2device_idi_data_parity[ 7] = parity_calc(idi_data[23:16]);
assign    csi2device_idi_data_parity[ 8] = parity_calc(idi_data[31:24]);
assign    csi2device_idi_data_parity[ 9] = parity_calc(idi_data[39:32]);
assign    csi2device_idi_data_parity[10] = parity_calc(idi_data[47:40]);
assign    csi2device_idi_data_parity[11] = parity_calc(idi_data[55:48]);
assign    csi2device_idi_data_parity[12] = parity_calc(idi_data[63:56]);
assign    csi2device_idi_data_parity[13] = parity_calc(idi_data[71:64]);
assign    csi2device_idi_data_parity[14] = parity_calc(idi_data[79:72]);
assign    csi2device_idi_data_parity[15] = parity_calc(idi_data[87:80]);
assign    csi2device_idi_data_parity[16] = parity_calc(idi_data[95:88]);
assign    csi2device_idi_data_parity[17] = parity_calc(idi_data[103:96]);
assign    csi2device_idi_data_parity[18] = parity_calc(idi_data[111:104]);
assign    csi2device_idi_data_parity[19] = parity_calc(idi_data[119:112]);
assign    csi2device_idi_data_parity[20] = parity_calc(idi_data[127:120]);

//function definition
function automatic parity_calc;
    input [7:0] data;
    begin
        parity_calc = ^data;
    end
endfunction

//*********************************************debug cnt*************************************//
 /*  monitor_idi_packet  AUTO_TEMPLATE (
    .clk    (aggre_clk),
    .rst_n  (aggre_clk_rst_n),
    .header_en		(csi2device_idi_header_en),
    .data_type		(csi2device_idi_data_type[]),
    .\(.*\)resv_pkt\(.*\)		(\1send_pkt\2[]),
)*/
monitor_idi_packet    u_monitor_idi_packet(/*AUTOINST*/
					   // Outputs
					   .reg_rd_resv_pkt_cnt_lp_pf(reg_rd_send_pkt_cnt_lp_pf[31:0]), // Templated
					   .reg_rd_resv_pkt_cnt_lp_ph(reg_rd_send_pkt_cnt_lp_ph[31:0]), // Templated
					   .reg_rd_resv_pkt_cnt_sp_le(reg_rd_send_pkt_cnt_sp_le[31:0]), // Templated
					   .reg_rd_resv_pkt_cnt_sp_ls(reg_rd_send_pkt_cnt_sp_ls[31:0]), // Templated
					   .reg_rd_resv_pkt_cnt_sp_fe(reg_rd_send_pkt_cnt_sp_fe[31:0]), // Templated
					   .reg_rd_resv_pkt_cnt_sp_fs(reg_rd_send_pkt_cnt_sp_fs[31:0]), // Templated
					   // Inputs
					   .clk			(aggre_clk),	 // Templated
					   .rst_n		(aggre_clk_rst_n), // Templated
					   .header_en		(csi2device_idi_header_en), // Templated
					   .data_type		(csi2device_idi_data_type[5:0]), // Templated
					   .reg_resv_pkt_match_lp_dt(reg_send_pkt_match_lp_dt[5:0]), // Templated
					   .reg_resv_pkt_match_lp_dt_en(reg_send_pkt_match_lp_dt_en), // Templated
					   .reg_clear_resv_pkt_cnt_lp_pf(reg_clear_send_pkt_cnt_lp_pf), // Templated
					   .reg_clear_resv_pkt_cnt_lp_ph(reg_clear_send_pkt_cnt_lp_ph), // Templated
					   .reg_clear_resv_pkt_cnt_sp_le(reg_clear_send_pkt_cnt_sp_le), // Templated
					   .reg_clear_resv_pkt_cnt_sp_ls(reg_clear_send_pkt_cnt_sp_ls), // Templated
					   .reg_clear_resv_pkt_cnt_sp_fe(reg_clear_send_pkt_cnt_sp_fe), // Templated
					   .reg_clear_resv_pkt_cnt_sp_fs(reg_clear_send_pkt_cnt_sp_fs)); // Templated

endmodule
