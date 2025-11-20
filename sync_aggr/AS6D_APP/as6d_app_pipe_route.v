
`include "as6d_app_all_includes.vh"
module as6d_app_pipe_route	#(

	)(/*AUTOARG*/
   // Outputs
   reg_rd_vprbs_rx_fail_app_route_lane7,
   reg_rd_vprbs_rx_fail_app_route_lane6,
   reg_rd_vprbs_rx_fail_app_route_lane5,
   reg_rd_vprbs_rx_fail_app_route_lane4,
   reg_rd_vprbs_rx_fail_app_route_lane3,
   reg_rd_vprbs_rx_fail_app_route_lane2,
   reg_rd_vprbs_rx_fail_app_route_lane1,
   reg_rd_vprbs_rx_fail_app_route_lane0,
   reg_rd_vprbs_rx_err_app_route_lane7,
   reg_rd_vprbs_rx_err_app_route_lane6,
   reg_rd_vprbs_rx_err_app_route_lane5,
   reg_rd_vprbs_rx_err_app_route_lane4,
   reg_rd_vprbs_rx_err_app_route_lane3,
   reg_rd_vprbs_rx_err_app_route_lane2,
   reg_rd_vprbs_rx_err_app_route_lane1,
   reg_rd_vprbs_rx_err_app_route_lane0,
   reg_rd_vprbs_rx_check_app_route_lane7,
   reg_rd_vprbs_rx_check_app_route_lane6,
   reg_rd_vprbs_rx_check_app_route_lane5,
   reg_rd_vprbs_rx_check_app_route_lane4,
   reg_rd_vprbs_rx_check_app_route_lane3,
   reg_rd_vprbs_rx_check_app_route_lane2,
   reg_rd_vprbs_rx_check_app_route_lane1,
   reg_rd_vprbs_rx_check_app_route_lane0, pipe7_pkt_crc_en,
   pipe7_pkt_crc, pipe6_pkt_crc_en, pipe6_pkt_crc, pipe5_pkt_crc_en,
   pipe5_pkt_crc, pipe4_pkt_crc_en, pipe4_pkt_crc, pipe3_pkt_crc_en,
   pipe3_pkt_crc, pipe3_frame_active, pipe2_pkt_crc_en, pipe2_pkt_crc,
   pipe2_frame_active, pipe1_pkt_crc_en, pipe1_pkt_crc,
   pipe1_frame_active, pipe0_pkt_crc_en, pipe0_pkt_crc,
   pipe0_frame_active, pipe0_csi_data, pipe0_bytes_en,
   pipe0_header_en, pipe0_data_en, pipe0_data_type,
   pipe0_virtual_channel, pipe0_virtual_channel_x, pipe0_word_count,
   pipe0_aggr_id, pipe1_csi_data, pipe1_bytes_en, pipe1_header_en,
   pipe1_data_en, pipe1_data_type, pipe1_virtual_channel,
   pipe1_virtual_channel_x, pipe1_word_count, pipe1_aggr_id,
   pipe2_csi_data, pipe2_bytes_en, pipe2_header_en, pipe2_data_en,
   pipe2_data_type, pipe2_virtual_channel, pipe2_virtual_channel_x,
   pipe2_word_count, pipe2_aggr_id, pipe3_csi_data, pipe3_bytes_en,
   pipe3_header_en, pipe3_data_en, pipe3_data_type,
   pipe3_virtual_channel, pipe3_virtual_channel_x, pipe3_word_count,
   pipe3_aggr_id, pipe4_csi_data, pipe4_bytes_en, pipe4_header_en,
   pipe4_data_en, pipe4_data_type, pipe4_virtual_channel,
   pipe4_virtual_channel_x, pipe4_word_count, pipe4_aggr_id,
   pipe5_csi_data, pipe5_bytes_en, pipe5_header_en, pipe5_data_en,
   pipe5_data_type, pipe5_virtual_channel, pipe5_virtual_channel_x,
   pipe5_word_count, pipe5_aggr_id, pipe6_csi_data, pipe6_bytes_en,
   pipe6_header_en, pipe6_data_en, pipe6_data_type,
   pipe6_virtual_channel, pipe6_virtual_channel_x, pipe6_word_count,
   pipe6_aggr_id, pipe7_csi_data, pipe7_bytes_en, pipe7_header_en,
   pipe7_data_en, pipe7_data_type, pipe7_virtual_channel,
   pipe7_virtual_channel_x, pipe7_word_count, pipe7_aggr_id,
   // Inputs
   reg_vprbs_tx_pat_reset_app_route_lane7,
   reg_vprbs_tx_pat_reset_app_route_lane6,
   reg_vprbs_tx_pat_reset_app_route_lane5,
   reg_vprbs_tx_pat_reset_app_route_lane4,
   reg_vprbs_tx_pat_reset_app_route_lane3,
   reg_vprbs_tx_pat_reset_app_route_lane2,
   reg_vprbs_tx_pat_reset_app_route_lane1,
   reg_vprbs_tx_pat_reset_app_route_lane0,
   reg_vprbs_tx_order_app_route_lane7,
   reg_vprbs_tx_order_app_route_lane6,
   reg_vprbs_tx_order_app_route_lane5,
   reg_vprbs_tx_order_app_route_lane4,
   reg_vprbs_tx_order_app_route_lane3,
   reg_vprbs_tx_order_app_route_lane2,
   reg_vprbs_tx_order_app_route_lane1,
   reg_vprbs_tx_order_app_route_lane0,
   reg_vprbs_tx_mode_app_route_lane7,
   reg_vprbs_tx_mode_app_route_lane6,
   reg_vprbs_tx_mode_app_route_lane5,
   reg_vprbs_tx_mode_app_route_lane4,
   reg_vprbs_tx_mode_app_route_lane3,
   reg_vprbs_tx_mode_app_route_lane2,
   reg_vprbs_tx_mode_app_route_lane1,
   reg_vprbs_tx_mode_app_route_lane0,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane7,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane6,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane5,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane4,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane3,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane2,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane1,
   reg_vprbs_tx_idi_driver_word_count_app_route_lane0,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1,
   reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane7,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane6,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane5,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane4,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane3,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane2,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane1,
   reg_vprbs_tx_idi_driver_total_interval_app_route_lane0,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1,
   reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane7,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane6,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane5,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane4,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane3,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane2,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane1,
   reg_vprbs_tx_idi_driver_data_type_app_route_lane0,
   reg_vprbs_tx_gen_en_app_route_lane7,
   reg_vprbs_tx_gen_en_app_route_lane6,
   reg_vprbs_tx_gen_en_app_route_lane5,
   reg_vprbs_tx_gen_en_app_route_lane4,
   reg_vprbs_tx_gen_en_app_route_lane3,
   reg_vprbs_tx_gen_en_app_route_lane2,
   reg_vprbs_tx_gen_en_app_route_lane1,
   reg_vprbs_tx_gen_en_app_route_lane0,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane7,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane6,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane5,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane4,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane3,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane2,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane1,
   reg_vprbs_tx_err_inject_intv_time_app_route_lane0,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane7,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane6,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane5,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane4,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane3,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane2,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane1,
   reg_vprbs_tx_err_inject_intv_num_app_route_lane0,
   reg_vprbs_tx_err_inject_en_app_route_lane7,
   reg_vprbs_tx_err_inject_en_app_route_lane6,
   reg_vprbs_tx_err_inject_en_app_route_lane5,
   reg_vprbs_tx_err_inject_en_app_route_lane4,
   reg_vprbs_tx_err_inject_en_app_route_lane3,
   reg_vprbs_tx_err_inject_en_app_route_lane2,
   reg_vprbs_tx_err_inject_en_app_route_lane1,
   reg_vprbs_tx_err_inject_en_app_route_lane0,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane7,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane6,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane5,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane4,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane3,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane2,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane1,
   reg_vprbs_rx_uncheck_tolerance_app_route_lane0,
   reg_vprbs_rx_order_app_route_lane7,
   reg_vprbs_rx_order_app_route_lane6,
   reg_vprbs_rx_order_app_route_lane5,
   reg_vprbs_rx_order_app_route_lane4,
   reg_vprbs_rx_order_app_route_lane3,
   reg_vprbs_rx_order_app_route_lane2,
   reg_vprbs_rx_order_app_route_lane1,
   reg_vprbs_rx_order_app_route_lane0,
   reg_vprbs_rx_mode_app_route_lane7,
   reg_vprbs_rx_mode_app_route_lane6,
   reg_vprbs_rx_mode_app_route_lane5,
   reg_vprbs_rx_mode_app_route_lane4,
   reg_vprbs_rx_mode_app_route_lane3,
   reg_vprbs_rx_mode_app_route_lane2,
   reg_vprbs_rx_mode_app_route_lane1,
   reg_vprbs_rx_mode_app_route_lane0,
   reg_vprbs_rx_locked_match_cnt_app_route_lane7,
   reg_vprbs_rx_locked_match_cnt_app_route_lane6,
   reg_vprbs_rx_locked_match_cnt_app_route_lane5,
   reg_vprbs_rx_locked_match_cnt_app_route_lane4,
   reg_vprbs_rx_locked_match_cnt_app_route_lane3,
   reg_vprbs_rx_locked_match_cnt_app_route_lane2,
   reg_vprbs_rx_locked_match_cnt_app_route_lane1,
   reg_vprbs_rx_locked_match_cnt_app_route_lane0,
   reg_vprbs_rx_lock_continue_app_route_lane7,
   reg_vprbs_rx_lock_continue_app_route_lane6,
   reg_vprbs_rx_lock_continue_app_route_lane5,
   reg_vprbs_rx_lock_continue_app_route_lane4,
   reg_vprbs_rx_lock_continue_app_route_lane3,
   reg_vprbs_rx_lock_continue_app_route_lane2,
   reg_vprbs_rx_lock_continue_app_route_lane1,
   reg_vprbs_rx_lock_continue_app_route_lane0,
   reg_vprbs_rx_load_app_route_lane7,
   reg_vprbs_rx_load_app_route_lane6,
   reg_vprbs_rx_load_app_route_lane5,
   reg_vprbs_rx_load_app_route_lane4,
   reg_vprbs_rx_load_app_route_lane3,
   reg_vprbs_rx_load_app_route_lane2,
   reg_vprbs_rx_load_app_route_lane1,
   reg_vprbs_rx_load_app_route_lane0,
   reg_vprbs_rx_err_clear_app_route_lane7,
   reg_vprbs_rx_err_clear_app_route_lane6,
   reg_vprbs_rx_err_clear_app_route_lane5,
   reg_vprbs_rx_err_clear_app_route_lane4,
   reg_vprbs_rx_err_clear_app_route_lane3,
   reg_vprbs_rx_err_clear_app_route_lane2,
   reg_vprbs_rx_err_clear_app_route_lane1,
   reg_vprbs_rx_err_clear_app_route_lane0,
   reg_vprbs_rx_chk_en_app_route_lane7,
   reg_vprbs_rx_chk_en_app_route_lane6,
   reg_vprbs_rx_chk_en_app_route_lane5,
   reg_vprbs_rx_chk_en_app_route_lane4,
   reg_vprbs_rx_chk_en_app_route_lane3,
   reg_vprbs_rx_chk_en_app_route_lane2,
   reg_vprbs_rx_chk_en_app_route_lane1,
   reg_vprbs_rx_chk_en_app_route_lane0,
   reg_vprbs_loopback_app_route_lane7,
   reg_vprbs_loopback_app_route_lane6,
   reg_vprbs_loopback_app_route_lane5,
   reg_vprbs_loopback_app_route_lane4,
   reg_vprbs_loopback_app_route_lane3,
   reg_vprbs_loopback_app_route_lane2,
   reg_vprbs_loopback_app_route_lane1,
   reg_vprbs_loopback_app_route_lane0, reg_pipe7_drop_ls_le_pkt,
   reg_pipe6_drop_ls_le_pkt, reg_pipe5_drop_ls_le_pkt,
   reg_pipe4_drop_ls_le_pkt, reg_pipe3_drop_ls_le_pkt,
   reg_pipe2_drop_ls_le_pkt, reg_pipe1_drop_ls_le_pkt,
   reg_pipe0_drop_ls_le_pkt, reg_drop_mapping_fault_pkt,
   mep3_tunnel_mode_en, mep3_pkt_crc_en, mep3_pkt_crc,
   mep2_tunnel_mode_en, mep2_pkt_crc_en, mep2_pkt_crc,
   mep1_tunnel_mode_en, mep1_pkt_crc_en, mep1_pkt_crc,
   mep0_tunnel_mode_en, mep0_pkt_crc_en, mep0_pkt_crc, fifo_wrclk0,
   fifo_wrclk1, fifo_wrclk2, fifo_wrclk3, fifo_wrclk4, fifo_wrclk5,
   fifo_wrclk6, fifo_wrclk7, fifo_wrclk_rst_n0, fifo_wrclk_rst_n1,
   fifo_wrclk_rst_n2, fifo_wrclk_rst_n3, fifo_wrclk_rst_n4,
   fifo_wrclk_rst_n5, fifo_wrclk_rst_n6, fifo_wrclk_rst_n7,
   pipe0_wr_mode, reg_pipe0_stream_sel, reg_pipe0_map_en,
   reg_pipe0_map0_aggr_id, reg_pipe0_map1_aggr_id,
   reg_pipe0_map2_aggr_id, reg_pipe0_map3_aggr_id,
   reg_pipe0_map4_aggr_id, reg_pipe0_map5_aggr_id,
   reg_pipe0_map6_aggr_id, reg_pipe0_map7_aggr_id,
   reg_pipe0_map8_aggr_id, reg_pipe0_map9_aggr_id,
   reg_pipe0_map10_aggr_id, reg_pipe0_map11_aggr_id,
   reg_pipe0_map12_aggr_id, reg_pipe0_map13_aggr_id,
   reg_pipe0_map14_aggr_id, reg_pipe0_map15_aggr_id,
   reg_pipe0_map0_vc_source, reg_pipe0_map1_vc_source,
   reg_pipe0_map2_vc_source, reg_pipe0_map3_vc_source,
   reg_pipe0_map4_vc_source, reg_pipe0_map5_vc_source,
   reg_pipe0_map6_vc_source, reg_pipe0_map7_vc_source,
   reg_pipe0_map8_vc_source, reg_pipe0_map9_vc_source,
   reg_pipe0_map10_vc_source, reg_pipe0_map11_vc_source,
   reg_pipe0_map12_vc_source, reg_pipe0_map13_vc_source,
   reg_pipe0_map14_vc_source, reg_pipe0_map15_vc_source,
   reg_pipe0_map0_vc_dest, reg_pipe0_map1_vc_dest,
   reg_pipe0_map2_vc_dest, reg_pipe0_map3_vc_dest,
   reg_pipe0_map4_vc_dest, reg_pipe0_map5_vc_dest,
   reg_pipe0_map6_vc_dest, reg_pipe0_map7_vc_dest,
   reg_pipe0_map8_vc_dest, reg_pipe0_map9_vc_dest,
   reg_pipe0_map10_vc_dest, reg_pipe0_map11_vc_dest,
   reg_pipe0_map12_vc_dest, reg_pipe0_map13_vc_dest,
   reg_pipe0_map14_vc_dest, reg_pipe0_map15_vc_dest,
   reg_pipe0_map0_dt_source, reg_pipe0_map1_dt_source,
   reg_pipe0_map2_dt_source, reg_pipe0_map3_dt_source,
   reg_pipe0_map4_dt_source, reg_pipe0_map5_dt_source,
   reg_pipe0_map6_dt_source, reg_pipe0_map7_dt_source,
   reg_pipe0_map8_dt_source, reg_pipe0_map9_dt_source,
   reg_pipe0_map10_dt_source, reg_pipe0_map11_dt_source,
   reg_pipe0_map12_dt_source, reg_pipe0_map13_dt_source,
   reg_pipe0_map14_dt_source, reg_pipe0_map15_dt_source,
   reg_pipe0_map0_dt_dest, reg_pipe0_map1_dt_dest,
   reg_pipe0_map2_dt_dest, reg_pipe0_map3_dt_dest,
   reg_pipe0_map4_dt_dest, reg_pipe0_map5_dt_dest,
   reg_pipe0_map6_dt_dest, reg_pipe0_map7_dt_dest,
   reg_pipe0_map8_dt_dest, reg_pipe0_map9_dt_dest,
   reg_pipe0_map10_dt_dest, reg_pipe0_map11_dt_dest,
   reg_pipe0_map12_dt_dest, reg_pipe0_map13_dt_dest,
   reg_pipe0_map14_dt_dest, reg_pipe0_map15_dt_dest, pipe1_wr_mode,
   reg_pipe1_stream_sel, reg_pipe1_map_en, reg_pipe1_map0_aggr_id,
   reg_pipe1_map1_aggr_id, reg_pipe1_map2_aggr_id,
   reg_pipe1_map3_aggr_id, reg_pipe1_map4_aggr_id,
   reg_pipe1_map5_aggr_id, reg_pipe1_map6_aggr_id,
   reg_pipe1_map7_aggr_id, reg_pipe1_map8_aggr_id,
   reg_pipe1_map9_aggr_id, reg_pipe1_map10_aggr_id,
   reg_pipe1_map11_aggr_id, reg_pipe1_map12_aggr_id,
   reg_pipe1_map13_aggr_id, reg_pipe1_map14_aggr_id,
   reg_pipe1_map15_aggr_id, reg_pipe1_map0_vc_source,
   reg_pipe1_map1_vc_source, reg_pipe1_map2_vc_source,
   reg_pipe1_map3_vc_source, reg_pipe1_map4_vc_source,
   reg_pipe1_map5_vc_source, reg_pipe1_map6_vc_source,
   reg_pipe1_map7_vc_source, reg_pipe1_map8_vc_source,
   reg_pipe1_map9_vc_source, reg_pipe1_map10_vc_source,
   reg_pipe1_map11_vc_source, reg_pipe1_map12_vc_source,
   reg_pipe1_map13_vc_source, reg_pipe1_map14_vc_source,
   reg_pipe1_map15_vc_source, reg_pipe1_map0_vc_dest,
   reg_pipe1_map1_vc_dest, reg_pipe1_map2_vc_dest,
   reg_pipe1_map3_vc_dest, reg_pipe1_map4_vc_dest,
   reg_pipe1_map5_vc_dest, reg_pipe1_map6_vc_dest,
   reg_pipe1_map7_vc_dest, reg_pipe1_map8_vc_dest,
   reg_pipe1_map9_vc_dest, reg_pipe1_map10_vc_dest,
   reg_pipe1_map11_vc_dest, reg_pipe1_map12_vc_dest,
   reg_pipe1_map13_vc_dest, reg_pipe1_map14_vc_dest,
   reg_pipe1_map15_vc_dest, reg_pipe1_map0_dt_source,
   reg_pipe1_map1_dt_source, reg_pipe1_map2_dt_source,
   reg_pipe1_map3_dt_source, reg_pipe1_map4_dt_source,
   reg_pipe1_map5_dt_source, reg_pipe1_map6_dt_source,
   reg_pipe1_map7_dt_source, reg_pipe1_map8_dt_source,
   reg_pipe1_map9_dt_source, reg_pipe1_map10_dt_source,
   reg_pipe1_map11_dt_source, reg_pipe1_map12_dt_source,
   reg_pipe1_map13_dt_source, reg_pipe1_map14_dt_source,
   reg_pipe1_map15_dt_source, reg_pipe1_map0_dt_dest,
   reg_pipe1_map1_dt_dest, reg_pipe1_map2_dt_dest,
   reg_pipe1_map3_dt_dest, reg_pipe1_map4_dt_dest,
   reg_pipe1_map5_dt_dest, reg_pipe1_map6_dt_dest,
   reg_pipe1_map7_dt_dest, reg_pipe1_map8_dt_dest,
   reg_pipe1_map9_dt_dest, reg_pipe1_map10_dt_dest,
   reg_pipe1_map11_dt_dest, reg_pipe1_map12_dt_dest,
   reg_pipe1_map13_dt_dest, reg_pipe1_map14_dt_dest,
   reg_pipe1_map15_dt_dest, pipe2_wr_mode, reg_pipe2_stream_sel,
   reg_pipe2_map_en, reg_pipe2_map0_aggr_id, reg_pipe2_map1_aggr_id,
   reg_pipe2_map2_aggr_id, reg_pipe2_map3_aggr_id,
   reg_pipe2_map4_aggr_id, reg_pipe2_map5_aggr_id,
   reg_pipe2_map6_aggr_id, reg_pipe2_map7_aggr_id,
   reg_pipe2_map8_aggr_id, reg_pipe2_map9_aggr_id,
   reg_pipe2_map10_aggr_id, reg_pipe2_map11_aggr_id,
   reg_pipe2_map12_aggr_id, reg_pipe2_map13_aggr_id,
   reg_pipe2_map14_aggr_id, reg_pipe2_map15_aggr_id,
   reg_pipe2_map0_vc_source, reg_pipe2_map1_vc_source,
   reg_pipe2_map2_vc_source, reg_pipe2_map3_vc_source,
   reg_pipe2_map4_vc_source, reg_pipe2_map5_vc_source,
   reg_pipe2_map6_vc_source, reg_pipe2_map7_vc_source,
   reg_pipe2_map8_vc_source, reg_pipe2_map9_vc_source,
   reg_pipe2_map10_vc_source, reg_pipe2_map11_vc_source,
   reg_pipe2_map12_vc_source, reg_pipe2_map13_vc_source,
   reg_pipe2_map14_vc_source, reg_pipe2_map15_vc_source,
   reg_pipe2_map0_vc_dest, reg_pipe2_map1_vc_dest,
   reg_pipe2_map2_vc_dest, reg_pipe2_map3_vc_dest,
   reg_pipe2_map4_vc_dest, reg_pipe2_map5_vc_dest,
   reg_pipe2_map6_vc_dest, reg_pipe2_map7_vc_dest,
   reg_pipe2_map8_vc_dest, reg_pipe2_map9_vc_dest,
   reg_pipe2_map10_vc_dest, reg_pipe2_map11_vc_dest,
   reg_pipe2_map12_vc_dest, reg_pipe2_map13_vc_dest,
   reg_pipe2_map14_vc_dest, reg_pipe2_map15_vc_dest,
   reg_pipe2_map0_dt_source, reg_pipe2_map1_dt_source,
   reg_pipe2_map2_dt_source, reg_pipe2_map3_dt_source,
   reg_pipe2_map4_dt_source, reg_pipe2_map5_dt_source,
   reg_pipe2_map6_dt_source, reg_pipe2_map7_dt_source,
   reg_pipe2_map8_dt_source, reg_pipe2_map9_dt_source,
   reg_pipe2_map10_dt_source, reg_pipe2_map11_dt_source,
   reg_pipe2_map12_dt_source, reg_pipe2_map13_dt_source,
   reg_pipe2_map14_dt_source, reg_pipe2_map15_dt_source,
   reg_pipe2_map0_dt_dest, reg_pipe2_map1_dt_dest,
   reg_pipe2_map2_dt_dest, reg_pipe2_map3_dt_dest,
   reg_pipe2_map4_dt_dest, reg_pipe2_map5_dt_dest,
   reg_pipe2_map6_dt_dest, reg_pipe2_map7_dt_dest,
   reg_pipe2_map8_dt_dest, reg_pipe2_map9_dt_dest,
   reg_pipe2_map10_dt_dest, reg_pipe2_map11_dt_dest,
   reg_pipe2_map12_dt_dest, reg_pipe2_map13_dt_dest,
   reg_pipe2_map14_dt_dest, reg_pipe2_map15_dt_dest, pipe3_wr_mode,
   reg_pipe3_stream_sel, reg_pipe3_map_en, reg_pipe3_map0_aggr_id,
   reg_pipe3_map1_aggr_id, reg_pipe3_map2_aggr_id,
   reg_pipe3_map3_aggr_id, reg_pipe3_map4_aggr_id,
   reg_pipe3_map5_aggr_id, reg_pipe3_map6_aggr_id,
   reg_pipe3_map7_aggr_id, reg_pipe3_map8_aggr_id,
   reg_pipe3_map9_aggr_id, reg_pipe3_map10_aggr_id,
   reg_pipe3_map11_aggr_id, reg_pipe3_map12_aggr_id,
   reg_pipe3_map13_aggr_id, reg_pipe3_map14_aggr_id,
   reg_pipe3_map15_aggr_id, reg_pipe3_map0_vc_source,
   reg_pipe3_map1_vc_source, reg_pipe3_map2_vc_source,
   reg_pipe3_map3_vc_source, reg_pipe3_map4_vc_source,
   reg_pipe3_map5_vc_source, reg_pipe3_map6_vc_source,
   reg_pipe3_map7_vc_source, reg_pipe3_map8_vc_source,
   reg_pipe3_map9_vc_source, reg_pipe3_map10_vc_source,
   reg_pipe3_map11_vc_source, reg_pipe3_map12_vc_source,
   reg_pipe3_map13_vc_source, reg_pipe3_map14_vc_source,
   reg_pipe3_map15_vc_source, reg_pipe3_map0_vc_dest,
   reg_pipe3_map1_vc_dest, reg_pipe3_map2_vc_dest,
   reg_pipe3_map3_vc_dest, reg_pipe3_map4_vc_dest,
   reg_pipe3_map5_vc_dest, reg_pipe3_map6_vc_dest,
   reg_pipe3_map7_vc_dest, reg_pipe3_map8_vc_dest,
   reg_pipe3_map9_vc_dest, reg_pipe3_map10_vc_dest,
   reg_pipe3_map11_vc_dest, reg_pipe3_map12_vc_dest,
   reg_pipe3_map13_vc_dest, reg_pipe3_map14_vc_dest,
   reg_pipe3_map15_vc_dest, reg_pipe3_map0_dt_source,
   reg_pipe3_map1_dt_source, reg_pipe3_map2_dt_source,
   reg_pipe3_map3_dt_source, reg_pipe3_map4_dt_source,
   reg_pipe3_map5_dt_source, reg_pipe3_map6_dt_source,
   reg_pipe3_map7_dt_source, reg_pipe3_map8_dt_source,
   reg_pipe3_map9_dt_source, reg_pipe3_map10_dt_source,
   reg_pipe3_map11_dt_source, reg_pipe3_map12_dt_source,
   reg_pipe3_map13_dt_source, reg_pipe3_map14_dt_source,
   reg_pipe3_map15_dt_source, reg_pipe3_map0_dt_dest,
   reg_pipe3_map1_dt_dest, reg_pipe3_map2_dt_dest,
   reg_pipe3_map3_dt_dest, reg_pipe3_map4_dt_dest,
   reg_pipe3_map5_dt_dest, reg_pipe3_map6_dt_dest,
   reg_pipe3_map7_dt_dest, reg_pipe3_map8_dt_dest,
   reg_pipe3_map9_dt_dest, reg_pipe3_map10_dt_dest,
   reg_pipe3_map11_dt_dest, reg_pipe3_map12_dt_dest,
   reg_pipe3_map13_dt_dest, reg_pipe3_map14_dt_dest,
   reg_pipe3_map15_dt_dest, pipe4_wr_mode, reg_pipe4_stream_sel,
   reg_pipe4_map_en, reg_pipe4_map0_aggr_id, reg_pipe4_map1_aggr_id,
   reg_pipe4_map2_aggr_id, reg_pipe4_map3_aggr_id,
   reg_pipe4_map4_aggr_id, reg_pipe4_map5_aggr_id,
   reg_pipe4_map6_aggr_id, reg_pipe4_map7_aggr_id,
   reg_pipe4_map8_aggr_id, reg_pipe4_map9_aggr_id,
   reg_pipe4_map10_aggr_id, reg_pipe4_map11_aggr_id,
   reg_pipe4_map12_aggr_id, reg_pipe4_map13_aggr_id,
   reg_pipe4_map14_aggr_id, reg_pipe4_map15_aggr_id,
   reg_pipe4_map0_vc_source, reg_pipe4_map1_vc_source,
   reg_pipe4_map2_vc_source, reg_pipe4_map3_vc_source,
   reg_pipe4_map4_vc_source, reg_pipe4_map5_vc_source,
   reg_pipe4_map6_vc_source, reg_pipe4_map7_vc_source,
   reg_pipe4_map8_vc_source, reg_pipe4_map9_vc_source,
   reg_pipe4_map10_vc_source, reg_pipe4_map11_vc_source,
   reg_pipe4_map12_vc_source, reg_pipe4_map13_vc_source,
   reg_pipe4_map14_vc_source, reg_pipe4_map15_vc_source,
   reg_pipe4_map0_vc_dest, reg_pipe4_map1_vc_dest,
   reg_pipe4_map2_vc_dest, reg_pipe4_map3_vc_dest,
   reg_pipe4_map4_vc_dest, reg_pipe4_map5_vc_dest,
   reg_pipe4_map6_vc_dest, reg_pipe4_map7_vc_dest,
   reg_pipe4_map8_vc_dest, reg_pipe4_map9_vc_dest,
   reg_pipe4_map10_vc_dest, reg_pipe4_map11_vc_dest,
   reg_pipe4_map12_vc_dest, reg_pipe4_map13_vc_dest,
   reg_pipe4_map14_vc_dest, reg_pipe4_map15_vc_dest,
   reg_pipe4_map0_dt_source, reg_pipe4_map1_dt_source,
   reg_pipe4_map2_dt_source, reg_pipe4_map3_dt_source,
   reg_pipe4_map4_dt_source, reg_pipe4_map5_dt_source,
   reg_pipe4_map6_dt_source, reg_pipe4_map7_dt_source,
   reg_pipe4_map8_dt_source, reg_pipe4_map9_dt_source,
   reg_pipe4_map10_dt_source, reg_pipe4_map11_dt_source,
   reg_pipe4_map12_dt_source, reg_pipe4_map13_dt_source,
   reg_pipe4_map14_dt_source, reg_pipe4_map15_dt_source,
   reg_pipe4_map0_dt_dest, reg_pipe4_map1_dt_dest,
   reg_pipe4_map2_dt_dest, reg_pipe4_map3_dt_dest,
   reg_pipe4_map4_dt_dest, reg_pipe4_map5_dt_dest,
   reg_pipe4_map6_dt_dest, reg_pipe4_map7_dt_dest,
   reg_pipe4_map8_dt_dest, reg_pipe4_map9_dt_dest,
   reg_pipe4_map10_dt_dest, reg_pipe4_map11_dt_dest,
   reg_pipe4_map12_dt_dest, reg_pipe4_map13_dt_dest,
   reg_pipe4_map14_dt_dest, reg_pipe4_map15_dt_dest, pipe5_wr_mode,
   reg_pipe5_stream_sel, reg_pipe5_map_en, reg_pipe5_map0_aggr_id,
   reg_pipe5_map1_aggr_id, reg_pipe5_map2_aggr_id,
   reg_pipe5_map3_aggr_id, reg_pipe5_map4_aggr_id,
   reg_pipe5_map5_aggr_id, reg_pipe5_map6_aggr_id,
   reg_pipe5_map7_aggr_id, reg_pipe5_map8_aggr_id,
   reg_pipe5_map9_aggr_id, reg_pipe5_map10_aggr_id,
   reg_pipe5_map11_aggr_id, reg_pipe5_map12_aggr_id,
   reg_pipe5_map13_aggr_id, reg_pipe5_map14_aggr_id,
   reg_pipe5_map15_aggr_id, reg_pipe5_map0_vc_source,
   reg_pipe5_map1_vc_source, reg_pipe5_map2_vc_source,
   reg_pipe5_map3_vc_source, reg_pipe5_map4_vc_source,
   reg_pipe5_map5_vc_source, reg_pipe5_map6_vc_source,
   reg_pipe5_map7_vc_source, reg_pipe5_map8_vc_source,
   reg_pipe5_map9_vc_source, reg_pipe5_map10_vc_source,
   reg_pipe5_map11_vc_source, reg_pipe5_map12_vc_source,
   reg_pipe5_map13_vc_source, reg_pipe5_map14_vc_source,
   reg_pipe5_map15_vc_source, reg_pipe5_map0_vc_dest,
   reg_pipe5_map1_vc_dest, reg_pipe5_map2_vc_dest,
   reg_pipe5_map3_vc_dest, reg_pipe5_map4_vc_dest,
   reg_pipe5_map5_vc_dest, reg_pipe5_map6_vc_dest,
   reg_pipe5_map7_vc_dest, reg_pipe5_map8_vc_dest,
   reg_pipe5_map9_vc_dest, reg_pipe5_map10_vc_dest,
   reg_pipe5_map11_vc_dest, reg_pipe5_map12_vc_dest,
   reg_pipe5_map13_vc_dest, reg_pipe5_map14_vc_dest,
   reg_pipe5_map15_vc_dest, reg_pipe5_map0_dt_source,
   reg_pipe5_map1_dt_source, reg_pipe5_map2_dt_source,
   reg_pipe5_map3_dt_source, reg_pipe5_map4_dt_source,
   reg_pipe5_map5_dt_source, reg_pipe5_map6_dt_source,
   reg_pipe5_map7_dt_source, reg_pipe5_map8_dt_source,
   reg_pipe5_map9_dt_source, reg_pipe5_map10_dt_source,
   reg_pipe5_map11_dt_source, reg_pipe5_map12_dt_source,
   reg_pipe5_map13_dt_source, reg_pipe5_map14_dt_source,
   reg_pipe5_map15_dt_source, reg_pipe5_map0_dt_dest,
   reg_pipe5_map1_dt_dest, reg_pipe5_map2_dt_dest,
   reg_pipe5_map3_dt_dest, reg_pipe5_map4_dt_dest,
   reg_pipe5_map5_dt_dest, reg_pipe5_map6_dt_dest,
   reg_pipe5_map7_dt_dest, reg_pipe5_map8_dt_dest,
   reg_pipe5_map9_dt_dest, reg_pipe5_map10_dt_dest,
   reg_pipe5_map11_dt_dest, reg_pipe5_map12_dt_dest,
   reg_pipe5_map13_dt_dest, reg_pipe5_map14_dt_dest,
   reg_pipe5_map15_dt_dest, pipe6_wr_mode, reg_pipe6_stream_sel,
   reg_pipe6_map_en, reg_pipe6_map0_aggr_id, reg_pipe6_map1_aggr_id,
   reg_pipe6_map2_aggr_id, reg_pipe6_map3_aggr_id,
   reg_pipe6_map4_aggr_id, reg_pipe6_map5_aggr_id,
   reg_pipe6_map6_aggr_id, reg_pipe6_map7_aggr_id,
   reg_pipe6_map8_aggr_id, reg_pipe6_map9_aggr_id,
   reg_pipe6_map10_aggr_id, reg_pipe6_map11_aggr_id,
   reg_pipe6_map12_aggr_id, reg_pipe6_map13_aggr_id,
   reg_pipe6_map14_aggr_id, reg_pipe6_map15_aggr_id,
   reg_pipe6_map0_vc_source, reg_pipe6_map1_vc_source,
   reg_pipe6_map2_vc_source, reg_pipe6_map3_vc_source,
   reg_pipe6_map4_vc_source, reg_pipe6_map5_vc_source,
   reg_pipe6_map6_vc_source, reg_pipe6_map7_vc_source,
   reg_pipe6_map8_vc_source, reg_pipe6_map9_vc_source,
   reg_pipe6_map10_vc_source, reg_pipe6_map11_vc_source,
   reg_pipe6_map12_vc_source, reg_pipe6_map13_vc_source,
   reg_pipe6_map14_vc_source, reg_pipe6_map15_vc_source,
   reg_pipe6_map0_vc_dest, reg_pipe6_map1_vc_dest,
   reg_pipe6_map2_vc_dest, reg_pipe6_map3_vc_dest,
   reg_pipe6_map4_vc_dest, reg_pipe6_map5_vc_dest,
   reg_pipe6_map6_vc_dest, reg_pipe6_map7_vc_dest,
   reg_pipe6_map8_vc_dest, reg_pipe6_map9_vc_dest,
   reg_pipe6_map10_vc_dest, reg_pipe6_map11_vc_dest,
   reg_pipe6_map12_vc_dest, reg_pipe6_map13_vc_dest,
   reg_pipe6_map14_vc_dest, reg_pipe6_map15_vc_dest,
   reg_pipe6_map0_dt_source, reg_pipe6_map1_dt_source,
   reg_pipe6_map2_dt_source, reg_pipe6_map3_dt_source,
   reg_pipe6_map4_dt_source, reg_pipe6_map5_dt_source,
   reg_pipe6_map6_dt_source, reg_pipe6_map7_dt_source,
   reg_pipe6_map8_dt_source, reg_pipe6_map9_dt_source,
   reg_pipe6_map10_dt_source, reg_pipe6_map11_dt_source,
   reg_pipe6_map12_dt_source, reg_pipe6_map13_dt_source,
   reg_pipe6_map14_dt_source, reg_pipe6_map15_dt_source,
   reg_pipe6_map0_dt_dest, reg_pipe6_map1_dt_dest,
   reg_pipe6_map2_dt_dest, reg_pipe6_map3_dt_dest,
   reg_pipe6_map4_dt_dest, reg_pipe6_map5_dt_dest,
   reg_pipe6_map6_dt_dest, reg_pipe6_map7_dt_dest,
   reg_pipe6_map8_dt_dest, reg_pipe6_map9_dt_dest,
   reg_pipe6_map10_dt_dest, reg_pipe6_map11_dt_dest,
   reg_pipe6_map12_dt_dest, reg_pipe6_map13_dt_dest,
   reg_pipe6_map14_dt_dest, reg_pipe6_map15_dt_dest, pipe7_wr_mode,
   reg_pipe7_stream_sel, reg_pipe7_map_en, reg_pipe7_map0_aggr_id,
   reg_pipe7_map1_aggr_id, reg_pipe7_map2_aggr_id,
   reg_pipe7_map3_aggr_id, reg_pipe7_map4_aggr_id,
   reg_pipe7_map5_aggr_id, reg_pipe7_map6_aggr_id,
   reg_pipe7_map7_aggr_id, reg_pipe7_map8_aggr_id,
   reg_pipe7_map9_aggr_id, reg_pipe7_map10_aggr_id,
   reg_pipe7_map11_aggr_id, reg_pipe7_map12_aggr_id,
   reg_pipe7_map13_aggr_id, reg_pipe7_map14_aggr_id,
   reg_pipe7_map15_aggr_id, reg_pipe7_map0_vc_source,
   reg_pipe7_map1_vc_source, reg_pipe7_map2_vc_source,
   reg_pipe7_map3_vc_source, reg_pipe7_map4_vc_source,
   reg_pipe7_map5_vc_source, reg_pipe7_map6_vc_source,
   reg_pipe7_map7_vc_source, reg_pipe7_map8_vc_source,
   reg_pipe7_map9_vc_source, reg_pipe7_map10_vc_source,
   reg_pipe7_map11_vc_source, reg_pipe7_map12_vc_source,
   reg_pipe7_map13_vc_source, reg_pipe7_map14_vc_source,
   reg_pipe7_map15_vc_source, reg_pipe7_map0_vc_dest,
   reg_pipe7_map1_vc_dest, reg_pipe7_map2_vc_dest,
   reg_pipe7_map3_vc_dest, reg_pipe7_map4_vc_dest,
   reg_pipe7_map5_vc_dest, reg_pipe7_map6_vc_dest,
   reg_pipe7_map7_vc_dest, reg_pipe7_map8_vc_dest,
   reg_pipe7_map9_vc_dest, reg_pipe7_map10_vc_dest,
   reg_pipe7_map11_vc_dest, reg_pipe7_map12_vc_dest,
   reg_pipe7_map13_vc_dest, reg_pipe7_map14_vc_dest,
   reg_pipe7_map15_vc_dest, reg_pipe7_map0_dt_source,
   reg_pipe7_map1_dt_source, reg_pipe7_map2_dt_source,
   reg_pipe7_map3_dt_source, reg_pipe7_map4_dt_source,
   reg_pipe7_map5_dt_source, reg_pipe7_map6_dt_source,
   reg_pipe7_map7_dt_source, reg_pipe7_map8_dt_source,
   reg_pipe7_map9_dt_source, reg_pipe7_map10_dt_source,
   reg_pipe7_map11_dt_source, reg_pipe7_map12_dt_source,
   reg_pipe7_map13_dt_source, reg_pipe7_map14_dt_source,
   reg_pipe7_map15_dt_source, reg_pipe7_map0_dt_dest,
   reg_pipe7_map1_dt_dest, reg_pipe7_map2_dt_dest,
   reg_pipe7_map3_dt_dest, reg_pipe7_map4_dt_dest,
   reg_pipe7_map5_dt_dest, reg_pipe7_map6_dt_dest,
   reg_pipe7_map7_dt_dest, reg_pipe7_map8_dt_dest,
   reg_pipe7_map9_dt_dest, reg_pipe7_map10_dt_dest,
   reg_pipe7_map11_dt_dest, reg_pipe7_map12_dt_dest,
   reg_pipe7_map13_dt_dest, reg_pipe7_map14_dt_dest,
   reg_pipe7_map15_dt_dest, mep0_csi_data, mep0_bytes_en,
   mep0_header_en, mep0_data_en, mep0_data_type, mep0_virtual_channel,
   mep0_virtual_channel_x, mep0_word_count, mep1_csi_data,
   mep1_bytes_en, mep1_header_en, mep1_data_en, mep1_data_type,
   mep1_virtual_channel, mep1_virtual_channel_x, mep1_word_count,
   mep2_csi_data, mep2_bytes_en, mep2_header_en, mep2_data_en,
   mep2_data_type, mep2_virtual_channel, mep2_virtual_channel_x,
   mep2_word_count, mep3_csi_data, mep3_bytes_en, mep3_header_en,
   mep3_data_en, mep3_data_type, mep3_virtual_channel,
   mep3_virtual_channel_x, mep3_word_count
   );
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input [31:0]		mep0_pkt_crc;		// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep0_pkt_crc_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep0_tunnel_mode_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input [31:0]		mep1_pkt_crc;		// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep1_pkt_crc_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep1_tunnel_mode_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input [31:0]		mep2_pkt_crc;		// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep2_pkt_crc_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep2_tunnel_mode_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input [31:0]		mep3_pkt_crc;		// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep3_pkt_crc_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			mep3_tunnel_mode_en;	// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input [7:0]		reg_drop_mapping_fault_pkt;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v, ...
input			reg_pipe0_drop_ls_le_pkt;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_pipe1_drop_ls_le_pkt;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_pipe2_drop_ls_le_pkt;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_pipe3_drop_ls_le_pkt;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_pipe4_drop_ls_le_pkt;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_pipe5_drop_ls_le_pkt;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_pipe6_drop_ls_le_pkt;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_pipe7_drop_ls_le_pkt;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_loopback_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_chk_en_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_err_clear_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_load_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_lock_continue_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_rx_order_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_err_inject_en_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_gen_en_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_order_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane0;// To u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane1;// To u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane2;// To u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane3;// To u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane4;// To u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane5;// To u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane6;// To u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
input			reg_vprbs_tx_pat_reset_app_route_lane7;// To u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
// End of automatics
input												            fifo_wrclk0;
input												            fifo_wrclk1;
input												            fifo_wrclk2;
input												            fifo_wrclk3;
input												            fifo_wrclk4;
input												            fifo_wrclk5;
input												            fifo_wrclk6;
input												            fifo_wrclk7;
input												            fifo_wrclk_rst_n0;
input												            fifo_wrclk_rst_n1;
input												            fifo_wrclk_rst_n2;
input												            fifo_wrclk_rst_n3;
input												            fifo_wrclk_rst_n4;
input												            fifo_wrclk_rst_n5;
input												            fifo_wrclk_rst_n6;
input												            fifo_wrclk_rst_n7;
input  [1:0]                                                    pipe0_wr_mode;
input  [1:0]										            reg_pipe0_stream_sel;			
input  [15:0]										            reg_pipe0_map_en;			
input  [3:0]										            reg_pipe0_map0_aggr_id;			
input  [3:0]										            reg_pipe0_map1_aggr_id;			
input  [3:0]										            reg_pipe0_map2_aggr_id;			
input  [3:0]										            reg_pipe0_map3_aggr_id;			
input  [3:0]										            reg_pipe0_map4_aggr_id;			
input  [3:0]										            reg_pipe0_map5_aggr_id;			
input  [3:0]										            reg_pipe0_map6_aggr_id;			
input  [3:0]										            reg_pipe0_map7_aggr_id;			
input  [3:0]										            reg_pipe0_map8_aggr_id;			
input  [3:0]										            reg_pipe0_map9_aggr_id;			
input  [3:0]										            reg_pipe0_map10_aggr_id;			
input  [3:0]										            reg_pipe0_map11_aggr_id;			
input  [3:0]										            reg_pipe0_map12_aggr_id;			
input  [3:0]										            reg_pipe0_map13_aggr_id;			
input  [3:0]										            reg_pipe0_map14_aggr_id;			
input  [3:0]										            reg_pipe0_map15_aggr_id;			
input  [1:0]										            reg_pipe0_map0_vc_source;			
input  [1:0]										            reg_pipe0_map1_vc_source;			
input  [1:0]										            reg_pipe0_map2_vc_source;			
input  [1:0]										            reg_pipe0_map3_vc_source;			
input  [1:0]										            reg_pipe0_map4_vc_source;			
input  [1:0]										            reg_pipe0_map5_vc_source;			
input  [1:0]										            reg_pipe0_map6_vc_source;			
input  [1:0]										            reg_pipe0_map7_vc_source;			
input  [1:0]										            reg_pipe0_map8_vc_source;			
input  [1:0]										            reg_pipe0_map9_vc_source;			
input  [1:0]										            reg_pipe0_map10_vc_source;			
input  [1:0]										            reg_pipe0_map11_vc_source;			
input  [1:0]										            reg_pipe0_map12_vc_source;			
input  [1:0]										            reg_pipe0_map13_vc_source;			
input  [1:0]										            reg_pipe0_map14_vc_source;			
input  [1:0]										            reg_pipe0_map15_vc_source;			
input  [1:0]										            reg_pipe0_map0_vc_dest;			
input  [1:0]										            reg_pipe0_map1_vc_dest;			
input  [1:0]										            reg_pipe0_map2_vc_dest;			
input  [1:0]										            reg_pipe0_map3_vc_dest;			
input  [1:0]										            reg_pipe0_map4_vc_dest;			
input  [1:0]										            reg_pipe0_map5_vc_dest;			
input  [1:0]										            reg_pipe0_map6_vc_dest;			
input  [1:0]										            reg_pipe0_map7_vc_dest;			
input  [1:0]										            reg_pipe0_map8_vc_dest;			
input  [1:0]										            reg_pipe0_map9_vc_dest;			
input  [1:0]										            reg_pipe0_map10_vc_dest;			
input  [1:0]										            reg_pipe0_map11_vc_dest;			
input  [1:0]										            reg_pipe0_map12_vc_dest;			
input  [1:0]										            reg_pipe0_map13_vc_dest;			
input  [1:0]										            reg_pipe0_map14_vc_dest;			
input  [1:0]										            reg_pipe0_map15_vc_dest;			
input  [5:0]										            reg_pipe0_map0_dt_source;			
input  [5:0]										            reg_pipe0_map1_dt_source;			
input  [5:0]										            reg_pipe0_map2_dt_source;			
input  [5:0]										            reg_pipe0_map3_dt_source;			
input  [5:0]										            reg_pipe0_map4_dt_source;			
input  [5:0]										            reg_pipe0_map5_dt_source;			
input  [5:0]										            reg_pipe0_map6_dt_source;			
input  [5:0]										            reg_pipe0_map7_dt_source;			
input  [5:0]										            reg_pipe0_map8_dt_source;			
input  [5:0]										            reg_pipe0_map9_dt_source;			
input  [5:0]										            reg_pipe0_map10_dt_source;			
input  [5:0]										            reg_pipe0_map11_dt_source;			
input  [5:0]										            reg_pipe0_map12_dt_source;			
input  [5:0]										            reg_pipe0_map13_dt_source;			
input  [5:0]										            reg_pipe0_map14_dt_source;			
input  [5:0]										            reg_pipe0_map15_dt_source;			
input  [5:0]										            reg_pipe0_map0_dt_dest;			
input  [5:0]										            reg_pipe0_map1_dt_dest;			
input  [5:0]										            reg_pipe0_map2_dt_dest;			
input  [5:0]										            reg_pipe0_map3_dt_dest;			
input  [5:0]										            reg_pipe0_map4_dt_dest;			
input  [5:0]										            reg_pipe0_map5_dt_dest;			
input  [5:0]										            reg_pipe0_map6_dt_dest;			
input  [5:0]										            reg_pipe0_map7_dt_dest;			
input  [5:0]										            reg_pipe0_map8_dt_dest;			
input  [5:0]										            reg_pipe0_map9_dt_dest;			
input  [5:0]										            reg_pipe0_map10_dt_dest;			
input  [5:0]										            reg_pipe0_map11_dt_dest;			
input  [5:0]										            reg_pipe0_map12_dt_dest;			
input  [5:0]										            reg_pipe0_map13_dt_dest;			
input  [5:0]										            reg_pipe0_map14_dt_dest;			
input  [5:0]										            reg_pipe0_map15_dt_dest;			

input  [1:0]                                                    pipe1_wr_mode;
input  [1:0]										            reg_pipe1_stream_sel;			
input  [15:0]										            reg_pipe1_map_en;			
input  [3:0]										            reg_pipe1_map0_aggr_id;			
input  [3:0]										            reg_pipe1_map1_aggr_id;			
input  [3:0]										            reg_pipe1_map2_aggr_id;			
input  [3:0]										            reg_pipe1_map3_aggr_id;			
input  [3:0]										            reg_pipe1_map4_aggr_id;			
input  [3:0]										            reg_pipe1_map5_aggr_id;			
input  [3:0]										            reg_pipe1_map6_aggr_id;			
input  [3:0]										            reg_pipe1_map7_aggr_id;			
input  [3:0]										            reg_pipe1_map8_aggr_id;			
input  [3:0]										            reg_pipe1_map9_aggr_id;			
input  [3:0]										            reg_pipe1_map10_aggr_id;			
input  [3:0]										            reg_pipe1_map11_aggr_id;			
input  [3:0]										            reg_pipe1_map12_aggr_id;			
input  [3:0]										            reg_pipe1_map13_aggr_id;			
input  [3:0]										            reg_pipe1_map14_aggr_id;			
input  [3:0]										            reg_pipe1_map15_aggr_id;			
input  [1:0]										            reg_pipe1_map0_vc_source;			
input  [1:0]										            reg_pipe1_map1_vc_source;			
input  [1:0]										            reg_pipe1_map2_vc_source;			
input  [1:0]										            reg_pipe1_map3_vc_source;			
input  [1:0]										            reg_pipe1_map4_vc_source;			
input  [1:0]										            reg_pipe1_map5_vc_source;			
input  [1:0]										            reg_pipe1_map6_vc_source;			
input  [1:0]										            reg_pipe1_map7_vc_source;			
input  [1:0]										            reg_pipe1_map8_vc_source;			
input  [1:0]										            reg_pipe1_map9_vc_source;			
input  [1:0]										            reg_pipe1_map10_vc_source;			
input  [1:0]										            reg_pipe1_map11_vc_source;			
input  [1:0]										            reg_pipe1_map12_vc_source;			
input  [1:0]										            reg_pipe1_map13_vc_source;			
input  [1:0]										            reg_pipe1_map14_vc_source;			
input  [1:0]										            reg_pipe1_map15_vc_source;			
input  [1:0]										            reg_pipe1_map0_vc_dest;			
input  [1:0]										            reg_pipe1_map1_vc_dest;			
input  [1:0]										            reg_pipe1_map2_vc_dest;			
input  [1:0]										            reg_pipe1_map3_vc_dest;			
input  [1:0]										            reg_pipe1_map4_vc_dest;			
input  [1:0]										            reg_pipe1_map5_vc_dest;			
input  [1:0]										            reg_pipe1_map6_vc_dest;			
input  [1:0]										            reg_pipe1_map7_vc_dest;			
input  [1:0]										            reg_pipe1_map8_vc_dest;			
input  [1:0]										            reg_pipe1_map9_vc_dest;			
input  [1:0]										            reg_pipe1_map10_vc_dest;			
input  [1:0]										            reg_pipe1_map11_vc_dest;			
input  [1:0]										            reg_pipe1_map12_vc_dest;			
input  [1:0]										            reg_pipe1_map13_vc_dest;			
input  [1:0]										            reg_pipe1_map14_vc_dest;			
input  [1:0]										            reg_pipe1_map15_vc_dest;			
input  [5:0]										            reg_pipe1_map0_dt_source;			
input  [5:0]										            reg_pipe1_map1_dt_source;			
input  [5:0]										            reg_pipe1_map2_dt_source;			
input  [5:0]										            reg_pipe1_map3_dt_source;			
input  [5:0]										            reg_pipe1_map4_dt_source;			
input  [5:0]										            reg_pipe1_map5_dt_source;			
input  [5:0]										            reg_pipe1_map6_dt_source;			
input  [5:0]										            reg_pipe1_map7_dt_source;			
input  [5:0]										            reg_pipe1_map8_dt_source;			
input  [5:0]										            reg_pipe1_map9_dt_source;			
input  [5:0]										            reg_pipe1_map10_dt_source;			
input  [5:0]										            reg_pipe1_map11_dt_source;			
input  [5:0]										            reg_pipe1_map12_dt_source;			
input  [5:0]										            reg_pipe1_map13_dt_source;			
input  [5:0]										            reg_pipe1_map14_dt_source;			
input  [5:0]										            reg_pipe1_map15_dt_source;			
input  [5:0]										            reg_pipe1_map0_dt_dest;			
input  [5:0]										            reg_pipe1_map1_dt_dest;			
input  [5:0]										            reg_pipe1_map2_dt_dest;			
input  [5:0]										            reg_pipe1_map3_dt_dest;			
input  [5:0]										            reg_pipe1_map4_dt_dest;			
input  [5:0]										            reg_pipe1_map5_dt_dest;			
input  [5:0]										            reg_pipe1_map6_dt_dest;			
input  [5:0]										            reg_pipe1_map7_dt_dest;			
input  [5:0]										            reg_pipe1_map8_dt_dest;			
input  [5:0]										            reg_pipe1_map9_dt_dest;			
input  [5:0]										            reg_pipe1_map10_dt_dest;			
input  [5:0]										            reg_pipe1_map11_dt_dest;			
input  [5:0]										            reg_pipe1_map12_dt_dest;			
input  [5:0]										            reg_pipe1_map13_dt_dest;			
input  [5:0]										            reg_pipe1_map14_dt_dest;			
input  [5:0]										            reg_pipe1_map15_dt_dest;			

input  [1:0]                                                    pipe2_wr_mode;
input  [1:0]										            reg_pipe2_stream_sel;			
input  [15:0]										            reg_pipe2_map_en;			
input  [3:0]										            reg_pipe2_map0_aggr_id;			
input  [3:0]										            reg_pipe2_map1_aggr_id;			
input  [3:0]										            reg_pipe2_map2_aggr_id;			
input  [3:0]										            reg_pipe2_map3_aggr_id;			
input  [3:0]										            reg_pipe2_map4_aggr_id;			
input  [3:0]										            reg_pipe2_map5_aggr_id;			
input  [3:0]										            reg_pipe2_map6_aggr_id;			
input  [3:0]										            reg_pipe2_map7_aggr_id;			
input  [3:0]										            reg_pipe2_map8_aggr_id;			
input  [3:0]										            reg_pipe2_map9_aggr_id;			
input  [3:0]										            reg_pipe2_map10_aggr_id;			
input  [3:0]										            reg_pipe2_map11_aggr_id;			
input  [3:0]										            reg_pipe2_map12_aggr_id;			
input  [3:0]										            reg_pipe2_map13_aggr_id;			
input  [3:0]										            reg_pipe2_map14_aggr_id;			
input  [3:0]										            reg_pipe2_map15_aggr_id;			
input  [1:0]										            reg_pipe2_map0_vc_source;			
input  [1:0]										            reg_pipe2_map1_vc_source;			
input  [1:0]										            reg_pipe2_map2_vc_source;			
input  [1:0]										            reg_pipe2_map3_vc_source;			
input  [1:0]										            reg_pipe2_map4_vc_source;			
input  [1:0]										            reg_pipe2_map5_vc_source;			
input  [1:0]										            reg_pipe2_map6_vc_source;			
input  [1:0]										            reg_pipe2_map7_vc_source;			
input  [1:0]										            reg_pipe2_map8_vc_source;			
input  [1:0]										            reg_pipe2_map9_vc_source;			
input  [1:0]										            reg_pipe2_map10_vc_source;			
input  [1:0]										            reg_pipe2_map11_vc_source;			
input  [1:0]										            reg_pipe2_map12_vc_source;			
input  [1:0]										            reg_pipe2_map13_vc_source;			
input  [1:0]										            reg_pipe2_map14_vc_source;			
input  [1:0]										            reg_pipe2_map15_vc_source;			
input  [1:0]										            reg_pipe2_map0_vc_dest;			
input  [1:0]										            reg_pipe2_map1_vc_dest;			
input  [1:0]										            reg_pipe2_map2_vc_dest;			
input  [1:0]										            reg_pipe2_map3_vc_dest;			
input  [1:0]										            reg_pipe2_map4_vc_dest;			
input  [1:0]										            reg_pipe2_map5_vc_dest;			
input  [1:0]										            reg_pipe2_map6_vc_dest;			
input  [1:0]										            reg_pipe2_map7_vc_dest;			
input  [1:0]										            reg_pipe2_map8_vc_dest;			
input  [1:0]										            reg_pipe2_map9_vc_dest;			
input  [1:0]										            reg_pipe2_map10_vc_dest;			
input  [1:0]										            reg_pipe2_map11_vc_dest;			
input  [1:0]										            reg_pipe2_map12_vc_dest;			
input  [1:0]										            reg_pipe2_map13_vc_dest;			
input  [1:0]										            reg_pipe2_map14_vc_dest;			
input  [1:0]										            reg_pipe2_map15_vc_dest;			
input  [5:0]										            reg_pipe2_map0_dt_source;			
input  [5:0]										            reg_pipe2_map1_dt_source;			
input  [5:0]										            reg_pipe2_map2_dt_source;			
input  [5:0]										            reg_pipe2_map3_dt_source;			
input  [5:0]										            reg_pipe2_map4_dt_source;			
input  [5:0]										            reg_pipe2_map5_dt_source;			
input  [5:0]										            reg_pipe2_map6_dt_source;			
input  [5:0]										            reg_pipe2_map7_dt_source;			
input  [5:0]										            reg_pipe2_map8_dt_source;			
input  [5:0]										            reg_pipe2_map9_dt_source;			
input  [5:0]										            reg_pipe2_map10_dt_source;			
input  [5:0]										            reg_pipe2_map11_dt_source;			
input  [5:0]										            reg_pipe2_map12_dt_source;			
input  [5:0]										            reg_pipe2_map13_dt_source;			
input  [5:0]										            reg_pipe2_map14_dt_source;			
input  [5:0]										            reg_pipe2_map15_dt_source;			
input  [5:0]										            reg_pipe2_map0_dt_dest;			
input  [5:0]										            reg_pipe2_map1_dt_dest;			
input  [5:0]										            reg_pipe2_map2_dt_dest;			
input  [5:0]										            reg_pipe2_map3_dt_dest;			
input  [5:0]										            reg_pipe2_map4_dt_dest;			
input  [5:0]										            reg_pipe2_map5_dt_dest;			
input  [5:0]										            reg_pipe2_map6_dt_dest;			
input  [5:0]										            reg_pipe2_map7_dt_dest;			
input  [5:0]										            reg_pipe2_map8_dt_dest;			
input  [5:0]										            reg_pipe2_map9_dt_dest;			
input  [5:0]										            reg_pipe2_map10_dt_dest;			
input  [5:0]										            reg_pipe2_map11_dt_dest;			
input  [5:0]										            reg_pipe2_map12_dt_dest;			
input  [5:0]										            reg_pipe2_map13_dt_dest;			
input  [5:0]										            reg_pipe2_map14_dt_dest;			
input  [5:0]										            reg_pipe2_map15_dt_dest;			

input  [1:0]                                                    pipe3_wr_mode;
input  [1:0]										            reg_pipe3_stream_sel;			
input  [15:0]										            reg_pipe3_map_en;			
input  [3:0]										            reg_pipe3_map0_aggr_id;			
input  [3:0]										            reg_pipe3_map1_aggr_id;			
input  [3:0]										            reg_pipe3_map2_aggr_id;			
input  [3:0]										            reg_pipe3_map3_aggr_id;			
input  [3:0]										            reg_pipe3_map4_aggr_id;			
input  [3:0]										            reg_pipe3_map5_aggr_id;			
input  [3:0]										            reg_pipe3_map6_aggr_id;			
input  [3:0]										            reg_pipe3_map7_aggr_id;			
input  [3:0]										            reg_pipe3_map8_aggr_id;			
input  [3:0]										            reg_pipe3_map9_aggr_id;			
input  [3:0]										            reg_pipe3_map10_aggr_id;			
input  [3:0]										            reg_pipe3_map11_aggr_id;			
input  [3:0]										            reg_pipe3_map12_aggr_id;			
input  [3:0]										            reg_pipe3_map13_aggr_id;			
input  [3:0]										            reg_pipe3_map14_aggr_id;			
input  [3:0]										            reg_pipe3_map15_aggr_id;			
input  [1:0]										            reg_pipe3_map0_vc_source;			
input  [1:0]										            reg_pipe3_map1_vc_source;			
input  [1:0]										            reg_pipe3_map2_vc_source;			
input  [1:0]										            reg_pipe3_map3_vc_source;			
input  [1:0]										            reg_pipe3_map4_vc_source;			
input  [1:0]										            reg_pipe3_map5_vc_source;			
input  [1:0]										            reg_pipe3_map6_vc_source;			
input  [1:0]										            reg_pipe3_map7_vc_source;			
input  [1:0]										            reg_pipe3_map8_vc_source;			
input  [1:0]										            reg_pipe3_map9_vc_source;			
input  [1:0]										            reg_pipe3_map10_vc_source;			
input  [1:0]										            reg_pipe3_map11_vc_source;			
input  [1:0]										            reg_pipe3_map12_vc_source;			
input  [1:0]										            reg_pipe3_map13_vc_source;			
input  [1:0]										            reg_pipe3_map14_vc_source;			
input  [1:0]										            reg_pipe3_map15_vc_source;			
input  [1:0]										            reg_pipe3_map0_vc_dest;			
input  [1:0]										            reg_pipe3_map1_vc_dest;			
input  [1:0]										            reg_pipe3_map2_vc_dest;			
input  [1:0]										            reg_pipe3_map3_vc_dest;			
input  [1:0]										            reg_pipe3_map4_vc_dest;			
input  [1:0]										            reg_pipe3_map5_vc_dest;			
input  [1:0]										            reg_pipe3_map6_vc_dest;			
input  [1:0]										            reg_pipe3_map7_vc_dest;			
input  [1:0]										            reg_pipe3_map8_vc_dest;			
input  [1:0]										            reg_pipe3_map9_vc_dest;			
input  [1:0]										            reg_pipe3_map10_vc_dest;			
input  [1:0]										            reg_pipe3_map11_vc_dest;			
input  [1:0]										            reg_pipe3_map12_vc_dest;			
input  [1:0]										            reg_pipe3_map13_vc_dest;			
input  [1:0]										            reg_pipe3_map14_vc_dest;			
input  [1:0]										            reg_pipe3_map15_vc_dest;			
input  [5:0]										            reg_pipe3_map0_dt_source;			
input  [5:0]										            reg_pipe3_map1_dt_source;			
input  [5:0]										            reg_pipe3_map2_dt_source;			
input  [5:0]										            reg_pipe3_map3_dt_source;			
input  [5:0]										            reg_pipe3_map4_dt_source;			
input  [5:0]										            reg_pipe3_map5_dt_source;			
input  [5:0]										            reg_pipe3_map6_dt_source;			
input  [5:0]										            reg_pipe3_map7_dt_source;			
input  [5:0]										            reg_pipe3_map8_dt_source;			
input  [5:0]										            reg_pipe3_map9_dt_source;			
input  [5:0]										            reg_pipe3_map10_dt_source;			
input  [5:0]										            reg_pipe3_map11_dt_source;			
input  [5:0]										            reg_pipe3_map12_dt_source;			
input  [5:0]										            reg_pipe3_map13_dt_source;			
input  [5:0]										            reg_pipe3_map14_dt_source;			
input  [5:0]										            reg_pipe3_map15_dt_source;			
input  [5:0]										            reg_pipe3_map0_dt_dest;			
input  [5:0]										            reg_pipe3_map1_dt_dest;			
input  [5:0]										            reg_pipe3_map2_dt_dest;			
input  [5:0]										            reg_pipe3_map3_dt_dest;			
input  [5:0]										            reg_pipe3_map4_dt_dest;			
input  [5:0]										            reg_pipe3_map5_dt_dest;			
input  [5:0]										            reg_pipe3_map6_dt_dest;			
input  [5:0]										            reg_pipe3_map7_dt_dest;			
input  [5:0]										            reg_pipe3_map8_dt_dest;			
input  [5:0]										            reg_pipe3_map9_dt_dest;			
input  [5:0]										            reg_pipe3_map10_dt_dest;			
input  [5:0]										            reg_pipe3_map11_dt_dest;			
input  [5:0]										            reg_pipe3_map12_dt_dest;			
input  [5:0]										            reg_pipe3_map13_dt_dest;			
input  [5:0]										            reg_pipe3_map14_dt_dest;			
input  [5:0]										            reg_pipe3_map15_dt_dest;			

input  [1:0]                                                    pipe4_wr_mode;
input  [1:0]										            reg_pipe4_stream_sel;			
input  [15:0]										            reg_pipe4_map_en;			
input  [3:0]										            reg_pipe4_map0_aggr_id;			
input  [3:0]										            reg_pipe4_map1_aggr_id;			
input  [3:0]										            reg_pipe4_map2_aggr_id;			
input  [3:0]										            reg_pipe4_map3_aggr_id;			
input  [3:0]										            reg_pipe4_map4_aggr_id;			
input  [3:0]										            reg_pipe4_map5_aggr_id;			
input  [3:0]										            reg_pipe4_map6_aggr_id;			
input  [3:0]										            reg_pipe4_map7_aggr_id;			
input  [3:0]										            reg_pipe4_map8_aggr_id;			
input  [3:0]										            reg_pipe4_map9_aggr_id;			
input  [3:0]										            reg_pipe4_map10_aggr_id;			
input  [3:0]										            reg_pipe4_map11_aggr_id;			
input  [3:0]										            reg_pipe4_map12_aggr_id;			
input  [3:0]										            reg_pipe4_map13_aggr_id;			
input  [3:0]										            reg_pipe4_map14_aggr_id;			
input  [3:0]										            reg_pipe4_map15_aggr_id;			
input  [1:0]										            reg_pipe4_map0_vc_source;			
input  [1:0]										            reg_pipe4_map1_vc_source;			
input  [1:0]										            reg_pipe4_map2_vc_source;			
input  [1:0]										            reg_pipe4_map3_vc_source;			
input  [1:0]										            reg_pipe4_map4_vc_source;			
input  [1:0]										            reg_pipe4_map5_vc_source;			
input  [1:0]										            reg_pipe4_map6_vc_source;			
input  [1:0]										            reg_pipe4_map7_vc_source;			
input  [1:0]										            reg_pipe4_map8_vc_source;			
input  [1:0]										            reg_pipe4_map9_vc_source;			
input  [1:0]										            reg_pipe4_map10_vc_source;			
input  [1:0]										            reg_pipe4_map11_vc_source;			
input  [1:0]										            reg_pipe4_map12_vc_source;			
input  [1:0]										            reg_pipe4_map13_vc_source;			
input  [1:0]										            reg_pipe4_map14_vc_source;			
input  [1:0]										            reg_pipe4_map15_vc_source;			
input  [1:0]										            reg_pipe4_map0_vc_dest;			
input  [1:0]										            reg_pipe4_map1_vc_dest;			
input  [1:0]										            reg_pipe4_map2_vc_dest;			
input  [1:0]										            reg_pipe4_map3_vc_dest;			
input  [1:0]										            reg_pipe4_map4_vc_dest;			
input  [1:0]										            reg_pipe4_map5_vc_dest;			
input  [1:0]										            reg_pipe4_map6_vc_dest;			
input  [1:0]										            reg_pipe4_map7_vc_dest;			
input  [1:0]										            reg_pipe4_map8_vc_dest;			
input  [1:0]										            reg_pipe4_map9_vc_dest;			
input  [1:0]										            reg_pipe4_map10_vc_dest;			
input  [1:0]										            reg_pipe4_map11_vc_dest;			
input  [1:0]										            reg_pipe4_map12_vc_dest;			
input  [1:0]										            reg_pipe4_map13_vc_dest;			
input  [1:0]										            reg_pipe4_map14_vc_dest;			
input  [1:0]										            reg_pipe4_map15_vc_dest;			
input  [5:0]										            reg_pipe4_map0_dt_source;			
input  [5:0]										            reg_pipe4_map1_dt_source;			
input  [5:0]										            reg_pipe4_map2_dt_source;			
input  [5:0]										            reg_pipe4_map3_dt_source;			
input  [5:0]										            reg_pipe4_map4_dt_source;			
input  [5:0]										            reg_pipe4_map5_dt_source;			
input  [5:0]										            reg_pipe4_map6_dt_source;			
input  [5:0]										            reg_pipe4_map7_dt_source;			
input  [5:0]										            reg_pipe4_map8_dt_source;			
input  [5:0]										            reg_pipe4_map9_dt_source;			
input  [5:0]										            reg_pipe4_map10_dt_source;			
input  [5:0]										            reg_pipe4_map11_dt_source;			
input  [5:0]										            reg_pipe4_map12_dt_source;			
input  [5:0]										            reg_pipe4_map13_dt_source;			
input  [5:0]										            reg_pipe4_map14_dt_source;			
input  [5:0]										            reg_pipe4_map15_dt_source;			
input  [5:0]										            reg_pipe4_map0_dt_dest;			
input  [5:0]										            reg_pipe4_map1_dt_dest;			
input  [5:0]										            reg_pipe4_map2_dt_dest;			
input  [5:0]										            reg_pipe4_map3_dt_dest;			
input  [5:0]										            reg_pipe4_map4_dt_dest;			
input  [5:0]										            reg_pipe4_map5_dt_dest;			
input  [5:0]										            reg_pipe4_map6_dt_dest;			
input  [5:0]										            reg_pipe4_map7_dt_dest;			
input  [5:0]										            reg_pipe4_map8_dt_dest;			
input  [5:0]										            reg_pipe4_map9_dt_dest;			
input  [5:0]										            reg_pipe4_map10_dt_dest;			
input  [5:0]										            reg_pipe4_map11_dt_dest;			
input  [5:0]										            reg_pipe4_map12_dt_dest;			
input  [5:0]										            reg_pipe4_map13_dt_dest;			
input  [5:0]										            reg_pipe4_map14_dt_dest;			
input  [5:0]										            reg_pipe4_map15_dt_dest;			

input  [1:0]                                                    pipe5_wr_mode;
input  [1:0]										            reg_pipe5_stream_sel;			
input  [15:0]										            reg_pipe5_map_en;			
input  [3:0]										            reg_pipe5_map0_aggr_id;			
input  [3:0]										            reg_pipe5_map1_aggr_id;			
input  [3:0]										            reg_pipe5_map2_aggr_id;			
input  [3:0]										            reg_pipe5_map3_aggr_id;			
input  [3:0]										            reg_pipe5_map4_aggr_id;			
input  [3:0]										            reg_pipe5_map5_aggr_id;			
input  [3:0]										            reg_pipe5_map6_aggr_id;			
input  [3:0]										            reg_pipe5_map7_aggr_id;			
input  [3:0]										            reg_pipe5_map8_aggr_id;			
input  [3:0]										            reg_pipe5_map9_aggr_id;			
input  [3:0]										            reg_pipe5_map10_aggr_id;			
input  [3:0]										            reg_pipe5_map11_aggr_id;			
input  [3:0]										            reg_pipe5_map12_aggr_id;			
input  [3:0]										            reg_pipe5_map13_aggr_id;			
input  [3:0]										            reg_pipe5_map14_aggr_id;			
input  [3:0]										            reg_pipe5_map15_aggr_id;			
input  [1:0]										            reg_pipe5_map0_vc_source;			
input  [1:0]										            reg_pipe5_map1_vc_source;			
input  [1:0]										            reg_pipe5_map2_vc_source;			
input  [1:0]										            reg_pipe5_map3_vc_source;			
input  [1:0]										            reg_pipe5_map4_vc_source;			
input  [1:0]										            reg_pipe5_map5_vc_source;			
input  [1:0]										            reg_pipe5_map6_vc_source;			
input  [1:0]										            reg_pipe5_map7_vc_source;			
input  [1:0]										            reg_pipe5_map8_vc_source;			
input  [1:0]										            reg_pipe5_map9_vc_source;			
input  [1:0]										            reg_pipe5_map10_vc_source;			
input  [1:0]										            reg_pipe5_map11_vc_source;			
input  [1:0]										            reg_pipe5_map12_vc_source;			
input  [1:0]										            reg_pipe5_map13_vc_source;			
input  [1:0]										            reg_pipe5_map14_vc_source;			
input  [1:0]										            reg_pipe5_map15_vc_source;			
input  [1:0]										            reg_pipe5_map0_vc_dest;			
input  [1:0]										            reg_pipe5_map1_vc_dest;			
input  [1:0]										            reg_pipe5_map2_vc_dest;			
input  [1:0]										            reg_pipe5_map3_vc_dest;			
input  [1:0]										            reg_pipe5_map4_vc_dest;			
input  [1:0]										            reg_pipe5_map5_vc_dest;			
input  [1:0]										            reg_pipe5_map6_vc_dest;			
input  [1:0]										            reg_pipe5_map7_vc_dest;			
input  [1:0]										            reg_pipe5_map8_vc_dest;			
input  [1:0]										            reg_pipe5_map9_vc_dest;			
input  [1:0]										            reg_pipe5_map10_vc_dest;			
input  [1:0]										            reg_pipe5_map11_vc_dest;			
input  [1:0]										            reg_pipe5_map12_vc_dest;			
input  [1:0]										            reg_pipe5_map13_vc_dest;			
input  [1:0]										            reg_pipe5_map14_vc_dest;			
input  [1:0]										            reg_pipe5_map15_vc_dest;			
input  [5:0]										            reg_pipe5_map0_dt_source;			
input  [5:0]										            reg_pipe5_map1_dt_source;			
input  [5:0]										            reg_pipe5_map2_dt_source;			
input  [5:0]										            reg_pipe5_map3_dt_source;			
input  [5:0]										            reg_pipe5_map4_dt_source;			
input  [5:0]										            reg_pipe5_map5_dt_source;			
input  [5:0]										            reg_pipe5_map6_dt_source;			
input  [5:0]										            reg_pipe5_map7_dt_source;			
input  [5:0]										            reg_pipe5_map8_dt_source;			
input  [5:0]										            reg_pipe5_map9_dt_source;			
input  [5:0]										            reg_pipe5_map10_dt_source;			
input  [5:0]										            reg_pipe5_map11_dt_source;			
input  [5:0]										            reg_pipe5_map12_dt_source;			
input  [5:0]										            reg_pipe5_map13_dt_source;			
input  [5:0]										            reg_pipe5_map14_dt_source;			
input  [5:0]										            reg_pipe5_map15_dt_source;			
input  [5:0]										            reg_pipe5_map0_dt_dest;			
input  [5:0]										            reg_pipe5_map1_dt_dest;			
input  [5:0]										            reg_pipe5_map2_dt_dest;			
input  [5:0]										            reg_pipe5_map3_dt_dest;			
input  [5:0]										            reg_pipe5_map4_dt_dest;			
input  [5:0]										            reg_pipe5_map5_dt_dest;			
input  [5:0]										            reg_pipe5_map6_dt_dest;			
input  [5:0]										            reg_pipe5_map7_dt_dest;			
input  [5:0]										            reg_pipe5_map8_dt_dest;			
input  [5:0]										            reg_pipe5_map9_dt_dest;			
input  [5:0]										            reg_pipe5_map10_dt_dest;			
input  [5:0]										            reg_pipe5_map11_dt_dest;			
input  [5:0]										            reg_pipe5_map12_dt_dest;			
input  [5:0]										            reg_pipe5_map13_dt_dest;			
input  [5:0]										            reg_pipe5_map14_dt_dest;			
input  [5:0]										            reg_pipe5_map15_dt_dest;			

input  [1:0]                                                    pipe6_wr_mode;
input  [1:0]										            reg_pipe6_stream_sel;			
input  [15:0]										            reg_pipe6_map_en;			
input  [3:0]										            reg_pipe6_map0_aggr_id;			
input  [3:0]										            reg_pipe6_map1_aggr_id;			
input  [3:0]										            reg_pipe6_map2_aggr_id;			
input  [3:0]										            reg_pipe6_map3_aggr_id;			
input  [3:0]										            reg_pipe6_map4_aggr_id;			
input  [3:0]										            reg_pipe6_map5_aggr_id;			
input  [3:0]										            reg_pipe6_map6_aggr_id;			
input  [3:0]										            reg_pipe6_map7_aggr_id;			
input  [3:0]										            reg_pipe6_map8_aggr_id;			
input  [3:0]										            reg_pipe6_map9_aggr_id;			
input  [3:0]										            reg_pipe6_map10_aggr_id;			
input  [3:0]										            reg_pipe6_map11_aggr_id;			
input  [3:0]										            reg_pipe6_map12_aggr_id;			
input  [3:0]										            reg_pipe6_map13_aggr_id;			
input  [3:0]										            reg_pipe6_map14_aggr_id;			
input  [3:0]										            reg_pipe6_map15_aggr_id;			
input  [1:0]										            reg_pipe6_map0_vc_source;			
input  [1:0]										            reg_pipe6_map1_vc_source;			
input  [1:0]										            reg_pipe6_map2_vc_source;			
input  [1:0]										            reg_pipe6_map3_vc_source;			
input  [1:0]										            reg_pipe6_map4_vc_source;			
input  [1:0]										            reg_pipe6_map5_vc_source;			
input  [1:0]										            reg_pipe6_map6_vc_source;			
input  [1:0]										            reg_pipe6_map7_vc_source;			
input  [1:0]										            reg_pipe6_map8_vc_source;			
input  [1:0]										            reg_pipe6_map9_vc_source;			
input  [1:0]										            reg_pipe6_map10_vc_source;			
input  [1:0]										            reg_pipe6_map11_vc_source;			
input  [1:0]										            reg_pipe6_map12_vc_source;			
input  [1:0]										            reg_pipe6_map13_vc_source;			
input  [1:0]										            reg_pipe6_map14_vc_source;			
input  [1:0]										            reg_pipe6_map15_vc_source;			
input  [1:0]										            reg_pipe6_map0_vc_dest;			
input  [1:0]										            reg_pipe6_map1_vc_dest;			
input  [1:0]										            reg_pipe6_map2_vc_dest;			
input  [1:0]										            reg_pipe6_map3_vc_dest;			
input  [1:0]										            reg_pipe6_map4_vc_dest;			
input  [1:0]										            reg_pipe6_map5_vc_dest;			
input  [1:0]										            reg_pipe6_map6_vc_dest;			
input  [1:0]										            reg_pipe6_map7_vc_dest;			
input  [1:0]										            reg_pipe6_map8_vc_dest;			
input  [1:0]										            reg_pipe6_map9_vc_dest;			
input  [1:0]										            reg_pipe6_map10_vc_dest;			
input  [1:0]										            reg_pipe6_map11_vc_dest;			
input  [1:0]										            reg_pipe6_map12_vc_dest;			
input  [1:0]										            reg_pipe6_map13_vc_dest;			
input  [1:0]										            reg_pipe6_map14_vc_dest;			
input  [1:0]										            reg_pipe6_map15_vc_dest;			
input  [5:0]										            reg_pipe6_map0_dt_source;			
input  [5:0]										            reg_pipe6_map1_dt_source;			
input  [5:0]										            reg_pipe6_map2_dt_source;			
input  [5:0]										            reg_pipe6_map3_dt_source;			
input  [5:0]										            reg_pipe6_map4_dt_source;			
input  [5:0]										            reg_pipe6_map5_dt_source;			
input  [5:0]										            reg_pipe6_map6_dt_source;			
input  [5:0]										            reg_pipe6_map7_dt_source;			
input  [5:0]										            reg_pipe6_map8_dt_source;			
input  [5:0]										            reg_pipe6_map9_dt_source;			
input  [5:0]										            reg_pipe6_map10_dt_source;			
input  [5:0]										            reg_pipe6_map11_dt_source;			
input  [5:0]										            reg_pipe6_map12_dt_source;			
input  [5:0]										            reg_pipe6_map13_dt_source;			
input  [5:0]										            reg_pipe6_map14_dt_source;			
input  [5:0]										            reg_pipe6_map15_dt_source;			
input  [5:0]										            reg_pipe6_map0_dt_dest;			
input  [5:0]										            reg_pipe6_map1_dt_dest;			
input  [5:0]										            reg_pipe6_map2_dt_dest;			
input  [5:0]										            reg_pipe6_map3_dt_dest;			
input  [5:0]										            reg_pipe6_map4_dt_dest;			
input  [5:0]										            reg_pipe6_map5_dt_dest;			
input  [5:0]										            reg_pipe6_map6_dt_dest;			
input  [5:0]										            reg_pipe6_map7_dt_dest;			
input  [5:0]										            reg_pipe6_map8_dt_dest;			
input  [5:0]										            reg_pipe6_map9_dt_dest;			
input  [5:0]										            reg_pipe6_map10_dt_dest;			
input  [5:0]										            reg_pipe6_map11_dt_dest;			
input  [5:0]										            reg_pipe6_map12_dt_dest;			
input  [5:0]										            reg_pipe6_map13_dt_dest;			
input  [5:0]										            reg_pipe6_map14_dt_dest;			
input  [5:0]										            reg_pipe6_map15_dt_dest;			

input  [1:0]                                                    pipe7_wr_mode;
input  [1:0]										            reg_pipe7_stream_sel;			
input  [15:0]										            reg_pipe7_map_en;			
input  [3:0]										            reg_pipe7_map0_aggr_id;			
input  [3:0]										            reg_pipe7_map1_aggr_id;			
input  [3:0]										            reg_pipe7_map2_aggr_id;			
input  [3:0]										            reg_pipe7_map3_aggr_id;			
input  [3:0]										            reg_pipe7_map4_aggr_id;			
input  [3:0]										            reg_pipe7_map5_aggr_id;			
input  [3:0]										            reg_pipe7_map6_aggr_id;			
input  [3:0]										            reg_pipe7_map7_aggr_id;			
input  [3:0]										            reg_pipe7_map8_aggr_id;			
input  [3:0]										            reg_pipe7_map9_aggr_id;			
input  [3:0]										            reg_pipe7_map10_aggr_id;			
input  [3:0]										            reg_pipe7_map11_aggr_id;			
input  [3:0]										            reg_pipe7_map12_aggr_id;			
input  [3:0]										            reg_pipe7_map13_aggr_id;			
input  [3:0]										            reg_pipe7_map14_aggr_id;			
input  [3:0]										            reg_pipe7_map15_aggr_id;			
input  [1:0]										            reg_pipe7_map0_vc_source;			
input  [1:0]										            reg_pipe7_map1_vc_source;			
input  [1:0]										            reg_pipe7_map2_vc_source;			
input  [1:0]										            reg_pipe7_map3_vc_source;			
input  [1:0]										            reg_pipe7_map4_vc_source;			
input  [1:0]										            reg_pipe7_map5_vc_source;			
input  [1:0]										            reg_pipe7_map6_vc_source;			
input  [1:0]										            reg_pipe7_map7_vc_source;			
input  [1:0]										            reg_pipe7_map8_vc_source;			
input  [1:0]										            reg_pipe7_map9_vc_source;			
input  [1:0]										            reg_pipe7_map10_vc_source;			
input  [1:0]										            reg_pipe7_map11_vc_source;			
input  [1:0]										            reg_pipe7_map12_vc_source;			
input  [1:0]										            reg_pipe7_map13_vc_source;			
input  [1:0]										            reg_pipe7_map14_vc_source;			
input  [1:0]										            reg_pipe7_map15_vc_source;			
input  [1:0]										            reg_pipe7_map0_vc_dest;			
input  [1:0]										            reg_pipe7_map1_vc_dest;			
input  [1:0]										            reg_pipe7_map2_vc_dest;			
input  [1:0]										            reg_pipe7_map3_vc_dest;			
input  [1:0]										            reg_pipe7_map4_vc_dest;			
input  [1:0]										            reg_pipe7_map5_vc_dest;			
input  [1:0]										            reg_pipe7_map6_vc_dest;			
input  [1:0]										            reg_pipe7_map7_vc_dest;			
input  [1:0]										            reg_pipe7_map8_vc_dest;			
input  [1:0]										            reg_pipe7_map9_vc_dest;			
input  [1:0]										            reg_pipe7_map10_vc_dest;			
input  [1:0]										            reg_pipe7_map11_vc_dest;			
input  [1:0]										            reg_pipe7_map12_vc_dest;			
input  [1:0]										            reg_pipe7_map13_vc_dest;			
input  [1:0]										            reg_pipe7_map14_vc_dest;			
input  [1:0]										            reg_pipe7_map15_vc_dest;			
input  [5:0]										            reg_pipe7_map0_dt_source;			
input  [5:0]										            reg_pipe7_map1_dt_source;			
input  [5:0]										            reg_pipe7_map2_dt_source;			
input  [5:0]										            reg_pipe7_map3_dt_source;			
input  [5:0]										            reg_pipe7_map4_dt_source;			
input  [5:0]										            reg_pipe7_map5_dt_source;			
input  [5:0]										            reg_pipe7_map6_dt_source;			
input  [5:0]										            reg_pipe7_map7_dt_source;			
input  [5:0]										            reg_pipe7_map8_dt_source;			
input  [5:0]										            reg_pipe7_map9_dt_source;			
input  [5:0]										            reg_pipe7_map10_dt_source;			
input  [5:0]										            reg_pipe7_map11_dt_source;			
input  [5:0]										            reg_pipe7_map12_dt_source;			
input  [5:0]										            reg_pipe7_map13_dt_source;			
input  [5:0]										            reg_pipe7_map14_dt_source;			
input  [5:0]										            reg_pipe7_map15_dt_source;			
input  [5:0]										            reg_pipe7_map0_dt_dest;			
input  [5:0]										            reg_pipe7_map1_dt_dest;			
input  [5:0]										            reg_pipe7_map2_dt_dest;			
input  [5:0]										            reg_pipe7_map3_dt_dest;			
input  [5:0]										            reg_pipe7_map4_dt_dest;			
input  [5:0]										            reg_pipe7_map5_dt_dest;			
input  [5:0]										            reg_pipe7_map6_dt_dest;			
input  [5:0]										            reg_pipe7_map7_dt_dest;			
input  [5:0]										            reg_pipe7_map8_dt_dest;			
input  [5:0]										            reg_pipe7_map9_dt_dest;			
input  [5:0]										            reg_pipe7_map10_dt_dest;			
input  [5:0]										            reg_pipe7_map11_dt_dest;			
input  [5:0]										            reg_pipe7_map12_dt_dest;			
input  [5:0]										            reg_pipe7_map13_dt_dest;			
input  [5:0]										            reg_pipe7_map14_dt_dest;			
input  [5:0]										            reg_pipe7_map15_dt_dest;			

input  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]                mep0_csi_data;
input  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	        mep0_bytes_en;
input                                             	            mep0_header_en;
input                                             	            mep0_data_en;
input  [5:0]                                      	            mep0_data_type;
input  [1:0]										            mep0_virtual_channel;
input  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                      mep0_virtual_channel_x;
input  [15:0]										            mep0_word_count;			
input  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	        mep1_csi_data;
input  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	        mep1_bytes_en;
input                                             	            mep1_header_en;
input                                             	            mep1_data_en;
input  [5:0]                                      	            mep1_data_type;
input  [1:0]										            mep1_virtual_channel;
input  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                      mep1_virtual_channel_x;
input  [15:0]										            mep1_word_count;			
input  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	        mep2_csi_data;
input  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	        mep2_bytes_en;
input                                             	            mep2_header_en;
input                                             	            mep2_data_en;
input  [5:0]                                      	            mep2_data_type;
input  [1:0]										            mep2_virtual_channel;
input  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                      mep2_virtual_channel_x;
input  [15:0]										            mep2_word_count;			
input  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	        mep3_csi_data;
input  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	        mep3_bytes_en;
input                                             	            mep3_header_en;
input                                             	            mep3_data_en;
input  [5:0]                                      	            mep3_data_type;
input  [1:0]										            mep3_virtual_channel;
input  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                      mep3_virtual_channel_x;
input  [15:0]										            mep3_word_count;		

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			pipe0_frame_active;	// From u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe0_pkt_crc;		// From u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe0_pkt_crc_en;	// From u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe1_frame_active;	// From u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe1_pkt_crc;		// From u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe1_pkt_crc_en;	// From u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe2_frame_active;	// From u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe2_pkt_crc;		// From u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe2_pkt_crc_en;	// From u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe3_frame_active;	// From u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe3_pkt_crc;		// From u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe3_pkt_crc_en;	// From u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe4_pkt_crc;		// From u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe4_pkt_crc_en;	// From u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe5_pkt_crc;		// From u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe5_pkt_crc_en;	// From u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe6_pkt_crc;		// From u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe6_pkt_crc_en;	// From u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		pipe7_pkt_crc;		// From u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			pipe7_pkt_crc_en;	// From u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane0;// From u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane1;// From u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane2;// From u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane3;// From u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane4;// From u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane5;// From u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane6;// From u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_check_app_route_lane7;// From u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane0;// From u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane1;// From u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane2;// From u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane3;// From u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane4;// From u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane5;// From u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane6;// From u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane7;// From u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane0;// From u0_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane1;// From u1_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane2;// From u2_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane3;// From u3_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane4;// From u4_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane5;// From u5_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane6;// From u6_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
output			reg_rd_vprbs_rx_fail_app_route_lane7;// From u7_as6d_app_pipe_route_lane of as6d_app_pipe_route_lane.v
// End of automatics
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe0_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe0_bytes_en;
output wire                                             	    pipe0_header_en;
output wire                                          	        pipe0_data_en;
output wire  [5:0]                                      	    pipe0_data_type;
output wire  [1:0]										        pipe0_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe0_virtual_channel_x;
output wire  [15:0]										        pipe0_word_count;			
output wire  [3:0]										        pipe0_aggr_id;
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe1_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe1_bytes_en;
output wire                                             	    pipe1_header_en;
output wire                                          	        pipe1_data_en;
output wire  [5:0]                                      	    pipe1_data_type;
output wire  [1:0]										        pipe1_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe1_virtual_channel_x;
output wire  [15:0]										        pipe1_word_count;			
output wire  [3:0]										        pipe1_aggr_id;
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe2_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe2_bytes_en;
output wire                                             	    pipe2_header_en;
output wire                                          	        pipe2_data_en;
output wire  [5:0]                                      	    pipe2_data_type;
output wire  [1:0]										        pipe2_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe2_virtual_channel_x;
output wire  [15:0]										        pipe2_word_count;			
output wire  [3:0]										        pipe2_aggr_id;
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe3_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe3_bytes_en;
output wire                                             	    pipe3_header_en;
output wire                                          	        pipe3_data_en;
output wire  [5:0]                                      	    pipe3_data_type;
output wire  [1:0]										        pipe3_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe3_virtual_channel_x;
output wire  [15:0]										        pipe3_word_count;			
output wire  [3:0]										        pipe3_aggr_id;
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe4_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe4_bytes_en;
output wire                                             	    pipe4_header_en;
output wire                                          	        pipe4_data_en;
output wire  [5:0]                                      	    pipe4_data_type;
output wire  [1:0]										        pipe4_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe4_virtual_channel_x;
output wire  [15:0]										        pipe4_word_count;			
output wire  [3:0]										        pipe4_aggr_id;
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe5_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe5_bytes_en;
output wire                                             	    pipe5_header_en;
output wire                                          	        pipe5_data_en;
output wire  [5:0]                                      	    pipe5_data_type;
output wire  [1:0]										        pipe5_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe5_virtual_channel_x;
output wire  [15:0]										        pipe5_word_count;			
output wire  [3:0]										        pipe5_aggr_id;
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe6_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe6_bytes_en;
output wire                                             	    pipe6_header_en;
output wire                                          	        pipe6_data_en;
output wire  [5:0]                                      	    pipe6_data_type;
output wire  [1:0]										        pipe6_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe6_virtual_channel_x;
output wire  [15:0]										        pipe6_word_count;			
output wire  [3:0]										        pipe6_aggr_id;
output wire  [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	pipe7_csi_data;
output wire  [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	pipe7_bytes_en;
output wire                                             	    pipe7_header_en;
output wire                                          	        pipe7_data_en;
output wire  [5:0]                                      	    pipe7_data_type;
output wire  [1:0]										        pipe7_virtual_channel;
output wire  [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]                pipe7_virtual_channel_x;
output wire  [15:0]										        pipe7_word_count;			
output wire  [3:0]										        pipe7_aggr_id;

/*  as6d_app_pipe_route_lane  AUTO_TEMPLATE (
    .fifo_wrclk(fifo_wrclk@),
    .fifo_wrclk_rst_n(fifo_wrclk_rst_n@),
    .\(.*\)pipe\(.*\)(\1pipe@\2[]),
    .reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[@]),
    .reg\(.*\)vprbs_\(.*\)	(reg\1vprbs_\2_app_route_lane@[]),
    .reg_drop_short_pkt(reg_pipe@_drop_ls_le_pkt),
)*/
as6d_app_pipe_route_lane    u0_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane0), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane0[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane0), // Templated
							.pipe_csi_data	(pipe0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe0_header_en), // Templated
							.pipe_data_en	(pipe0_data_en), // Templated
							.pipe_data_type	(pipe0_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe0_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe0_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe0_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe0_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe0_pkt_crc[31:0]), // Templated
							.pipe_frame_active(pipe0_frame_active), // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane0), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane0), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane0), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane0), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane0[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane0[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane0), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane0[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane0), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane0[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane0[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane0[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane0[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane0[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane0[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane0), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane0), // Templated
							.fifo_wrclk	(fifo_wrclk0),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n0), // Templated
							.pipe_wr_mode	(pipe0_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe0_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe0_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[0]), // Templated
							.reg_pipe_map_en(reg_pipe0_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe0_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe0_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe0_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe0_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe0_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe0_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe0_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe0_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe0_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe0_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe0_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe0_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe0_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe0_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe0_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe0_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe0_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe0_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe0_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe0_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe0_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe0_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe0_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe0_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe0_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe0_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe0_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe0_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe0_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe0_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe0_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe0_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe0_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe0_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe0_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe0_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe0_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe0_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe0_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe0_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe0_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe0_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe0_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe0_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe0_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe0_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe0_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe0_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe0_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe0_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe0_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe0_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe0_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe0_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe0_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe0_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe0_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe0_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe0_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe0_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe0_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe0_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe0_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe0_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe0_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe0_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe0_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe0_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe0_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe0_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe0_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe0_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe0_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe0_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe0_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe0_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe0_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe0_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe0_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe0_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane0), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane0)); // Templated

as6d_app_pipe_route_lane    u1_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane1), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane1[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane1), // Templated
							.pipe_csi_data	(pipe1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe1_header_en), // Templated
							.pipe_data_en	(pipe1_data_en), // Templated
							.pipe_data_type	(pipe1_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe1_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe1_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe1_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe1_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe1_pkt_crc[31:0]), // Templated
							.pipe_frame_active(pipe1_frame_active), // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane1), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane1), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane1), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane1), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane1[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane1[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane1), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane1[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane1), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane1[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane1[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane1[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane1[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane1[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane1[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane1), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane1), // Templated
							.fifo_wrclk	(fifo_wrclk1),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n1), // Templated
							.pipe_wr_mode	(pipe1_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe1_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe1_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[1]), // Templated
							.reg_pipe_map_en(reg_pipe1_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe1_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe1_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe1_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe1_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe1_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe1_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe1_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe1_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe1_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe1_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe1_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe1_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe1_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe1_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe1_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe1_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe1_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe1_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe1_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe1_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe1_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe1_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe1_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe1_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe1_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe1_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe1_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe1_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe1_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe1_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe1_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe1_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe1_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe1_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe1_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe1_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe1_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe1_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe1_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe1_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe1_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe1_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe1_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe1_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe1_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe1_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe1_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe1_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe1_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe1_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe1_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe1_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe1_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe1_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe1_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe1_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe1_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe1_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe1_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe1_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe1_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe1_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe1_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe1_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe1_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe1_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe1_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe1_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe1_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe1_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe1_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe1_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe1_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe1_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe1_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe1_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe1_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe1_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe1_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe1_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane1), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane1)); // Templated

as6d_app_pipe_route_lane    u2_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane2), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane2[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane2), // Templated
							.pipe_csi_data	(pipe2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe2_header_en), // Templated
							.pipe_data_en	(pipe2_data_en), // Templated
							.pipe_data_type	(pipe2_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe2_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe2_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe2_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe2_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe2_pkt_crc[31:0]), // Templated
							.pipe_frame_active(pipe2_frame_active), // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane2), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane2), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane2), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane2), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane2[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane2[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane2), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane2[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane2), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane2[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane2[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane2[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane2[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane2[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane2[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane2), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane2), // Templated
							.fifo_wrclk	(fifo_wrclk2),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n2), // Templated
							.pipe_wr_mode	(pipe2_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe2_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe2_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[2]), // Templated
							.reg_pipe_map_en(reg_pipe2_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe2_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe2_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe2_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe2_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe2_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe2_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe2_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe2_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe2_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe2_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe2_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe2_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe2_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe2_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe2_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe2_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe2_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe2_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe2_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe2_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe2_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe2_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe2_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe2_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe2_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe2_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe2_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe2_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe2_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe2_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe2_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe2_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe2_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe2_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe2_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe2_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe2_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe2_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe2_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe2_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe2_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe2_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe2_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe2_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe2_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe2_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe2_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe2_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe2_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe2_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe2_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe2_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe2_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe2_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe2_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe2_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe2_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe2_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe2_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe2_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe2_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe2_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe2_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe2_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe2_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe2_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe2_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe2_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe2_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe2_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe2_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe2_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe2_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe2_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe2_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe2_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe2_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe2_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe2_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe2_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane2), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane2)); // Templated

as6d_app_pipe_route_lane    u3_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane3), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane3[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane3), // Templated
							.pipe_csi_data	(pipe3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe3_header_en), // Templated
							.pipe_data_en	(pipe3_data_en), // Templated
							.pipe_data_type	(pipe3_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe3_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe3_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe3_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe3_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe3_pkt_crc[31:0]), // Templated
							.pipe_frame_active(pipe3_frame_active), // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane3), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane3), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane3), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane3), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane3[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane3[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane3), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane3[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane3), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane3[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane3[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane3[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane3[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane3[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane3[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane3), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane3), // Templated
							.fifo_wrclk	(fifo_wrclk3),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n3), // Templated
							.pipe_wr_mode	(pipe3_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe3_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe3_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[3]), // Templated
							.reg_pipe_map_en(reg_pipe3_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe3_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe3_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe3_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe3_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe3_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe3_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe3_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe3_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe3_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe3_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe3_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe3_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe3_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe3_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe3_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe3_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe3_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe3_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe3_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe3_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe3_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe3_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe3_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe3_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe3_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe3_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe3_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe3_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe3_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe3_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe3_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe3_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe3_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe3_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe3_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe3_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe3_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe3_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe3_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe3_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe3_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe3_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe3_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe3_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe3_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe3_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe3_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe3_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe3_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe3_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe3_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe3_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe3_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe3_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe3_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe3_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe3_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe3_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe3_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe3_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe3_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe3_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe3_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe3_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe3_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe3_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe3_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe3_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe3_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe3_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe3_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe3_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe3_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe3_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe3_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe3_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe3_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe3_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe3_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe3_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane3), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane3)); // Templated

/*  as6d_app_pipe_route_lane  AUTO_TEMPLATE (
    .fifo_wrclk(fifo_wrclk@),
    .fifo_wrclk_rst_n(fifo_wrclk_rst_n@),
    .pipe_frame_active(),
    .\(.*\)pipe\(.*\)(\1pipe@\2[]),
    .reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[@]),
    .reg\(.*\)vprbs_\(.*\)	(reg\1vprbs_\2_app_route_lane@[]),
    .reg_drop_short_pkt(reg_pipe@_drop_ls_le_pkt),
)*/
as6d_app_pipe_route_lane    u4_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane4), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane4[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane4), // Templated
							.pipe_csi_data	(pipe4_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe4_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe4_header_en), // Templated
							.pipe_data_en	(pipe4_data_en), // Templated
							.pipe_data_type	(pipe4_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe4_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe4_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe4_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe4_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe4_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe4_pkt_crc[31:0]), // Templated
							.pipe_frame_active(),		 // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane4), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane4), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane4), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane4), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane4[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane4[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane4), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane4[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane4), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane4[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane4[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane4[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane4[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane4[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane4[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane4), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane4), // Templated
							.fifo_wrclk	(fifo_wrclk4),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n4), // Templated
							.pipe_wr_mode	(pipe4_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe4_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe4_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[4]), // Templated
							.reg_pipe_map_en(reg_pipe4_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe4_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe4_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe4_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe4_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe4_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe4_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe4_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe4_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe4_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe4_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe4_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe4_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe4_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe4_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe4_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe4_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe4_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe4_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe4_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe4_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe4_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe4_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe4_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe4_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe4_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe4_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe4_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe4_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe4_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe4_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe4_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe4_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe4_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe4_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe4_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe4_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe4_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe4_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe4_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe4_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe4_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe4_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe4_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe4_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe4_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe4_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe4_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe4_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe4_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe4_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe4_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe4_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe4_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe4_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe4_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe4_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe4_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe4_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe4_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe4_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe4_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe4_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe4_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe4_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe4_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe4_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe4_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe4_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe4_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe4_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe4_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe4_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe4_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe4_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe4_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe4_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe4_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe4_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe4_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe4_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane4), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane4)); // Templated

as6d_app_pipe_route_lane    u5_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane5), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane5[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane5), // Templated
							.pipe_csi_data	(pipe5_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe5_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe5_header_en), // Templated
							.pipe_data_en	(pipe5_data_en), // Templated
							.pipe_data_type	(pipe5_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe5_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe5_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe5_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe5_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe5_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe5_pkt_crc[31:0]), // Templated
							.pipe_frame_active(),		 // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane5), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane5), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane5), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane5), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane5[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane5[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane5), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane5[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane5), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane5[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane5[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane5[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane5[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane5[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane5[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane5), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane5), // Templated
							.fifo_wrclk	(fifo_wrclk5),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n5), // Templated
							.pipe_wr_mode	(pipe5_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe5_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe5_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[5]), // Templated
							.reg_pipe_map_en(reg_pipe5_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe5_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe5_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe5_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe5_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe5_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe5_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe5_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe5_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe5_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe5_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe5_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe5_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe5_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe5_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe5_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe5_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe5_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe5_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe5_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe5_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe5_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe5_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe5_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe5_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe5_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe5_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe5_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe5_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe5_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe5_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe5_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe5_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe5_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe5_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe5_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe5_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe5_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe5_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe5_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe5_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe5_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe5_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe5_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe5_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe5_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe5_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe5_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe5_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe5_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe5_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe5_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe5_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe5_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe5_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe5_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe5_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe5_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe5_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe5_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe5_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe5_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe5_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe5_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe5_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe5_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe5_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe5_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe5_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe5_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe5_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe5_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe5_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe5_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe5_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe5_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe5_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe5_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe5_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe5_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe5_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane5), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane5)); // Templated

as6d_app_pipe_route_lane    u6_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane6), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane6[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane6), // Templated
							.pipe_csi_data	(pipe6_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe6_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe6_header_en), // Templated
							.pipe_data_en	(pipe6_data_en), // Templated
							.pipe_data_type	(pipe6_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe6_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe6_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe6_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe6_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe6_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe6_pkt_crc[31:0]), // Templated
							.pipe_frame_active(),		 // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane6), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane6), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane6), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane6), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane6[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane6[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane6), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane6[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane6), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane6[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane6[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane6[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane6[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane6[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane6[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane6), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane6), // Templated
							.fifo_wrclk	(fifo_wrclk6),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n6), // Templated
							.pipe_wr_mode	(pipe6_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe6_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe6_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[6]), // Templated
							.reg_pipe_map_en(reg_pipe6_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe6_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe6_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe6_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe6_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe6_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe6_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe6_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe6_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe6_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe6_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe6_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe6_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe6_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe6_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe6_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe6_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe6_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe6_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe6_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe6_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe6_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe6_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe6_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe6_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe6_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe6_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe6_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe6_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe6_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe6_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe6_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe6_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe6_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe6_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe6_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe6_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe6_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe6_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe6_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe6_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe6_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe6_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe6_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe6_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe6_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe6_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe6_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe6_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe6_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe6_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe6_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe6_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe6_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe6_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe6_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe6_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe6_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe6_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe6_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe6_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe6_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe6_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe6_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe6_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe6_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe6_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe6_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe6_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe6_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe6_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe6_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe6_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe6_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe6_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe6_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe6_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe6_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe6_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe6_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe6_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane6), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane6)); // Templated

as6d_app_pipe_route_lane    u7_as6d_app_pipe_route_lane(/*AUTOINST*/
							// Outputs
							.reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check_app_route_lane7), // Templated
							.reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err_app_route_lane7[31:0]), // Templated
							.reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail_app_route_lane7), // Templated
							.pipe_csi_data	(pipe7_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
							.pipe_bytes_en	(pipe7_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
							.pipe_header_en	(pipe7_header_en), // Templated
							.pipe_data_en	(pipe7_data_en), // Templated
							.pipe_data_type	(pipe7_data_type[5:0]), // Templated
							.pipe_virtual_channel(pipe7_virtual_channel[1:0]), // Templated
							.pipe_virtual_channel_x(pipe7_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
							.pipe_word_count(pipe7_word_count[15:0]), // Templated
							.pipe_aggr_id	(pipe7_aggr_id[3:0]), // Templated
							.pipe_pkt_crc_en(pipe7_pkt_crc_en), // Templated
							.pipe_pkt_crc	(pipe7_pkt_crc[31:0]), // Templated
							.pipe_frame_active(),		 // Templated
							// Inputs
							.reg_vprbs_loopback(reg_vprbs_loopback_app_route_lane7), // Templated
							.reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear_app_route_lane7), // Templated
							.reg_vprbs_rx_load(reg_vprbs_rx_load_app_route_lane7), // Templated
							.reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue_app_route_lane7), // Templated
							.reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt_app_route_lane7[3:0]), // Templated
							.reg_vprbs_rx_mode(reg_vprbs_rx_mode_app_route_lane7[2:0]), // Templated
							.reg_vprbs_rx_order(reg_vprbs_rx_order_app_route_lane7), // Templated
							.reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance_app_route_lane7[3:0]), // Templated
							.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en_app_route_lane7), // Templated
							.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num_app_route_lane7[7:0]), // Templated
							.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time_app_route_lane7[7:0]), // Templated
							.reg_vprbs_tx_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type_app_route_lane7[5:0]), // Templated
							.reg_vprbs_tx_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval_app_route_lane7[15:0]), // Templated
							.reg_vprbs_tx_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7[3:0]), // Templated
							.reg_vprbs_tx_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count_app_route_lane7[15:0]), // Templated
							.reg_vprbs_tx_mode(reg_vprbs_tx_mode_app_route_lane7[2:0]), // Templated
							.reg_vprbs_tx_order(reg_vprbs_tx_order_app_route_lane7), // Templated
							.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset_app_route_lane7), // Templated
							.fifo_wrclk	(fifo_wrclk7),	 // Templated
							.fifo_wrclk_rst_n(fifo_wrclk_rst_n7), // Templated
							.pipe_wr_mode	(pipe7_wr_mode[1:0]), // Templated
							.reg_pipe_stream_sel(reg_pipe7_stream_sel[1:0]), // Templated
							.reg_drop_short_pkt(reg_pipe7_drop_ls_le_pkt), // Templated
							.reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[7]), // Templated
							.reg_pipe_map_en(reg_pipe7_map_en[15:0]), // Templated
							.reg_pipe_map0_aggr_id(reg_pipe7_map0_aggr_id[3:0]), // Templated
							.reg_pipe_map1_aggr_id(reg_pipe7_map1_aggr_id[3:0]), // Templated
							.reg_pipe_map2_aggr_id(reg_pipe7_map2_aggr_id[3:0]), // Templated
							.reg_pipe_map3_aggr_id(reg_pipe7_map3_aggr_id[3:0]), // Templated
							.reg_pipe_map4_aggr_id(reg_pipe7_map4_aggr_id[3:0]), // Templated
							.reg_pipe_map5_aggr_id(reg_pipe7_map5_aggr_id[3:0]), // Templated
							.reg_pipe_map6_aggr_id(reg_pipe7_map6_aggr_id[3:0]), // Templated
							.reg_pipe_map7_aggr_id(reg_pipe7_map7_aggr_id[3:0]), // Templated
							.reg_pipe_map8_aggr_id(reg_pipe7_map8_aggr_id[3:0]), // Templated
							.reg_pipe_map9_aggr_id(reg_pipe7_map9_aggr_id[3:0]), // Templated
							.reg_pipe_map10_aggr_id(reg_pipe7_map10_aggr_id[3:0]), // Templated
							.reg_pipe_map11_aggr_id(reg_pipe7_map11_aggr_id[3:0]), // Templated
							.reg_pipe_map12_aggr_id(reg_pipe7_map12_aggr_id[3:0]), // Templated
							.reg_pipe_map13_aggr_id(reg_pipe7_map13_aggr_id[3:0]), // Templated
							.reg_pipe_map14_aggr_id(reg_pipe7_map14_aggr_id[3:0]), // Templated
							.reg_pipe_map15_aggr_id(reg_pipe7_map15_aggr_id[3:0]), // Templated
							.reg_pipe_map0_vc_source(reg_pipe7_map0_vc_source[1:0]), // Templated
							.reg_pipe_map1_vc_source(reg_pipe7_map1_vc_source[1:0]), // Templated
							.reg_pipe_map2_vc_source(reg_pipe7_map2_vc_source[1:0]), // Templated
							.reg_pipe_map3_vc_source(reg_pipe7_map3_vc_source[1:0]), // Templated
							.reg_pipe_map4_vc_source(reg_pipe7_map4_vc_source[1:0]), // Templated
							.reg_pipe_map5_vc_source(reg_pipe7_map5_vc_source[1:0]), // Templated
							.reg_pipe_map6_vc_source(reg_pipe7_map6_vc_source[1:0]), // Templated
							.reg_pipe_map7_vc_source(reg_pipe7_map7_vc_source[1:0]), // Templated
							.reg_pipe_map8_vc_source(reg_pipe7_map8_vc_source[1:0]), // Templated
							.reg_pipe_map9_vc_source(reg_pipe7_map9_vc_source[1:0]), // Templated
							.reg_pipe_map10_vc_source(reg_pipe7_map10_vc_source[1:0]), // Templated
							.reg_pipe_map11_vc_source(reg_pipe7_map11_vc_source[1:0]), // Templated
							.reg_pipe_map12_vc_source(reg_pipe7_map12_vc_source[1:0]), // Templated
							.reg_pipe_map13_vc_source(reg_pipe7_map13_vc_source[1:0]), // Templated
							.reg_pipe_map14_vc_source(reg_pipe7_map14_vc_source[1:0]), // Templated
							.reg_pipe_map15_vc_source(reg_pipe7_map15_vc_source[1:0]), // Templated
							.reg_pipe_map0_vc_dest(reg_pipe7_map0_vc_dest[1:0]), // Templated
							.reg_pipe_map1_vc_dest(reg_pipe7_map1_vc_dest[1:0]), // Templated
							.reg_pipe_map2_vc_dest(reg_pipe7_map2_vc_dest[1:0]), // Templated
							.reg_pipe_map3_vc_dest(reg_pipe7_map3_vc_dest[1:0]), // Templated
							.reg_pipe_map4_vc_dest(reg_pipe7_map4_vc_dest[1:0]), // Templated
							.reg_pipe_map5_vc_dest(reg_pipe7_map5_vc_dest[1:0]), // Templated
							.reg_pipe_map6_vc_dest(reg_pipe7_map6_vc_dest[1:0]), // Templated
							.reg_pipe_map7_vc_dest(reg_pipe7_map7_vc_dest[1:0]), // Templated
							.reg_pipe_map8_vc_dest(reg_pipe7_map8_vc_dest[1:0]), // Templated
							.reg_pipe_map9_vc_dest(reg_pipe7_map9_vc_dest[1:0]), // Templated
							.reg_pipe_map10_vc_dest(reg_pipe7_map10_vc_dest[1:0]), // Templated
							.reg_pipe_map11_vc_dest(reg_pipe7_map11_vc_dest[1:0]), // Templated
							.reg_pipe_map12_vc_dest(reg_pipe7_map12_vc_dest[1:0]), // Templated
							.reg_pipe_map13_vc_dest(reg_pipe7_map13_vc_dest[1:0]), // Templated
							.reg_pipe_map14_vc_dest(reg_pipe7_map14_vc_dest[1:0]), // Templated
							.reg_pipe_map15_vc_dest(reg_pipe7_map15_vc_dest[1:0]), // Templated
							.reg_pipe_map0_dt_source(reg_pipe7_map0_dt_source[5:0]), // Templated
							.reg_pipe_map1_dt_source(reg_pipe7_map1_dt_source[5:0]), // Templated
							.reg_pipe_map2_dt_source(reg_pipe7_map2_dt_source[5:0]), // Templated
							.reg_pipe_map3_dt_source(reg_pipe7_map3_dt_source[5:0]), // Templated
							.reg_pipe_map4_dt_source(reg_pipe7_map4_dt_source[5:0]), // Templated
							.reg_pipe_map5_dt_source(reg_pipe7_map5_dt_source[5:0]), // Templated
							.reg_pipe_map6_dt_source(reg_pipe7_map6_dt_source[5:0]), // Templated
							.reg_pipe_map7_dt_source(reg_pipe7_map7_dt_source[5:0]), // Templated
							.reg_pipe_map8_dt_source(reg_pipe7_map8_dt_source[5:0]), // Templated
							.reg_pipe_map9_dt_source(reg_pipe7_map9_dt_source[5:0]), // Templated
							.reg_pipe_map10_dt_source(reg_pipe7_map10_dt_source[5:0]), // Templated
							.reg_pipe_map11_dt_source(reg_pipe7_map11_dt_source[5:0]), // Templated
							.reg_pipe_map12_dt_source(reg_pipe7_map12_dt_source[5:0]), // Templated
							.reg_pipe_map13_dt_source(reg_pipe7_map13_dt_source[5:0]), // Templated
							.reg_pipe_map14_dt_source(reg_pipe7_map14_dt_source[5:0]), // Templated
							.reg_pipe_map15_dt_source(reg_pipe7_map15_dt_source[5:0]), // Templated
							.reg_pipe_map0_dt_dest(reg_pipe7_map0_dt_dest[5:0]), // Templated
							.reg_pipe_map1_dt_dest(reg_pipe7_map1_dt_dest[5:0]), // Templated
							.reg_pipe_map2_dt_dest(reg_pipe7_map2_dt_dest[5:0]), // Templated
							.reg_pipe_map3_dt_dest(reg_pipe7_map3_dt_dest[5:0]), // Templated
							.reg_pipe_map4_dt_dest(reg_pipe7_map4_dt_dest[5:0]), // Templated
							.reg_pipe_map5_dt_dest(reg_pipe7_map5_dt_dest[5:0]), // Templated
							.reg_pipe_map6_dt_dest(reg_pipe7_map6_dt_dest[5:0]), // Templated
							.reg_pipe_map7_dt_dest(reg_pipe7_map7_dt_dest[5:0]), // Templated
							.reg_pipe_map8_dt_dest(reg_pipe7_map8_dt_dest[5:0]), // Templated
							.reg_pipe_map9_dt_dest(reg_pipe7_map9_dt_dest[5:0]), // Templated
							.reg_pipe_map10_dt_dest(reg_pipe7_map10_dt_dest[5:0]), // Templated
							.reg_pipe_map11_dt_dest(reg_pipe7_map11_dt_dest[5:0]), // Templated
							.reg_pipe_map12_dt_dest(reg_pipe7_map12_dt_dest[5:0]), // Templated
							.reg_pipe_map13_dt_dest(reg_pipe7_map13_dt_dest[5:0]), // Templated
							.reg_pipe_map14_dt_dest(reg_pipe7_map14_dt_dest[5:0]), // Templated
							.reg_pipe_map15_dt_dest(reg_pipe7_map15_dt_dest[5:0]), // Templated
							.mep0_csi_data	(mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep0_bytes_en	(mep0_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep0_header_en	(mep0_header_en),
							.mep0_data_en	(mep0_data_en),
							.mep0_data_type	(mep0_data_type[5:0]),
							.mep0_virtual_channel(mep0_virtual_channel[1:0]),
							.mep0_virtual_channel_x(mep0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep0_word_count(mep0_word_count[15:0]),
							.mep0_tunnel_mode_en(mep0_tunnel_mode_en),
							.mep0_pkt_crc_en(mep0_pkt_crc_en),
							.mep0_pkt_crc	(mep0_pkt_crc[31:0]),
							.mep1_csi_data	(mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep1_bytes_en	(mep1_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep1_header_en	(mep1_header_en),
							.mep1_data_en	(mep1_data_en),
							.mep1_data_type	(mep1_data_type[5:0]),
							.mep1_virtual_channel(mep1_virtual_channel[1:0]),
							.mep1_virtual_channel_x(mep1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep1_word_count(mep1_word_count[15:0]),
							.mep1_tunnel_mode_en(mep1_tunnel_mode_en),
							.mep1_pkt_crc_en(mep1_pkt_crc_en),
							.mep1_pkt_crc	(mep1_pkt_crc[31:0]),
							.mep2_csi_data	(mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep2_bytes_en	(mep2_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep2_header_en	(mep2_header_en),
							.mep2_data_en	(mep2_data_en),
							.mep2_data_type	(mep2_data_type[5:0]),
							.mep2_virtual_channel(mep2_virtual_channel[1:0]),
							.mep2_virtual_channel_x(mep2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep2_word_count(mep2_word_count[15:0]),
							.mep2_tunnel_mode_en(mep2_tunnel_mode_en),
							.mep2_pkt_crc_en(mep2_pkt_crc_en),
							.mep2_pkt_crc	(mep2_pkt_crc[31:0]),
							.mep3_csi_data	(mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
							.mep3_bytes_en	(mep3_bytes_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]),
							.mep3_header_en	(mep3_header_en),
							.mep3_data_en	(mep3_data_en),
							.mep3_data_type	(mep3_data_type[5:0]),
							.mep3_virtual_channel(mep3_virtual_channel[1:0]),
							.mep3_virtual_channel_x(mep3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
							.mep3_word_count(mep3_word_count[15:0]),
							.mep3_tunnel_mode_en(mep3_tunnel_mode_en),
							.mep3_pkt_crc_en(mep3_pkt_crc_en),
							.mep3_pkt_crc	(mep3_pkt_crc[31:0]),
							.reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en_app_route_lane7), // Templated
							.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en_app_route_lane7)); // Templated

endmodule
