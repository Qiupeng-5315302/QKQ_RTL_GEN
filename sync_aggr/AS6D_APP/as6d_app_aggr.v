
module as6d_app_aggr #(
	parameter	VIDEO_DATA_SIZE		= 140
)(/*AUTOARG*/
   // Outputs
   sch_data_type_align_fail_int3, sch_data_type_align_fail_int2,
   sch_data_type_align_fail_int1, sch_data_type_align_fail_int0,
   sch3_up_state_concat, sch3_up_state_aggre, sch3_line_end_concat,
   sch3_line_end_aggre, sch3_cs, sch3_aggre_busy, sch3_ack_concat,
   sch3_ack_aggre, sch2post_video_data_vld3, sch2post_video_data_vld2,
   sch2post_video_data_vld1, sch2post_video_data_vld0,
   sch2_up_state_concat, sch2_up_state_aggre, sch2_line_end_concat,
   sch2_line_end_aggre, sch2_cs, sch2_aggre_busy, sch2_ack_concat,
   sch2_ack_aggre, sch1_up_state_concat, sch1_up_state_aggre,
   sch1_line_end_concat, sch1_line_end_aggre, sch1_cs,
   sch1_aggre_busy, sch1_ack_concat, sch1_ack_aggre,
   sch0_up_state_concat, sch0_up_state_aggre, sch0_line_end_concat,
   sch0_line_end_aggre, sch0_cs, sch0_aggre_busy, sch0_ack_concat,
   sch0_ack_aggre, reg_rd_send_pkt_cnt_sp_ls_aggr3,
   reg_rd_send_pkt_cnt_sp_ls_aggr2, reg_rd_send_pkt_cnt_sp_ls_aggr1,
   reg_rd_send_pkt_cnt_sp_ls_aggr0, reg_rd_send_pkt_cnt_sp_le_aggr3,
   reg_rd_send_pkt_cnt_sp_le_aggr2, reg_rd_send_pkt_cnt_sp_le_aggr1,
   reg_rd_send_pkt_cnt_sp_le_aggr0, reg_rd_send_pkt_cnt_sp_fs_aggr3,
   reg_rd_send_pkt_cnt_sp_fs_aggr2, reg_rd_send_pkt_cnt_sp_fs_aggr1,
   reg_rd_send_pkt_cnt_sp_fs_aggr0, reg_rd_send_pkt_cnt_sp_fe_aggr3,
   reg_rd_send_pkt_cnt_sp_fe_aggr2, reg_rd_send_pkt_cnt_sp_fe_aggr1,
   reg_rd_send_pkt_cnt_sp_fe_aggr0, reg_rd_send_pkt_cnt_lp_ph_aggr3,
   reg_rd_send_pkt_cnt_lp_ph_aggr2, reg_rd_send_pkt_cnt_lp_ph_aggr1,
   reg_rd_send_pkt_cnt_lp_ph_aggr0, reg_rd_send_pkt_cnt_lp_pf_aggr3,
   reg_rd_send_pkt_cnt_lp_pf_aggr2, reg_rd_send_pkt_cnt_lp_pf_aggr1,
   reg_rd_send_pkt_cnt_lp_pf_aggr0, csi2device3_idi_word_count,
   csi2device3_idi_virtual_channel_x, csi2device3_idi_virtual_channel,
   csi2device3_idi_tunnel_mode_en, csi2device3_idi_header_en,
   csi2device3_idi_data_type, csi2device3_idi_data_parity,
   csi2device3_idi_data_en, csi2device3_idi_data,
   csi2device3_idi_byte_en, csi2device2_idi_word_count,
   csi2device2_idi_virtual_channel_x, csi2device2_idi_virtual_channel,
   csi2device2_idi_tunnel_mode_en, csi2device2_idi_header_en,
   csi2device2_idi_data_type, csi2device2_idi_data_parity,
   csi2device2_idi_data_en, csi2device2_idi_data,
   csi2device2_idi_byte_en, csi2device1_idi_word_count,
   csi2device1_idi_virtual_channel_x, csi2device1_idi_virtual_channel,
   csi2device1_idi_tunnel_mode_en, csi2device1_idi_header_en,
   csi2device1_idi_data_type, csi2device1_idi_data_parity,
   csi2device1_idi_data_en, csi2device1_idi_data,
   csi2device1_idi_byte_en, csi2device0_idi_word_count,
   csi2device0_idi_virtual_channel_x, csi2device0_idi_virtual_channel,
   csi2device0_idi_tunnel_mode_en, csi2device0_idi_header_en,
   csi2device0_idi_data_type, csi2device0_idi_data_parity,
   csi2device0_idi_data_en, csi2device0_idi_data,
   csi2device0_idi_byte_en, app_aggr_idi_crc_err_int3,
   app_aggr_idi_crc_err_int2, app_aggr_idi_crc_err_int1,
   app_aggr_idi_crc_err_int0, up_state_video_pipe0,
   up_state_video_pipe1, up_state_video_pipe2, up_state_video_pipe3,
   up_state_video_pipe4, up_state_video_pipe5, up_state_video_pipe6,
   up_state_video_pipe7,
   // Inputs
   video_pipe_date_type_for_concat_align_vld3,
   video_pipe_date_type_for_concat_align_vld2,
   video_pipe_date_type_for_concat_align_vld1,
   video_pipe_date_type_for_concat_align_vld0,
   video_pipe_date_type_for_concat_align3,
   video_pipe_date_type_for_concat_align2,
   video_pipe_date_type_for_concat_align1,
   video_pipe_date_type_for_concat_align0,
   video_pipe3_vld_aggre_bypass, video_pipe3_data_aggre_bypass,
   video_pipe2_vld_aggre_bypass, video_pipe2_data_aggre_bypass,
   video_pipe1_vld_aggre_bypass, video_pipe1_data_aggre_bypass,
   video_pipe0_vld_aggre_bypass, video_pipe0_data_aggre_bypass,
   video_loss3, video_loss2, video_loss1, video_loss0,
   video_data_fifo_empty7, video_data_fifo_empty6,
   video_data_fifo_empty5, video_data_fifo_empty4,
   video_data_fifo_empty3, video_data_fifo_empty2,
   video_data_fifo_empty1, video_data_fifo_empty0,
   sch3_pipe7_aggre_en, sch3_pipe6_aggre_en, sch3_pipe5_aggre_en,
   sch3_pipe4_aggre_en, sch3_pipe3_concat_en, sch3_pipe3_aggre_en,
   sch3_pipe2_concat_en, sch3_pipe2_aggre_en, sch3_pipe1_concat_en,
   sch3_pipe1_aggre_en, sch3_pipe0_concat_en, sch3_pipe0_aggre_en,
   sch3_master_pipe, sch3_fse_filter, sch3_frame_sync_lock,
   sch3_aggre_mode, sch2_pipe7_aggre_en, sch2_pipe6_aggre_en,
   sch2_pipe5_aggre_en, sch2_pipe4_aggre_en, sch2_pipe3_concat_en,
   sch2_pipe3_aggre_en, sch2_pipe2_concat_en, sch2_pipe2_aggre_en,
   sch2_pipe1_concat_en, sch2_pipe1_aggre_en, sch2_pipe0_concat_en,
   sch2_pipe0_aggre_en, sch2_master_pipe, sch2_fse_filter,
   sch2_frame_sync_lock, sch2_aggre_mode, sch1_pipe7_aggre_en,
   sch1_pipe6_aggre_en, sch1_pipe5_aggre_en, sch1_pipe4_aggre_en,
   sch1_pipe3_concat_en, sch1_pipe3_aggre_en, sch1_pipe2_concat_en,
   sch1_pipe2_aggre_en, sch1_pipe1_concat_en, sch1_pipe1_aggre_en,
   sch1_pipe0_concat_en, sch1_pipe0_aggre_en, sch1_master_pipe,
   sch1_fse_filter, sch1_frame_sync_lock, sch1_aggre_mode,
   sch0_pipe7_aggre_en, sch0_pipe6_aggre_en, sch0_pipe5_aggre_en,
   sch0_pipe4_aggre_en, sch0_pipe3_concat_en, sch0_pipe3_aggre_en,
   sch0_pipe2_concat_en, sch0_pipe2_aggre_en, sch0_pipe1_concat_en,
   sch0_pipe1_aggre_en, sch0_pipe0_concat_en, sch0_pipe0_aggre_en,
   sch0_master_pipe, sch0_fse_filter, sch0_frame_sync_lock,
   sch0_aggre_mode, reg_sync_aggr_video_timeout_threshold,
   reg_sync_aggr_video_status_info_wordcount,
   reg_sync_aggr_video_status_info_vc,
   reg_sync_aggr_video_status_info_linecount,
   reg_sync_aggr_video_status_info_datatype,
   reg_sync_aggr_video_mask_restart, reg_sync_aggr_force_video_mask,
   reg_sync_aggr_check_linecount_en,
   reg_sync_aggr_check_framecount_en, reg_sync_aggr_auto_mask_en,
   reg_sync_aggr_3_video_mask_latch_reset,
   reg_sync_aggr_2_video_mask_latch_reset,
   reg_sync_aggr_1_video_mask_latch_reset,
   reg_sync_aggr_0_video_mask_latch_reset,
   reg_send_pkt_match_lp_dt_en_aggr3,
   reg_send_pkt_match_lp_dt_en_aggr2,
   reg_send_pkt_match_lp_dt_en_aggr1,
   reg_send_pkt_match_lp_dt_en_aggr0, reg_send_pkt_match_lp_dt_aggr3,
   reg_send_pkt_match_lp_dt_aggr2, reg_send_pkt_match_lp_dt_aggr1,
   reg_send_pkt_match_lp_dt_aggr0, reg_delete_lp_depend_on_wc_mux,
   reg_clear_send_pkt_cnt_sp_ls_aggr3,
   reg_clear_send_pkt_cnt_sp_ls_aggr2,
   reg_clear_send_pkt_cnt_sp_ls_aggr1,
   reg_clear_send_pkt_cnt_sp_ls_aggr0,
   reg_clear_send_pkt_cnt_sp_le_aggr3,
   reg_clear_send_pkt_cnt_sp_le_aggr2,
   reg_clear_send_pkt_cnt_sp_le_aggr1,
   reg_clear_send_pkt_cnt_sp_le_aggr0,
   reg_clear_send_pkt_cnt_sp_fs_aggr3,
   reg_clear_send_pkt_cnt_sp_fs_aggr2,
   reg_clear_send_pkt_cnt_sp_fs_aggr1,
   reg_clear_send_pkt_cnt_sp_fs_aggr0,
   reg_clear_send_pkt_cnt_sp_fe_aggr3,
   reg_clear_send_pkt_cnt_sp_fe_aggr2,
   reg_clear_send_pkt_cnt_sp_fe_aggr1,
   reg_clear_send_pkt_cnt_sp_fe_aggr0,
   reg_clear_send_pkt_cnt_lp_ph_aggr3,
   reg_clear_send_pkt_cnt_lp_ph_aggr2,
   reg_clear_send_pkt_cnt_lp_ph_aggr1,
   reg_clear_send_pkt_cnt_lp_ph_aggr0,
   reg_clear_send_pkt_cnt_lp_pf_aggr3,
   reg_clear_send_pkt_cnt_lp_pf_aggr2,
   reg_clear_send_pkt_cnt_lp_pf_aggr1,
   reg_clear_send_pkt_cnt_lp_pf_aggr0, reg_app_aggr_idi_crc_chk_en,
   reg_app_aggr3_vc_bit_override_value,
   reg_app_aggr3_vc_bit_override_en,
   reg_app_aggr2_vc_bit_override_value,
   reg_app_aggr2_vc_bit_override_en,
   reg_app_aggr1_vc_bit_override_value,
   reg_app_aggr1_vc_bit_override_en,
   reg_app_aggr0_vc_bit_override_value,
   reg_app_aggr0_vc_bit_override_en, pipe_frame_active,
   line_end_vld_pipe7_aggregator3, line_end_vld_pipe7_aggregator2,
   line_end_vld_pipe7_aggregator1, line_end_vld_pipe7_aggregator0,
   line_end_vld_pipe6_aggregator3, line_end_vld_pipe6_aggregator2,
   line_end_vld_pipe6_aggregator1, line_end_vld_pipe6_aggregator0,
   line_end_vld_pipe5_aggregator3, line_end_vld_pipe5_aggregator2,
   line_end_vld_pipe5_aggregator1, line_end_vld_pipe5_aggregator0,
   line_end_vld_pipe4_aggregator3, line_end_vld_pipe4_aggregator2,
   line_end_vld_pipe4_aggregator1, line_end_vld_pipe4_aggregator0,
   line_end_vld_pipe3_aggregator3, line_end_vld_pipe3_aggregator2,
   line_end_vld_pipe3_aggregator1, line_end_vld_pipe3_aggregator0,
   line_end_vld_pipe2_aggregator3, line_end_vld_pipe2_aggregator2,
   line_end_vld_pipe2_aggregator1, line_end_vld_pipe2_aggregator0,
   line_end_vld_pipe1_aggregator3, line_end_vld_pipe1_aggregator2,
   line_end_vld_pipe1_aggregator1, line_end_vld_pipe1_aggregator0,
   line_end_vld_pipe0_aggregator3, line_end_vld_pipe0_aggregator2,
   line_end_vld_pipe0_aggregator1, line_end_vld_pipe0_aggregator0,
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
   fifo_wr_clk_rst_n_3, fifo_wr_clk_rst_n_2, fifo_wr_clk_rst_n_1,
   fifo_wr_clk_rst_n_0, fifo_wr_clk_3, fifo_wr_clk_2, fifo_wr_clk_1,
   fifo_wr_clk_0, empty_vld_pipe7_aggregator3,
   empty_vld_pipe7_aggregator2, empty_vld_pipe7_aggregator1,
   empty_vld_pipe7_aggregator0, empty_vld_pipe6_aggregator3,
   empty_vld_pipe6_aggregator2, empty_vld_pipe6_aggregator1,
   empty_vld_pipe6_aggregator0, empty_vld_pipe5_aggregator3,
   empty_vld_pipe5_aggregator2, empty_vld_pipe5_aggregator1,
   empty_vld_pipe5_aggregator0, empty_vld_pipe4_aggregator3,
   empty_vld_pipe4_aggregator2, empty_vld_pipe4_aggregator1,
   empty_vld_pipe4_aggregator0, empty_vld_pipe3_aggregator3,
   empty_vld_pipe3_aggregator2, empty_vld_pipe3_aggregator1,
   empty_vld_pipe3_aggregator0, empty_vld_pipe2_aggregator3,
   empty_vld_pipe2_aggregator2, empty_vld_pipe2_aggregator1,
   empty_vld_pipe2_aggregator0, empty_vld_pipe1_aggregator3,
   empty_vld_pipe1_aggregator2, empty_vld_pipe1_aggregator1,
   empty_vld_pipe1_aggregator0, empty_vld_pipe0_aggregator3,
   empty_vld_pipe0_aggregator2, empty_vld_pipe0_aggregator1,
   empty_vld_pipe0_aggregator0, csi2device3_idi_halt,
   csi2device3_idi_anti_halt, csi2device2_idi_halt,
   csi2device2_idi_anti_halt, csi2device1_idi_halt,
   csi2device1_idi_anti_halt, csi2device0_idi_halt,
   csi2device0_idi_anti_halt, clk_1M, app_aggregation_bypass,
   aggre_clk_rst_n3, aggre_clk_rst_n2, aggre_clk_rst_n1,
   aggre_clk_rst_n0, aggre_clk3, aggre_clk2, aggre_clk1, aggre_clk0,
   ack_vld_pipe7_aggregator3, ack_vld_pipe7_aggregator2,
   ack_vld_pipe7_aggregator1, ack_vld_pipe7_aggregator0,
   ack_vld_pipe6_aggregator3, ack_vld_pipe6_aggregator2,
   ack_vld_pipe6_aggregator1, ack_vld_pipe6_aggregator0,
   ack_vld_pipe5_aggregator3, ack_vld_pipe5_aggregator2,
   ack_vld_pipe5_aggregator1, ack_vld_pipe5_aggregator0,
   ack_vld_pipe4_aggregator3, ack_vld_pipe4_aggregator2,
   ack_vld_pipe4_aggregator1, ack_vld_pipe4_aggregator0,
   ack_vld_pipe3_aggregator3, ack_vld_pipe3_aggregator2,
   ack_vld_pipe3_aggregator1, ack_vld_pipe3_aggregator0,
   ack_vld_pipe2_aggregator3, ack_vld_pipe2_aggregator2,
   ack_vld_pipe2_aggregator1, ack_vld_pipe2_aggregator0,
   ack_vld_pipe1_aggregator3, ack_vld_pipe1_aggregator2,
   ack_vld_pipe1_aggregator1, ack_vld_pipe1_aggregator0,
   ack_vld_pipe0_aggregator3, ack_vld_pipe0_aggregator2,
   ack_vld_pipe0_aggregator1, ack_vld_pipe0_aggregator0, ack_pre7,
   ack_pre6, ack_pre5, ack_pre4, ack_pre3, ack_pre2, ack_pre1,
   ack_pre0, ack7, ack6, ack5, ack4, ack3, ack2, ack1, ack0
   );

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			ack0;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack1;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack2;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack3;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack4;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack5;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack6;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack7;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre0;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre1;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre2;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre3;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre4;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre5;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre6;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_pre7;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			ack_vld_pipe0_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe0_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe0_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe0_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe1_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe1_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe1_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe1_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe2_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe2_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe2_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe2_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe3_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe3_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe3_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe3_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe4_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe4_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe4_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe4_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe5_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe5_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe5_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe5_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe6_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe6_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe6_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe6_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe7_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe7_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe7_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			ack_vld_pipe7_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk0;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk1;		// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk2;		// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk3;		// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk_rst_n0;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk_rst_n1;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk_rst_n2;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			aggre_clk_rst_n3;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			app_aggregation_bypass;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			clk_1M;			// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			csi2device0_idi_anti_halt;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			csi2device0_idi_halt;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			csi2device1_idi_anti_halt;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			csi2device1_idi_halt;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			csi2device2_idi_anti_halt;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			csi2device2_idi_halt;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			csi2device3_idi_anti_halt;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			csi2device3_idi_halt;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe0_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe0_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe0_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe0_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe1_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe1_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe1_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe1_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe2_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe2_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe2_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe2_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe3_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe3_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe3_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe3_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe4_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe4_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe4_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe4_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe5_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe5_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe5_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe5_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe6_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe6_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe6_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe6_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe7_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe7_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe7_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			empty_vld_pipe7_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			fifo_wr_clk_0;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			fifo_wr_clk_1;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			fifo_wr_clk_2;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			fifo_wr_clk_3;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			fifo_wr_clk_rst_n_0;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			fifo_wr_clk_rst_n_1;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			fifo_wr_clk_rst_n_2;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			fifo_wr_clk_rst_n_3;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		idi_datatype_0;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		idi_datatype_1;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		idi_datatype_2;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		idi_datatype_3;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			idi_header_en_0;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			idi_header_en_1;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			idi_header_en_2;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			idi_header_en_3;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [2:0]		idi_linecount_0;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [2:0]		idi_linecount_1;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [2:0]		idi_linecount_2;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [2:0]		idi_linecount_3;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [15:0]		idi_wordcount_0;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [15:0]		idi_wordcount_1;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [15:0]		idi_wordcount_2;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [15:0]		idi_wordcount_3;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data0;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data1;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data2;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data3;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data4;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data5;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data6;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		in_video_data7;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld0;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld1;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld2;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld3;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld4;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld5;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld6;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			in_video_data_vld7;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end0;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end1;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end2;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end3;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end4;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end5;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end6;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end7;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			line_end_vld_pipe0_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe0_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe0_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe0_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe1_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe1_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe1_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe1_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe2_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe2_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe2_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe2_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe3_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe3_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe3_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe3_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe4_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe4_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe4_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe4_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe5_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe5_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe5_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe5_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe6_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe6_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe6_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe6_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe7_aggregator0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe7_aggregator1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe7_aggregator2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			line_end_vld_pipe7_aggregator3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [3:0]		pipe_frame_active;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [2:0]		reg_app_aggr0_vc_bit_override_en;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [2:0]		reg_app_aggr0_vc_bit_override_value;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [2:0]		reg_app_aggr1_vc_bit_override_en;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [2:0]		reg_app_aggr1_vc_bit_override_value;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [2:0]		reg_app_aggr2_vc_bit_override_en;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [2:0]		reg_app_aggr2_vc_bit_override_value;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [2:0]		reg_app_aggr3_vc_bit_override_en;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [2:0]		reg_app_aggr3_vc_bit_override_value;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [3:0]		reg_app_aggr_idi_crc_chk_en;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			reg_clear_send_pkt_cnt_lp_pf_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_lp_pf_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_lp_pf_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_lp_pf_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_le_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_le_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_le_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_le_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_delete_lp_depend_on_wc_mux;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		reg_send_pkt_match_lp_dt_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [5:0]		reg_send_pkt_match_lp_dt_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [5:0]		reg_send_pkt_match_lp_dt_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [5:0]		reg_send_pkt_match_lp_dt_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_send_pkt_match_lp_dt_en_aggr0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_send_pkt_match_lp_dt_en_aggr1;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_send_pkt_match_lp_dt_en_aggr2;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_send_pkt_match_lp_dt_en_aggr3;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_sync_aggr_0_video_mask_latch_reset;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_sync_aggr_1_video_mask_latch_reset;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_sync_aggr_2_video_mask_latch_reset;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			reg_sync_aggr_3_video_mask_latch_reset;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [3:0]		reg_sync_aggr_auto_mask_en;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			reg_sync_aggr_check_framecount_en;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			reg_sync_aggr_check_linecount_en;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [3:0]		reg_sync_aggr_force_video_mask;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [3:0]		reg_sync_aggr_video_mask_restart;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		reg_sync_aggr_video_status_info_datatype;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [15:0]		reg_sync_aggr_video_status_info_linecount;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [2:0]		reg_sync_aggr_video_status_info_vc;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [15:0]		reg_sync_aggr_video_status_info_wordcount;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [19:0]		reg_sync_aggr_video_timeout_threshold;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [1:0]		sch0_aggre_mode;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_frame_sync_lock;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_fse_filter;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [1:0]		sch0_master_pipe;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe0_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe0_concat_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe1_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe1_concat_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe2_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe2_concat_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe3_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe3_concat_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe4_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe5_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe6_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch0_pipe7_aggre_en;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [1:0]		sch1_aggre_mode;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_frame_sync_lock;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_fse_filter;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [1:0]		sch1_master_pipe;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe0_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe0_concat_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe1_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe1_concat_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe2_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe2_concat_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe3_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe3_concat_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe4_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe5_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe6_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch1_pipe7_aggre_en;	// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [1:0]		sch2_aggre_mode;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_frame_sync_lock;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_fse_filter;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [1:0]		sch2_master_pipe;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe0_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe0_concat_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe1_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe1_concat_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe2_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe2_concat_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe3_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe3_concat_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe4_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe5_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe6_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch2_pipe7_aggre_en;	// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [1:0]		sch3_aggre_mode;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_frame_sync_lock;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_fse_filter;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [1:0]		sch3_master_pipe;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe0_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe0_concat_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe1_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe1_concat_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe2_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe2_concat_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe3_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe3_concat_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe4_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe5_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe6_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			sch3_pipe7_aggre_en;	// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			video_data_fifo_empty0;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_data_fifo_empty1;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_data_fifo_empty2;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_data_fifo_empty3;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_data_fifo_empty4;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_data_fifo_empty5;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_data_fifo_empty6;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_data_fifo_empty7;	// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_loss0;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_loss1;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_loss2;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_loss3;		// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [139:0]		video_pipe0_data_aggre_bypass;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			video_pipe0_vld_aggre_bypass;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [139:0]		video_pipe1_data_aggre_bypass;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			video_pipe1_vld_aggre_bypass;// To u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [139:0]		video_pipe2_data_aggre_bypass;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			video_pipe2_vld_aggre_bypass;// To u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [139:0]		video_pipe3_data_aggre_bypass;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input			video_pipe3_vld_aggre_bypass;// To u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
input [5:0]		video_pipe_date_type_for_concat_align0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		video_pipe_date_type_for_concat_align1;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		video_pipe_date_type_for_concat_align2;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input [5:0]		video_pipe_date_type_for_concat_align3;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_pipe_date_type_for_concat_align_vld0;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_pipe_date_type_for_concat_align_vld1;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_pipe_date_type_for_concat_align_vld2;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
input			video_pipe_date_type_for_concat_align_vld3;// To u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v, ...
// End of automatics

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			app_aggr_idi_crc_err_int0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			app_aggr_idi_crc_err_int1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			app_aggr_idi_crc_err_int2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			app_aggr_idi_crc_err_int3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		csi2device0_idi_byte_en;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] csi2device0_idi_data;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device0_idi_data_en;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [20:0]		csi2device0_idi_data_parity;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [5:0]		csi2device0_idi_data_type;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device0_idi_header_en;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device0_idi_tunnel_mode_en;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [1:0]		csi2device0_idi_virtual_channel;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] csi2device0_idi_virtual_channel_x;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [15:0]		csi2device0_idi_word_count;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		csi2device1_idi_byte_en;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] csi2device1_idi_data;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device1_idi_data_en;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [20:0]		csi2device1_idi_data_parity;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [5:0]		csi2device1_idi_data_type;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device1_idi_header_en;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device1_idi_tunnel_mode_en;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [1:0]		csi2device1_idi_virtual_channel;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] csi2device1_idi_virtual_channel_x;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [15:0]		csi2device1_idi_word_count;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		csi2device2_idi_byte_en;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] csi2device2_idi_data;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device2_idi_data_en;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [20:0]		csi2device2_idi_data_parity;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [5:0]		csi2device2_idi_data_type;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device2_idi_header_en;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device2_idi_tunnel_mode_en;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [1:0]		csi2device2_idi_virtual_channel;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] csi2device2_idi_virtual_channel_x;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [15:0]		csi2device2_idi_word_count;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		csi2device3_idi_byte_en;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] csi2device3_idi_data;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device3_idi_data_en;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [20:0]		csi2device3_idi_data_parity;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [5:0]		csi2device3_idi_data_type;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device3_idi_header_en;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			csi2device3_idi_tunnel_mode_en;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [1:0]		csi2device3_idi_virtual_channel;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] csi2device3_idi_virtual_channel_x;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [15:0]		csi2device3_idi_word_count;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch0_ack_aggre;		// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch0_ack_concat;	// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch0_aggre_busy;	// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch0_cs;		// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch0_line_end_aggre;	// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch0_line_end_concat;	// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch0_up_state_aggre;	// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch0_up_state_concat;	// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch1_ack_aggre;		// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch1_ack_concat;	// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch1_aggre_busy;	// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch1_cs;		// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch1_line_end_aggre;	// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch1_line_end_concat;	// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch1_up_state_aggre;	// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch1_up_state_concat;	// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch2_ack_aggre;		// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch2_ack_concat;	// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch2_aggre_busy;	// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch2_cs;		// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch2_line_end_aggre;	// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch2_line_end_concat;	// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch2_up_state_aggre;	// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch2_up_state_concat;	// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch2post_video_data_vld0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch2post_video_data_vld1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch2post_video_data_vld2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch2post_video_data_vld3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch3_ack_aggre;		// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch3_ack_concat;	// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch3_aggre_busy;	// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch3_cs;		// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch3_line_end_aggre;	// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch3_line_end_concat;	// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [7:0]		sch3_up_state_aggre;	// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output [3:0]		sch3_up_state_concat;	// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch_data_type_align_fail_int0;// From u0_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch_data_type_align_fail_int1;// From u1_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch_data_type_align_fail_int2;// From u2_as6d_app_aggr_lane of as6d_app_aggr_lane.v
output			sch_data_type_align_fail_int3;// From u3_as6d_app_aggr_lane of as6d_app_aggr_lane.v
// End of automatics
output			up_state_video_pipe0	;				
output			up_state_video_pipe1	;				
output			up_state_video_pipe2	;				
output			up_state_video_pipe3	;				
output			up_state_video_pipe4	;				
output			up_state_video_pipe5	;				
output			up_state_video_pipe6	;				
output			up_state_video_pipe7	;				

wire			sch0_up_state0	;				
wire			sch1_up_state0	;				
wire			sch2_up_state0	;				
wire			sch3_up_state0	;				
wire			sch0_up_state1	;				
wire			sch1_up_state1	;				
wire			sch2_up_state1	;				
wire			sch3_up_state1	;				
wire			sch0_up_state2	;				
wire			sch1_up_state2	;				
wire			sch2_up_state2	;				
wire			sch3_up_state2	;				
wire			sch0_up_state3	;				
wire			sch1_up_state3	;				
wire			sch2_up_state3	;				
wire			sch3_up_state3	;				
wire			sch0_up_state4	;				
wire			sch1_up_state4	;				
wire			sch2_up_state4	;				
wire			sch3_up_state4	;				
wire			sch0_up_state5	;				
wire			sch1_up_state5	;				
wire			sch2_up_state5	;				
wire			sch3_up_state5	;				
wire			sch0_up_state6	;				
wire			sch1_up_state6	;				
wire			sch2_up_state6	;				
wire			sch3_up_state6	;				
wire			sch0_up_state7	;				
wire			sch1_up_state7	;				
wire			sch2_up_state7	;				
wire			sch3_up_state7	;				

assign	up_state_video_pipe0	=	sch0_up_state0|sch1_up_state0|sch2_up_state0|sch3_up_state0		;	
assign	up_state_video_pipe1	=	sch0_up_state1|sch1_up_state1|sch2_up_state1|sch3_up_state1		;	
assign	up_state_video_pipe2	=	sch0_up_state2|sch1_up_state2|sch2_up_state2|sch3_up_state2		;	
assign	up_state_video_pipe3	=	sch0_up_state3|sch1_up_state3|sch2_up_state3|sch3_up_state3		;	
assign	up_state_video_pipe4	=	sch0_up_state4|sch1_up_state4|sch2_up_state4|sch3_up_state4		;	
assign	up_state_video_pipe5	=	sch0_up_state5|sch1_up_state5|sch2_up_state5|sch3_up_state5		;	
assign	up_state_video_pipe6	=	sch0_up_state6|sch1_up_state6|sch2_up_state6|sch3_up_state6		;	
assign	up_state_video_pipe7	=	sch0_up_state7|sch1_up_state7|sch2_up_state7|sch3_up_state7		;	

/*  as6d_app_aggr_lane  AUTO_TEMPLATE (
		.VIDEO_DATA_SIZE			 (140),
		.DATA_PARITY_WIDTH			 (21),
		.AGGR_ID					 (2'd@),
		.aggre_clk					 (aggre_clk@[]),
		.aggre_clk_rst_n			 (aggre_clk_rst_n@[]),
		.csi2device\(.*\)			 (csi2device@\1[]),
		.frame_sync_lock\(.*\)		 (sch@_frame_sync_lock\1[]),
		.aggre_mode					 (sch@_aggre_mode[]),
		.master_pipe				 (sch@_master_pipe[]),
		.pipe\(.*\)_concat_en		 (sch@_pipe\1_concat_en[]),
		.pipe\(.*\)_aggre_en		 (sch@_pipe\1_aggre_en[]),
		.up_state\(.*\)				 (sch@_up_state\1[]),
		.empty_vld\(.*\)			 (empty_vld_pipe\1_aggregator@),
		.empty\(.*\)				 (video_data_fifo_empty\1[]),
		.ack_vld\(.*\)			     (ack_vld_pipe\1_aggregator@),
		.line_end_vld\(.*\)			 (line_end_vld_pipe\1_aggregator@),
		.fse_filter					 (sch@_fse_filter[]),
		.up_state_aggre				 (sch@_up_state_aggre[]),
		.up_state_concat			 (sch@_up_state_concat[]),
		.line_end_aggre				 (sch@_line_end_aggre[]),
		.line_end_concat			 (sch@_line_end_concat[]),
		.ack_aggre					 (sch@_ack_aggre[]),
		.ack_concat					 (sch@_ack_concat[]),
		.aggre_busy					 (sch@_aggre_busy),
		.current_state				 (sch@_cs[]),
		.sch2post_video_data_vld	 (sch2post_video_data_vld@[]),
        .app_aggregation_bypass      (app_aggregation_bypass),
        .video_pipe_data_aggre_bypass(video_pipe@_data_aggre_bypass[]),
        .video_pipe_vld_aggre_bypass (video_pipe@_vld_aggre_bypass),
        .reg_app_aggr_vc_bit_override_en(reg_app_aggr@_vc_bit_override_en[]),
        .reg_app_aggr_vc_bit_override_value(reg_app_aggr@_vc_bit_override_value[]),
		.reg_app_aggr_idi_crc_chk_en(reg_app_aggr_idi_crc_chk_en[@]),
		.app_aggr_idi_crc_err_int(app_aggr_idi_crc_err_int@),
        .\(.*\)send_pkt\(.*\)		(\1send_pkt\2_aggr@[]),
		.video_mask_restart(4'h0),
		.auto_mask_en(4'h0),
		.force_video_mask(4'h0),
		.sch_data_type_align_fail_int(sch_data_type_align_fail_int@),
		.pipe_clear_bit_map(),
		.pipe0_wr_mode(),
		.pipe1_wr_mode(),
		.pipe2_wr_mode(),
		.pipe3_wr_mode(),
		.pipe0_wr_mode_strobe(),
		.pipe1_wr_mode_strobe(),
		.pipe2_wr_mode_strobe(),
		.pipe3_wr_mode_strobe(),
        .reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_@_video_mask_latch_reset),
 );
*/

as6d_app_aggr_lane #(/*AUTOINSTPARAM*/
		     // Parameters
		     .VIDEO_DATA_SIZE	(140),			 // Templated
		     .DATA_PARITY_WIDTH	(21),			 // Templated
		     .AGGR_ID		(2'd0))			 // Templated
u0_as6d_app_aggr_lane  (
					     .up_state0		(sch0_up_state0),
					     .up_state1		(sch0_up_state1), 
					     .up_state2		(sch0_up_state2),
					     .up_state3		(sch0_up_state3),
			             .up_state4	    (sch0_up_state4),
			             .up_state5	    (sch0_up_state5),
			             .up_state6	    (sch0_up_state6),
			             .up_state7	    (sch0_up_state7),
						 /*AUTOINST*/
			// Outputs
			.ack_aggre	(sch0_ack_aggre[7:0]),	 // Templated
			.ack_concat	(sch0_ack_concat[3:0]),	 // Templated
			.aggre_busy	(sch0_aggre_busy),	 // Templated
			.app_aggr_idi_crc_err_int(app_aggr_idi_crc_err_int0), // Templated
			.csi2device_idi_byte_en(csi2device0_idi_byte_en[3:0]), // Templated
			.csi2device_idi_data(csi2device0_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
			.csi2device_idi_data_en(csi2device0_idi_data_en), // Templated
			.csi2device_idi_data_parity(csi2device0_idi_data_parity[20:0]), // Templated
			.csi2device_idi_data_type(csi2device0_idi_data_type[5:0]), // Templated
			.csi2device_idi_header_en(csi2device0_idi_header_en), // Templated
			.csi2device_idi_tunnel_mode_en(csi2device0_idi_tunnel_mode_en), // Templated
			.csi2device_idi_virtual_channel(csi2device0_idi_virtual_channel[1:0]), // Templated
			.csi2device_idi_virtual_channel_x(csi2device0_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
			.csi2device_idi_word_count(csi2device0_idi_word_count[15:0]), // Templated
			.current_state	(sch0_cs[3:0]),		 // Templated
			.line_end_aggre	(sch0_line_end_aggre[7:0]), // Templated
			.line_end_concat(sch0_line_end_concat[3:0]), // Templated
			.pipe0_wr_mode	(),			 // Templated
			.pipe0_wr_mode_strobe(),		 // Templated
			.pipe1_wr_mode	(),			 // Templated
			.pipe1_wr_mode_strobe(),		 // Templated
			.pipe2_wr_mode	(),			 // Templated
			.pipe2_wr_mode_strobe(),		 // Templated
			.pipe3_wr_mode	(),			 // Templated
			.pipe3_wr_mode_strobe(),		 // Templated
			.pipe_clear_bit_map(),			 // Templated
			.reg_rd_send_pkt_cnt_lp_pf(reg_rd_send_pkt_cnt_lp_pf_aggr0[31:0]), // Templated
			.reg_rd_send_pkt_cnt_lp_ph(reg_rd_send_pkt_cnt_lp_ph_aggr0[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fe(reg_rd_send_pkt_cnt_sp_fe_aggr0[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fs(reg_rd_send_pkt_cnt_sp_fs_aggr0[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_le(reg_rd_send_pkt_cnt_sp_le_aggr0[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_ls(reg_rd_send_pkt_cnt_sp_ls_aggr0[31:0]), // Templated
			.sch_data_type_align_fail_int(sch_data_type_align_fail_int0), // Templated
			.up_state_aggre	(sch0_up_state_aggre[7:0]), // Templated
			.up_state_concat(sch0_up_state_concat[3:0]), // Templated
			.sch2post_video_data_vld(sch2post_video_data_vld0), // Templated
			// Inputs
			.ack0		(ack0),
			.ack1		(ack1),
			.ack2		(ack2),
			.ack3		(ack3),
			.ack4		(ack4),
			.ack5		(ack5),
			.ack6		(ack6),
			.ack7		(ack7),
			.ack_pre0	(ack_pre0),
			.ack_pre1	(ack_pre1),
			.ack_pre2	(ack_pre2),
			.ack_pre3	(ack_pre3),
			.ack_pre4	(ack_pre4),
			.ack_pre5	(ack_pre5),
			.ack_pre6	(ack_pre6),
			.ack_pre7	(ack_pre7),
			.ack_vld0	(ack_vld_pipe0_aggregator0), // Templated
			.ack_vld1	(ack_vld_pipe1_aggregator0), // Templated
			.ack_vld2	(ack_vld_pipe2_aggregator0), // Templated
			.ack_vld3	(ack_vld_pipe3_aggregator0), // Templated
			.ack_vld4	(ack_vld_pipe4_aggregator0), // Templated
			.ack_vld5	(ack_vld_pipe5_aggregator0), // Templated
			.ack_vld6	(ack_vld_pipe6_aggregator0), // Templated
			.ack_vld7	(ack_vld_pipe7_aggregator0), // Templated
			.aggre_clk	(aggre_clk0),		 // Templated
			.aggre_clk_rst_n(aggre_clk_rst_n0),	 // Templated
			.aggre_mode	(sch0_aggre_mode[1:0]),	 // Templated
			.app_aggregation_bypass(app_aggregation_bypass), // Templated
			.clk_1M		(clk_1M),
			.csi2device_idi_anti_halt(csi2device0_idi_anti_halt), // Templated
			.csi2device_idi_halt(csi2device0_idi_halt), // Templated
			.empty0		(video_data_fifo_empty0), // Templated
			.empty1		(video_data_fifo_empty1), // Templated
			.empty2		(video_data_fifo_empty2), // Templated
			.empty3		(video_data_fifo_empty3), // Templated
			.empty4		(video_data_fifo_empty4), // Templated
			.empty5		(video_data_fifo_empty5), // Templated
			.empty6		(video_data_fifo_empty6), // Templated
			.empty7		(video_data_fifo_empty7), // Templated
			.empty_vld0	(empty_vld_pipe0_aggregator0), // Templated
			.empty_vld1	(empty_vld_pipe1_aggregator0), // Templated
			.empty_vld2	(empty_vld_pipe2_aggregator0), // Templated
			.empty_vld3	(empty_vld_pipe3_aggregator0), // Templated
			.empty_vld4	(empty_vld_pipe4_aggregator0), // Templated
			.empty_vld5	(empty_vld_pipe5_aggregator0), // Templated
			.empty_vld6	(empty_vld_pipe6_aggregator0), // Templated
			.empty_vld7	(empty_vld_pipe7_aggregator0), // Templated
			.fifo_wr_clk_0	(fifo_wr_clk_0),
			.fifo_wr_clk_1	(fifo_wr_clk_1),
			.fifo_wr_clk_2	(fifo_wr_clk_2),
			.fifo_wr_clk_3	(fifo_wr_clk_3),
			.fifo_wr_clk_rst_n_0(fifo_wr_clk_rst_n_0),
			.fifo_wr_clk_rst_n_1(fifo_wr_clk_rst_n_1),
			.fifo_wr_clk_rst_n_2(fifo_wr_clk_rst_n_2),
			.fifo_wr_clk_rst_n_3(fifo_wr_clk_rst_n_3),
			.frame_sync_lock(sch0_frame_sync_lock),	 // Templated
			.fse_filter	(sch0_fse_filter),	 // Templated
			.idi_datatype_0	(idi_datatype_0[5:0]),
			.idi_datatype_1	(idi_datatype_1[5:0]),
			.idi_datatype_2	(idi_datatype_2[5:0]),
			.idi_datatype_3	(idi_datatype_3[5:0]),
			.idi_header_en_0(idi_header_en_0),
			.idi_header_en_1(idi_header_en_1),
			.idi_header_en_2(idi_header_en_2),
			.idi_header_en_3(idi_header_en_3),
			.idi_linecount_0(idi_linecount_0[2:0]),
			.idi_linecount_1(idi_linecount_1[2:0]),
			.idi_linecount_2(idi_linecount_2[2:0]),
			.idi_linecount_3(idi_linecount_3[2:0]),
			.idi_wordcount_0(idi_wordcount_0[15:0]),
			.idi_wordcount_1(idi_wordcount_1[15:0]),
			.idi_wordcount_2(idi_wordcount_2[15:0]),
			.idi_wordcount_3(idi_wordcount_3[15:0]),
			.in_video_data0	(in_video_data0[139:0]),
			.in_video_data1	(in_video_data1[139:0]),
			.in_video_data2	(in_video_data2[139:0]),
			.in_video_data3	(in_video_data3[139:0]),
			.in_video_data4	(in_video_data4[139:0]),
			.in_video_data5	(in_video_data5[139:0]),
			.in_video_data6	(in_video_data6[139:0]),
			.in_video_data7	(in_video_data7[139:0]),
			.in_video_data_vld0(in_video_data_vld0),
			.in_video_data_vld1(in_video_data_vld1),
			.in_video_data_vld2(in_video_data_vld2),
			.in_video_data_vld3(in_video_data_vld3),
			.in_video_data_vld4(in_video_data_vld4),
			.in_video_data_vld5(in_video_data_vld5),
			.in_video_data_vld6(in_video_data_vld6),
			.in_video_data_vld7(in_video_data_vld7),
			.line_end0	(line_end0),
			.line_end1	(line_end1),
			.line_end2	(line_end2),
			.line_end3	(line_end3),
			.line_end4	(line_end4),
			.line_end5	(line_end5),
			.line_end6	(line_end6),
			.line_end7	(line_end7),
			.line_end_vld0	(line_end_vld_pipe0_aggregator0), // Templated
			.line_end_vld1	(line_end_vld_pipe1_aggregator0), // Templated
			.line_end_vld2	(line_end_vld_pipe2_aggregator0), // Templated
			.line_end_vld3	(line_end_vld_pipe3_aggregator0), // Templated
			.line_end_vld4	(line_end_vld_pipe4_aggregator0), // Templated
			.line_end_vld5	(line_end_vld_pipe5_aggregator0), // Templated
			.line_end_vld6	(line_end_vld_pipe6_aggregator0), // Templated
			.line_end_vld7	(line_end_vld_pipe7_aggregator0), // Templated
			.master_pipe	(sch0_master_pipe[1:0]), // Templated
			.pipe0_aggre_en	(sch0_pipe0_aggre_en),	 // Templated
			.pipe0_concat_en(sch0_pipe0_concat_en),	 // Templated
			.pipe1_aggre_en	(sch0_pipe1_aggre_en),	 // Templated
			.pipe1_concat_en(sch0_pipe1_concat_en),	 // Templated
			.pipe2_aggre_en	(sch0_pipe2_aggre_en),	 // Templated
			.pipe2_concat_en(sch0_pipe2_concat_en),	 // Templated
			.pipe3_aggre_en	(sch0_pipe3_aggre_en),	 // Templated
			.pipe3_concat_en(sch0_pipe3_concat_en),	 // Templated
			.pipe4_aggre_en	(sch0_pipe4_aggre_en),	 // Templated
			.pipe5_aggre_en	(sch0_pipe5_aggre_en),	 // Templated
			.pipe6_aggre_en	(sch0_pipe6_aggre_en),	 // Templated
			.pipe7_aggre_en	(sch0_pipe7_aggre_en),	 // Templated
			.pipe_frame_active(pipe_frame_active[3:0]),
			.reg_app_aggr_idi_crc_chk_en(reg_app_aggr_idi_crc_chk_en[0]), // Templated
			.reg_app_aggr_vc_bit_override_en(reg_app_aggr0_vc_bit_override_en[2:0]), // Templated
			.reg_app_aggr_vc_bit_override_value(reg_app_aggr0_vc_bit_override_value[2:0]), // Templated
			.reg_clear_send_pkt_cnt_lp_pf(reg_clear_send_pkt_cnt_lp_pf_aggr0), // Templated
			.reg_clear_send_pkt_cnt_lp_ph(reg_clear_send_pkt_cnt_lp_ph_aggr0), // Templated
			.reg_clear_send_pkt_cnt_sp_fe(reg_clear_send_pkt_cnt_sp_fe_aggr0), // Templated
			.reg_clear_send_pkt_cnt_sp_fs(reg_clear_send_pkt_cnt_sp_fs_aggr0), // Templated
			.reg_clear_send_pkt_cnt_sp_le(reg_clear_send_pkt_cnt_sp_le_aggr0), // Templated
			.reg_clear_send_pkt_cnt_sp_ls(reg_clear_send_pkt_cnt_sp_ls_aggr0), // Templated
			.reg_delete_lp_depend_on_wc_mux(reg_delete_lp_depend_on_wc_mux),
			.reg_send_pkt_match_lp_dt(reg_send_pkt_match_lp_dt_aggr0[5:0]), // Templated
			.reg_send_pkt_match_lp_dt_en(reg_send_pkt_match_lp_dt_en_aggr0), // Templated
			.reg_sync_aggr_auto_mask_en(reg_sync_aggr_auto_mask_en[3:0]),
			.reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
			.reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
			.reg_sync_aggr_force_video_mask(reg_sync_aggr_force_video_mask[3:0]),
			.reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_0_video_mask_latch_reset), // Templated
			.reg_sync_aggr_video_mask_restart(reg_sync_aggr_video_mask_restart[3:0]),
			.reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
			.reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
			.reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[2:0]),
			.reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
			.reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
			.video_loss0	(video_loss0),
			.video_loss1	(video_loss1),
			.video_loss2	(video_loss2),
			.video_loss3	(video_loss3),
			.video_pipe_data_aggre_bypass(video_pipe0_data_aggre_bypass[139:0]), // Templated
			.video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
			.video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
			.video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
			.video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
			.video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
			.video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
			.video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
			.video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
			.video_pipe_vld_aggre_bypass(video_pipe0_vld_aggre_bypass)); // Templated

as6d_app_aggr_lane#(/*AUTOINSTPARAM*/
		    // Parameters
		    .VIDEO_DATA_SIZE	(140),			 // Templated
		    .DATA_PARITY_WIDTH	(21),			 // Templated
		    .AGGR_ID		(2'd1))			 // Templated
u1_as6d_app_aggr_lane  (
					     .up_state0		(sch1_up_state0),
					     .up_state1		(sch1_up_state1),
					     .up_state2		(sch1_up_state2),
					     .up_state3		(sch1_up_state3),
			             .up_state4	    (sch1_up_state4),
			             .up_state5	    (sch1_up_state5),
			             .up_state6	    (sch1_up_state6),
			             .up_state7	    (sch1_up_state7),
						 /*AUTOINST*/
			// Outputs
			.ack_aggre	(sch1_ack_aggre[7:0]),	 // Templated
			.ack_concat	(sch1_ack_concat[3:0]),	 // Templated
			.aggre_busy	(sch1_aggre_busy),	 // Templated
			.app_aggr_idi_crc_err_int(app_aggr_idi_crc_err_int1), // Templated
			.csi2device_idi_byte_en(csi2device1_idi_byte_en[3:0]), // Templated
			.csi2device_idi_data(csi2device1_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
			.csi2device_idi_data_en(csi2device1_idi_data_en), // Templated
			.csi2device_idi_data_parity(csi2device1_idi_data_parity[20:0]), // Templated
			.csi2device_idi_data_type(csi2device1_idi_data_type[5:0]), // Templated
			.csi2device_idi_header_en(csi2device1_idi_header_en), // Templated
			.csi2device_idi_tunnel_mode_en(csi2device1_idi_tunnel_mode_en), // Templated
			.csi2device_idi_virtual_channel(csi2device1_idi_virtual_channel[1:0]), // Templated
			.csi2device_idi_virtual_channel_x(csi2device1_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
			.csi2device_idi_word_count(csi2device1_idi_word_count[15:0]), // Templated
			.current_state	(sch1_cs[3:0]),		 // Templated
			.line_end_aggre	(sch1_line_end_aggre[7:0]), // Templated
			.line_end_concat(sch1_line_end_concat[3:0]), // Templated
			.pipe0_wr_mode	(),			 // Templated
			.pipe0_wr_mode_strobe(),		 // Templated
			.pipe1_wr_mode	(),			 // Templated
			.pipe1_wr_mode_strobe(),		 // Templated
			.pipe2_wr_mode	(),			 // Templated
			.pipe2_wr_mode_strobe(),		 // Templated
			.pipe3_wr_mode	(),			 // Templated
			.pipe3_wr_mode_strobe(),		 // Templated
			.pipe_clear_bit_map(),			 // Templated
			.reg_rd_send_pkt_cnt_lp_pf(reg_rd_send_pkt_cnt_lp_pf_aggr1[31:0]), // Templated
			.reg_rd_send_pkt_cnt_lp_ph(reg_rd_send_pkt_cnt_lp_ph_aggr1[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fe(reg_rd_send_pkt_cnt_sp_fe_aggr1[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fs(reg_rd_send_pkt_cnt_sp_fs_aggr1[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_le(reg_rd_send_pkt_cnt_sp_le_aggr1[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_ls(reg_rd_send_pkt_cnt_sp_ls_aggr1[31:0]), // Templated
			.sch_data_type_align_fail_int(sch_data_type_align_fail_int1), // Templated
			.up_state_aggre	(sch1_up_state_aggre[7:0]), // Templated
			.up_state_concat(sch1_up_state_concat[3:0]), // Templated
			.sch2post_video_data_vld(sch2post_video_data_vld1), // Templated
			// Inputs
			.ack0		(ack0),
			.ack1		(ack1),
			.ack2		(ack2),
			.ack3		(ack3),
			.ack4		(ack4),
			.ack5		(ack5),
			.ack6		(ack6),
			.ack7		(ack7),
			.ack_pre0	(ack_pre0),
			.ack_pre1	(ack_pre1),
			.ack_pre2	(ack_pre2),
			.ack_pre3	(ack_pre3),
			.ack_pre4	(ack_pre4),
			.ack_pre5	(ack_pre5),
			.ack_pre6	(ack_pre6),
			.ack_pre7	(ack_pre7),
			.ack_vld0	(ack_vld_pipe0_aggregator1), // Templated
			.ack_vld1	(ack_vld_pipe1_aggregator1), // Templated
			.ack_vld2	(ack_vld_pipe2_aggregator1), // Templated
			.ack_vld3	(ack_vld_pipe3_aggregator1), // Templated
			.ack_vld4	(ack_vld_pipe4_aggregator1), // Templated
			.ack_vld5	(ack_vld_pipe5_aggregator1), // Templated
			.ack_vld6	(ack_vld_pipe6_aggregator1), // Templated
			.ack_vld7	(ack_vld_pipe7_aggregator1), // Templated
			.aggre_clk	(aggre_clk1),		 // Templated
			.aggre_clk_rst_n(aggre_clk_rst_n1),	 // Templated
			.aggre_mode	(sch1_aggre_mode[1:0]),	 // Templated
			.app_aggregation_bypass(app_aggregation_bypass), // Templated
			.clk_1M		(clk_1M),
			.csi2device_idi_anti_halt(csi2device1_idi_anti_halt), // Templated
			.csi2device_idi_halt(csi2device1_idi_halt), // Templated
			.empty0		(video_data_fifo_empty0), // Templated
			.empty1		(video_data_fifo_empty1), // Templated
			.empty2		(video_data_fifo_empty2), // Templated
			.empty3		(video_data_fifo_empty3), // Templated
			.empty4		(video_data_fifo_empty4), // Templated
			.empty5		(video_data_fifo_empty5), // Templated
			.empty6		(video_data_fifo_empty6), // Templated
			.empty7		(video_data_fifo_empty7), // Templated
			.empty_vld0	(empty_vld_pipe0_aggregator1), // Templated
			.empty_vld1	(empty_vld_pipe1_aggregator1), // Templated
			.empty_vld2	(empty_vld_pipe2_aggregator1), // Templated
			.empty_vld3	(empty_vld_pipe3_aggregator1), // Templated
			.empty_vld4	(empty_vld_pipe4_aggregator1), // Templated
			.empty_vld5	(empty_vld_pipe5_aggregator1), // Templated
			.empty_vld6	(empty_vld_pipe6_aggregator1), // Templated
			.empty_vld7	(empty_vld_pipe7_aggregator1), // Templated
			.fifo_wr_clk_0	(fifo_wr_clk_0),
			.fifo_wr_clk_1	(fifo_wr_clk_1),
			.fifo_wr_clk_2	(fifo_wr_clk_2),
			.fifo_wr_clk_3	(fifo_wr_clk_3),
			.fifo_wr_clk_rst_n_0(fifo_wr_clk_rst_n_0),
			.fifo_wr_clk_rst_n_1(fifo_wr_clk_rst_n_1),
			.fifo_wr_clk_rst_n_2(fifo_wr_clk_rst_n_2),
			.fifo_wr_clk_rst_n_3(fifo_wr_clk_rst_n_3),
			.frame_sync_lock(sch1_frame_sync_lock),	 // Templated
			.fse_filter	(sch1_fse_filter),	 // Templated
			.idi_datatype_0	(idi_datatype_0[5:0]),
			.idi_datatype_1	(idi_datatype_1[5:0]),
			.idi_datatype_2	(idi_datatype_2[5:0]),
			.idi_datatype_3	(idi_datatype_3[5:0]),
			.idi_header_en_0(idi_header_en_0),
			.idi_header_en_1(idi_header_en_1),
			.idi_header_en_2(idi_header_en_2),
			.idi_header_en_3(idi_header_en_3),
			.idi_linecount_0(idi_linecount_0[2:0]),
			.idi_linecount_1(idi_linecount_1[2:0]),
			.idi_linecount_2(idi_linecount_2[2:0]),
			.idi_linecount_3(idi_linecount_3[2:0]),
			.idi_wordcount_0(idi_wordcount_0[15:0]),
			.idi_wordcount_1(idi_wordcount_1[15:0]),
			.idi_wordcount_2(idi_wordcount_2[15:0]),
			.idi_wordcount_3(idi_wordcount_3[15:0]),
			.in_video_data0	(in_video_data0[139:0]),
			.in_video_data1	(in_video_data1[139:0]),
			.in_video_data2	(in_video_data2[139:0]),
			.in_video_data3	(in_video_data3[139:0]),
			.in_video_data4	(in_video_data4[139:0]),
			.in_video_data5	(in_video_data5[139:0]),
			.in_video_data6	(in_video_data6[139:0]),
			.in_video_data7	(in_video_data7[139:0]),
			.in_video_data_vld0(in_video_data_vld0),
			.in_video_data_vld1(in_video_data_vld1),
			.in_video_data_vld2(in_video_data_vld2),
			.in_video_data_vld3(in_video_data_vld3),
			.in_video_data_vld4(in_video_data_vld4),
			.in_video_data_vld5(in_video_data_vld5),
			.in_video_data_vld6(in_video_data_vld6),
			.in_video_data_vld7(in_video_data_vld7),
			.line_end0	(line_end0),
			.line_end1	(line_end1),
			.line_end2	(line_end2),
			.line_end3	(line_end3),
			.line_end4	(line_end4),
			.line_end5	(line_end5),
			.line_end6	(line_end6),
			.line_end7	(line_end7),
			.line_end_vld0	(line_end_vld_pipe0_aggregator1), // Templated
			.line_end_vld1	(line_end_vld_pipe1_aggregator1), // Templated
			.line_end_vld2	(line_end_vld_pipe2_aggregator1), // Templated
			.line_end_vld3	(line_end_vld_pipe3_aggregator1), // Templated
			.line_end_vld4	(line_end_vld_pipe4_aggregator1), // Templated
			.line_end_vld5	(line_end_vld_pipe5_aggregator1), // Templated
			.line_end_vld6	(line_end_vld_pipe6_aggregator1), // Templated
			.line_end_vld7	(line_end_vld_pipe7_aggregator1), // Templated
			.master_pipe	(sch1_master_pipe[1:0]), // Templated
			.pipe0_aggre_en	(sch1_pipe0_aggre_en),	 // Templated
			.pipe0_concat_en(sch1_pipe0_concat_en),	 // Templated
			.pipe1_aggre_en	(sch1_pipe1_aggre_en),	 // Templated
			.pipe1_concat_en(sch1_pipe1_concat_en),	 // Templated
			.pipe2_aggre_en	(sch1_pipe2_aggre_en),	 // Templated
			.pipe2_concat_en(sch1_pipe2_concat_en),	 // Templated
			.pipe3_aggre_en	(sch1_pipe3_aggre_en),	 // Templated
			.pipe3_concat_en(sch1_pipe3_concat_en),	 // Templated
			.pipe4_aggre_en	(sch1_pipe4_aggre_en),	 // Templated
			.pipe5_aggre_en	(sch1_pipe5_aggre_en),	 // Templated
			.pipe6_aggre_en	(sch1_pipe6_aggre_en),	 // Templated
			.pipe7_aggre_en	(sch1_pipe7_aggre_en),	 // Templated
			.pipe_frame_active(pipe_frame_active[3:0]),
			.reg_app_aggr_idi_crc_chk_en(reg_app_aggr_idi_crc_chk_en[1]), // Templated
			.reg_app_aggr_vc_bit_override_en(reg_app_aggr1_vc_bit_override_en[2:0]), // Templated
			.reg_app_aggr_vc_bit_override_value(reg_app_aggr1_vc_bit_override_value[2:0]), // Templated
			.reg_clear_send_pkt_cnt_lp_pf(reg_clear_send_pkt_cnt_lp_pf_aggr1), // Templated
			.reg_clear_send_pkt_cnt_lp_ph(reg_clear_send_pkt_cnt_lp_ph_aggr1), // Templated
			.reg_clear_send_pkt_cnt_sp_fe(reg_clear_send_pkt_cnt_sp_fe_aggr1), // Templated
			.reg_clear_send_pkt_cnt_sp_fs(reg_clear_send_pkt_cnt_sp_fs_aggr1), // Templated
			.reg_clear_send_pkt_cnt_sp_le(reg_clear_send_pkt_cnt_sp_le_aggr1), // Templated
			.reg_clear_send_pkt_cnt_sp_ls(reg_clear_send_pkt_cnt_sp_ls_aggr1), // Templated
			.reg_delete_lp_depend_on_wc_mux(reg_delete_lp_depend_on_wc_mux),
			.reg_send_pkt_match_lp_dt(reg_send_pkt_match_lp_dt_aggr1[5:0]), // Templated
			.reg_send_pkt_match_lp_dt_en(reg_send_pkt_match_lp_dt_en_aggr1), // Templated
			.reg_sync_aggr_auto_mask_en(reg_sync_aggr_auto_mask_en[3:0]),
			.reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
			.reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
			.reg_sync_aggr_force_video_mask(reg_sync_aggr_force_video_mask[3:0]),
			.reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_1_video_mask_latch_reset), // Templated
			.reg_sync_aggr_video_mask_restart(reg_sync_aggr_video_mask_restart[3:0]),
			.reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
			.reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
			.reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[2:0]),
			.reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
			.reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
			.video_loss0	(video_loss0),
			.video_loss1	(video_loss1),
			.video_loss2	(video_loss2),
			.video_loss3	(video_loss3),
			.video_pipe_data_aggre_bypass(video_pipe1_data_aggre_bypass[139:0]), // Templated
			.video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
			.video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
			.video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
			.video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
			.video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
			.video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
			.video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
			.video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
			.video_pipe_vld_aggre_bypass(video_pipe1_vld_aggre_bypass)); // Templated

as6d_app_aggr_lane#(/*AUTOINSTPARAM*/
		    // Parameters
		    .VIDEO_DATA_SIZE	(140),			 // Templated
		    .DATA_PARITY_WIDTH	(21),			 // Templated
		    .AGGR_ID		(2'd2))			 // Templated
u2_as6d_app_aggr_lane  (
					     .up_state0		(sch2_up_state0),
					     .up_state1		(sch2_up_state1),
					     .up_state2		(sch2_up_state2),
					     .up_state3		(sch2_up_state3),
			             .up_state4	    (sch2_up_state4),
			             .up_state5	    (sch2_up_state5),
			             .up_state6	    (sch2_up_state6),
			             .up_state7	    (sch2_up_state7),
						 /*AUTOINST*/
			// Outputs
			.ack_aggre	(sch2_ack_aggre[7:0]),	 // Templated
			.ack_concat	(sch2_ack_concat[3:0]),	 // Templated
			.aggre_busy	(sch2_aggre_busy),	 // Templated
			.app_aggr_idi_crc_err_int(app_aggr_idi_crc_err_int2), // Templated
			.csi2device_idi_byte_en(csi2device2_idi_byte_en[3:0]), // Templated
			.csi2device_idi_data(csi2device2_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
			.csi2device_idi_data_en(csi2device2_idi_data_en), // Templated
			.csi2device_idi_data_parity(csi2device2_idi_data_parity[20:0]), // Templated
			.csi2device_idi_data_type(csi2device2_idi_data_type[5:0]), // Templated
			.csi2device_idi_header_en(csi2device2_idi_header_en), // Templated
			.csi2device_idi_tunnel_mode_en(csi2device2_idi_tunnel_mode_en), // Templated
			.csi2device_idi_virtual_channel(csi2device2_idi_virtual_channel[1:0]), // Templated
			.csi2device_idi_virtual_channel_x(csi2device2_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
			.csi2device_idi_word_count(csi2device2_idi_word_count[15:0]), // Templated
			.current_state	(sch2_cs[3:0]),		 // Templated
			.line_end_aggre	(sch2_line_end_aggre[7:0]), // Templated
			.line_end_concat(sch2_line_end_concat[3:0]), // Templated
			.pipe0_wr_mode	(),			 // Templated
			.pipe0_wr_mode_strobe(),		 // Templated
			.pipe1_wr_mode	(),			 // Templated
			.pipe1_wr_mode_strobe(),		 // Templated
			.pipe2_wr_mode	(),			 // Templated
			.pipe2_wr_mode_strobe(),		 // Templated
			.pipe3_wr_mode	(),			 // Templated
			.pipe3_wr_mode_strobe(),		 // Templated
			.pipe_clear_bit_map(),			 // Templated
			.reg_rd_send_pkt_cnt_lp_pf(reg_rd_send_pkt_cnt_lp_pf_aggr2[31:0]), // Templated
			.reg_rd_send_pkt_cnt_lp_ph(reg_rd_send_pkt_cnt_lp_ph_aggr2[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fe(reg_rd_send_pkt_cnt_sp_fe_aggr2[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fs(reg_rd_send_pkt_cnt_sp_fs_aggr2[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_le(reg_rd_send_pkt_cnt_sp_le_aggr2[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_ls(reg_rd_send_pkt_cnt_sp_ls_aggr2[31:0]), // Templated
			.sch_data_type_align_fail_int(sch_data_type_align_fail_int2), // Templated
			.up_state_aggre	(sch2_up_state_aggre[7:0]), // Templated
			.up_state_concat(sch2_up_state_concat[3:0]), // Templated
			.sch2post_video_data_vld(sch2post_video_data_vld2), // Templated
			// Inputs
			.ack0		(ack0),
			.ack1		(ack1),
			.ack2		(ack2),
			.ack3		(ack3),
			.ack4		(ack4),
			.ack5		(ack5),
			.ack6		(ack6),
			.ack7		(ack7),
			.ack_pre0	(ack_pre0),
			.ack_pre1	(ack_pre1),
			.ack_pre2	(ack_pre2),
			.ack_pre3	(ack_pre3),
			.ack_pre4	(ack_pre4),
			.ack_pre5	(ack_pre5),
			.ack_pre6	(ack_pre6),
			.ack_pre7	(ack_pre7),
			.ack_vld0	(ack_vld_pipe0_aggregator2), // Templated
			.ack_vld1	(ack_vld_pipe1_aggregator2), // Templated
			.ack_vld2	(ack_vld_pipe2_aggregator2), // Templated
			.ack_vld3	(ack_vld_pipe3_aggregator2), // Templated
			.ack_vld4	(ack_vld_pipe4_aggregator2), // Templated
			.ack_vld5	(ack_vld_pipe5_aggregator2), // Templated
			.ack_vld6	(ack_vld_pipe6_aggregator2), // Templated
			.ack_vld7	(ack_vld_pipe7_aggregator2), // Templated
			.aggre_clk	(aggre_clk2),		 // Templated
			.aggre_clk_rst_n(aggre_clk_rst_n2),	 // Templated
			.aggre_mode	(sch2_aggre_mode[1:0]),	 // Templated
			.app_aggregation_bypass(app_aggregation_bypass), // Templated
			.clk_1M		(clk_1M),
			.csi2device_idi_anti_halt(csi2device2_idi_anti_halt), // Templated
			.csi2device_idi_halt(csi2device2_idi_halt), // Templated
			.empty0		(video_data_fifo_empty0), // Templated
			.empty1		(video_data_fifo_empty1), // Templated
			.empty2		(video_data_fifo_empty2), // Templated
			.empty3		(video_data_fifo_empty3), // Templated
			.empty4		(video_data_fifo_empty4), // Templated
			.empty5		(video_data_fifo_empty5), // Templated
			.empty6		(video_data_fifo_empty6), // Templated
			.empty7		(video_data_fifo_empty7), // Templated
			.empty_vld0	(empty_vld_pipe0_aggregator2), // Templated
			.empty_vld1	(empty_vld_pipe1_aggregator2), // Templated
			.empty_vld2	(empty_vld_pipe2_aggregator2), // Templated
			.empty_vld3	(empty_vld_pipe3_aggregator2), // Templated
			.empty_vld4	(empty_vld_pipe4_aggregator2), // Templated
			.empty_vld5	(empty_vld_pipe5_aggregator2), // Templated
			.empty_vld6	(empty_vld_pipe6_aggregator2), // Templated
			.empty_vld7	(empty_vld_pipe7_aggregator2), // Templated
			.fifo_wr_clk_0	(fifo_wr_clk_0),
			.fifo_wr_clk_1	(fifo_wr_clk_1),
			.fifo_wr_clk_2	(fifo_wr_clk_2),
			.fifo_wr_clk_3	(fifo_wr_clk_3),
			.fifo_wr_clk_rst_n_0(fifo_wr_clk_rst_n_0),
			.fifo_wr_clk_rst_n_1(fifo_wr_clk_rst_n_1),
			.fifo_wr_clk_rst_n_2(fifo_wr_clk_rst_n_2),
			.fifo_wr_clk_rst_n_3(fifo_wr_clk_rst_n_3),
			.frame_sync_lock(sch2_frame_sync_lock),	 // Templated
			.fse_filter	(sch2_fse_filter),	 // Templated
			.idi_datatype_0	(idi_datatype_0[5:0]),
			.idi_datatype_1	(idi_datatype_1[5:0]),
			.idi_datatype_2	(idi_datatype_2[5:0]),
			.idi_datatype_3	(idi_datatype_3[5:0]),
			.idi_header_en_0(idi_header_en_0),
			.idi_header_en_1(idi_header_en_1),
			.idi_header_en_2(idi_header_en_2),
			.idi_header_en_3(idi_header_en_3),
			.idi_linecount_0(idi_linecount_0[2:0]),
			.idi_linecount_1(idi_linecount_1[2:0]),
			.idi_linecount_2(idi_linecount_2[2:0]),
			.idi_linecount_3(idi_linecount_3[2:0]),
			.idi_wordcount_0(idi_wordcount_0[15:0]),
			.idi_wordcount_1(idi_wordcount_1[15:0]),
			.idi_wordcount_2(idi_wordcount_2[15:0]),
			.idi_wordcount_3(idi_wordcount_3[15:0]),
			.in_video_data0	(in_video_data0[139:0]),
			.in_video_data1	(in_video_data1[139:0]),
			.in_video_data2	(in_video_data2[139:0]),
			.in_video_data3	(in_video_data3[139:0]),
			.in_video_data4	(in_video_data4[139:0]),
			.in_video_data5	(in_video_data5[139:0]),
			.in_video_data6	(in_video_data6[139:0]),
			.in_video_data7	(in_video_data7[139:0]),
			.in_video_data_vld0(in_video_data_vld0),
			.in_video_data_vld1(in_video_data_vld1),
			.in_video_data_vld2(in_video_data_vld2),
			.in_video_data_vld3(in_video_data_vld3),
			.in_video_data_vld4(in_video_data_vld4),
			.in_video_data_vld5(in_video_data_vld5),
			.in_video_data_vld6(in_video_data_vld6),
			.in_video_data_vld7(in_video_data_vld7),
			.line_end0	(line_end0),
			.line_end1	(line_end1),
			.line_end2	(line_end2),
			.line_end3	(line_end3),
			.line_end4	(line_end4),
			.line_end5	(line_end5),
			.line_end6	(line_end6),
			.line_end7	(line_end7),
			.line_end_vld0	(line_end_vld_pipe0_aggregator2), // Templated
			.line_end_vld1	(line_end_vld_pipe1_aggregator2), // Templated
			.line_end_vld2	(line_end_vld_pipe2_aggregator2), // Templated
			.line_end_vld3	(line_end_vld_pipe3_aggregator2), // Templated
			.line_end_vld4	(line_end_vld_pipe4_aggregator2), // Templated
			.line_end_vld5	(line_end_vld_pipe5_aggregator2), // Templated
			.line_end_vld6	(line_end_vld_pipe6_aggregator2), // Templated
			.line_end_vld7	(line_end_vld_pipe7_aggregator2), // Templated
			.master_pipe	(sch2_master_pipe[1:0]), // Templated
			.pipe0_aggre_en	(sch2_pipe0_aggre_en),	 // Templated
			.pipe0_concat_en(sch2_pipe0_concat_en),	 // Templated
			.pipe1_aggre_en	(sch2_pipe1_aggre_en),	 // Templated
			.pipe1_concat_en(sch2_pipe1_concat_en),	 // Templated
			.pipe2_aggre_en	(sch2_pipe2_aggre_en),	 // Templated
			.pipe2_concat_en(sch2_pipe2_concat_en),	 // Templated
			.pipe3_aggre_en	(sch2_pipe3_aggre_en),	 // Templated
			.pipe3_concat_en(sch2_pipe3_concat_en),	 // Templated
			.pipe4_aggre_en	(sch2_pipe4_aggre_en),	 // Templated
			.pipe5_aggre_en	(sch2_pipe5_aggre_en),	 // Templated
			.pipe6_aggre_en	(sch2_pipe6_aggre_en),	 // Templated
			.pipe7_aggre_en	(sch2_pipe7_aggre_en),	 // Templated
			.pipe_frame_active(pipe_frame_active[3:0]),
			.reg_app_aggr_idi_crc_chk_en(reg_app_aggr_idi_crc_chk_en[2]), // Templated
			.reg_app_aggr_vc_bit_override_en(reg_app_aggr2_vc_bit_override_en[2:0]), // Templated
			.reg_app_aggr_vc_bit_override_value(reg_app_aggr2_vc_bit_override_value[2:0]), // Templated
			.reg_clear_send_pkt_cnt_lp_pf(reg_clear_send_pkt_cnt_lp_pf_aggr2), // Templated
			.reg_clear_send_pkt_cnt_lp_ph(reg_clear_send_pkt_cnt_lp_ph_aggr2), // Templated
			.reg_clear_send_pkt_cnt_sp_fe(reg_clear_send_pkt_cnt_sp_fe_aggr2), // Templated
			.reg_clear_send_pkt_cnt_sp_fs(reg_clear_send_pkt_cnt_sp_fs_aggr2), // Templated
			.reg_clear_send_pkt_cnt_sp_le(reg_clear_send_pkt_cnt_sp_le_aggr2), // Templated
			.reg_clear_send_pkt_cnt_sp_ls(reg_clear_send_pkt_cnt_sp_ls_aggr2), // Templated
			.reg_delete_lp_depend_on_wc_mux(reg_delete_lp_depend_on_wc_mux),
			.reg_send_pkt_match_lp_dt(reg_send_pkt_match_lp_dt_aggr2[5:0]), // Templated
			.reg_send_pkt_match_lp_dt_en(reg_send_pkt_match_lp_dt_en_aggr2), // Templated
			.reg_sync_aggr_auto_mask_en(reg_sync_aggr_auto_mask_en[3:0]),
			.reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
			.reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
			.reg_sync_aggr_force_video_mask(reg_sync_aggr_force_video_mask[3:0]),
			.reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_2_video_mask_latch_reset), // Templated
			.reg_sync_aggr_video_mask_restart(reg_sync_aggr_video_mask_restart[3:0]),
			.reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
			.reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
			.reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[2:0]),
			.reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
			.reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
			.video_loss0	(video_loss0),
			.video_loss1	(video_loss1),
			.video_loss2	(video_loss2),
			.video_loss3	(video_loss3),
			.video_pipe_data_aggre_bypass(video_pipe2_data_aggre_bypass[139:0]), // Templated
			.video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
			.video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
			.video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
			.video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
			.video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
			.video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
			.video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
			.video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
			.video_pipe_vld_aggre_bypass(video_pipe2_vld_aggre_bypass)); // Templated

as6d_app_aggr_lane#(/*AUTOINSTPARAM*/
		    // Parameters
		    .VIDEO_DATA_SIZE	(140),			 // Templated
		    .DATA_PARITY_WIDTH	(21),			 // Templated
		    .AGGR_ID		(2'd3))			 // Templated
u3_as6d_app_aggr_lane  (
					     .up_state0		(sch3_up_state0),
					     .up_state1		(sch3_up_state1),
					     .up_state2		(sch3_up_state2),
					     .up_state3		(sch3_up_state3),
			             .up_state4	    (sch3_up_state4),
			             .up_state5	    (sch3_up_state5),
			             .up_state6	    (sch3_up_state6),
			             .up_state7	    (sch3_up_state7),
						 /*AUTOINST*/
			// Outputs
			.ack_aggre	(sch3_ack_aggre[7:0]),	 // Templated
			.ack_concat	(sch3_ack_concat[3:0]),	 // Templated
			.aggre_busy	(sch3_aggre_busy),	 // Templated
			.app_aggr_idi_crc_err_int(app_aggr_idi_crc_err_int3), // Templated
			.csi2device_idi_byte_en(csi2device3_idi_byte_en[3:0]), // Templated
			.csi2device_idi_data(csi2device3_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
			.csi2device_idi_data_en(csi2device3_idi_data_en), // Templated
			.csi2device_idi_data_parity(csi2device3_idi_data_parity[20:0]), // Templated
			.csi2device_idi_data_type(csi2device3_idi_data_type[5:0]), // Templated
			.csi2device_idi_header_en(csi2device3_idi_header_en), // Templated
			.csi2device_idi_tunnel_mode_en(csi2device3_idi_tunnel_mode_en), // Templated
			.csi2device_idi_virtual_channel(csi2device3_idi_virtual_channel[1:0]), // Templated
			.csi2device_idi_virtual_channel_x(csi2device3_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
			.csi2device_idi_word_count(csi2device3_idi_word_count[15:0]), // Templated
			.current_state	(sch3_cs[3:0]),		 // Templated
			.line_end_aggre	(sch3_line_end_aggre[7:0]), // Templated
			.line_end_concat(sch3_line_end_concat[3:0]), // Templated
			.pipe0_wr_mode	(),			 // Templated
			.pipe0_wr_mode_strobe(),		 // Templated
			.pipe1_wr_mode	(),			 // Templated
			.pipe1_wr_mode_strobe(),		 // Templated
			.pipe2_wr_mode	(),			 // Templated
			.pipe2_wr_mode_strobe(),		 // Templated
			.pipe3_wr_mode	(),			 // Templated
			.pipe3_wr_mode_strobe(),		 // Templated
			.pipe_clear_bit_map(),			 // Templated
			.reg_rd_send_pkt_cnt_lp_pf(reg_rd_send_pkt_cnt_lp_pf_aggr3[31:0]), // Templated
			.reg_rd_send_pkt_cnt_lp_ph(reg_rd_send_pkt_cnt_lp_ph_aggr3[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fe(reg_rd_send_pkt_cnt_sp_fe_aggr3[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_fs(reg_rd_send_pkt_cnt_sp_fs_aggr3[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_le(reg_rd_send_pkt_cnt_sp_le_aggr3[31:0]), // Templated
			.reg_rd_send_pkt_cnt_sp_ls(reg_rd_send_pkt_cnt_sp_ls_aggr3[31:0]), // Templated
			.sch_data_type_align_fail_int(sch_data_type_align_fail_int3), // Templated
			.up_state_aggre	(sch3_up_state_aggre[7:0]), // Templated
			.up_state_concat(sch3_up_state_concat[3:0]), // Templated
			.sch2post_video_data_vld(sch2post_video_data_vld3), // Templated
			// Inputs
			.ack0		(ack0),
			.ack1		(ack1),
			.ack2		(ack2),
			.ack3		(ack3),
			.ack4		(ack4),
			.ack5		(ack5),
			.ack6		(ack6),
			.ack7		(ack7),
			.ack_pre0	(ack_pre0),
			.ack_pre1	(ack_pre1),
			.ack_pre2	(ack_pre2),
			.ack_pre3	(ack_pre3),
			.ack_pre4	(ack_pre4),
			.ack_pre5	(ack_pre5),
			.ack_pre6	(ack_pre6),
			.ack_pre7	(ack_pre7),
			.ack_vld0	(ack_vld_pipe0_aggregator3), // Templated
			.ack_vld1	(ack_vld_pipe1_aggregator3), // Templated
			.ack_vld2	(ack_vld_pipe2_aggregator3), // Templated
			.ack_vld3	(ack_vld_pipe3_aggregator3), // Templated
			.ack_vld4	(ack_vld_pipe4_aggregator3), // Templated
			.ack_vld5	(ack_vld_pipe5_aggregator3), // Templated
			.ack_vld6	(ack_vld_pipe6_aggregator3), // Templated
			.ack_vld7	(ack_vld_pipe7_aggregator3), // Templated
			.aggre_clk	(aggre_clk3),		 // Templated
			.aggre_clk_rst_n(aggre_clk_rst_n3),	 // Templated
			.aggre_mode	(sch3_aggre_mode[1:0]),	 // Templated
			.app_aggregation_bypass(app_aggregation_bypass), // Templated
			.clk_1M		(clk_1M),
			.csi2device_idi_anti_halt(csi2device3_idi_anti_halt), // Templated
			.csi2device_idi_halt(csi2device3_idi_halt), // Templated
			.empty0		(video_data_fifo_empty0), // Templated
			.empty1		(video_data_fifo_empty1), // Templated
			.empty2		(video_data_fifo_empty2), // Templated
			.empty3		(video_data_fifo_empty3), // Templated
			.empty4		(video_data_fifo_empty4), // Templated
			.empty5		(video_data_fifo_empty5), // Templated
			.empty6		(video_data_fifo_empty6), // Templated
			.empty7		(video_data_fifo_empty7), // Templated
			.empty_vld0	(empty_vld_pipe0_aggregator3), // Templated
			.empty_vld1	(empty_vld_pipe1_aggregator3), // Templated
			.empty_vld2	(empty_vld_pipe2_aggregator3), // Templated
			.empty_vld3	(empty_vld_pipe3_aggregator3), // Templated
			.empty_vld4	(empty_vld_pipe4_aggregator3), // Templated
			.empty_vld5	(empty_vld_pipe5_aggregator3), // Templated
			.empty_vld6	(empty_vld_pipe6_aggregator3), // Templated
			.empty_vld7	(empty_vld_pipe7_aggregator3), // Templated
			.fifo_wr_clk_0	(fifo_wr_clk_0),
			.fifo_wr_clk_1	(fifo_wr_clk_1),
			.fifo_wr_clk_2	(fifo_wr_clk_2),
			.fifo_wr_clk_3	(fifo_wr_clk_3),
			.fifo_wr_clk_rst_n_0(fifo_wr_clk_rst_n_0),
			.fifo_wr_clk_rst_n_1(fifo_wr_clk_rst_n_1),
			.fifo_wr_clk_rst_n_2(fifo_wr_clk_rst_n_2),
			.fifo_wr_clk_rst_n_3(fifo_wr_clk_rst_n_3),
			.frame_sync_lock(sch3_frame_sync_lock),	 // Templated
			.fse_filter	(sch3_fse_filter),	 // Templated
			.idi_datatype_0	(idi_datatype_0[5:0]),
			.idi_datatype_1	(idi_datatype_1[5:0]),
			.idi_datatype_2	(idi_datatype_2[5:0]),
			.idi_datatype_3	(idi_datatype_3[5:0]),
			.idi_header_en_0(idi_header_en_0),
			.idi_header_en_1(idi_header_en_1),
			.idi_header_en_2(idi_header_en_2),
			.idi_header_en_3(idi_header_en_3),
			.idi_linecount_0(idi_linecount_0[2:0]),
			.idi_linecount_1(idi_linecount_1[2:0]),
			.idi_linecount_2(idi_linecount_2[2:0]),
			.idi_linecount_3(idi_linecount_3[2:0]),
			.idi_wordcount_0(idi_wordcount_0[15:0]),
			.idi_wordcount_1(idi_wordcount_1[15:0]),
			.idi_wordcount_2(idi_wordcount_2[15:0]),
			.idi_wordcount_3(idi_wordcount_3[15:0]),
			.in_video_data0	(in_video_data0[139:0]),
			.in_video_data1	(in_video_data1[139:0]),
			.in_video_data2	(in_video_data2[139:0]),
			.in_video_data3	(in_video_data3[139:0]),
			.in_video_data4	(in_video_data4[139:0]),
			.in_video_data5	(in_video_data5[139:0]),
			.in_video_data6	(in_video_data6[139:0]),
			.in_video_data7	(in_video_data7[139:0]),
			.in_video_data_vld0(in_video_data_vld0),
			.in_video_data_vld1(in_video_data_vld1),
			.in_video_data_vld2(in_video_data_vld2),
			.in_video_data_vld3(in_video_data_vld3),
			.in_video_data_vld4(in_video_data_vld4),
			.in_video_data_vld5(in_video_data_vld5),
			.in_video_data_vld6(in_video_data_vld6),
			.in_video_data_vld7(in_video_data_vld7),
			.line_end0	(line_end0),
			.line_end1	(line_end1),
			.line_end2	(line_end2),
			.line_end3	(line_end3),
			.line_end4	(line_end4),
			.line_end5	(line_end5),
			.line_end6	(line_end6),
			.line_end7	(line_end7),
			.line_end_vld0	(line_end_vld_pipe0_aggregator3), // Templated
			.line_end_vld1	(line_end_vld_pipe1_aggregator3), // Templated
			.line_end_vld2	(line_end_vld_pipe2_aggregator3), // Templated
			.line_end_vld3	(line_end_vld_pipe3_aggregator3), // Templated
			.line_end_vld4	(line_end_vld_pipe4_aggregator3), // Templated
			.line_end_vld5	(line_end_vld_pipe5_aggregator3), // Templated
			.line_end_vld6	(line_end_vld_pipe6_aggregator3), // Templated
			.line_end_vld7	(line_end_vld_pipe7_aggregator3), // Templated
			.master_pipe	(sch3_master_pipe[1:0]), // Templated
			.pipe0_aggre_en	(sch3_pipe0_aggre_en),	 // Templated
			.pipe0_concat_en(sch3_pipe0_concat_en),	 // Templated
			.pipe1_aggre_en	(sch3_pipe1_aggre_en),	 // Templated
			.pipe1_concat_en(sch3_pipe1_concat_en),	 // Templated
			.pipe2_aggre_en	(sch3_pipe2_aggre_en),	 // Templated
			.pipe2_concat_en(sch3_pipe2_concat_en),	 // Templated
			.pipe3_aggre_en	(sch3_pipe3_aggre_en),	 // Templated
			.pipe3_concat_en(sch3_pipe3_concat_en),	 // Templated
			.pipe4_aggre_en	(sch3_pipe4_aggre_en),	 // Templated
			.pipe5_aggre_en	(sch3_pipe5_aggre_en),	 // Templated
			.pipe6_aggre_en	(sch3_pipe6_aggre_en),	 // Templated
			.pipe7_aggre_en	(sch3_pipe7_aggre_en),	 // Templated
			.pipe_frame_active(pipe_frame_active[3:0]),
			.reg_app_aggr_idi_crc_chk_en(reg_app_aggr_idi_crc_chk_en[3]), // Templated
			.reg_app_aggr_vc_bit_override_en(reg_app_aggr3_vc_bit_override_en[2:0]), // Templated
			.reg_app_aggr_vc_bit_override_value(reg_app_aggr3_vc_bit_override_value[2:0]), // Templated
			.reg_clear_send_pkt_cnt_lp_pf(reg_clear_send_pkt_cnt_lp_pf_aggr3), // Templated
			.reg_clear_send_pkt_cnt_lp_ph(reg_clear_send_pkt_cnt_lp_ph_aggr3), // Templated
			.reg_clear_send_pkt_cnt_sp_fe(reg_clear_send_pkt_cnt_sp_fe_aggr3), // Templated
			.reg_clear_send_pkt_cnt_sp_fs(reg_clear_send_pkt_cnt_sp_fs_aggr3), // Templated
			.reg_clear_send_pkt_cnt_sp_le(reg_clear_send_pkt_cnt_sp_le_aggr3), // Templated
			.reg_clear_send_pkt_cnt_sp_ls(reg_clear_send_pkt_cnt_sp_ls_aggr3), // Templated
			.reg_delete_lp_depend_on_wc_mux(reg_delete_lp_depend_on_wc_mux),
			.reg_send_pkt_match_lp_dt(reg_send_pkt_match_lp_dt_aggr3[5:0]), // Templated
			.reg_send_pkt_match_lp_dt_en(reg_send_pkt_match_lp_dt_en_aggr3), // Templated
			.reg_sync_aggr_auto_mask_en(reg_sync_aggr_auto_mask_en[3:0]),
			.reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
			.reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
			.reg_sync_aggr_force_video_mask(reg_sync_aggr_force_video_mask[3:0]),
			.reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_3_video_mask_latch_reset), // Templated
			.reg_sync_aggr_video_mask_restart(reg_sync_aggr_video_mask_restart[3:0]),
			.reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
			.reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
			.reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[2:0]),
			.reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
			.reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
			.video_loss0	(video_loss0),
			.video_loss1	(video_loss1),
			.video_loss2	(video_loss2),
			.video_loss3	(video_loss3),
			.video_pipe_data_aggre_bypass(video_pipe3_data_aggre_bypass[139:0]), // Templated
			.video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
			.video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
			.video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
			.video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
			.video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
			.video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
			.video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
			.video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
			.video_pipe_vld_aggre_bypass(video_pipe3_vld_aggre_bypass)); // Templated

endmodule
