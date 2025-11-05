
module   as6d_app_sync (/*AUTOARG*/
   // Outputs
   pipe0_wr_mode, pipe1_wr_mode, pipe2_wr_mode, pipe3_wr_mode,
   pipe4_wr_mode, pipe5_wr_mode, pipe6_wr_mode, pipe7_wr_mode,
   sch0_frame_sync_lock, sch1_frame_sync_lock, sch2_frame_sync_lock,
   sch3_frame_sync_lock, pipe_fifo_full_clear,
   reg_vprbs_tx_gen_en_app_route_lane0_sync,
   reg_vprbs_tx_mode_app_route_lane0_sync,
   reg_vprbs_tx_order_app_route_lane0_sync,
   reg_vprbs_tx_pat_reset_app_route_lane0_sync,
   reg_vprbs_loopback_app_route_lane0_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane0_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane0_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane0_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane0_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane0_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane0_sync,
   reg_vprbs_rx_chk_en_app_route_lane0_sync,
   reg_vprbs_rx_mode_app_route_lane0_sync,
   reg_vprbs_rx_order_app_route_lane0_sync,
   reg_vprbs_rx_load_app_route_lane0_sync,
   reg_vprbs_rx_lock_continue_app_route_lane0_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane0_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane0_sync,
   reg_vprbs_rx_err_clear_app_route_lane0_sync,
   reg_vprbs_tx_gen_en_app_route_lane1_sync,
   reg_vprbs_tx_mode_app_route_lane1_sync,
   reg_vprbs_tx_order_app_route_lane1_sync,
   reg_vprbs_tx_pat_reset_app_route_lane1_sync,
   reg_vprbs_loopback_app_route_lane1_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane1_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane1_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane1_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane1_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane1_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane1_sync,
   reg_vprbs_rx_chk_en_app_route_lane1_sync,
   reg_vprbs_rx_mode_app_route_lane1_sync,
   reg_vprbs_rx_order_app_route_lane1_sync,
   reg_vprbs_rx_load_app_route_lane1_sync,
   reg_vprbs_rx_lock_continue_app_route_lane1_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane1_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane1_sync,
   reg_vprbs_rx_err_clear_app_route_lane1_sync,
   reg_vprbs_tx_gen_en_app_route_lane2_sync,
   reg_vprbs_tx_mode_app_route_lane2_sync,
   reg_vprbs_tx_order_app_route_lane2_sync,
   reg_vprbs_tx_pat_reset_app_route_lane2_sync,
   reg_vprbs_loopback_app_route_lane2_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane2_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane2_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane2_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane2_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane2_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane2_sync,
   reg_vprbs_rx_chk_en_app_route_lane2_sync,
   reg_vprbs_rx_mode_app_route_lane2_sync,
   reg_vprbs_rx_order_app_route_lane2_sync,
   reg_vprbs_rx_load_app_route_lane2_sync,
   reg_vprbs_rx_lock_continue_app_route_lane2_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane2_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane2_sync,
   reg_vprbs_rx_err_clear_app_route_lane2_sync,
   reg_vprbs_tx_gen_en_app_route_lane3_sync,
   reg_vprbs_tx_mode_app_route_lane3_sync,
   reg_vprbs_tx_order_app_route_lane3_sync,
   reg_vprbs_tx_pat_reset_app_route_lane3_sync,
   reg_vprbs_loopback_app_route_lane3_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane3_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane3_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane3_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane3_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane3_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane3_sync,
   reg_vprbs_rx_chk_en_app_route_lane3_sync,
   reg_vprbs_rx_mode_app_route_lane3_sync,
   reg_vprbs_rx_order_app_route_lane3_sync,
   reg_vprbs_rx_load_app_route_lane3_sync,
   reg_vprbs_rx_lock_continue_app_route_lane3_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane3_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane3_sync,
   reg_vprbs_rx_err_clear_app_route_lane3_sync,
   reg_vprbs_tx_gen_en_app_route_lane4_sync,
   reg_vprbs_tx_mode_app_route_lane4_sync,
   reg_vprbs_tx_order_app_route_lane4_sync,
   reg_vprbs_tx_pat_reset_app_route_lane4_sync,
   reg_vprbs_loopback_app_route_lane4_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane4_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane4_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane4_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane4_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane4_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane4_sync,
   reg_vprbs_rx_chk_en_app_route_lane4_sync,
   reg_vprbs_rx_mode_app_route_lane4_sync,
   reg_vprbs_rx_order_app_route_lane4_sync,
   reg_vprbs_rx_load_app_route_lane4_sync,
   reg_vprbs_rx_lock_continue_app_route_lane4_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane4_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane4_sync,
   reg_vprbs_rx_err_clear_app_route_lane4_sync,
   reg_vprbs_tx_gen_en_app_route_lane5_sync,
   reg_vprbs_tx_mode_app_route_lane5_sync,
   reg_vprbs_tx_order_app_route_lane5_sync,
   reg_vprbs_tx_pat_reset_app_route_lane5_sync,
   reg_vprbs_loopback_app_route_lane5_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane5_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane5_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane5_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane5_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane5_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane5_sync,
   reg_vprbs_rx_chk_en_app_route_lane5_sync,
   reg_vprbs_rx_mode_app_route_lane5_sync,
   reg_vprbs_rx_order_app_route_lane5_sync,
   reg_vprbs_rx_load_app_route_lane5_sync,
   reg_vprbs_rx_lock_continue_app_route_lane5_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane5_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane5_sync,
   reg_vprbs_rx_err_clear_app_route_lane5_sync,
   reg_vprbs_tx_gen_en_app_route_lane6_sync,
   reg_vprbs_tx_mode_app_route_lane6_sync,
   reg_vprbs_tx_order_app_route_lane6_sync,
   reg_vprbs_tx_pat_reset_app_route_lane6_sync,
   reg_vprbs_loopback_app_route_lane6_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane6_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane6_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane6_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane6_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane6_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane6_sync,
   reg_vprbs_rx_chk_en_app_route_lane6_sync,
   reg_vprbs_rx_mode_app_route_lane6_sync,
   reg_vprbs_rx_order_app_route_lane6_sync,
   reg_vprbs_rx_load_app_route_lane6_sync,
   reg_vprbs_rx_lock_continue_app_route_lane6_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane6_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane6_sync,
   reg_vprbs_rx_err_clear_app_route_lane6_sync,
   reg_vprbs_tx_gen_en_app_route_lane7_sync,
   reg_vprbs_tx_mode_app_route_lane7_sync,
   reg_vprbs_tx_order_app_route_lane7_sync,
   reg_vprbs_tx_pat_reset_app_route_lane7_sync,
   reg_vprbs_loopback_app_route_lane7_sync,
   reg_vprbs_tx_err_inject_en_app_route_lane7_sync,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane7_sync,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane7_sync,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane7_sync,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7_sync,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane7_sync,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7_sync,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane7_sync,
   reg_vprbs_rx_chk_en_app_route_lane7_sync,
   reg_vprbs_rx_mode_app_route_lane7_sync,
   reg_vprbs_rx_order_app_route_lane7_sync,
   reg_vprbs_rx_load_app_route_lane7_sync,
   reg_vprbs_rx_lock_continue_app_route_lane7_sync,
   reg_vprbs_rx_locked_match_cnt_app_route_lane7_sync,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane7_sync,
   reg_vprbs_rx_err_clear_app_route_lane7_sync, app_async_rst_req,
   // Inputs
   video_data_fwft_fifo_ovf_int7, video_data_fwft_fifo_ovf_int6,
   video_data_fwft_fifo_ovf_int5, video_data_fwft_fifo_ovf_int4,
   video_data_fwft_fifo_ovf_int3, video_data_fwft_fifo_ovf_int2,
   video_data_fwft_fifo_ovf_int1, video_data_fwft_fifo_ovf_int0,
   sch_data_type_align_fail_int3, sch_data_type_align_fail_int2,
   sch_data_type_align_fail_int1, sch_data_type_align_fail_int0,
   reg_video_data_fwft_fifo_ovf_int_mask7,
   reg_video_data_fwft_fifo_ovf_int_mask6,
   reg_video_data_fwft_fifo_ovf_int_mask5,
   reg_video_data_fwft_fifo_ovf_int_mask4,
   reg_video_data_fwft_fifo_ovf_int_mask3,
   reg_video_data_fwft_fifo_ovf_int_mask2,
   reg_video_data_fwft_fifo_ovf_int_mask1,
   reg_video_data_fwft_fifo_ovf_int_mask0,
   reg_sch_data_type_align_fail_int_mask3,
   reg_sch_data_type_align_fail_int_mask2,
   reg_sch_data_type_align_fail_int_mask1,
   reg_sch_data_type_align_fail_int_mask0, treed_reg_bank_clk,
   treed_reg_bank_clk_reset_n, aggre_clk0, fifo_wrclk0, fifo_rdclk0,
   aggre_clk_rst_n0, fifo_wrclk_rst_n0, fifo_rdclk_rst_n0, aggre_clk1,
   fifo_wrclk1, fifo_rdclk1, aggre_clk_rst_n1, fifo_wrclk_rst_n1,
   fifo_rdclk_rst_n1, aggre_clk2, fifo_wrclk2, fifo_rdclk2,
   aggre_clk_rst_n2, fifo_wrclk_rst_n2, fifo_rdclk_rst_n2, aggre_clk3,
   fifo_wrclk3, fifo_rdclk3, aggre_clk_rst_n3, fifo_wrclk_rst_n3,
   fifo_rdclk_rst_n3, fifo_wrclk4, fifo_rdclk4, fifo_wrclk_rst_n4,
   fifo_rdclk_rst_n4, fifo_wrclk5, fifo_rdclk5, fifo_wrclk_rst_n5,
   fifo_rdclk_rst_n5, fifo_wrclk6, fifo_rdclk6, fifo_wrclk_rst_n6,
   fifo_rdclk_rst_n6, fifo_wrclk7, fifo_rdclk7, fifo_wrclk_rst_n7,
   fifo_rdclk_rst_n7, reg_pipe0_wr_mode, reg_pipe1_wr_mode,
   reg_pipe2_wr_mode, reg_pipe3_wr_mode, reg_pipe4_wr_mode,
   reg_pipe5_wr_mode, reg_pipe6_wr_mode, reg_pipe7_wr_mode,
   reg_all_pipe_wr_mode_strobe, reg_sch0_frame_sync_lock_force,
   reg_sch1_frame_sync_lock_force, reg_sch2_frame_sync_lock_force,
   reg_sch3_frame_sync_lock_force, reg_sch0_frame_sync_lock,
   reg_sch1_frame_sync_lock, reg_sch2_frame_sync_lock,
   reg_sch3_frame_sync_lock, gpio2app_sch0_frame_sync_lock,
   gpio2app_sch1_frame_sync_lock, gpio2app_sch2_frame_sync_lock,
   gpio2app_sch3_frame_sync_lock, reg_pipe_fifo_full_clear,
   reg_pipe_fifo_full_clear_last_four,
   reg_vprbs_tx_gen_en_app_route_lane0,
   reg_vprbs_tx_mode_app_route_lane0,
   reg_vprbs_tx_order_app_route_lane0,
   reg_vprbs_tx_pat_reset_app_route_lane0,
   reg_vprbs_loopback_app_route_lane0,
   reg_vprbs_tx_err_inject_en_app_route_lane0,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane0,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane0,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane0,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane0,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane0,
   reg_vprbs_rx_chk_en_app_route_lane0,
   reg_vprbs_rx_mode_app_route_lane0,
   reg_vprbs_rx_order_app_route_lane0,
   reg_vprbs_rx_load_app_route_lane0,
   reg_vprbs_rx_lock_continue_app_route_lane0,
   reg_vprbs_rx_locked_match_cnt_app_route_lane0,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane0,
   reg_vprbs_rx_err_clear_app_route_lane0,
   reg_vprbs_tx_gen_en_app_route_lane1,
   reg_vprbs_tx_mode_app_route_lane1,
   reg_vprbs_tx_order_app_route_lane1,
   reg_vprbs_tx_pat_reset_app_route_lane1,
   reg_vprbs_loopback_app_route_lane1,
   reg_vprbs_tx_err_inject_en_app_route_lane1,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane1,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane1,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane1,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane1,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane1,
   reg_vprbs_rx_chk_en_app_route_lane1,
   reg_vprbs_rx_mode_app_route_lane1,
   reg_vprbs_rx_order_app_route_lane1,
   reg_vprbs_rx_load_app_route_lane1,
   reg_vprbs_rx_lock_continue_app_route_lane1,
   reg_vprbs_rx_locked_match_cnt_app_route_lane1,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane1,
   reg_vprbs_rx_err_clear_app_route_lane1,
   reg_vprbs_tx_gen_en_app_route_lane2,
   reg_vprbs_tx_mode_app_route_lane2,
   reg_vprbs_tx_order_app_route_lane2,
   reg_vprbs_tx_pat_reset_app_route_lane2,
   reg_vprbs_loopback_app_route_lane2,
   reg_vprbs_tx_err_inject_en_app_route_lane2,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane2,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane2,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane2,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane2,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane2,
   reg_vprbs_rx_chk_en_app_route_lane2,
   reg_vprbs_rx_mode_app_route_lane2,
   reg_vprbs_rx_order_app_route_lane2,
   reg_vprbs_rx_load_app_route_lane2,
   reg_vprbs_rx_lock_continue_app_route_lane2,
   reg_vprbs_rx_locked_match_cnt_app_route_lane2,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane2,
   reg_vprbs_rx_err_clear_app_route_lane2,
   reg_vprbs_tx_gen_en_app_route_lane3,
   reg_vprbs_tx_mode_app_route_lane3,
   reg_vprbs_tx_order_app_route_lane3,
   reg_vprbs_tx_pat_reset_app_route_lane3,
   reg_vprbs_loopback_app_route_lane3,
   reg_vprbs_tx_err_inject_en_app_route_lane3,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane3,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane3,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane3,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane3,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane3,
   reg_vprbs_rx_chk_en_app_route_lane3,
   reg_vprbs_rx_mode_app_route_lane3,
   reg_vprbs_rx_order_app_route_lane3,
   reg_vprbs_rx_load_app_route_lane3,
   reg_vprbs_rx_lock_continue_app_route_lane3,
   reg_vprbs_rx_locked_match_cnt_app_route_lane3,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane3,
   reg_vprbs_rx_err_clear_app_route_lane3,
   reg_vprbs_tx_gen_en_app_route_lane4,
   reg_vprbs_tx_mode_app_route_lane4,
   reg_vprbs_tx_order_app_route_lane4,
   reg_vprbs_tx_pat_reset_app_route_lane4,
   reg_vprbs_loopback_app_route_lane4,
   reg_vprbs_tx_err_inject_en_app_route_lane4,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane4,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane4,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane4,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane4,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane4,
   reg_vprbs_rx_chk_en_app_route_lane4,
   reg_vprbs_rx_mode_app_route_lane4,
   reg_vprbs_rx_order_app_route_lane4,
   reg_vprbs_rx_load_app_route_lane4,
   reg_vprbs_rx_lock_continue_app_route_lane4,
   reg_vprbs_rx_locked_match_cnt_app_route_lane4,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane4,
   reg_vprbs_rx_err_clear_app_route_lane4,
   reg_vprbs_tx_gen_en_app_route_lane5,
   reg_vprbs_tx_mode_app_route_lane5,
   reg_vprbs_tx_order_app_route_lane5,
   reg_vprbs_tx_pat_reset_app_route_lane5,
   reg_vprbs_loopback_app_route_lane5,
   reg_vprbs_tx_err_inject_en_app_route_lane5,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane5,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane5,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane5,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane5,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane5,
   reg_vprbs_rx_chk_en_app_route_lane5,
   reg_vprbs_rx_mode_app_route_lane5,
   reg_vprbs_rx_order_app_route_lane5,
   reg_vprbs_rx_load_app_route_lane5,
   reg_vprbs_rx_lock_continue_app_route_lane5,
   reg_vprbs_rx_locked_match_cnt_app_route_lane5,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane5,
   reg_vprbs_rx_err_clear_app_route_lane5,
   reg_vprbs_tx_gen_en_app_route_lane6,
   reg_vprbs_tx_mode_app_route_lane6,
   reg_vprbs_tx_order_app_route_lane6,
   reg_vprbs_tx_pat_reset_app_route_lane6,
   reg_vprbs_loopback_app_route_lane6,
   reg_vprbs_tx_err_inject_en_app_route_lane6,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane6,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane6,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane6,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane6,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane6,
   reg_vprbs_rx_chk_en_app_route_lane6,
   reg_vprbs_rx_mode_app_route_lane6,
   reg_vprbs_rx_order_app_route_lane6,
   reg_vprbs_rx_load_app_route_lane6,
   reg_vprbs_rx_lock_continue_app_route_lane6,
   reg_vprbs_rx_locked_match_cnt_app_route_lane6,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane6,
   reg_vprbs_rx_err_clear_app_route_lane6,
   reg_vprbs_tx_gen_en_app_route_lane7,
   reg_vprbs_tx_mode_app_route_lane7,
   reg_vprbs_tx_order_app_route_lane7,
   reg_vprbs_tx_pat_reset_app_route_lane7,
   reg_vprbs_loopback_app_route_lane7,
   reg_vprbs_tx_err_inject_en_app_route_lane7,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane7,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane7,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane7,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane7,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane7,
   reg_vprbs_rx_chk_en_app_route_lane7,
   reg_vprbs_rx_mode_app_route_lane7,
   reg_vprbs_rx_order_app_route_lane7,
   reg_vprbs_rx_load_app_route_lane7,
   reg_vprbs_rx_lock_continue_app_route_lane7,
   reg_vprbs_rx_locked_match_cnt_app_route_lane7,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane7,
   reg_vprbs_rx_err_clear_app_route_lane7, sch0_aggre_mode,
   sch0_pipe3_concat_en, sch0_pipe2_concat_en, sch0_pipe1_concat_en,
   sch0_pipe0_concat_en, sch1_aggre_mode, sch1_pipe3_concat_en,
   sch1_pipe2_concat_en, sch1_pipe1_concat_en, sch1_pipe0_concat_en,
   sch2_aggre_mode, sch2_pipe3_concat_en, sch2_pipe2_concat_en,
   sch2_pipe1_concat_en, sch2_pipe0_concat_en, sch3_aggre_mode,
   sch3_pipe3_concat_en, sch3_pipe2_concat_en, sch3_pipe1_concat_en,
   sch3_pipe0_concat_en, reg_sch0_frame_sync_auto_change_pipe_wr_mode,
   reg_sch1_frame_sync_auto_change_pipe_wr_mode,
   reg_sch2_frame_sync_auto_change_pipe_wr_mode,
   reg_sch3_frame_sync_auto_change_pipe_wr_mode
   );
    /*AUTOINPUT*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    input		reg_sch_data_type_align_fail_int_mask0;// To u_int_reg_lock of int_reg_lock.v
    input		reg_sch_data_type_align_fail_int_mask1;// To u_int_reg_lock of int_reg_lock.v
    input		reg_sch_data_type_align_fail_int_mask2;// To u_int_reg_lock of int_reg_lock.v
    input		reg_sch_data_type_align_fail_int_mask3;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask0;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask1;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask2;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask3;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask4;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask5;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask6;// To u_int_reg_lock of int_reg_lock.v
    input		reg_video_data_fwft_fifo_ovf_int_mask7;// To u_int_reg_lock of int_reg_lock.v
    input		sch_data_type_align_fail_int0;// To u_int_reg_lock of int_reg_lock.v
    input		sch_data_type_align_fail_int1;// To u_int_reg_lock of int_reg_lock.v
    input		sch_data_type_align_fail_int2;// To u_int_reg_lock of int_reg_lock.v
    input		sch_data_type_align_fail_int3;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int0;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int1;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int2;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int3;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int4;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int5;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int6;// To u_int_reg_lock of int_reg_lock.v
    input		video_data_fwft_fifo_ovf_int7;// To u_int_reg_lock of int_reg_lock.v
    // End of automatics
    input           treed_reg_bank_clk;
    input           treed_reg_bank_clk_reset_n;
    
    input           aggre_clk0;
    input           fifo_wrclk0;
    input           fifo_rdclk0;
    input           aggre_clk_rst_n0;
    input           fifo_wrclk_rst_n0;
    input           fifo_rdclk_rst_n0;
    input           aggre_clk1;
    input           fifo_wrclk1;
    input           fifo_rdclk1;
    input           aggre_clk_rst_n1;
    input           fifo_wrclk_rst_n1;
    input           fifo_rdclk_rst_n1;
    input           aggre_clk2;
    input           fifo_wrclk2;
    input           fifo_rdclk2;
    input           aggre_clk_rst_n2;
    input           fifo_wrclk_rst_n2;
    input           fifo_rdclk_rst_n2;
    input           aggre_clk3;
    input           fifo_wrclk3;
    input           fifo_rdclk3;
    input           aggre_clk_rst_n3;
    input           fifo_wrclk_rst_n3;
    input           fifo_rdclk_rst_n3;
    input           fifo_wrclk4;
    input           fifo_rdclk4;
    input           fifo_wrclk_rst_n4;
    input           fifo_rdclk_rst_n4;
    input           fifo_wrclk5;
    input           fifo_rdclk5;
    input           fifo_wrclk_rst_n5;
    input           fifo_rdclk_rst_n5;
    input           fifo_wrclk6;
    input           fifo_rdclk6;
    input           fifo_wrclk_rst_n6;
    input           fifo_rdclk_rst_n6;
    input           fifo_wrclk7;
    input           fifo_rdclk7;
    input           fifo_wrclk_rst_n7;
    input           fifo_rdclk_rst_n7;
    
    input  [1:0]    reg_pipe0_wr_mode;
    input  [1:0]    reg_pipe1_wr_mode;
    input  [1:0]    reg_pipe2_wr_mode;
    input  [1:0]    reg_pipe3_wr_mode;
    input  [1:0]    reg_pipe4_wr_mode;
    input  [1:0]    reg_pipe5_wr_mode;
    input  [1:0]    reg_pipe6_wr_mode;
    input  [1:0]    reg_pipe7_wr_mode;
    input           reg_all_pipe_wr_mode_strobe;
    input           reg_sch0_frame_sync_lock_force;
    input           reg_sch1_frame_sync_lock_force;
    input           reg_sch2_frame_sync_lock_force;
    input           reg_sch3_frame_sync_lock_force;
    input           reg_sch0_frame_sync_lock;
    input           reg_sch1_frame_sync_lock;
    input           reg_sch2_frame_sync_lock;
    input           reg_sch3_frame_sync_lock;
    input           gpio2app_sch0_frame_sync_lock;
    input           gpio2app_sch1_frame_sync_lock;
    input           gpio2app_sch2_frame_sync_lock;
    input           gpio2app_sch3_frame_sync_lock;
    input  [3:0]    reg_pipe_fifo_full_clear;
    input  [3:0]    reg_pipe_fifo_full_clear_last_four;
    
    //input           reg_vprbs_tx_gen_en_app_route_lane@@; 
    //input  [2:0]    reg_vprbs_tx_mode_app_route_lane@@;
    //input           reg_vprbs_tx_order_app_route_lane@@;
    //input           reg_vprbs_tx_pat_reset_app_route_lane@@;
    //input           reg_vprbs_loopback_app_route_lane@@;
    //input           reg_vprbs_tx_err_inject_en_app_route_lane@@;
    //input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane@@; 
    //input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane@@;
    //input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane@@;
    //input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane@@;
    //input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane@@;
    //input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane@@;
    //input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane@@;
    //input           reg_vprbs_rx_chk_en_app_route_lane@@;
    //input  [2:0]    reg_vprbs_rx_mode_app_route_lane@@;
    //input           reg_vprbs_rx_order_app_route_lane@@;
    //input           reg_vprbs_rx_load_app_route_lane@@;
    //input           reg_vprbs_rx_lock_continue_app_route_lane@@;
    //input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane@@;
    //input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane@@;
    //input           reg_vprbs_rx_err_clear_app_route_lane@@;
    
    input           reg_vprbs_tx_gen_en_app_route_lane0; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane0;
    input           reg_vprbs_tx_order_app_route_lane0;
    input           reg_vprbs_tx_pat_reset_app_route_lane0;
    input           reg_vprbs_loopback_app_route_lane0;
    input           reg_vprbs_tx_err_inject_en_app_route_lane0;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane0; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane0;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane0;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane0;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane0;
    input           reg_vprbs_rx_chk_en_app_route_lane0;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane0;
    input           reg_vprbs_rx_order_app_route_lane0;
    input           reg_vprbs_rx_load_app_route_lane0;
    input           reg_vprbs_rx_lock_continue_app_route_lane0;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane0;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane0;
    input           reg_vprbs_rx_err_clear_app_route_lane0;
    input           reg_vprbs_tx_gen_en_app_route_lane1; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane1;
    input           reg_vprbs_tx_order_app_route_lane1;
    input           reg_vprbs_tx_pat_reset_app_route_lane1;
    input           reg_vprbs_loopback_app_route_lane1;
    input           reg_vprbs_tx_err_inject_en_app_route_lane1;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane1; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane1;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane1;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane1;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane1;
    input           reg_vprbs_rx_chk_en_app_route_lane1;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane1;
    input           reg_vprbs_rx_order_app_route_lane1;
    input           reg_vprbs_rx_load_app_route_lane1;
    input           reg_vprbs_rx_lock_continue_app_route_lane1;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane1;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane1;
    input           reg_vprbs_rx_err_clear_app_route_lane1;
    input           reg_vprbs_tx_gen_en_app_route_lane2; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane2;
    input           reg_vprbs_tx_order_app_route_lane2;
    input           reg_vprbs_tx_pat_reset_app_route_lane2;
    input           reg_vprbs_loopback_app_route_lane2;
    input           reg_vprbs_tx_err_inject_en_app_route_lane2;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane2; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane2;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane2;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane2;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane2;
    input           reg_vprbs_rx_chk_en_app_route_lane2;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane2;
    input           reg_vprbs_rx_order_app_route_lane2;
    input           reg_vprbs_rx_load_app_route_lane2;
    input           reg_vprbs_rx_lock_continue_app_route_lane2;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane2;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane2;
    input           reg_vprbs_rx_err_clear_app_route_lane2;
    input           reg_vprbs_tx_gen_en_app_route_lane3; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane3;
    input           reg_vprbs_tx_order_app_route_lane3;
    input           reg_vprbs_tx_pat_reset_app_route_lane3;
    input           reg_vprbs_loopback_app_route_lane3;
    input           reg_vprbs_tx_err_inject_en_app_route_lane3;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane3; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane3;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane3;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane3;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane3;
    input           reg_vprbs_rx_chk_en_app_route_lane3;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane3;
    input           reg_vprbs_rx_order_app_route_lane3;
    input           reg_vprbs_rx_load_app_route_lane3;
    input           reg_vprbs_rx_lock_continue_app_route_lane3;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane3;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane3;
    input           reg_vprbs_rx_err_clear_app_route_lane3;
    input           reg_vprbs_tx_gen_en_app_route_lane4; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane4;
    input           reg_vprbs_tx_order_app_route_lane4;
    input           reg_vprbs_tx_pat_reset_app_route_lane4;
    input           reg_vprbs_loopback_app_route_lane4;
    input           reg_vprbs_tx_err_inject_en_app_route_lane4;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane4; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane4;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane4;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane4;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane4;
    input           reg_vprbs_rx_chk_en_app_route_lane4;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane4;
    input           reg_vprbs_rx_order_app_route_lane4;
    input           reg_vprbs_rx_load_app_route_lane4;
    input           reg_vprbs_rx_lock_continue_app_route_lane4;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane4;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane4;
    input           reg_vprbs_rx_err_clear_app_route_lane4;
    input           reg_vprbs_tx_gen_en_app_route_lane5; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane5;
    input           reg_vprbs_tx_order_app_route_lane5;
    input           reg_vprbs_tx_pat_reset_app_route_lane5;
    input           reg_vprbs_loopback_app_route_lane5;
    input           reg_vprbs_tx_err_inject_en_app_route_lane5;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane5; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane5;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane5;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane5;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane5;
    input           reg_vprbs_rx_chk_en_app_route_lane5;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane5;
    input           reg_vprbs_rx_order_app_route_lane5;
    input           reg_vprbs_rx_load_app_route_lane5;
    input           reg_vprbs_rx_lock_continue_app_route_lane5;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane5;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane5;
    input           reg_vprbs_rx_err_clear_app_route_lane5;
    input           reg_vprbs_tx_gen_en_app_route_lane6; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane6;
    input           reg_vprbs_tx_order_app_route_lane6;
    input           reg_vprbs_tx_pat_reset_app_route_lane6;
    input           reg_vprbs_loopback_app_route_lane6;
    input           reg_vprbs_tx_err_inject_en_app_route_lane6;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane6; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane6;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane6;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane6;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane6;
    input           reg_vprbs_rx_chk_en_app_route_lane6;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane6;
    input           reg_vprbs_rx_order_app_route_lane6;
    input           reg_vprbs_rx_load_app_route_lane6;
    input           reg_vprbs_rx_lock_continue_app_route_lane6;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane6;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane6;
    input           reg_vprbs_rx_err_clear_app_route_lane6;
    input           reg_vprbs_tx_gen_en_app_route_lane7; 
    input  [2:0]    reg_vprbs_tx_mode_app_route_lane7;
    input           reg_vprbs_tx_order_app_route_lane7;
    input           reg_vprbs_tx_pat_reset_app_route_lane7;
    input           reg_vprbs_loopback_app_route_lane7;
    input           reg_vprbs_tx_err_inject_en_app_route_lane7;
    input  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane7; 
    input  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane7;
    input  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane7;
    input  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7;
    input  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane7;
    input  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7;
    input  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane7;
    input           reg_vprbs_rx_chk_en_app_route_lane7;
    input  [2:0]    reg_vprbs_rx_mode_app_route_lane7;
    input           reg_vprbs_rx_order_app_route_lane7;
    input           reg_vprbs_rx_load_app_route_lane7;
    input           reg_vprbs_rx_lock_continue_app_route_lane7;
    input  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane7;
    input  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane7;
    input           reg_vprbs_rx_err_clear_app_route_lane7;
    
    input  [1:0]    sch0_aggre_mode;
    input           sch0_pipe3_concat_en;
    input           sch0_pipe2_concat_en;
    input           sch0_pipe1_concat_en;
    input           sch0_pipe0_concat_en;
    input  [1:0]    sch1_aggre_mode;
    input           sch1_pipe3_concat_en;
    input           sch1_pipe2_concat_en;
    input           sch1_pipe1_concat_en;
    input           sch1_pipe0_concat_en;
    input  [1:0]    sch2_aggre_mode;
    input           sch2_pipe3_concat_en;
    input           sch2_pipe2_concat_en;
    input           sch2_pipe1_concat_en;
    input           sch2_pipe0_concat_en;
    input  [1:0]    sch3_aggre_mode;
    input           sch3_pipe3_concat_en;
    input           sch3_pipe2_concat_en;
    input           sch3_pipe1_concat_en;
    input           sch3_pipe0_concat_en;
    input           reg_sch0_frame_sync_auto_change_pipe_wr_mode;
    input           reg_sch1_frame_sync_auto_change_pipe_wr_mode;
    input           reg_sch2_frame_sync_auto_change_pipe_wr_mode;
    input           reg_sch3_frame_sync_auto_change_pipe_wr_mode;
    
    output [1:0]    pipe0_wr_mode;
    output [1:0]    pipe1_wr_mode;
    output [1:0]    pipe2_wr_mode;
    output [1:0]    pipe3_wr_mode;
    output [1:0]    pipe4_wr_mode;
    output [1:0]    pipe5_wr_mode;
    output [1:0]    pipe6_wr_mode;
    output [1:0]    pipe7_wr_mode;    
    output          sch0_frame_sync_lock;
    output          sch1_frame_sync_lock;
    output          sch2_frame_sync_lock;
    output          sch3_frame_sync_lock;
    output [7:0]    pipe_fifo_full_clear;
    
    //output           reg_vprbs_tx_gen_en_app_route_lane@@_sync;
    //output  [2:0]    reg_vprbs_tx_mode_app_route_lane@@_sync;
    //output           reg_vprbs_tx_order_app_route_lane@@_sync;
    //output           reg_vprbs_tx_pat_reset_app_route_lane@@_sync;
    //output           reg_vprbs_loopback_app_route_lane@@_sync;
    //output           reg_vprbs_tx_err_inject_en_app_route_lane@@_sync;
    //output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane@@_sync;
    //output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane@@_sync;
    //output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane@@_sync;
    //output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane@@_sync;
    //output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane@@_sync;
    //output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane@@_sync;
    //output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane@@_sync;
    //output           reg_vprbs_rx_chk_en_app_route_lane@@_sync;
    //output  [2:0]    reg_vprbs_rx_mode_app_route_lane@@_sync;
    //output           reg_vprbs_rx_order_app_route_lane@@_sync;
    //output           reg_vprbs_rx_load_app_route_lane@@_sync;
    //output           reg_vprbs_rx_lock_continue_app_route_lane@@_sync;
    //output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane@@_sync;
    //output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane@@_sync;
    //output           reg_vprbs_rx_err_clear_app_route_lane@@_sync;
    
    output           reg_vprbs_tx_gen_en_app_route_lane0_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane0_sync;
    output           reg_vprbs_tx_order_app_route_lane0_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane0_sync;
    output           reg_vprbs_loopback_app_route_lane0_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane0_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane0_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane0_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane0_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane0_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane0_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane0_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane0_sync;
    output           reg_vprbs_rx_order_app_route_lane0_sync;
    output           reg_vprbs_rx_load_app_route_lane0_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane0_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane0_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane0_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane0_sync;
    output           reg_vprbs_tx_gen_en_app_route_lane1_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane1_sync;
    output           reg_vprbs_tx_order_app_route_lane1_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane1_sync;
    output           reg_vprbs_loopback_app_route_lane1_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane1_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane1_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane1_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane1_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane1_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane1_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane1_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane1_sync;
    output           reg_vprbs_rx_order_app_route_lane1_sync;
    output           reg_vprbs_rx_load_app_route_lane1_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane1_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane1_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane1_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane1_sync;
    output           reg_vprbs_tx_gen_en_app_route_lane2_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane2_sync;
    output           reg_vprbs_tx_order_app_route_lane2_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane2_sync;
    output           reg_vprbs_loopback_app_route_lane2_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane2_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane2_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane2_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane2_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane2_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane2_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane2_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane2_sync;
    output           reg_vprbs_rx_order_app_route_lane2_sync;
    output           reg_vprbs_rx_load_app_route_lane2_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane2_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane2_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane2_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane2_sync;
    output           reg_vprbs_tx_gen_en_app_route_lane3_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane3_sync;
    output           reg_vprbs_tx_order_app_route_lane3_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane3_sync;
    output           reg_vprbs_loopback_app_route_lane3_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane3_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane3_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane3_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane3_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane3_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane3_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane3_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane3_sync;
    output           reg_vprbs_rx_order_app_route_lane3_sync;
    output           reg_vprbs_rx_load_app_route_lane3_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane3_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane3_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane3_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane3_sync;
    output           reg_vprbs_tx_gen_en_app_route_lane4_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane4_sync;
    output           reg_vprbs_tx_order_app_route_lane4_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane4_sync;
    output           reg_vprbs_loopback_app_route_lane4_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane4_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane4_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane4_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane4_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane4_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane4_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane4_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane4_sync;
    output           reg_vprbs_rx_order_app_route_lane4_sync;
    output           reg_vprbs_rx_load_app_route_lane4_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane4_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane4_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane4_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane4_sync;
    output           reg_vprbs_tx_gen_en_app_route_lane5_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane5_sync;
    output           reg_vprbs_tx_order_app_route_lane5_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane5_sync;
    output           reg_vprbs_loopback_app_route_lane5_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane5_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane5_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane5_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane5_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane5_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane5_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane5_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane5_sync;
    output           reg_vprbs_rx_order_app_route_lane5_sync;
    output           reg_vprbs_rx_load_app_route_lane5_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane5_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane5_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane5_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane5_sync;
    output           reg_vprbs_tx_gen_en_app_route_lane6_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane6_sync;
    output           reg_vprbs_tx_order_app_route_lane6_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane6_sync;
    output           reg_vprbs_loopback_app_route_lane6_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane6_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane6_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane6_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane6_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane6_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane6_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane6_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane6_sync;
    output           reg_vprbs_rx_order_app_route_lane6_sync;
    output           reg_vprbs_rx_load_app_route_lane6_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane6_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane6_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane6_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane6_sync;
    output           reg_vprbs_tx_gen_en_app_route_lane7_sync;
    output  [2:0]    reg_vprbs_tx_mode_app_route_lane7_sync;
    output           reg_vprbs_tx_order_app_route_lane7_sync;
    output           reg_vprbs_tx_pat_reset_app_route_lane7_sync;
    output           reg_vprbs_loopback_app_route_lane7_sync;
    output           reg_vprbs_tx_err_inject_en_app_route_lane7_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_num_app_route_lane7_sync;
    output  [7:0]    reg_vprbs_tx_err_inject_intv_time_app_route_lane7_sync;
    output  [5:0]    reg_vprbs_tx_idi_driver_data_type_app_route_lane7_sync;
    output  [3:0]    reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_word_count_app_route_lane7_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7_sync;
    output  [15:0]   reg_vprbs_tx_idi_driver_total_interval_app_route_lane7_sync;
    output           reg_vprbs_rx_chk_en_app_route_lane7_sync;
    output  [2:0]    reg_vprbs_rx_mode_app_route_lane7_sync;
    output           reg_vprbs_rx_order_app_route_lane7_sync;
    output           reg_vprbs_rx_load_app_route_lane7_sync;
    output           reg_vprbs_rx_lock_continue_app_route_lane7_sync;
    output  [3:0]    reg_vprbs_rx_locked_match_cnt_app_route_lane7_sync;
    output  [3:0]    reg_vprbs_rx_uncheck_tolerance_app_route_lane7_sync;
    output           reg_vprbs_rx_err_clear_app_route_lane7_sync;
    
    output           app_async_rst_req;
    
    //signal define 
    //pipe_wr_mode
    wire            treed_reg_bank_clk_reset;
    wire [3:0]      aggre_clk;
    wire [3:0]      aggre_clk_rst_n;
    wire [7:0]      fifo_rdclk;
    wire [7:0]      fifo_rdclk_rst_n;
    wire [7:0]      fifo_wrclk;
    wire [7:0]      fifo_wrclk_rst;
    wire [7:0]      fifo_wrclk_rst_n;
    wire [1:0]      reg_pipe_wr_mode         [7:0];
    reg  [1:0]      pipe_wr_mode             [7:0];
    wire [1:0]      pipe_wr_mode_sync        [7:0];
    wire [7:0]      pipe_wr_mode_vld_sync;
    genvar          j;
    //frame_sync 
    //before cdc
    wire [3:0]      reg_sch_frame_sync_lock_force;
    wire [3:0]      reg_sch_frame_sync_lock;
    wire [3:0]      gpio2app_sch_frame_sync_lock_sync_pre;
    //sync bit
    wire [11:0]     frame_sync_lock_sync;
    //after cdc
    wire [3:0]      reg_sch_frame_sync_lock_force_sync;
    wire [3:0]      reg_sch_frame_sync_lock_sync;
    wire [3:0]      gpio2app_sch_frame_sync_lock_sync_reg_bank_clk;
    reg  [3:0]      sch_frame_sync_lock_sync_reg_bank_clk;
    wire [3:0]      sch_frame_sync_lock_sync_aggre_clk;
    
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane0;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane0;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane1;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane1;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane2;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane2;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane3;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane3;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane4;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane4;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane5;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane5;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane6;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane6;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane7;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane7;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane0_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane0_sync;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane1_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane1_sync;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane2_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane2_sync;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane3_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane3_sync;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane4_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane4_sync;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane5_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane5_sync;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane6_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane6_sync;
    wire [97:0]    u_sync_bus_di_reg_vprbs_test_app_route_lane7_sync;
    wire [97:0]    u_sync_bus_do_reg_vprbs_test_app_route_lane7_sync;

    //pipe_wr_mode_auto_change_trigger_by_frame_sync_lock
    reg            pipe_wr_mode_auto_change_en[3:0];
    reg  [1:0]     pipe_wr_mode_auto_change_trigger_sch[3:0];
    reg            pipe_wr_mode_auto_change_value[3:0];
    wire           pipe_wr_mode_auto_change_value_sync_fifo_wr_clk[3:0];
    reg  [3:0]     sch_frame_sync_lock_sync_aggre_clk_d1;
    reg  [3:0]     sch_frame_sync_lock_sync_aggre_clk_up_level_signal;
    reg  [3:0]     pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_d1;
    reg  [3:0]     pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal;
    //logic design
    
    //frame_sync
    assign  reg_sch_frame_sync_lock_force[0]  =   reg_sch0_frame_sync_lock_force      ;
    assign  reg_sch_frame_sync_lock_force[1]  =   reg_sch1_frame_sync_lock_force      ;
    assign  reg_sch_frame_sync_lock_force[2]  =   reg_sch2_frame_sync_lock_force      ;
    assign  reg_sch_frame_sync_lock_force[3]  =   reg_sch3_frame_sync_lock_force      ;
    assign  reg_sch_frame_sync_lock[0]        =   reg_sch0_frame_sync_lock            ;
    assign  reg_sch_frame_sync_lock[1]        =   reg_sch1_frame_sync_lock            ;
    assign  reg_sch_frame_sync_lock[2]        =   reg_sch2_frame_sync_lock            ;
    assign  reg_sch_frame_sync_lock[3]        =   reg_sch3_frame_sync_lock            ;
    assign  gpio2app_sch_frame_sync_lock_sync_pre[0]   =   gpio2app_sch0_frame_sync_lock       ;
    assign  gpio2app_sch_frame_sync_lock_sync_pre[1]   =   gpio2app_sch1_frame_sync_lock       ;
    assign  gpio2app_sch_frame_sync_lock_sync_pre[2]   =   gpio2app_sch2_frame_sync_lock       ;
    assign  gpio2app_sch_frame_sync_lock_sync_pre[3]   =   gpio2app_sch3_frame_sync_lock       ;
    
    generate for(j=0;j<=3;j=j+1)begin:sch_frame_sync_lock_sync_reg_bank_clk_bk
        sync2_cell_rstb sync2_cell_rstb_gpio2app_sch_frame_sync_lock(
            .clk     (treed_reg_bank_clk), 
            .reset_n (treed_reg_bank_clk_reset_n), 
            .data    (gpio2app_sch_frame_sync_lock_sync_pre[j]), 
            .qout    (gpio2app_sch_frame_sync_lock_sync_reg_bank_clk[j])
        );

        always@(posedge treed_reg_bank_clk or negedge treed_reg_bank_clk_reset_n)begin
            if(~treed_reg_bank_clk_reset_n)
                sch_frame_sync_lock_sync_reg_bank_clk[j] <= 1'd0;
            else
                sch_frame_sync_lock_sync_reg_bank_clk[j] <= reg_sch_frame_sync_lock_force[j] ? reg_sch_frame_sync_lock[j] : gpio2app_sch_frame_sync_lock_sync_reg_bank_clk[j];
        end

    end
    endgenerate
    
    assign  aggre_clk[0]            =  aggre_clk0;
    assign  aggre_clk[1]            =  aggre_clk1;
    assign  aggre_clk[2]            =  aggre_clk2;
    assign  aggre_clk[3]            =  aggre_clk3;
    assign  aggre_clk_rst_n[0]      =  aggre_clk_rst_n0;
    assign  aggre_clk_rst_n[1]      =  aggre_clk_rst_n1;
    assign  aggre_clk_rst_n[2]      =  aggre_clk_rst_n2;
    assign  aggre_clk_rst_n[3]      =  aggre_clk_rst_n3;
    
    generate for(j=0;j<=3;j=j+1)begin:sch_frame_sync_lock_sync_aggre_clk_bk
        sync2_cell_rstb sync2_cell_rstb_frame_sync_lock(
            .clk     (aggre_clk[j]), 
            .reset_n (aggre_clk_rst_n[j]), 
            .data    (sch_frame_sync_lock_sync_reg_bank_clk[j]), 
            .qout    (sch_frame_sync_lock_sync_aggre_clk[j])
        );

        always@(posedge aggre_clk[j] or negedge aggre_clk_rst_n[j])begin
            if(~aggre_clk_rst_n[j])
                sch_frame_sync_lock_sync_aggre_clk_d1[j] <= 1'd0;
            else
                sch_frame_sync_lock_sync_aggre_clk_d1[j] <= sch_frame_sync_lock_sync_aggre_clk[j];
        end

        always@(posedge aggre_clk[j] or negedge aggre_clk_rst_n[j])begin
            if(~aggre_clk_rst_n[j])
                sch_frame_sync_lock_sync_aggre_clk_up_level_signal[j] <= 1'd0;
            else if(~sch_frame_sync_lock_sync_aggre_clk_up_level_signal[j])
                sch_frame_sync_lock_sync_aggre_clk_up_level_signal[j] <= ~sch_frame_sync_lock_sync_aggre_clk_d1[j] & sch_frame_sync_lock_sync_aggre_clk[j];
        end
    end
    endgenerate
    
    assign  sch0_frame_sync_lock = sch_frame_sync_lock_sync_aggre_clk_up_level_signal[0];
    assign  sch1_frame_sync_lock = sch_frame_sync_lock_sync_aggre_clk_up_level_signal[1];
    assign  sch2_frame_sync_lock = sch_frame_sync_lock_sync_aggre_clk_up_level_signal[2];
    assign  sch3_frame_sync_lock = sch_frame_sync_lock_sync_aggre_clk_up_level_signal[3];


    //pipe_wr_mode
    assign  treed_reg_bank_clk_reset =  ~treed_reg_bank_clk_reset_n;
    assign  reg_pipe_wr_mode[0]      =  reg_pipe0_wr_mode;
    assign  fifo_wrclk[0]            =  fifo_wrclk0;
    assign  fifo_wrclk_rst[0]        =  ~fifo_wrclk_rst_n0;
    assign  fifo_wrclk_rst_n[0]      =  fifo_wrclk_rst_n0;
    assign  pipe0_wr_mode            =  pipe_wr_mode_auto_change_en[0] ? {pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal[0],1'd0} : pipe_wr_mode[0];
    assign  reg_pipe_wr_mode[1]      =  reg_pipe1_wr_mode;
    assign  fifo_wrclk[1]            =  fifo_wrclk1;
    assign  fifo_wrclk_rst[1]        =  ~fifo_wrclk_rst_n1;
    assign  fifo_wrclk_rst_n[1]      =  fifo_wrclk_rst_n1;
    assign  pipe1_wr_mode            =  pipe_wr_mode_auto_change_en[1] ? {pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal[1],1'd0} : pipe_wr_mode[1];
    assign  reg_pipe_wr_mode[2]      =  reg_pipe2_wr_mode;
    assign  fifo_wrclk[2]            =  fifo_wrclk2;
    assign  fifo_wrclk_rst[2]        =  ~fifo_wrclk_rst_n2;
    assign  fifo_wrclk_rst_n[2]      =  fifo_wrclk_rst_n2;
    assign  pipe2_wr_mode            =  pipe_wr_mode_auto_change_en[2] ? {pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal[2],1'd0} : pipe_wr_mode[2];
    assign  reg_pipe_wr_mode[3]      =  reg_pipe3_wr_mode;
    assign  fifo_wrclk[3]            =  fifo_wrclk3;
    assign  fifo_wrclk_rst[3]        =  ~fifo_wrclk_rst_n3;
    assign  fifo_wrclk_rst_n[3]      =  fifo_wrclk_rst_n3;
    assign  pipe3_wr_mode            =  pipe_wr_mode_auto_change_en[3] ? {pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal[3],1'd0} : pipe_wr_mode[3];
    assign  reg_pipe_wr_mode[4]      =  reg_pipe4_wr_mode;
    assign  fifo_wrclk[4]            =  fifo_wrclk4;
    assign  fifo_wrclk_rst[4]        =  ~fifo_wrclk_rst_n4;
    assign  fifo_wrclk_rst_n[4]      =  fifo_wrclk_rst_n4;
    assign  pipe4_wr_mode            =  pipe_wr_mode[4];
    assign  reg_pipe_wr_mode[5]      =  reg_pipe5_wr_mode;
    assign  fifo_wrclk[5]            =  fifo_wrclk5;
    assign  fifo_wrclk_rst[5]        =  ~fifo_wrclk_rst_n5;
    assign  fifo_wrclk_rst_n[5]      =  fifo_wrclk_rst_n5;
    assign  pipe5_wr_mode            =  pipe_wr_mode[5];
    assign  reg_pipe_wr_mode[6]      =  reg_pipe6_wr_mode;
    assign  fifo_wrclk[6]            =  fifo_wrclk6;
    assign  fifo_wrclk_rst[6]        =  ~fifo_wrclk_rst_n6;
    assign  fifo_wrclk_rst_n[6]      =  fifo_wrclk_rst_n6;
    assign  pipe6_wr_mode            =  pipe_wr_mode[6];
    assign  reg_pipe_wr_mode[7]      =  reg_pipe7_wr_mode;
    assign  fifo_wrclk[7]            =  fifo_wrclk7;
    assign  fifo_wrclk_rst[7]        =  ~fifo_wrclk_rst_n7;
    assign  fifo_wrclk_rst_n[7]      =  fifo_wrclk_rst_n7;
    assign  pipe7_wr_mode            =  pipe_wr_mode[7];
    
    generate for(j=0;j<=7;j=j+1)begin:pipe_wr_mode_bk
        databus_sync_dmux#(
            .D_WIDTH(2)
        ) databus_sync_dmux_pipe_wr_mode(
            .SRC_CK      (treed_reg_bank_clk),
            .SRC_RST     (treed_reg_bank_clk_reset),
            .SRC_DATA    (reg_pipe_wr_mode[j]),
            .SRC_PULSE   (reg_all_pipe_wr_mode_strobe),
            .DST_CK      (fifo_wrclk[j]),
            .DST_RST     (fifo_wrclk_rst[j]),
            .DST_DATA    (pipe_wr_mode_sync[j]),
            .DST_PULSE   (pipe_wr_mode_vld_sync[j])
        );
        
        always@(posedge fifo_wrclk[j] or negedge fifo_wrclk_rst_n[j])begin
            if(~fifo_wrclk_rst_n[j])begin
                pipe_wr_mode[j] <= 2'd0;
            end
            else if(pipe_wr_mode_vld_sync[j])begin
                pipe_wr_mode[j] <= pipe_wr_mode_sync[j];
            end
        end
    end
    endgenerate
    
    
    
    //pipe_fifo_full_clear
    assign  fifo_rdclk[0]            =  fifo_rdclk0;
    assign  fifo_rdclk[1]            =  fifo_rdclk1;
    assign  fifo_rdclk[2]            =  fifo_rdclk2;
    assign  fifo_rdclk[3]            =  fifo_rdclk3;
    assign  fifo_rdclk[4]            =  fifo_rdclk4;
    assign  fifo_rdclk[5]            =  fifo_rdclk5;
    assign  fifo_rdclk[6]            =  fifo_rdclk6;
    assign  fifo_rdclk[7]            =  fifo_rdclk7;
    assign  fifo_rdclk_rst_n[0]      =  fifo_rdclk_rst_n0;
    assign  fifo_rdclk_rst_n[1]      =  fifo_rdclk_rst_n1;
    assign  fifo_rdclk_rst_n[2]      =  fifo_rdclk_rst_n2;
    assign  fifo_rdclk_rst_n[3]      =  fifo_rdclk_rst_n3;
    assign  fifo_rdclk_rst_n[4]      =  fifo_rdclk_rst_n4;
    assign  fifo_rdclk_rst_n[5]      =  fifo_rdclk_rst_n5;
    assign  fifo_rdclk_rst_n[6]      =  fifo_rdclk_rst_n6;
    assign  fifo_rdclk_rst_n[7]      =  fifo_rdclk_rst_n7;
    generate for(j=0;j<=3;j=j+1)begin:pipe_fifo_full_clear_first_four_bk
        sync2_cell_rstb sync2_cell_rstb_pipe_fifo_clear_first_four(
            .clk     (fifo_rdclk[j]), 
            .reset_n (fifo_rdclk_rst_n[j]), 
            .data    (reg_pipe_fifo_full_clear[j]), 
            .qout    (pipe_fifo_full_clear[j])
        );
    end
    endgenerate
    generate for(j=4;j<=7;j=j+1)begin:pipe_fifo_full_clear_last_four_bk
        sync2_cell_rstb sync2_cell_rstb_pipe_fifo_clear_last_four(
            .clk     (fifo_rdclk[j]), 
            .reset_n (fifo_rdclk_rst_n[j]), 
            .data    (reg_pipe_fifo_full_clear_last_four[j-4]), 
            .qout    (pipe_fifo_full_clear[j])
        );
    end
    endgenerate
    
    //pipe0_wr_mode_auto_change_value
    always@(*)begin
        if((reg_sch0_frame_sync_auto_change_pipe_wr_mode)&(sch0_aggre_mode==2'b01)&(sch0_pipe0_concat_en)) begin
            pipe_wr_mode_auto_change_en[0] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[0] = 2'd0;
        end
        else if((reg_sch1_frame_sync_auto_change_pipe_wr_mode)&(sch1_aggre_mode==2'b01)&(sch1_pipe0_concat_en)) begin
            pipe_wr_mode_auto_change_en[0] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[0] = 2'd1;
        end
        else if((reg_sch2_frame_sync_auto_change_pipe_wr_mode)&(sch2_aggre_mode==2'b01)&(sch2_pipe0_concat_en)) begin
            pipe_wr_mode_auto_change_en[0] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[0] = 2'd2;
        end
        else if((reg_sch3_frame_sync_auto_change_pipe_wr_mode)&(sch3_aggre_mode==2'b01)&(sch3_pipe0_concat_en)) begin
            pipe_wr_mode_auto_change_en[0] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[0] = 2'd3;
        end
        else begin
            pipe_wr_mode_auto_change_en[0] = 1'd0;
            pipe_wr_mode_auto_change_trigger_sch[0] = 2'd0;
        end
    end
    
    //pipe1_wr_mode_auto_change_value
    always@(*)begin
        if((reg_sch0_frame_sync_auto_change_pipe_wr_mode)&(sch0_aggre_mode==2'b01)&(sch0_pipe1_concat_en)) begin
            pipe_wr_mode_auto_change_en[1] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[1] = 2'd0;
        end
        else if((reg_sch1_frame_sync_auto_change_pipe_wr_mode)&(sch1_aggre_mode==2'b01)&(sch1_pipe1_concat_en)) begin
            pipe_wr_mode_auto_change_en[1] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[1] = 2'd1;
        end
        else if((reg_sch2_frame_sync_auto_change_pipe_wr_mode)&(sch2_aggre_mode==2'b01)&(sch2_pipe1_concat_en)) begin
            pipe_wr_mode_auto_change_en[1] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[1] = 2'd2;
        end
        else if((reg_sch3_frame_sync_auto_change_pipe_wr_mode)&(sch3_aggre_mode==2'b01)&(sch3_pipe1_concat_en)) begin
            pipe_wr_mode_auto_change_en[1] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[1] = 2'd3;
        end
        else begin
            pipe_wr_mode_auto_change_en[1] = 1'd0;
            pipe_wr_mode_auto_change_trigger_sch[1] = 2'd0;
        end
    end
    //pipe2_wr_mode_auto_change_value
    always@(*)begin
        if((reg_sch0_frame_sync_auto_change_pipe_wr_mode)&(sch0_aggre_mode==2'b01)&(sch0_pipe2_concat_en)) begin
            pipe_wr_mode_auto_change_en[2] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[2] = 2'd0;
        end
        else if((reg_sch1_frame_sync_auto_change_pipe_wr_mode)&(sch1_aggre_mode==2'b01)&(sch1_pipe2_concat_en)) begin
            pipe_wr_mode_auto_change_en[2] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[2] = 2'd1;
        end
        else if((reg_sch2_frame_sync_auto_change_pipe_wr_mode)&(sch2_aggre_mode==2'b01)&(sch2_pipe2_concat_en)) begin
            pipe_wr_mode_auto_change_en[2] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[2] = 2'd2;
        end
        else if((reg_sch3_frame_sync_auto_change_pipe_wr_mode)&(sch3_aggre_mode==2'b01)&(sch3_pipe2_concat_en)) begin
            pipe_wr_mode_auto_change_en[2] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[2] = 2'd3;
        end
        else begin
            pipe_wr_mode_auto_change_en[2] = 1'd0;
            pipe_wr_mode_auto_change_trigger_sch[2] = 2'd0;
        end
    end
    
    //pipe3_wr_mode_auto_change_value
    always@(*)begin
        if((reg_sch0_frame_sync_auto_change_pipe_wr_mode)&(sch0_aggre_mode==2'b01)&(sch0_pipe3_concat_en)) begin
            pipe_wr_mode_auto_change_en[3] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[3] = 2'd0;
        end
        else if((reg_sch1_frame_sync_auto_change_pipe_wr_mode)&(sch1_aggre_mode==2'b01)&(sch1_pipe3_concat_en)) begin
            pipe_wr_mode_auto_change_en[3] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[3] = 2'd1;
        end
        else if((reg_sch2_frame_sync_auto_change_pipe_wr_mode)&(sch2_aggre_mode==2'b01)&(sch2_pipe3_concat_en)) begin
            pipe_wr_mode_auto_change_en[3] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[3] = 2'd2;
        end
        else if((reg_sch3_frame_sync_auto_change_pipe_wr_mode)&(sch3_aggre_mode==2'b01)&(sch3_pipe3_concat_en)) begin
            pipe_wr_mode_auto_change_en[3] = 1'd1;
            pipe_wr_mode_auto_change_trigger_sch[3] = 2'd3;
        end
        else begin
            pipe_wr_mode_auto_change_en[3] = 1'd0;
            pipe_wr_mode_auto_change_trigger_sch[3] = 2'd0;
        end
    end
    

    generate for(j=0;j<=3;j=j+1)begin:pipe_wr_mode_auto_change_value_sync_reg_bank_clk_bk
        always@(posedge treed_reg_bank_clk or negedge treed_reg_bank_clk_reset_n)begin
            if(~treed_reg_bank_clk_reset_n) pipe_wr_mode_auto_change_value[j] <= 1'b0;
            else if((sch_frame_sync_lock_sync_reg_bank_clk[0])&(pipe_wr_mode_auto_change_en[j])&(pipe_wr_mode_auto_change_trigger_sch[j] == 2'd0)) pipe_wr_mode_auto_change_value[j] <= 1'b1;
            else if((sch_frame_sync_lock_sync_reg_bank_clk[1])&(pipe_wr_mode_auto_change_en[j])&(pipe_wr_mode_auto_change_trigger_sch[j] == 2'd1)) pipe_wr_mode_auto_change_value[j] <= 1'b1;
            else if((sch_frame_sync_lock_sync_reg_bank_clk[2])&(pipe_wr_mode_auto_change_en[j])&(pipe_wr_mode_auto_change_trigger_sch[j] == 2'd2)) pipe_wr_mode_auto_change_value[j] <= 1'b1;
            else if((sch_frame_sync_lock_sync_reg_bank_clk[3])&(pipe_wr_mode_auto_change_en[j])&(pipe_wr_mode_auto_change_trigger_sch[j] == 2'd3)) pipe_wr_mode_auto_change_value[j] <= 1'b1;
            else pipe_wr_mode_auto_change_value[j] <= 1'b0;
        end
    end
    endgenerate
    
    generate for(j=0;j<=3;j=j+1)begin:pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_bk
        sync2_cell_rstb sync2_cell_rstb_pipe_wr_mode_auto_change_value_sync_fifo_wr_clk(
            .clk     (fifo_wrclk[j]), 
            .reset_n (fifo_wrclk_rst_n[j]), 
            .data    (pipe_wr_mode_auto_change_value[j]), 
            .qout    (pipe_wr_mode_auto_change_value_sync_fifo_wr_clk[j])
        );

        always@(posedge fifo_wrclk[j] or negedge fifo_wrclk_rst_n[j])begin
            if(~fifo_wrclk_rst_n[j])
                pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_d1[j] <= 1'd0;
            else
                pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_d1[j] <= pipe_wr_mode_auto_change_value_sync_fifo_wr_clk[j];
        end

        always@(posedge fifo_wrclk[j] or negedge fifo_wrclk_rst_n[j])begin
            if(~fifo_wrclk_rst_n[j])
                pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal[j] <= 1'd0;
            else if(~pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal[j])
                pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_up_level_signal[j] <= ~pipe_wr_mode_auto_change_value_sync_fifo_wr_clk_d1[j] & pipe_wr_mode_auto_change_value_sync_fifo_wr_clk[j];
        end

    end
    endgenerate

    //assign  u_sync_bus_di_reg_vprbs_test_app_route_lane@@  =  {reg_vprbs_tx_gen_en_app_route_lane@@	                            ,
    //                                                         reg_vprbs_tx_mode_app_route_lane@@[2:0]	                        ,
    //                                                         reg_vprbs_tx_order_app_route_lane@@	                            ,
    //                                                         reg_vprbs_tx_pat_reset_app_route_lane@@	                        ,
    //                                                         reg_vprbs_loopback_app_route_lane@@	                            ,
    //                                                         reg_vprbs_tx_err_inject_en_app_route_lane@@	                    ,
    //                                                         reg_vprbs_tx_err_inject_intv_num_app_route_lane@@[7:0]	            ,
    //                                                         reg_vprbs_tx_err_inject_intv_time_app_route_lane@@[7:0]	        ,
    //                                                         reg_vprbs_tx_idi_driver_data_type_app_route_lane@@[5:0]	        ,
    //                                                         reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane@@[3:0]      ,
    //                                                         reg_vprbs_tx_idi_driver_word_count_app_route_lane@@[15:0]          ,
    //                                                         reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane@@[15:0]        ,
    //                                                         reg_vprbs_tx_idi_driver_total_interval_app_route_lane@@[15:0]      ,
    //                                                         reg_vprbs_rx_chk_en_app_route_lane@@	                            ,
    //                                                         reg_vprbs_rx_mode_app_route_lane@@[2:0]	                        ,
    //                                                         reg_vprbs_rx_order_app_route_lane@@	                            ,
    //                                                         reg_vprbs_rx_load_app_route_lane@@	                                ,
    //                                                         reg_vprbs_rx_lock_continue_app_route_lane@@	                    ,
    //                                                         reg_vprbs_rx_locked_match_cnt_app_route_lane@@[3:0]	            ,
    //                                                         reg_vprbs_rx_uncheck_tolerance_app_route_lane@@[3:0]	            ,
    //                                                         reg_vprbs_rx_err_clear_app_route_lane@@	                         };
    //assign   {reg_vprbs_tx_gen_en_app_route_lane@@_sync                             ,
    //          reg_vprbs_tx_mode_app_route_lane@@_sync[2:0]	                        ,
    //          reg_vprbs_tx_order_app_route_lane@@_sync	                            ,
    //          reg_vprbs_tx_pat_reset_app_route_lane@@_sync	                        ,
    //          reg_vprbs_loopback_app_route_lane@@_sync	                            ,
    //          reg_vprbs_tx_err_inject_en_app_route_lane@@_sync	                    ,
    //          reg_vprbs_tx_err_inject_intv_num_app_route_lane@@_sync[7:0]	        ,
    //          reg_vprbs_tx_err_inject_intv_time_app_route_lane@@_sync[7:0]	        ,
    //          reg_vprbs_tx_idi_driver_data_type_app_route_lane@@_sync[5:0]	        ,
    //          reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane@@_sync[3:0]    ,
    //          reg_vprbs_tx_idi_driver_word_count_app_route_lane@@_sync[15:0]        ,
    //          reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane@@_sync[15:0]      ,
    //          reg_vprbs_tx_idi_driver_total_interval_app_route_lane@@_sync[15:0]    ,
    //          reg_vprbs_rx_chk_en_app_route_lane@@_sync	                            ,
    //          reg_vprbs_rx_mode_app_route_lane@@_sync[2:0]	                        ,
    //          reg_vprbs_rx_order_app_route_lane@@_sync	                            ,
    //          reg_vprbs_rx_load_app_route_lane@@_sync	                            ,
    //          reg_vprbs_rx_lock_continue_app_route_lane@@_sync	                    ,
    //          reg_vprbs_rx_locked_match_cnt_app_route_lane@@_sync[3:0]	            ,
    //          reg_vprbs_rx_uncheck_tolerance_app_route_lane@@_sync[3:0]	            ,
    //          reg_vprbs_rx_err_clear_app_route_lane@@_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane@@_sync;
    
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane0  =  {reg_vprbs_tx_gen_en_app_route_lane0	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane0[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane0	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane0	                        ,
                                                             reg_vprbs_loopback_app_route_lane0	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane0	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane0[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane0[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane0[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane0[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane0[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane0	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane0[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane0	                            ,
                                                             reg_vprbs_rx_load_app_route_lane0	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane0	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane0[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane0[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane0	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane0_sync                             ,
              reg_vprbs_tx_mode_app_route_lane0_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane0_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane0_sync	                        ,
              reg_vprbs_loopback_app_route_lane0_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane0_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane0_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane0_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane0_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane0_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane0_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane0_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane0_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane0_sync	                            ,
              reg_vprbs_rx_load_app_route_lane0_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane0_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane0_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane0_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane0_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane0_sync;
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane1  =  {reg_vprbs_tx_gen_en_app_route_lane1	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane1[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane1	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane1	                        ,
                                                             reg_vprbs_loopback_app_route_lane1	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane1	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane1[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane1[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane1[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane1[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane1[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane1	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane1[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane1	                            ,
                                                             reg_vprbs_rx_load_app_route_lane1	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane1	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane1[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane1[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane1	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane1_sync                             ,
              reg_vprbs_tx_mode_app_route_lane1_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane1_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane1_sync	                        ,
              reg_vprbs_loopback_app_route_lane1_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane1_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane1_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane1_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane1_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane1_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane1_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane1_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane1_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane1_sync	                            ,
              reg_vprbs_rx_load_app_route_lane1_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane1_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane1_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane1_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane1_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane1_sync;
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane2  =  {reg_vprbs_tx_gen_en_app_route_lane2	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane2[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane2	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane2	                        ,
                                                             reg_vprbs_loopback_app_route_lane2	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane2	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane2[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane2[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane2[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane2[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane2[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane2	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane2[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane2	                            ,
                                                             reg_vprbs_rx_load_app_route_lane2	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane2	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane2[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane2[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane2	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane2_sync                             ,
              reg_vprbs_tx_mode_app_route_lane2_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane2_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane2_sync	                        ,
              reg_vprbs_loopback_app_route_lane2_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane2_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane2_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane2_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane2_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane2_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane2_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane2_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane2_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane2_sync	                            ,
              reg_vprbs_rx_load_app_route_lane2_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane2_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane2_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane2_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane2_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane2_sync;
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane3  =  {reg_vprbs_tx_gen_en_app_route_lane3	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane3[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane3	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane3	                        ,
                                                             reg_vprbs_loopback_app_route_lane3	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane3	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane3[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane3[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane3[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane3[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane3[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane3	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane3[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane3	                            ,
                                                             reg_vprbs_rx_load_app_route_lane3	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane3	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane3[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane3[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane3	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane3_sync                             ,
              reg_vprbs_tx_mode_app_route_lane3_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane3_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane3_sync	                        ,
              reg_vprbs_loopback_app_route_lane3_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane3_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane3_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane3_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane3_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane3_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane3_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane3_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane3_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane3_sync	                            ,
              reg_vprbs_rx_load_app_route_lane3_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane3_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane3_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane3_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane3_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane3_sync;
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane4  =  {reg_vprbs_tx_gen_en_app_route_lane4	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane4[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane4	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane4	                        ,
                                                             reg_vprbs_loopback_app_route_lane4	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane4	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane4[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane4[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane4[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane4[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane4[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane4	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane4[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane4	                            ,
                                                             reg_vprbs_rx_load_app_route_lane4	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane4	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane4[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane4[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane4	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane4_sync                             ,
              reg_vprbs_tx_mode_app_route_lane4_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane4_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane4_sync	                        ,
              reg_vprbs_loopback_app_route_lane4_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane4_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane4_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane4_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane4_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane4_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane4_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane4_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane4_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane4_sync	                            ,
              reg_vprbs_rx_load_app_route_lane4_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane4_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane4_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane4_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane4_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane4_sync;
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane5  =  {reg_vprbs_tx_gen_en_app_route_lane5	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane5[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane5	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane5	                        ,
                                                             reg_vprbs_loopback_app_route_lane5	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane5	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane5[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane5[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane5[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane5[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane5[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane5	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane5[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane5	                            ,
                                                             reg_vprbs_rx_load_app_route_lane5	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane5	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane5[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane5[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane5	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane5_sync                             ,
              reg_vprbs_tx_mode_app_route_lane5_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane5_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane5_sync	                        ,
              reg_vprbs_loopback_app_route_lane5_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane5_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane5_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane5_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane5_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane5_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane5_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane5_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane5_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane5_sync	                            ,
              reg_vprbs_rx_load_app_route_lane5_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane5_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane5_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane5_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane5_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane5_sync;
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane6  =  {reg_vprbs_tx_gen_en_app_route_lane6	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane6[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane6	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane6	                        ,
                                                             reg_vprbs_loopback_app_route_lane6	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane6	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane6[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane6[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane6[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane6[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane6[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane6	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane6[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane6	                            ,
                                                             reg_vprbs_rx_load_app_route_lane6	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane6	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane6[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane6[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane6	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane6_sync                             ,
              reg_vprbs_tx_mode_app_route_lane6_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane6_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane6_sync	                        ,
              reg_vprbs_loopback_app_route_lane6_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane6_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane6_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane6_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane6_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane6_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane6_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane6_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane6_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane6_sync	                            ,
              reg_vprbs_rx_load_app_route_lane6_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane6_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane6_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane6_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane6_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane6_sync;
    assign  u_sync_bus_di_reg_vprbs_test_app_route_lane7  =  {reg_vprbs_tx_gen_en_app_route_lane7	                            ,
                                                             reg_vprbs_tx_mode_app_route_lane7[2:0]	                        ,
                                                             reg_vprbs_tx_order_app_route_lane7	                            ,
                                                             reg_vprbs_tx_pat_reset_app_route_lane7	                        ,
                                                             reg_vprbs_loopback_app_route_lane7	                            ,
                                                             reg_vprbs_tx_err_inject_en_app_route_lane7	                    ,
                                                             reg_vprbs_tx_err_inject_intv_num_app_route_lane7[7:0]	            ,
                                                             reg_vprbs_tx_err_inject_intv_time_app_route_lane7[7:0]	        ,
                                                             reg_vprbs_tx_idi_driver_data_type_app_route_lane7[5:0]	        ,
                                                             reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7[3:0]      ,
                                                             reg_vprbs_tx_idi_driver_word_count_app_route_lane7[15:0]          ,
                                                             reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7[15:0]        ,
                                                             reg_vprbs_tx_idi_driver_total_interval_app_route_lane7[15:0]      ,
                                                             reg_vprbs_rx_chk_en_app_route_lane7	                            ,
                                                             reg_vprbs_rx_mode_app_route_lane7[2:0]	                        ,
                                                             reg_vprbs_rx_order_app_route_lane7	                            ,
                                                             reg_vprbs_rx_load_app_route_lane7	                                ,
                                                             reg_vprbs_rx_lock_continue_app_route_lane7	                    ,
                                                             reg_vprbs_rx_locked_match_cnt_app_route_lane7[3:0]	            ,
                                                             reg_vprbs_rx_uncheck_tolerance_app_route_lane7[3:0]	            ,
                                                             reg_vprbs_rx_err_clear_app_route_lane7	                         };
    assign   {reg_vprbs_tx_gen_en_app_route_lane7_sync                             ,
              reg_vprbs_tx_mode_app_route_lane7_sync[2:0]	                        ,
              reg_vprbs_tx_order_app_route_lane7_sync	                            ,
              reg_vprbs_tx_pat_reset_app_route_lane7_sync	                        ,
              reg_vprbs_loopback_app_route_lane7_sync	                            ,
              reg_vprbs_tx_err_inject_en_app_route_lane7_sync	                    ,
              reg_vprbs_tx_err_inject_intv_num_app_route_lane7_sync[7:0]	        ,
              reg_vprbs_tx_err_inject_intv_time_app_route_lane7_sync[7:0]	        ,
              reg_vprbs_tx_idi_driver_data_type_app_route_lane7_sync[5:0]	        ,
              reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7_sync[3:0]    ,
              reg_vprbs_tx_idi_driver_word_count_app_route_lane7_sync[15:0]        ,
              reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7_sync[15:0]      ,
              reg_vprbs_tx_idi_driver_total_interval_app_route_lane7_sync[15:0]    ,
              reg_vprbs_rx_chk_en_app_route_lane7_sync	                            ,
              reg_vprbs_rx_mode_app_route_lane7_sync[2:0]	                        ,
              reg_vprbs_rx_order_app_route_lane7_sync	                            ,
              reg_vprbs_rx_load_app_route_lane7_sync	                            ,
              reg_vprbs_rx_lock_continue_app_route_lane7_sync	                    ,
              reg_vprbs_rx_locked_match_cnt_app_route_lane7_sync[3:0]	            ,
              reg_vprbs_rx_uncheck_tolerance_app_route_lane7_sync[3:0]	            ,
              reg_vprbs_rx_err_clear_app_route_lane7_sync	                         } = u_sync_bus_di_reg_vprbs_test_app_route_lane7_sync;
    
    
    //sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane@@(
    //								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane@@_sync),
    //								       .src_clk		(treed_reg_bank_clk), 
    //								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    //								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane@@), 
    //								       .dst_clk		(fifo_wrclk@@),	 
    //								       .dst_rstn	(fifo_wrclk_rst_n@@)); 
    
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane0(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane0_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane0), 
    								       .dst_clk		(fifo_wrclk0),	 
    								       .dst_rstn	(fifo_wrclk_rst_n0)); 
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane1(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane1_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane1), 
    								       .dst_clk		(fifo_wrclk1),	 
    								       .dst_rstn	(fifo_wrclk_rst_n1)); 
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane2(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane2_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane2), 
    								       .dst_clk		(fifo_wrclk2),	 
    								       .dst_rstn	(fifo_wrclk_rst_n2)); 
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane3(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane3_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane3), 
    								       .dst_clk		(fifo_wrclk3),	 
    								       .dst_rstn	(fifo_wrclk_rst_n3)); 
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane4(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane4_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane4), 
    								       .dst_clk		(fifo_wrclk4),	 
    								       .dst_rstn	(fifo_wrclk_rst_n4)); 
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane5(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane5_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane5), 
    								       .dst_clk		(fifo_wrclk5),	 
    								       .dst_rstn	(fifo_wrclk_rst_n5)); 
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane6(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane6_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane6), 
    								       .dst_clk		(fifo_wrclk6),	 
    								       .dst_rstn	(fifo_wrclk_rst_n6)); 
    sync_bus #(.BUS_WIDTH(98))   u_sync_bus_reg_vprbs_test_app_route_lane7(
    								       .dst_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane7_sync),
    								       .src_clk		(treed_reg_bank_clk), 
    								       .src_rstn	(treed_reg_bank_clk_reset_n), 
    								       .src_bus		(u_sync_bus_di_reg_vprbs_test_app_route_lane7), 
    								       .dst_clk		(fifo_wrclk7),	 
    								       .dst_rstn	(fifo_wrclk_rst_n7)); 
    
    
    /*int_reg_lock AUTO_TEMPLATE()*/
    int_reg_lock u_int_reg_lock(/*AUTOINST*/
				// Outputs
				.app_async_rst_req(app_async_rst_req),
				// Inputs
				.aggre_clk0	(aggre_clk0),
				.aggre_clk1	(aggre_clk1),
				.aggre_clk2	(aggre_clk2),
				.aggre_clk3	(aggre_clk3),
				.aggre_clk_rst_n0(aggre_clk_rst_n0),
				.aggre_clk_rst_n1(aggre_clk_rst_n1),
				.aggre_clk_rst_n2(aggre_clk_rst_n2),
				.aggre_clk_rst_n3(aggre_clk_rst_n3),
				.fifo_rdclk0	(fifo_rdclk0),
				.fifo_rdclk1	(fifo_rdclk1),
				.fifo_rdclk2	(fifo_rdclk2),
				.fifo_rdclk3	(fifo_rdclk3),
				.fifo_rdclk4	(fifo_rdclk4),
				.fifo_rdclk5	(fifo_rdclk5),
				.fifo_rdclk6	(fifo_rdclk6),
				.fifo_rdclk7	(fifo_rdclk7),
				.fifo_rdclk_rst_n0(fifo_rdclk_rst_n0),
				.fifo_rdclk_rst_n1(fifo_rdclk_rst_n1),
				.fifo_rdclk_rst_n2(fifo_rdclk_rst_n2),
				.fifo_rdclk_rst_n3(fifo_rdclk_rst_n3),
				.fifo_rdclk_rst_n4(fifo_rdclk_rst_n4),
				.fifo_rdclk_rst_n5(fifo_rdclk_rst_n5),
				.fifo_rdclk_rst_n6(fifo_rdclk_rst_n6),
				.fifo_rdclk_rst_n7(fifo_rdclk_rst_n7),
				.reg_sch_data_type_align_fail_int_mask0(reg_sch_data_type_align_fail_int_mask0),
				.reg_sch_data_type_align_fail_int_mask1(reg_sch_data_type_align_fail_int_mask1),
				.reg_sch_data_type_align_fail_int_mask2(reg_sch_data_type_align_fail_int_mask2),
				.reg_sch_data_type_align_fail_int_mask3(reg_sch_data_type_align_fail_int_mask3),
				.reg_video_data_fwft_fifo_ovf_int_mask0(reg_video_data_fwft_fifo_ovf_int_mask0),
				.reg_video_data_fwft_fifo_ovf_int_mask1(reg_video_data_fwft_fifo_ovf_int_mask1),
				.reg_video_data_fwft_fifo_ovf_int_mask2(reg_video_data_fwft_fifo_ovf_int_mask2),
				.reg_video_data_fwft_fifo_ovf_int_mask3(reg_video_data_fwft_fifo_ovf_int_mask3),
				.reg_video_data_fwft_fifo_ovf_int_mask4(reg_video_data_fwft_fifo_ovf_int_mask4),
				.reg_video_data_fwft_fifo_ovf_int_mask5(reg_video_data_fwft_fifo_ovf_int_mask5),
				.reg_video_data_fwft_fifo_ovf_int_mask6(reg_video_data_fwft_fifo_ovf_int_mask6),
				.reg_video_data_fwft_fifo_ovf_int_mask7(reg_video_data_fwft_fifo_ovf_int_mask7),
				.sch_data_type_align_fail_int0(sch_data_type_align_fail_int0),
				.sch_data_type_align_fail_int1(sch_data_type_align_fail_int1),
				.sch_data_type_align_fail_int2(sch_data_type_align_fail_int2),
				.sch_data_type_align_fail_int3(sch_data_type_align_fail_int3),
				.video_data_fwft_fifo_ovf_int0(video_data_fwft_fifo_ovf_int0),
				.video_data_fwft_fifo_ovf_int1(video_data_fwft_fifo_ovf_int1),
				.video_data_fwft_fifo_ovf_int2(video_data_fwft_fifo_ovf_int2),
				.video_data_fwft_fifo_ovf_int3(video_data_fwft_fifo_ovf_int3),
				.video_data_fwft_fifo_ovf_int4(video_data_fwft_fifo_ovf_int4),
				.video_data_fwft_fifo_ovf_int5(video_data_fwft_fifo_ovf_int5),
				.video_data_fwft_fifo_ovf_int6(video_data_fwft_fifo_ovf_int6),
				.video_data_fwft_fifo_ovf_int7(video_data_fwft_fifo_ovf_int7));
    
endmodule
