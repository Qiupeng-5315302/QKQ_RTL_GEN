
module as6d_app_aggr_lane #(
	parameter	VIDEO_DATA_SIZE		= 140,
	parameter	DATA_PARITY_WIDTH	= 21,
	parameter	AGGR_ID				= 2'd0
)(/*AUTOARG*/
   // Outputs
   up_state_concat, up_state_aggre, up_state7, up_state6, up_state5,
   up_state4, up_state3, up_state2, up_state1, up_state0,
   sch_data_type_align_fail_int, reg_rd_send_pkt_cnt_sp_ls,
   reg_rd_send_pkt_cnt_sp_le, reg_rd_send_pkt_cnt_sp_fs,
   reg_rd_send_pkt_cnt_sp_fe, reg_rd_send_pkt_cnt_lp_ph,
   reg_rd_send_pkt_cnt_lp_pf, pipe3_wr_mode, pipe3_mem_clear,
   pipe2_wr_mode, pipe2_mem_clear, pipe1_wr_mode, pipe1_mem_clear,
   pipe0_wr_mode, pipe0_mem_clear, line_end_concat, line_end_aggre,
   current_state, csi2device_idi_word_count,
   csi2device_idi_virtual_channel_x, csi2device_idi_virtual_channel,
   csi2device_idi_tunnel_mode_en, csi2device_idi_header_en,
   csi2device_idi_data_type, csi2device_idi_data_parity,
   csi2device_idi_data_en, csi2device_idi_data,
   csi2device_idi_byte_en, app_aggr_idi_crc_err_int, aggre_busy,
   ack_concat, ack_aggre, sch2post_video_data_vld,
   // Inputs
   video_pipe_vld_aggre_bypass,
   video_pipe_date_type_for_concat_align_vld3,
   video_pipe_date_type_for_concat_align_vld2,
   video_pipe_date_type_for_concat_align_vld1,
   video_pipe_date_type_for_concat_align_vld0,
   video_pipe_date_type_for_concat_align3,
   video_pipe_date_type_for_concat_align2,
   video_pipe_date_type_for_concat_align1,
   video_pipe_date_type_for_concat_align0,
   video_pipe_data_aggre_bypass, video_loss3, video_loss2,
   video_loss1, video_loss0, reg_sync_aggr_video_timeout_threshold,
   reg_sync_aggr_video_status_info_wordcount,
   reg_sync_aggr_video_status_info_vc,
   reg_sync_aggr_video_status_info_linecount,
   reg_sync_aggr_video_status_info_datatype,
   reg_sync_aggr_video_mask_restart,
   reg_sync_aggr_video_mask_latch_reset,
   reg_sync_aggr_force_video_mask, reg_sync_aggr_check_linecount_en,
   reg_sync_aggr_check_framecount_en, reg_sync_aggr_auto_mask_en,
   reg_send_pkt_match_lp_dt_en, reg_send_pkt_match_lp_dt,
   reg_delete_lp_depend_on_wc_mux, reg_clear_send_pkt_cnt_sp_ls,
   reg_clear_send_pkt_cnt_sp_le, reg_clear_send_pkt_cnt_sp_fs,
   reg_clear_send_pkt_cnt_sp_fe, reg_clear_send_pkt_cnt_lp_ph,
   reg_clear_send_pkt_cnt_lp_pf, reg_app_aggr_vc_bit_override_value,
   reg_app_aggr_vc_bit_override_en, reg_app_aggr_idi_crc_chk_en,
   pipe7_aggre_en, pipe6_aggre_en, pipe5_aggre_en, pipe4_aggre_en,
   pipe3_frame_active, pipe3_concat_en, pipe3_aggre_en,
   pipe2_frame_active, pipe2_concat_en, pipe2_aggre_en,
   pipe1_frame_active, pipe1_concat_en, pipe1_aggre_en,
   pipe0_frame_active, pipe0_concat_en, pipe0_aggre_en, master_pipe,
   line_end_vld7, line_end_vld6, line_end_vld5, line_end_vld4,
   line_end_vld3, line_end_vld2, line_end_vld1, line_end_vld0,
   line_end7, line_end6, line_end5, line_end4, line_end3, line_end2,
   line_end1, line_end0, in_video_data_vld7, in_video_data_vld6,
   in_video_data_vld5, in_video_data_vld4, in_video_data_vld3,
   in_video_data_vld2, in_video_data_vld1, in_video_data_vld0,
   in_video_data7, in_video_data6, in_video_data5, in_video_data4,
   in_video_data3, in_video_data2, in_video_data1, in_video_data0,
   idi_wordcount_3, idi_wordcount_2, idi_wordcount_1, idi_wordcount_0,
   idi_linecount_3, idi_linecount_2, idi_linecount_1, idi_linecount_0,
   idi_header_en_3, idi_header_en_2, idi_header_en_1, idi_header_en_0,
   idi_datatype_3, idi_datatype_2, idi_datatype_1, idi_datatype_0,
   fse_filter, frame_sync_lock, fifo_wrclk_rst_n3, fifo_wrclk_rst_n2,
   fifo_wrclk_rst_n1, fifo_wrclk_rst_n0, fifo_wrclk3, fifo_wrclk2,
   fifo_wrclk1, fifo_wrclk0, empty_vld7, empty_vld6, empty_vld5,
   empty_vld4, empty_vld3, empty_vld2, empty_vld1, empty_vld0, empty7,
   empty6, empty5, empty4, empty3, empty2, empty1, empty0,
   csi2device_idi_halt, csi2device_idi_anti_halt, clk_1M_rst_n,
   clk_1M, app_aggregation_bypass, aggre_mode, aggre_clk_rst_n,
   aggre_clk, ack_vld7, ack_vld6, ack_vld5, ack_vld4, ack_vld3,
   ack_vld2, ack_vld1, ack_vld0, ack_pre7, ack_pre6, ack_pre5,
   ack_pre4, ack_pre3, ack_pre2, ack_pre1, ack_pre0, ack7, ack6, ack5,
   ack4, ack3, ack2, ack1, ack0
   );

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			ack0;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack1;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack2;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack3;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack4;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack5;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack6;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack7;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre4;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre5;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre6;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_pre7;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld4;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld5;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld6;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			ack_vld7;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			aggre_clk;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			aggre_clk_rst_n;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input [1:0]		aggre_mode;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			app_aggregation_bypass;	// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			clk_1M;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			clk_1M_rst_n;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			csi2device_idi_anti_halt;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			csi2device_idi_halt;	// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			empty0;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty1;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty2;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty3;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty4;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty5;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty6;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty7;			// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld4;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld5;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld6;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			empty_vld7;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk_rst_n0;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk_rst_n1;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk_rst_n2;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fifo_wrclk_rst_n3;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			frame_sync_lock;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			fse_filter;		// To u_as6d_app_data_post of as6d_app_data_post.v
input [5:0]		idi_datatype_0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [5:0]		idi_datatype_1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [5:0]		idi_datatype_2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [5:0]		idi_datatype_3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			idi_header_en_0;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			idi_header_en_1;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			idi_header_en_2;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			idi_header_en_3;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [2:0]		idi_linecount_0;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [2:0]		idi_linecount_1;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [2:0]		idi_linecount_2;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [2:0]		idi_linecount_3;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [15:0]		idi_wordcount_0;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [15:0]		idi_wordcount_1;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [15:0]		idi_wordcount_2;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [15:0]		idi_wordcount_3;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data4;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data5;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data6;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		in_video_data7;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld0;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld1;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld2;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld3;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld4;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld5;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld6;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			in_video_data_vld7;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end4;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end5;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end6;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end7;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld4;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld5;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld6;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			line_end_vld7;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [1:0]		master_pipe;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe0_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe0_concat_en;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe0_frame_active;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			pipe1_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe1_concat_en;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe1_frame_active;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			pipe2_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe2_concat_en;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe2_frame_active;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			pipe3_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe3_concat_en;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v, ...
input			pipe3_frame_active;	// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			pipe4_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			pipe5_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			pipe6_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			pipe7_aggre_en;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			reg_app_aggr_idi_crc_chk_en;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input [2:0]		reg_app_aggr_vc_bit_override_en;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input [2:0]		reg_app_aggr_vc_bit_override_value;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_clear_send_pkt_cnt_lp_pf;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_clear_send_pkt_cnt_lp_ph;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_clear_send_pkt_cnt_sp_fe;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_clear_send_pkt_cnt_sp_fs;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_clear_send_pkt_cnt_sp_le;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_clear_send_pkt_cnt_sp_ls;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_delete_lp_depend_on_wc_mux;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input [5:0]		reg_send_pkt_match_lp_dt;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input			reg_send_pkt_match_lp_dt_en;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input [3:0]		reg_sync_aggr_auto_mask_en;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			reg_sync_aggr_check_framecount_en;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			reg_sync_aggr_check_linecount_en;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [3:0]		reg_sync_aggr_force_video_mask;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			reg_sync_aggr_video_mask_latch_reset;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [3:0]		reg_sync_aggr_video_mask_restart;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [5:0]		reg_sync_aggr_video_status_info_datatype;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [15:0]		reg_sync_aggr_video_status_info_linecount;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [4:0]		reg_sync_aggr_video_status_info_vc;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [15:0]		reg_sync_aggr_video_status_info_wordcount;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [19:0]		reg_sync_aggr_video_timeout_threshold;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_loss0;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_loss1;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_loss2;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_loss3;		// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [139:0]		video_pipe_data_aggre_bypass;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
input [5:0]		video_pipe_date_type_for_concat_align0;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [5:0]		video_pipe_date_type_for_concat_align1;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [5:0]		video_pipe_date_type_for_concat_align2;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input [5:0]		video_pipe_date_type_for_concat_align3;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_pipe_date_type_for_concat_align_vld0;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_pipe_date_type_for_concat_align_vld1;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_pipe_date_type_for_concat_align_vld2;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_pipe_date_type_for_concat_align_vld3;// To u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
input			video_pipe_vld_aggre_bypass;// To u_as6d_app_idi_gen of as6d_app_idi_gen.v
// End of automatics

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [7:0]		ack_aggre;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [3:0]		ack_concat;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			aggre_busy;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			app_aggr_idi_crc_err_int;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [3:0]		csi2device_idi_byte_en;	// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] csi2device_idi_data;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output			csi2device_idi_data_en;	// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [20:0]		csi2device_idi_data_parity;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [5:0]		csi2device_idi_data_type;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output			csi2device_idi_header_en;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output			csi2device_idi_tunnel_mode_en;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [1:0]		csi2device_idi_virtual_channel;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] csi2device_idi_virtual_channel_x;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [15:0]		csi2device_idi_word_count;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [3:0]		current_state;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [7:0]		line_end_aggre;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [3:0]		line_end_concat;	// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			pipe0_mem_clear;	// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [1:0]		pipe0_wr_mode;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			pipe1_mem_clear;	// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [1:0]		pipe1_wr_mode;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			pipe2_mem_clear;	// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [1:0]		pipe2_wr_mode;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			pipe3_mem_clear;	// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [1:0]		pipe3_wr_mode;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls;// From u_as6d_app_idi_gen of as6d_app_idi_gen.v
output			sch_data_type_align_fail_int;// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state0;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state1;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state2;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state3;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state4;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state5;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state6;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output			up_state7;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [7:0]		up_state_aggre;		// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
output [3:0]		up_state_concat;	// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
// End of automatics

output			sch2post_video_data_vld;// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [VIDEO_DATA_SIZE-1:0] post2idi_video_data;	// From u_as6d_app_data_post of as6d_app_data_post.v
wire			post2idi_video_data_vld;// From u_as6d_app_data_post of as6d_app_data_post.v
wire [139:0]		sch2post_video_data;	// From u_as6d_app_pipe_sch of as6d_app_pipe_sch.v
// End of automatics

/*  as6d_app_pipe_sch  AUTO_TEMPLATE (
	.out_video_data_vld	(sch2post_video_data_vld),
	.out_video_data		(sch2post_video_data[]),
	.sch_current_state	(current_state[]),
	.up_state_aggre	(up_state_aggre[]),
	.up_state_concat	(up_state_concat[3:0]),
	.line_end_aggre	(line_end_aggre[]),
	.line_end_concat	(line_end_concat[3:0]),
	.ack_aggre	(ack_aggre[]),
	.ack_concat	(ack_concat[]),
	.aggre_busy	(aggre_busy),
	.pipe_wr_mode(pipe_wr_mode),
);*/
as6d_app_pipe_sch   #(.AGGR_ID(AGGR_ID))
u_as6d_app_pipe_sch  (/*AUTOINST*/
		      // Outputs
		      .up_state0	(up_state0),
		      .up_state1	(up_state1),
		      .up_state2	(up_state2),
		      .up_state3	(up_state3),
		      .up_state4	(up_state4),
		      .up_state5	(up_state5),
		      .up_state6	(up_state6),
		      .up_state7	(up_state7),
		      .sch_current_state(current_state[3:0]),	 // Templated
		      .out_video_data_vld(sch2post_video_data_vld), // Templated
		      .out_video_data	(sch2post_video_data[139:0]), // Templated
		      .up_state_aggre	(up_state_aggre[7:0]),	 // Templated
		      .up_state_concat	(up_state_concat[3:0]),	 // Templated
		      .line_end_aggre	(line_end_aggre[7:0]),	 // Templated
		      .line_end_concat	(line_end_concat[3:0]),	 // Templated
		      .ack_aggre	(ack_aggre[7:0]),	 // Templated
		      .ack_concat	(ack_concat[3:0]),	 // Templated
		      .aggre_busy	(aggre_busy),		 // Templated
		      .pipe0_wr_mode	(pipe0_wr_mode[1:0]),
		      .pipe1_wr_mode	(pipe1_wr_mode[1:0]),
		      .pipe2_wr_mode	(pipe2_wr_mode[1:0]),
		      .pipe3_wr_mode	(pipe3_wr_mode[1:0]),
		      .pipe0_mem_clear	(pipe0_mem_clear),
		      .pipe1_mem_clear	(pipe1_mem_clear),
		      .pipe2_mem_clear	(pipe2_mem_clear),
		      .pipe3_mem_clear	(pipe3_mem_clear),
		      .sch_data_type_align_fail_int(sch_data_type_align_fail_int),
		      // Inputs
		      .clk_1M_rst_n	(clk_1M_rst_n),
		      .aggre_clk	(aggre_clk),
		      .aggre_clk_rst_n	(aggre_clk_rst_n),
		      .frame_sync_lock	(frame_sync_lock),
		      .aggre_mode	(aggre_mode[1:0]),
		      .clk_1M		(clk_1M),
		      .fifo_wrclk0	(fifo_wrclk0),
		      .fifo_wrclk1	(fifo_wrclk1),
		      .fifo_wrclk2	(fifo_wrclk2),
		      .fifo_wrclk3	(fifo_wrclk3),
		      .fifo_wrclk_rst_n0(fifo_wrclk_rst_n0),
		      .fifo_wrclk_rst_n1(fifo_wrclk_rst_n1),
		      .fifo_wrclk_rst_n2(fifo_wrclk_rst_n2),
		      .fifo_wrclk_rst_n3(fifo_wrclk_rst_n3),
		      .idi_header_en_0	(idi_header_en_0),
		      .idi_header_en_1	(idi_header_en_1),
		      .idi_header_en_2	(idi_header_en_2),
		      .idi_header_en_3	(idi_header_en_3),
		      .idi_datatype_0	(idi_datatype_0[5:0]),
		      .idi_datatype_1	(idi_datatype_1[5:0]),
		      .idi_datatype_2	(idi_datatype_2[5:0]),
		      .idi_datatype_3	(idi_datatype_3[5:0]),
		      .idi_wordcount_0	(idi_wordcount_0[15:0]),
		      .idi_wordcount_1	(idi_wordcount_1[15:0]),
		      .idi_wordcount_2	(idi_wordcount_2[15:0]),
		      .idi_wordcount_3	(idi_wordcount_3[15:0]),
		      .idi_linecount_0	(idi_linecount_0[2:0]),
		      .idi_linecount_1	(idi_linecount_1[2:0]),
		      .idi_linecount_2	(idi_linecount_2[2:0]),
		      .idi_linecount_3	(idi_linecount_3[2:0]),
		      .pipe0_frame_active(pipe0_frame_active),
		      .pipe1_frame_active(pipe1_frame_active),
		      .pipe2_frame_active(pipe2_frame_active),
		      .pipe3_frame_active(pipe3_frame_active),
		      .reg_sync_aggr_auto_mask_en(reg_sync_aggr_auto_mask_en[3:0]),
		      .reg_sync_aggr_force_video_mask(reg_sync_aggr_force_video_mask[3:0]),
		      .reg_sync_aggr_video_mask_restart(reg_sync_aggr_video_mask_restart[3:0]),
		      .reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_video_mask_latch_reset),
		      .reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
		      .reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
		      .reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
		      .reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
		      .reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
		      .reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
		      .reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[4:0]),
		      .master_pipe	(master_pipe[1:0]),
		      .pipe0_concat_en	(pipe0_concat_en),
		      .pipe0_aggre_en	(pipe0_aggre_en),
		      .empty_vld0	(empty_vld0),
		      .empty0		(empty0),
		      .in_video_data_vld0(in_video_data_vld0),
		      .in_video_data0	(in_video_data0[139:0]),
		      .ack0		(ack0),
		      .ack_vld0		(ack_vld0),
		      .ack_pre0		(ack_pre0),
		      .line_end0	(line_end0),
		      .line_end_vld0	(line_end_vld0),
		      .pipe1_concat_en	(pipe1_concat_en),
		      .pipe1_aggre_en	(pipe1_aggre_en),
		      .empty_vld1	(empty_vld1),
		      .empty1		(empty1),
		      .in_video_data_vld1(in_video_data_vld1),
		      .in_video_data1	(in_video_data1[139:0]),
		      .ack1		(ack1),
		      .ack_vld1		(ack_vld1),
		      .ack_pre1		(ack_pre1),
		      .line_end1	(line_end1),
		      .line_end_vld1	(line_end_vld1),
		      .pipe2_concat_en	(pipe2_concat_en),
		      .pipe2_aggre_en	(pipe2_aggre_en),
		      .empty_vld2	(empty_vld2),
		      .empty2		(empty2),
		      .in_video_data_vld2(in_video_data_vld2),
		      .in_video_data2	(in_video_data2[139:0]),
		      .ack2		(ack2),
		      .ack_vld2		(ack_vld2),
		      .ack_pre2		(ack_pre2),
		      .line_end2	(line_end2),
		      .line_end_vld2	(line_end_vld2),
		      .pipe3_concat_en	(pipe3_concat_en),
		      .pipe3_aggre_en	(pipe3_aggre_en),
		      .empty_vld3	(empty_vld3),
		      .empty3		(empty3),
		      .in_video_data_vld3(in_video_data_vld3),
		      .in_video_data3	(in_video_data3[139:0]),
		      .ack3		(ack3),
		      .ack_vld3		(ack_vld3),
		      .ack_pre3		(ack_pre3),
		      .line_end3	(line_end3),
		      .line_end_vld3	(line_end_vld3),
		      .pipe4_aggre_en	(pipe4_aggre_en),
		      .empty_vld4	(empty_vld4),
		      .empty4		(empty4),
		      .in_video_data_vld4(in_video_data_vld4),
		      .in_video_data4	(in_video_data4[139:0]),
		      .ack4		(ack4),
		      .ack_vld4		(ack_vld4),
		      .ack_pre4		(ack_pre4),
		      .line_end4	(line_end4),
		      .line_end_vld4	(line_end_vld4),
		      .pipe5_aggre_en	(pipe5_aggre_en),
		      .empty_vld5	(empty_vld5),
		      .empty5		(empty5),
		      .in_video_data_vld5(in_video_data_vld5),
		      .in_video_data5	(in_video_data5[139:0]),
		      .ack5		(ack5),
		      .ack_vld5		(ack_vld5),
		      .ack_pre5		(ack_pre5),
		      .line_end5	(line_end5),
		      .line_end_vld5	(line_end_vld5),
		      .pipe6_aggre_en	(pipe6_aggre_en),
		      .empty_vld6	(empty_vld6),
		      .empty6		(empty6),
		      .in_video_data_vld6(in_video_data_vld6),
		      .in_video_data6	(in_video_data6[139:0]),
		      .ack6		(ack6),
		      .ack_vld6		(ack_vld6),
		      .ack_pre6		(ack_pre6),
		      .line_end6	(line_end6),
		      .line_end_vld6	(line_end_vld6),
		      .pipe7_aggre_en	(pipe7_aggre_en),
		      .empty_vld7	(empty_vld7),
		      .empty7		(empty7),
		      .in_video_data_vld7(in_video_data_vld7),
		      .in_video_data7	(in_video_data7[139:0]),
		      .ack7		(ack7),
		      .ack_vld7		(ack_vld7),
		      .ack_pre7		(ack_pre7),
		      .line_end7	(line_end7),
		      .line_end_vld7	(line_end_vld7),
		      .video_loss0	(video_loss0),
		      .video_loss1	(video_loss1),
		      .video_loss2	(video_loss2),
		      .video_loss3	(video_loss3),
		      .video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
		      .video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
		      .video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
		      .video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
		      .video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
		      .video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
		      .video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
		      .video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]));

/*  as6d_app_data_post  AUTO_TEMPLATE (
		.in_video_data_vld		(sch2post_video_data_vld		),
		.in_video_data			(sch2post_video_data[]	),
		.out_video_data_vld		(post2idi_video_data_vld		),
		.out_video_data			(post2idi_video_data[]	),
);*/
as6d_app_data_post #(
    .VIDEO_DATA_SIZE(140)
)u_as6d_app_data_post   (/*AUTOINST*/
			 // Outputs
			 .out_video_data_vld	(post2idi_video_data_vld		), // Templated
			 .out_video_data	(post2idi_video_data[VIDEO_DATA_SIZE-1:0]	), // Templated
			 // Inputs
			 .aggre_clk		(aggre_clk),
			 .aggre_clk_rst_n	(aggre_clk_rst_n),
			 .fse_filter		(fse_filter),
			 .in_video_data_vld	(sch2post_video_data_vld		), // Templated
			 .in_video_data		(sch2post_video_data[VIDEO_DATA_SIZE-1:0]	), // Templated
			 .master_pipe		(master_pipe[1:0]),
			 .aggre_mode		(aggre_mode[1:0]),
			 .pipe0_concat_en	(pipe0_concat_en),
			 .pipe1_concat_en	(pipe1_concat_en),
			 .pipe2_concat_en	(pipe2_concat_en),
			 .pipe3_concat_en	(pipe3_concat_en),
			 .pipe0_aggre_en	(pipe0_aggre_en),
			 .pipe1_aggre_en	(pipe1_aggre_en),
			 .pipe2_aggre_en	(pipe2_aggre_en),
			 .pipe3_aggre_en	(pipe3_aggre_en));
 

/*  as6d_app_idi_gen  AUTO_TEMPLATE (
		.app_idi_crc_err_int(app_aggr_idi_crc_err_int),
		.video_data_vld		(post2idi_video_data_vld		),
		.video_data			(post2idi_video_data[]	),
);*/
as6d_app_idi_gen #(
    .VIDEO_DATA_SIZE(140)
)u_as6d_app_idi_gen  (/*AUTOINST*/
		      // Outputs
		      .reg_rd_send_pkt_cnt_lp_pf(reg_rd_send_pkt_cnt_lp_pf[31:0]),
		      .reg_rd_send_pkt_cnt_lp_ph(reg_rd_send_pkt_cnt_lp_ph[31:0]),
		      .reg_rd_send_pkt_cnt_sp_fe(reg_rd_send_pkt_cnt_sp_fe[31:0]),
		      .reg_rd_send_pkt_cnt_sp_fs(reg_rd_send_pkt_cnt_sp_fs[31:0]),
		      .reg_rd_send_pkt_cnt_sp_le(reg_rd_send_pkt_cnt_sp_le[31:0]),
		      .reg_rd_send_pkt_cnt_sp_ls(reg_rd_send_pkt_cnt_sp_ls[31:0]),
		      .csi2device_idi_tunnel_mode_en(csi2device_idi_tunnel_mode_en),
		      .csi2device_idi_header_en(csi2device_idi_header_en),
		      .csi2device_idi_virtual_channel(csi2device_idi_virtual_channel[1:0]),
		      .csi2device_idi_virtual_channel_x(csi2device_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]),
		      .csi2device_idi_data_type(csi2device_idi_data_type[5:0]),
		      .csi2device_idi_word_count(csi2device_idi_word_count[15:0]),
		      .csi2device_idi_data(csi2device_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]),
		      .csi2device_idi_data_en(csi2device_idi_data_en),
		      .csi2device_idi_byte_en(csi2device_idi_byte_en[4-1:0]),
		      .csi2device_idi_data_parity(csi2device_idi_data_parity[21-1:0]),
		      .app_aggr_idi_crc_err_int(app_aggr_idi_crc_err_int),
		      // Inputs
		      .reg_clear_send_pkt_cnt_lp_pf(reg_clear_send_pkt_cnt_lp_pf),
		      .reg_clear_send_pkt_cnt_lp_ph(reg_clear_send_pkt_cnt_lp_ph),
		      .reg_clear_send_pkt_cnt_sp_fe(reg_clear_send_pkt_cnt_sp_fe),
		      .reg_clear_send_pkt_cnt_sp_fs(reg_clear_send_pkt_cnt_sp_fs),
		      .reg_clear_send_pkt_cnt_sp_le(reg_clear_send_pkt_cnt_sp_le),
		      .reg_clear_send_pkt_cnt_sp_ls(reg_clear_send_pkt_cnt_sp_ls),
		      .reg_send_pkt_match_lp_dt(reg_send_pkt_match_lp_dt[5:0]),
		      .reg_send_pkt_match_lp_dt_en(reg_send_pkt_match_lp_dt_en),
		      .aggre_clk	(aggre_clk),
		      .aggre_clk_rst_n	(aggre_clk_rst_n),
		      .csi2device_idi_halt(csi2device_idi_halt),
		      .csi2device_idi_anti_halt(csi2device_idi_anti_halt),
		      .video_data_vld	(post2idi_video_data_vld		), // Templated
		      .video_data	(post2idi_video_data[VIDEO_DATA_SIZE-1:0]	), // Templated
		      .video_pipe_data_aggre_bypass(video_pipe_data_aggre_bypass[139:0]),
		      .video_pipe_vld_aggre_bypass(video_pipe_vld_aggre_bypass),
		      .app_aggregation_bypass(app_aggregation_bypass),
		      .reg_delete_lp_depend_on_wc_mux(reg_delete_lp_depend_on_wc_mux),
		      .reg_app_aggr_vc_bit_override_en(reg_app_aggr_vc_bit_override_en[2:0]),
		      .reg_app_aggr_vc_bit_override_value(reg_app_aggr_vc_bit_override_value[2:0]),
		      .reg_app_aggr_idi_crc_chk_en(reg_app_aggr_idi_crc_chk_en));


endmodule
