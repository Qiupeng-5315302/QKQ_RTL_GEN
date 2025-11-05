
//`include "as6d_mep_all_includes.vh"
`include "as6d_app_all_includes.vh"
module as6d_app_video_pipe_lane    #(
    parameter VIDEO_DATA_SIZE                            = 140
    )(/*AUTOARG*/
   // Outputs
   video_data_fwft_fifo_ecc_fault, video_data_afifo_ecc_fault,
   ack_pre, video_data_afifo_single_err, video_data_afifo_double_err,
   video_data_afifo_ovf_int, video_data_afifo_udf_int,
   video_data_afifo_prog_full, video_data_afifo_empty,
   video_data_afifo_full, video_data_afifo_prog_empty,
   video_data_fwft_fifo_single_err, video_data_fwft_fifo_double_err,
   video_data_fwft_fifo_ovf_int, video_data_fwft_fifo_udf_int,
   video_data_fwft_fifo_prog_full, video_data_fwft_fifo_empty,
   video_data_fwft_fifo_full, video_data_vld, video_data, ack,
   line_end, video_loss, video_lock, fifo_rd_ctrl_cs, fs_detect_pipe,
   fs_cnt_pipe, empty_vld_aggregator0, empty_vld_aggregator1,
   empty_vld_aggregator2, empty_vld_aggregator3, ack_vld_aggregator0,
   ack_vld_aggregator1, ack_vld_aggregator2, ack_vld_aggregator3,
   line_end_vld_aggregator0, line_end_vld_aggregator1,
   line_end_vld_aggregator2, line_end_vld_aggregator3,
   video_pipe_data_aggre_bypass, video_pipe_vld_aggre_bypass,
   reg_rd_resv_pkt_cnt_lp_pf, reg_rd_resv_pkt_cnt_lp_ph,
   reg_rd_resv_pkt_cnt_sp_le, reg_rd_resv_pkt_cnt_sp_ls,
   reg_rd_resv_pkt_cnt_sp_fe, reg_rd_resv_pkt_cnt_sp_fs,
   reg_rd_app_full_cnt_sync_fifo, reg_rd_app_full_cnt_async_fifo,
   reg_rd_dispatched_cnt_ready_for_sch, lcrc_err,
   reg_rd_dbg_pkt_num_nonzero_threshold_err,
   reg_rd_dbg_pkt_num_nonzero_and_fifo_empty_threshold_err,
   video_pipe_date_type_for_concat_align,
   video_pipe_date_type_for_concat_align_vld,
   // Inputs
   reg_video_fifo_empty_depend_cnt_mux, reg_sram_lcrc_err_oen,
   reg_resv_pkt_match_lp_dt_en, reg_resv_pkt_match_lp_dt,
   reg_app_pkt_crc_gen_dis, reg_app_ecc_fault_detc_en,
   reg_app_ecc_bypass, reg_app_ecc_addr_protect_en, clk_1M,
   fifo_wrclk, fifo_wrclk_rst_n, fifo_rdclk, fifo_rdclk_rst_n,
   in_csi_data, in_bytes_en, in_header_en, in_data_en, in_data_type,
   in_virtual_channel, in_virtual_channel_x, in_word_count,
   in_aggr_id, in_pkt_crc, in_pkt_crc_en, up_state, line_delay_en,
   video_loss_en, time_window, reg_dft_tpram_config,
   reg_dft_sync_tpram_config, app_aggregation_bypass,
   reg_video_pipe_en, reg_last_byte_header_down_mux,
   reg_clear_resv_pkt_cnt_lp_pf, reg_clear_resv_pkt_cnt_lp_ph,
   reg_clear_resv_pkt_cnt_sp_le, reg_clear_resv_pkt_cnt_sp_ls,
   reg_clear_resv_pkt_cnt_sp_fe, reg_clear_resv_pkt_cnt_sp_fs,
   reg_clear_app_full_cnt_async_fifo,
   reg_clear_app_full_cnt_sync_fifo, reg_app_wr_idi_data_continue,
   reg_dbg_pkt_num_nonzero_threshold,
   reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold
   );
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			reg_app_ecc_addr_protect_en;// To u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper of as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.v, ...
input			reg_app_ecc_bypass;	// To u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper of as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.v, ...
input			reg_app_ecc_fault_detc_en;// To u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper of as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.v, ...
input			reg_app_pkt_crc_gen_dis;// To u_as6d_app_fifo_rd_ctrl of as6d_app_fifo_rd_ctrl.v
input [5:0]		reg_resv_pkt_match_lp_dt;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_resv_pkt_match_lp_dt_en;// To u_monitor_idi_packet of monitor_idi_packet.v
input			reg_sram_lcrc_err_oen;	// To u_as6d_app_fifo_rd_ctrl of as6d_app_fifo_rd_ctrl.v
input			reg_video_fifo_empty_depend_cnt_mux;// To u_as6d_app_fifo_rd_ctrl of as6d_app_fifo_rd_ctrl.v
// End of automatics
input                                                clk_1M;
input                                                fifo_wrclk;
input                                                fifo_wrclk_rst_n;
input                                                fifo_rdclk;
input                                                fifo_rdclk_rst_n;
input  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]     in_csi_data;
input  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]in_bytes_en;
input                                                in_header_en;
input                                                in_data_en;
input  [5:0]                                         in_data_type;
input  [1:0]                                         in_virtual_channel;
input  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]           in_virtual_channel_x;
input  [15:0]                                        in_word_count;            
input  [3:0]                                         in_aggr_id;            
input  [31:0]                                        in_pkt_crc;            
input                                                in_pkt_crc_en;            
input                                                up_state;
input                                                line_delay_en;
input                                                video_loss_en;
input  [16:0]                                        time_window;
input  [8:0]                                         reg_dft_tpram_config;
input  [9:0]                                         reg_dft_sync_tpram_config;
input                                                app_aggregation_bypass;
input                                                reg_video_pipe_en;
input			                                     reg_last_byte_header_down_mux;
input                                                reg_clear_resv_pkt_cnt_lp_pf;
input                                                reg_clear_resv_pkt_cnt_lp_ph;
input                                                reg_clear_resv_pkt_cnt_sp_le;
input                                                reg_clear_resv_pkt_cnt_sp_ls;
input                                                reg_clear_resv_pkt_cnt_sp_fe;
input                                                reg_clear_resv_pkt_cnt_sp_fs;
input                                                reg_clear_app_full_cnt_async_fifo;
input                                                reg_clear_app_full_cnt_sync_fifo;
input                                                reg_app_wr_idi_data_continue;
input  [15:0]                                        reg_dbg_pkt_num_nonzero_threshold;
input  [15:0]                                        reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold;
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			ack_pre;		// From u_as6d_app_fifo_rd_ctrl of as6d_app_fifo_rd_ctrl.v
output			video_data_afifo_ecc_fault;// From u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper of as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.v
output			video_data_fwft_fifo_ecc_fault;// From u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper of as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.v
// End of automatics
output                                                video_data_afifo_single_err;
output                                                video_data_afifo_double_err;
output                                                video_data_afifo_ovf_int;
output                                                video_data_afifo_udf_int;
output                                                video_data_afifo_prog_full;
output                                                video_data_afifo_empty;
output                                                video_data_afifo_full;
output                                                video_data_afifo_prog_empty;
output                                                video_data_fwft_fifo_single_err;
output                                                video_data_fwft_fifo_double_err;
output                                                video_data_fwft_fifo_ovf_int;
output                                                video_data_fwft_fifo_udf_int;
output                                                video_data_fwft_fifo_prog_full;
output                                                video_data_fwft_fifo_empty;
output                                                video_data_fwft_fifo_full;
output                                                video_data_vld;
output [(VIDEO_DATA_SIZE-1):0]                        video_data;
output                                                ack;
output                                                line_end;
output                                                video_loss;
output                                                video_lock;
output [2:0]                                          fifo_rd_ctrl_cs;
output                                                fs_detect_pipe;
output [15:0]                                         fs_cnt_pipe;
output                                                empty_vld_aggregator0;
output                                                empty_vld_aggregator1;
output                                                empty_vld_aggregator2;
output                                                empty_vld_aggregator3;
output                                                ack_vld_aggregator0;
output                                                ack_vld_aggregator1;
output                                                ack_vld_aggregator2;
output                                                ack_vld_aggregator3;
output                                                line_end_vld_aggregator0;
output                                                line_end_vld_aggregator1;
output                                                line_end_vld_aggregator2;
output                                                line_end_vld_aggregator3;
output [139:0]                                        video_pipe_data_aggre_bypass;
output                                                video_pipe_vld_aggre_bypass;
//signal definition

output [31:0]                                         reg_rd_resv_pkt_cnt_lp_pf;
output [31:0]                                         reg_rd_resv_pkt_cnt_lp_ph;
output [31:0]                                         reg_rd_resv_pkt_cnt_sp_le;
output [31:0]                                         reg_rd_resv_pkt_cnt_sp_ls;
output [31:0]                                         reg_rd_resv_pkt_cnt_sp_fe;
output [31:0]                                         reg_rd_resv_pkt_cnt_sp_fs;
output [31:0]                                         reg_rd_app_full_cnt_sync_fifo;
output [31:0]                                         reg_rd_app_full_cnt_async_fifo;
output [31:0]                                         reg_rd_dispatched_cnt_ready_for_sch;

output                                                lcrc_err;
output                                                reg_rd_dbg_pkt_num_nonzero_threshold_err;
output                                                reg_rd_dbg_pkt_num_nonzero_and_fifo_empty_threshold_err;
output [5:0]                                          video_pipe_date_type_for_concat_align;
output                                                video_pipe_date_type_for_concat_align_vld;

genvar                                              j;
wire                                                video_data_afifo_wr_en;
reg     [139:0]                                     video_data_afifo_wr_data;
wire                                                video_data_afifo_wr_en_d3;
wire    [139:0]                                     video_data_afifo_wr_data_d3;
wire                                                video_data_afifo_wr_en_lcrc_mux;
wire    [139:0]                                     video_data_afifo_wr_data_lcrc_mux;
wire                                                video_data_afifo_rd_en;
wire [139:0]                                        video_data_afifo_rd_data;
wire                                                video_data_afifo_rd_data_val;
wire                                                video_data_fwft_fifo_rd_en;
wire                                                video_data_fwft_fifo_wr_en;
wire [139:0]                                        video_data_fwft_fifo_wr_data;
wire [139:0]                                        video_data_fwft_fifo_rd_data;
wire                                                video_data_fwft_fifo_rd_data_val;
wire                                                line_delay_en;
reg  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      csi_data_d1;
reg  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] bytes_en_d1;
reg                                                 header_en_d1;
reg                                                 data_en_d1;
reg  [5:0]                                          data_type_d1;
reg  [1:0]                                          virtual_channel_d1;
reg  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]            virtual_channel_x_d1;
reg  [15:0]                                         word_count_d1;
reg  [3:0]                                          aggr_id_d1;
reg                                                 pkt_crc_en_d1; 
reg  [31:0]                                         pkt_crc_d1; 
reg                                                 pkt_crc_en_d2; 
reg  [31:0]                                         pkt_crc_d2; 
wire                                                header_up;
wire                                                header_dn;
reg                                                 header_up_d1;
reg                                                 data_cnt;
reg  [63:0]                                         data_lock;
wire                                                wr_header;
wire                                                wr_footer;
reg                                                 wr_footer_d1;
wire                                                wr_data;
wire                                                wr_short;
wire                                                wr_crc;
wire [135:0]                                        video_data_storage_fifo_wdata;
wire                                                video_data_storage_fifo_rd ;
wire                                                video_data_fwft_fifo_empty_pre;
reg                                                 lock_wr_sp_ls;
//lp_pf cnt signal cal
reg                                                 pulse_lp_pf_wr_side;
wire                                                pulse_lp_pf_rd_side;
reg  [31:0]                                         cnt_lp_pf_rd_side;
//pkt cnt signal cal
reg  [15:0]                                         pulse_pkt_wr_side;
wire [15:0]                                         pulse_pkt_rd_side;
reg  [3:0]                                          pulse_pkt_cnt_wr_side;
wire [4:0]                                          sum_pulse_pkt_rd_side;
reg  [31:0]                                         cnt_pkt_rd_side;
//cnt
wire                                                video_data_fwft_fifo_empty ;
wire                                                video_loss;
wire [127:0]                                        data_all_swap;
wire [127:0]                                        data_half_swap;
wire [127:0]                                        data_lock_half_swap;
wire                                                sp_fs;
wire                                                sp_fe;
wire                                                sp_ls;
wire                                                sp_le;
wire                                                lp_ph;
wire                                                lp_pf;
wire                                                lp_crc;
wire                                                line_end_pre;
reg                                                 line_end;
wire [2:0]                                          fifo_rd_ctrl_cs;
wire                                                fs_detect_pipe;
reg  [15:0]                                         fs_cnt_pipe;
wire                                                empty_vld_aggregator0;
wire                                                empty_vld_aggregator1;
wire                                                empty_vld_aggregator2;
wire                                                empty_vld_aggregator3;
wire                                                video_data_fwft_fifo_rd_en_aggre_bypass_mux;
wire [139:0]                                        video_pipe_data_aggre_bypass;
wire                                                video_pipe_vld_aggre_bypass;
wire                                                fifo_wrclk_rst;
wire                                                fifo_rdclk_rst;
wire [31:0]                                         pulse_cnt_block[5:0];
wire [5:0]                                          pkt_pulse;
wire [5:0]                                          pulse_cnt_clear;
wire                                                video_data_afifo_full_up;
wire                                                video_data_fwft_fifo_full_up;
wire [31:0]                                         fifo_empty_depend_cnt;
reg  [2:0]                                          bytes_lock;
reg  [3:0]                                          aggr_id_lock;
reg  [3:0]                                          pkt_aggr_id;
reg                                                 pkt_aggr_id_vld;
wire [3:0]		                                    ack_vld_aggregator;
wire                                                lcrc_err;
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      csi_data;
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] bytes_en;
wire                                                header_en;
wire                                                data_en;
wire [5:0]                                          data_type;
wire [1:0]                                          virtual_channel;
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]            virtual_channel_x;
wire [15:0]                                         word_count;            
wire [3:0]                                          aggr_id;            
wire                                                pkt_crc_en; 
wire [31:0]                                         pkt_crc; 
wire                                                rd_short;
wire                                                rd_header;
wire                                                dbg_pkt_num_nonzero;
reg  [15:0]                                         dbg_pkt_num_nonzero_cnt;
wire                                                dbg_pkt_num_nonzero_and_fifo_empty;
reg  [15:0]                                         dbg_pkt_num_nonzero_and_fifo_empty_cnt;



assign csi_data          = reg_video_pipe_en ? in_csi_data          : 64'd0 ;
assign bytes_en          = reg_video_pipe_en ? in_bytes_en          :  3'd0 ;
assign header_en         = reg_video_pipe_en ? in_header_en         :  1'd0 ;
assign data_en           = reg_video_pipe_en ? in_data_en           :  1'd0 ;
assign data_type         = reg_video_pipe_en ? in_data_type         :  6'd0 ;
assign virtual_channel   = reg_video_pipe_en ? in_virtual_channel   :  2'd0 ;
assign virtual_channel_x = reg_video_pipe_en ? in_virtual_channel_x :  2'd0 ;
assign word_count        = reg_video_pipe_en ? in_word_count        : 16'd0 ;
assign aggr_id           = reg_video_pipe_en ? in_aggr_id           :  4'hf ;
assign pkt_crc_en        = reg_video_pipe_en ? in_pkt_crc_en        :  1'h0 ;
assign pkt_crc           = reg_video_pipe_en ? in_pkt_crc           : 32'h0 ;

/*  as6d_app_video_loss_detect_time_window  AUTO_TEMPLATE (
    .clk_data       (fifo_wrclk),
    .clk_data_rst_n (fifo_wrclk_rst_n),
    .idi_header_en    (header_en_d1),
    .idi_data_en    (data_en_d1),
)*/
as6d_app_video_loss_detect_time_window u0_as6d_app_video_loss_detect_time_window(
                                        /*AUTOINST*/
										 // Outputs
										 .video_loss		(video_loss),
										 .video_lock		(video_lock),
										 // Inputs
										 .clk_1M		(clk_1M),
										 .clk_data		(fifo_wrclk),	 // Templated
										 .clk_data_rst_n	(fifo_wrclk_rst_n), // Templated
										 .idi_header_en		(header_en_d1),	 // Templated
										 .idi_data_en		(data_en_d1),	 // Templated
										 .time_window		(time_window[16:0]),
										 .video_loss_en		(video_loss_en));

always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)begin
        csi_data_d1                <=  `MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE'd0        ;
        bytes_en_d1                <=  `MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH'd0   ;
        header_en_d1               <=  1'd0                                        ;
        data_en_d1                 <=  1'd0                                        ;
        data_type_d1               <=  6'd0                                        ;
        virtual_channel_d1         <=  2'd0                                        ;
        virtual_channel_x_d1       <=  `MEP_CSI2_DEVICE_VCX_DWIDTH'd0              ;
        word_count_d1              <=  16'd0                                       ;
        aggr_id_d1                 <=  4'hf                                        ;
        pkt_crc_en_d1              <=  1'd0                                        ;
        pkt_crc_d1                 <=  32'd0                                       ;
        pkt_crc_en_d2              <=  1'd0                                        ;
        pkt_crc_d2                 <=  32'd0                                       ;
    end
    else if(reg_video_pipe_en)begin
        csi_data_d1                <=  csi_data                                    ;
        bytes_en_d1                <=  bytes_en                                    ;
        header_en_d1               <=  header_en                                   ;
        data_en_d1                 <=  data_en                                     ;
        data_type_d1               <=  data_type                                   ;
        virtual_channel_d1         <=  virtual_channel                             ;
        virtual_channel_x_d1       <=  virtual_channel_x                           ;
        word_count_d1              <=  word_count                                  ;
        aggr_id_d1                 <=  aggr_id                                     ;
        pkt_crc_en_d1              <= pkt_crc_en                                   ;
        pkt_crc_d1                 <= pkt_crc                                      ;
        pkt_crc_en_d2              <= pkt_crc_en_d1                                ;
        pkt_crc_d2                 <= pkt_crc_d1                                   ;
    end
end

assign header_up = header_en & (~header_en_d1);
assign header_dn = ~header_en & header_en_d1;

always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        header_up_d1 <= 1'd0;
    else
        header_up_d1 <= header_up;
end

//1 pipe wr_data need 2 pipe data_en
always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        data_cnt <= 1'd0;
    else if(header_up_d1)
        data_cnt <= 1'd0;
    else if(data_en_d1&&header_en_d1)
        data_cnt <= ~data_cnt;
end

always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        data_lock <= 64'd0;
    else if(~data_cnt&&data_en_d1&&header_en_d1)
        data_lock <= csi_data_d1;
end

always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        bytes_lock <= 3'd0;
    else if(~data_cnt&&data_en_d1&&header_en_d1)
        bytes_lock <= bytes_en_d1;
end

always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        aggr_id_lock <= 4'hf;
    else if(wr_footer)
        aggr_id_lock <= aggr_id_d1;
end

assign    fs_detect_pipe = (wr_short&sp_fs) ? 1'd1 : 1'd0 ;

always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        fs_cnt_pipe <= 16'd0;
    else if(fs_detect_pipe)
        fs_cnt_pipe <= fs_cnt_pipe + 1'd1;
end

assign    wr_data      = ((data_cnt|wr_footer)&data_en_d1&header_en_d1);
assign    wr_short     = (~header_up)&(header_dn)&(header_up_d1);
assign    wr_footer    = (~header_up)&(header_dn)&(~header_up_d1);
assign    wr_header    = (~header_up)&(~header_dn)&(header_up_d1);
assign    wr_crc       = pkt_crc_en_d2;

//mipi device support YUV420 LEGA dt=6'h1a,YUV422 dt=6'h1e type, MSB is early
//mipi device support default type, LSB is early
assign    data_all_swap         = ((data_type_d1 == `CSI_YUV420_8_BIT_LEGACY)||(data_type_d1 == `CSI_YUV422_8_BIT))?{data_lock,csi_data_d1} : {csi_data_d1,data_lock};
assign    data_half_swap        = ((data_type_d1 == `CSI_YUV420_8_BIT_LEGACY)||(data_type_d1 == `CSI_YUV422_8_BIT))?{csi_data_d1,64'd0}     : {64'd0,csi_data_d1};
assign    data_lock_half_swap   = ((data_type_d1 == `CSI_YUV420_8_BIT_LEGACY)||(data_type_d1 == `CSI_YUV422_8_BIT))?{data_lock,64'd0}       : {64'd0,data_lock};

always@(*)begin
    if(wr_crc)
        video_data_afifo_wr_data = {aggr_id_lock,104'd0,pkt_crc_d2[31:0]};
    /********************************/
    /*     pkt header wr moment     */
    /*              ____            */
    /*  header_en _|h   |_          */
    /*               ___            */
    /*    data_en __|   |_          */
    /*              ^               */
    /********************************/
    else if(wr_short|wr_header)
        video_data_afifo_wr_data = {aggr_id_d1,wr_data,wr_short,wr_footer,wr_header,105'd0,word_count_d1,data_type_d1,1'd0,virtual_channel_x_d1,virtual_channel_d1};
    /********************************/
    /*      last data wr moment     */
    /*              ______          */
    /*  header_en _| 01234|_        */
    /*               _____          */
    /*    data_en __|     |_        */
    /*                    ^         */
    /********************************/
    else if(~data_cnt&wr_footer &data_en_d1&header_en_d1)
        video_data_afifo_wr_data = {aggr_id_d1,wr_data,wr_short,wr_footer,wr_header,1'b0,bytes_en_d1[2:0],data_half_swap};
    /********************************/
    /*      last data wr moment     */
    /*              _______         */
    /*  header_en _|       |_       */
    /*               _____          */
    /*    data_en __|01234|_        */
    /*                     ^        */
    /********************************/
    else if( data_cnt&wr_footer&~data_en_d1&header_en_d1)
        video_data_afifo_wr_data = reg_last_byte_header_down_mux ? {aggr_id_d1,1'd1   ,wr_short,wr_footer,wr_header,1'b0,bytes_lock[2:0] ,data_lock_half_swap}:
                                                                   {aggr_id_d1,1'd1   ,wr_short,wr_footer,wr_header,1'b0,bytes_en_d1[2:0],data_half_swap};
    else
        video_data_afifo_wr_data = {aggr_id_d1,wr_data,wr_short,wr_footer,wr_header,1'b1,bytes_en_d1[2:0],data_all_swap};
end

//assign video_data_afifo_wr_en       =    (wr_data|wr_short|wr_footer|wr_header);
assign video_data_afifo_wr_en       =    (wr_data|wr_short|wr_footer|wr_header|wr_crc);

assign video_data_afifo_rd_en       = ~video_data_afifo_empty;
assign video_data_fwft_fifo_wr_en   = video_data_afifo_rd_data_val;
assign video_data_fwft_fifo_wr_data = video_data_afifo_rd_data;

always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)begin
        wr_footer_d1 <= 1'd0;
    end
    else begin
        wr_footer_d1 <= wr_footer;
    end
end

/*  as6d_app_lcrc_check  AUTO_TEMPLATE (
    .clk			(fifo_wrclk),
    .rst_n		(fifo_wrclk_rst_n),
    .in_data_vld    (video_data_afifo_wr_en),
    .in_data    (video_data_afifo_wr_data[]),
    .in_crc_vld		(wr_footer_d1),
    .in_crc		(32'd0),
    .out_data_vld		(video_data_afifo_wr_en_d3),
    .out_data		(video_data_afifo_wr_data_d3[]),
	 .out_crc_err		(),
)*/
//as6d_app_lcrc_check u_as6d_app_lcrc_check(
//					  .out_data_vld		(video_data_afifo_wr_en_d3),
//					  .out_data		(video_data_afifo_wr_data_d3[139:0]),
//                        /*AUTOINST*/
//					  // Outputs
//					  .out_crc_err		(),
//					  // Inputs
//					  .clk			(fifo_wrclk),
//					  .rst_n		(fifo_wrclk_rst_n),
//					  .in_data_vld		(video_data_afifo_wr_en),
//					  .in_data		(video_data_afifo_wr_data[139:0]),
//					  .in_crc_vld		(wr_footer_d1),
//					  .in_crc		(32'd0));

//assign  video_data_afifo_wr_en_lcrc_mux     = reg_sram_lcrc_chk_dis ? video_data_afifo_wr_en   : video_data_afifo_wr_en_d3   ;
//assign  video_data_afifo_wr_data_lcrc_mux   = reg_sram_lcrc_chk_dis ? video_data_afifo_wr_data : video_data_afifo_wr_data_d3 ;

//idi data wdth 64, fifo data wdth 128 + 12
 /*  as6d_app_video_pipe_1r1w_32x140_afifo_wrapper  AUTO_TEMPLATE (
    .FLIPFLOP    (0),
    .ADDR_WIDTH    (5),
    .DATA_WIDTH    (140),
    .PROG_EMPTY_ASSERT(6'd2),
    .PROG_EMPTY_NEGATE(6'd4),
    .FIFO_DEEP    (32),
    .RAM_PIPE_STAGE    (2),
    .data_count    (),
    .prog_full_assert_cfg(6'd30),
    .prog_full_negate_cfg(6'd28),
    .wr_en        (video_data_afifo_wr_en),
    .wr_data    (video_data_afifo_wr_data[140-1:0]),
    .rd_en        (video_data_afifo_rd_en),
    .rd_data_val(video_data_afifo_rd_data_val),
    .rd_data    (video_data_afifo_rd_data[140-1:0]),
    .empty        (video_data_afifo_empty),
    .reg_dft_tpram_config(reg_dft_tpram_config[]),
    .wr_clk(fifo_wrclk),
    .wr_rst_n(fifo_wrclk_rst_n),
    .rd_clk(fifo_rdclk),
    .rd_rst_n(fifo_rdclk_rst_n),
    .ram_bypass    (1'd0), 
	.ecc_addr_protect_en(reg_app_ecc_addr_protect_en), 
	.ecc_fault_detc_en(reg_app_ecc_fault_detc_en), 
	.ecc_bypass(reg_app_ecc_bypass), 
    .\(.*\)        (video_data_afifo_\1),
)*/
as6d_app_video_pipe_1r1w_32x140_afifo_wrapper #(/*AUTOINSTPARAM*/
						// Parameters
						.FLIPFLOP	(0),		 // Templated
						.ADDR_WIDTH	(5),		 // Templated
						.DATA_WIDTH	(140),		 // Templated
						.PROG_EMPTY_ASSERT(6'd2),	 // Templated
						.PROG_EMPTY_NEGATE(6'd4),	 // Templated
						.FIFO_DEEP	(32),		 // Templated
						.RAM_PIPE_STAGE	(2))		 // Templated
u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper(
                        .rd_data    (video_data_afifo_rd_data[140-1:0]),
                        .rd_data_val    (video_data_afifo_rd_data_val),
                        /*AUTOINST*/
						// Outputs
						.prog_full	(video_data_afifo_prog_full), // Templated
						.full		(video_data_afifo_full), // Templated
						.prog_empty	(video_data_afifo_prog_empty), // Templated
						.empty		(video_data_afifo_empty), // Templated
						.ecc_fault	(video_data_afifo_ecc_fault), // Templated
						.single_err	(video_data_afifo_single_err), // Templated
						.double_err	(video_data_afifo_double_err), // Templated
						.ovf_int	(video_data_afifo_ovf_int), // Templated
						.udf_int	(video_data_afifo_udf_int), // Templated
						.data_count	(),		 // Templated
						// Inputs
						.reg_dft_tpram_config(reg_dft_tpram_config[8:0]), // Templated
						.wr_rst_n	(fifo_wrclk_rst_n), // Templated
						.wr_clk		(fifo_wrclk),	 // Templated
						.wr_en		(video_data_afifo_wr_en), // Templated
						.wr_data	(video_data_afifo_wr_data[140-1:0]), // Templated
						.prog_full_assert_cfg(6'd30),	 // Templated
						.prog_full_negate_cfg(6'd28),	 // Templated
						.ecc_addr_protect_en(reg_app_ecc_addr_protect_en), // Templated
						.ecc_fault_detc_en(reg_app_ecc_fault_detc_en), // Templated
						.ecc_bypass	(reg_app_ecc_bypass), // Templated
						.ram_bypass	(1'd0),		 // Templated
						.rd_rst_n	(fifo_rdclk_rst_n), // Templated
						.rd_clk		(fifo_rdclk),	 // Templated
						.rd_en		(video_data_afifo_rd_en)); // Templated

 /*  as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper  AUTO_TEMPLATE (
    .FLIPFLOP    (0),
    .ADDR_WIDTH    (11),
    .DATA_WIDTH    (140),
    .PROG_EMPTY_ASSERT(12'd10),
    .PROG_EMPTY_NEGATE(12'd16),
    .FIFO_DEEP    (2048),
    .RAM_PIPE_STAGE    (2),
    .prog_full_assert_cfg(12'd2040),
    .prog_full_negate_cfg(12'd2030),
    .wr_data    (video_data_fwft_fifo_wr_data[140-1:0]),
    .rd_data    (video_data_fwft_fifo_rd_data[140-1:0]),
    .empty        (video_data_fwft_fifo_empty_pre),
    .rd_en        (video_data_fwft_fifo_rd_en_aggre_bypass_mux),
    .reg_dft_sync_tpram_config(reg_dft_sync_tpram_config[]),
    .clk(fifo_rdclk),
    .rst_n(fifo_rdclk_rst_n),
    .ram_bypass    (1'd0), 
	.ecc_addr_protect_en(reg_app_ecc_addr_protect_en), 
	.ecc_fault_detc_en(reg_app_ecc_fault_detc_en), 
	.ecc_bypass(reg_app_ecc_bypass), 
    .\(.*\)        (video_data_fwft_fifo_\1),
)*/
as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper #(/*AUTOINSTPARAM*/
						      // Parameters
						      .FLIPFLOP		(0),		 // Templated
						      .ADDR_WIDTH	(11),		 // Templated
						      .DATA_WIDTH	(140),		 // Templated
						      .PROG_EMPTY_ASSERT(12'd10),	 // Templated
						      .PROG_EMPTY_NEGATE(12'd16),	 // Templated
						      .FIFO_DEEP	(2048),		 // Templated
						      .RAM_PIPE_STAGE	(2))		 // Templated
u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper(
                              .rd_data        (video_data_fwft_fifo_rd_data[140-1:0]),
                              .rd_data_val    (video_data_fwft_fifo_rd_data_val),
                            /*AUTOINST*/
						      // Outputs
						      .ecc_fault	(video_data_fwft_fifo_ecc_fault), // Templated
						      .single_err	(video_data_fwft_fifo_single_err), // Templated
						      .double_err	(video_data_fwft_fifo_double_err), // Templated
						      .ovf_int		(video_data_fwft_fifo_ovf_int), // Templated
						      .udf_int		(video_data_fwft_fifo_udf_int), // Templated
						      .prog_full	(video_data_fwft_fifo_prog_full), // Templated
						      .empty		(video_data_fwft_fifo_empty_pre), // Templated
						      .full		(video_data_fwft_fifo_full), // Templated
						      // Inputs
						      .clk		(fifo_rdclk),	 // Templated
						      .rst_n		(fifo_rdclk_rst_n), // Templated
						      .ram_bypass	(1'd0),		 // Templated
						      .reg_dft_sync_tpram_config(reg_dft_sync_tpram_config[9:0]), // Templated
						      .prog_full_assert_cfg(12'd2040),	 // Templated
						      .prog_full_negate_cfg(12'd2030),	 // Templated
						      .ecc_addr_protect_en(reg_app_ecc_addr_protect_en), // Templated
						      .ecc_fault_detc_en(reg_app_ecc_fault_detc_en), // Templated
						      .ecc_bypass	(reg_app_ecc_bypass), // Templated
						      .wr_data		(video_data_fwft_fifo_wr_data[140-1:0]), // Templated
						      .wr_en		(video_data_fwft_fifo_wr_en), // Templated
						      .rd_en		(video_data_fwft_fifo_rd_en_aggre_bypass_mux)); // Templated

 /*  as6d_app_fifo_rd_ctrl  AUTO_TEMPLATE (
    .video_data_fifo_empty(video_data_fwft_fifo_empty_pre),
    .video_data_fifo_rdata(video_data_fwft_fifo_rd_data[]),
    .video_data_fifo_rd(video_data_fwft_fifo_rd_en),
    .current_state(fifo_rd_ctrl_cs[]),
    .line_end(line_end_pre), 
    .sram_lcrc_err(lcrc_err), 
    .\(.*\)(\1[]),
)*/
as6d_app_fifo_rd_ctrl    u_as6d_app_fifo_rd_ctrl(
						 .ack_vld_aggregator	(ack_vld_aggregator[3:0]),
                         .line_end              (line_end_pre),
						 .video_data_fifo_rd	(video_data_fwft_fifo_rd_en),
                        /*AUTOINST*/
						 // Outputs
						 .ack			(ack),		 // Templated
						 .video_data		(video_data[(VIDEO_DATA_SIZE-1):0]), // Templated
						 .video_data_vld	(video_data_vld), // Templated
						 .current_state		(fifo_rd_ctrl_cs[2:0]), // Templated
						 .ack_pre		(ack_pre),	 // Templated
						 .sram_lcrc_err		(lcrc_err),	 // Templated
						 // Inputs
						 .fifo_rdclk		(fifo_rdclk),	 // Templated
						 .fifo_rdclk_rst_n	(fifo_rdclk_rst_n), // Templated
						 .up_state		(up_state),	 // Templated
						 .video_data_fifo_empty	(video_data_fwft_fifo_empty_pre), // Templated
						 .video_data_fifo_rdata	(video_data_fwft_fifo_rd_data[(VIDEO_DATA_SIZE-1):0]), // Templated
						 .reg_video_fifo_empty_depend_cnt_mux(reg_video_fifo_empty_depend_cnt_mux), // Templated
						 .pkt_aggr_id		(pkt_aggr_id[3:0]), // Templated
						 .pkt_aggr_id_vld	(pkt_aggr_id_vld), // Templated
						 .reg_app_pkt_crc_gen_dis(reg_app_pkt_crc_gen_dis), // Templated
						 .reg_sram_lcrc_err_oen	(reg_sram_lcrc_err_oen)); // Templated

assign    sp_fs = data_type_d1 == `CSI_FRAME_START;
assign    sp_fe = data_type_d1 == `CSI_FRAME_END;
assign    sp_ls = data_type_d1 == `CSI_LINE_START;
assign    sp_le = data_type_d1 == `CSI_LINE_END;
assign    lp_ph = wr_header;
assign    lp_pf = wr_footer;
assign    lp_crc= wr_crc;

assign fifo_wrclk_rst = ~fifo_wrclk_rst_n;
assign fifo_rdclk_rst = ~fifo_rdclk_rst_n;
//***********************************lp_pf cnt rd clk**************************************//
always@(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        pulse_lp_pf_wr_side <= 1'd0;
    else if(lp_pf)
        pulse_lp_pf_wr_side <= 1'd1;
    else 
        pulse_lp_pf_wr_side <= 1'd0;
end

pulse_sync_hs pulse_sync_hs_lp_pf(
    .SRC_CK     (fifo_wrclk), 
    .SRC_RST    (fifo_wrclk_rst),
    .DST_CK     (fifo_rdclk), 
    .DST_RST    (fifo_rdclk_rst),
    .SRC_PULSE  (pulse_lp_pf_wr_side), 
    .DST_PULSE  (pulse_lp_pf_rd_side));

always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        cnt_lp_pf_rd_side <= 32'd0;
    else 
        cnt_lp_pf_rd_side <= cnt_lp_pf_rd_side + pulse_lp_pf_rd_side - line_end_pre;
end

//***********************************pkt cnt rd clk**************************************//
wire    pulse_pkt_wr_side_pre;
assign  pulse_pkt_wr_side_pre = reg_app_pkt_crc_gen_dis ? video_data_afifo_wr_en&(wr_short|wr_footer) :
                                                          video_data_afifo_wr_en&(wr_short|wr_crc);

always@(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
    if(~fifo_wrclk_rst_n)
        pulse_pkt_cnt_wr_side <= 4'd0;
    else if( reg_app_wr_idi_data_continue & pulse_pkt_wr_side_pre)
        pulse_pkt_cnt_wr_side <= (pulse_pkt_cnt_wr_side == 4'hf) ? 4'd0 : pulse_pkt_cnt_wr_side + 1'd1;
    else if(~reg_app_wr_idi_data_continue & (|pulse_pkt_wr_side))
        pulse_pkt_cnt_wr_side <= (pulse_pkt_cnt_wr_side == 4'hf) ? 4'd0 : pulse_pkt_cnt_wr_side + 1'd1;
end
//location
generate for(j=0;j<=15;j=j+1)begin:pulse_pkt_bk
    always@(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
        if(~fifo_wrclk_rst_n)
            pulse_pkt_wr_side[j] <= 1'd0;
        else if(reg_app_pkt_crc_gen_dis & video_data_afifo_wr_en&(sp_fs|sp_fe|sp_ls|sp_le|lp_pf)&(pulse_pkt_cnt_wr_side==j))
            pulse_pkt_wr_side[j] <= 1'd1;
        else if(~reg_app_pkt_crc_gen_dis & video_data_afifo_wr_en&(sp_fs|sp_fe|sp_ls|sp_le|lp_crc)&(pulse_pkt_cnt_wr_side==j))
            pulse_pkt_wr_side[j] <= 1'd1;
        else
            pulse_pkt_wr_side[j] <= 1'd0;
    end

    pulse_sync_hs u_pulse_sync_hs_pkt(
        .SRC_CK     (fifo_wrclk), 
        .SRC_RST    (fifo_wrclk_rst),
        .DST_CK     (fifo_rdclk), 
        .DST_RST    (fifo_rdclk_rst),
        .SRC_PULSE  (pulse_pkt_wr_side[j]), 
        .DST_PULSE  (pulse_pkt_rd_side[j]));
    
end
endgenerate

assign sum_pulse_pkt_rd_side = pulse_pkt_rd_side[3] + pulse_pkt_rd_side[2] + pulse_pkt_rd_side[1] + pulse_pkt_rd_side[0] +
                               pulse_pkt_rd_side[7] + pulse_pkt_rd_side[6] + pulse_pkt_rd_side[5] + pulse_pkt_rd_side[4] +
                               pulse_pkt_rd_side[11] + pulse_pkt_rd_side[10] + pulse_pkt_rd_side[9] + pulse_pkt_rd_side[8] +
                               pulse_pkt_rd_side[15] + pulse_pkt_rd_side[14] + pulse_pkt_rd_side[13] + pulse_pkt_rd_side[12];

//***cnt_line in rd_clk for pulse_sync 
always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        cnt_pkt_rd_side <= 32'd0;
    else 
        cnt_pkt_rd_side <= cnt_pkt_rd_side + sum_pulse_pkt_rd_side - line_end_pre;
end

//***obtain fifo_empty based on cnt_lp_pf_rd_side***//
//assign video_data_fwft_fifo_empty = ~((~video_data_fwft_fifo_empty_pre) & ((cnt_lp_pf_rd_side > 32'd0) | (~line_delay_en))) ;

//***obtain fifo_empty based on cnt_pkt_rd_side***//
//assign video_data_fwft_fifo_empty = ~((~video_data_fwft_fifo_empty_pre) & ((cnt_pkt_rd_side > 32'd0) | (~line_delay_en))) ;

assign fifo_empty_depend_cnt = reg_video_fifo_empty_depend_cnt_mux ? cnt_pkt_rd_side : cnt_lp_pf_rd_side;
assign video_data_fwft_fifo_empty = ~((fifo_rd_ctrl_cs==3'd0) & (~video_data_fwft_fifo_empty_pre) & ((fifo_empty_depend_cnt > 32'd0) | (~line_delay_en))) ;

//***line_end_pre                   sync with last data pipe
//***line_end                       sync with last data pipe next
always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        line_end <= 1'd0;
    else
        line_end <= line_end_pre;
end

assign    empty_vld_aggregator0    = (video_data_fwft_fifo_rd_data[139:136]==4'd0) & ~video_data_fwft_fifo_empty & (fifo_rd_ctrl_cs==3'd0);
assign    empty_vld_aggregator1    = (video_data_fwft_fifo_rd_data[139:136]==4'd1) & ~video_data_fwft_fifo_empty & (fifo_rd_ctrl_cs==3'd0);
assign    empty_vld_aggregator2    = (video_data_fwft_fifo_rd_data[139:136]==4'd2) & ~video_data_fwft_fifo_empty & (fifo_rd_ctrl_cs==3'd0);
assign    empty_vld_aggregator3    = (video_data_fwft_fifo_rd_data[139:136]==4'd3) & ~video_data_fwft_fifo_empty & (fifo_rd_ctrl_cs==3'd0);

assign    ack_vld_aggregator0      = ack_vld_aggregator[0] ;
assign    ack_vld_aggregator1      = ack_vld_aggregator[1] ;
assign    ack_vld_aggregator2      = ack_vld_aggregator[2] ;
assign    ack_vld_aggregator3      = ack_vld_aggregator[3] ;

assign    line_end_vld_aggregator0 = line_end && (pkt_aggr_id == 4'd0);
assign    line_end_vld_aggregator1 = line_end && (pkt_aggr_id == 4'd1);
assign    line_end_vld_aggregator2 = line_end && (pkt_aggr_id == 4'd2);
assign    line_end_vld_aggregator3 = line_end && (pkt_aggr_id == 4'd3);

always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        pkt_aggr_id <= 4'd0;
    else if(~video_data_fwft_fifo_empty&(fifo_rd_ctrl_cs==3'd0))
        pkt_aggr_id <= video_data_fwft_fifo_rd_data[139:136];
end

always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        pkt_aggr_id_vld <= 1'd0;
    else if(~video_data_fwft_fifo_empty&(fifo_rd_ctrl_cs==3'd0))
        pkt_aggr_id_vld <= 1'd1;
    else if(line_end_pre)
        pkt_aggr_id_vld <= 1'd0;
end

//***aggre_bypass
assign  video_data_fwft_fifo_rd_en_aggre_bypass_mux  = app_aggregation_bypass ? 1'd1 : video_data_fwft_fifo_rd_en;
assign  video_pipe_data_aggre_bypass    = app_aggregation_bypass ? video_data_fwft_fifo_rd_data     : 140'd0     ;
assign  video_pipe_vld_aggre_bypass     = app_aggregation_bypass ? ~video_data_fwft_fifo_empty_pre  : 1'd0       ;

//***data type align for concat line interleaved
assign  rd_short  = video_data_fwft_fifo_rd_data_val & video_data_fwft_fifo_rd_data[134];
assign  rd_header = video_data_fwft_fifo_rd_data_val & video_data_fwft_fifo_rd_data[132];

assign  video_pipe_date_type_for_concat_align = video_data_fwft_fifo_rd_data[10:5];
assign  video_pipe_date_type_for_concat_align_vld = rd_short|rd_header;

//******************pkt dt pulse in rd_clk from video_pipe to 4 sync aggr********************//
assign  dbg_pkt_num_nonzero = (|cnt_pkt_rd_side);

always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        dbg_pkt_num_nonzero_cnt <= 16'd0;
    else if(dbg_pkt_num_nonzero)
        dbg_pkt_num_nonzero_cnt <= (reg_dbg_pkt_num_nonzero_threshold <= dbg_pkt_num_nonzero_cnt) ? 16'd0 : 
                                    dbg_pkt_num_nonzero_cnt + 1'd1;
    else
        dbg_pkt_num_nonzero_cnt <= 16'd0;
end

assign reg_rd_dbg_pkt_num_nonzero_threshold_err = (reg_dbg_pkt_num_nonzero_threshold == dbg_pkt_num_nonzero_cnt);


assign          dbg_pkt_num_nonzero_and_fifo_empty = dbg_pkt_num_nonzero&video_data_fwft_fifo_empty_pre;

always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        dbg_pkt_num_nonzero_and_fifo_empty_cnt <= 16'd0;
    else if(dbg_pkt_num_nonzero_and_fifo_empty)
        dbg_pkt_num_nonzero_and_fifo_empty_cnt <= (reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold <= dbg_pkt_num_nonzero_and_fifo_empty_cnt) ? 16'd0 : 
                                                   dbg_pkt_num_nonzero_and_fifo_empty_cnt + 1'd1;
    else
        dbg_pkt_num_nonzero_and_fifo_empty_cnt <= 16'd0;
end

assign reg_rd_dbg_pkt_num_nonzero_and_fifo_empty_threshold_err = (reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold == dbg_pkt_num_nonzero_and_fifo_empty_cnt);

//*********************************************debug cnt*************************************//
 /*  monitor_idi_packet  AUTO_TEMPLATE (
    .clk    (fifo_wrclk),
    .rst_n  (fifo_wrclk_rst_n),
    .header_en		(header_en_d1),
    .data_type		(data_type_d1[]),
)*/
monitor_idi_packet    u_monitor_idi_packet(/*AUTOINST*/
					   // Outputs
					   .reg_rd_resv_pkt_cnt_lp_pf(reg_rd_resv_pkt_cnt_lp_pf[31:0]),
					   .reg_rd_resv_pkt_cnt_lp_ph(reg_rd_resv_pkt_cnt_lp_ph[31:0]),
					   .reg_rd_resv_pkt_cnt_sp_le(reg_rd_resv_pkt_cnt_sp_le[31:0]),
					   .reg_rd_resv_pkt_cnt_sp_ls(reg_rd_resv_pkt_cnt_sp_ls[31:0]),
					   .reg_rd_resv_pkt_cnt_sp_fe(reg_rd_resv_pkt_cnt_sp_fe[31:0]),
					   .reg_rd_resv_pkt_cnt_sp_fs(reg_rd_resv_pkt_cnt_sp_fs[31:0]),
					   // Inputs
					   .clk			(fifo_wrclk),	 // Templated
					   .rst_n		(fifo_wrclk_rst_n), // Templated
					   .header_en		(header_en_d1),	 // Templated
					   .data_type		(data_type_d1[5:0]), // Templated
					   .reg_resv_pkt_match_lp_dt(reg_resv_pkt_match_lp_dt[5:0]),
					   .reg_resv_pkt_match_lp_dt_en(reg_resv_pkt_match_lp_dt_en),
					   .reg_clear_resv_pkt_cnt_lp_pf(reg_clear_resv_pkt_cnt_lp_pf),
					   .reg_clear_resv_pkt_cnt_lp_ph(reg_clear_resv_pkt_cnt_lp_ph),
					   .reg_clear_resv_pkt_cnt_sp_le(reg_clear_resv_pkt_cnt_sp_le),
					   .reg_clear_resv_pkt_cnt_sp_ls(reg_clear_resv_pkt_cnt_sp_ls),
					   .reg_clear_resv_pkt_cnt_sp_fe(reg_clear_resv_pkt_cnt_sp_fe),
					   .reg_clear_resv_pkt_cnt_sp_fs(reg_clear_resv_pkt_cnt_sp_fs));


edge_det  edge_det_video_async_fifo(
    .clk     (fifo_wrclk),
    .reset   (fifo_wrclk_rst),
    .din     (video_data_afifo_full),
    .d_edge  (video_data_afifo_full_up));

edge_det  edge_det_video_sync_fifo(
    .clk     (fifo_rdclk),
    .reset   (fifo_rdclk_rst),
    .din     (video_data_fwft_fifo_full),
    .d_edge  (video_data_fwft_fifo_full_up));

pulse_cnt app_pulse_async_fifo(
    .cnt    (reg_rd_app_full_cnt_async_fifo),
    .clk    (fifo_wrclk),
    .rst_n  (fifo_wrclk_rst_n),
    .clear  (reg_clear_app_full_cnt_async_fifo),
    .pulse  (video_data_afifo_full_up));

pulse_cnt app_pulse_sync_fifo(
    .cnt    (reg_rd_app_full_cnt_sync_fifo),
    .clk    (fifo_rdclk),
    .rst_n  (fifo_rdclk_rst_n),
    .clear  (reg_clear_app_full_cnt_sync_fifo),
    .pulse  (video_data_fwft_fifo_full_up));


assign reg_rd_dispatched_cnt_ready_for_sch = fifo_empty_depend_cnt;

endmodule 
