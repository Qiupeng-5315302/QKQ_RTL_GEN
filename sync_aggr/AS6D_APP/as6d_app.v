
`include "as6d_app_all_includes.vh"
`include "as6d_mep_all_includes.vh"
`include "APP_device_all_rtl_includes.vh"
module   as6d_app (/*AUTOARG*/
   // Outputs
   video_data_fwft_fifo_ecc_fault7, video_data_fwft_fifo_ecc_fault6,
   video_data_fwft_fifo_ecc_fault5, video_data_fwft_fifo_ecc_fault4,
   video_data_fwft_fifo_ecc_fault3, video_data_fwft_fifo_ecc_fault2,
   video_data_fwft_fifo_ecc_fault1, video_data_fwft_fifo_ecc_fault0,
   video_data_afifo_ecc_fault7, video_data_afifo_ecc_fault6,
   video_data_afifo_ecc_fault5, video_data_afifo_ecc_fault4,
   video_data_afifo_ecc_fault3, video_data_afifo_ecc_fault2,
   video_data_afifo_ecc_fault1, video_data_afifo_ecc_fault0,
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
   reg_rd_vprbs_rx_check_app_route_lane0,
   reg_rd_send_pkt_cnt_sp_ls_aggr3, reg_rd_send_pkt_cnt_sp_ls_aggr2,
   reg_rd_send_pkt_cnt_sp_ls_aggr1, reg_rd_send_pkt_cnt_sp_ls_aggr0,
   reg_rd_send_pkt_cnt_sp_le_aggr3, reg_rd_send_pkt_cnt_sp_le_aggr2,
   reg_rd_send_pkt_cnt_sp_le_aggr1, reg_rd_send_pkt_cnt_sp_le_aggr0,
   reg_rd_send_pkt_cnt_sp_fs_aggr3, reg_rd_send_pkt_cnt_sp_fs_aggr2,
   reg_rd_send_pkt_cnt_sp_fs_aggr1, reg_rd_send_pkt_cnt_sp_fs_aggr0,
   reg_rd_send_pkt_cnt_sp_fe_aggr3, reg_rd_send_pkt_cnt_sp_fe_aggr2,
   reg_rd_send_pkt_cnt_sp_fe_aggr1, reg_rd_send_pkt_cnt_sp_fe_aggr0,
   reg_rd_send_pkt_cnt_lp_ph_aggr3, reg_rd_send_pkt_cnt_lp_ph_aggr2,
   reg_rd_send_pkt_cnt_lp_ph_aggr1, reg_rd_send_pkt_cnt_lp_ph_aggr0,
   reg_rd_send_pkt_cnt_lp_pf_aggr3, reg_rd_send_pkt_cnt_lp_pf_aggr2,
   reg_rd_send_pkt_cnt_lp_pf_aggr1, reg_rd_send_pkt_cnt_lp_pf_aggr0,
   reg_rd_resv_pkt_cnt_sp_ls_pipe7, reg_rd_resv_pkt_cnt_sp_ls_pipe6,
   reg_rd_resv_pkt_cnt_sp_ls_pipe5, reg_rd_resv_pkt_cnt_sp_ls_pipe4,
   reg_rd_resv_pkt_cnt_sp_ls_pipe3, reg_rd_resv_pkt_cnt_sp_ls_pipe2,
   reg_rd_resv_pkt_cnt_sp_ls_pipe1, reg_rd_resv_pkt_cnt_sp_ls_pipe0,
   reg_rd_resv_pkt_cnt_sp_le_pipe7, reg_rd_resv_pkt_cnt_sp_le_pipe6,
   reg_rd_resv_pkt_cnt_sp_le_pipe5, reg_rd_resv_pkt_cnt_sp_le_pipe4,
   reg_rd_resv_pkt_cnt_sp_le_pipe3, reg_rd_resv_pkt_cnt_sp_le_pipe2,
   reg_rd_resv_pkt_cnt_sp_le_pipe1, reg_rd_resv_pkt_cnt_sp_le_pipe0,
   reg_rd_resv_pkt_cnt_sp_fs_pipe7, reg_rd_resv_pkt_cnt_sp_fs_pipe6,
   reg_rd_resv_pkt_cnt_sp_fs_pipe5, reg_rd_resv_pkt_cnt_sp_fs_pipe4,
   reg_rd_resv_pkt_cnt_sp_fs_pipe3, reg_rd_resv_pkt_cnt_sp_fs_pipe2,
   reg_rd_resv_pkt_cnt_sp_fs_pipe1, reg_rd_resv_pkt_cnt_sp_fs_pipe0,
   reg_rd_resv_pkt_cnt_sp_fe_pipe7, reg_rd_resv_pkt_cnt_sp_fe_pipe6,
   reg_rd_resv_pkt_cnt_sp_fe_pipe5, reg_rd_resv_pkt_cnt_sp_fe_pipe4,
   reg_rd_resv_pkt_cnt_sp_fe_pipe3, reg_rd_resv_pkt_cnt_sp_fe_pipe2,
   reg_rd_resv_pkt_cnt_sp_fe_pipe1, reg_rd_resv_pkt_cnt_sp_fe_pipe0,
   reg_rd_resv_pkt_cnt_lp_ph_pipe7, reg_rd_resv_pkt_cnt_lp_ph_pipe6,
   reg_rd_resv_pkt_cnt_lp_ph_pipe5, reg_rd_resv_pkt_cnt_lp_ph_pipe4,
   reg_rd_resv_pkt_cnt_lp_ph_pipe3, reg_rd_resv_pkt_cnt_lp_ph_pipe2,
   reg_rd_resv_pkt_cnt_lp_ph_pipe1, reg_rd_resv_pkt_cnt_lp_ph_pipe0,
   reg_rd_resv_pkt_cnt_lp_pf_pipe7, reg_rd_resv_pkt_cnt_lp_pf_pipe6,
   reg_rd_resv_pkt_cnt_lp_pf_pipe5, reg_rd_resv_pkt_cnt_lp_pf_pipe4,
   reg_rd_resv_pkt_cnt_lp_pf_pipe3, reg_rd_resv_pkt_cnt_lp_pf_pipe2,
   reg_rd_resv_pkt_cnt_lp_pf_pipe1, reg_rd_resv_pkt_cnt_lp_pf_pipe0,
   reg_rd_pipe_fifo_full, reg_rd_dig_test_bus,
   reg_rd_dbg_pkt_num_nonzero_threshold_err,
   reg_rd_dbg_pkt_num_nonzero_and_fifo_empty_threshold_err,
   reg_rd_app_full_cnt_sync_fifo_pipe7,
   reg_rd_app_full_cnt_sync_fifo_pipe6,
   reg_rd_app_full_cnt_sync_fifo_pipe5,
   reg_rd_app_full_cnt_sync_fifo_pipe4,
   reg_rd_app_full_cnt_sync_fifo_pipe3,
   reg_rd_app_full_cnt_sync_fifo_pipe2,
   reg_rd_app_full_cnt_sync_fifo_pipe1,
   reg_rd_app_full_cnt_sync_fifo_pipe0,
   reg_rd_app_full_cnt_async_fifo_pipe7,
   reg_rd_app_full_cnt_async_fifo_pipe6,
   reg_rd_app_full_cnt_async_fifo_pipe5,
   reg_rd_app_full_cnt_async_fifo_pipe4,
   reg_rd_app_full_cnt_async_fifo_pipe3,
   reg_rd_app_full_cnt_async_fifo_pipe2,
   reg_rd_app_full_cnt_async_fifo_pipe1,
   reg_rd_app_full_cnt_async_fifo_pipe0, app_async_rst_req,
   app_aggr_idi_crc_err_int3, app_aggr_idi_crc_err_int2,
   app_aggr_idi_crc_err_int1, app_aggr_idi_crc_err_int0,
   aggr3_idi_word_count, aggr3_idi_virtual_channel_x,
   aggr3_idi_virtual_channel, aggr3_idi_tunnel_mode_en,
   aggr3_idi_header_en, aggr3_idi_data_type, aggr3_idi_data_parity,
   aggr3_idi_data_en, aggr3_idi_data, aggr3_idi_byte_en,
   aggr2_idi_word_count, aggr2_idi_virtual_channel_x,
   aggr2_idi_virtual_channel, aggr2_idi_tunnel_mode_en,
   aggr2_idi_header_en, aggr2_idi_data_type, aggr2_idi_data_parity,
   aggr2_idi_data_en, aggr2_idi_data, aggr2_idi_byte_en,
   aggr1_idi_word_count, aggr1_idi_virtual_channel_x,
   aggr1_idi_virtual_channel, aggr1_idi_tunnel_mode_en,
   aggr1_idi_header_en, aggr1_idi_data_type, aggr1_idi_data_parity,
   aggr1_idi_data_en, aggr1_idi_data, aggr1_idi_byte_en,
   aggr0_idi_word_count, aggr0_idi_virtual_channel_x,
   aggr0_idi_virtual_channel, aggr0_idi_tunnel_mode_en,
   aggr0_idi_header_en, aggr0_idi_data_type, aggr0_idi_data_parity,
   aggr0_idi_data_en, aggr0_idi_data, aggr0_idi_byte_en,
   PIN_DIG_TEST_BUS, to_clkgen_fifo_wrclk_sel0,
   to_clkgen_fifo_wrclk_sel1, to_clkgen_fifo_wrclk_sel2,
   to_clkgen_fifo_wrclk_sel3, to_clkgen_fifo_wrclk_sel4,
   to_clkgen_fifo_wrclk_sel5, to_clkgen_fifo_wrclk_sel6,
   to_clkgen_fifo_wrclk_sel7, to_clkgen_fifo_rdclk_sel0,
   to_clkgen_fifo_rdclk_sel1, to_clkgen_fifo_rdclk_sel2,
   to_clkgen_fifo_rdclk_sel3, to_clkgen_fifo_rdclk_sel4,
   to_clkgen_fifo_rdclk_sel5, to_clkgen_fifo_rdclk_sel6,
   to_clkgen_fifo_rdclk_sel7, reg_rd_video_lock0, reg_rd_video_lock1,
   reg_rd_video_lock2, reg_rd_video_lock3, reg_rd_video_lock4,
   reg_rd_video_lock5, reg_rd_video_lock6, reg_rd_video_lock7,
   reg_rd_video_loss0, reg_rd_video_loss1, reg_rd_video_loss2,
   reg_rd_video_loss3, reg_rd_video_loss4, reg_rd_video_loss5,
   reg_rd_video_loss6, reg_rd_video_loss7, video_loss0, video_loss1,
   video_loss2, video_loss3, video_loss4, video_loss5, video_loss6,
   video_loss7, reg_rd_fifo_rd_ctrl_cs0, reg_rd_fifo_rd_ctrl_cs1,
   reg_rd_fifo_rd_ctrl_cs2, reg_rd_fifo_rd_ctrl_cs3,
   reg_rd_fifo_rd_ctrl_cs4, reg_rd_fifo_rd_ctrl_cs5,
   reg_rd_fifo_rd_ctrl_cs6, reg_rd_fifo_rd_ctrl_cs7,
   reg_rd_fs_detect_pipe0, reg_rd_fs_detect_pipe1,
   reg_rd_fs_detect_pipe2, reg_rd_fs_detect_pipe3,
   reg_rd_fs_detect_pipe4, reg_rd_fs_detect_pipe5,
   reg_rd_fs_detect_pipe6, reg_rd_fs_detect_pipe7,
   reg_rd_fs_cnt_pipe0, reg_rd_fs_cnt_pipe1, reg_rd_fs_cnt_pipe2,
   reg_rd_fs_cnt_pipe3, reg_rd_fs_cnt_pipe4, reg_rd_fs_cnt_pipe5,
   reg_rd_fs_cnt_pipe6, reg_rd_fs_cnt_pipe7,
   reg_rd_cnt_line_end_rd_side0, reg_rd_cnt_line_end_rd_side1,
   reg_rd_cnt_line_end_rd_side2, reg_rd_cnt_line_end_rd_side3,
   reg_rd_cnt_line_end_rd_side4, reg_rd_cnt_line_end_rd_side5,
   reg_rd_cnt_line_end_rd_side6, reg_rd_cnt_line_end_rd_side7,
   reg_rd_sch0_cs, reg_rd_sch1_cs, reg_rd_sch2_cs, reg_rd_sch3_cs,
   reg_rd_sch2post_video_data_vld0, reg_rd_sch2post_video_data_vld1,
   reg_rd_sch2post_video_data_vld2, reg_rd_sch2post_video_data_vld3,
   reg_rd_pipe2sch_video_data_vld0, reg_rd_pipe2sch_video_data_vld1,
   reg_rd_pipe2sch_video_data_vld2, reg_rd_pipe2sch_video_data_vld3,
   reg_rd_pipe2sch_video_data_vld4, reg_rd_pipe2sch_video_data_vld5,
   reg_rd_pipe2sch_video_data_vld6, reg_rd_pipe2sch_video_data_vld7,
   reg_rd_pipe0_dispatched_cnt_ready_for_sch,
   reg_rd_pipe1_dispatched_cnt_ready_for_sch,
   reg_rd_pipe2_dispatched_cnt_ready_for_sch,
   reg_rd_pipe3_dispatched_cnt_ready_for_sch,
   reg_rd_pipe4_dispatched_cnt_ready_for_sch,
   reg_rd_pipe5_dispatched_cnt_ready_for_sch,
   reg_rd_pipe6_dispatched_cnt_ready_for_sch,
   reg_rd_pipe7_dispatched_cnt_ready_for_sch,
   video_data_afifo_mem_double_err0, video_data_afifo_mem_double_err1,
   video_data_afifo_mem_double_err2, video_data_afifo_mem_double_err3,
   video_data_afifo_mem_double_err4, video_data_afifo_mem_double_err5,
   video_data_afifo_mem_double_err6, video_data_afifo_mem_double_err7,
   video_data_afifo_mem_single_err0, video_data_afifo_mem_single_err1,
   video_data_afifo_mem_single_err2, video_data_afifo_mem_single_err3,
   video_data_afifo_mem_single_err4, video_data_afifo_mem_single_err5,
   video_data_afifo_mem_single_err6, video_data_afifo_mem_single_err7,
   video_data_afifo_ovf_int0, video_data_afifo_ovf_int1,
   video_data_afifo_ovf_int2, video_data_afifo_ovf_int3,
   video_data_afifo_ovf_int4, video_data_afifo_ovf_int5,
   video_data_afifo_ovf_int6, video_data_afifo_ovf_int7,
   video_data_fwft_fifo_mem_double_err0,
   video_data_fwft_fifo_mem_double_err1,
   video_data_fwft_fifo_mem_double_err2,
   video_data_fwft_fifo_mem_double_err3,
   video_data_fwft_fifo_mem_double_err4,
   video_data_fwft_fifo_mem_double_err5,
   video_data_fwft_fifo_mem_double_err6,
   video_data_fwft_fifo_mem_double_err7,
   video_data_fwft_fifo_mem_single_err0,
   video_data_fwft_fifo_mem_single_err1,
   video_data_fwft_fifo_mem_single_err2,
   video_data_fwft_fifo_mem_single_err3,
   video_data_fwft_fifo_mem_single_err4,
   video_data_fwft_fifo_mem_single_err5,
   video_data_fwft_fifo_mem_single_err6,
   video_data_fwft_fifo_mem_single_err7,
   video_data_fwft_fifo_ovf_int0, video_data_fwft_fifo_ovf_int1,
   video_data_fwft_fifo_ovf_int2, video_data_fwft_fifo_ovf_int3,
   video_data_fwft_fifo_ovf_int4, video_data_fwft_fifo_ovf_int5,
   video_data_fwft_fifo_ovf_int6, video_data_fwft_fifo_ovf_int7,
   lcrc_err0, lcrc_err1, lcrc_err2, lcrc_err3, lcrc_err4, lcrc_err5,
   lcrc_err6, lcrc_err7, vprbs_rx_fail_app_route_int0,
   vprbs_rx_fail_app_route_int1, vprbs_rx_fail_app_route_int2,
   vprbs_rx_fail_app_route_int3, vprbs_rx_fail_app_route_int4,
   vprbs_rx_fail_app_route_int5, vprbs_rx_fail_app_route_int6,
   vprbs_rx_fail_app_route_int7, sch_data_type_align_fail_int0,
   sch_data_type_align_fail_int1, sch_data_type_align_fail_int2,
   sch_data_type_align_fail_int3,
   // Inputs
   treed_reg_bank_clk_reset_n, treed_reg_bank_clk,
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
   reg_vprbs_loopback_app_route_lane0, reg_video_pipe_en,
   reg_video_fifo_empty_depend_cnt_mux,
   reg_video_data_fwft_fifo_ovf_int_mask7,
   reg_video_data_fwft_fifo_ovf_int_mask6,
   reg_video_data_fwft_fifo_ovf_int_mask5,
   reg_video_data_fwft_fifo_ovf_int_mask4,
   reg_video_data_fwft_fifo_ovf_int_mask3,
   reg_video_data_fwft_fifo_ovf_int_mask2,
   reg_video_data_fwft_fifo_ovf_int_mask1,
   reg_video_data_fwft_fifo_ovf_int_mask0, reg_vc_selz_l_mep3,
   reg_vc_selz_l_mep2, reg_vc_selz_l_mep1, reg_vc_selz_l_mep0,
   reg_vc_selz_h_mep3, reg_vc_selz_h_mep2, reg_vc_selz_h_mep1,
   reg_vc_selz_h_mep0, reg_testbus_sel_swap, reg_testbus_sel_order1,
   reg_testbus_sel_order0, reg_testbus_sel_lo1, reg_testbus_sel_lo0,
   reg_testbus_sel_hi1, reg_testbus_sel_hi0,
   reg_testbus_hi8bsel_8bmode, reg_sram_lcrc_err_oen,
   reg_send_pkt_match_lp_dt_en_aggr3,
   reg_send_pkt_match_lp_dt_en_aggr2,
   reg_send_pkt_match_lp_dt_en_aggr1,
   reg_send_pkt_match_lp_dt_en_aggr0, reg_send_pkt_match_lp_dt_aggr3,
   reg_send_pkt_match_lp_dt_aggr2, reg_send_pkt_match_lp_dt_aggr1,
   reg_send_pkt_match_lp_dt_aggr0,
   reg_sch_data_type_align_fail_int_mask3,
   reg_sch_data_type_align_fail_int_mask2,
   reg_sch_data_type_align_fail_int_mask1,
   reg_sch_data_type_align_fail_int_mask0,
   reg_sch3_frame_sync_auto_change_pipe_wr_mode,
   reg_sch2_frame_sync_auto_change_pipe_wr_mode,
   reg_sch1_frame_sync_auto_change_pipe_wr_mode,
   reg_sch0_frame_sync_auto_change_pipe_wr_mode,
   reg_resv_pkt_match_lp_dt_pipe7, reg_resv_pkt_match_lp_dt_pipe6,
   reg_resv_pkt_match_lp_dt_pipe5, reg_resv_pkt_match_lp_dt_pipe4,
   reg_resv_pkt_match_lp_dt_pipe3, reg_resv_pkt_match_lp_dt_pipe2,
   reg_resv_pkt_match_lp_dt_pipe1, reg_resv_pkt_match_lp_dt_pipe0,
   reg_resv_pkt_match_lp_dt_en_pipe7,
   reg_resv_pkt_match_lp_dt_en_pipe6,
   reg_resv_pkt_match_lp_dt_en_pipe5,
   reg_resv_pkt_match_lp_dt_en_pipe4,
   reg_resv_pkt_match_lp_dt_en_pipe3,
   reg_resv_pkt_match_lp_dt_en_pipe2,
   reg_resv_pkt_match_lp_dt_en_pipe1,
   reg_resv_pkt_match_lp_dt_en_pipe0,
   reg_pipe_fifo_full_clear_last_four, reg_pipe_fifo_full_clear,
   reg_pipe7_wr_mode, reg_pipe7_map_en, reg_pipe7_map9_vc_source,
   reg_pipe7_map9_vc_dest, reg_pipe7_map9_dt_source,
   reg_pipe7_map9_dt_dest, reg_pipe7_map9_aggr_id,
   reg_pipe7_map8_vc_source, reg_pipe7_map8_vc_dest,
   reg_pipe7_map8_dt_source, reg_pipe7_map8_dt_dest,
   reg_pipe7_map8_aggr_id, reg_pipe7_map7_vc_source,
   reg_pipe7_map7_vc_dest, reg_pipe7_map7_dt_source,
   reg_pipe7_map7_dt_dest, reg_pipe7_map7_aggr_id,
   reg_pipe7_map6_vc_source, reg_pipe7_map6_vc_dest,
   reg_pipe7_map6_dt_source, reg_pipe7_map6_dt_dest,
   reg_pipe7_map6_aggr_id, reg_pipe7_map5_vc_source,
   reg_pipe7_map5_vc_dest, reg_pipe7_map5_dt_source,
   reg_pipe7_map5_dt_dest, reg_pipe7_map5_aggr_id,
   reg_pipe7_map4_vc_source, reg_pipe7_map4_vc_dest,
   reg_pipe7_map4_dt_source, reg_pipe7_map4_dt_dest,
   reg_pipe7_map4_aggr_id, reg_pipe7_map3_vc_source,
   reg_pipe7_map3_vc_dest, reg_pipe7_map3_dt_source,
   reg_pipe7_map3_dt_dest, reg_pipe7_map3_aggr_id,
   reg_pipe7_map2_vc_source, reg_pipe7_map2_vc_dest,
   reg_pipe7_map2_dt_source, reg_pipe7_map2_dt_dest,
   reg_pipe7_map2_aggr_id, reg_pipe7_map1_vc_source,
   reg_pipe7_map1_vc_dest, reg_pipe7_map1_dt_source,
   reg_pipe7_map1_dt_dest, reg_pipe7_map1_aggr_id,
   reg_pipe7_map15_vc_source, reg_pipe7_map15_vc_dest,
   reg_pipe7_map15_dt_source, reg_pipe7_map15_dt_dest,
   reg_pipe7_map15_aggr_id, reg_pipe7_map14_vc_source,
   reg_pipe7_map14_vc_dest, reg_pipe7_map14_dt_source,
   reg_pipe7_map14_dt_dest, reg_pipe7_map14_aggr_id,
   reg_pipe7_map13_vc_source, reg_pipe7_map13_vc_dest,
   reg_pipe7_map13_dt_source, reg_pipe7_map13_dt_dest,
   reg_pipe7_map13_aggr_id, reg_pipe7_map12_vc_source,
   reg_pipe7_map12_vc_dest, reg_pipe7_map12_dt_source,
   reg_pipe7_map12_dt_dest, reg_pipe7_map12_aggr_id,
   reg_pipe7_map11_vc_source, reg_pipe7_map11_vc_dest,
   reg_pipe7_map11_dt_source, reg_pipe7_map11_dt_dest,
   reg_pipe7_map11_aggr_id, reg_pipe7_map10_vc_source,
   reg_pipe7_map10_vc_dest, reg_pipe7_map10_dt_source,
   reg_pipe7_map10_dt_dest, reg_pipe7_map10_aggr_id,
   reg_pipe7_map0_vc_source, reg_pipe7_map0_vc_dest,
   reg_pipe7_map0_dt_source, reg_pipe7_map0_dt_dest,
   reg_pipe7_map0_aggr_id, reg_pipe7_drop_ls_le_pkt,
   reg_pipe6_wr_mode, reg_pipe6_map_en, reg_pipe6_map9_vc_source,
   reg_pipe6_map9_vc_dest, reg_pipe6_map9_dt_source,
   reg_pipe6_map9_dt_dest, reg_pipe6_map9_aggr_id,
   reg_pipe6_map8_vc_source, reg_pipe6_map8_vc_dest,
   reg_pipe6_map8_dt_source, reg_pipe6_map8_dt_dest,
   reg_pipe6_map8_aggr_id, reg_pipe6_map7_vc_source,
   reg_pipe6_map7_vc_dest, reg_pipe6_map7_dt_source,
   reg_pipe6_map7_dt_dest, reg_pipe6_map7_aggr_id,
   reg_pipe6_map6_vc_source, reg_pipe6_map6_vc_dest,
   reg_pipe6_map6_dt_source, reg_pipe6_map6_dt_dest,
   reg_pipe6_map6_aggr_id, reg_pipe6_map5_vc_source,
   reg_pipe6_map5_vc_dest, reg_pipe6_map5_dt_source,
   reg_pipe6_map5_dt_dest, reg_pipe6_map5_aggr_id,
   reg_pipe6_map4_vc_source, reg_pipe6_map4_vc_dest,
   reg_pipe6_map4_dt_source, reg_pipe6_map4_dt_dest,
   reg_pipe6_map4_aggr_id, reg_pipe6_map3_vc_source,
   reg_pipe6_map3_vc_dest, reg_pipe6_map3_dt_source,
   reg_pipe6_map3_dt_dest, reg_pipe6_map3_aggr_id,
   reg_pipe6_map2_vc_source, reg_pipe6_map2_vc_dest,
   reg_pipe6_map2_dt_source, reg_pipe6_map2_dt_dest,
   reg_pipe6_map2_aggr_id, reg_pipe6_map1_vc_source,
   reg_pipe6_map1_vc_dest, reg_pipe6_map1_dt_source,
   reg_pipe6_map1_dt_dest, reg_pipe6_map1_aggr_id,
   reg_pipe6_map15_vc_source, reg_pipe6_map15_vc_dest,
   reg_pipe6_map15_dt_source, reg_pipe6_map15_dt_dest,
   reg_pipe6_map15_aggr_id, reg_pipe6_map14_vc_source,
   reg_pipe6_map14_vc_dest, reg_pipe6_map14_dt_source,
   reg_pipe6_map14_dt_dest, reg_pipe6_map14_aggr_id,
   reg_pipe6_map13_vc_source, reg_pipe6_map13_vc_dest,
   reg_pipe6_map13_dt_source, reg_pipe6_map13_dt_dest,
   reg_pipe6_map13_aggr_id, reg_pipe6_map12_vc_source,
   reg_pipe6_map12_vc_dest, reg_pipe6_map12_dt_source,
   reg_pipe6_map12_dt_dest, reg_pipe6_map12_aggr_id,
   reg_pipe6_map11_vc_source, reg_pipe6_map11_vc_dest,
   reg_pipe6_map11_dt_source, reg_pipe6_map11_dt_dest,
   reg_pipe6_map11_aggr_id, reg_pipe6_map10_vc_source,
   reg_pipe6_map10_vc_dest, reg_pipe6_map10_dt_source,
   reg_pipe6_map10_dt_dest, reg_pipe6_map10_aggr_id,
   reg_pipe6_map0_vc_source, reg_pipe6_map0_vc_dest,
   reg_pipe6_map0_dt_source, reg_pipe6_map0_dt_dest,
   reg_pipe6_map0_aggr_id, reg_pipe6_drop_ls_le_pkt,
   reg_pipe5_wr_mode, reg_pipe5_map_en, reg_pipe5_map9_vc_source,
   reg_pipe5_map9_vc_dest, reg_pipe5_map9_dt_source,
   reg_pipe5_map9_dt_dest, reg_pipe5_map9_aggr_id,
   reg_pipe5_map8_vc_source, reg_pipe5_map8_vc_dest,
   reg_pipe5_map8_dt_source, reg_pipe5_map8_dt_dest,
   reg_pipe5_map8_aggr_id, reg_pipe5_map7_vc_source,
   reg_pipe5_map7_vc_dest, reg_pipe5_map7_dt_source,
   reg_pipe5_map7_dt_dest, reg_pipe5_map7_aggr_id,
   reg_pipe5_map6_vc_source, reg_pipe5_map6_vc_dest,
   reg_pipe5_map6_dt_source, reg_pipe5_map6_dt_dest,
   reg_pipe5_map6_aggr_id, reg_pipe5_map5_vc_source,
   reg_pipe5_map5_vc_dest, reg_pipe5_map5_dt_source,
   reg_pipe5_map5_dt_dest, reg_pipe5_map5_aggr_id,
   reg_pipe5_map4_vc_source, reg_pipe5_map4_vc_dest,
   reg_pipe5_map4_dt_source, reg_pipe5_map4_dt_dest,
   reg_pipe5_map4_aggr_id, reg_pipe5_map3_vc_source,
   reg_pipe5_map3_vc_dest, reg_pipe5_map3_dt_source,
   reg_pipe5_map3_dt_dest, reg_pipe5_map3_aggr_id,
   reg_pipe5_map2_vc_source, reg_pipe5_map2_vc_dest,
   reg_pipe5_map2_dt_source, reg_pipe5_map2_dt_dest,
   reg_pipe5_map2_aggr_id, reg_pipe5_map1_vc_source,
   reg_pipe5_map1_vc_dest, reg_pipe5_map1_dt_source,
   reg_pipe5_map1_dt_dest, reg_pipe5_map1_aggr_id,
   reg_pipe5_map15_vc_source, reg_pipe5_map15_vc_dest,
   reg_pipe5_map15_dt_source, reg_pipe5_map15_dt_dest,
   reg_pipe5_map15_aggr_id, reg_pipe5_map14_vc_source,
   reg_pipe5_map14_vc_dest, reg_pipe5_map14_dt_source,
   reg_pipe5_map14_dt_dest, reg_pipe5_map14_aggr_id,
   reg_pipe5_map13_vc_source, reg_pipe5_map13_vc_dest,
   reg_pipe5_map13_dt_source, reg_pipe5_map13_dt_dest,
   reg_pipe5_map13_aggr_id, reg_pipe5_map12_vc_source,
   reg_pipe5_map12_vc_dest, reg_pipe5_map12_dt_source,
   reg_pipe5_map12_dt_dest, reg_pipe5_map12_aggr_id,
   reg_pipe5_map11_vc_source, reg_pipe5_map11_vc_dest,
   reg_pipe5_map11_dt_source, reg_pipe5_map11_dt_dest,
   reg_pipe5_map11_aggr_id, reg_pipe5_map10_vc_source,
   reg_pipe5_map10_vc_dest, reg_pipe5_map10_dt_source,
   reg_pipe5_map10_dt_dest, reg_pipe5_map10_aggr_id,
   reg_pipe5_map0_vc_source, reg_pipe5_map0_vc_dest,
   reg_pipe5_map0_dt_source, reg_pipe5_map0_dt_dest,
   reg_pipe5_map0_aggr_id, reg_pipe5_drop_ls_le_pkt,
   reg_pipe4_wr_mode, reg_pipe4_map_en, reg_pipe4_map9_vc_source,
   reg_pipe4_map9_vc_dest, reg_pipe4_map9_dt_source,
   reg_pipe4_map9_dt_dest, reg_pipe4_map9_aggr_id,
   reg_pipe4_map8_vc_source, reg_pipe4_map8_vc_dest,
   reg_pipe4_map8_dt_source, reg_pipe4_map8_dt_dest,
   reg_pipe4_map8_aggr_id, reg_pipe4_map7_vc_source,
   reg_pipe4_map7_vc_dest, reg_pipe4_map7_dt_source,
   reg_pipe4_map7_dt_dest, reg_pipe4_map7_aggr_id,
   reg_pipe4_map6_vc_source, reg_pipe4_map6_vc_dest,
   reg_pipe4_map6_dt_source, reg_pipe4_map6_dt_dest,
   reg_pipe4_map6_aggr_id, reg_pipe4_map5_vc_source,
   reg_pipe4_map5_vc_dest, reg_pipe4_map5_dt_source,
   reg_pipe4_map5_dt_dest, reg_pipe4_map5_aggr_id,
   reg_pipe4_map4_vc_source, reg_pipe4_map4_vc_dest,
   reg_pipe4_map4_dt_source, reg_pipe4_map4_dt_dest,
   reg_pipe4_map4_aggr_id, reg_pipe4_map3_vc_source,
   reg_pipe4_map3_vc_dest, reg_pipe4_map3_dt_source,
   reg_pipe4_map3_dt_dest, reg_pipe4_map3_aggr_id,
   reg_pipe4_map2_vc_source, reg_pipe4_map2_vc_dest,
   reg_pipe4_map2_dt_source, reg_pipe4_map2_dt_dest,
   reg_pipe4_map2_aggr_id, reg_pipe4_map1_vc_source,
   reg_pipe4_map1_vc_dest, reg_pipe4_map1_dt_source,
   reg_pipe4_map1_dt_dest, reg_pipe4_map1_aggr_id,
   reg_pipe4_map15_vc_source, reg_pipe4_map15_vc_dest,
   reg_pipe4_map15_dt_source, reg_pipe4_map15_dt_dest,
   reg_pipe4_map15_aggr_id, reg_pipe4_map14_vc_source,
   reg_pipe4_map14_vc_dest, reg_pipe4_map14_dt_source,
   reg_pipe4_map14_dt_dest, reg_pipe4_map14_aggr_id,
   reg_pipe4_map13_vc_source, reg_pipe4_map13_vc_dest,
   reg_pipe4_map13_dt_source, reg_pipe4_map13_dt_dest,
   reg_pipe4_map13_aggr_id, reg_pipe4_map12_vc_source,
   reg_pipe4_map12_vc_dest, reg_pipe4_map12_dt_source,
   reg_pipe4_map12_dt_dest, reg_pipe4_map12_aggr_id,
   reg_pipe4_map11_vc_source, reg_pipe4_map11_vc_dest,
   reg_pipe4_map11_dt_source, reg_pipe4_map11_dt_dest,
   reg_pipe4_map11_aggr_id, reg_pipe4_map10_vc_source,
   reg_pipe4_map10_vc_dest, reg_pipe4_map10_dt_source,
   reg_pipe4_map10_dt_dest, reg_pipe4_map10_aggr_id,
   reg_pipe4_map0_vc_source, reg_pipe4_map0_vc_dest,
   reg_pipe4_map0_dt_source, reg_pipe4_map0_dt_dest,
   reg_pipe4_map0_aggr_id, reg_pipe4_drop_ls_le_pkt,
   reg_pipe3_wr_mode, reg_pipe3_map_en, reg_pipe3_map9_vc_source,
   reg_pipe3_map9_vc_dest, reg_pipe3_map9_dt_source,
   reg_pipe3_map9_dt_dest, reg_pipe3_map9_aggr_id,
   reg_pipe3_map8_vc_source, reg_pipe3_map8_vc_dest,
   reg_pipe3_map8_dt_source, reg_pipe3_map8_dt_dest,
   reg_pipe3_map8_aggr_id, reg_pipe3_map7_vc_source,
   reg_pipe3_map7_vc_dest, reg_pipe3_map7_dt_source,
   reg_pipe3_map7_dt_dest, reg_pipe3_map7_aggr_id,
   reg_pipe3_map6_vc_source, reg_pipe3_map6_vc_dest,
   reg_pipe3_map6_dt_source, reg_pipe3_map6_dt_dest,
   reg_pipe3_map6_aggr_id, reg_pipe3_map5_vc_source,
   reg_pipe3_map5_vc_dest, reg_pipe3_map5_dt_source,
   reg_pipe3_map5_dt_dest, reg_pipe3_map5_aggr_id,
   reg_pipe3_map4_vc_source, reg_pipe3_map4_vc_dest,
   reg_pipe3_map4_dt_source, reg_pipe3_map4_dt_dest,
   reg_pipe3_map4_aggr_id, reg_pipe3_map3_vc_source,
   reg_pipe3_map3_vc_dest, reg_pipe3_map3_dt_source,
   reg_pipe3_map3_dt_dest, reg_pipe3_map3_aggr_id,
   reg_pipe3_map2_vc_source, reg_pipe3_map2_vc_dest,
   reg_pipe3_map2_dt_source, reg_pipe3_map2_dt_dest,
   reg_pipe3_map2_aggr_id, reg_pipe3_map1_vc_source,
   reg_pipe3_map1_vc_dest, reg_pipe3_map1_dt_source,
   reg_pipe3_map1_dt_dest, reg_pipe3_map1_aggr_id,
   reg_pipe3_map15_vc_source, reg_pipe3_map15_vc_dest,
   reg_pipe3_map15_dt_source, reg_pipe3_map15_dt_dest,
   reg_pipe3_map15_aggr_id, reg_pipe3_map14_vc_source,
   reg_pipe3_map14_vc_dest, reg_pipe3_map14_dt_source,
   reg_pipe3_map14_dt_dest, reg_pipe3_map14_aggr_id,
   reg_pipe3_map13_vc_source, reg_pipe3_map13_vc_dest,
   reg_pipe3_map13_dt_source, reg_pipe3_map13_dt_dest,
   reg_pipe3_map13_aggr_id, reg_pipe3_map12_vc_source,
   reg_pipe3_map12_vc_dest, reg_pipe3_map12_dt_source,
   reg_pipe3_map12_dt_dest, reg_pipe3_map12_aggr_id,
   reg_pipe3_map11_vc_source, reg_pipe3_map11_vc_dest,
   reg_pipe3_map11_dt_source, reg_pipe3_map11_dt_dest,
   reg_pipe3_map11_aggr_id, reg_pipe3_map10_vc_source,
   reg_pipe3_map10_vc_dest, reg_pipe3_map10_dt_source,
   reg_pipe3_map10_dt_dest, reg_pipe3_map10_aggr_id,
   reg_pipe3_map0_vc_source, reg_pipe3_map0_vc_dest,
   reg_pipe3_map0_dt_source, reg_pipe3_map0_dt_dest,
   reg_pipe3_map0_aggr_id, reg_pipe3_drop_ls_le_pkt,
   reg_pipe2_wr_mode, reg_pipe2_map_en, reg_pipe2_map9_vc_source,
   reg_pipe2_map9_vc_dest, reg_pipe2_map9_dt_source,
   reg_pipe2_map9_dt_dest, reg_pipe2_map9_aggr_id,
   reg_pipe2_map8_vc_source, reg_pipe2_map8_vc_dest,
   reg_pipe2_map8_dt_source, reg_pipe2_map8_dt_dest,
   reg_pipe2_map8_aggr_id, reg_pipe2_map7_vc_source,
   reg_pipe2_map7_vc_dest, reg_pipe2_map7_dt_source,
   reg_pipe2_map7_dt_dest, reg_pipe2_map7_aggr_id,
   reg_pipe2_map6_vc_source, reg_pipe2_map6_vc_dest,
   reg_pipe2_map6_dt_source, reg_pipe2_map6_dt_dest,
   reg_pipe2_map6_aggr_id, reg_pipe2_map5_vc_source,
   reg_pipe2_map5_vc_dest, reg_pipe2_map5_dt_source,
   reg_pipe2_map5_dt_dest, reg_pipe2_map5_aggr_id,
   reg_pipe2_map4_vc_source, reg_pipe2_map4_vc_dest,
   reg_pipe2_map4_dt_source, reg_pipe2_map4_dt_dest,
   reg_pipe2_map4_aggr_id, reg_pipe2_map3_vc_source,
   reg_pipe2_map3_vc_dest, reg_pipe2_map3_dt_source,
   reg_pipe2_map3_dt_dest, reg_pipe2_map3_aggr_id,
   reg_pipe2_map2_vc_source, reg_pipe2_map2_vc_dest,
   reg_pipe2_map2_dt_source, reg_pipe2_map2_dt_dest,
   reg_pipe2_map2_aggr_id, reg_pipe2_map1_vc_source,
   reg_pipe2_map1_vc_dest, reg_pipe2_map1_dt_source,
   reg_pipe2_map1_dt_dest, reg_pipe2_map1_aggr_id,
   reg_pipe2_map15_vc_source, reg_pipe2_map15_vc_dest,
   reg_pipe2_map15_dt_source, reg_pipe2_map15_dt_dest,
   reg_pipe2_map15_aggr_id, reg_pipe2_map14_vc_source,
   reg_pipe2_map14_vc_dest, reg_pipe2_map14_dt_source,
   reg_pipe2_map14_dt_dest, reg_pipe2_map14_aggr_id,
   reg_pipe2_map13_vc_source, reg_pipe2_map13_vc_dest,
   reg_pipe2_map13_dt_source, reg_pipe2_map13_dt_dest,
   reg_pipe2_map13_aggr_id, reg_pipe2_map12_vc_source,
   reg_pipe2_map12_vc_dest, reg_pipe2_map12_dt_source,
   reg_pipe2_map12_dt_dest, reg_pipe2_map12_aggr_id,
   reg_pipe2_map11_vc_source, reg_pipe2_map11_vc_dest,
   reg_pipe2_map11_dt_source, reg_pipe2_map11_dt_dest,
   reg_pipe2_map11_aggr_id, reg_pipe2_map10_vc_source,
   reg_pipe2_map10_vc_dest, reg_pipe2_map10_dt_source,
   reg_pipe2_map10_dt_dest, reg_pipe2_map10_aggr_id,
   reg_pipe2_map0_vc_source, reg_pipe2_map0_vc_dest,
   reg_pipe2_map0_dt_source, reg_pipe2_map0_dt_dest,
   reg_pipe2_map0_aggr_id, reg_pipe2_drop_ls_le_pkt,
   reg_pipe1_wr_mode, reg_pipe1_map_en, reg_pipe1_map9_vc_source,
   reg_pipe1_map9_vc_dest, reg_pipe1_map9_dt_source,
   reg_pipe1_map9_dt_dest, reg_pipe1_map9_aggr_id,
   reg_pipe1_map8_vc_source, reg_pipe1_map8_vc_dest,
   reg_pipe1_map8_dt_source, reg_pipe1_map8_dt_dest,
   reg_pipe1_map8_aggr_id, reg_pipe1_map7_vc_source,
   reg_pipe1_map7_vc_dest, reg_pipe1_map7_dt_source,
   reg_pipe1_map7_dt_dest, reg_pipe1_map7_aggr_id,
   reg_pipe1_map6_vc_source, reg_pipe1_map6_vc_dest,
   reg_pipe1_map6_dt_source, reg_pipe1_map6_dt_dest,
   reg_pipe1_map6_aggr_id, reg_pipe1_map5_vc_source,
   reg_pipe1_map5_vc_dest, reg_pipe1_map5_dt_source,
   reg_pipe1_map5_dt_dest, reg_pipe1_map5_aggr_id,
   reg_pipe1_map4_vc_source, reg_pipe1_map4_vc_dest,
   reg_pipe1_map4_dt_source, reg_pipe1_map4_dt_dest,
   reg_pipe1_map4_aggr_id, reg_pipe1_map3_vc_source,
   reg_pipe1_map3_vc_dest, reg_pipe1_map3_dt_source,
   reg_pipe1_map3_dt_dest, reg_pipe1_map3_aggr_id,
   reg_pipe1_map2_vc_source, reg_pipe1_map2_vc_dest,
   reg_pipe1_map2_dt_source, reg_pipe1_map2_dt_dest,
   reg_pipe1_map2_aggr_id, reg_pipe1_map1_vc_source,
   reg_pipe1_map1_vc_dest, reg_pipe1_map1_dt_source,
   reg_pipe1_map1_dt_dest, reg_pipe1_map1_aggr_id,
   reg_pipe1_map15_vc_source, reg_pipe1_map15_vc_dest,
   reg_pipe1_map15_dt_source, reg_pipe1_map15_dt_dest,
   reg_pipe1_map15_aggr_id, reg_pipe1_map14_vc_source,
   reg_pipe1_map14_vc_dest, reg_pipe1_map14_dt_source,
   reg_pipe1_map14_dt_dest, reg_pipe1_map14_aggr_id,
   reg_pipe1_map13_vc_source, reg_pipe1_map13_vc_dest,
   reg_pipe1_map13_dt_source, reg_pipe1_map13_dt_dest,
   reg_pipe1_map13_aggr_id, reg_pipe1_map12_vc_source,
   reg_pipe1_map12_vc_dest, reg_pipe1_map12_dt_source,
   reg_pipe1_map12_dt_dest, reg_pipe1_map12_aggr_id,
   reg_pipe1_map11_vc_source, reg_pipe1_map11_vc_dest,
   reg_pipe1_map11_dt_source, reg_pipe1_map11_dt_dest,
   reg_pipe1_map11_aggr_id, reg_pipe1_map10_vc_source,
   reg_pipe1_map10_vc_dest, reg_pipe1_map10_dt_source,
   reg_pipe1_map10_dt_dest, reg_pipe1_map10_aggr_id,
   reg_pipe1_map0_vc_source, reg_pipe1_map0_vc_dest,
   reg_pipe1_map0_dt_source, reg_pipe1_map0_dt_dest,
   reg_pipe1_map0_aggr_id, reg_pipe1_drop_ls_le_pkt,
   reg_pipe0_wr_mode, reg_pipe0_map_en, reg_pipe0_map9_vc_source,
   reg_pipe0_map9_vc_dest, reg_pipe0_map9_dt_source,
   reg_pipe0_map9_dt_dest, reg_pipe0_map9_aggr_id,
   reg_pipe0_map8_vc_source, reg_pipe0_map8_vc_dest,
   reg_pipe0_map8_dt_source, reg_pipe0_map8_dt_dest,
   reg_pipe0_map8_aggr_id, reg_pipe0_map7_vc_source,
   reg_pipe0_map7_vc_dest, reg_pipe0_map7_dt_source,
   reg_pipe0_map7_dt_dest, reg_pipe0_map7_aggr_id,
   reg_pipe0_map6_vc_source, reg_pipe0_map6_vc_dest,
   reg_pipe0_map6_dt_source, reg_pipe0_map6_dt_dest,
   reg_pipe0_map6_aggr_id, reg_pipe0_map5_vc_source,
   reg_pipe0_map5_vc_dest, reg_pipe0_map5_dt_source,
   reg_pipe0_map5_dt_dest, reg_pipe0_map5_aggr_id,
   reg_pipe0_map4_vc_source, reg_pipe0_map4_vc_dest,
   reg_pipe0_map4_dt_source, reg_pipe0_map4_dt_dest,
   reg_pipe0_map4_aggr_id, reg_pipe0_map3_vc_source,
   reg_pipe0_map3_vc_dest, reg_pipe0_map3_dt_source,
   reg_pipe0_map3_dt_dest, reg_pipe0_map3_aggr_id,
   reg_pipe0_map2_vc_source, reg_pipe0_map2_vc_dest,
   reg_pipe0_map2_dt_source, reg_pipe0_map2_dt_dest,
   reg_pipe0_map2_aggr_id, reg_pipe0_map1_vc_source,
   reg_pipe0_map1_vc_dest, reg_pipe0_map1_dt_source,
   reg_pipe0_map1_dt_dest, reg_pipe0_map1_aggr_id,
   reg_pipe0_map15_vc_source, reg_pipe0_map15_vc_dest,
   reg_pipe0_map15_dt_source, reg_pipe0_map15_dt_dest,
   reg_pipe0_map15_aggr_id, reg_pipe0_map14_vc_source,
   reg_pipe0_map14_vc_dest, reg_pipe0_map14_dt_source,
   reg_pipe0_map14_dt_dest, reg_pipe0_map14_aggr_id,
   reg_pipe0_map13_vc_source, reg_pipe0_map13_vc_dest,
   reg_pipe0_map13_dt_source, reg_pipe0_map13_dt_dest,
   reg_pipe0_map13_aggr_id, reg_pipe0_map12_vc_source,
   reg_pipe0_map12_vc_dest, reg_pipe0_map12_dt_source,
   reg_pipe0_map12_dt_dest, reg_pipe0_map12_aggr_id,
   reg_pipe0_map11_vc_source, reg_pipe0_map11_vc_dest,
   reg_pipe0_map11_dt_source, reg_pipe0_map11_dt_dest,
   reg_pipe0_map11_aggr_id, reg_pipe0_map10_vc_source,
   reg_pipe0_map10_vc_dest, reg_pipe0_map10_dt_source,
   reg_pipe0_map10_dt_dest, reg_pipe0_map10_aggr_id,
   reg_pipe0_map0_vc_source, reg_pipe0_map0_vc_dest,
   reg_pipe0_map0_dt_source, reg_pipe0_map0_dt_dest,
   reg_pipe0_map0_aggr_id, reg_pipe0_drop_ls_le_pkt,
   reg_mep3_tdi_en_force, reg_mep3_tdi_en, reg_mep2_tdi_en_force,
   reg_mep2_tdi_en, reg_mep1_tdi_en_force, reg_mep1_tdi_en,
   reg_mep0_tdi_en_force, reg_mep0_tdi_en, reg_mem_dt8_selz_mep3,
   reg_mem_dt8_selz_mep2, reg_mem_dt8_selz_mep1,
   reg_mem_dt8_selz_mep0, reg_mem_dt7_selz_mep3,
   reg_mem_dt7_selz_mep2, reg_mem_dt7_selz_mep1,
   reg_mem_dt7_selz_mep0, reg_mem_dt4_selz_mep3,
   reg_mem_dt4_selz_mep2, reg_mem_dt4_selz_mep1,
   reg_mem_dt4_selz_mep0, reg_mem_dt4_selz_en_mep3,
   reg_mem_dt4_selz_en_mep2, reg_mem_dt4_selz_en_mep1,
   reg_mem_dt4_selz_en_mep0, reg_mem_dt3_selz_mep3,
   reg_mem_dt3_selz_mep2, reg_mem_dt3_selz_mep1,
   reg_mem_dt3_selz_mep0, reg_mem_dt3_selz_en_mep3,
   reg_mem_dt3_selz_en_mep2, reg_mem_dt3_selz_en_mep1,
   reg_mem_dt3_selz_en_mep0, reg_mem_dt2_selz_mep3,
   reg_mem_dt2_selz_mep2, reg_mem_dt2_selz_mep1,
   reg_mem_dt2_selz_mep0, reg_mem_dt1_selz_mep3,
   reg_mem_dt1_selz_mep2, reg_mem_dt1_selz_mep1,
   reg_mem_dt1_selz_mep0, reg_last_byte_header_down_mux,
   reg_drop_mapping_fault_pkt, reg_dft_tpram_config,
   reg_dft_sync_tpram_config, reg_delete_lp_depend_on_wc_mux,
   reg_dbg_pkt_num_nonzero_threshold,
   reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold,
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
   reg_clear_send_pkt_cnt_lp_pf_aggr0,
   reg_clear_resv_pkt_cnt_sp_ls_pipe7,
   reg_clear_resv_pkt_cnt_sp_ls_pipe6,
   reg_clear_resv_pkt_cnt_sp_ls_pipe5,
   reg_clear_resv_pkt_cnt_sp_ls_pipe4,
   reg_clear_resv_pkt_cnt_sp_ls_pipe3,
   reg_clear_resv_pkt_cnt_sp_ls_pipe2,
   reg_clear_resv_pkt_cnt_sp_ls_pipe1,
   reg_clear_resv_pkt_cnt_sp_ls_pipe0,
   reg_clear_resv_pkt_cnt_sp_le_pipe7,
   reg_clear_resv_pkt_cnt_sp_le_pipe6,
   reg_clear_resv_pkt_cnt_sp_le_pipe5,
   reg_clear_resv_pkt_cnt_sp_le_pipe4,
   reg_clear_resv_pkt_cnt_sp_le_pipe3,
   reg_clear_resv_pkt_cnt_sp_le_pipe2,
   reg_clear_resv_pkt_cnt_sp_le_pipe1,
   reg_clear_resv_pkt_cnt_sp_le_pipe0,
   reg_clear_resv_pkt_cnt_sp_fs_pipe7,
   reg_clear_resv_pkt_cnt_sp_fs_pipe6,
   reg_clear_resv_pkt_cnt_sp_fs_pipe5,
   reg_clear_resv_pkt_cnt_sp_fs_pipe4,
   reg_clear_resv_pkt_cnt_sp_fs_pipe3,
   reg_clear_resv_pkt_cnt_sp_fs_pipe2,
   reg_clear_resv_pkt_cnt_sp_fs_pipe1,
   reg_clear_resv_pkt_cnt_sp_fs_pipe0,
   reg_clear_resv_pkt_cnt_sp_fe_pipe7,
   reg_clear_resv_pkt_cnt_sp_fe_pipe6,
   reg_clear_resv_pkt_cnt_sp_fe_pipe5,
   reg_clear_resv_pkt_cnt_sp_fe_pipe4,
   reg_clear_resv_pkt_cnt_sp_fe_pipe3,
   reg_clear_resv_pkt_cnt_sp_fe_pipe2,
   reg_clear_resv_pkt_cnt_sp_fe_pipe1,
   reg_clear_resv_pkt_cnt_sp_fe_pipe0,
   reg_clear_resv_pkt_cnt_lp_ph_pipe7,
   reg_clear_resv_pkt_cnt_lp_ph_pipe6,
   reg_clear_resv_pkt_cnt_lp_ph_pipe5,
   reg_clear_resv_pkt_cnt_lp_ph_pipe4,
   reg_clear_resv_pkt_cnt_lp_ph_pipe3,
   reg_clear_resv_pkt_cnt_lp_ph_pipe2,
   reg_clear_resv_pkt_cnt_lp_ph_pipe1,
   reg_clear_resv_pkt_cnt_lp_ph_pipe0,
   reg_clear_resv_pkt_cnt_lp_pf_pipe7,
   reg_clear_resv_pkt_cnt_lp_pf_pipe6,
   reg_clear_resv_pkt_cnt_lp_pf_pipe5,
   reg_clear_resv_pkt_cnt_lp_pf_pipe4,
   reg_clear_resv_pkt_cnt_lp_pf_pipe3,
   reg_clear_resv_pkt_cnt_lp_pf_pipe2,
   reg_clear_resv_pkt_cnt_lp_pf_pipe1,
   reg_clear_resv_pkt_cnt_lp_pf_pipe0,
   reg_clear_app_full_cnt_sync_fifo_pipe7,
   reg_clear_app_full_cnt_sync_fifo_pipe6,
   reg_clear_app_full_cnt_sync_fifo_pipe5,
   reg_clear_app_full_cnt_sync_fifo_pipe4,
   reg_clear_app_full_cnt_sync_fifo_pipe3,
   reg_clear_app_full_cnt_sync_fifo_pipe2,
   reg_clear_app_full_cnt_sync_fifo_pipe1,
   reg_clear_app_full_cnt_sync_fifo_pipe0,
   reg_clear_app_full_cnt_async_fifo_pipe7,
   reg_clear_app_full_cnt_async_fifo_pipe6,
   reg_clear_app_full_cnt_async_fifo_pipe5,
   reg_clear_app_full_cnt_async_fifo_pipe4,
   reg_clear_app_full_cnt_async_fifo_pipe3,
   reg_clear_app_full_cnt_async_fifo_pipe2,
   reg_clear_app_full_cnt_async_fifo_pipe1,
   reg_clear_app_full_cnt_async_fifo_pipe0,
   reg_app_wr_idi_data_continue, reg_app_sch3_frame_sync_lock_force,
   reg_app_sch3_frame_sync_lock, reg_app_sch2_frame_sync_lock_force,
   reg_app_sch2_frame_sync_lock, reg_app_sch1_frame_sync_lock_force,
   reg_app_sch1_frame_sync_lock, reg_app_sch0_frame_sync_lock_force,
   reg_app_sch0_frame_sync_lock, reg_app_pkt_crc_gen_dis,
   reg_app_ecc_fault_detc_en, reg_app_ecc_bypass,
   reg_app_ecc_addr_protect_en, reg_app_aggr_idi_crc_chk_en,
   reg_app_aggr3_vc_bit_override_value,
   reg_app_aggr3_vc_bit_override_en,
   reg_app_aggr2_vc_bit_override_value,
   reg_app_aggr2_vc_bit_override_en,
   reg_app_aggr1_vc_bit_override_value,
   reg_app_aggr1_vc_bit_override_en,
   reg_app_aggr0_vc_bit_override_value,
   reg_app_aggr0_vc_bit_override_en, reg_all_pipe_wr_mode_strobe,
   mep3_word_count, mep3_tunnel_mode_en, mep3_header_en,
   mep3_data_type, mep3_data_en, mep3_csi_data, mep3_byte_en,
   mep2_word_count, mep2_tunnel_mode_en, mep2_header_en,
   mep2_data_type, mep2_data_en, mep2_csi_data, mep2_byte_en,
   mep1_word_count, mep1_tunnel_mode_en, mep1_header_en,
   mep1_data_type, mep1_data_en, mep1_csi_data, mep1_byte_en,
   mep0_word_count, mep0_tunnel_mode_en, mep0_header_en,
   mep0_data_type, mep0_data_en, mep0_csi_data, mep0_byte_en,
   gpio2app_sch3_frame_sync_lock, gpio2app_sch2_frame_sync_lock,
   gpio2app_sch1_frame_sync_lock, gpio2app_sch0_frame_sync_lock,
   fifo_wrclk_rst_n7, fifo_wrclk_rst_n6, fifo_wrclk_rst_n5,
   fifo_wrclk_rst_n4, fifo_wrclk_rst_n3, fifo_wrclk_rst_n2,
   fifo_wrclk_rst_n1, fifo_wrclk_rst_n0, fifo_wrclk7, fifo_wrclk6,
   fifo_wrclk5, fifo_wrclk4, fifo_wrclk3, fifo_wrclk2, fifo_wrclk1,
   fifo_wrclk0, fifo_rdclk_rst_n7, fifo_rdclk_rst_n6,
   fifo_rdclk_rst_n5, fifo_rdclk_rst_n4, fifo_rdclk_rst_n3,
   fifo_rdclk_rst_n2, fifo_rdclk_rst_n1, fifo_rdclk_rst_n0,
   fifo_rdclk7, fifo_rdclk6, fifo_rdclk5, fifo_rdclk4, fifo_rdclk3,
   fifo_rdclk2, fifo_rdclk1, fifo_rdclk0, clk_1M, aggre_clk_rst_n3,
   aggre_clk_rst_n2, aggre_clk_rst_n1, aggre_clk_rst_n0, aggre_clk3,
   aggre_clk2, aggre_clk1, aggre_clk0, mep_clk0, mep_clk1, mep_clk2,
   mep_clk3, mep_clk_rst_n0, mep_clk_rst_n1, mep_clk_rst_n2,
   mep_clk_rst_n3, reg_pipe0_stream_sel, reg_pipe1_stream_sel,
   reg_pipe2_stream_sel, reg_pipe3_stream_sel, reg_pipe4_stream_sel,
   reg_pipe5_stream_sel, reg_pipe6_stream_sel, reg_pipe7_stream_sel,
   reg_app_sch0, reg_app_sch1, reg_app_sch2, reg_app_sch3,
   reg_time_window0, reg_time_window1, reg_time_window2,
   reg_time_window3, reg_time_window4, reg_time_window5,
   reg_time_window6, reg_time_window7, reg_video_loss_en0,
   reg_video_loss_en1, reg_video_loss_en2, reg_video_loss_en3,
   reg_video_loss_en4, reg_video_loss_en5, reg_video_loss_en6,
   reg_video_loss_en7, reg_line_delay_en0, reg_line_delay_en1,
   reg_line_delay_en2, reg_line_delay_en3, reg_line_delay_en4,
   reg_line_delay_en5, reg_line_delay_en6, reg_line_delay_en7,
   reg_app_aggregation_bypass, reg_sch0_fse_filter,
   reg_sch1_fse_filter, reg_sch2_fse_filter, reg_sch3_fse_filter,
   mep0_virtual_channel, mep1_virtual_channel, mep2_virtual_channel,
   mep3_virtual_channel, mep0_virtual_channel_x,
   mep1_virtual_channel_x, mep2_virtual_channel_x,
   mep3_virtual_channel_x
   );


/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			aggre_clk0;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			aggre_clk1;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			aggre_clk2;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			aggre_clk3;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			aggre_clk_rst_n0;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			aggre_clk_rst_n1;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			aggre_clk_rst_n2;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			aggre_clk_rst_n3;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			clk_1M;			// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk0;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk1;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk2;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk3;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk4;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk5;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk6;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk7;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n0;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n1;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n2;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n3;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n4;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n5;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n6;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_rdclk_rst_n7;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk0;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk1;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk2;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk3;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk4;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk5;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk6;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk7;		// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n0;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n1;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n2;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n3;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n4;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n5;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n6;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			fifo_wrclk_rst_n7;	// To u_as6d_app_sync of as6d_app_sync.v, ...
input			gpio2app_sch0_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input			gpio2app_sch1_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input			gpio2app_sch2_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input			gpio2app_sch3_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		mep0_byte_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [63:0]		mep0_csi_data;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep0_data_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [5:0]		mep0_data_type;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep0_header_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep0_tunnel_mode_en;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [15:0]		mep0_word_count;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [2:0]		mep1_byte_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [63:0]		mep1_csi_data;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep1_data_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [5:0]		mep1_data_type;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep1_header_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep1_tunnel_mode_en;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [15:0]		mep1_word_count;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [2:0]		mep2_byte_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [63:0]		mep2_csi_data;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep2_data_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [5:0]		mep2_data_type;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep2_header_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep2_tunnel_mode_en;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [15:0]		mep2_word_count;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [2:0]		mep3_byte_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [63:0]		mep3_csi_data;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep3_data_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [5:0]		mep3_data_type;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep3_header_en;		// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			mep3_tunnel_mode_en;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input [15:0]		mep3_word_count;	// To u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
input			reg_all_pipe_wr_mode_strobe;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_app_aggr0_vc_bit_override_en;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [2:0]		reg_app_aggr0_vc_bit_override_value;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [2:0]		reg_app_aggr1_vc_bit_override_en;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [2:0]		reg_app_aggr1_vc_bit_override_value;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [2:0]		reg_app_aggr2_vc_bit_override_en;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [2:0]		reg_app_aggr2_vc_bit_override_value;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [2:0]		reg_app_aggr3_vc_bit_override_en;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [2:0]		reg_app_aggr3_vc_bit_override_value;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [3:0]		reg_app_aggr_idi_crc_chk_en;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_app_ecc_addr_protect_en;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_app_ecc_bypass;	// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_app_ecc_fault_detc_en;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_app_pkt_crc_gen_dis;// To u_as6d_app_crc_gen of as6d_app_crc_gen.v, ...
input			reg_app_sch0_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_sch0_frame_sync_lock_force;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_sch1_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_sch1_frame_sync_lock_force;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_sch2_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_sch2_frame_sync_lock_force;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_sch3_frame_sync_lock;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_sch3_frame_sync_lock_force;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_app_wr_idi_data_continue;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_async_fifo_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_app_full_cnt_sync_fifo_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_pf_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_lp_ph_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fe_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_fs_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_le_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_resv_pkt_cnt_sp_ls_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_clear_send_pkt_cnt_lp_pf_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_lp_pf_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_lp_pf_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_lp_pf_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_lp_ph_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fe_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_fs_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_le_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_le_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_le_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_le_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_clear_send_pkt_cnt_sp_ls_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [15:0]		reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [15:0]		reg_dbg_pkt_num_nonzero_threshold;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_delete_lp_depend_on_wc_mux;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [9:0]		reg_dft_sync_tpram_config;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [8:0]		reg_dft_tpram_config;	// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [7:0]		reg_drop_mapping_fault_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input			reg_last_byte_header_down_mux;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [6:0]		reg_mem_dt1_selz_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt1_selz_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt1_selz_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt1_selz_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt2_selz_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt2_selz_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt2_selz_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt2_selz_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt3_selz_en_mep0;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt3_selz_en_mep1;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt3_selz_en_mep2;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt3_selz_en_mep3;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt3_selz_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt3_selz_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt3_selz_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt3_selz_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt4_selz_en_mep0;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt4_selz_en_mep1;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt4_selz_en_mep2;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mem_dt4_selz_en_mep3;// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt4_selz_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt4_selz_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt4_selz_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_mem_dt4_selz_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt7_selz_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt7_selz_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt7_selz_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt7_selz_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt8_selz_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt8_selz_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt8_selz_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [6:0]		reg_mem_dt8_selz_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep0_tdi_en;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep0_tdi_en_force;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep1_tdi_en;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep1_tdi_en_force;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep2_tdi_en;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep2_tdi_en_force;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep3_tdi_en;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_mep3_tdi_en_force;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_pipe0_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe0_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe0_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe0_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe0_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input			reg_pipe1_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe1_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe1_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe1_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe1_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input			reg_pipe2_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe2_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe2_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe2_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe2_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input			reg_pipe3_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe3_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe3_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe3_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe3_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input			reg_pipe4_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe4_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe4_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe4_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe4_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input			reg_pipe5_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe5_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe5_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe5_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe5_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input			reg_pipe6_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe6_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe6_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe6_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe6_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input			reg_pipe7_drop_ls_le_pkt;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map0_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map0_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map0_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map0_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map0_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map10_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map10_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map10_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map10_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map10_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map11_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map11_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map11_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map11_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map11_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map12_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map12_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map12_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map12_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map12_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map13_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map13_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map13_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map13_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map13_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map14_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map14_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map14_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map14_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map14_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map15_aggr_id;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map15_dt_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map15_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map15_vc_dest;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map15_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map1_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map1_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map1_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map1_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map1_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map2_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map2_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map2_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map2_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map2_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map3_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map3_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map3_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map3_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map3_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map4_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map4_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map4_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map4_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map4_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map5_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map5_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map5_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map5_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map5_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map6_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map6_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map6_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map6_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map6_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map7_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map7_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map7_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map7_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map7_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map8_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map8_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map8_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map8_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map8_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [3:0]		reg_pipe7_map9_aggr_id;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map9_dt_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [5:0]		reg_pipe7_map9_dt_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map9_vc_dest;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_map9_vc_source;// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [15:0]		reg_pipe7_map_en;	// To u_as6d_app_pipe_route of as6d_app_pipe_route.v
input [1:0]		reg_pipe7_wr_mode;	// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_pipe_fifo_full_clear;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_pipe_fifo_full_clear_last_four;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_resv_pkt_match_lp_dt_en_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_resv_pkt_match_lp_dt_en_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_resv_pkt_match_lp_dt_en_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_resv_pkt_match_lp_dt_en_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_resv_pkt_match_lp_dt_en_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_resv_pkt_match_lp_dt_en_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_resv_pkt_match_lp_dt_en_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_resv_pkt_match_lp_dt_en_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe0;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe1;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe2;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe3;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe4;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe5;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe6;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		reg_resv_pkt_match_lp_dt_pipe7;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_sch0_frame_sync_auto_change_pipe_wr_mode;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_sch1_frame_sync_auto_change_pipe_wr_mode;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_sch2_frame_sync_auto_change_pipe_wr_mode;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_sch3_frame_sync_auto_change_pipe_wr_mode;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_sch_data_type_align_fail_int_mask0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_sch_data_type_align_fail_int_mask1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_sch_data_type_align_fail_int_mask2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_sch_data_type_align_fail_int_mask3;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_send_pkt_match_lp_dt_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [5:0]		reg_send_pkt_match_lp_dt_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [5:0]		reg_send_pkt_match_lp_dt_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [5:0]		reg_send_pkt_match_lp_dt_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_send_pkt_match_lp_dt_en_aggr0;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_send_pkt_match_lp_dt_en_aggr1;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_send_pkt_match_lp_dt_en_aggr2;// To u_as6d_app_aggregator of as6d_app_aggr.v
input			reg_send_pkt_match_lp_dt_en_aggr3;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [15:0]		reg_sync_aggr_check_framecount;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [15:0]		reg_sync_aggr_check_linecount;// To u_as6d_app_aggregator of as6d_app_aggr.v
input [7:0]		reg_sram_lcrc_err_oen;	// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_testbus_hi8bsel_8bmode;// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [5:0]		reg_testbus_sel_hi0;	// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [5:0]		reg_testbus_sel_hi1;	// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [5:0]		reg_testbus_sel_lo0;	// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [5:0]		reg_testbus_sel_lo1;	// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [3:0]		reg_testbus_sel_order0;	// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [3:0]		reg_testbus_sel_order1;	// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [15:0]		reg_testbus_sel_swap;	// To u_as6d_app_mon_top of as6d_app_mon_top.v
input [7:0]		reg_vc_selz_h_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_vc_selz_h_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_vc_selz_h_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_vc_selz_h_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_vc_selz_l_mep0;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_vc_selz_l_mep1;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_vc_selz_l_mep2;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input [7:0]		reg_vc_selz_l_mep3;	// To u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
input			reg_video_data_fwft_fifo_ovf_int_mask0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_data_fwft_fifo_ovf_int_mask1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_data_fwft_fifo_ovf_int_mask2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_data_fwft_fifo_ovf_int_mask3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_data_fwft_fifo_ovf_int_mask4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_data_fwft_fifo_ovf_int_mask5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_data_fwft_fifo_ovf_int_mask6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_data_fwft_fifo_ovf_int_mask7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_video_fifo_empty_depend_cnt_mux;// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input [7:0]		reg_video_pipe_en;	// To u_as6d_app_video_pipe of as6d_app_video_pipe.v
input			reg_vprbs_loopback_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_loopback_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_loopback_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_loopback_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_loopback_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_loopback_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_loopback_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_loopback_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_chk_en_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_err_clear_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_load_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_lock_continue_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_rx_mode_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_rx_order_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_err_inject_en_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_gen_en_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input [2:0]		reg_vprbs_tx_mode_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_order_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane0;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane1;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane2;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane3;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane4;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane5;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane6;// To u_as6d_app_sync of as6d_app_sync.v
input			reg_vprbs_tx_pat_reset_app_route_lane7;// To u_as6d_app_sync of as6d_app_sync.v
input			treed_reg_bank_clk;	// To u_as6d_app_sync of as6d_app_sync.v
input			treed_reg_bank_clk_reset_n;// To u_as6d_app_sync of as6d_app_sync.v
// End of automatics
input               mep_clk0                            ;
input               mep_clk1                            ;
input               mep_clk2                            ;
input               mep_clk3                            ;
input               mep_clk_rst_n0                      ;
input               mep_clk_rst_n1                      ;
input               mep_clk_rst_n2                      ;
input               mep_clk_rst_n3                      ;
input [1:0]         reg_pipe0_stream_sel                ;    
input [1:0]         reg_pipe1_stream_sel                ;    
input [1:0]         reg_pipe2_stream_sel                ;    
input [1:0]         reg_pipe3_stream_sel                ;    
input [1:0]         reg_pipe4_stream_sel                ;    
input [1:0]         reg_pipe5_stream_sel                ;    
input [1:0]         reg_pipe6_stream_sel                ;    
input [1:0]         reg_pipe7_stream_sel                ;    
input [15:0]        reg_app_sch0                        ;
input [15:0]        reg_app_sch1                        ;
input [15:0]        reg_app_sch2                        ;
input [15:0]        reg_app_sch3                        ;
input [16:0]        reg_time_window0                    ;    
input [16:0]        reg_time_window1                    ;    
input [16:0]        reg_time_window2                    ;    
input [16:0]        reg_time_window3                    ;    
input [16:0]        reg_time_window4                    ;    
input [16:0]        reg_time_window5                    ;    
input [16:0]        reg_time_window6                    ;    
input [16:0]        reg_time_window7                    ;    
input               reg_video_loss_en0                  ;    
input               reg_video_loss_en1                  ;    
input               reg_video_loss_en2                  ;    
input               reg_video_loss_en3                  ;    
input               reg_video_loss_en4                  ;    
input               reg_video_loss_en5                  ;    
input               reg_video_loss_en6                  ;    
input               reg_video_loss_en7                  ;    
input               reg_line_delay_en0                  ;    
input               reg_line_delay_en1                  ;    
input               reg_line_delay_en2                  ;    
input               reg_line_delay_en3                  ;    
input               reg_line_delay_en4                  ;    
input               reg_line_delay_en5                  ;    
input               reg_line_delay_en6                  ;    
input               reg_line_delay_en7                  ;    
input               reg_app_aggregation_bypass          ;
input               reg_sch0_fse_filter                 ;       
input               reg_sch1_fse_filter                 ;       
input               reg_sch2_fse_filter                 ;       
input               reg_sch3_fse_filter                 ;       

input  [1:0]        mep0_virtual_channel                ;
input  [1:0]        mep1_virtual_channel                ;
input  [1:0]        mep2_virtual_channel                ;
input  [1:0]        mep3_virtual_channel                ;
input  [1:0]        mep0_virtual_channel_x              ;
input  [1:0]        mep1_virtual_channel_x              ;
input  [1:0]        mep2_virtual_channel_x              ;
input  [1:0]        mep3_virtual_channel_x              ;

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [15:0]		PIN_DIG_TEST_BUS;	// From u_as6d_app_mon_top of as6d_app_mon_top.v
output [3:0]		aggr0_idi_byte_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] aggr0_idi_data;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr0_idi_data_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [20:0]		aggr0_idi_data_parity;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [5:0]		aggr0_idi_data_type;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr0_idi_header_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr0_idi_tunnel_mode_en;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [1:0]		aggr0_idi_virtual_channel;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] aggr0_idi_virtual_channel_x;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [15:0]		aggr0_idi_word_count;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [3:0]		aggr1_idi_byte_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] aggr1_idi_data;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr1_idi_data_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [20:0]		aggr1_idi_data_parity;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [5:0]		aggr1_idi_data_type;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr1_idi_header_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr1_idi_tunnel_mode_en;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [1:0]		aggr1_idi_virtual_channel;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] aggr1_idi_virtual_channel_x;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [15:0]		aggr1_idi_word_count;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [3:0]		aggr2_idi_byte_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] aggr2_idi_data;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr2_idi_data_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [20:0]		aggr2_idi_data_parity;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [5:0]		aggr2_idi_data_type;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr2_idi_header_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr2_idi_tunnel_mode_en;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [1:0]		aggr2_idi_virtual_channel;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] aggr2_idi_virtual_channel_x;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [15:0]		aggr2_idi_word_count;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [3:0]		aggr3_idi_byte_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_IDI_DATA_WIDTH-1:0] aggr3_idi_data;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr3_idi_data_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [20:0]		aggr3_idi_data_parity;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output [5:0]		aggr3_idi_data_type;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr3_idi_header_en;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			aggr3_idi_tunnel_mode_en;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [1:0]		aggr3_idi_virtual_channel;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [`CSI2_DEVICE_VCX_DWIDTH-1:0] aggr3_idi_virtual_channel_x;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [15:0]		aggr3_idi_word_count;	// From u_as6d_app_aggregator of as6d_app_aggr.v
output			app_aggr_idi_crc_err_int0;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			app_aggr_idi_crc_err_int1;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			app_aggr_idi_crc_err_int2;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			app_aggr_idi_crc_err_int3;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			app_async_rst_req;	// From u_as6d_app_sync of as6d_app_sync.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_async_fifo_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_app_full_cnt_sync_fifo_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [7:0]		reg_rd_dbg_pkt_num_nonzero_and_fifo_empty_threshold_err;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [7:0]		reg_rd_dbg_pkt_num_nonzero_threshold_err;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [15:0]		reg_rd_dig_test_bus;	// From u_as6d_app_mon_top of as6d_app_mon_top.v
output [7:0]		reg_rd_pipe_fifo_full;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_pf_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_lp_ph_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fe_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_fs_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_le_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_resv_pkt_cnt_sp_ls_pipe7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr0;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr1;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr2;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_lp_pf_aggr3;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr0;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr1;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr2;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_lp_ph_aggr3;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr0;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr1;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr2;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fe_aggr3;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr0;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr1;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr2;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_fs_aggr3;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr0;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr1;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr2;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_le_aggr3;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr0;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr1;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr2;// From u_as6d_app_aggregator of as6d_app_aggr.v
output [31:0]		reg_rd_send_pkt_cnt_sp_ls_aggr3;// From u_as6d_app_aggregator of as6d_app_aggr.v
output			reg_rd_vprbs_rx_check_app_route_lane0;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_check_app_route_lane1;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_check_app_route_lane2;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_check_app_route_lane3;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_check_app_route_lane4;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_check_app_route_lane5;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_check_app_route_lane6;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_check_app_route_lane7;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane0;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane1;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane2;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane3;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane4;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane5;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane6;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output [31:0]		reg_rd_vprbs_rx_err_app_route_lane7;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane0;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane1;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane2;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane3;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane4;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane5;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane6;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			reg_rd_vprbs_rx_fail_app_route_lane7;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
output			video_data_afifo_ecc_fault0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_afifo_ecc_fault1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_afifo_ecc_fault2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_afifo_ecc_fault3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_afifo_ecc_fault4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_afifo_ecc_fault5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_afifo_ecc_fault6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_afifo_ecc_fault7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_fwft_fifo_ecc_fault7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
// End of automatics

output    [1:0]     to_clkgen_fifo_wrclk_sel0        ;
output    [1:0]     to_clkgen_fifo_wrclk_sel1        ;
output    [1:0]     to_clkgen_fifo_wrclk_sel2        ;
output    [1:0]     to_clkgen_fifo_wrclk_sel3        ;
output    [1:0]     to_clkgen_fifo_wrclk_sel4        ;
output    [1:0]     to_clkgen_fifo_wrclk_sel5        ;
output    [1:0]     to_clkgen_fifo_wrclk_sel6        ;
output    [1:0]     to_clkgen_fifo_wrclk_sel7        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel0        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel1        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel2        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel3        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel4        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel5        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel6        ;
output    [1:0]     to_clkgen_fifo_rdclk_sel7        ;
output              reg_rd_video_lock0               ;
output              reg_rd_video_lock1               ;
output              reg_rd_video_lock2               ;
output              reg_rd_video_lock3               ;
output              reg_rd_video_lock4               ;
output              reg_rd_video_lock5               ;
output              reg_rd_video_lock6               ;
output              reg_rd_video_lock7               ;
output              reg_rd_video_loss0               ;
output              reg_rd_video_loss1               ;
output              reg_rd_video_loss2               ;
output              reg_rd_video_loss3               ;
output              reg_rd_video_loss4               ;
output              reg_rd_video_loss5               ;
output              reg_rd_video_loss6               ;
output              reg_rd_video_loss7               ;
output              video_loss0                      ;
output              video_loss1                      ;
output              video_loss2                      ;
output              video_loss3                      ;
output              video_loss4                      ;
output              video_loss5                      ;
output              video_loss6                      ;
output              video_loss7                      ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs0          ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs1          ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs2          ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs3          ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs4          ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs5          ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs6          ;
output  [2:0]       reg_rd_fifo_rd_ctrl_cs7          ;
output              reg_rd_fs_detect_pipe0           ;
output              reg_rd_fs_detect_pipe1           ;
output              reg_rd_fs_detect_pipe2           ;
output              reg_rd_fs_detect_pipe3           ;
output              reg_rd_fs_detect_pipe4           ;
output              reg_rd_fs_detect_pipe5           ;
output              reg_rd_fs_detect_pipe6           ;
output              reg_rd_fs_detect_pipe7           ;
output  [15:0]      reg_rd_fs_cnt_pipe0              ;
output  [15:0]      reg_rd_fs_cnt_pipe1              ;
output  [15:0]      reg_rd_fs_cnt_pipe2              ;
output  [15:0]      reg_rd_fs_cnt_pipe3              ;
output  [15:0]      reg_rd_fs_cnt_pipe4              ;
output  [15:0]      reg_rd_fs_cnt_pipe5              ;
output  [15:0]      reg_rd_fs_cnt_pipe6              ;
output  [15:0]      reg_rd_fs_cnt_pipe7              ;
output  [3:0]       reg_rd_cnt_line_end_rd_side0     ;
output  [3:0]       reg_rd_cnt_line_end_rd_side1     ;
output  [3:0]       reg_rd_cnt_line_end_rd_side2     ;
output  [3:0]       reg_rd_cnt_line_end_rd_side3     ;
output  [3:0]       reg_rd_cnt_line_end_rd_side4     ;
output  [3:0]       reg_rd_cnt_line_end_rd_side5     ;
output  [3:0]       reg_rd_cnt_line_end_rd_side6     ;
output  [3:0]       reg_rd_cnt_line_end_rd_side7     ;
output  [3:0]       reg_rd_sch0_cs                   ;
output  [3:0]       reg_rd_sch1_cs                   ;
output  [3:0]       reg_rd_sch2_cs                   ;
output  [3:0]       reg_rd_sch3_cs                   ;
output              reg_rd_sch2post_video_data_vld0  ;
output              reg_rd_sch2post_video_data_vld1  ;
output              reg_rd_sch2post_video_data_vld2  ;
output              reg_rd_sch2post_video_data_vld3  ;
output              reg_rd_pipe2sch_video_data_vld0  ;
output              reg_rd_pipe2sch_video_data_vld1  ;
output              reg_rd_pipe2sch_video_data_vld2  ;
output              reg_rd_pipe2sch_video_data_vld3  ;
output              reg_rd_pipe2sch_video_data_vld4  ;
output              reg_rd_pipe2sch_video_data_vld5  ;
output              reg_rd_pipe2sch_video_data_vld6  ;
output              reg_rd_pipe2sch_video_data_vld7  ;
output [31:0]       reg_rd_pipe0_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]       reg_rd_pipe1_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]       reg_rd_pipe2_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]       reg_rd_pipe3_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]       reg_rd_pipe4_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]       reg_rd_pipe5_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]       reg_rd_pipe6_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output [31:0]       reg_rd_pipe7_dispatched_cnt_ready_for_sch;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v

output              video_data_afifo_mem_double_err0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_double_err1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_double_err2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_double_err3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_double_err4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_double_err5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_double_err6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_double_err7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_mem_single_err7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_afifo_ovf_int7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v

output              video_data_fwft_fifo_mem_double_err0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_double_err1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_double_err2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_double_err3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_double_err4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_double_err5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_double_err6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_double_err7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_mem_single_err7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
output              video_data_fwft_fifo_ovf_int7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v

output              lcrc_err0;
output              lcrc_err1;
output              lcrc_err2;
output              lcrc_err3;
output              lcrc_err4;
output              lcrc_err5;
output              lcrc_err6;
output              lcrc_err7;

output              vprbs_rx_fail_app_route_int0;
output              vprbs_rx_fail_app_route_int1;
output              vprbs_rx_fail_app_route_int2;
output              vprbs_rx_fail_app_route_int3;
output              vprbs_rx_fail_app_route_int4;
output              vprbs_rx_fail_app_route_int5;
output              vprbs_rx_fail_app_route_int6;
output              vprbs_rx_fail_app_route_int7;
output              sch_data_type_align_fail_int0;
output              sch_data_type_align_fail_int1;
output              sch_data_type_align_fail_int2;
output              sch_data_type_align_fail_int3;
localparam VIDEO_DATA_SIZE = 140;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			ack0;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack1;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack2;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack3;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack4;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack5;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack6;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack7;			// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre0;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre1;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre2;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre3;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre4;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre5;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre6;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_pre7;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe0_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe0_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe0_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe0_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe1_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe1_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe1_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe1_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe2_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe2_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe2_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe2_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe3_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe3_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe3_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe3_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe4_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe4_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe4_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe4_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe5_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe5_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe5_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe5_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe6_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe6_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe6_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe6_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe7_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe7_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe7_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			ack_vld_pipe7_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe0_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe0_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe0_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe0_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe1_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe1_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe1_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe1_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe2_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe2_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe2_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe2_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe3_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe3_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe3_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe3_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe4_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe4_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe4_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe4_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe5_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe5_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe5_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe5_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe6_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe6_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe6_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe6_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe7_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe7_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe7_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			empty_vld_pipe7_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs0;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs1;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs2;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs3;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs4;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs5;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs6;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		fifo_rd_ctrl_cs7;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe0;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe1;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe2;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe3;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe4;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe5;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe6;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			fs_detect_pipe7;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [2:0]		gencrc2pktfilter0_byte_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [63:0]		gencrc2pktfilter0_csi_data;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter0_data_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [5:0]		gencrc2pktfilter0_data_type;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter0_header_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [31:0]		gencrc2pktfilter0_pkt_crc;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter0_pkt_crc_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter0_tunnel_mode_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [3:0]		gencrc2pktfilter0_virtual_channel;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [15:0]		gencrc2pktfilter0_word_count;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [2:0]		gencrc2pktfilter1_byte_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [63:0]		gencrc2pktfilter1_csi_data;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter1_data_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [5:0]		gencrc2pktfilter1_data_type;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter1_header_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [31:0]		gencrc2pktfilter1_pkt_crc;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter1_pkt_crc_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter1_tunnel_mode_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [3:0]		gencrc2pktfilter1_virtual_channel;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [15:0]		gencrc2pktfilter1_word_count;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [2:0]		gencrc2pktfilter2_byte_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [63:0]		gencrc2pktfilter2_csi_data;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter2_data_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [5:0]		gencrc2pktfilter2_data_type;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter2_header_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [31:0]		gencrc2pktfilter2_pkt_crc;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter2_pkt_crc_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter2_tunnel_mode_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [3:0]		gencrc2pktfilter2_virtual_channel;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [15:0]		gencrc2pktfilter2_word_count;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [2:0]		gencrc2pktfilter3_byte_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [63:0]		gencrc2pktfilter3_csi_data;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter3_data_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [5:0]		gencrc2pktfilter3_data_type;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter3_header_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [31:0]		gencrc2pktfilter3_pkt_crc;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter3_pkt_crc_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			gencrc2pktfilter3_tunnel_mode_en;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [3:0]		gencrc2pktfilter3_virtual_channel;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire [15:0]		gencrc2pktfilter3_word_count;// From u_as6d_app_crc_gen of as6d_app_crc_gen.v
wire			line_end0;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end1;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end2;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end3;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end4;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end5;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end6;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end7;		// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe0_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe0_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe0_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe0_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe1_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe1_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe1_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe1_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe2_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe2_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe2_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe2_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe3_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe3_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe3_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe3_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe4_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe4_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe4_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe4_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe5_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe5_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe5_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe5_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe6_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe6_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe6_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe6_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe7_aggregator0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe7_aggregator1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe7_aggregator2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			line_end_vld_pipe7_aggregator3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [3:0]		pipe0_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe0_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe0_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe0_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe0_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe0_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe0_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe0_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe0_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe0_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe0_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe0_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		pipe1_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe1_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe1_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe1_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe1_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe1_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe1_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe1_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe1_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe1_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe1_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe1_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		pipe2_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe2_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe2_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe2_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe2_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe2_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe2_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe2_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe2_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe2_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe2_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe2_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(VIDEO_DATA_SIZE-1):0] pipe2sch_video_data7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2sch_video_data_vld7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [3:0]		pipe3_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe3_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe3_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe3_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe3_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe3_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe3_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe3_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe3_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe3_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe3_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe3_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		pipe4_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe4_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe4_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe4_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe4_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe4_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe4_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe4_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe4_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe4_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe4_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe4_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		pipe5_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe5_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe5_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe5_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe5_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe5_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe5_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe5_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe5_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe5_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe5_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe5_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		pipe6_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe6_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe6_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe6_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe6_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe6_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe6_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe6_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe6_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe6_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe6_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe6_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		pipe7_aggr_id;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe7_byte_en;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe7_csi_data;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe7_data_en;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [5:0]		pipe7_data_type;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe7_header_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [31:0]		pipe7_pkt_crc;		// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire			pipe7_pkt_crc_en;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe7_virtual_channel;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0] pipe7_virtual_channel_x;// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [15:0]		pipe7_word_count;	// From u_as6d_app_pipe_route of as6d_app_pipe_route.v
wire [1:0]		pipe7_wr_mode;		// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		pipe_fifo_full_clear;	// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		pkt_filter_out_mep0_byte_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [63:0]		pkt_filter_out_mep0_csi_data;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep0_data_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [5:0]		pkt_filter_out_mep0_data_type;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep0_header_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [31:0]		pkt_filter_out_mep0_pkt_crc;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep0_pkt_crc_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep0_tunnel_mode_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [3:0]		pkt_filter_out_mep0_virtual_channel;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [15:0]		pkt_filter_out_mep0_word_count;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [2:0]		pkt_filter_out_mep1_byte_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [63:0]		pkt_filter_out_mep1_csi_data;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep1_data_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [5:0]		pkt_filter_out_mep1_data_type;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep1_header_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [31:0]		pkt_filter_out_mep1_pkt_crc;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep1_pkt_crc_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep1_tunnel_mode_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [3:0]		pkt_filter_out_mep1_virtual_channel;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [15:0]		pkt_filter_out_mep1_word_count;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [2:0]		pkt_filter_out_mep2_byte_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [63:0]		pkt_filter_out_mep2_csi_data;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep2_data_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [5:0]		pkt_filter_out_mep2_data_type;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep2_header_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [31:0]		pkt_filter_out_mep2_pkt_crc;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep2_pkt_crc_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep2_tunnel_mode_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [3:0]		pkt_filter_out_mep2_virtual_channel;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [15:0]		pkt_filter_out_mep2_word_count;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [2:0]		pkt_filter_out_mep3_byte_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [63:0]		pkt_filter_out_mep3_csi_data;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep3_data_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [5:0]		pkt_filter_out_mep3_data_type;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep3_header_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [31:0]		pkt_filter_out_mep3_pkt_crc;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep3_pkt_crc_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			pkt_filter_out_mep3_tunnel_mode_en;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [3:0]		pkt_filter_out_mep3_virtual_channel;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire [15:0]		pkt_filter_out_mep3_word_count;// From u_as6d_app_pkt_filter of as6d_app_pkt_filter.v
wire			reg_vprbs_loopback_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_loopback_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_loopback_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_loopback_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_loopback_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_loopback_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_loopback_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_loopback_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_chk_en_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_err_clear_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_load_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_lock_continue_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_locked_match_cnt_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_rx_mode_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_rx_order_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_rx_uncheck_tolerance_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_err_inject_en_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_num_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		reg_vprbs_tx_err_inject_intv_time_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_gen_en_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [5:0]		reg_vprbs_tx_idi_driver_data_type_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_total_interval_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [3:0]		reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [15:0]		reg_vprbs_tx_idi_driver_word_count_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [2:0]		reg_vprbs_tx_mode_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_order_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane0_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane1_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane2_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane3_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane4_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane5_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane6_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire			reg_vprbs_tx_pat_reset_app_route_lane7_sync;// From u_as6d_app_sync of as6d_app_sync.v
wire [7:0]		sch0_ack_aggre;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch0_ack_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch0_aggre_busy;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch0_cs;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch0_line_end_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch0_line_end_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch0_up_state_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch0_up_state_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch1_ack_aggre;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch1_ack_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch1_aggre_busy;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch1_cs;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch1_line_end_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch1_line_end_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch1_up_state_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch1_up_state_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch2_ack_aggre;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch2_ack_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch2_aggre_busy;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch2_cs;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch2_line_end_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch2_line_end_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch2_up_state_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch2_up_state_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch2post_video_data_vld0;// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch2post_video_data_vld1;// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch2post_video_data_vld2;// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch2post_video_data_vld3;// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch3_ack_aggre;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch3_ack_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			sch3_aggre_busy;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch3_cs;		// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch3_line_end_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch3_line_end_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [7:0]		sch3_up_state_aggre;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [3:0]		sch3_up_state_concat;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe0;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe1;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe2;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe3;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe4;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe5;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe6;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire			up_state_video_pipe7;	// From u_as6d_app_aggregator of as6d_app_aggr.v
wire [2:0]		validity2gencrc0_byte_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [63:0]		validity2gencrc0_csi_data;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc0_data_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [5:0]		validity2gencrc0_data_type;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc0_header_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc0_tunnel_mode_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [3:0]		validity2gencrc0_virtual_channel;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [15:0]		validity2gencrc0_word_count;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [2:0]		validity2gencrc1_byte_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [63:0]		validity2gencrc1_csi_data;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc1_data_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [5:0]		validity2gencrc1_data_type;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc1_header_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc1_tunnel_mode_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [3:0]		validity2gencrc1_virtual_channel;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [15:0]		validity2gencrc1_word_count;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [2:0]		validity2gencrc2_byte_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [63:0]		validity2gencrc2_csi_data;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc2_data_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [5:0]		validity2gencrc2_data_type;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc2_header_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc2_tunnel_mode_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [3:0]		validity2gencrc2_virtual_channel;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [15:0]		validity2gencrc2_word_count;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [2:0]		validity2gencrc3_byte_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [63:0]		validity2gencrc3_csi_data;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc3_data_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [5:0]		validity2gencrc3_data_type;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc3_header_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			validity2gencrc3_tunnel_mode_en;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [3:0]		validity2gencrc3_virtual_channel;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire [15:0]		validity2gencrc3_word_count;// From u_as6d_app_idi_validity_check of as6d_app_idi_validity_check.v
wire			video_data_afifo_empty0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_empty1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_empty2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_empty3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_empty4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_empty5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_empty6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_empty7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full0;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full1;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full2;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full3;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full4;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full5;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full6;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_full7;	// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_empty7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_prog_full7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_afifo_udf_int7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_empty7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_full7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_prog_full7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int4;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int5;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int6;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_data_fwft_fifo_udf_int7;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [139:0]		video_pipe0_data_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe0_vld_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [139:0]		video_pipe1_data_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe1_vld_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [139:0]		video_pipe2_data_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe2_vld_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [139:0]		video_pipe3_data_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe3_vld_aggre_bypass;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		video_pipe_date_type_for_concat_align0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		video_pipe_date_type_for_concat_align1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		video_pipe_date_type_for_concat_align2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		video_pipe_date_type_for_concat_align3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe_date_type_for_concat_align_vld0;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe_date_type_for_concat_align_vld1;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe_date_type_for_concat_align_vld2;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			video_pipe_date_type_for_concat_align_vld3;// From u_as6d_app_video_pipe of as6d_app_video_pipe.v
// End of automatics
// beginning of automatic wires (for undeclared instantiated-module outputs)

wire [3:0]      mep0_virtual_channel_4b                         ;
wire [3:0]      mep1_virtual_channel_4b                         ;
wire [3:0]      mep2_virtual_channel_4b                         ;
wire [3:0]      mep3_virtual_channel_4b                         ;
wire [15:0]     fs_cnt_pipe0                                    ;
wire [15:0]     fs_cnt_pipe1                                    ;
wire [15:0]     fs_cnt_pipe2                                    ;
wire [15:0]     fs_cnt_pipe3                                    ;
wire [15:0]     fs_cnt_pipe4                                    ;
wire [15:0]     fs_cnt_pipe5                                    ;
wire [15:0]     fs_cnt_pipe6                                    ;
wire [15:0]     fs_cnt_pipe7                                    ;
wire [3:0]      pkt_filter_in_mep0_virtual_channel              ;
wire [3:0]      pkt_filter_in_mep1_virtual_channel              ;
wire [3:0]      pkt_filter_in_mep2_virtual_channel              ;
wire [3:0]      pkt_filter_in_mep3_virtual_channel              ;
wire            video_lock0                                     ;   
wire [1:0]      pipe0_stream_sel                                ; 
wire [16:0]     time_window0                                    ; 
wire            video_loss_en0                                  ; 
wire            line_delay_en0                                  ;     
wire            sch0_pipe0_aggre_en                             ;
wire            sch1_pipe0_aggre_en                             ;
wire            sch2_pipe0_aggre_en                             ;
wire            sch3_pipe0_aggre_en                             ;
wire            video_lock1                                     ;   
wire [1:0]      pipe1_stream_sel                                ; 
wire [16:0]     time_window1                                    ; 
wire            video_loss_en1                                  ; 
wire            line_delay_en1                                  ;     
wire            sch0_pipe1_aggre_en                             ;
wire            sch1_pipe1_aggre_en                             ;
wire            sch2_pipe1_aggre_en                             ;
wire            sch3_pipe1_aggre_en                             ;
wire            video_lock2                                     ;   
wire [1:0]      pipe2_stream_sel                                ; 
wire [16:0]     time_window2                                    ; 
wire            video_loss_en2                                  ; 
wire            line_delay_en2                                  ;     
wire            sch0_pipe2_aggre_en                             ;
wire            sch1_pipe2_aggre_en                             ;
wire            sch2_pipe2_aggre_en                             ;
wire            sch3_pipe2_aggre_en                             ;
wire            video_lock3                                     ;   
wire [1:0]      pipe3_stream_sel                                ; 
wire [16:0]     time_window3                                    ; 
wire            video_loss_en3                                  ; 
wire            line_delay_en3                                  ;     
wire            sch0_pipe3_aggre_en                             ;
wire            sch1_pipe3_aggre_en                             ;
wire            sch2_pipe3_aggre_en                             ;
wire            sch3_pipe3_aggre_en                             ;
wire            video_lock4                                     ;   
wire [1:0]      pipe4_stream_sel                                ; 
wire [16:0]     time_window4                                    ; 
wire            video_loss_en4                                  ; 
wire            line_delay_en4                                  ;     
wire            sch0_pipe4_aggre_en                             ;
wire            sch1_pipe4_aggre_en                             ;
wire            sch2_pipe4_aggre_en                             ;
wire            sch3_pipe4_aggre_en                             ;
wire            video_lock5                                     ;   
wire [1:0]      pipe5_stream_sel                                ; 
wire [16:0]     time_window5                                    ; 
wire            video_loss_en5                                  ; 
wire            line_delay_en5                                  ;     
wire            sch0_pipe5_aggre_en                             ;
wire            sch1_pipe5_aggre_en                             ;
wire            sch2_pipe5_aggre_en                             ;
wire            sch3_pipe5_aggre_en                             ;
wire            video_lock6                                     ;   
wire [1:0]      pipe6_stream_sel                                ; 
wire [16:0]     time_window6                                    ; 
wire            video_loss_en6                                  ; 
wire            line_delay_en6                                  ;     
wire            sch0_pipe6_aggre_en                             ;
wire            sch1_pipe6_aggre_en                             ;
wire            sch2_pipe6_aggre_en                             ;
wire            sch3_pipe6_aggre_en                             ;
wire            video_lock7                                     ;   
wire [1:0]      pipe7_stream_sel                                ; 
wire [16:0]     time_window7                                    ; 
wire            video_loss_en7                                  ; 
wire            line_delay_en7                                  ;     
wire            sch0_pipe7_aggre_en                             ;
wire            sch1_pipe7_aggre_en                             ;
wire            sch2_pipe7_aggre_en                             ;
wire            sch3_pipe7_aggre_en                             ;

wire            sch0_pipe0_concat_en                            ;
wire            sch1_pipe0_concat_en                            ;
wire            sch2_pipe0_concat_en                            ;
wire            sch3_pipe0_concat_en                            ;
wire            sch0_pipe1_concat_en                            ;
wire            sch1_pipe1_concat_en                            ;
wire            sch2_pipe1_concat_en                            ;
wire            sch3_pipe1_concat_en                            ;
wire            sch0_pipe2_concat_en                            ;
wire            sch1_pipe2_concat_en                            ;
wire            sch2_pipe2_concat_en                            ;
wire            sch3_pipe2_concat_en                            ;
wire            sch0_pipe3_concat_en                            ;
wire            sch1_pipe3_concat_en                            ;
wire            sch2_pipe3_concat_en                            ;
wire            sch3_pipe3_concat_en                            ;
wire            app_aggregation_bypass                          ;
wire [1:0]      sch0_aggre_mode                                 ;
wire [1:0]      sch1_aggre_mode                                 ;
wire [1:0]      sch2_aggre_mode                                 ;
wire [1:0]      sch3_aggre_mode                                 ;
wire [1:0]      sch0_master_pipe                                ;
wire [1:0]      sch1_master_pipe                                ;
wire [1:0]      sch2_master_pipe                                ;
wire [1:0]      sch3_master_pipe                                ;
wire            sch0_frame_sync_lock                            ;
wire            sch1_frame_sync_lock                            ;
wire            sch2_frame_sync_lock                            ;
wire            sch3_frame_sync_lock                            ;

assign    app_aggregation_bypass          = reg_app_aggregation_bypass ;
assign    sch0_pipe7_aggre_en             = reg_app_sch0[15   ]        ;
assign    sch0_pipe6_aggre_en             = reg_app_sch0[14   ]        ;
assign    sch0_pipe5_aggre_en             = reg_app_sch0[13   ]        ;
assign    sch0_pipe4_aggre_en             = reg_app_sch0[12   ]        ;
assign    sch0_aggre_mode                 = reg_app_sch0[11:10]        ;
assign    sch0_master_pipe                = reg_app_sch0[ 9: 8]        ;
assign    sch0_pipe3_concat_en            = reg_app_sch0[7    ]        ;
assign    sch0_pipe2_concat_en            = reg_app_sch0[6    ]        ;
assign    sch0_pipe1_concat_en            = reg_app_sch0[5    ]        ;
assign    sch0_pipe0_concat_en            = reg_app_sch0[4    ]        ;
assign    sch0_pipe3_aggre_en             = reg_app_sch0[3    ]        ;
assign    sch0_pipe2_aggre_en             = reg_app_sch0[2    ]        ;
assign    sch0_pipe1_aggre_en             = reg_app_sch0[1    ]        ;
assign    sch0_pipe0_aggre_en             = reg_app_sch0[0    ]        ;

assign    sch1_pipe7_aggre_en             = reg_app_sch1[15   ]        ;
assign    sch1_pipe6_aggre_en             = reg_app_sch1[14   ]        ;
assign    sch1_pipe5_aggre_en             = reg_app_sch1[13   ]        ;
assign    sch1_pipe4_aggre_en             = reg_app_sch1[12   ]        ;
assign    sch1_aggre_mode                 = reg_app_sch1[11:10]        ;
assign    sch1_master_pipe                = reg_app_sch1[ 9: 8]        ;
assign    sch1_pipe3_concat_en            = reg_app_sch1[7    ]        ;
assign    sch1_pipe2_concat_en            = reg_app_sch1[6    ]        ;
assign    sch1_pipe1_concat_en            = reg_app_sch1[5    ]        ;
assign    sch1_pipe0_concat_en            = reg_app_sch1[4    ]        ;
assign    sch1_pipe3_aggre_en             = reg_app_sch1[3    ]        ;
assign    sch1_pipe2_aggre_en             = reg_app_sch1[2    ]        ;
assign    sch1_pipe1_aggre_en             = reg_app_sch1[1    ]        ;
assign    sch1_pipe0_aggre_en             = reg_app_sch1[0    ]        ;

assign    sch2_pipe7_aggre_en             = reg_app_sch2[15   ]        ;
assign    sch2_pipe6_aggre_en             = reg_app_sch2[14   ]        ;
assign    sch2_pipe5_aggre_en             = reg_app_sch2[13   ]        ;
assign    sch2_pipe4_aggre_en             = reg_app_sch2[12   ]        ;
assign    sch2_aggre_mode                 = reg_app_sch2[11:10]        ;
assign    sch2_master_pipe                = reg_app_sch2[ 9: 8]        ;
assign    sch2_pipe3_concat_en            = reg_app_sch2[7    ]        ;
assign    sch2_pipe2_concat_en            = reg_app_sch2[6    ]        ;
assign    sch2_pipe1_concat_en            = reg_app_sch2[5    ]        ;
assign    sch2_pipe0_concat_en            = reg_app_sch2[4    ]        ;
assign    sch2_pipe3_aggre_en             = reg_app_sch2[3    ]        ;
assign    sch2_pipe2_aggre_en             = reg_app_sch2[2    ]        ;
assign    sch2_pipe1_aggre_en             = reg_app_sch2[1    ]        ;
assign    sch2_pipe0_aggre_en             = reg_app_sch2[0    ]        ;

assign    sch3_pipe7_aggre_en             = reg_app_sch3[15   ]        ;
assign    sch3_pipe6_aggre_en             = reg_app_sch3[14   ]        ;
assign    sch3_pipe5_aggre_en             = reg_app_sch3[13   ]        ;
assign    sch3_pipe4_aggre_en             = reg_app_sch3[12   ]        ;
assign    sch3_aggre_mode                 = reg_app_sch3[11:10]        ;
assign    sch3_master_pipe                = reg_app_sch3[ 9: 8]        ;
assign    sch3_pipe3_concat_en            = reg_app_sch3[7    ]        ;
assign    sch3_pipe2_concat_en            = reg_app_sch3[6    ]        ;
assign    sch3_pipe1_concat_en            = reg_app_sch3[5    ]        ;
assign    sch3_pipe0_concat_en            = reg_app_sch3[4    ]        ;
assign    sch3_pipe3_aggre_en             = reg_app_sch3[3    ]        ;
assign    sch3_pipe2_aggre_en             = reg_app_sch3[2    ]        ;
assign    sch3_pipe1_aggre_en             = reg_app_sch3[1    ]        ;
assign    sch3_pipe0_aggre_en             = reg_app_sch3[0    ]        ;

assign    time_window0                    = reg_time_window0           ;    
assign    time_window1                    = reg_time_window1           ;    
assign    time_window2                    = reg_time_window2           ;    
assign    time_window3                    = reg_time_window3           ;    
assign    time_window4                    = reg_time_window4           ;    
assign    time_window5                    = reg_time_window5           ;    
assign    time_window6                    = reg_time_window6           ;    
assign    time_window7                    = reg_time_window7           ;    
assign    video_loss_en0                  = reg_video_loss_en0         ;    
assign    video_loss_en1                  = reg_video_loss_en1         ;    
assign    video_loss_en2                  = reg_video_loss_en2         ;    
assign    video_loss_en3                  = reg_video_loss_en3         ;    
assign    video_loss_en4                  = reg_video_loss_en4         ;    
assign    video_loss_en5                  = reg_video_loss_en5         ;    
assign    video_loss_en6                  = reg_video_loss_en6         ;    
assign    video_loss_en7                  = reg_video_loss_en7         ;    
assign    line_delay_en0                  = reg_line_delay_en0         ;    
assign    line_delay_en1                  = reg_line_delay_en1         ;    
assign    line_delay_en2                  = reg_line_delay_en2         ;    
assign    line_delay_en3                  = reg_line_delay_en3         ;    
assign    line_delay_en4                  = reg_line_delay_en4         ;    
assign    line_delay_en5                  = reg_line_delay_en5         ;    
assign    line_delay_en6                  = reg_line_delay_en6         ;    
assign    line_delay_en7                  = reg_line_delay_en7         ;    
assign    reg_rd_video_lock0              = video_lock0                ;
assign    reg_rd_video_lock1              = video_lock1                ;
assign    reg_rd_video_lock2              = video_lock2                ;
assign    reg_rd_video_lock3              = video_lock3                ;
assign    reg_rd_video_lock4              = video_lock4                ;
assign    reg_rd_video_lock5              = video_lock5                ;
assign    reg_rd_video_lock6              = video_lock6                ;
assign    reg_rd_video_lock7              = video_lock7                ;
assign    reg_rd_video_loss0              = video_loss0                ;
assign    reg_rd_video_loss1              = video_loss1                ;
assign    reg_rd_video_loss2              = video_loss2                ;
assign    reg_rd_video_loss3              = video_loss3                ;
assign    reg_rd_video_loss4              = video_loss4                ;
assign    reg_rd_video_loss5              = video_loss5                ;
assign    reg_rd_video_loss6              = video_loss6                ;
assign    reg_rd_video_loss7              = video_loss7                ;
assign    reg_rd_fifo_rd_ctrl_cs0         = fifo_rd_ctrl_cs0           ;
assign    reg_rd_fifo_rd_ctrl_cs1         = fifo_rd_ctrl_cs1           ;
assign    reg_rd_fifo_rd_ctrl_cs2         = fifo_rd_ctrl_cs2           ;
assign    reg_rd_fifo_rd_ctrl_cs3         = fifo_rd_ctrl_cs3           ;
assign    reg_rd_fifo_rd_ctrl_cs4         = fifo_rd_ctrl_cs4           ;
assign    reg_rd_fifo_rd_ctrl_cs5         = fifo_rd_ctrl_cs5           ;
assign    reg_rd_fifo_rd_ctrl_cs6         = fifo_rd_ctrl_cs6           ;
assign    reg_rd_fifo_rd_ctrl_cs7         = fifo_rd_ctrl_cs7           ;
assign    reg_rd_fs_detect_pipe0          = fs_detect_pipe0            ;
assign    reg_rd_fs_detect_pipe1          = fs_detect_pipe1            ;
assign    reg_rd_fs_detect_pipe2          = fs_detect_pipe2            ;
assign    reg_rd_fs_detect_pipe3          = fs_detect_pipe3            ;
assign    reg_rd_fs_detect_pipe4          = fs_detect_pipe4            ;
assign    reg_rd_fs_detect_pipe5          = fs_detect_pipe5            ;
assign    reg_rd_fs_detect_pipe6          = fs_detect_pipe6            ;
assign    reg_rd_fs_detect_pipe7          = fs_detect_pipe7            ;
assign    reg_rd_fs_cnt_pipe0             = fs_cnt_pipe0               ;
assign    reg_rd_fs_cnt_pipe1             = fs_cnt_pipe1               ;
assign    reg_rd_fs_cnt_pipe2             = fs_cnt_pipe2               ;
assign    reg_rd_fs_cnt_pipe3             = fs_cnt_pipe3               ;
assign    reg_rd_fs_cnt_pipe4             = fs_cnt_pipe4               ;
assign    reg_rd_fs_cnt_pipe5             = fs_cnt_pipe5               ;
assign    reg_rd_fs_cnt_pipe6             = fs_cnt_pipe6               ;
assign    reg_rd_fs_cnt_pipe7             = fs_cnt_pipe7               ;
assign    reg_rd_cnt_line_end_rd_side0    = 4'd0                       ;
assign    reg_rd_cnt_line_end_rd_side1    = 4'd0                       ;
assign    reg_rd_cnt_line_end_rd_side2    = 4'd0                       ;
assign    reg_rd_cnt_line_end_rd_side3    = 4'd0                       ;
assign    reg_rd_cnt_line_end_rd_side4    = 4'd0                       ;
assign    reg_rd_cnt_line_end_rd_side5    = 4'd0                       ;
assign    reg_rd_cnt_line_end_rd_side6    = 4'd0                       ;
assign    reg_rd_cnt_line_end_rd_side7    = 4'd0                       ;
assign    reg_rd_sch0_cs                  = sch0_cs                    ;
assign    reg_rd_sch1_cs                  = sch1_cs                    ;
assign    reg_rd_sch2_cs                  = sch2_cs                    ;
assign    reg_rd_sch3_cs                  = sch3_cs                    ;
assign    reg_rd_sch2post_video_data_vld0 = sch2post_video_data_vld0   ;
assign    reg_rd_sch2post_video_data_vld1 = sch2post_video_data_vld1   ;
assign    reg_rd_sch2post_video_data_vld2 = sch2post_video_data_vld2   ;
assign    reg_rd_sch2post_video_data_vld3 = sch2post_video_data_vld3   ;
assign    reg_rd_pipe2sch_video_data_vld0 = pipe2sch_video_data_vld0   ;
assign    reg_rd_pipe2sch_video_data_vld1 = pipe2sch_video_data_vld1   ;
assign    reg_rd_pipe2sch_video_data_vld2 = pipe2sch_video_data_vld2   ;
assign    reg_rd_pipe2sch_video_data_vld3 = pipe2sch_video_data_vld3   ;
assign    reg_rd_pipe2sch_video_data_vld4 = pipe2sch_video_data_vld4   ;
assign    reg_rd_pipe2sch_video_data_vld5 = pipe2sch_video_data_vld5   ;
assign    reg_rd_pipe2sch_video_data_vld6 = pipe2sch_video_data_vld6   ;
assign    reg_rd_pipe2sch_video_data_vld7 = pipe2sch_video_data_vld7   ;

assign    vprbs_rx_fail_app_route_int0    = reg_rd_vprbs_rx_fail_app_route_lane0;
assign    vprbs_rx_fail_app_route_int1    = reg_rd_vprbs_rx_fail_app_route_lane1;
assign    vprbs_rx_fail_app_route_int2    = reg_rd_vprbs_rx_fail_app_route_lane2;
assign    vprbs_rx_fail_app_route_int3    = reg_rd_vprbs_rx_fail_app_route_lane3;
assign    vprbs_rx_fail_app_route_int4    = reg_rd_vprbs_rx_fail_app_route_lane4;
assign    vprbs_rx_fail_app_route_int5    = reg_rd_vprbs_rx_fail_app_route_lane5;
assign    vprbs_rx_fail_app_route_int6    = reg_rd_vprbs_rx_fail_app_route_lane6;
assign    vprbs_rx_fail_app_route_int7    = reg_rd_vprbs_rx_fail_app_route_lane7;

/*as6d_app_sync AUTO_TEMPLATE(
    .reg_sch\(.*\)_frame_sync_lock_force(reg_app_sch\1_frame_sync_lock_force),
    .reg_sch\(.*\)_frame_sync_lock(reg_app_sch\1_frame_sync_lock),
    .\(.*\) (\1[]),
)*/
as6d_app_sync u_as6d_app_sync(/*AUTOINST*/
			      // Outputs
			      .pipe0_wr_mode	(pipe0_wr_mode[1:0]), // Templated
			      .pipe1_wr_mode	(pipe1_wr_mode[1:0]), // Templated
			      .pipe2_wr_mode	(pipe2_wr_mode[1:0]), // Templated
			      .pipe3_wr_mode	(pipe3_wr_mode[1:0]), // Templated
			      .pipe4_wr_mode	(pipe4_wr_mode[1:0]), // Templated
			      .pipe5_wr_mode	(pipe5_wr_mode[1:0]), // Templated
			      .pipe6_wr_mode	(pipe6_wr_mode[1:0]), // Templated
			      .pipe7_wr_mode	(pipe7_wr_mode[1:0]), // Templated
			      .sch0_frame_sync_lock(sch0_frame_sync_lock), // Templated
			      .sch1_frame_sync_lock(sch1_frame_sync_lock), // Templated
			      .sch2_frame_sync_lock(sch2_frame_sync_lock), // Templated
			      .sch3_frame_sync_lock(sch3_frame_sync_lock), // Templated
			      .pipe_fifo_full_clear(pipe_fifo_full_clear[7:0]), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane0_sync(reg_vprbs_tx_gen_en_app_route_lane0_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane0_sync(reg_vprbs_tx_mode_app_route_lane0_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane0_sync(reg_vprbs_tx_order_app_route_lane0_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane0_sync(reg_vprbs_tx_pat_reset_app_route_lane0_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane0_sync(reg_vprbs_loopback_app_route_lane0_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane0_sync(reg_vprbs_tx_err_inject_en_app_route_lane0_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane0_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane0_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane0_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane0_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane0_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane0_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane0_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane0_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane0_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane0_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane0_sync(reg_vprbs_rx_chk_en_app_route_lane0_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane0_sync(reg_vprbs_rx_mode_app_route_lane0_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane0_sync(reg_vprbs_rx_order_app_route_lane0_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane0_sync(reg_vprbs_rx_load_app_route_lane0_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane0_sync(reg_vprbs_rx_lock_continue_app_route_lane0_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane0_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane0_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane0_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane0_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane0_sync(reg_vprbs_rx_err_clear_app_route_lane0_sync), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane1_sync(reg_vprbs_tx_gen_en_app_route_lane1_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane1_sync(reg_vprbs_tx_mode_app_route_lane1_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane1_sync(reg_vprbs_tx_order_app_route_lane1_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane1_sync(reg_vprbs_tx_pat_reset_app_route_lane1_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane1_sync(reg_vprbs_loopback_app_route_lane1_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane1_sync(reg_vprbs_tx_err_inject_en_app_route_lane1_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane1_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane1_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane1_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane1_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane1_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane1_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane1_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane1_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane1_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane1_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane1_sync(reg_vprbs_rx_chk_en_app_route_lane1_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane1_sync(reg_vprbs_rx_mode_app_route_lane1_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane1_sync(reg_vprbs_rx_order_app_route_lane1_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane1_sync(reg_vprbs_rx_load_app_route_lane1_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane1_sync(reg_vprbs_rx_lock_continue_app_route_lane1_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane1_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane1_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane1_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane1_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane1_sync(reg_vprbs_rx_err_clear_app_route_lane1_sync), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane2_sync(reg_vprbs_tx_gen_en_app_route_lane2_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane2_sync(reg_vprbs_tx_mode_app_route_lane2_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane2_sync(reg_vprbs_tx_order_app_route_lane2_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane2_sync(reg_vprbs_tx_pat_reset_app_route_lane2_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane2_sync(reg_vprbs_loopback_app_route_lane2_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane2_sync(reg_vprbs_tx_err_inject_en_app_route_lane2_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane2_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane2_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane2_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane2_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane2_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane2_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane2_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane2_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane2_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane2_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane2_sync(reg_vprbs_rx_chk_en_app_route_lane2_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane2_sync(reg_vprbs_rx_mode_app_route_lane2_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane2_sync(reg_vprbs_rx_order_app_route_lane2_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane2_sync(reg_vprbs_rx_load_app_route_lane2_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane2_sync(reg_vprbs_rx_lock_continue_app_route_lane2_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane2_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane2_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane2_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane2_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane2_sync(reg_vprbs_rx_err_clear_app_route_lane2_sync), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane3_sync(reg_vprbs_tx_gen_en_app_route_lane3_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane3_sync(reg_vprbs_tx_mode_app_route_lane3_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane3_sync(reg_vprbs_tx_order_app_route_lane3_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane3_sync(reg_vprbs_tx_pat_reset_app_route_lane3_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane3_sync(reg_vprbs_loopback_app_route_lane3_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane3_sync(reg_vprbs_tx_err_inject_en_app_route_lane3_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane3_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane3_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane3_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane3_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane3_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane3_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane3_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane3_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane3_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane3_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane3_sync(reg_vprbs_rx_chk_en_app_route_lane3_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane3_sync(reg_vprbs_rx_mode_app_route_lane3_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane3_sync(reg_vprbs_rx_order_app_route_lane3_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane3_sync(reg_vprbs_rx_load_app_route_lane3_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane3_sync(reg_vprbs_rx_lock_continue_app_route_lane3_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane3_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane3_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane3_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane3_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane3_sync(reg_vprbs_rx_err_clear_app_route_lane3_sync), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane4_sync(reg_vprbs_tx_gen_en_app_route_lane4_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane4_sync(reg_vprbs_tx_mode_app_route_lane4_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane4_sync(reg_vprbs_tx_order_app_route_lane4_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane4_sync(reg_vprbs_tx_pat_reset_app_route_lane4_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane4_sync(reg_vprbs_loopback_app_route_lane4_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane4_sync(reg_vprbs_tx_err_inject_en_app_route_lane4_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane4_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane4_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane4_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane4_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane4_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane4_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane4_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane4_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane4_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane4_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane4_sync(reg_vprbs_rx_chk_en_app_route_lane4_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane4_sync(reg_vprbs_rx_mode_app_route_lane4_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane4_sync(reg_vprbs_rx_order_app_route_lane4_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane4_sync(reg_vprbs_rx_load_app_route_lane4_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane4_sync(reg_vprbs_rx_lock_continue_app_route_lane4_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane4_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane4_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane4_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane4_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane4_sync(reg_vprbs_rx_err_clear_app_route_lane4_sync), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane5_sync(reg_vprbs_tx_gen_en_app_route_lane5_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane5_sync(reg_vprbs_tx_mode_app_route_lane5_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane5_sync(reg_vprbs_tx_order_app_route_lane5_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane5_sync(reg_vprbs_tx_pat_reset_app_route_lane5_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane5_sync(reg_vprbs_loopback_app_route_lane5_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane5_sync(reg_vprbs_tx_err_inject_en_app_route_lane5_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane5_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane5_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane5_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane5_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane5_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane5_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane5_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane5_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane5_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane5_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane5_sync(reg_vprbs_rx_chk_en_app_route_lane5_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane5_sync(reg_vprbs_rx_mode_app_route_lane5_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane5_sync(reg_vprbs_rx_order_app_route_lane5_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane5_sync(reg_vprbs_rx_load_app_route_lane5_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane5_sync(reg_vprbs_rx_lock_continue_app_route_lane5_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane5_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane5_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane5_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane5_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane5_sync(reg_vprbs_rx_err_clear_app_route_lane5_sync), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane6_sync(reg_vprbs_tx_gen_en_app_route_lane6_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane6_sync(reg_vprbs_tx_mode_app_route_lane6_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane6_sync(reg_vprbs_tx_order_app_route_lane6_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane6_sync(reg_vprbs_tx_pat_reset_app_route_lane6_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane6_sync(reg_vprbs_loopback_app_route_lane6_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane6_sync(reg_vprbs_tx_err_inject_en_app_route_lane6_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane6_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane6_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane6_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane6_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane6_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane6_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane6_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane6_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane6_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane6_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane6_sync(reg_vprbs_rx_chk_en_app_route_lane6_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane6_sync(reg_vprbs_rx_mode_app_route_lane6_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane6_sync(reg_vprbs_rx_order_app_route_lane6_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane6_sync(reg_vprbs_rx_load_app_route_lane6_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane6_sync(reg_vprbs_rx_lock_continue_app_route_lane6_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane6_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane6_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane6_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane6_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane6_sync(reg_vprbs_rx_err_clear_app_route_lane6_sync), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane7_sync(reg_vprbs_tx_gen_en_app_route_lane7_sync), // Templated
			      .reg_vprbs_tx_mode_app_route_lane7_sync(reg_vprbs_tx_mode_app_route_lane7_sync[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane7_sync(reg_vprbs_tx_order_app_route_lane7_sync), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane7_sync(reg_vprbs_tx_pat_reset_app_route_lane7_sync), // Templated
			      .reg_vprbs_loopback_app_route_lane7_sync(reg_vprbs_loopback_app_route_lane7_sync), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane7_sync(reg_vprbs_tx_err_inject_en_app_route_lane7_sync), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane7_sync(reg_vprbs_tx_err_inject_intv_num_app_route_lane7_sync[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane7_sync(reg_vprbs_tx_err_inject_intv_time_app_route_lane7_sync[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane7_sync(reg_vprbs_tx_idi_driver_data_type_app_route_lane7_sync[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7_sync(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7_sync[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane7_sync(reg_vprbs_tx_idi_driver_word_count_app_route_lane7_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7_sync(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7_sync[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane7_sync(reg_vprbs_tx_idi_driver_total_interval_app_route_lane7_sync[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane7_sync(reg_vprbs_rx_chk_en_app_route_lane7_sync), // Templated
			      .reg_vprbs_rx_mode_app_route_lane7_sync(reg_vprbs_rx_mode_app_route_lane7_sync[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane7_sync(reg_vprbs_rx_order_app_route_lane7_sync), // Templated
			      .reg_vprbs_rx_load_app_route_lane7_sync(reg_vprbs_rx_load_app_route_lane7_sync), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane7_sync(reg_vprbs_rx_lock_continue_app_route_lane7_sync), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane7_sync(reg_vprbs_rx_locked_match_cnt_app_route_lane7_sync[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane7_sync(reg_vprbs_rx_uncheck_tolerance_app_route_lane7_sync[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane7_sync(reg_vprbs_rx_err_clear_app_route_lane7_sync), // Templated
			      .app_async_rst_req(app_async_rst_req), // Templated
			      // Inputs
			      .reg_sch_data_type_align_fail_int_mask0(reg_sch_data_type_align_fail_int_mask0), // Templated
			      .reg_sch_data_type_align_fail_int_mask1(reg_sch_data_type_align_fail_int_mask1), // Templated
			      .reg_sch_data_type_align_fail_int_mask2(reg_sch_data_type_align_fail_int_mask2), // Templated
			      .reg_sch_data_type_align_fail_int_mask3(reg_sch_data_type_align_fail_int_mask3), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask0(reg_video_data_fwft_fifo_ovf_int_mask0), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask1(reg_video_data_fwft_fifo_ovf_int_mask1), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask2(reg_video_data_fwft_fifo_ovf_int_mask2), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask3(reg_video_data_fwft_fifo_ovf_int_mask3), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask4(reg_video_data_fwft_fifo_ovf_int_mask4), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask5(reg_video_data_fwft_fifo_ovf_int_mask5), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask6(reg_video_data_fwft_fifo_ovf_int_mask6), // Templated
			      .reg_video_data_fwft_fifo_ovf_int_mask7(reg_video_data_fwft_fifo_ovf_int_mask7), // Templated
			      .sch_data_type_align_fail_int0(sch_data_type_align_fail_int0), // Templated
			      .sch_data_type_align_fail_int1(sch_data_type_align_fail_int1), // Templated
			      .sch_data_type_align_fail_int2(sch_data_type_align_fail_int2), // Templated
			      .sch_data_type_align_fail_int3(sch_data_type_align_fail_int3), // Templated
			      .video_data_fwft_fifo_ovf_int0(video_data_fwft_fifo_ovf_int0), // Templated
			      .video_data_fwft_fifo_ovf_int1(video_data_fwft_fifo_ovf_int1), // Templated
			      .video_data_fwft_fifo_ovf_int2(video_data_fwft_fifo_ovf_int2), // Templated
			      .video_data_fwft_fifo_ovf_int3(video_data_fwft_fifo_ovf_int3), // Templated
			      .video_data_fwft_fifo_ovf_int4(video_data_fwft_fifo_ovf_int4), // Templated
			      .video_data_fwft_fifo_ovf_int5(video_data_fwft_fifo_ovf_int5), // Templated
			      .video_data_fwft_fifo_ovf_int6(video_data_fwft_fifo_ovf_int6), // Templated
			      .video_data_fwft_fifo_ovf_int7(video_data_fwft_fifo_ovf_int7), // Templated
			      .treed_reg_bank_clk(treed_reg_bank_clk), // Templated
			      .treed_reg_bank_clk_reset_n(treed_reg_bank_clk_reset_n), // Templated
			      .aggre_clk0	(aggre_clk0),	 // Templated
			      .fifo_wrclk0	(fifo_wrclk0),	 // Templated
			      .fifo_rdclk0	(fifo_rdclk0),	 // Templated
			      .aggre_clk_rst_n0	(aggre_clk_rst_n0), // Templated
			      .fifo_wrclk_rst_n0(fifo_wrclk_rst_n0), // Templated
			      .fifo_rdclk_rst_n0(fifo_rdclk_rst_n0), // Templated
			      .aggre_clk1	(aggre_clk1),	 // Templated
			      .fifo_wrclk1	(fifo_wrclk1),	 // Templated
			      .fifo_rdclk1	(fifo_rdclk1),	 // Templated
			      .aggre_clk_rst_n1	(aggre_clk_rst_n1), // Templated
			      .fifo_wrclk_rst_n1(fifo_wrclk_rst_n1), // Templated
			      .fifo_rdclk_rst_n1(fifo_rdclk_rst_n1), // Templated
			      .aggre_clk2	(aggre_clk2),	 // Templated
			      .fifo_wrclk2	(fifo_wrclk2),	 // Templated
			      .fifo_rdclk2	(fifo_rdclk2),	 // Templated
			      .aggre_clk_rst_n2	(aggre_clk_rst_n2), // Templated
			      .fifo_wrclk_rst_n2(fifo_wrclk_rst_n2), // Templated
			      .fifo_rdclk_rst_n2(fifo_rdclk_rst_n2), // Templated
			      .aggre_clk3	(aggre_clk3),	 // Templated
			      .fifo_wrclk3	(fifo_wrclk3),	 // Templated
			      .fifo_rdclk3	(fifo_rdclk3),	 // Templated
			      .aggre_clk_rst_n3	(aggre_clk_rst_n3), // Templated
			      .fifo_wrclk_rst_n3(fifo_wrclk_rst_n3), // Templated
			      .fifo_rdclk_rst_n3(fifo_rdclk_rst_n3), // Templated
			      .fifo_wrclk4	(fifo_wrclk4),	 // Templated
			      .fifo_rdclk4	(fifo_rdclk4),	 // Templated
			      .fifo_wrclk_rst_n4(fifo_wrclk_rst_n4), // Templated
			      .fifo_rdclk_rst_n4(fifo_rdclk_rst_n4), // Templated
			      .fifo_wrclk5	(fifo_wrclk5),	 // Templated
			      .fifo_rdclk5	(fifo_rdclk5),	 // Templated
			      .fifo_wrclk_rst_n5(fifo_wrclk_rst_n5), // Templated
			      .fifo_rdclk_rst_n5(fifo_rdclk_rst_n5), // Templated
			      .fifo_wrclk6	(fifo_wrclk6),	 // Templated
			      .fifo_rdclk6	(fifo_rdclk6),	 // Templated
			      .fifo_wrclk_rst_n6(fifo_wrclk_rst_n6), // Templated
			      .fifo_rdclk_rst_n6(fifo_rdclk_rst_n6), // Templated
			      .fifo_wrclk7	(fifo_wrclk7),	 // Templated
			      .fifo_rdclk7	(fifo_rdclk7),	 // Templated
			      .fifo_wrclk_rst_n7(fifo_wrclk_rst_n7), // Templated
			      .fifo_rdclk_rst_n7(fifo_rdclk_rst_n7), // Templated
			      .reg_pipe0_wr_mode(reg_pipe0_wr_mode[1:0]), // Templated
			      .reg_pipe1_wr_mode(reg_pipe1_wr_mode[1:0]), // Templated
			      .reg_pipe2_wr_mode(reg_pipe2_wr_mode[1:0]), // Templated
			      .reg_pipe3_wr_mode(reg_pipe3_wr_mode[1:0]), // Templated
			      .reg_pipe4_wr_mode(reg_pipe4_wr_mode[1:0]), // Templated
			      .reg_pipe5_wr_mode(reg_pipe5_wr_mode[1:0]), // Templated
			      .reg_pipe6_wr_mode(reg_pipe6_wr_mode[1:0]), // Templated
			      .reg_pipe7_wr_mode(reg_pipe7_wr_mode[1:0]), // Templated
			      .reg_all_pipe_wr_mode_strobe(reg_all_pipe_wr_mode_strobe), // Templated
			      .reg_sch0_frame_sync_lock_force(reg_app_sch0_frame_sync_lock_force), // Templated
			      .reg_sch1_frame_sync_lock_force(reg_app_sch1_frame_sync_lock_force), // Templated
			      .reg_sch2_frame_sync_lock_force(reg_app_sch2_frame_sync_lock_force), // Templated
			      .reg_sch3_frame_sync_lock_force(reg_app_sch3_frame_sync_lock_force), // Templated
			      .reg_sch0_frame_sync_lock(reg_app_sch0_frame_sync_lock), // Templated
			      .reg_sch1_frame_sync_lock(reg_app_sch1_frame_sync_lock), // Templated
			      .reg_sch2_frame_sync_lock(reg_app_sch2_frame_sync_lock), // Templated
			      .reg_sch3_frame_sync_lock(reg_app_sch3_frame_sync_lock), // Templated
			      .gpio2app_sch0_frame_sync_lock(gpio2app_sch0_frame_sync_lock), // Templated
			      .gpio2app_sch1_frame_sync_lock(gpio2app_sch1_frame_sync_lock), // Templated
			      .gpio2app_sch2_frame_sync_lock(gpio2app_sch2_frame_sync_lock), // Templated
			      .gpio2app_sch3_frame_sync_lock(gpio2app_sch3_frame_sync_lock), // Templated
			      .reg_pipe_fifo_full_clear(reg_pipe_fifo_full_clear[3:0]), // Templated
			      .reg_pipe_fifo_full_clear_last_four(reg_pipe_fifo_full_clear_last_four[3:0]), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane0(reg_vprbs_tx_gen_en_app_route_lane0), // Templated
			      .reg_vprbs_tx_mode_app_route_lane0(reg_vprbs_tx_mode_app_route_lane0[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane0(reg_vprbs_tx_order_app_route_lane0), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane0(reg_vprbs_tx_pat_reset_app_route_lane0), // Templated
			      .reg_vprbs_loopback_app_route_lane0(reg_vprbs_loopback_app_route_lane0), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane0(reg_vprbs_tx_err_inject_en_app_route_lane0), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane0(reg_vprbs_tx_err_inject_intv_num_app_route_lane0[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane0(reg_vprbs_tx_err_inject_intv_time_app_route_lane0[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane0(reg_vprbs_tx_idi_driver_data_type_app_route_lane0[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane0(reg_vprbs_tx_idi_driver_word_count_app_route_lane0[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane0(reg_vprbs_tx_idi_driver_total_interval_app_route_lane0[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane0(reg_vprbs_rx_chk_en_app_route_lane0), // Templated
			      .reg_vprbs_rx_mode_app_route_lane0(reg_vprbs_rx_mode_app_route_lane0[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane0(reg_vprbs_rx_order_app_route_lane0), // Templated
			      .reg_vprbs_rx_load_app_route_lane0(reg_vprbs_rx_load_app_route_lane0), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane0(reg_vprbs_rx_lock_continue_app_route_lane0), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane0(reg_vprbs_rx_locked_match_cnt_app_route_lane0[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane0(reg_vprbs_rx_uncheck_tolerance_app_route_lane0[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane0(reg_vprbs_rx_err_clear_app_route_lane0), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane1(reg_vprbs_tx_gen_en_app_route_lane1), // Templated
			      .reg_vprbs_tx_mode_app_route_lane1(reg_vprbs_tx_mode_app_route_lane1[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane1(reg_vprbs_tx_order_app_route_lane1), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane1(reg_vprbs_tx_pat_reset_app_route_lane1), // Templated
			      .reg_vprbs_loopback_app_route_lane1(reg_vprbs_loopback_app_route_lane1), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane1(reg_vprbs_tx_err_inject_en_app_route_lane1), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane1(reg_vprbs_tx_err_inject_intv_num_app_route_lane1[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane1(reg_vprbs_tx_err_inject_intv_time_app_route_lane1[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane1(reg_vprbs_tx_idi_driver_data_type_app_route_lane1[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane1(reg_vprbs_tx_idi_driver_word_count_app_route_lane1[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane1(reg_vprbs_tx_idi_driver_total_interval_app_route_lane1[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane1(reg_vprbs_rx_chk_en_app_route_lane1), // Templated
			      .reg_vprbs_rx_mode_app_route_lane1(reg_vprbs_rx_mode_app_route_lane1[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane1(reg_vprbs_rx_order_app_route_lane1), // Templated
			      .reg_vprbs_rx_load_app_route_lane1(reg_vprbs_rx_load_app_route_lane1), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane1(reg_vprbs_rx_lock_continue_app_route_lane1), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane1(reg_vprbs_rx_locked_match_cnt_app_route_lane1[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane1(reg_vprbs_rx_uncheck_tolerance_app_route_lane1[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane1(reg_vprbs_rx_err_clear_app_route_lane1), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane2(reg_vprbs_tx_gen_en_app_route_lane2), // Templated
			      .reg_vprbs_tx_mode_app_route_lane2(reg_vprbs_tx_mode_app_route_lane2[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane2(reg_vprbs_tx_order_app_route_lane2), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane2(reg_vprbs_tx_pat_reset_app_route_lane2), // Templated
			      .reg_vprbs_loopback_app_route_lane2(reg_vprbs_loopback_app_route_lane2), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane2(reg_vprbs_tx_err_inject_en_app_route_lane2), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane2(reg_vprbs_tx_err_inject_intv_num_app_route_lane2[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane2(reg_vprbs_tx_err_inject_intv_time_app_route_lane2[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane2(reg_vprbs_tx_idi_driver_data_type_app_route_lane2[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane2(reg_vprbs_tx_idi_driver_word_count_app_route_lane2[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane2(reg_vprbs_tx_idi_driver_total_interval_app_route_lane2[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane2(reg_vprbs_rx_chk_en_app_route_lane2), // Templated
			      .reg_vprbs_rx_mode_app_route_lane2(reg_vprbs_rx_mode_app_route_lane2[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane2(reg_vprbs_rx_order_app_route_lane2), // Templated
			      .reg_vprbs_rx_load_app_route_lane2(reg_vprbs_rx_load_app_route_lane2), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane2(reg_vprbs_rx_lock_continue_app_route_lane2), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane2(reg_vprbs_rx_locked_match_cnt_app_route_lane2[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane2(reg_vprbs_rx_uncheck_tolerance_app_route_lane2[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane2(reg_vprbs_rx_err_clear_app_route_lane2), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane3(reg_vprbs_tx_gen_en_app_route_lane3), // Templated
			      .reg_vprbs_tx_mode_app_route_lane3(reg_vprbs_tx_mode_app_route_lane3[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane3(reg_vprbs_tx_order_app_route_lane3), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane3(reg_vprbs_tx_pat_reset_app_route_lane3), // Templated
			      .reg_vprbs_loopback_app_route_lane3(reg_vprbs_loopback_app_route_lane3), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane3(reg_vprbs_tx_err_inject_en_app_route_lane3), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane3(reg_vprbs_tx_err_inject_intv_num_app_route_lane3[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane3(reg_vprbs_tx_err_inject_intv_time_app_route_lane3[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane3(reg_vprbs_tx_idi_driver_data_type_app_route_lane3[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane3(reg_vprbs_tx_idi_driver_word_count_app_route_lane3[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane3(reg_vprbs_tx_idi_driver_total_interval_app_route_lane3[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane3(reg_vprbs_rx_chk_en_app_route_lane3), // Templated
			      .reg_vprbs_rx_mode_app_route_lane3(reg_vprbs_rx_mode_app_route_lane3[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane3(reg_vprbs_rx_order_app_route_lane3), // Templated
			      .reg_vprbs_rx_load_app_route_lane3(reg_vprbs_rx_load_app_route_lane3), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane3(reg_vprbs_rx_lock_continue_app_route_lane3), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane3(reg_vprbs_rx_locked_match_cnt_app_route_lane3[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane3(reg_vprbs_rx_uncheck_tolerance_app_route_lane3[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane3(reg_vprbs_rx_err_clear_app_route_lane3), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane4(reg_vprbs_tx_gen_en_app_route_lane4), // Templated
			      .reg_vprbs_tx_mode_app_route_lane4(reg_vprbs_tx_mode_app_route_lane4[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane4(reg_vprbs_tx_order_app_route_lane4), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane4(reg_vprbs_tx_pat_reset_app_route_lane4), // Templated
			      .reg_vprbs_loopback_app_route_lane4(reg_vprbs_loopback_app_route_lane4), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane4(reg_vprbs_tx_err_inject_en_app_route_lane4), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane4(reg_vprbs_tx_err_inject_intv_num_app_route_lane4[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane4(reg_vprbs_tx_err_inject_intv_time_app_route_lane4[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane4(reg_vprbs_tx_idi_driver_data_type_app_route_lane4[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane4(reg_vprbs_tx_idi_driver_word_count_app_route_lane4[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane4(reg_vprbs_tx_idi_driver_total_interval_app_route_lane4[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane4(reg_vprbs_rx_chk_en_app_route_lane4), // Templated
			      .reg_vprbs_rx_mode_app_route_lane4(reg_vprbs_rx_mode_app_route_lane4[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane4(reg_vprbs_rx_order_app_route_lane4), // Templated
			      .reg_vprbs_rx_load_app_route_lane4(reg_vprbs_rx_load_app_route_lane4), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane4(reg_vprbs_rx_lock_continue_app_route_lane4), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane4(reg_vprbs_rx_locked_match_cnt_app_route_lane4[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane4(reg_vprbs_rx_uncheck_tolerance_app_route_lane4[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane4(reg_vprbs_rx_err_clear_app_route_lane4), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane5(reg_vprbs_tx_gen_en_app_route_lane5), // Templated
			      .reg_vprbs_tx_mode_app_route_lane5(reg_vprbs_tx_mode_app_route_lane5[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane5(reg_vprbs_tx_order_app_route_lane5), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane5(reg_vprbs_tx_pat_reset_app_route_lane5), // Templated
			      .reg_vprbs_loopback_app_route_lane5(reg_vprbs_loopback_app_route_lane5), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane5(reg_vprbs_tx_err_inject_en_app_route_lane5), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane5(reg_vprbs_tx_err_inject_intv_num_app_route_lane5[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane5(reg_vprbs_tx_err_inject_intv_time_app_route_lane5[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane5(reg_vprbs_tx_idi_driver_data_type_app_route_lane5[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane5(reg_vprbs_tx_idi_driver_word_count_app_route_lane5[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane5(reg_vprbs_tx_idi_driver_total_interval_app_route_lane5[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane5(reg_vprbs_rx_chk_en_app_route_lane5), // Templated
			      .reg_vprbs_rx_mode_app_route_lane5(reg_vprbs_rx_mode_app_route_lane5[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane5(reg_vprbs_rx_order_app_route_lane5), // Templated
			      .reg_vprbs_rx_load_app_route_lane5(reg_vprbs_rx_load_app_route_lane5), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane5(reg_vprbs_rx_lock_continue_app_route_lane5), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane5(reg_vprbs_rx_locked_match_cnt_app_route_lane5[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane5(reg_vprbs_rx_uncheck_tolerance_app_route_lane5[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane5(reg_vprbs_rx_err_clear_app_route_lane5), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane6(reg_vprbs_tx_gen_en_app_route_lane6), // Templated
			      .reg_vprbs_tx_mode_app_route_lane6(reg_vprbs_tx_mode_app_route_lane6[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane6(reg_vprbs_tx_order_app_route_lane6), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane6(reg_vprbs_tx_pat_reset_app_route_lane6), // Templated
			      .reg_vprbs_loopback_app_route_lane6(reg_vprbs_loopback_app_route_lane6), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane6(reg_vprbs_tx_err_inject_en_app_route_lane6), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane6(reg_vprbs_tx_err_inject_intv_num_app_route_lane6[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane6(reg_vprbs_tx_err_inject_intv_time_app_route_lane6[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane6(reg_vprbs_tx_idi_driver_data_type_app_route_lane6[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane6(reg_vprbs_tx_idi_driver_word_count_app_route_lane6[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane6(reg_vprbs_tx_idi_driver_total_interval_app_route_lane6[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane6(reg_vprbs_rx_chk_en_app_route_lane6), // Templated
			      .reg_vprbs_rx_mode_app_route_lane6(reg_vprbs_rx_mode_app_route_lane6[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane6(reg_vprbs_rx_order_app_route_lane6), // Templated
			      .reg_vprbs_rx_load_app_route_lane6(reg_vprbs_rx_load_app_route_lane6), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane6(reg_vprbs_rx_lock_continue_app_route_lane6), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane6(reg_vprbs_rx_locked_match_cnt_app_route_lane6[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane6(reg_vprbs_rx_uncheck_tolerance_app_route_lane6[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane6(reg_vprbs_rx_err_clear_app_route_lane6), // Templated
			      .reg_vprbs_tx_gen_en_app_route_lane7(reg_vprbs_tx_gen_en_app_route_lane7), // Templated
			      .reg_vprbs_tx_mode_app_route_lane7(reg_vprbs_tx_mode_app_route_lane7[2:0]), // Templated
			      .reg_vprbs_tx_order_app_route_lane7(reg_vprbs_tx_order_app_route_lane7), // Templated
			      .reg_vprbs_tx_pat_reset_app_route_lane7(reg_vprbs_tx_pat_reset_app_route_lane7), // Templated
			      .reg_vprbs_loopback_app_route_lane7(reg_vprbs_loopback_app_route_lane7), // Templated
			      .reg_vprbs_tx_err_inject_en_app_route_lane7(reg_vprbs_tx_err_inject_en_app_route_lane7), // Templated
			      .reg_vprbs_tx_err_inject_intv_num_app_route_lane7(reg_vprbs_tx_err_inject_intv_num_app_route_lane7[7:0]), // Templated
			      .reg_vprbs_tx_err_inject_intv_time_app_route_lane7(reg_vprbs_tx_err_inject_intv_time_app_route_lane7[7:0]), // Templated
			      .reg_vprbs_tx_idi_driver_data_type_app_route_lane7(reg_vprbs_tx_idi_driver_data_type_app_route_lane7[5:0]), // Templated
			      .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7[3:0]), // Templated
			      .reg_vprbs_tx_idi_driver_word_count_app_route_lane7(reg_vprbs_tx_idi_driver_word_count_app_route_lane7[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7[15:0]), // Templated
			      .reg_vprbs_tx_idi_driver_total_interval_app_route_lane7(reg_vprbs_tx_idi_driver_total_interval_app_route_lane7[15:0]), // Templated
			      .reg_vprbs_rx_chk_en_app_route_lane7(reg_vprbs_rx_chk_en_app_route_lane7), // Templated
			      .reg_vprbs_rx_mode_app_route_lane7(reg_vprbs_rx_mode_app_route_lane7[2:0]), // Templated
			      .reg_vprbs_rx_order_app_route_lane7(reg_vprbs_rx_order_app_route_lane7), // Templated
			      .reg_vprbs_rx_load_app_route_lane7(reg_vprbs_rx_load_app_route_lane7), // Templated
			      .reg_vprbs_rx_lock_continue_app_route_lane7(reg_vprbs_rx_lock_continue_app_route_lane7), // Templated
			      .reg_vprbs_rx_locked_match_cnt_app_route_lane7(reg_vprbs_rx_locked_match_cnt_app_route_lane7[3:0]), // Templated
			      .reg_vprbs_rx_uncheck_tolerance_app_route_lane7(reg_vprbs_rx_uncheck_tolerance_app_route_lane7[3:0]), // Templated
			      .reg_vprbs_rx_err_clear_app_route_lane7(reg_vprbs_rx_err_clear_app_route_lane7), // Templated
			      .sch0_aggre_mode	(sch0_aggre_mode[1:0]), // Templated
			      .sch0_pipe3_concat_en(sch0_pipe3_concat_en), // Templated
			      .sch0_pipe2_concat_en(sch0_pipe2_concat_en), // Templated
			      .sch0_pipe1_concat_en(sch0_pipe1_concat_en), // Templated
			      .sch0_pipe0_concat_en(sch0_pipe0_concat_en), // Templated
			      .sch1_aggre_mode	(sch1_aggre_mode[1:0]), // Templated
			      .sch1_pipe3_concat_en(sch1_pipe3_concat_en), // Templated
			      .sch1_pipe2_concat_en(sch1_pipe2_concat_en), // Templated
			      .sch1_pipe1_concat_en(sch1_pipe1_concat_en), // Templated
			      .sch1_pipe0_concat_en(sch1_pipe0_concat_en), // Templated
			      .sch2_aggre_mode	(sch2_aggre_mode[1:0]), // Templated
			      .sch2_pipe3_concat_en(sch2_pipe3_concat_en), // Templated
			      .sch2_pipe2_concat_en(sch2_pipe2_concat_en), // Templated
			      .sch2_pipe1_concat_en(sch2_pipe1_concat_en), // Templated
			      .sch2_pipe0_concat_en(sch2_pipe0_concat_en), // Templated
			      .sch3_aggre_mode	(sch3_aggre_mode[1:0]), // Templated
			      .sch3_pipe3_concat_en(sch3_pipe3_concat_en), // Templated
			      .sch3_pipe2_concat_en(sch3_pipe2_concat_en), // Templated
			      .sch3_pipe1_concat_en(sch3_pipe1_concat_en), // Templated
			      .sch3_pipe0_concat_en(sch3_pipe0_concat_en), // Templated
			      .reg_sch0_frame_sync_auto_change_pipe_wr_mode(reg_sch0_frame_sync_auto_change_pipe_wr_mode), // Templated
			      .reg_sch1_frame_sync_auto_change_pipe_wr_mode(reg_sch1_frame_sync_auto_change_pipe_wr_mode), // Templated
			      .reg_sch2_frame_sync_auto_change_pipe_wr_mode(reg_sch2_frame_sync_auto_change_pipe_wr_mode), // Templated
			      .reg_sch3_frame_sync_auto_change_pipe_wr_mode(reg_sch3_frame_sync_auto_change_pipe_wr_mode)); // Templated

assign    to_clkgen_fifo_wrclk_sel0    =    reg_pipe0_stream_sel;
assign    to_clkgen_fifo_wrclk_sel1    =    reg_pipe1_stream_sel;
assign    to_clkgen_fifo_wrclk_sel2    =    reg_pipe2_stream_sel;
assign    to_clkgen_fifo_wrclk_sel3    =    reg_pipe3_stream_sel;
assign    to_clkgen_fifo_wrclk_sel4    =    reg_pipe4_stream_sel;
assign    to_clkgen_fifo_wrclk_sel5    =    reg_pipe5_stream_sel;
assign    to_clkgen_fifo_wrclk_sel6    =    reg_pipe6_stream_sel;
assign    to_clkgen_fifo_wrclk_sel7    =    reg_pipe7_stream_sel;

assign    to_clkgen_fifo_rdclk_sel0    =    2'd1;
assign    to_clkgen_fifo_rdclk_sel1    =    2'd1;
assign    to_clkgen_fifo_rdclk_sel2    =    2'd1;
assign    to_clkgen_fifo_rdclk_sel3    =    2'd1;
assign    to_clkgen_fifo_rdclk_sel4    =    2'd1;
assign    to_clkgen_fifo_rdclk_sel5    =    2'd1;
assign    to_clkgen_fifo_rdclk_sel6    =    2'd1;
assign    to_clkgen_fifo_rdclk_sel7    =    2'd1;

assign    mep0_virtual_channel_4b = {mep0_virtual_channel_x,mep0_virtual_channel};
assign    mep1_virtual_channel_4b = {mep1_virtual_channel_x,mep1_virtual_channel};
assign    mep2_virtual_channel_4b = {mep2_virtual_channel_x,mep2_virtual_channel};
assign    mep3_virtual_channel_4b = {mep3_virtual_channel_x,mep3_virtual_channel};

/*  as6d_app_idi_validity_check  AUTO_TEMPLATE (
    .in_mep\(.*\)_virtual_channel(mep\1_virtual_channel_4b[]),
    .in_mep\(.*\)   (mep\1[]),
    .out_mep\(.*\)  (validity2gencrc\1[]),
)*/;
as6d_app_idi_validity_check u_as6d_app_idi_validity_check(/*AUTOINST*/
							  // Outputs
							  .out_mep0_byte_en	(validity2gencrc0_byte_en[2:0]), // Templated
							  .out_mep0_csi_data	(validity2gencrc0_csi_data[63:0]), // Templated
							  .out_mep0_data_en	(validity2gencrc0_data_en), // Templated
							  .out_mep0_data_type	(validity2gencrc0_data_type[5:0]), // Templated
							  .out_mep0_header_en	(validity2gencrc0_header_en), // Templated
							  .out_mep0_tunnel_mode_en(validity2gencrc0_tunnel_mode_en), // Templated
							  .out_mep0_virtual_channel(validity2gencrc0_virtual_channel[3:0]), // Templated
							  .out_mep0_word_count	(validity2gencrc0_word_count[15:0]), // Templated
							  .out_mep1_byte_en	(validity2gencrc1_byte_en[2:0]), // Templated
							  .out_mep1_csi_data	(validity2gencrc1_csi_data[63:0]), // Templated
							  .out_mep1_data_en	(validity2gencrc1_data_en), // Templated
							  .out_mep1_data_type	(validity2gencrc1_data_type[5:0]), // Templated
							  .out_mep1_header_en	(validity2gencrc1_header_en), // Templated
							  .out_mep1_tunnel_mode_en(validity2gencrc1_tunnel_mode_en), // Templated
							  .out_mep1_virtual_channel(validity2gencrc1_virtual_channel[3:0]), // Templated
							  .out_mep1_word_count	(validity2gencrc1_word_count[15:0]), // Templated
							  .out_mep2_byte_en	(validity2gencrc2_byte_en[2:0]), // Templated
							  .out_mep2_csi_data	(validity2gencrc2_csi_data[63:0]), // Templated
							  .out_mep2_data_en	(validity2gencrc2_data_en), // Templated
							  .out_mep2_data_type	(validity2gencrc2_data_type[5:0]), // Templated
							  .out_mep2_header_en	(validity2gencrc2_header_en), // Templated
							  .out_mep2_tunnel_mode_en(validity2gencrc2_tunnel_mode_en), // Templated
							  .out_mep2_virtual_channel(validity2gencrc2_virtual_channel[3:0]), // Templated
							  .out_mep2_word_count	(validity2gencrc2_word_count[15:0]), // Templated
							  .out_mep3_byte_en	(validity2gencrc3_byte_en[2:0]), // Templated
							  .out_mep3_csi_data	(validity2gencrc3_csi_data[63:0]), // Templated
							  .out_mep3_data_en	(validity2gencrc3_data_en), // Templated
							  .out_mep3_data_type	(validity2gencrc3_data_type[5:0]), // Templated
							  .out_mep3_header_en	(validity2gencrc3_header_en), // Templated
							  .out_mep3_tunnel_mode_en(validity2gencrc3_tunnel_mode_en), // Templated
							  .out_mep3_virtual_channel(validity2gencrc3_virtual_channel[3:0]), // Templated
							  .out_mep3_word_count	(validity2gencrc3_word_count[15:0]), // Templated
							  // Inputs
							  .in_mep0_byte_en	(mep0_byte_en[2:0]), // Templated
							  .in_mep0_csi_data	(mep0_csi_data[63:0]), // Templated
							  .in_mep0_data_en	(mep0_data_en),	 // Templated
							  .in_mep0_data_type	(mep0_data_type[5:0]), // Templated
							  .in_mep0_header_en	(mep0_header_en), // Templated
							  .in_mep0_tunnel_mode_en(mep0_tunnel_mode_en), // Templated
							  .in_mep0_virtual_channel(mep0_virtual_channel_4b[3:0]), // Templated
							  .in_mep0_word_count	(mep0_word_count[15:0]), // Templated
							  .in_mep1_byte_en	(mep1_byte_en[2:0]), // Templated
							  .in_mep1_csi_data	(mep1_csi_data[63:0]), // Templated
							  .in_mep1_data_en	(mep1_data_en),	 // Templated
							  .in_mep1_data_type	(mep1_data_type[5:0]), // Templated
							  .in_mep1_header_en	(mep1_header_en), // Templated
							  .in_mep1_tunnel_mode_en(mep1_tunnel_mode_en), // Templated
							  .in_mep1_virtual_channel(mep1_virtual_channel_4b[3:0]), // Templated
							  .in_mep1_word_count	(mep1_word_count[15:0]), // Templated
							  .in_mep2_byte_en	(mep2_byte_en[2:0]), // Templated
							  .in_mep2_csi_data	(mep2_csi_data[63:0]), // Templated
							  .in_mep2_data_en	(mep2_data_en),	 // Templated
							  .in_mep2_data_type	(mep2_data_type[5:0]), // Templated
							  .in_mep2_header_en	(mep2_header_en), // Templated
							  .in_mep2_tunnel_mode_en(mep2_tunnel_mode_en), // Templated
							  .in_mep2_virtual_channel(mep2_virtual_channel_4b[3:0]), // Templated
							  .in_mep2_word_count	(mep2_word_count[15:0]), // Templated
							  .in_mep3_byte_en	(mep3_byte_en[2:0]), // Templated
							  .in_mep3_csi_data	(mep3_csi_data[63:0]), // Templated
							  .in_mep3_data_en	(mep3_data_en),	 // Templated
							  .in_mep3_data_type	(mep3_data_type[5:0]), // Templated
							  .in_mep3_header_en	(mep3_header_en), // Templated
							  .in_mep3_tunnel_mode_en(mep3_tunnel_mode_en), // Templated
							  .in_mep3_virtual_channel(mep3_virtual_channel_4b[3:0]), // Templated
							  .in_mep3_word_count	(mep3_word_count[15:0]), // Templated
							  .mep_clk0		(mep_clk0),
							  .mep_clk1		(mep_clk1),
							  .mep_clk2		(mep_clk2),
							  .mep_clk3		(mep_clk3),
							  .mep_clk_rst_n0	(mep_clk_rst_n0),
							  .mep_clk_rst_n1	(mep_clk_rst_n1),
							  .mep_clk_rst_n2	(mep_clk_rst_n2),
							  .mep_clk_rst_n3	(mep_clk_rst_n3));


/*  as6d_app_crc_gen  AUTO_TEMPLATE (
    .in_mep\(.*\)   (validity2gencrc\1[]),
    .out_mep\(.*\)  (gencrc2pktfilter\1[]),
)*/;
as6d_app_crc_gen u_as6d_app_crc_gen(
                    /*AUTOINST*/
				    // Outputs
				    .out_mep0_byte_en	(gencrc2pktfilter0_byte_en[2:0]), // Templated
				    .out_mep0_csi_data	(gencrc2pktfilter0_csi_data[63:0]), // Templated
				    .out_mep0_data_en	(gencrc2pktfilter0_data_en), // Templated
				    .out_mep0_data_type	(gencrc2pktfilter0_data_type[5:0]), // Templated
				    .out_mep0_header_en	(gencrc2pktfilter0_header_en), // Templated
				    .out_mep0_pkt_crc	(gencrc2pktfilter0_pkt_crc[31:0]), // Templated
				    .out_mep0_pkt_crc_en(gencrc2pktfilter0_pkt_crc_en), // Templated
				    .out_mep0_tunnel_mode_en(gencrc2pktfilter0_tunnel_mode_en), // Templated
				    .out_mep0_virtual_channel(gencrc2pktfilter0_virtual_channel[3:0]), // Templated
				    .out_mep0_word_count(gencrc2pktfilter0_word_count[15:0]), // Templated
				    .out_mep1_byte_en	(gencrc2pktfilter1_byte_en[2:0]), // Templated
				    .out_mep1_csi_data	(gencrc2pktfilter1_csi_data[63:0]), // Templated
				    .out_mep1_data_en	(gencrc2pktfilter1_data_en), // Templated
				    .out_mep1_data_type	(gencrc2pktfilter1_data_type[5:0]), // Templated
				    .out_mep1_header_en	(gencrc2pktfilter1_header_en), // Templated
				    .out_mep1_pkt_crc	(gencrc2pktfilter1_pkt_crc[31:0]), // Templated
				    .out_mep1_pkt_crc_en(gencrc2pktfilter1_pkt_crc_en), // Templated
				    .out_mep1_tunnel_mode_en(gencrc2pktfilter1_tunnel_mode_en), // Templated
				    .out_mep1_virtual_channel(gencrc2pktfilter1_virtual_channel[3:0]), // Templated
				    .out_mep1_word_count(gencrc2pktfilter1_word_count[15:0]), // Templated
				    .out_mep2_byte_en	(gencrc2pktfilter2_byte_en[2:0]), // Templated
				    .out_mep2_csi_data	(gencrc2pktfilter2_csi_data[63:0]), // Templated
				    .out_mep2_data_en	(gencrc2pktfilter2_data_en), // Templated
				    .out_mep2_data_type	(gencrc2pktfilter2_data_type[5:0]), // Templated
				    .out_mep2_header_en	(gencrc2pktfilter2_header_en), // Templated
				    .out_mep2_pkt_crc	(gencrc2pktfilter2_pkt_crc[31:0]), // Templated
				    .out_mep2_pkt_crc_en(gencrc2pktfilter2_pkt_crc_en), // Templated
				    .out_mep2_tunnel_mode_en(gencrc2pktfilter2_tunnel_mode_en), // Templated
				    .out_mep2_virtual_channel(gencrc2pktfilter2_virtual_channel[3:0]), // Templated
				    .out_mep2_word_count(gencrc2pktfilter2_word_count[15:0]), // Templated
				    .out_mep3_byte_en	(gencrc2pktfilter3_byte_en[2:0]), // Templated
				    .out_mep3_csi_data	(gencrc2pktfilter3_csi_data[63:0]), // Templated
				    .out_mep3_data_en	(gencrc2pktfilter3_data_en), // Templated
				    .out_mep3_data_type	(gencrc2pktfilter3_data_type[5:0]), // Templated
				    .out_mep3_header_en	(gencrc2pktfilter3_header_en), // Templated
				    .out_mep3_pkt_crc	(gencrc2pktfilter3_pkt_crc[31:0]), // Templated
				    .out_mep3_pkt_crc_en(gencrc2pktfilter3_pkt_crc_en), // Templated
				    .out_mep3_tunnel_mode_en(gencrc2pktfilter3_tunnel_mode_en), // Templated
				    .out_mep3_virtual_channel(gencrc2pktfilter3_virtual_channel[3:0]), // Templated
				    .out_mep3_word_count(gencrc2pktfilter3_word_count[15:0]), // Templated
				    // Inputs
				    .in_mep0_byte_en	(validity2gencrc0_byte_en[2:0]), // Templated
				    .in_mep0_csi_data	(validity2gencrc0_csi_data[63:0]), // Templated
				    .in_mep0_data_en	(validity2gencrc0_data_en), // Templated
				    .in_mep0_data_type	(validity2gencrc0_data_type[5:0]), // Templated
				    .in_mep0_header_en	(validity2gencrc0_header_en), // Templated
				    .in_mep0_tunnel_mode_en(validity2gencrc0_tunnel_mode_en), // Templated
				    .in_mep0_virtual_channel(validity2gencrc0_virtual_channel[3:0]), // Templated
				    .in_mep0_word_count	(validity2gencrc0_word_count[15:0]), // Templated
				    .in_mep1_byte_en	(validity2gencrc1_byte_en[2:0]), // Templated
				    .in_mep1_csi_data	(validity2gencrc1_csi_data[63:0]), // Templated
				    .in_mep1_data_en	(validity2gencrc1_data_en), // Templated
				    .in_mep1_data_type	(validity2gencrc1_data_type[5:0]), // Templated
				    .in_mep1_header_en	(validity2gencrc1_header_en), // Templated
				    .in_mep1_tunnel_mode_en(validity2gencrc1_tunnel_mode_en), // Templated
				    .in_mep1_virtual_channel(validity2gencrc1_virtual_channel[3:0]), // Templated
				    .in_mep1_word_count	(validity2gencrc1_word_count[15:0]), // Templated
				    .in_mep2_byte_en	(validity2gencrc2_byte_en[2:0]), // Templated
				    .in_mep2_csi_data	(validity2gencrc2_csi_data[63:0]), // Templated
				    .in_mep2_data_en	(validity2gencrc2_data_en), // Templated
				    .in_mep2_data_type	(validity2gencrc2_data_type[5:0]), // Templated
				    .in_mep2_header_en	(validity2gencrc2_header_en), // Templated
				    .in_mep2_tunnel_mode_en(validity2gencrc2_tunnel_mode_en), // Templated
				    .in_mep2_virtual_channel(validity2gencrc2_virtual_channel[3:0]), // Templated
				    .in_mep2_word_count	(validity2gencrc2_word_count[15:0]), // Templated
				    .in_mep3_byte_en	(validity2gencrc3_byte_en[2:0]), // Templated
				    .in_mep3_csi_data	(validity2gencrc3_csi_data[63:0]), // Templated
				    .in_mep3_data_en	(validity2gencrc3_data_en), // Templated
				    .in_mep3_data_type	(validity2gencrc3_data_type[5:0]), // Templated
				    .in_mep3_header_en	(validity2gencrc3_header_en), // Templated
				    .in_mep3_tunnel_mode_en(validity2gencrc3_tunnel_mode_en), // Templated
				    .in_mep3_virtual_channel(validity2gencrc3_virtual_channel[3:0]), // Templated
				    .in_mep3_word_count	(validity2gencrc3_word_count[15:0]), // Templated
				    .mep_clk0		(mep_clk0),
				    .mep_clk1		(mep_clk1),
				    .mep_clk2		(mep_clk2),
				    .mep_clk3		(mep_clk3),
				    .mep_clk_rst_n0	(mep_clk_rst_n0),
				    .mep_clk_rst_n1	(mep_clk_rst_n1),
				    .mep_clk_rst_n2	(mep_clk_rst_n2),
				    .mep_clk_rst_n3	(mep_clk_rst_n3),
				    .reg_app_pkt_crc_gen_dis(reg_app_pkt_crc_gen_dis));

/*  as6d_app_pkt_filter  AUTO_TEMPLATE (
    .in_mep\([0-3]\)_virtual_channel(gencrc2pktfilter\1_virtual_channel[]),
    .in_mep\(.*\)   (gencrc2pktfilter\1[]),
    .out_mep\(.*\)  (pkt_filter_out_mep\1[]),
    .mep_clk\(.*\)   (mep_clk\1),
    .mep_clk_rst_n\(.*\)   (mep_clk_rst_n\1),
)*/

as6d_app_pkt_filter u_as6d_app_pkt_filter(
                        /*AUTOINST*/
					  // Outputs
					  .out_mep0_byte_en	(pkt_filter_out_mep0_byte_en[2:0]), // Templated
					  .out_mep0_csi_data	(pkt_filter_out_mep0_csi_data[63:0]), // Templated
					  .out_mep0_data_en	(pkt_filter_out_mep0_data_en), // Templated
					  .out_mep0_data_type	(pkt_filter_out_mep0_data_type[5:0]), // Templated
					  .out_mep0_header_en	(pkt_filter_out_mep0_header_en), // Templated
					  .out_mep0_tunnel_mode_en(pkt_filter_out_mep0_tunnel_mode_en), // Templated
					  .out_mep0_virtual_channel(pkt_filter_out_mep0_virtual_channel[3:0]), // Templated
					  .out_mep0_word_count	(pkt_filter_out_mep0_word_count[15:0]), // Templated
					  .out_mep0_pkt_crc_en	(pkt_filter_out_mep0_pkt_crc_en), // Templated
					  .out_mep0_pkt_crc	(pkt_filter_out_mep0_pkt_crc[31:0]), // Templated
					  .out_mep1_byte_en	(pkt_filter_out_mep1_byte_en[2:0]), // Templated
					  .out_mep1_csi_data	(pkt_filter_out_mep1_csi_data[63:0]), // Templated
					  .out_mep1_data_en	(pkt_filter_out_mep1_data_en), // Templated
					  .out_mep1_data_type	(pkt_filter_out_mep1_data_type[5:0]), // Templated
					  .out_mep1_header_en	(pkt_filter_out_mep1_header_en), // Templated
					  .out_mep1_tunnel_mode_en(pkt_filter_out_mep1_tunnel_mode_en), // Templated
					  .out_mep1_virtual_channel(pkt_filter_out_mep1_virtual_channel[3:0]), // Templated
					  .out_mep1_word_count	(pkt_filter_out_mep1_word_count[15:0]), // Templated
					  .out_mep1_pkt_crc_en	(pkt_filter_out_mep1_pkt_crc_en), // Templated
					  .out_mep1_pkt_crc	(pkt_filter_out_mep1_pkt_crc[31:0]), // Templated
					  .out_mep2_byte_en	(pkt_filter_out_mep2_byte_en[2:0]), // Templated
					  .out_mep2_csi_data	(pkt_filter_out_mep2_csi_data[63:0]), // Templated
					  .out_mep2_data_en	(pkt_filter_out_mep2_data_en), // Templated
					  .out_mep2_data_type	(pkt_filter_out_mep2_data_type[5:0]), // Templated
					  .out_mep2_header_en	(pkt_filter_out_mep2_header_en), // Templated
					  .out_mep2_tunnel_mode_en(pkt_filter_out_mep2_tunnel_mode_en), // Templated
					  .out_mep2_virtual_channel(pkt_filter_out_mep2_virtual_channel[3:0]), // Templated
					  .out_mep2_word_count	(pkt_filter_out_mep2_word_count[15:0]), // Templated
					  .out_mep2_pkt_crc_en	(pkt_filter_out_mep2_pkt_crc_en), // Templated
					  .out_mep2_pkt_crc	(pkt_filter_out_mep2_pkt_crc[31:0]), // Templated
					  .out_mep3_byte_en	(pkt_filter_out_mep3_byte_en[2:0]), // Templated
					  .out_mep3_csi_data	(pkt_filter_out_mep3_csi_data[63:0]), // Templated
					  .out_mep3_data_en	(pkt_filter_out_mep3_data_en), // Templated
					  .out_mep3_data_type	(pkt_filter_out_mep3_data_type[5:0]), // Templated
					  .out_mep3_header_en	(pkt_filter_out_mep3_header_en), // Templated
					  .out_mep3_tunnel_mode_en(pkt_filter_out_mep3_tunnel_mode_en), // Templated
					  .out_mep3_virtual_channel(pkt_filter_out_mep3_virtual_channel[3:0]), // Templated
					  .out_mep3_word_count	(pkt_filter_out_mep3_word_count[15:0]), // Templated
					  .out_mep3_pkt_crc_en	(pkt_filter_out_mep3_pkt_crc_en), // Templated
					  .out_mep3_pkt_crc	(pkt_filter_out_mep3_pkt_crc[31:0]), // Templated
					  // Inputs
					  .in_mep0_byte_en	(gencrc2pktfilter0_byte_en[2:0]), // Templated
					  .in_mep0_csi_data	(gencrc2pktfilter0_csi_data[63:0]), // Templated
					  .in_mep0_data_en	(gencrc2pktfilter0_data_en), // Templated
					  .in_mep0_data_type	(gencrc2pktfilter0_data_type[5:0]), // Templated
					  .in_mep0_header_en	(gencrc2pktfilter0_header_en), // Templated
					  .in_mep0_pkt_crc	(gencrc2pktfilter0_pkt_crc[31:0]), // Templated
					  .in_mep0_pkt_crc_en	(gencrc2pktfilter0_pkt_crc_en), // Templated
					  .in_mep0_virtual_channel(gencrc2pktfilter0_virtual_channel[3:0]), // Templated
					  .in_mep0_word_count	(gencrc2pktfilter0_word_count[15:0]), // Templated
					  .in_mep1_byte_en	(gencrc2pktfilter1_byte_en[2:0]), // Templated
					  .in_mep1_csi_data	(gencrc2pktfilter1_csi_data[63:0]), // Templated
					  .in_mep1_data_en	(gencrc2pktfilter1_data_en), // Templated
					  .in_mep1_data_type	(gencrc2pktfilter1_data_type[5:0]), // Templated
					  .in_mep1_header_en	(gencrc2pktfilter1_header_en), // Templated
					  .in_mep1_pkt_crc	(gencrc2pktfilter1_pkt_crc[31:0]), // Templated
					  .in_mep1_pkt_crc_en	(gencrc2pktfilter1_pkt_crc_en), // Templated
					  .in_mep1_virtual_channel(gencrc2pktfilter1_virtual_channel[3:0]), // Templated
					  .in_mep1_word_count	(gencrc2pktfilter1_word_count[15:0]), // Templated
					  .in_mep2_byte_en	(gencrc2pktfilter2_byte_en[2:0]), // Templated
					  .in_mep2_csi_data	(gencrc2pktfilter2_csi_data[63:0]), // Templated
					  .in_mep2_data_en	(gencrc2pktfilter2_data_en), // Templated
					  .in_mep2_data_type	(gencrc2pktfilter2_data_type[5:0]), // Templated
					  .in_mep2_header_en	(gencrc2pktfilter2_header_en), // Templated
					  .in_mep2_pkt_crc	(gencrc2pktfilter2_pkt_crc[31:0]), // Templated
					  .in_mep2_pkt_crc_en	(gencrc2pktfilter2_pkt_crc_en), // Templated
					  .in_mep2_virtual_channel(gencrc2pktfilter2_virtual_channel[3:0]), // Templated
					  .in_mep2_word_count	(gencrc2pktfilter2_word_count[15:0]), // Templated
					  .in_mep3_byte_en	(gencrc2pktfilter3_byte_en[2:0]), // Templated
					  .in_mep3_csi_data	(gencrc2pktfilter3_csi_data[63:0]), // Templated
					  .in_mep3_data_en	(gencrc2pktfilter3_data_en), // Templated
					  .in_mep3_data_type	(gencrc2pktfilter3_data_type[5:0]), // Templated
					  .in_mep3_header_en	(gencrc2pktfilter3_header_en), // Templated
					  .in_mep3_pkt_crc	(gencrc2pktfilter3_pkt_crc[31:0]), // Templated
					  .in_mep3_pkt_crc_en	(gencrc2pktfilter3_pkt_crc_en), // Templated
					  .in_mep3_virtual_channel(gencrc2pktfilter3_virtual_channel[3:0]), // Templated
					  .in_mep3_word_count	(gencrc2pktfilter3_word_count[15:0]), // Templated
					  .mep_clk0		(mep_clk0),	 // Templated
					  .mep_clk1		(mep_clk1),	 // Templated
					  .mep_clk2		(mep_clk2),	 // Templated
					  .mep_clk3		(mep_clk3),	 // Templated
					  .mep_clk_rst_n0	(mep_clk_rst_n0), // Templated
					  .mep_clk_rst_n1	(mep_clk_rst_n1), // Templated
					  .mep_clk_rst_n2	(mep_clk_rst_n2), // Templated
					  .mep_clk_rst_n3	(mep_clk_rst_n3), // Templated
					  .reg_mem_dt1_selz_mep0(reg_mem_dt1_selz_mep0[6:0]),
					  .reg_mem_dt1_selz_mep1(reg_mem_dt1_selz_mep1[6:0]),
					  .reg_mem_dt1_selz_mep2(reg_mem_dt1_selz_mep2[6:0]),
					  .reg_mem_dt1_selz_mep3(reg_mem_dt1_selz_mep3[6:0]),
					  .reg_mem_dt2_selz_mep0(reg_mem_dt2_selz_mep0[6:0]),
					  .reg_mem_dt2_selz_mep1(reg_mem_dt2_selz_mep1[6:0]),
					  .reg_mem_dt2_selz_mep2(reg_mem_dt2_selz_mep2[6:0]),
					  .reg_mem_dt2_selz_mep3(reg_mem_dt2_selz_mep3[6:0]),
					  .reg_mem_dt3_selz_en_mep0(reg_mem_dt3_selz_en_mep0),
					  .reg_mem_dt3_selz_en_mep1(reg_mem_dt3_selz_en_mep1),
					  .reg_mem_dt3_selz_en_mep2(reg_mem_dt3_selz_en_mep2),
					  .reg_mem_dt3_selz_en_mep3(reg_mem_dt3_selz_en_mep3),
					  .reg_mem_dt3_selz_mep0(reg_mem_dt3_selz_mep0[7:0]),
					  .reg_mem_dt3_selz_mep1(reg_mem_dt3_selz_mep1[7:0]),
					  .reg_mem_dt3_selz_mep2(reg_mem_dt3_selz_mep2[7:0]),
					  .reg_mem_dt3_selz_mep3(reg_mem_dt3_selz_mep3[7:0]),
					  .reg_mem_dt4_selz_en_mep0(reg_mem_dt4_selz_en_mep0),
					  .reg_mem_dt4_selz_en_mep1(reg_mem_dt4_selz_en_mep1),
					  .reg_mem_dt4_selz_en_mep2(reg_mem_dt4_selz_en_mep2),
					  .reg_mem_dt4_selz_en_mep3(reg_mem_dt4_selz_en_mep3),
					  .reg_mem_dt4_selz_mep0(reg_mem_dt4_selz_mep0[7:0]),
					  .reg_mem_dt4_selz_mep1(reg_mem_dt4_selz_mep1[7:0]),
					  .reg_mem_dt4_selz_mep2(reg_mem_dt4_selz_mep2[7:0]),
					  .reg_mem_dt4_selz_mep3(reg_mem_dt4_selz_mep3[7:0]),
					  .reg_mem_dt7_selz_mep0(reg_mem_dt7_selz_mep0[6:0]),
					  .reg_mem_dt7_selz_mep1(reg_mem_dt7_selz_mep1[6:0]),
					  .reg_mem_dt7_selz_mep2(reg_mem_dt7_selz_mep2[6:0]),
					  .reg_mem_dt7_selz_mep3(reg_mem_dt7_selz_mep3[6:0]),
					  .reg_mem_dt8_selz_mep0(reg_mem_dt8_selz_mep0[6:0]),
					  .reg_mem_dt8_selz_mep1(reg_mem_dt8_selz_mep1[6:0]),
					  .reg_mem_dt8_selz_mep2(reg_mem_dt8_selz_mep2[6:0]),
					  .reg_mem_dt8_selz_mep3(reg_mem_dt8_selz_mep3[6:0]),
					  .reg_mep0_tdi_en	(reg_mep0_tdi_en),
					  .reg_mep0_tdi_en_force(reg_mep0_tdi_en_force),
					  .reg_mep1_tdi_en	(reg_mep1_tdi_en),
					  .reg_mep1_tdi_en_force(reg_mep1_tdi_en_force),
					  .reg_mep2_tdi_en	(reg_mep2_tdi_en),
					  .reg_mep2_tdi_en_force(reg_mep2_tdi_en_force),
					  .reg_mep3_tdi_en	(reg_mep3_tdi_en),
					  .reg_mep3_tdi_en_force(reg_mep3_tdi_en_force),
					  .reg_vc_selz_h_mep0	(reg_vc_selz_h_mep0[7:0]),
					  .reg_vc_selz_h_mep1	(reg_vc_selz_h_mep1[7:0]),
					  .reg_vc_selz_h_mep2	(reg_vc_selz_h_mep2[7:0]),
					  .reg_vc_selz_h_mep3	(reg_vc_selz_h_mep3[7:0]),
					  .reg_vc_selz_l_mep0	(reg_vc_selz_l_mep0[7:0]),
					  .reg_vc_selz_l_mep1	(reg_vc_selz_l_mep1[7:0]),
					  .reg_vc_selz_l_mep2	(reg_vc_selz_l_mep2[7:0]),
					  .reg_vc_selz_l_mep3	(reg_vc_selz_l_mep3[7:0]),
					  .in_mep0_tunnel_mode_en(gencrc2pktfilter0_tunnel_mode_en), // Templated
					  .in_mep1_tunnel_mode_en(gencrc2pktfilter1_tunnel_mode_en), // Templated
					  .in_mep2_tunnel_mode_en(gencrc2pktfilter2_tunnel_mode_en), // Templated
					  .in_mep3_tunnel_mode_en(gencrc2pktfilter3_tunnel_mode_en)); // Templated

/* as6d_app_pipe_route    AUTO_TEMPLATE(
        .mep\(.*\)_virtual_channel_x(pkt_filter_out_mep\1_virtual_channel[3:2]),
        .mep\(.*\)_bytes_en(pkt_filter_out_mep\1_byte_en[]),
        .mep\(.*\)        (pkt_filter_out_mep\1[]),
        .pipe\(.*\)_bytes_en    (pipe\1_byte_en[]),
        .reg_vprbs\(.*\)lane\(.*\) (reg_vprbs\1lane\2_sync[]),
        .\(.*\)                    (\1[]),
   );*/
as6d_app_pipe_route    u_as6d_app_pipe_route(/*AUTOINST*/
					     // Outputs
					     .pipe0_pkt_crc	(pipe0_pkt_crc[31:0]), // Templated
					     .pipe0_pkt_crc_en	(pipe0_pkt_crc_en), // Templated
					     .pipe1_pkt_crc	(pipe1_pkt_crc[31:0]), // Templated
					     .pipe1_pkt_crc_en	(pipe1_pkt_crc_en), // Templated
					     .pipe2_pkt_crc	(pipe2_pkt_crc[31:0]), // Templated
					     .pipe2_pkt_crc_en	(pipe2_pkt_crc_en), // Templated
					     .pipe3_pkt_crc	(pipe3_pkt_crc[31:0]), // Templated
					     .pipe3_pkt_crc_en	(pipe3_pkt_crc_en), // Templated
					     .pipe4_pkt_crc	(pipe4_pkt_crc[31:0]), // Templated
					     .pipe4_pkt_crc_en	(pipe4_pkt_crc_en), // Templated
					     .pipe5_pkt_crc	(pipe5_pkt_crc[31:0]), // Templated
					     .pipe5_pkt_crc_en	(pipe5_pkt_crc_en), // Templated
					     .pipe6_pkt_crc	(pipe6_pkt_crc[31:0]), // Templated
					     .pipe6_pkt_crc_en	(pipe6_pkt_crc_en), // Templated
					     .pipe7_pkt_crc	(pipe7_pkt_crc[31:0]), // Templated
					     .pipe7_pkt_crc_en	(pipe7_pkt_crc_en), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane0(reg_rd_vprbs_rx_check_app_route_lane0), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane1(reg_rd_vprbs_rx_check_app_route_lane1), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane2(reg_rd_vprbs_rx_check_app_route_lane2), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane3(reg_rd_vprbs_rx_check_app_route_lane3), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane4(reg_rd_vprbs_rx_check_app_route_lane4), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane5(reg_rd_vprbs_rx_check_app_route_lane5), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane6(reg_rd_vprbs_rx_check_app_route_lane6), // Templated
					     .reg_rd_vprbs_rx_check_app_route_lane7(reg_rd_vprbs_rx_check_app_route_lane7), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane0(reg_rd_vprbs_rx_err_app_route_lane0[31:0]), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane1(reg_rd_vprbs_rx_err_app_route_lane1[31:0]), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane2(reg_rd_vprbs_rx_err_app_route_lane2[31:0]), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane3(reg_rd_vprbs_rx_err_app_route_lane3[31:0]), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane4(reg_rd_vprbs_rx_err_app_route_lane4[31:0]), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane5(reg_rd_vprbs_rx_err_app_route_lane5[31:0]), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane6(reg_rd_vprbs_rx_err_app_route_lane6[31:0]), // Templated
					     .reg_rd_vprbs_rx_err_app_route_lane7(reg_rd_vprbs_rx_err_app_route_lane7[31:0]), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane0(reg_rd_vprbs_rx_fail_app_route_lane0), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane1(reg_rd_vprbs_rx_fail_app_route_lane1), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane2(reg_rd_vprbs_rx_fail_app_route_lane2), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane3(reg_rd_vprbs_rx_fail_app_route_lane3), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane4(reg_rd_vprbs_rx_fail_app_route_lane4), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane5(reg_rd_vprbs_rx_fail_app_route_lane5), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane6(reg_rd_vprbs_rx_fail_app_route_lane6), // Templated
					     .reg_rd_vprbs_rx_fail_app_route_lane7(reg_rd_vprbs_rx_fail_app_route_lane7), // Templated
					     .pipe0_csi_data	(pipe0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe0_bytes_en	(pipe0_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe0_header_en	(pipe0_header_en), // Templated
					     .pipe0_data_en	(pipe0_data_en), // Templated
					     .pipe0_data_type	(pipe0_data_type[5:0]), // Templated
					     .pipe0_virtual_channel(pipe0_virtual_channel[1:0]), // Templated
					     .pipe0_virtual_channel_x(pipe0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe0_word_count	(pipe0_word_count[15:0]), // Templated
					     .pipe0_aggr_id	(pipe0_aggr_id[3:0]), // Templated
					     .pipe1_csi_data	(pipe1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe1_bytes_en	(pipe1_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe1_header_en	(pipe1_header_en), // Templated
					     .pipe1_data_en	(pipe1_data_en), // Templated
					     .pipe1_data_type	(pipe1_data_type[5:0]), // Templated
					     .pipe1_virtual_channel(pipe1_virtual_channel[1:0]), // Templated
					     .pipe1_virtual_channel_x(pipe1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe1_word_count	(pipe1_word_count[15:0]), // Templated
					     .pipe1_aggr_id	(pipe1_aggr_id[3:0]), // Templated
					     .pipe2_csi_data	(pipe2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe2_bytes_en	(pipe2_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe2_header_en	(pipe2_header_en), // Templated
					     .pipe2_data_en	(pipe2_data_en), // Templated
					     .pipe2_data_type	(pipe2_data_type[5:0]), // Templated
					     .pipe2_virtual_channel(pipe2_virtual_channel[1:0]), // Templated
					     .pipe2_virtual_channel_x(pipe2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe2_word_count	(pipe2_word_count[15:0]), // Templated
					     .pipe2_aggr_id	(pipe2_aggr_id[3:0]), // Templated
					     .pipe3_csi_data	(pipe3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe3_bytes_en	(pipe3_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe3_header_en	(pipe3_header_en), // Templated
					     .pipe3_data_en	(pipe3_data_en), // Templated
					     .pipe3_data_type	(pipe3_data_type[5:0]), // Templated
					     .pipe3_virtual_channel(pipe3_virtual_channel[1:0]), // Templated
					     .pipe3_virtual_channel_x(pipe3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe3_word_count	(pipe3_word_count[15:0]), // Templated
					     .pipe3_aggr_id	(pipe3_aggr_id[3:0]), // Templated
					     .pipe4_csi_data	(pipe4_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe4_bytes_en	(pipe4_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe4_header_en	(pipe4_header_en), // Templated
					     .pipe4_data_en	(pipe4_data_en), // Templated
					     .pipe4_data_type	(pipe4_data_type[5:0]), // Templated
					     .pipe4_virtual_channel(pipe4_virtual_channel[1:0]), // Templated
					     .pipe4_virtual_channel_x(pipe4_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe4_word_count	(pipe4_word_count[15:0]), // Templated
					     .pipe4_aggr_id	(pipe4_aggr_id[3:0]), // Templated
					     .pipe5_csi_data	(pipe5_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe5_bytes_en	(pipe5_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe5_header_en	(pipe5_header_en), // Templated
					     .pipe5_data_en	(pipe5_data_en), // Templated
					     .pipe5_data_type	(pipe5_data_type[5:0]), // Templated
					     .pipe5_virtual_channel(pipe5_virtual_channel[1:0]), // Templated
					     .pipe5_virtual_channel_x(pipe5_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe5_word_count	(pipe5_word_count[15:0]), // Templated
					     .pipe5_aggr_id	(pipe5_aggr_id[3:0]), // Templated
					     .pipe6_csi_data	(pipe6_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe6_bytes_en	(pipe6_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe6_header_en	(pipe6_header_en), // Templated
					     .pipe6_data_en	(pipe6_data_en), // Templated
					     .pipe6_data_type	(pipe6_data_type[5:0]), // Templated
					     .pipe6_virtual_channel(pipe6_virtual_channel[1:0]), // Templated
					     .pipe6_virtual_channel_x(pipe6_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe6_word_count	(pipe6_word_count[15:0]), // Templated
					     .pipe6_aggr_id	(pipe6_aggr_id[3:0]), // Templated
					     .pipe7_csi_data	(pipe7_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .pipe7_bytes_en	(pipe7_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe7_header_en	(pipe7_header_en), // Templated
					     .pipe7_data_en	(pipe7_data_en), // Templated
					     .pipe7_data_type	(pipe7_data_type[5:0]), // Templated
					     .pipe7_virtual_channel(pipe7_virtual_channel[1:0]), // Templated
					     .pipe7_virtual_channel_x(pipe7_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					     .pipe7_word_count	(pipe7_word_count[15:0]), // Templated
					     .pipe7_aggr_id	(pipe7_aggr_id[3:0]), // Templated
					     // Inputs
					     .mep0_pkt_crc	(pkt_filter_out_mep0_pkt_crc[31:0]), // Templated
					     .mep0_pkt_crc_en	(pkt_filter_out_mep0_pkt_crc_en), // Templated
					     .mep0_tunnel_mode_en(pkt_filter_out_mep0_tunnel_mode_en), // Templated
					     .mep1_pkt_crc	(pkt_filter_out_mep1_pkt_crc[31:0]), // Templated
					     .mep1_pkt_crc_en	(pkt_filter_out_mep1_pkt_crc_en), // Templated
					     .mep1_tunnel_mode_en(pkt_filter_out_mep1_tunnel_mode_en), // Templated
					     .mep2_pkt_crc	(pkt_filter_out_mep2_pkt_crc[31:0]), // Templated
					     .mep2_pkt_crc_en	(pkt_filter_out_mep2_pkt_crc_en), // Templated
					     .mep2_tunnel_mode_en(pkt_filter_out_mep2_tunnel_mode_en), // Templated
					     .mep3_pkt_crc	(pkt_filter_out_mep3_pkt_crc[31:0]), // Templated
					     .mep3_pkt_crc_en	(pkt_filter_out_mep3_pkt_crc_en), // Templated
					     .mep3_tunnel_mode_en(pkt_filter_out_mep3_tunnel_mode_en), // Templated
					     .reg_drop_mapping_fault_pkt(reg_drop_mapping_fault_pkt[7:0]), // Templated
					     .reg_pipe0_drop_ls_le_pkt(reg_pipe0_drop_ls_le_pkt), // Templated
					     .reg_pipe1_drop_ls_le_pkt(reg_pipe1_drop_ls_le_pkt), // Templated
					     .reg_pipe2_drop_ls_le_pkt(reg_pipe2_drop_ls_le_pkt), // Templated
					     .reg_pipe3_drop_ls_le_pkt(reg_pipe3_drop_ls_le_pkt), // Templated
					     .reg_pipe4_drop_ls_le_pkt(reg_pipe4_drop_ls_le_pkt), // Templated
					     .reg_pipe5_drop_ls_le_pkt(reg_pipe5_drop_ls_le_pkt), // Templated
					     .reg_pipe6_drop_ls_le_pkt(reg_pipe6_drop_ls_le_pkt), // Templated
					     .reg_pipe7_drop_ls_le_pkt(reg_pipe7_drop_ls_le_pkt), // Templated
					     .reg_vprbs_loopback_app_route_lane0(reg_vprbs_loopback_app_route_lane0_sync), // Templated
					     .reg_vprbs_loopback_app_route_lane1(reg_vprbs_loopback_app_route_lane1_sync), // Templated
					     .reg_vprbs_loopback_app_route_lane2(reg_vprbs_loopback_app_route_lane2_sync), // Templated
					     .reg_vprbs_loopback_app_route_lane3(reg_vprbs_loopback_app_route_lane3_sync), // Templated
					     .reg_vprbs_loopback_app_route_lane4(reg_vprbs_loopback_app_route_lane4_sync), // Templated
					     .reg_vprbs_loopback_app_route_lane5(reg_vprbs_loopback_app_route_lane5_sync), // Templated
					     .reg_vprbs_loopback_app_route_lane6(reg_vprbs_loopback_app_route_lane6_sync), // Templated
					     .reg_vprbs_loopback_app_route_lane7(reg_vprbs_loopback_app_route_lane7_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane0(reg_vprbs_rx_chk_en_app_route_lane0_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane1(reg_vprbs_rx_chk_en_app_route_lane1_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane2(reg_vprbs_rx_chk_en_app_route_lane2_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane3(reg_vprbs_rx_chk_en_app_route_lane3_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane4(reg_vprbs_rx_chk_en_app_route_lane4_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane5(reg_vprbs_rx_chk_en_app_route_lane5_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane6(reg_vprbs_rx_chk_en_app_route_lane6_sync), // Templated
					     .reg_vprbs_rx_chk_en_app_route_lane7(reg_vprbs_rx_chk_en_app_route_lane7_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane0(reg_vprbs_rx_err_clear_app_route_lane0_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane1(reg_vprbs_rx_err_clear_app_route_lane1_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane2(reg_vprbs_rx_err_clear_app_route_lane2_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane3(reg_vprbs_rx_err_clear_app_route_lane3_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane4(reg_vprbs_rx_err_clear_app_route_lane4_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane5(reg_vprbs_rx_err_clear_app_route_lane5_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane6(reg_vprbs_rx_err_clear_app_route_lane6_sync), // Templated
					     .reg_vprbs_rx_err_clear_app_route_lane7(reg_vprbs_rx_err_clear_app_route_lane7_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane0(reg_vprbs_rx_load_app_route_lane0_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane1(reg_vprbs_rx_load_app_route_lane1_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane2(reg_vprbs_rx_load_app_route_lane2_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane3(reg_vprbs_rx_load_app_route_lane3_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane4(reg_vprbs_rx_load_app_route_lane4_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane5(reg_vprbs_rx_load_app_route_lane5_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane6(reg_vprbs_rx_load_app_route_lane6_sync), // Templated
					     .reg_vprbs_rx_load_app_route_lane7(reg_vprbs_rx_load_app_route_lane7_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane0(reg_vprbs_rx_lock_continue_app_route_lane0_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane1(reg_vprbs_rx_lock_continue_app_route_lane1_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane2(reg_vprbs_rx_lock_continue_app_route_lane2_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane3(reg_vprbs_rx_lock_continue_app_route_lane3_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane4(reg_vprbs_rx_lock_continue_app_route_lane4_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane5(reg_vprbs_rx_lock_continue_app_route_lane5_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane6(reg_vprbs_rx_lock_continue_app_route_lane6_sync), // Templated
					     .reg_vprbs_rx_lock_continue_app_route_lane7(reg_vprbs_rx_lock_continue_app_route_lane7_sync), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane0(reg_vprbs_rx_locked_match_cnt_app_route_lane0_sync[3:0]), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane1(reg_vprbs_rx_locked_match_cnt_app_route_lane1_sync[3:0]), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane2(reg_vprbs_rx_locked_match_cnt_app_route_lane2_sync[3:0]), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane3(reg_vprbs_rx_locked_match_cnt_app_route_lane3_sync[3:0]), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane4(reg_vprbs_rx_locked_match_cnt_app_route_lane4_sync[3:0]), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane5(reg_vprbs_rx_locked_match_cnt_app_route_lane5_sync[3:0]), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane6(reg_vprbs_rx_locked_match_cnt_app_route_lane6_sync[3:0]), // Templated
					     .reg_vprbs_rx_locked_match_cnt_app_route_lane7(reg_vprbs_rx_locked_match_cnt_app_route_lane7_sync[3:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane0(reg_vprbs_rx_mode_app_route_lane0_sync[2:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane1(reg_vprbs_rx_mode_app_route_lane1_sync[2:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane2(reg_vprbs_rx_mode_app_route_lane2_sync[2:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane3(reg_vprbs_rx_mode_app_route_lane3_sync[2:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane4(reg_vprbs_rx_mode_app_route_lane4_sync[2:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane5(reg_vprbs_rx_mode_app_route_lane5_sync[2:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane6(reg_vprbs_rx_mode_app_route_lane6_sync[2:0]), // Templated
					     .reg_vprbs_rx_mode_app_route_lane7(reg_vprbs_rx_mode_app_route_lane7_sync[2:0]), // Templated
					     .reg_vprbs_rx_order_app_route_lane0(reg_vprbs_rx_order_app_route_lane0_sync), // Templated
					     .reg_vprbs_rx_order_app_route_lane1(reg_vprbs_rx_order_app_route_lane1_sync), // Templated
					     .reg_vprbs_rx_order_app_route_lane2(reg_vprbs_rx_order_app_route_lane2_sync), // Templated
					     .reg_vprbs_rx_order_app_route_lane3(reg_vprbs_rx_order_app_route_lane3_sync), // Templated
					     .reg_vprbs_rx_order_app_route_lane4(reg_vprbs_rx_order_app_route_lane4_sync), // Templated
					     .reg_vprbs_rx_order_app_route_lane5(reg_vprbs_rx_order_app_route_lane5_sync), // Templated
					     .reg_vprbs_rx_order_app_route_lane6(reg_vprbs_rx_order_app_route_lane6_sync), // Templated
					     .reg_vprbs_rx_order_app_route_lane7(reg_vprbs_rx_order_app_route_lane7_sync), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane0(reg_vprbs_rx_uncheck_tolerance_app_route_lane0_sync[3:0]), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane1(reg_vprbs_rx_uncheck_tolerance_app_route_lane1_sync[3:0]), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane2(reg_vprbs_rx_uncheck_tolerance_app_route_lane2_sync[3:0]), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane3(reg_vprbs_rx_uncheck_tolerance_app_route_lane3_sync[3:0]), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane4(reg_vprbs_rx_uncheck_tolerance_app_route_lane4_sync[3:0]), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane5(reg_vprbs_rx_uncheck_tolerance_app_route_lane5_sync[3:0]), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane6(reg_vprbs_rx_uncheck_tolerance_app_route_lane6_sync[3:0]), // Templated
					     .reg_vprbs_rx_uncheck_tolerance_app_route_lane7(reg_vprbs_rx_uncheck_tolerance_app_route_lane7_sync[3:0]), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane0(reg_vprbs_tx_err_inject_en_app_route_lane0_sync), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane1(reg_vprbs_tx_err_inject_en_app_route_lane1_sync), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane2(reg_vprbs_tx_err_inject_en_app_route_lane2_sync), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane3(reg_vprbs_tx_err_inject_en_app_route_lane3_sync), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane4(reg_vprbs_tx_err_inject_en_app_route_lane4_sync), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane5(reg_vprbs_tx_err_inject_en_app_route_lane5_sync), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane6(reg_vprbs_tx_err_inject_en_app_route_lane6_sync), // Templated
					     .reg_vprbs_tx_err_inject_en_app_route_lane7(reg_vprbs_tx_err_inject_en_app_route_lane7_sync), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane0(reg_vprbs_tx_err_inject_intv_num_app_route_lane0_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane1(reg_vprbs_tx_err_inject_intv_num_app_route_lane1_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane2(reg_vprbs_tx_err_inject_intv_num_app_route_lane2_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane3(reg_vprbs_tx_err_inject_intv_num_app_route_lane3_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane4(reg_vprbs_tx_err_inject_intv_num_app_route_lane4_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane5(reg_vprbs_tx_err_inject_intv_num_app_route_lane5_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane6(reg_vprbs_tx_err_inject_intv_num_app_route_lane6_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_num_app_route_lane7(reg_vprbs_tx_err_inject_intv_num_app_route_lane7_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane0(reg_vprbs_tx_err_inject_intv_time_app_route_lane0_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane1(reg_vprbs_tx_err_inject_intv_time_app_route_lane1_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane2(reg_vprbs_tx_err_inject_intv_time_app_route_lane2_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane3(reg_vprbs_tx_err_inject_intv_time_app_route_lane3_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane4(reg_vprbs_tx_err_inject_intv_time_app_route_lane4_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane5(reg_vprbs_tx_err_inject_intv_time_app_route_lane5_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane6(reg_vprbs_tx_err_inject_intv_time_app_route_lane6_sync[7:0]), // Templated
					     .reg_vprbs_tx_err_inject_intv_time_app_route_lane7(reg_vprbs_tx_err_inject_intv_time_app_route_lane7_sync[7:0]), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane0(reg_vprbs_tx_gen_en_app_route_lane0_sync), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane1(reg_vprbs_tx_gen_en_app_route_lane1_sync), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane2(reg_vprbs_tx_gen_en_app_route_lane2_sync), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane3(reg_vprbs_tx_gen_en_app_route_lane3_sync), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane4(reg_vprbs_tx_gen_en_app_route_lane4_sync), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane5(reg_vprbs_tx_gen_en_app_route_lane5_sync), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane6(reg_vprbs_tx_gen_en_app_route_lane6_sync), // Templated
					     .reg_vprbs_tx_gen_en_app_route_lane7(reg_vprbs_tx_gen_en_app_route_lane7_sync), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane0(reg_vprbs_tx_idi_driver_data_type_app_route_lane0_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane1(reg_vprbs_tx_idi_driver_data_type_app_route_lane1_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane2(reg_vprbs_tx_idi_driver_data_type_app_route_lane2_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane3(reg_vprbs_tx_idi_driver_data_type_app_route_lane3_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane4(reg_vprbs_tx_idi_driver_data_type_app_route_lane4_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane5(reg_vprbs_tx_idi_driver_data_type_app_route_lane5_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane6(reg_vprbs_tx_idi_driver_data_type_app_route_lane6_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_data_type_app_route_lane7(reg_vprbs_tx_idi_driver_data_type_app_route_lane7_sync[5:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane0_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane1_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane2_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane3_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane4_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane5_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane6_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7(reg_vprbs_tx_idi_driver_pkt_interval_app_route_lane7_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane0(reg_vprbs_tx_idi_driver_total_interval_app_route_lane0_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane1(reg_vprbs_tx_idi_driver_total_interval_app_route_lane1_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane2(reg_vprbs_tx_idi_driver_total_interval_app_route_lane2_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane3(reg_vprbs_tx_idi_driver_total_interval_app_route_lane3_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane4(reg_vprbs_tx_idi_driver_total_interval_app_route_lane4_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane5(reg_vprbs_tx_idi_driver_total_interval_app_route_lane5_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane6(reg_vprbs_tx_idi_driver_total_interval_app_route_lane6_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_total_interval_app_route_lane7(reg_vprbs_tx_idi_driver_total_interval_app_route_lane7_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane0_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane1_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane2_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane3_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane4_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane5_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane6_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7(reg_vprbs_tx_idi_driver_virtual_channel_app_route_lane7_sync[3:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane0(reg_vprbs_tx_idi_driver_word_count_app_route_lane0_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane1(reg_vprbs_tx_idi_driver_word_count_app_route_lane1_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane2(reg_vprbs_tx_idi_driver_word_count_app_route_lane2_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane3(reg_vprbs_tx_idi_driver_word_count_app_route_lane3_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane4(reg_vprbs_tx_idi_driver_word_count_app_route_lane4_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane5(reg_vprbs_tx_idi_driver_word_count_app_route_lane5_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane6(reg_vprbs_tx_idi_driver_word_count_app_route_lane6_sync[15:0]), // Templated
					     .reg_vprbs_tx_idi_driver_word_count_app_route_lane7(reg_vprbs_tx_idi_driver_word_count_app_route_lane7_sync[15:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane0(reg_vprbs_tx_mode_app_route_lane0_sync[2:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane1(reg_vprbs_tx_mode_app_route_lane1_sync[2:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane2(reg_vprbs_tx_mode_app_route_lane2_sync[2:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane3(reg_vprbs_tx_mode_app_route_lane3_sync[2:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane4(reg_vprbs_tx_mode_app_route_lane4_sync[2:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane5(reg_vprbs_tx_mode_app_route_lane5_sync[2:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane6(reg_vprbs_tx_mode_app_route_lane6_sync[2:0]), // Templated
					     .reg_vprbs_tx_mode_app_route_lane7(reg_vprbs_tx_mode_app_route_lane7_sync[2:0]), // Templated
					     .reg_vprbs_tx_order_app_route_lane0(reg_vprbs_tx_order_app_route_lane0_sync), // Templated
					     .reg_vprbs_tx_order_app_route_lane1(reg_vprbs_tx_order_app_route_lane1_sync), // Templated
					     .reg_vprbs_tx_order_app_route_lane2(reg_vprbs_tx_order_app_route_lane2_sync), // Templated
					     .reg_vprbs_tx_order_app_route_lane3(reg_vprbs_tx_order_app_route_lane3_sync), // Templated
					     .reg_vprbs_tx_order_app_route_lane4(reg_vprbs_tx_order_app_route_lane4_sync), // Templated
					     .reg_vprbs_tx_order_app_route_lane5(reg_vprbs_tx_order_app_route_lane5_sync), // Templated
					     .reg_vprbs_tx_order_app_route_lane6(reg_vprbs_tx_order_app_route_lane6_sync), // Templated
					     .reg_vprbs_tx_order_app_route_lane7(reg_vprbs_tx_order_app_route_lane7_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane0(reg_vprbs_tx_pat_reset_app_route_lane0_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane1(reg_vprbs_tx_pat_reset_app_route_lane1_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane2(reg_vprbs_tx_pat_reset_app_route_lane2_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane3(reg_vprbs_tx_pat_reset_app_route_lane3_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane4(reg_vprbs_tx_pat_reset_app_route_lane4_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane5(reg_vprbs_tx_pat_reset_app_route_lane5_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane6(reg_vprbs_tx_pat_reset_app_route_lane6_sync), // Templated
					     .reg_vprbs_tx_pat_reset_app_route_lane7(reg_vprbs_tx_pat_reset_app_route_lane7_sync), // Templated
					     .fifo_wrclk0	(fifo_wrclk0),	 // Templated
					     .fifo_wrclk1	(fifo_wrclk1),	 // Templated
					     .fifo_wrclk2	(fifo_wrclk2),	 // Templated
					     .fifo_wrclk3	(fifo_wrclk3),	 // Templated
					     .fifo_wrclk4	(fifo_wrclk4),	 // Templated
					     .fifo_wrclk5	(fifo_wrclk5),	 // Templated
					     .fifo_wrclk6	(fifo_wrclk6),	 // Templated
					     .fifo_wrclk7	(fifo_wrclk7),	 // Templated
					     .fifo_wrclk_rst_n0	(fifo_wrclk_rst_n0), // Templated
					     .fifo_wrclk_rst_n1	(fifo_wrclk_rst_n1), // Templated
					     .fifo_wrclk_rst_n2	(fifo_wrclk_rst_n2), // Templated
					     .fifo_wrclk_rst_n3	(fifo_wrclk_rst_n3), // Templated
					     .fifo_wrclk_rst_n4	(fifo_wrclk_rst_n4), // Templated
					     .fifo_wrclk_rst_n5	(fifo_wrclk_rst_n5), // Templated
					     .fifo_wrclk_rst_n6	(fifo_wrclk_rst_n6), // Templated
					     .fifo_wrclk_rst_n7	(fifo_wrclk_rst_n7), // Templated
					     .pipe0_wr_mode	(pipe0_wr_mode[1:0]), // Templated
					     .reg_pipe0_stream_sel(reg_pipe0_stream_sel[1:0]), // Templated
					     .reg_pipe0_map_en	(reg_pipe0_map_en[15:0]), // Templated
					     .reg_pipe0_map0_aggr_id(reg_pipe0_map0_aggr_id[3:0]), // Templated
					     .reg_pipe0_map1_aggr_id(reg_pipe0_map1_aggr_id[3:0]), // Templated
					     .reg_pipe0_map2_aggr_id(reg_pipe0_map2_aggr_id[3:0]), // Templated
					     .reg_pipe0_map3_aggr_id(reg_pipe0_map3_aggr_id[3:0]), // Templated
					     .reg_pipe0_map4_aggr_id(reg_pipe0_map4_aggr_id[3:0]), // Templated
					     .reg_pipe0_map5_aggr_id(reg_pipe0_map5_aggr_id[3:0]), // Templated
					     .reg_pipe0_map6_aggr_id(reg_pipe0_map6_aggr_id[3:0]), // Templated
					     .reg_pipe0_map7_aggr_id(reg_pipe0_map7_aggr_id[3:0]), // Templated
					     .reg_pipe0_map8_aggr_id(reg_pipe0_map8_aggr_id[3:0]), // Templated
					     .reg_pipe0_map9_aggr_id(reg_pipe0_map9_aggr_id[3:0]), // Templated
					     .reg_pipe0_map10_aggr_id(reg_pipe0_map10_aggr_id[3:0]), // Templated
					     .reg_pipe0_map11_aggr_id(reg_pipe0_map11_aggr_id[3:0]), // Templated
					     .reg_pipe0_map12_aggr_id(reg_pipe0_map12_aggr_id[3:0]), // Templated
					     .reg_pipe0_map13_aggr_id(reg_pipe0_map13_aggr_id[3:0]), // Templated
					     .reg_pipe0_map14_aggr_id(reg_pipe0_map14_aggr_id[3:0]), // Templated
					     .reg_pipe0_map15_aggr_id(reg_pipe0_map15_aggr_id[3:0]), // Templated
					     .reg_pipe0_map0_vc_source(reg_pipe0_map0_vc_source[1:0]), // Templated
					     .reg_pipe0_map1_vc_source(reg_pipe0_map1_vc_source[1:0]), // Templated
					     .reg_pipe0_map2_vc_source(reg_pipe0_map2_vc_source[1:0]), // Templated
					     .reg_pipe0_map3_vc_source(reg_pipe0_map3_vc_source[1:0]), // Templated
					     .reg_pipe0_map4_vc_source(reg_pipe0_map4_vc_source[1:0]), // Templated
					     .reg_pipe0_map5_vc_source(reg_pipe0_map5_vc_source[1:0]), // Templated
					     .reg_pipe0_map6_vc_source(reg_pipe0_map6_vc_source[1:0]), // Templated
					     .reg_pipe0_map7_vc_source(reg_pipe0_map7_vc_source[1:0]), // Templated
					     .reg_pipe0_map8_vc_source(reg_pipe0_map8_vc_source[1:0]), // Templated
					     .reg_pipe0_map9_vc_source(reg_pipe0_map9_vc_source[1:0]), // Templated
					     .reg_pipe0_map10_vc_source(reg_pipe0_map10_vc_source[1:0]), // Templated
					     .reg_pipe0_map11_vc_source(reg_pipe0_map11_vc_source[1:0]), // Templated
					     .reg_pipe0_map12_vc_source(reg_pipe0_map12_vc_source[1:0]), // Templated
					     .reg_pipe0_map13_vc_source(reg_pipe0_map13_vc_source[1:0]), // Templated
					     .reg_pipe0_map14_vc_source(reg_pipe0_map14_vc_source[1:0]), // Templated
					     .reg_pipe0_map15_vc_source(reg_pipe0_map15_vc_source[1:0]), // Templated
					     .reg_pipe0_map0_vc_dest(reg_pipe0_map0_vc_dest[1:0]), // Templated
					     .reg_pipe0_map1_vc_dest(reg_pipe0_map1_vc_dest[1:0]), // Templated
					     .reg_pipe0_map2_vc_dest(reg_pipe0_map2_vc_dest[1:0]), // Templated
					     .reg_pipe0_map3_vc_dest(reg_pipe0_map3_vc_dest[1:0]), // Templated
					     .reg_pipe0_map4_vc_dest(reg_pipe0_map4_vc_dest[1:0]), // Templated
					     .reg_pipe0_map5_vc_dest(reg_pipe0_map5_vc_dest[1:0]), // Templated
					     .reg_pipe0_map6_vc_dest(reg_pipe0_map6_vc_dest[1:0]), // Templated
					     .reg_pipe0_map7_vc_dest(reg_pipe0_map7_vc_dest[1:0]), // Templated
					     .reg_pipe0_map8_vc_dest(reg_pipe0_map8_vc_dest[1:0]), // Templated
					     .reg_pipe0_map9_vc_dest(reg_pipe0_map9_vc_dest[1:0]), // Templated
					     .reg_pipe0_map10_vc_dest(reg_pipe0_map10_vc_dest[1:0]), // Templated
					     .reg_pipe0_map11_vc_dest(reg_pipe0_map11_vc_dest[1:0]), // Templated
					     .reg_pipe0_map12_vc_dest(reg_pipe0_map12_vc_dest[1:0]), // Templated
					     .reg_pipe0_map13_vc_dest(reg_pipe0_map13_vc_dest[1:0]), // Templated
					     .reg_pipe0_map14_vc_dest(reg_pipe0_map14_vc_dest[1:0]), // Templated
					     .reg_pipe0_map15_vc_dest(reg_pipe0_map15_vc_dest[1:0]), // Templated
					     .reg_pipe0_map0_dt_source(reg_pipe0_map0_dt_source[5:0]), // Templated
					     .reg_pipe0_map1_dt_source(reg_pipe0_map1_dt_source[5:0]), // Templated
					     .reg_pipe0_map2_dt_source(reg_pipe0_map2_dt_source[5:0]), // Templated
					     .reg_pipe0_map3_dt_source(reg_pipe0_map3_dt_source[5:0]), // Templated
					     .reg_pipe0_map4_dt_source(reg_pipe0_map4_dt_source[5:0]), // Templated
					     .reg_pipe0_map5_dt_source(reg_pipe0_map5_dt_source[5:0]), // Templated
					     .reg_pipe0_map6_dt_source(reg_pipe0_map6_dt_source[5:0]), // Templated
					     .reg_pipe0_map7_dt_source(reg_pipe0_map7_dt_source[5:0]), // Templated
					     .reg_pipe0_map8_dt_source(reg_pipe0_map8_dt_source[5:0]), // Templated
					     .reg_pipe0_map9_dt_source(reg_pipe0_map9_dt_source[5:0]), // Templated
					     .reg_pipe0_map10_dt_source(reg_pipe0_map10_dt_source[5:0]), // Templated
					     .reg_pipe0_map11_dt_source(reg_pipe0_map11_dt_source[5:0]), // Templated
					     .reg_pipe0_map12_dt_source(reg_pipe0_map12_dt_source[5:0]), // Templated
					     .reg_pipe0_map13_dt_source(reg_pipe0_map13_dt_source[5:0]), // Templated
					     .reg_pipe0_map14_dt_source(reg_pipe0_map14_dt_source[5:0]), // Templated
					     .reg_pipe0_map15_dt_source(reg_pipe0_map15_dt_source[5:0]), // Templated
					     .reg_pipe0_map0_dt_dest(reg_pipe0_map0_dt_dest[5:0]), // Templated
					     .reg_pipe0_map1_dt_dest(reg_pipe0_map1_dt_dest[5:0]), // Templated
					     .reg_pipe0_map2_dt_dest(reg_pipe0_map2_dt_dest[5:0]), // Templated
					     .reg_pipe0_map3_dt_dest(reg_pipe0_map3_dt_dest[5:0]), // Templated
					     .reg_pipe0_map4_dt_dest(reg_pipe0_map4_dt_dest[5:0]), // Templated
					     .reg_pipe0_map5_dt_dest(reg_pipe0_map5_dt_dest[5:0]), // Templated
					     .reg_pipe0_map6_dt_dest(reg_pipe0_map6_dt_dest[5:0]), // Templated
					     .reg_pipe0_map7_dt_dest(reg_pipe0_map7_dt_dest[5:0]), // Templated
					     .reg_pipe0_map8_dt_dest(reg_pipe0_map8_dt_dest[5:0]), // Templated
					     .reg_pipe0_map9_dt_dest(reg_pipe0_map9_dt_dest[5:0]), // Templated
					     .reg_pipe0_map10_dt_dest(reg_pipe0_map10_dt_dest[5:0]), // Templated
					     .reg_pipe0_map11_dt_dest(reg_pipe0_map11_dt_dest[5:0]), // Templated
					     .reg_pipe0_map12_dt_dest(reg_pipe0_map12_dt_dest[5:0]), // Templated
					     .reg_pipe0_map13_dt_dest(reg_pipe0_map13_dt_dest[5:0]), // Templated
					     .reg_pipe0_map14_dt_dest(reg_pipe0_map14_dt_dest[5:0]), // Templated
					     .reg_pipe0_map15_dt_dest(reg_pipe0_map15_dt_dest[5:0]), // Templated
					     .pipe1_wr_mode	(pipe1_wr_mode[1:0]), // Templated
					     .reg_pipe1_stream_sel(reg_pipe1_stream_sel[1:0]), // Templated
					     .reg_pipe1_map_en	(reg_pipe1_map_en[15:0]), // Templated
					     .reg_pipe1_map0_aggr_id(reg_pipe1_map0_aggr_id[3:0]), // Templated
					     .reg_pipe1_map1_aggr_id(reg_pipe1_map1_aggr_id[3:0]), // Templated
					     .reg_pipe1_map2_aggr_id(reg_pipe1_map2_aggr_id[3:0]), // Templated
					     .reg_pipe1_map3_aggr_id(reg_pipe1_map3_aggr_id[3:0]), // Templated
					     .reg_pipe1_map4_aggr_id(reg_pipe1_map4_aggr_id[3:0]), // Templated
					     .reg_pipe1_map5_aggr_id(reg_pipe1_map5_aggr_id[3:0]), // Templated
					     .reg_pipe1_map6_aggr_id(reg_pipe1_map6_aggr_id[3:0]), // Templated
					     .reg_pipe1_map7_aggr_id(reg_pipe1_map7_aggr_id[3:0]), // Templated
					     .reg_pipe1_map8_aggr_id(reg_pipe1_map8_aggr_id[3:0]), // Templated
					     .reg_pipe1_map9_aggr_id(reg_pipe1_map9_aggr_id[3:0]), // Templated
					     .reg_pipe1_map10_aggr_id(reg_pipe1_map10_aggr_id[3:0]), // Templated
					     .reg_pipe1_map11_aggr_id(reg_pipe1_map11_aggr_id[3:0]), // Templated
					     .reg_pipe1_map12_aggr_id(reg_pipe1_map12_aggr_id[3:0]), // Templated
					     .reg_pipe1_map13_aggr_id(reg_pipe1_map13_aggr_id[3:0]), // Templated
					     .reg_pipe1_map14_aggr_id(reg_pipe1_map14_aggr_id[3:0]), // Templated
					     .reg_pipe1_map15_aggr_id(reg_pipe1_map15_aggr_id[3:0]), // Templated
					     .reg_pipe1_map0_vc_source(reg_pipe1_map0_vc_source[1:0]), // Templated
					     .reg_pipe1_map1_vc_source(reg_pipe1_map1_vc_source[1:0]), // Templated
					     .reg_pipe1_map2_vc_source(reg_pipe1_map2_vc_source[1:0]), // Templated
					     .reg_pipe1_map3_vc_source(reg_pipe1_map3_vc_source[1:0]), // Templated
					     .reg_pipe1_map4_vc_source(reg_pipe1_map4_vc_source[1:0]), // Templated
					     .reg_pipe1_map5_vc_source(reg_pipe1_map5_vc_source[1:0]), // Templated
					     .reg_pipe1_map6_vc_source(reg_pipe1_map6_vc_source[1:0]), // Templated
					     .reg_pipe1_map7_vc_source(reg_pipe1_map7_vc_source[1:0]), // Templated
					     .reg_pipe1_map8_vc_source(reg_pipe1_map8_vc_source[1:0]), // Templated
					     .reg_pipe1_map9_vc_source(reg_pipe1_map9_vc_source[1:0]), // Templated
					     .reg_pipe1_map10_vc_source(reg_pipe1_map10_vc_source[1:0]), // Templated
					     .reg_pipe1_map11_vc_source(reg_pipe1_map11_vc_source[1:0]), // Templated
					     .reg_pipe1_map12_vc_source(reg_pipe1_map12_vc_source[1:0]), // Templated
					     .reg_pipe1_map13_vc_source(reg_pipe1_map13_vc_source[1:0]), // Templated
					     .reg_pipe1_map14_vc_source(reg_pipe1_map14_vc_source[1:0]), // Templated
					     .reg_pipe1_map15_vc_source(reg_pipe1_map15_vc_source[1:0]), // Templated
					     .reg_pipe1_map0_vc_dest(reg_pipe1_map0_vc_dest[1:0]), // Templated
					     .reg_pipe1_map1_vc_dest(reg_pipe1_map1_vc_dest[1:0]), // Templated
					     .reg_pipe1_map2_vc_dest(reg_pipe1_map2_vc_dest[1:0]), // Templated
					     .reg_pipe1_map3_vc_dest(reg_pipe1_map3_vc_dest[1:0]), // Templated
					     .reg_pipe1_map4_vc_dest(reg_pipe1_map4_vc_dest[1:0]), // Templated
					     .reg_pipe1_map5_vc_dest(reg_pipe1_map5_vc_dest[1:0]), // Templated
					     .reg_pipe1_map6_vc_dest(reg_pipe1_map6_vc_dest[1:0]), // Templated
					     .reg_pipe1_map7_vc_dest(reg_pipe1_map7_vc_dest[1:0]), // Templated
					     .reg_pipe1_map8_vc_dest(reg_pipe1_map8_vc_dest[1:0]), // Templated
					     .reg_pipe1_map9_vc_dest(reg_pipe1_map9_vc_dest[1:0]), // Templated
					     .reg_pipe1_map10_vc_dest(reg_pipe1_map10_vc_dest[1:0]), // Templated
					     .reg_pipe1_map11_vc_dest(reg_pipe1_map11_vc_dest[1:0]), // Templated
					     .reg_pipe1_map12_vc_dest(reg_pipe1_map12_vc_dest[1:0]), // Templated
					     .reg_pipe1_map13_vc_dest(reg_pipe1_map13_vc_dest[1:0]), // Templated
					     .reg_pipe1_map14_vc_dest(reg_pipe1_map14_vc_dest[1:0]), // Templated
					     .reg_pipe1_map15_vc_dest(reg_pipe1_map15_vc_dest[1:0]), // Templated
					     .reg_pipe1_map0_dt_source(reg_pipe1_map0_dt_source[5:0]), // Templated
					     .reg_pipe1_map1_dt_source(reg_pipe1_map1_dt_source[5:0]), // Templated
					     .reg_pipe1_map2_dt_source(reg_pipe1_map2_dt_source[5:0]), // Templated
					     .reg_pipe1_map3_dt_source(reg_pipe1_map3_dt_source[5:0]), // Templated
					     .reg_pipe1_map4_dt_source(reg_pipe1_map4_dt_source[5:0]), // Templated
					     .reg_pipe1_map5_dt_source(reg_pipe1_map5_dt_source[5:0]), // Templated
					     .reg_pipe1_map6_dt_source(reg_pipe1_map6_dt_source[5:0]), // Templated
					     .reg_pipe1_map7_dt_source(reg_pipe1_map7_dt_source[5:0]), // Templated
					     .reg_pipe1_map8_dt_source(reg_pipe1_map8_dt_source[5:0]), // Templated
					     .reg_pipe1_map9_dt_source(reg_pipe1_map9_dt_source[5:0]), // Templated
					     .reg_pipe1_map10_dt_source(reg_pipe1_map10_dt_source[5:0]), // Templated
					     .reg_pipe1_map11_dt_source(reg_pipe1_map11_dt_source[5:0]), // Templated
					     .reg_pipe1_map12_dt_source(reg_pipe1_map12_dt_source[5:0]), // Templated
					     .reg_pipe1_map13_dt_source(reg_pipe1_map13_dt_source[5:0]), // Templated
					     .reg_pipe1_map14_dt_source(reg_pipe1_map14_dt_source[5:0]), // Templated
					     .reg_pipe1_map15_dt_source(reg_pipe1_map15_dt_source[5:0]), // Templated
					     .reg_pipe1_map0_dt_dest(reg_pipe1_map0_dt_dest[5:0]), // Templated
					     .reg_pipe1_map1_dt_dest(reg_pipe1_map1_dt_dest[5:0]), // Templated
					     .reg_pipe1_map2_dt_dest(reg_pipe1_map2_dt_dest[5:0]), // Templated
					     .reg_pipe1_map3_dt_dest(reg_pipe1_map3_dt_dest[5:0]), // Templated
					     .reg_pipe1_map4_dt_dest(reg_pipe1_map4_dt_dest[5:0]), // Templated
					     .reg_pipe1_map5_dt_dest(reg_pipe1_map5_dt_dest[5:0]), // Templated
					     .reg_pipe1_map6_dt_dest(reg_pipe1_map6_dt_dest[5:0]), // Templated
					     .reg_pipe1_map7_dt_dest(reg_pipe1_map7_dt_dest[5:0]), // Templated
					     .reg_pipe1_map8_dt_dest(reg_pipe1_map8_dt_dest[5:0]), // Templated
					     .reg_pipe1_map9_dt_dest(reg_pipe1_map9_dt_dest[5:0]), // Templated
					     .reg_pipe1_map10_dt_dest(reg_pipe1_map10_dt_dest[5:0]), // Templated
					     .reg_pipe1_map11_dt_dest(reg_pipe1_map11_dt_dest[5:0]), // Templated
					     .reg_pipe1_map12_dt_dest(reg_pipe1_map12_dt_dest[5:0]), // Templated
					     .reg_pipe1_map13_dt_dest(reg_pipe1_map13_dt_dest[5:0]), // Templated
					     .reg_pipe1_map14_dt_dest(reg_pipe1_map14_dt_dest[5:0]), // Templated
					     .reg_pipe1_map15_dt_dest(reg_pipe1_map15_dt_dest[5:0]), // Templated
					     .pipe2_wr_mode	(pipe2_wr_mode[1:0]), // Templated
					     .reg_pipe2_stream_sel(reg_pipe2_stream_sel[1:0]), // Templated
					     .reg_pipe2_map_en	(reg_pipe2_map_en[15:0]), // Templated
					     .reg_pipe2_map0_aggr_id(reg_pipe2_map0_aggr_id[3:0]), // Templated
					     .reg_pipe2_map1_aggr_id(reg_pipe2_map1_aggr_id[3:0]), // Templated
					     .reg_pipe2_map2_aggr_id(reg_pipe2_map2_aggr_id[3:0]), // Templated
					     .reg_pipe2_map3_aggr_id(reg_pipe2_map3_aggr_id[3:0]), // Templated
					     .reg_pipe2_map4_aggr_id(reg_pipe2_map4_aggr_id[3:0]), // Templated
					     .reg_pipe2_map5_aggr_id(reg_pipe2_map5_aggr_id[3:0]), // Templated
					     .reg_pipe2_map6_aggr_id(reg_pipe2_map6_aggr_id[3:0]), // Templated
					     .reg_pipe2_map7_aggr_id(reg_pipe2_map7_aggr_id[3:0]), // Templated
					     .reg_pipe2_map8_aggr_id(reg_pipe2_map8_aggr_id[3:0]), // Templated
					     .reg_pipe2_map9_aggr_id(reg_pipe2_map9_aggr_id[3:0]), // Templated
					     .reg_pipe2_map10_aggr_id(reg_pipe2_map10_aggr_id[3:0]), // Templated
					     .reg_pipe2_map11_aggr_id(reg_pipe2_map11_aggr_id[3:0]), // Templated
					     .reg_pipe2_map12_aggr_id(reg_pipe2_map12_aggr_id[3:0]), // Templated
					     .reg_pipe2_map13_aggr_id(reg_pipe2_map13_aggr_id[3:0]), // Templated
					     .reg_pipe2_map14_aggr_id(reg_pipe2_map14_aggr_id[3:0]), // Templated
					     .reg_pipe2_map15_aggr_id(reg_pipe2_map15_aggr_id[3:0]), // Templated
					     .reg_pipe2_map0_vc_source(reg_pipe2_map0_vc_source[1:0]), // Templated
					     .reg_pipe2_map1_vc_source(reg_pipe2_map1_vc_source[1:0]), // Templated
					     .reg_pipe2_map2_vc_source(reg_pipe2_map2_vc_source[1:0]), // Templated
					     .reg_pipe2_map3_vc_source(reg_pipe2_map3_vc_source[1:0]), // Templated
					     .reg_pipe2_map4_vc_source(reg_pipe2_map4_vc_source[1:0]), // Templated
					     .reg_pipe2_map5_vc_source(reg_pipe2_map5_vc_source[1:0]), // Templated
					     .reg_pipe2_map6_vc_source(reg_pipe2_map6_vc_source[1:0]), // Templated
					     .reg_pipe2_map7_vc_source(reg_pipe2_map7_vc_source[1:0]), // Templated
					     .reg_pipe2_map8_vc_source(reg_pipe2_map8_vc_source[1:0]), // Templated
					     .reg_pipe2_map9_vc_source(reg_pipe2_map9_vc_source[1:0]), // Templated
					     .reg_pipe2_map10_vc_source(reg_pipe2_map10_vc_source[1:0]), // Templated
					     .reg_pipe2_map11_vc_source(reg_pipe2_map11_vc_source[1:0]), // Templated
					     .reg_pipe2_map12_vc_source(reg_pipe2_map12_vc_source[1:0]), // Templated
					     .reg_pipe2_map13_vc_source(reg_pipe2_map13_vc_source[1:0]), // Templated
					     .reg_pipe2_map14_vc_source(reg_pipe2_map14_vc_source[1:0]), // Templated
					     .reg_pipe2_map15_vc_source(reg_pipe2_map15_vc_source[1:0]), // Templated
					     .reg_pipe2_map0_vc_dest(reg_pipe2_map0_vc_dest[1:0]), // Templated
					     .reg_pipe2_map1_vc_dest(reg_pipe2_map1_vc_dest[1:0]), // Templated
					     .reg_pipe2_map2_vc_dest(reg_pipe2_map2_vc_dest[1:0]), // Templated
					     .reg_pipe2_map3_vc_dest(reg_pipe2_map3_vc_dest[1:0]), // Templated
					     .reg_pipe2_map4_vc_dest(reg_pipe2_map4_vc_dest[1:0]), // Templated
					     .reg_pipe2_map5_vc_dest(reg_pipe2_map5_vc_dest[1:0]), // Templated
					     .reg_pipe2_map6_vc_dest(reg_pipe2_map6_vc_dest[1:0]), // Templated
					     .reg_pipe2_map7_vc_dest(reg_pipe2_map7_vc_dest[1:0]), // Templated
					     .reg_pipe2_map8_vc_dest(reg_pipe2_map8_vc_dest[1:0]), // Templated
					     .reg_pipe2_map9_vc_dest(reg_pipe2_map9_vc_dest[1:0]), // Templated
					     .reg_pipe2_map10_vc_dest(reg_pipe2_map10_vc_dest[1:0]), // Templated
					     .reg_pipe2_map11_vc_dest(reg_pipe2_map11_vc_dest[1:0]), // Templated
					     .reg_pipe2_map12_vc_dest(reg_pipe2_map12_vc_dest[1:0]), // Templated
					     .reg_pipe2_map13_vc_dest(reg_pipe2_map13_vc_dest[1:0]), // Templated
					     .reg_pipe2_map14_vc_dest(reg_pipe2_map14_vc_dest[1:0]), // Templated
					     .reg_pipe2_map15_vc_dest(reg_pipe2_map15_vc_dest[1:0]), // Templated
					     .reg_pipe2_map0_dt_source(reg_pipe2_map0_dt_source[5:0]), // Templated
					     .reg_pipe2_map1_dt_source(reg_pipe2_map1_dt_source[5:0]), // Templated
					     .reg_pipe2_map2_dt_source(reg_pipe2_map2_dt_source[5:0]), // Templated
					     .reg_pipe2_map3_dt_source(reg_pipe2_map3_dt_source[5:0]), // Templated
					     .reg_pipe2_map4_dt_source(reg_pipe2_map4_dt_source[5:0]), // Templated
					     .reg_pipe2_map5_dt_source(reg_pipe2_map5_dt_source[5:0]), // Templated
					     .reg_pipe2_map6_dt_source(reg_pipe2_map6_dt_source[5:0]), // Templated
					     .reg_pipe2_map7_dt_source(reg_pipe2_map7_dt_source[5:0]), // Templated
					     .reg_pipe2_map8_dt_source(reg_pipe2_map8_dt_source[5:0]), // Templated
					     .reg_pipe2_map9_dt_source(reg_pipe2_map9_dt_source[5:0]), // Templated
					     .reg_pipe2_map10_dt_source(reg_pipe2_map10_dt_source[5:0]), // Templated
					     .reg_pipe2_map11_dt_source(reg_pipe2_map11_dt_source[5:0]), // Templated
					     .reg_pipe2_map12_dt_source(reg_pipe2_map12_dt_source[5:0]), // Templated
					     .reg_pipe2_map13_dt_source(reg_pipe2_map13_dt_source[5:0]), // Templated
					     .reg_pipe2_map14_dt_source(reg_pipe2_map14_dt_source[5:0]), // Templated
					     .reg_pipe2_map15_dt_source(reg_pipe2_map15_dt_source[5:0]), // Templated
					     .reg_pipe2_map0_dt_dest(reg_pipe2_map0_dt_dest[5:0]), // Templated
					     .reg_pipe2_map1_dt_dest(reg_pipe2_map1_dt_dest[5:0]), // Templated
					     .reg_pipe2_map2_dt_dest(reg_pipe2_map2_dt_dest[5:0]), // Templated
					     .reg_pipe2_map3_dt_dest(reg_pipe2_map3_dt_dest[5:0]), // Templated
					     .reg_pipe2_map4_dt_dest(reg_pipe2_map4_dt_dest[5:0]), // Templated
					     .reg_pipe2_map5_dt_dest(reg_pipe2_map5_dt_dest[5:0]), // Templated
					     .reg_pipe2_map6_dt_dest(reg_pipe2_map6_dt_dest[5:0]), // Templated
					     .reg_pipe2_map7_dt_dest(reg_pipe2_map7_dt_dest[5:0]), // Templated
					     .reg_pipe2_map8_dt_dest(reg_pipe2_map8_dt_dest[5:0]), // Templated
					     .reg_pipe2_map9_dt_dest(reg_pipe2_map9_dt_dest[5:0]), // Templated
					     .reg_pipe2_map10_dt_dest(reg_pipe2_map10_dt_dest[5:0]), // Templated
					     .reg_pipe2_map11_dt_dest(reg_pipe2_map11_dt_dest[5:0]), // Templated
					     .reg_pipe2_map12_dt_dest(reg_pipe2_map12_dt_dest[5:0]), // Templated
					     .reg_pipe2_map13_dt_dest(reg_pipe2_map13_dt_dest[5:0]), // Templated
					     .reg_pipe2_map14_dt_dest(reg_pipe2_map14_dt_dest[5:0]), // Templated
					     .reg_pipe2_map15_dt_dest(reg_pipe2_map15_dt_dest[5:0]), // Templated
					     .pipe3_wr_mode	(pipe3_wr_mode[1:0]), // Templated
					     .reg_pipe3_stream_sel(reg_pipe3_stream_sel[1:0]), // Templated
					     .reg_pipe3_map_en	(reg_pipe3_map_en[15:0]), // Templated
					     .reg_pipe3_map0_aggr_id(reg_pipe3_map0_aggr_id[3:0]), // Templated
					     .reg_pipe3_map1_aggr_id(reg_pipe3_map1_aggr_id[3:0]), // Templated
					     .reg_pipe3_map2_aggr_id(reg_pipe3_map2_aggr_id[3:0]), // Templated
					     .reg_pipe3_map3_aggr_id(reg_pipe3_map3_aggr_id[3:0]), // Templated
					     .reg_pipe3_map4_aggr_id(reg_pipe3_map4_aggr_id[3:0]), // Templated
					     .reg_pipe3_map5_aggr_id(reg_pipe3_map5_aggr_id[3:0]), // Templated
					     .reg_pipe3_map6_aggr_id(reg_pipe3_map6_aggr_id[3:0]), // Templated
					     .reg_pipe3_map7_aggr_id(reg_pipe3_map7_aggr_id[3:0]), // Templated
					     .reg_pipe3_map8_aggr_id(reg_pipe3_map8_aggr_id[3:0]), // Templated
					     .reg_pipe3_map9_aggr_id(reg_pipe3_map9_aggr_id[3:0]), // Templated
					     .reg_pipe3_map10_aggr_id(reg_pipe3_map10_aggr_id[3:0]), // Templated
					     .reg_pipe3_map11_aggr_id(reg_pipe3_map11_aggr_id[3:0]), // Templated
					     .reg_pipe3_map12_aggr_id(reg_pipe3_map12_aggr_id[3:0]), // Templated
					     .reg_pipe3_map13_aggr_id(reg_pipe3_map13_aggr_id[3:0]), // Templated
					     .reg_pipe3_map14_aggr_id(reg_pipe3_map14_aggr_id[3:0]), // Templated
					     .reg_pipe3_map15_aggr_id(reg_pipe3_map15_aggr_id[3:0]), // Templated
					     .reg_pipe3_map0_vc_source(reg_pipe3_map0_vc_source[1:0]), // Templated
					     .reg_pipe3_map1_vc_source(reg_pipe3_map1_vc_source[1:0]), // Templated
					     .reg_pipe3_map2_vc_source(reg_pipe3_map2_vc_source[1:0]), // Templated
					     .reg_pipe3_map3_vc_source(reg_pipe3_map3_vc_source[1:0]), // Templated
					     .reg_pipe3_map4_vc_source(reg_pipe3_map4_vc_source[1:0]), // Templated
					     .reg_pipe3_map5_vc_source(reg_pipe3_map5_vc_source[1:0]), // Templated
					     .reg_pipe3_map6_vc_source(reg_pipe3_map6_vc_source[1:0]), // Templated
					     .reg_pipe3_map7_vc_source(reg_pipe3_map7_vc_source[1:0]), // Templated
					     .reg_pipe3_map8_vc_source(reg_pipe3_map8_vc_source[1:0]), // Templated
					     .reg_pipe3_map9_vc_source(reg_pipe3_map9_vc_source[1:0]), // Templated
					     .reg_pipe3_map10_vc_source(reg_pipe3_map10_vc_source[1:0]), // Templated
					     .reg_pipe3_map11_vc_source(reg_pipe3_map11_vc_source[1:0]), // Templated
					     .reg_pipe3_map12_vc_source(reg_pipe3_map12_vc_source[1:0]), // Templated
					     .reg_pipe3_map13_vc_source(reg_pipe3_map13_vc_source[1:0]), // Templated
					     .reg_pipe3_map14_vc_source(reg_pipe3_map14_vc_source[1:0]), // Templated
					     .reg_pipe3_map15_vc_source(reg_pipe3_map15_vc_source[1:0]), // Templated
					     .reg_pipe3_map0_vc_dest(reg_pipe3_map0_vc_dest[1:0]), // Templated
					     .reg_pipe3_map1_vc_dest(reg_pipe3_map1_vc_dest[1:0]), // Templated
					     .reg_pipe3_map2_vc_dest(reg_pipe3_map2_vc_dest[1:0]), // Templated
					     .reg_pipe3_map3_vc_dest(reg_pipe3_map3_vc_dest[1:0]), // Templated
					     .reg_pipe3_map4_vc_dest(reg_pipe3_map4_vc_dest[1:0]), // Templated
					     .reg_pipe3_map5_vc_dest(reg_pipe3_map5_vc_dest[1:0]), // Templated
					     .reg_pipe3_map6_vc_dest(reg_pipe3_map6_vc_dest[1:0]), // Templated
					     .reg_pipe3_map7_vc_dest(reg_pipe3_map7_vc_dest[1:0]), // Templated
					     .reg_pipe3_map8_vc_dest(reg_pipe3_map8_vc_dest[1:0]), // Templated
					     .reg_pipe3_map9_vc_dest(reg_pipe3_map9_vc_dest[1:0]), // Templated
					     .reg_pipe3_map10_vc_dest(reg_pipe3_map10_vc_dest[1:0]), // Templated
					     .reg_pipe3_map11_vc_dest(reg_pipe3_map11_vc_dest[1:0]), // Templated
					     .reg_pipe3_map12_vc_dest(reg_pipe3_map12_vc_dest[1:0]), // Templated
					     .reg_pipe3_map13_vc_dest(reg_pipe3_map13_vc_dest[1:0]), // Templated
					     .reg_pipe3_map14_vc_dest(reg_pipe3_map14_vc_dest[1:0]), // Templated
					     .reg_pipe3_map15_vc_dest(reg_pipe3_map15_vc_dest[1:0]), // Templated
					     .reg_pipe3_map0_dt_source(reg_pipe3_map0_dt_source[5:0]), // Templated
					     .reg_pipe3_map1_dt_source(reg_pipe3_map1_dt_source[5:0]), // Templated
					     .reg_pipe3_map2_dt_source(reg_pipe3_map2_dt_source[5:0]), // Templated
					     .reg_pipe3_map3_dt_source(reg_pipe3_map3_dt_source[5:0]), // Templated
					     .reg_pipe3_map4_dt_source(reg_pipe3_map4_dt_source[5:0]), // Templated
					     .reg_pipe3_map5_dt_source(reg_pipe3_map5_dt_source[5:0]), // Templated
					     .reg_pipe3_map6_dt_source(reg_pipe3_map6_dt_source[5:0]), // Templated
					     .reg_pipe3_map7_dt_source(reg_pipe3_map7_dt_source[5:0]), // Templated
					     .reg_pipe3_map8_dt_source(reg_pipe3_map8_dt_source[5:0]), // Templated
					     .reg_pipe3_map9_dt_source(reg_pipe3_map9_dt_source[5:0]), // Templated
					     .reg_pipe3_map10_dt_source(reg_pipe3_map10_dt_source[5:0]), // Templated
					     .reg_pipe3_map11_dt_source(reg_pipe3_map11_dt_source[5:0]), // Templated
					     .reg_pipe3_map12_dt_source(reg_pipe3_map12_dt_source[5:0]), // Templated
					     .reg_pipe3_map13_dt_source(reg_pipe3_map13_dt_source[5:0]), // Templated
					     .reg_pipe3_map14_dt_source(reg_pipe3_map14_dt_source[5:0]), // Templated
					     .reg_pipe3_map15_dt_source(reg_pipe3_map15_dt_source[5:0]), // Templated
					     .reg_pipe3_map0_dt_dest(reg_pipe3_map0_dt_dest[5:0]), // Templated
					     .reg_pipe3_map1_dt_dest(reg_pipe3_map1_dt_dest[5:0]), // Templated
					     .reg_pipe3_map2_dt_dest(reg_pipe3_map2_dt_dest[5:0]), // Templated
					     .reg_pipe3_map3_dt_dest(reg_pipe3_map3_dt_dest[5:0]), // Templated
					     .reg_pipe3_map4_dt_dest(reg_pipe3_map4_dt_dest[5:0]), // Templated
					     .reg_pipe3_map5_dt_dest(reg_pipe3_map5_dt_dest[5:0]), // Templated
					     .reg_pipe3_map6_dt_dest(reg_pipe3_map6_dt_dest[5:0]), // Templated
					     .reg_pipe3_map7_dt_dest(reg_pipe3_map7_dt_dest[5:0]), // Templated
					     .reg_pipe3_map8_dt_dest(reg_pipe3_map8_dt_dest[5:0]), // Templated
					     .reg_pipe3_map9_dt_dest(reg_pipe3_map9_dt_dest[5:0]), // Templated
					     .reg_pipe3_map10_dt_dest(reg_pipe3_map10_dt_dest[5:0]), // Templated
					     .reg_pipe3_map11_dt_dest(reg_pipe3_map11_dt_dest[5:0]), // Templated
					     .reg_pipe3_map12_dt_dest(reg_pipe3_map12_dt_dest[5:0]), // Templated
					     .reg_pipe3_map13_dt_dest(reg_pipe3_map13_dt_dest[5:0]), // Templated
					     .reg_pipe3_map14_dt_dest(reg_pipe3_map14_dt_dest[5:0]), // Templated
					     .reg_pipe3_map15_dt_dest(reg_pipe3_map15_dt_dest[5:0]), // Templated
					     .pipe4_wr_mode	(pipe4_wr_mode[1:0]), // Templated
					     .reg_pipe4_stream_sel(reg_pipe4_stream_sel[1:0]), // Templated
					     .reg_pipe4_map_en	(reg_pipe4_map_en[15:0]), // Templated
					     .reg_pipe4_map0_aggr_id(reg_pipe4_map0_aggr_id[3:0]), // Templated
					     .reg_pipe4_map1_aggr_id(reg_pipe4_map1_aggr_id[3:0]), // Templated
					     .reg_pipe4_map2_aggr_id(reg_pipe4_map2_aggr_id[3:0]), // Templated
					     .reg_pipe4_map3_aggr_id(reg_pipe4_map3_aggr_id[3:0]), // Templated
					     .reg_pipe4_map4_aggr_id(reg_pipe4_map4_aggr_id[3:0]), // Templated
					     .reg_pipe4_map5_aggr_id(reg_pipe4_map5_aggr_id[3:0]), // Templated
					     .reg_pipe4_map6_aggr_id(reg_pipe4_map6_aggr_id[3:0]), // Templated
					     .reg_pipe4_map7_aggr_id(reg_pipe4_map7_aggr_id[3:0]), // Templated
					     .reg_pipe4_map8_aggr_id(reg_pipe4_map8_aggr_id[3:0]), // Templated
					     .reg_pipe4_map9_aggr_id(reg_pipe4_map9_aggr_id[3:0]), // Templated
					     .reg_pipe4_map10_aggr_id(reg_pipe4_map10_aggr_id[3:0]), // Templated
					     .reg_pipe4_map11_aggr_id(reg_pipe4_map11_aggr_id[3:0]), // Templated
					     .reg_pipe4_map12_aggr_id(reg_pipe4_map12_aggr_id[3:0]), // Templated
					     .reg_pipe4_map13_aggr_id(reg_pipe4_map13_aggr_id[3:0]), // Templated
					     .reg_pipe4_map14_aggr_id(reg_pipe4_map14_aggr_id[3:0]), // Templated
					     .reg_pipe4_map15_aggr_id(reg_pipe4_map15_aggr_id[3:0]), // Templated
					     .reg_pipe4_map0_vc_source(reg_pipe4_map0_vc_source[1:0]), // Templated
					     .reg_pipe4_map1_vc_source(reg_pipe4_map1_vc_source[1:0]), // Templated
					     .reg_pipe4_map2_vc_source(reg_pipe4_map2_vc_source[1:0]), // Templated
					     .reg_pipe4_map3_vc_source(reg_pipe4_map3_vc_source[1:0]), // Templated
					     .reg_pipe4_map4_vc_source(reg_pipe4_map4_vc_source[1:0]), // Templated
					     .reg_pipe4_map5_vc_source(reg_pipe4_map5_vc_source[1:0]), // Templated
					     .reg_pipe4_map6_vc_source(reg_pipe4_map6_vc_source[1:0]), // Templated
					     .reg_pipe4_map7_vc_source(reg_pipe4_map7_vc_source[1:0]), // Templated
					     .reg_pipe4_map8_vc_source(reg_pipe4_map8_vc_source[1:0]), // Templated
					     .reg_pipe4_map9_vc_source(reg_pipe4_map9_vc_source[1:0]), // Templated
					     .reg_pipe4_map10_vc_source(reg_pipe4_map10_vc_source[1:0]), // Templated
					     .reg_pipe4_map11_vc_source(reg_pipe4_map11_vc_source[1:0]), // Templated
					     .reg_pipe4_map12_vc_source(reg_pipe4_map12_vc_source[1:0]), // Templated
					     .reg_pipe4_map13_vc_source(reg_pipe4_map13_vc_source[1:0]), // Templated
					     .reg_pipe4_map14_vc_source(reg_pipe4_map14_vc_source[1:0]), // Templated
					     .reg_pipe4_map15_vc_source(reg_pipe4_map15_vc_source[1:0]), // Templated
					     .reg_pipe4_map0_vc_dest(reg_pipe4_map0_vc_dest[1:0]), // Templated
					     .reg_pipe4_map1_vc_dest(reg_pipe4_map1_vc_dest[1:0]), // Templated
					     .reg_pipe4_map2_vc_dest(reg_pipe4_map2_vc_dest[1:0]), // Templated
					     .reg_pipe4_map3_vc_dest(reg_pipe4_map3_vc_dest[1:0]), // Templated
					     .reg_pipe4_map4_vc_dest(reg_pipe4_map4_vc_dest[1:0]), // Templated
					     .reg_pipe4_map5_vc_dest(reg_pipe4_map5_vc_dest[1:0]), // Templated
					     .reg_pipe4_map6_vc_dest(reg_pipe4_map6_vc_dest[1:0]), // Templated
					     .reg_pipe4_map7_vc_dest(reg_pipe4_map7_vc_dest[1:0]), // Templated
					     .reg_pipe4_map8_vc_dest(reg_pipe4_map8_vc_dest[1:0]), // Templated
					     .reg_pipe4_map9_vc_dest(reg_pipe4_map9_vc_dest[1:0]), // Templated
					     .reg_pipe4_map10_vc_dest(reg_pipe4_map10_vc_dest[1:0]), // Templated
					     .reg_pipe4_map11_vc_dest(reg_pipe4_map11_vc_dest[1:0]), // Templated
					     .reg_pipe4_map12_vc_dest(reg_pipe4_map12_vc_dest[1:0]), // Templated
					     .reg_pipe4_map13_vc_dest(reg_pipe4_map13_vc_dest[1:0]), // Templated
					     .reg_pipe4_map14_vc_dest(reg_pipe4_map14_vc_dest[1:0]), // Templated
					     .reg_pipe4_map15_vc_dest(reg_pipe4_map15_vc_dest[1:0]), // Templated
					     .reg_pipe4_map0_dt_source(reg_pipe4_map0_dt_source[5:0]), // Templated
					     .reg_pipe4_map1_dt_source(reg_pipe4_map1_dt_source[5:0]), // Templated
					     .reg_pipe4_map2_dt_source(reg_pipe4_map2_dt_source[5:0]), // Templated
					     .reg_pipe4_map3_dt_source(reg_pipe4_map3_dt_source[5:0]), // Templated
					     .reg_pipe4_map4_dt_source(reg_pipe4_map4_dt_source[5:0]), // Templated
					     .reg_pipe4_map5_dt_source(reg_pipe4_map5_dt_source[5:0]), // Templated
					     .reg_pipe4_map6_dt_source(reg_pipe4_map6_dt_source[5:0]), // Templated
					     .reg_pipe4_map7_dt_source(reg_pipe4_map7_dt_source[5:0]), // Templated
					     .reg_pipe4_map8_dt_source(reg_pipe4_map8_dt_source[5:0]), // Templated
					     .reg_pipe4_map9_dt_source(reg_pipe4_map9_dt_source[5:0]), // Templated
					     .reg_pipe4_map10_dt_source(reg_pipe4_map10_dt_source[5:0]), // Templated
					     .reg_pipe4_map11_dt_source(reg_pipe4_map11_dt_source[5:0]), // Templated
					     .reg_pipe4_map12_dt_source(reg_pipe4_map12_dt_source[5:0]), // Templated
					     .reg_pipe4_map13_dt_source(reg_pipe4_map13_dt_source[5:0]), // Templated
					     .reg_pipe4_map14_dt_source(reg_pipe4_map14_dt_source[5:0]), // Templated
					     .reg_pipe4_map15_dt_source(reg_pipe4_map15_dt_source[5:0]), // Templated
					     .reg_pipe4_map0_dt_dest(reg_pipe4_map0_dt_dest[5:0]), // Templated
					     .reg_pipe4_map1_dt_dest(reg_pipe4_map1_dt_dest[5:0]), // Templated
					     .reg_pipe4_map2_dt_dest(reg_pipe4_map2_dt_dest[5:0]), // Templated
					     .reg_pipe4_map3_dt_dest(reg_pipe4_map3_dt_dest[5:0]), // Templated
					     .reg_pipe4_map4_dt_dest(reg_pipe4_map4_dt_dest[5:0]), // Templated
					     .reg_pipe4_map5_dt_dest(reg_pipe4_map5_dt_dest[5:0]), // Templated
					     .reg_pipe4_map6_dt_dest(reg_pipe4_map6_dt_dest[5:0]), // Templated
					     .reg_pipe4_map7_dt_dest(reg_pipe4_map7_dt_dest[5:0]), // Templated
					     .reg_pipe4_map8_dt_dest(reg_pipe4_map8_dt_dest[5:0]), // Templated
					     .reg_pipe4_map9_dt_dest(reg_pipe4_map9_dt_dest[5:0]), // Templated
					     .reg_pipe4_map10_dt_dest(reg_pipe4_map10_dt_dest[5:0]), // Templated
					     .reg_pipe4_map11_dt_dest(reg_pipe4_map11_dt_dest[5:0]), // Templated
					     .reg_pipe4_map12_dt_dest(reg_pipe4_map12_dt_dest[5:0]), // Templated
					     .reg_pipe4_map13_dt_dest(reg_pipe4_map13_dt_dest[5:0]), // Templated
					     .reg_pipe4_map14_dt_dest(reg_pipe4_map14_dt_dest[5:0]), // Templated
					     .reg_pipe4_map15_dt_dest(reg_pipe4_map15_dt_dest[5:0]), // Templated
					     .pipe5_wr_mode	(pipe5_wr_mode[1:0]), // Templated
					     .reg_pipe5_stream_sel(reg_pipe5_stream_sel[1:0]), // Templated
					     .reg_pipe5_map_en	(reg_pipe5_map_en[15:0]), // Templated
					     .reg_pipe5_map0_aggr_id(reg_pipe5_map0_aggr_id[3:0]), // Templated
					     .reg_pipe5_map1_aggr_id(reg_pipe5_map1_aggr_id[3:0]), // Templated
					     .reg_pipe5_map2_aggr_id(reg_pipe5_map2_aggr_id[3:0]), // Templated
					     .reg_pipe5_map3_aggr_id(reg_pipe5_map3_aggr_id[3:0]), // Templated
					     .reg_pipe5_map4_aggr_id(reg_pipe5_map4_aggr_id[3:0]), // Templated
					     .reg_pipe5_map5_aggr_id(reg_pipe5_map5_aggr_id[3:0]), // Templated
					     .reg_pipe5_map6_aggr_id(reg_pipe5_map6_aggr_id[3:0]), // Templated
					     .reg_pipe5_map7_aggr_id(reg_pipe5_map7_aggr_id[3:0]), // Templated
					     .reg_pipe5_map8_aggr_id(reg_pipe5_map8_aggr_id[3:0]), // Templated
					     .reg_pipe5_map9_aggr_id(reg_pipe5_map9_aggr_id[3:0]), // Templated
					     .reg_pipe5_map10_aggr_id(reg_pipe5_map10_aggr_id[3:0]), // Templated
					     .reg_pipe5_map11_aggr_id(reg_pipe5_map11_aggr_id[3:0]), // Templated
					     .reg_pipe5_map12_aggr_id(reg_pipe5_map12_aggr_id[3:0]), // Templated
					     .reg_pipe5_map13_aggr_id(reg_pipe5_map13_aggr_id[3:0]), // Templated
					     .reg_pipe5_map14_aggr_id(reg_pipe5_map14_aggr_id[3:0]), // Templated
					     .reg_pipe5_map15_aggr_id(reg_pipe5_map15_aggr_id[3:0]), // Templated
					     .reg_pipe5_map0_vc_source(reg_pipe5_map0_vc_source[1:0]), // Templated
					     .reg_pipe5_map1_vc_source(reg_pipe5_map1_vc_source[1:0]), // Templated
					     .reg_pipe5_map2_vc_source(reg_pipe5_map2_vc_source[1:0]), // Templated
					     .reg_pipe5_map3_vc_source(reg_pipe5_map3_vc_source[1:0]), // Templated
					     .reg_pipe5_map4_vc_source(reg_pipe5_map4_vc_source[1:0]), // Templated
					     .reg_pipe5_map5_vc_source(reg_pipe5_map5_vc_source[1:0]), // Templated
					     .reg_pipe5_map6_vc_source(reg_pipe5_map6_vc_source[1:0]), // Templated
					     .reg_pipe5_map7_vc_source(reg_pipe5_map7_vc_source[1:0]), // Templated
					     .reg_pipe5_map8_vc_source(reg_pipe5_map8_vc_source[1:0]), // Templated
					     .reg_pipe5_map9_vc_source(reg_pipe5_map9_vc_source[1:0]), // Templated
					     .reg_pipe5_map10_vc_source(reg_pipe5_map10_vc_source[1:0]), // Templated
					     .reg_pipe5_map11_vc_source(reg_pipe5_map11_vc_source[1:0]), // Templated
					     .reg_pipe5_map12_vc_source(reg_pipe5_map12_vc_source[1:0]), // Templated
					     .reg_pipe5_map13_vc_source(reg_pipe5_map13_vc_source[1:0]), // Templated
					     .reg_pipe5_map14_vc_source(reg_pipe5_map14_vc_source[1:0]), // Templated
					     .reg_pipe5_map15_vc_source(reg_pipe5_map15_vc_source[1:0]), // Templated
					     .reg_pipe5_map0_vc_dest(reg_pipe5_map0_vc_dest[1:0]), // Templated
					     .reg_pipe5_map1_vc_dest(reg_pipe5_map1_vc_dest[1:0]), // Templated
					     .reg_pipe5_map2_vc_dest(reg_pipe5_map2_vc_dest[1:0]), // Templated
					     .reg_pipe5_map3_vc_dest(reg_pipe5_map3_vc_dest[1:0]), // Templated
					     .reg_pipe5_map4_vc_dest(reg_pipe5_map4_vc_dest[1:0]), // Templated
					     .reg_pipe5_map5_vc_dest(reg_pipe5_map5_vc_dest[1:0]), // Templated
					     .reg_pipe5_map6_vc_dest(reg_pipe5_map6_vc_dest[1:0]), // Templated
					     .reg_pipe5_map7_vc_dest(reg_pipe5_map7_vc_dest[1:0]), // Templated
					     .reg_pipe5_map8_vc_dest(reg_pipe5_map8_vc_dest[1:0]), // Templated
					     .reg_pipe5_map9_vc_dest(reg_pipe5_map9_vc_dest[1:0]), // Templated
					     .reg_pipe5_map10_vc_dest(reg_pipe5_map10_vc_dest[1:0]), // Templated
					     .reg_pipe5_map11_vc_dest(reg_pipe5_map11_vc_dest[1:0]), // Templated
					     .reg_pipe5_map12_vc_dest(reg_pipe5_map12_vc_dest[1:0]), // Templated
					     .reg_pipe5_map13_vc_dest(reg_pipe5_map13_vc_dest[1:0]), // Templated
					     .reg_pipe5_map14_vc_dest(reg_pipe5_map14_vc_dest[1:0]), // Templated
					     .reg_pipe5_map15_vc_dest(reg_pipe5_map15_vc_dest[1:0]), // Templated
					     .reg_pipe5_map0_dt_source(reg_pipe5_map0_dt_source[5:0]), // Templated
					     .reg_pipe5_map1_dt_source(reg_pipe5_map1_dt_source[5:0]), // Templated
					     .reg_pipe5_map2_dt_source(reg_pipe5_map2_dt_source[5:0]), // Templated
					     .reg_pipe5_map3_dt_source(reg_pipe5_map3_dt_source[5:0]), // Templated
					     .reg_pipe5_map4_dt_source(reg_pipe5_map4_dt_source[5:0]), // Templated
					     .reg_pipe5_map5_dt_source(reg_pipe5_map5_dt_source[5:0]), // Templated
					     .reg_pipe5_map6_dt_source(reg_pipe5_map6_dt_source[5:0]), // Templated
					     .reg_pipe5_map7_dt_source(reg_pipe5_map7_dt_source[5:0]), // Templated
					     .reg_pipe5_map8_dt_source(reg_pipe5_map8_dt_source[5:0]), // Templated
					     .reg_pipe5_map9_dt_source(reg_pipe5_map9_dt_source[5:0]), // Templated
					     .reg_pipe5_map10_dt_source(reg_pipe5_map10_dt_source[5:0]), // Templated
					     .reg_pipe5_map11_dt_source(reg_pipe5_map11_dt_source[5:0]), // Templated
					     .reg_pipe5_map12_dt_source(reg_pipe5_map12_dt_source[5:0]), // Templated
					     .reg_pipe5_map13_dt_source(reg_pipe5_map13_dt_source[5:0]), // Templated
					     .reg_pipe5_map14_dt_source(reg_pipe5_map14_dt_source[5:0]), // Templated
					     .reg_pipe5_map15_dt_source(reg_pipe5_map15_dt_source[5:0]), // Templated
					     .reg_pipe5_map0_dt_dest(reg_pipe5_map0_dt_dest[5:0]), // Templated
					     .reg_pipe5_map1_dt_dest(reg_pipe5_map1_dt_dest[5:0]), // Templated
					     .reg_pipe5_map2_dt_dest(reg_pipe5_map2_dt_dest[5:0]), // Templated
					     .reg_pipe5_map3_dt_dest(reg_pipe5_map3_dt_dest[5:0]), // Templated
					     .reg_pipe5_map4_dt_dest(reg_pipe5_map4_dt_dest[5:0]), // Templated
					     .reg_pipe5_map5_dt_dest(reg_pipe5_map5_dt_dest[5:0]), // Templated
					     .reg_pipe5_map6_dt_dest(reg_pipe5_map6_dt_dest[5:0]), // Templated
					     .reg_pipe5_map7_dt_dest(reg_pipe5_map7_dt_dest[5:0]), // Templated
					     .reg_pipe5_map8_dt_dest(reg_pipe5_map8_dt_dest[5:0]), // Templated
					     .reg_pipe5_map9_dt_dest(reg_pipe5_map9_dt_dest[5:0]), // Templated
					     .reg_pipe5_map10_dt_dest(reg_pipe5_map10_dt_dest[5:0]), // Templated
					     .reg_pipe5_map11_dt_dest(reg_pipe5_map11_dt_dest[5:0]), // Templated
					     .reg_pipe5_map12_dt_dest(reg_pipe5_map12_dt_dest[5:0]), // Templated
					     .reg_pipe5_map13_dt_dest(reg_pipe5_map13_dt_dest[5:0]), // Templated
					     .reg_pipe5_map14_dt_dest(reg_pipe5_map14_dt_dest[5:0]), // Templated
					     .reg_pipe5_map15_dt_dest(reg_pipe5_map15_dt_dest[5:0]), // Templated
					     .pipe6_wr_mode	(pipe6_wr_mode[1:0]), // Templated
					     .reg_pipe6_stream_sel(reg_pipe6_stream_sel[1:0]), // Templated
					     .reg_pipe6_map_en	(reg_pipe6_map_en[15:0]), // Templated
					     .reg_pipe6_map0_aggr_id(reg_pipe6_map0_aggr_id[3:0]), // Templated
					     .reg_pipe6_map1_aggr_id(reg_pipe6_map1_aggr_id[3:0]), // Templated
					     .reg_pipe6_map2_aggr_id(reg_pipe6_map2_aggr_id[3:0]), // Templated
					     .reg_pipe6_map3_aggr_id(reg_pipe6_map3_aggr_id[3:0]), // Templated
					     .reg_pipe6_map4_aggr_id(reg_pipe6_map4_aggr_id[3:0]), // Templated
					     .reg_pipe6_map5_aggr_id(reg_pipe6_map5_aggr_id[3:0]), // Templated
					     .reg_pipe6_map6_aggr_id(reg_pipe6_map6_aggr_id[3:0]), // Templated
					     .reg_pipe6_map7_aggr_id(reg_pipe6_map7_aggr_id[3:0]), // Templated
					     .reg_pipe6_map8_aggr_id(reg_pipe6_map8_aggr_id[3:0]), // Templated
					     .reg_pipe6_map9_aggr_id(reg_pipe6_map9_aggr_id[3:0]), // Templated
					     .reg_pipe6_map10_aggr_id(reg_pipe6_map10_aggr_id[3:0]), // Templated
					     .reg_pipe6_map11_aggr_id(reg_pipe6_map11_aggr_id[3:0]), // Templated
					     .reg_pipe6_map12_aggr_id(reg_pipe6_map12_aggr_id[3:0]), // Templated
					     .reg_pipe6_map13_aggr_id(reg_pipe6_map13_aggr_id[3:0]), // Templated
					     .reg_pipe6_map14_aggr_id(reg_pipe6_map14_aggr_id[3:0]), // Templated
					     .reg_pipe6_map15_aggr_id(reg_pipe6_map15_aggr_id[3:0]), // Templated
					     .reg_pipe6_map0_vc_source(reg_pipe6_map0_vc_source[1:0]), // Templated
					     .reg_pipe6_map1_vc_source(reg_pipe6_map1_vc_source[1:0]), // Templated
					     .reg_pipe6_map2_vc_source(reg_pipe6_map2_vc_source[1:0]), // Templated
					     .reg_pipe6_map3_vc_source(reg_pipe6_map3_vc_source[1:0]), // Templated
					     .reg_pipe6_map4_vc_source(reg_pipe6_map4_vc_source[1:0]), // Templated
					     .reg_pipe6_map5_vc_source(reg_pipe6_map5_vc_source[1:0]), // Templated
					     .reg_pipe6_map6_vc_source(reg_pipe6_map6_vc_source[1:0]), // Templated
					     .reg_pipe6_map7_vc_source(reg_pipe6_map7_vc_source[1:0]), // Templated
					     .reg_pipe6_map8_vc_source(reg_pipe6_map8_vc_source[1:0]), // Templated
					     .reg_pipe6_map9_vc_source(reg_pipe6_map9_vc_source[1:0]), // Templated
					     .reg_pipe6_map10_vc_source(reg_pipe6_map10_vc_source[1:0]), // Templated
					     .reg_pipe6_map11_vc_source(reg_pipe6_map11_vc_source[1:0]), // Templated
					     .reg_pipe6_map12_vc_source(reg_pipe6_map12_vc_source[1:0]), // Templated
					     .reg_pipe6_map13_vc_source(reg_pipe6_map13_vc_source[1:0]), // Templated
					     .reg_pipe6_map14_vc_source(reg_pipe6_map14_vc_source[1:0]), // Templated
					     .reg_pipe6_map15_vc_source(reg_pipe6_map15_vc_source[1:0]), // Templated
					     .reg_pipe6_map0_vc_dest(reg_pipe6_map0_vc_dest[1:0]), // Templated
					     .reg_pipe6_map1_vc_dest(reg_pipe6_map1_vc_dest[1:0]), // Templated
					     .reg_pipe6_map2_vc_dest(reg_pipe6_map2_vc_dest[1:0]), // Templated
					     .reg_pipe6_map3_vc_dest(reg_pipe6_map3_vc_dest[1:0]), // Templated
					     .reg_pipe6_map4_vc_dest(reg_pipe6_map4_vc_dest[1:0]), // Templated
					     .reg_pipe6_map5_vc_dest(reg_pipe6_map5_vc_dest[1:0]), // Templated
					     .reg_pipe6_map6_vc_dest(reg_pipe6_map6_vc_dest[1:0]), // Templated
					     .reg_pipe6_map7_vc_dest(reg_pipe6_map7_vc_dest[1:0]), // Templated
					     .reg_pipe6_map8_vc_dest(reg_pipe6_map8_vc_dest[1:0]), // Templated
					     .reg_pipe6_map9_vc_dest(reg_pipe6_map9_vc_dest[1:0]), // Templated
					     .reg_pipe6_map10_vc_dest(reg_pipe6_map10_vc_dest[1:0]), // Templated
					     .reg_pipe6_map11_vc_dest(reg_pipe6_map11_vc_dest[1:0]), // Templated
					     .reg_pipe6_map12_vc_dest(reg_pipe6_map12_vc_dest[1:0]), // Templated
					     .reg_pipe6_map13_vc_dest(reg_pipe6_map13_vc_dest[1:0]), // Templated
					     .reg_pipe6_map14_vc_dest(reg_pipe6_map14_vc_dest[1:0]), // Templated
					     .reg_pipe6_map15_vc_dest(reg_pipe6_map15_vc_dest[1:0]), // Templated
					     .reg_pipe6_map0_dt_source(reg_pipe6_map0_dt_source[5:0]), // Templated
					     .reg_pipe6_map1_dt_source(reg_pipe6_map1_dt_source[5:0]), // Templated
					     .reg_pipe6_map2_dt_source(reg_pipe6_map2_dt_source[5:0]), // Templated
					     .reg_pipe6_map3_dt_source(reg_pipe6_map3_dt_source[5:0]), // Templated
					     .reg_pipe6_map4_dt_source(reg_pipe6_map4_dt_source[5:0]), // Templated
					     .reg_pipe6_map5_dt_source(reg_pipe6_map5_dt_source[5:0]), // Templated
					     .reg_pipe6_map6_dt_source(reg_pipe6_map6_dt_source[5:0]), // Templated
					     .reg_pipe6_map7_dt_source(reg_pipe6_map7_dt_source[5:0]), // Templated
					     .reg_pipe6_map8_dt_source(reg_pipe6_map8_dt_source[5:0]), // Templated
					     .reg_pipe6_map9_dt_source(reg_pipe6_map9_dt_source[5:0]), // Templated
					     .reg_pipe6_map10_dt_source(reg_pipe6_map10_dt_source[5:0]), // Templated
					     .reg_pipe6_map11_dt_source(reg_pipe6_map11_dt_source[5:0]), // Templated
					     .reg_pipe6_map12_dt_source(reg_pipe6_map12_dt_source[5:0]), // Templated
					     .reg_pipe6_map13_dt_source(reg_pipe6_map13_dt_source[5:0]), // Templated
					     .reg_pipe6_map14_dt_source(reg_pipe6_map14_dt_source[5:0]), // Templated
					     .reg_pipe6_map15_dt_source(reg_pipe6_map15_dt_source[5:0]), // Templated
					     .reg_pipe6_map0_dt_dest(reg_pipe6_map0_dt_dest[5:0]), // Templated
					     .reg_pipe6_map1_dt_dest(reg_pipe6_map1_dt_dest[5:0]), // Templated
					     .reg_pipe6_map2_dt_dest(reg_pipe6_map2_dt_dest[5:0]), // Templated
					     .reg_pipe6_map3_dt_dest(reg_pipe6_map3_dt_dest[5:0]), // Templated
					     .reg_pipe6_map4_dt_dest(reg_pipe6_map4_dt_dest[5:0]), // Templated
					     .reg_pipe6_map5_dt_dest(reg_pipe6_map5_dt_dest[5:0]), // Templated
					     .reg_pipe6_map6_dt_dest(reg_pipe6_map6_dt_dest[5:0]), // Templated
					     .reg_pipe6_map7_dt_dest(reg_pipe6_map7_dt_dest[5:0]), // Templated
					     .reg_pipe6_map8_dt_dest(reg_pipe6_map8_dt_dest[5:0]), // Templated
					     .reg_pipe6_map9_dt_dest(reg_pipe6_map9_dt_dest[5:0]), // Templated
					     .reg_pipe6_map10_dt_dest(reg_pipe6_map10_dt_dest[5:0]), // Templated
					     .reg_pipe6_map11_dt_dest(reg_pipe6_map11_dt_dest[5:0]), // Templated
					     .reg_pipe6_map12_dt_dest(reg_pipe6_map12_dt_dest[5:0]), // Templated
					     .reg_pipe6_map13_dt_dest(reg_pipe6_map13_dt_dest[5:0]), // Templated
					     .reg_pipe6_map14_dt_dest(reg_pipe6_map14_dt_dest[5:0]), // Templated
					     .reg_pipe6_map15_dt_dest(reg_pipe6_map15_dt_dest[5:0]), // Templated
					     .pipe7_wr_mode	(pipe7_wr_mode[1:0]), // Templated
					     .reg_pipe7_stream_sel(reg_pipe7_stream_sel[1:0]), // Templated
					     .reg_pipe7_map_en	(reg_pipe7_map_en[15:0]), // Templated
					     .reg_pipe7_map0_aggr_id(reg_pipe7_map0_aggr_id[3:0]), // Templated
					     .reg_pipe7_map1_aggr_id(reg_pipe7_map1_aggr_id[3:0]), // Templated
					     .reg_pipe7_map2_aggr_id(reg_pipe7_map2_aggr_id[3:0]), // Templated
					     .reg_pipe7_map3_aggr_id(reg_pipe7_map3_aggr_id[3:0]), // Templated
					     .reg_pipe7_map4_aggr_id(reg_pipe7_map4_aggr_id[3:0]), // Templated
					     .reg_pipe7_map5_aggr_id(reg_pipe7_map5_aggr_id[3:0]), // Templated
					     .reg_pipe7_map6_aggr_id(reg_pipe7_map6_aggr_id[3:0]), // Templated
					     .reg_pipe7_map7_aggr_id(reg_pipe7_map7_aggr_id[3:0]), // Templated
					     .reg_pipe7_map8_aggr_id(reg_pipe7_map8_aggr_id[3:0]), // Templated
					     .reg_pipe7_map9_aggr_id(reg_pipe7_map9_aggr_id[3:0]), // Templated
					     .reg_pipe7_map10_aggr_id(reg_pipe7_map10_aggr_id[3:0]), // Templated
					     .reg_pipe7_map11_aggr_id(reg_pipe7_map11_aggr_id[3:0]), // Templated
					     .reg_pipe7_map12_aggr_id(reg_pipe7_map12_aggr_id[3:0]), // Templated
					     .reg_pipe7_map13_aggr_id(reg_pipe7_map13_aggr_id[3:0]), // Templated
					     .reg_pipe7_map14_aggr_id(reg_pipe7_map14_aggr_id[3:0]), // Templated
					     .reg_pipe7_map15_aggr_id(reg_pipe7_map15_aggr_id[3:0]), // Templated
					     .reg_pipe7_map0_vc_source(reg_pipe7_map0_vc_source[1:0]), // Templated
					     .reg_pipe7_map1_vc_source(reg_pipe7_map1_vc_source[1:0]), // Templated
					     .reg_pipe7_map2_vc_source(reg_pipe7_map2_vc_source[1:0]), // Templated
					     .reg_pipe7_map3_vc_source(reg_pipe7_map3_vc_source[1:0]), // Templated
					     .reg_pipe7_map4_vc_source(reg_pipe7_map4_vc_source[1:0]), // Templated
					     .reg_pipe7_map5_vc_source(reg_pipe7_map5_vc_source[1:0]), // Templated
					     .reg_pipe7_map6_vc_source(reg_pipe7_map6_vc_source[1:0]), // Templated
					     .reg_pipe7_map7_vc_source(reg_pipe7_map7_vc_source[1:0]), // Templated
					     .reg_pipe7_map8_vc_source(reg_pipe7_map8_vc_source[1:0]), // Templated
					     .reg_pipe7_map9_vc_source(reg_pipe7_map9_vc_source[1:0]), // Templated
					     .reg_pipe7_map10_vc_source(reg_pipe7_map10_vc_source[1:0]), // Templated
					     .reg_pipe7_map11_vc_source(reg_pipe7_map11_vc_source[1:0]), // Templated
					     .reg_pipe7_map12_vc_source(reg_pipe7_map12_vc_source[1:0]), // Templated
					     .reg_pipe7_map13_vc_source(reg_pipe7_map13_vc_source[1:0]), // Templated
					     .reg_pipe7_map14_vc_source(reg_pipe7_map14_vc_source[1:0]), // Templated
					     .reg_pipe7_map15_vc_source(reg_pipe7_map15_vc_source[1:0]), // Templated
					     .reg_pipe7_map0_vc_dest(reg_pipe7_map0_vc_dest[1:0]), // Templated
					     .reg_pipe7_map1_vc_dest(reg_pipe7_map1_vc_dest[1:0]), // Templated
					     .reg_pipe7_map2_vc_dest(reg_pipe7_map2_vc_dest[1:0]), // Templated
					     .reg_pipe7_map3_vc_dest(reg_pipe7_map3_vc_dest[1:0]), // Templated
					     .reg_pipe7_map4_vc_dest(reg_pipe7_map4_vc_dest[1:0]), // Templated
					     .reg_pipe7_map5_vc_dest(reg_pipe7_map5_vc_dest[1:0]), // Templated
					     .reg_pipe7_map6_vc_dest(reg_pipe7_map6_vc_dest[1:0]), // Templated
					     .reg_pipe7_map7_vc_dest(reg_pipe7_map7_vc_dest[1:0]), // Templated
					     .reg_pipe7_map8_vc_dest(reg_pipe7_map8_vc_dest[1:0]), // Templated
					     .reg_pipe7_map9_vc_dest(reg_pipe7_map9_vc_dest[1:0]), // Templated
					     .reg_pipe7_map10_vc_dest(reg_pipe7_map10_vc_dest[1:0]), // Templated
					     .reg_pipe7_map11_vc_dest(reg_pipe7_map11_vc_dest[1:0]), // Templated
					     .reg_pipe7_map12_vc_dest(reg_pipe7_map12_vc_dest[1:0]), // Templated
					     .reg_pipe7_map13_vc_dest(reg_pipe7_map13_vc_dest[1:0]), // Templated
					     .reg_pipe7_map14_vc_dest(reg_pipe7_map14_vc_dest[1:0]), // Templated
					     .reg_pipe7_map15_vc_dest(reg_pipe7_map15_vc_dest[1:0]), // Templated
					     .reg_pipe7_map0_dt_source(reg_pipe7_map0_dt_source[5:0]), // Templated
					     .reg_pipe7_map1_dt_source(reg_pipe7_map1_dt_source[5:0]), // Templated
					     .reg_pipe7_map2_dt_source(reg_pipe7_map2_dt_source[5:0]), // Templated
					     .reg_pipe7_map3_dt_source(reg_pipe7_map3_dt_source[5:0]), // Templated
					     .reg_pipe7_map4_dt_source(reg_pipe7_map4_dt_source[5:0]), // Templated
					     .reg_pipe7_map5_dt_source(reg_pipe7_map5_dt_source[5:0]), // Templated
					     .reg_pipe7_map6_dt_source(reg_pipe7_map6_dt_source[5:0]), // Templated
					     .reg_pipe7_map7_dt_source(reg_pipe7_map7_dt_source[5:0]), // Templated
					     .reg_pipe7_map8_dt_source(reg_pipe7_map8_dt_source[5:0]), // Templated
					     .reg_pipe7_map9_dt_source(reg_pipe7_map9_dt_source[5:0]), // Templated
					     .reg_pipe7_map10_dt_source(reg_pipe7_map10_dt_source[5:0]), // Templated
					     .reg_pipe7_map11_dt_source(reg_pipe7_map11_dt_source[5:0]), // Templated
					     .reg_pipe7_map12_dt_source(reg_pipe7_map12_dt_source[5:0]), // Templated
					     .reg_pipe7_map13_dt_source(reg_pipe7_map13_dt_source[5:0]), // Templated
					     .reg_pipe7_map14_dt_source(reg_pipe7_map14_dt_source[5:0]), // Templated
					     .reg_pipe7_map15_dt_source(reg_pipe7_map15_dt_source[5:0]), // Templated
					     .reg_pipe7_map0_dt_dest(reg_pipe7_map0_dt_dest[5:0]), // Templated
					     .reg_pipe7_map1_dt_dest(reg_pipe7_map1_dt_dest[5:0]), // Templated
					     .reg_pipe7_map2_dt_dest(reg_pipe7_map2_dt_dest[5:0]), // Templated
					     .reg_pipe7_map3_dt_dest(reg_pipe7_map3_dt_dest[5:0]), // Templated
					     .reg_pipe7_map4_dt_dest(reg_pipe7_map4_dt_dest[5:0]), // Templated
					     .reg_pipe7_map5_dt_dest(reg_pipe7_map5_dt_dest[5:0]), // Templated
					     .reg_pipe7_map6_dt_dest(reg_pipe7_map6_dt_dest[5:0]), // Templated
					     .reg_pipe7_map7_dt_dest(reg_pipe7_map7_dt_dest[5:0]), // Templated
					     .reg_pipe7_map8_dt_dest(reg_pipe7_map8_dt_dest[5:0]), // Templated
					     .reg_pipe7_map9_dt_dest(reg_pipe7_map9_dt_dest[5:0]), // Templated
					     .reg_pipe7_map10_dt_dest(reg_pipe7_map10_dt_dest[5:0]), // Templated
					     .reg_pipe7_map11_dt_dest(reg_pipe7_map11_dt_dest[5:0]), // Templated
					     .reg_pipe7_map12_dt_dest(reg_pipe7_map12_dt_dest[5:0]), // Templated
					     .reg_pipe7_map13_dt_dest(reg_pipe7_map13_dt_dest[5:0]), // Templated
					     .reg_pipe7_map14_dt_dest(reg_pipe7_map14_dt_dest[5:0]), // Templated
					     .reg_pipe7_map15_dt_dest(reg_pipe7_map15_dt_dest[5:0]), // Templated
					     .mep0_csi_data	(pkt_filter_out_mep0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .mep0_bytes_en	(pkt_filter_out_mep0_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .mep0_header_en	(pkt_filter_out_mep0_header_en), // Templated
					     .mep0_data_en	(pkt_filter_out_mep0_data_en), // Templated
					     .mep0_data_type	(pkt_filter_out_mep0_data_type[5:0]), // Templated
					     .mep0_virtual_channel(pkt_filter_out_mep0_virtual_channel[1:0]), // Templated
					     .mep0_virtual_channel_x(pkt_filter_out_mep0_virtual_channel[3:2]), // Templated
					     .mep0_word_count	(pkt_filter_out_mep0_word_count[15:0]), // Templated
					     .mep1_csi_data	(pkt_filter_out_mep1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .mep1_bytes_en	(pkt_filter_out_mep1_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .mep1_header_en	(pkt_filter_out_mep1_header_en), // Templated
					     .mep1_data_en	(pkt_filter_out_mep1_data_en), // Templated
					     .mep1_data_type	(pkt_filter_out_mep1_data_type[5:0]), // Templated
					     .mep1_virtual_channel(pkt_filter_out_mep1_virtual_channel[1:0]), // Templated
					     .mep1_virtual_channel_x(pkt_filter_out_mep1_virtual_channel[3:2]), // Templated
					     .mep1_word_count	(pkt_filter_out_mep1_word_count[15:0]), // Templated
					     .mep2_csi_data	(pkt_filter_out_mep2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .mep2_bytes_en	(pkt_filter_out_mep2_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .mep2_header_en	(pkt_filter_out_mep2_header_en), // Templated
					     .mep2_data_en	(pkt_filter_out_mep2_data_en), // Templated
					     .mep2_data_type	(pkt_filter_out_mep2_data_type[5:0]), // Templated
					     .mep2_virtual_channel(pkt_filter_out_mep2_virtual_channel[1:0]), // Templated
					     .mep2_virtual_channel_x(pkt_filter_out_mep2_virtual_channel[3:2]), // Templated
					     .mep2_word_count	(pkt_filter_out_mep2_word_count[15:0]), // Templated
					     .mep3_csi_data	(pkt_filter_out_mep3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					     .mep3_bytes_en	(pkt_filter_out_mep3_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .mep3_header_en	(pkt_filter_out_mep3_header_en), // Templated
					     .mep3_data_en	(pkt_filter_out_mep3_data_en), // Templated
					     .mep3_data_type	(pkt_filter_out_mep3_data_type[5:0]), // Templated
					     .mep3_virtual_channel(pkt_filter_out_mep3_virtual_channel[1:0]), // Templated
					     .mep3_virtual_channel_x(pkt_filter_out_mep3_virtual_channel[3:2]), // Templated
					     .mep3_word_count	(pkt_filter_out_mep3_word_count[15:0])); // Templated

/* as6d_app_video_pipe    AUTO_TEMPLATE(
        .video_data_afifo_data_count\(.*\)    (),
        .pipe\(.*\)_bytes_en (pipe\1_byte_en[]),
        .video_data_fwft_fifo_\(.*\)_err\(.*\)(video_data_fwft_fifo_mem_\1_err\2),
        .video_data_afifo_\(.*\)_err\(.*\)(video_data_afifo_mem_\1_err\2),
        .video_data_vld\([0-7]\) (pipe2sch_video_data_vld\1),
        .video_data\([0-7]\) (pipe2sch_video_data\1[]),
        .video_pipe[4-7]_data_aggre_bypass(),
        .video_pipe[4-7]_vld_aggre_bypass(),
        .video_pipe_date_type_for_concat_align[4-7](),
        .video_pipe_date_type_for_concat_align[4-7](),
        .video_pipe_date_type_for_concat_align[4-7](),
        .video_pipe_date_type_for_concat_align[4-7](),
        .video_pipe_date_type_for_concat_align_vld[4-7](),
        .video_pipe_date_type_for_concat_align_vld[4-7](),
        .video_pipe_date_type_for_concat_align_vld[4-7](),
        .video_pipe_date_type_for_concat_align_vld[4-7](),
)*/
as6d_app_video_pipe    u_as6d_app_video_pipe(
                         .fs_cnt_pipe0  (fs_cnt_pipe0[15:0]),
                         .fs_cnt_pipe1  (fs_cnt_pipe1[15:0]),
                         .fs_cnt_pipe2  (fs_cnt_pipe2[15:0]),
                         .fs_cnt_pipe3  (fs_cnt_pipe3[15:0]),
                         .fs_cnt_pipe4  (fs_cnt_pipe4[15:0]),
                         .fs_cnt_pipe5  (fs_cnt_pipe5[15:0]),
                         .fs_cnt_pipe6  (fs_cnt_pipe6[15:0]),
                         .fs_cnt_pipe7  (fs_cnt_pipe7[15:0]),
                         .video_lock0   (video_lock0),
                         .video_lock1   (video_lock1),
                         .video_lock2   (video_lock2),
                         .video_lock3   (video_lock3),
                         .video_lock4   (video_lock4),
                         .video_lock5   (video_lock5),
                         .video_lock6   (video_lock6),
                         .video_lock7   (video_lock7),
                        /*AUTOINST*/
					     // Outputs
					     .ack0		(ack0),
					     .ack1		(ack1),
					     .ack2		(ack2),
					     .ack3		(ack3),
					     .ack4		(ack4),
					     .ack5		(ack5),
					     .ack6		(ack6),
					     .ack7		(ack7),
					     .ack_pre0		(ack_pre0),
					     .ack_pre1		(ack_pre1),
					     .ack_pre2		(ack_pre2),
					     .ack_pre3		(ack_pre3),
					     .ack_pre4		(ack_pre4),
					     .ack_pre5		(ack_pre5),
					     .ack_pre6		(ack_pre6),
					     .ack_pre7		(ack_pre7),
					     .ack_vld_pipe0_aggregator0(ack_vld_pipe0_aggregator0),
					     .ack_vld_pipe0_aggregator1(ack_vld_pipe0_aggregator1),
					     .ack_vld_pipe0_aggregator2(ack_vld_pipe0_aggregator2),
					     .ack_vld_pipe0_aggregator3(ack_vld_pipe0_aggregator3),
					     .ack_vld_pipe1_aggregator0(ack_vld_pipe1_aggregator0),
					     .ack_vld_pipe1_aggregator1(ack_vld_pipe1_aggregator1),
					     .ack_vld_pipe1_aggregator2(ack_vld_pipe1_aggregator2),
					     .ack_vld_pipe1_aggregator3(ack_vld_pipe1_aggregator3),
					     .ack_vld_pipe2_aggregator0(ack_vld_pipe2_aggregator0),
					     .ack_vld_pipe2_aggregator1(ack_vld_pipe2_aggregator1),
					     .ack_vld_pipe2_aggregator2(ack_vld_pipe2_aggregator2),
					     .ack_vld_pipe2_aggregator3(ack_vld_pipe2_aggregator3),
					     .ack_vld_pipe3_aggregator0(ack_vld_pipe3_aggregator0),
					     .ack_vld_pipe3_aggregator1(ack_vld_pipe3_aggregator1),
					     .ack_vld_pipe3_aggregator2(ack_vld_pipe3_aggregator2),
					     .ack_vld_pipe3_aggregator3(ack_vld_pipe3_aggregator3),
					     .ack_vld_pipe4_aggregator0(ack_vld_pipe4_aggregator0),
					     .ack_vld_pipe4_aggregator1(ack_vld_pipe4_aggregator1),
					     .ack_vld_pipe4_aggregator2(ack_vld_pipe4_aggregator2),
					     .ack_vld_pipe4_aggregator3(ack_vld_pipe4_aggregator3),
					     .ack_vld_pipe5_aggregator0(ack_vld_pipe5_aggregator0),
					     .ack_vld_pipe5_aggregator1(ack_vld_pipe5_aggregator1),
					     .ack_vld_pipe5_aggregator2(ack_vld_pipe5_aggregator2),
					     .ack_vld_pipe5_aggregator3(ack_vld_pipe5_aggregator3),
					     .ack_vld_pipe6_aggregator0(ack_vld_pipe6_aggregator0),
					     .ack_vld_pipe6_aggregator1(ack_vld_pipe6_aggregator1),
					     .ack_vld_pipe6_aggregator2(ack_vld_pipe6_aggregator2),
					     .ack_vld_pipe6_aggregator3(ack_vld_pipe6_aggregator3),
					     .ack_vld_pipe7_aggregator0(ack_vld_pipe7_aggregator0),
					     .ack_vld_pipe7_aggregator1(ack_vld_pipe7_aggregator1),
					     .ack_vld_pipe7_aggregator2(ack_vld_pipe7_aggregator2),
					     .ack_vld_pipe7_aggregator3(ack_vld_pipe7_aggregator3),
					     .empty_vld_pipe0_aggregator0(empty_vld_pipe0_aggregator0),
					     .empty_vld_pipe0_aggregator1(empty_vld_pipe0_aggregator1),
					     .empty_vld_pipe0_aggregator2(empty_vld_pipe0_aggregator2),
					     .empty_vld_pipe0_aggregator3(empty_vld_pipe0_aggregator3),
					     .empty_vld_pipe1_aggregator0(empty_vld_pipe1_aggregator0),
					     .empty_vld_pipe1_aggregator1(empty_vld_pipe1_aggregator1),
					     .empty_vld_pipe1_aggregator2(empty_vld_pipe1_aggregator2),
					     .empty_vld_pipe1_aggregator3(empty_vld_pipe1_aggregator3),
					     .empty_vld_pipe2_aggregator0(empty_vld_pipe2_aggregator0),
					     .empty_vld_pipe2_aggregator1(empty_vld_pipe2_aggregator1),
					     .empty_vld_pipe2_aggregator2(empty_vld_pipe2_aggregator2),
					     .empty_vld_pipe2_aggregator3(empty_vld_pipe2_aggregator3),
					     .empty_vld_pipe3_aggregator0(empty_vld_pipe3_aggregator0),
					     .empty_vld_pipe3_aggregator1(empty_vld_pipe3_aggregator1),
					     .empty_vld_pipe3_aggregator2(empty_vld_pipe3_aggregator2),
					     .empty_vld_pipe3_aggregator3(empty_vld_pipe3_aggregator3),
					     .empty_vld_pipe4_aggregator0(empty_vld_pipe4_aggregator0),
					     .empty_vld_pipe4_aggregator1(empty_vld_pipe4_aggregator1),
					     .empty_vld_pipe4_aggregator2(empty_vld_pipe4_aggregator2),
					     .empty_vld_pipe4_aggregator3(empty_vld_pipe4_aggregator3),
					     .empty_vld_pipe5_aggregator0(empty_vld_pipe5_aggregator0),
					     .empty_vld_pipe5_aggregator1(empty_vld_pipe5_aggregator1),
					     .empty_vld_pipe5_aggregator2(empty_vld_pipe5_aggregator2),
					     .empty_vld_pipe5_aggregator3(empty_vld_pipe5_aggregator3),
					     .empty_vld_pipe6_aggregator0(empty_vld_pipe6_aggregator0),
					     .empty_vld_pipe6_aggregator1(empty_vld_pipe6_aggregator1),
					     .empty_vld_pipe6_aggregator2(empty_vld_pipe6_aggregator2),
					     .empty_vld_pipe6_aggregator3(empty_vld_pipe6_aggregator3),
					     .empty_vld_pipe7_aggregator0(empty_vld_pipe7_aggregator0),
					     .empty_vld_pipe7_aggregator1(empty_vld_pipe7_aggregator1),
					     .empty_vld_pipe7_aggregator2(empty_vld_pipe7_aggregator2),
					     .empty_vld_pipe7_aggregator3(empty_vld_pipe7_aggregator3),
					     .fifo_rd_ctrl_cs0	(fifo_rd_ctrl_cs0[2:0]),
					     .fifo_rd_ctrl_cs1	(fifo_rd_ctrl_cs1[2:0]),
					     .fifo_rd_ctrl_cs2	(fifo_rd_ctrl_cs2[2:0]),
					     .fifo_rd_ctrl_cs3	(fifo_rd_ctrl_cs3[2:0]),
					     .fifo_rd_ctrl_cs4	(fifo_rd_ctrl_cs4[2:0]),
					     .fifo_rd_ctrl_cs5	(fifo_rd_ctrl_cs5[2:0]),
					     .fifo_rd_ctrl_cs6	(fifo_rd_ctrl_cs6[2:0]),
					     .fifo_rd_ctrl_cs7	(fifo_rd_ctrl_cs7[2:0]),
					     .fs_detect_pipe0	(fs_detect_pipe0),
					     .fs_detect_pipe1	(fs_detect_pipe1),
					     .fs_detect_pipe2	(fs_detect_pipe2),
					     .fs_detect_pipe3	(fs_detect_pipe3),
					     .fs_detect_pipe4	(fs_detect_pipe4),
					     .fs_detect_pipe5	(fs_detect_pipe5),
					     .fs_detect_pipe6	(fs_detect_pipe6),
					     .fs_detect_pipe7	(fs_detect_pipe7),
					     .lcrc_err0		(lcrc_err0),
					     .lcrc_err1		(lcrc_err1),
					     .lcrc_err2		(lcrc_err2),
					     .lcrc_err3		(lcrc_err3),
					     .lcrc_err4		(lcrc_err4),
					     .lcrc_err5		(lcrc_err5),
					     .lcrc_err6		(lcrc_err6),
					     .lcrc_err7		(lcrc_err7),
					     .line_end0		(line_end0),
					     .line_end1		(line_end1),
					     .line_end2		(line_end2),
					     .line_end3		(line_end3),
					     .line_end4		(line_end4),
					     .line_end5		(line_end5),
					     .line_end6		(line_end6),
					     .line_end7		(line_end7),
					     .line_end_vld_pipe0_aggregator0(line_end_vld_pipe0_aggregator0),
					     .line_end_vld_pipe0_aggregator1(line_end_vld_pipe0_aggregator1),
					     .line_end_vld_pipe0_aggregator2(line_end_vld_pipe0_aggregator2),
					     .line_end_vld_pipe0_aggregator3(line_end_vld_pipe0_aggregator3),
					     .line_end_vld_pipe1_aggregator0(line_end_vld_pipe1_aggregator0),
					     .line_end_vld_pipe1_aggregator1(line_end_vld_pipe1_aggregator1),
					     .line_end_vld_pipe1_aggregator2(line_end_vld_pipe1_aggregator2),
					     .line_end_vld_pipe1_aggregator3(line_end_vld_pipe1_aggregator3),
					     .line_end_vld_pipe2_aggregator0(line_end_vld_pipe2_aggregator0),
					     .line_end_vld_pipe2_aggregator1(line_end_vld_pipe2_aggregator1),
					     .line_end_vld_pipe2_aggregator2(line_end_vld_pipe2_aggregator2),
					     .line_end_vld_pipe2_aggregator3(line_end_vld_pipe2_aggregator3),
					     .line_end_vld_pipe3_aggregator0(line_end_vld_pipe3_aggregator0),
					     .line_end_vld_pipe3_aggregator1(line_end_vld_pipe3_aggregator1),
					     .line_end_vld_pipe3_aggregator2(line_end_vld_pipe3_aggregator2),
					     .line_end_vld_pipe3_aggregator3(line_end_vld_pipe3_aggregator3),
					     .line_end_vld_pipe4_aggregator0(line_end_vld_pipe4_aggregator0),
					     .line_end_vld_pipe4_aggregator1(line_end_vld_pipe4_aggregator1),
					     .line_end_vld_pipe4_aggregator2(line_end_vld_pipe4_aggregator2),
					     .line_end_vld_pipe4_aggregator3(line_end_vld_pipe4_aggregator3),
					     .line_end_vld_pipe5_aggregator0(line_end_vld_pipe5_aggregator0),
					     .line_end_vld_pipe5_aggregator1(line_end_vld_pipe5_aggregator1),
					     .line_end_vld_pipe5_aggregator2(line_end_vld_pipe5_aggregator2),
					     .line_end_vld_pipe5_aggregator3(line_end_vld_pipe5_aggregator3),
					     .line_end_vld_pipe6_aggregator0(line_end_vld_pipe6_aggregator0),
					     .line_end_vld_pipe6_aggregator1(line_end_vld_pipe6_aggregator1),
					     .line_end_vld_pipe6_aggregator2(line_end_vld_pipe6_aggregator2),
					     .line_end_vld_pipe6_aggregator3(line_end_vld_pipe6_aggregator3),
					     .line_end_vld_pipe7_aggregator0(line_end_vld_pipe7_aggregator0),
					     .line_end_vld_pipe7_aggregator1(line_end_vld_pipe7_aggregator1),
					     .line_end_vld_pipe7_aggregator2(line_end_vld_pipe7_aggregator2),
					     .line_end_vld_pipe7_aggregator3(line_end_vld_pipe7_aggregator3),
					     .reg_rd_app_full_cnt_async_fifo_pipe0(reg_rd_app_full_cnt_async_fifo_pipe0[31:0]),
					     .reg_rd_app_full_cnt_async_fifo_pipe1(reg_rd_app_full_cnt_async_fifo_pipe1[31:0]),
					     .reg_rd_app_full_cnt_async_fifo_pipe2(reg_rd_app_full_cnt_async_fifo_pipe2[31:0]),
					     .reg_rd_app_full_cnt_async_fifo_pipe3(reg_rd_app_full_cnt_async_fifo_pipe3[31:0]),
					     .reg_rd_app_full_cnt_async_fifo_pipe4(reg_rd_app_full_cnt_async_fifo_pipe4[31:0]),
					     .reg_rd_app_full_cnt_async_fifo_pipe5(reg_rd_app_full_cnt_async_fifo_pipe5[31:0]),
					     .reg_rd_app_full_cnt_async_fifo_pipe6(reg_rd_app_full_cnt_async_fifo_pipe6[31:0]),
					     .reg_rd_app_full_cnt_async_fifo_pipe7(reg_rd_app_full_cnt_async_fifo_pipe7[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe0(reg_rd_app_full_cnt_sync_fifo_pipe0[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe1(reg_rd_app_full_cnt_sync_fifo_pipe1[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe2(reg_rd_app_full_cnt_sync_fifo_pipe2[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe3(reg_rd_app_full_cnt_sync_fifo_pipe3[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe4(reg_rd_app_full_cnt_sync_fifo_pipe4[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe5(reg_rd_app_full_cnt_sync_fifo_pipe5[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe6(reg_rd_app_full_cnt_sync_fifo_pipe6[31:0]),
					     .reg_rd_app_full_cnt_sync_fifo_pipe7(reg_rd_app_full_cnt_sync_fifo_pipe7[31:0]),
					     .reg_rd_dbg_pkt_num_nonzero_and_fifo_empty_threshold_err(reg_rd_dbg_pkt_num_nonzero_and_fifo_empty_threshold_err[7:0]),
					     .reg_rd_dbg_pkt_num_nonzero_threshold_err(reg_rd_dbg_pkt_num_nonzero_threshold_err[7:0]),
					     .reg_rd_pipe0_dispatched_cnt_ready_for_sch(reg_rd_pipe0_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_pipe1_dispatched_cnt_ready_for_sch(reg_rd_pipe1_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_pipe2_dispatched_cnt_ready_for_sch(reg_rd_pipe2_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_pipe3_dispatched_cnt_ready_for_sch(reg_rd_pipe3_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_pipe4_dispatched_cnt_ready_for_sch(reg_rd_pipe4_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_pipe5_dispatched_cnt_ready_for_sch(reg_rd_pipe5_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_pipe6_dispatched_cnt_ready_for_sch(reg_rd_pipe6_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_pipe7_dispatched_cnt_ready_for_sch(reg_rd_pipe7_dispatched_cnt_ready_for_sch[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe0(reg_rd_resv_pkt_cnt_lp_pf_pipe0[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe1(reg_rd_resv_pkt_cnt_lp_pf_pipe1[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe2(reg_rd_resv_pkt_cnt_lp_pf_pipe2[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe3(reg_rd_resv_pkt_cnt_lp_pf_pipe3[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe4(reg_rd_resv_pkt_cnt_lp_pf_pipe4[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe5(reg_rd_resv_pkt_cnt_lp_pf_pipe5[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe6(reg_rd_resv_pkt_cnt_lp_pf_pipe6[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_pf_pipe7(reg_rd_resv_pkt_cnt_lp_pf_pipe7[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe0(reg_rd_resv_pkt_cnt_lp_ph_pipe0[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe1(reg_rd_resv_pkt_cnt_lp_ph_pipe1[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe2(reg_rd_resv_pkt_cnt_lp_ph_pipe2[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe3(reg_rd_resv_pkt_cnt_lp_ph_pipe3[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe4(reg_rd_resv_pkt_cnt_lp_ph_pipe4[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe5(reg_rd_resv_pkt_cnt_lp_ph_pipe5[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe6(reg_rd_resv_pkt_cnt_lp_ph_pipe6[31:0]),
					     .reg_rd_resv_pkt_cnt_lp_ph_pipe7(reg_rd_resv_pkt_cnt_lp_ph_pipe7[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe0(reg_rd_resv_pkt_cnt_sp_fe_pipe0[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe1(reg_rd_resv_pkt_cnt_sp_fe_pipe1[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe2(reg_rd_resv_pkt_cnt_sp_fe_pipe2[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe3(reg_rd_resv_pkt_cnt_sp_fe_pipe3[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe4(reg_rd_resv_pkt_cnt_sp_fe_pipe4[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe5(reg_rd_resv_pkt_cnt_sp_fe_pipe5[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe6(reg_rd_resv_pkt_cnt_sp_fe_pipe6[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fe_pipe7(reg_rd_resv_pkt_cnt_sp_fe_pipe7[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe0(reg_rd_resv_pkt_cnt_sp_fs_pipe0[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe1(reg_rd_resv_pkt_cnt_sp_fs_pipe1[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe2(reg_rd_resv_pkt_cnt_sp_fs_pipe2[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe3(reg_rd_resv_pkt_cnt_sp_fs_pipe3[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe4(reg_rd_resv_pkt_cnt_sp_fs_pipe4[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe5(reg_rd_resv_pkt_cnt_sp_fs_pipe5[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe6(reg_rd_resv_pkt_cnt_sp_fs_pipe6[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_fs_pipe7(reg_rd_resv_pkt_cnt_sp_fs_pipe7[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe0(reg_rd_resv_pkt_cnt_sp_le_pipe0[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe1(reg_rd_resv_pkt_cnt_sp_le_pipe1[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe2(reg_rd_resv_pkt_cnt_sp_le_pipe2[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe3(reg_rd_resv_pkt_cnt_sp_le_pipe3[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe4(reg_rd_resv_pkt_cnt_sp_le_pipe4[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe5(reg_rd_resv_pkt_cnt_sp_le_pipe5[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe6(reg_rd_resv_pkt_cnt_sp_le_pipe6[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_le_pipe7(reg_rd_resv_pkt_cnt_sp_le_pipe7[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe0(reg_rd_resv_pkt_cnt_sp_ls_pipe0[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe1(reg_rd_resv_pkt_cnt_sp_ls_pipe1[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe2(reg_rd_resv_pkt_cnt_sp_ls_pipe2[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe3(reg_rd_resv_pkt_cnt_sp_ls_pipe3[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe4(reg_rd_resv_pkt_cnt_sp_ls_pipe4[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe5(reg_rd_resv_pkt_cnt_sp_ls_pipe5[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe6(reg_rd_resv_pkt_cnt_sp_ls_pipe6[31:0]),
					     .reg_rd_resv_pkt_cnt_sp_ls_pipe7(reg_rd_resv_pkt_cnt_sp_ls_pipe7[31:0]),
					     .video_data0	(pipe2sch_video_data0[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data1	(pipe2sch_video_data1[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data2	(pipe2sch_video_data2[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data3	(pipe2sch_video_data3[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data4	(pipe2sch_video_data4[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data5	(pipe2sch_video_data5[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data6	(pipe2sch_video_data6[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data7	(pipe2sch_video_data7[(VIDEO_DATA_SIZE-1):0]), // Templated
					     .video_data_afifo_double_err0(video_data_afifo_mem_double_err0), // Templated
					     .video_data_afifo_double_err1(video_data_afifo_mem_double_err1), // Templated
					     .video_data_afifo_double_err2(video_data_afifo_mem_double_err2), // Templated
					     .video_data_afifo_double_err3(video_data_afifo_mem_double_err3), // Templated
					     .video_data_afifo_double_err4(video_data_afifo_mem_double_err4), // Templated
					     .video_data_afifo_double_err5(video_data_afifo_mem_double_err5), // Templated
					     .video_data_afifo_double_err6(video_data_afifo_mem_double_err6), // Templated
					     .video_data_afifo_double_err7(video_data_afifo_mem_double_err7), // Templated
					     .video_data_afifo_ecc_fault0(video_data_afifo_ecc_fault0),
					     .video_data_afifo_ecc_fault1(video_data_afifo_ecc_fault1),
					     .video_data_afifo_ecc_fault2(video_data_afifo_ecc_fault2),
					     .video_data_afifo_ecc_fault3(video_data_afifo_ecc_fault3),
					     .video_data_afifo_ecc_fault4(video_data_afifo_ecc_fault4),
					     .video_data_afifo_ecc_fault5(video_data_afifo_ecc_fault5),
					     .video_data_afifo_ecc_fault6(video_data_afifo_ecc_fault6),
					     .video_data_afifo_ecc_fault7(video_data_afifo_ecc_fault7),
					     .video_data_afifo_empty0(video_data_afifo_empty0),
					     .video_data_afifo_empty1(video_data_afifo_empty1),
					     .video_data_afifo_empty2(video_data_afifo_empty2),
					     .video_data_afifo_empty3(video_data_afifo_empty3),
					     .video_data_afifo_empty4(video_data_afifo_empty4),
					     .video_data_afifo_empty5(video_data_afifo_empty5),
					     .video_data_afifo_empty6(video_data_afifo_empty6),
					     .video_data_afifo_empty7(video_data_afifo_empty7),
					     .video_data_afifo_full0(video_data_afifo_full0),
					     .video_data_afifo_full1(video_data_afifo_full1),
					     .video_data_afifo_full2(video_data_afifo_full2),
					     .video_data_afifo_full3(video_data_afifo_full3),
					     .video_data_afifo_full4(video_data_afifo_full4),
					     .video_data_afifo_full5(video_data_afifo_full5),
					     .video_data_afifo_full6(video_data_afifo_full6),
					     .video_data_afifo_full7(video_data_afifo_full7),
					     .video_data_afifo_ovf_int0(video_data_afifo_ovf_int0),
					     .video_data_afifo_ovf_int1(video_data_afifo_ovf_int1),
					     .video_data_afifo_ovf_int2(video_data_afifo_ovf_int2),
					     .video_data_afifo_ovf_int3(video_data_afifo_ovf_int3),
					     .video_data_afifo_ovf_int4(video_data_afifo_ovf_int4),
					     .video_data_afifo_ovf_int5(video_data_afifo_ovf_int5),
					     .video_data_afifo_ovf_int6(video_data_afifo_ovf_int6),
					     .video_data_afifo_ovf_int7(video_data_afifo_ovf_int7),
					     .video_data_afifo_prog_empty0(video_data_afifo_prog_empty0),
					     .video_data_afifo_prog_empty1(video_data_afifo_prog_empty1),
					     .video_data_afifo_prog_empty2(video_data_afifo_prog_empty2),
					     .video_data_afifo_prog_empty3(video_data_afifo_prog_empty3),
					     .video_data_afifo_prog_empty4(video_data_afifo_prog_empty4),
					     .video_data_afifo_prog_empty5(video_data_afifo_prog_empty5),
					     .video_data_afifo_prog_empty6(video_data_afifo_prog_empty6),
					     .video_data_afifo_prog_empty7(video_data_afifo_prog_empty7),
					     .video_data_afifo_prog_full0(video_data_afifo_prog_full0),
					     .video_data_afifo_prog_full1(video_data_afifo_prog_full1),
					     .video_data_afifo_prog_full2(video_data_afifo_prog_full2),
					     .video_data_afifo_prog_full3(video_data_afifo_prog_full3),
					     .video_data_afifo_prog_full4(video_data_afifo_prog_full4),
					     .video_data_afifo_prog_full5(video_data_afifo_prog_full5),
					     .video_data_afifo_prog_full6(video_data_afifo_prog_full6),
					     .video_data_afifo_prog_full7(video_data_afifo_prog_full7),
					     .video_data_afifo_single_err0(video_data_afifo_mem_single_err0), // Templated
					     .video_data_afifo_single_err1(video_data_afifo_mem_single_err1), // Templated
					     .video_data_afifo_single_err2(video_data_afifo_mem_single_err2), // Templated
					     .video_data_afifo_single_err3(video_data_afifo_mem_single_err3), // Templated
					     .video_data_afifo_single_err4(video_data_afifo_mem_single_err4), // Templated
					     .video_data_afifo_single_err5(video_data_afifo_mem_single_err5), // Templated
					     .video_data_afifo_single_err6(video_data_afifo_mem_single_err6), // Templated
					     .video_data_afifo_single_err7(video_data_afifo_mem_single_err7), // Templated
					     .video_data_afifo_udf_int0(video_data_afifo_udf_int0),
					     .video_data_afifo_udf_int1(video_data_afifo_udf_int1),
					     .video_data_afifo_udf_int2(video_data_afifo_udf_int2),
					     .video_data_afifo_udf_int3(video_data_afifo_udf_int3),
					     .video_data_afifo_udf_int4(video_data_afifo_udf_int4),
					     .video_data_afifo_udf_int5(video_data_afifo_udf_int5),
					     .video_data_afifo_udf_int6(video_data_afifo_udf_int6),
					     .video_data_afifo_udf_int7(video_data_afifo_udf_int7),
					     .video_data_fwft_fifo_double_err0(video_data_fwft_fifo_mem_double_err0), // Templated
					     .video_data_fwft_fifo_double_err1(video_data_fwft_fifo_mem_double_err1), // Templated
					     .video_data_fwft_fifo_double_err2(video_data_fwft_fifo_mem_double_err2), // Templated
					     .video_data_fwft_fifo_double_err3(video_data_fwft_fifo_mem_double_err3), // Templated
					     .video_data_fwft_fifo_double_err4(video_data_fwft_fifo_mem_double_err4), // Templated
					     .video_data_fwft_fifo_double_err5(video_data_fwft_fifo_mem_double_err5), // Templated
					     .video_data_fwft_fifo_double_err6(video_data_fwft_fifo_mem_double_err6), // Templated
					     .video_data_fwft_fifo_double_err7(video_data_fwft_fifo_mem_double_err7), // Templated
					     .video_data_fwft_fifo_ecc_fault0(video_data_fwft_fifo_ecc_fault0),
					     .video_data_fwft_fifo_ecc_fault1(video_data_fwft_fifo_ecc_fault1),
					     .video_data_fwft_fifo_ecc_fault2(video_data_fwft_fifo_ecc_fault2),
					     .video_data_fwft_fifo_ecc_fault3(video_data_fwft_fifo_ecc_fault3),
					     .video_data_fwft_fifo_ecc_fault4(video_data_fwft_fifo_ecc_fault4),
					     .video_data_fwft_fifo_ecc_fault5(video_data_fwft_fifo_ecc_fault5),
					     .video_data_fwft_fifo_ecc_fault6(video_data_fwft_fifo_ecc_fault6),
					     .video_data_fwft_fifo_ecc_fault7(video_data_fwft_fifo_ecc_fault7),
					     .video_data_fwft_fifo_empty0(video_data_fwft_fifo_empty0),
					     .video_data_fwft_fifo_empty1(video_data_fwft_fifo_empty1),
					     .video_data_fwft_fifo_empty2(video_data_fwft_fifo_empty2),
					     .video_data_fwft_fifo_empty3(video_data_fwft_fifo_empty3),
					     .video_data_fwft_fifo_empty4(video_data_fwft_fifo_empty4),
					     .video_data_fwft_fifo_empty5(video_data_fwft_fifo_empty5),
					     .video_data_fwft_fifo_empty6(video_data_fwft_fifo_empty6),
					     .video_data_fwft_fifo_empty7(video_data_fwft_fifo_empty7),
					     .video_data_fwft_fifo_full0(video_data_fwft_fifo_full0),
					     .video_data_fwft_fifo_full1(video_data_fwft_fifo_full1),
					     .video_data_fwft_fifo_full2(video_data_fwft_fifo_full2),
					     .video_data_fwft_fifo_full3(video_data_fwft_fifo_full3),
					     .video_data_fwft_fifo_full4(video_data_fwft_fifo_full4),
					     .video_data_fwft_fifo_full5(video_data_fwft_fifo_full5),
					     .video_data_fwft_fifo_full6(video_data_fwft_fifo_full6),
					     .video_data_fwft_fifo_full7(video_data_fwft_fifo_full7),
					     .video_data_fwft_fifo_ovf_int0(video_data_fwft_fifo_ovf_int0),
					     .video_data_fwft_fifo_ovf_int1(video_data_fwft_fifo_ovf_int1),
					     .video_data_fwft_fifo_ovf_int2(video_data_fwft_fifo_ovf_int2),
					     .video_data_fwft_fifo_ovf_int3(video_data_fwft_fifo_ovf_int3),
					     .video_data_fwft_fifo_ovf_int4(video_data_fwft_fifo_ovf_int4),
					     .video_data_fwft_fifo_ovf_int5(video_data_fwft_fifo_ovf_int5),
					     .video_data_fwft_fifo_ovf_int6(video_data_fwft_fifo_ovf_int6),
					     .video_data_fwft_fifo_ovf_int7(video_data_fwft_fifo_ovf_int7),
					     .video_data_fwft_fifo_prog_full0(video_data_fwft_fifo_prog_full0),
					     .video_data_fwft_fifo_prog_full1(video_data_fwft_fifo_prog_full1),
					     .video_data_fwft_fifo_prog_full2(video_data_fwft_fifo_prog_full2),
					     .video_data_fwft_fifo_prog_full3(video_data_fwft_fifo_prog_full3),
					     .video_data_fwft_fifo_prog_full4(video_data_fwft_fifo_prog_full4),
					     .video_data_fwft_fifo_prog_full5(video_data_fwft_fifo_prog_full5),
					     .video_data_fwft_fifo_prog_full6(video_data_fwft_fifo_prog_full6),
					     .video_data_fwft_fifo_prog_full7(video_data_fwft_fifo_prog_full7),
					     .video_data_fwft_fifo_single_err0(video_data_fwft_fifo_mem_single_err0), // Templated
					     .video_data_fwft_fifo_single_err1(video_data_fwft_fifo_mem_single_err1), // Templated
					     .video_data_fwft_fifo_single_err2(video_data_fwft_fifo_mem_single_err2), // Templated
					     .video_data_fwft_fifo_single_err3(video_data_fwft_fifo_mem_single_err3), // Templated
					     .video_data_fwft_fifo_single_err4(video_data_fwft_fifo_mem_single_err4), // Templated
					     .video_data_fwft_fifo_single_err5(video_data_fwft_fifo_mem_single_err5), // Templated
					     .video_data_fwft_fifo_single_err6(video_data_fwft_fifo_mem_single_err6), // Templated
					     .video_data_fwft_fifo_single_err7(video_data_fwft_fifo_mem_single_err7), // Templated
					     .video_data_fwft_fifo_udf_int0(video_data_fwft_fifo_udf_int0),
					     .video_data_fwft_fifo_udf_int1(video_data_fwft_fifo_udf_int1),
					     .video_data_fwft_fifo_udf_int2(video_data_fwft_fifo_udf_int2),
					     .video_data_fwft_fifo_udf_int3(video_data_fwft_fifo_udf_int3),
					     .video_data_fwft_fifo_udf_int4(video_data_fwft_fifo_udf_int4),
					     .video_data_fwft_fifo_udf_int5(video_data_fwft_fifo_udf_int5),
					     .video_data_fwft_fifo_udf_int6(video_data_fwft_fifo_udf_int6),
					     .video_data_fwft_fifo_udf_int7(video_data_fwft_fifo_udf_int7),
					     .video_data_vld0	(pipe2sch_video_data_vld0), // Templated
					     .video_data_vld1	(pipe2sch_video_data_vld1), // Templated
					     .video_data_vld2	(pipe2sch_video_data_vld2), // Templated
					     .video_data_vld3	(pipe2sch_video_data_vld3), // Templated
					     .video_data_vld4	(pipe2sch_video_data_vld4), // Templated
					     .video_data_vld5	(pipe2sch_video_data_vld5), // Templated
					     .video_data_vld6	(pipe2sch_video_data_vld6), // Templated
					     .video_data_vld7	(pipe2sch_video_data_vld7), // Templated
					     .video_loss0	(video_loss0),
					     .video_loss1	(video_loss1),
					     .video_loss2	(video_loss2),
					     .video_loss3	(video_loss3),
					     .video_loss4	(video_loss4),
					     .video_loss5	(video_loss5),
					     .video_loss6	(video_loss6),
					     .video_loss7	(video_loss7),
					     .video_pipe0_data_aggre_bypass(video_pipe0_data_aggre_bypass[139:0]),
					     .video_pipe0_vld_aggre_bypass(video_pipe0_vld_aggre_bypass),
					     .video_pipe1_data_aggre_bypass(video_pipe1_data_aggre_bypass[139:0]),
					     .video_pipe1_vld_aggre_bypass(video_pipe1_vld_aggre_bypass),
					     .video_pipe2_data_aggre_bypass(video_pipe2_data_aggre_bypass[139:0]),
					     .video_pipe2_vld_aggre_bypass(video_pipe2_vld_aggre_bypass),
					     .video_pipe3_data_aggre_bypass(video_pipe3_data_aggre_bypass[139:0]),
					     .video_pipe3_vld_aggre_bypass(video_pipe3_vld_aggre_bypass),
					     .video_pipe4_data_aggre_bypass(),	 // Templated
					     .video_pipe4_vld_aggre_bypass(),	 // Templated
					     .video_pipe5_data_aggre_bypass(),	 // Templated
					     .video_pipe5_vld_aggre_bypass(),	 // Templated
					     .video_pipe6_data_aggre_bypass(),	 // Templated
					     .video_pipe6_vld_aggre_bypass(),	 // Templated
					     .video_pipe7_data_aggre_bypass(),	 // Templated
					     .video_pipe7_vld_aggre_bypass(),	 // Templated
					     .video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
					     .video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
					     .video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
					     .video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
					     .video_pipe_date_type_for_concat_align4(), // Templated
					     .video_pipe_date_type_for_concat_align5(), // Templated
					     .video_pipe_date_type_for_concat_align6(), // Templated
					     .video_pipe_date_type_for_concat_align7(), // Templated
					     .video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
					     .video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
					     .video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
					     .video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
					     .video_pipe_date_type_for_concat_align_vld4(), // Templated
					     .video_pipe_date_type_for_concat_align_vld5(), // Templated
					     .video_pipe_date_type_for_concat_align_vld6(), // Templated
					     .video_pipe_date_type_for_concat_align_vld7(), // Templated
					     .reg_rd_pipe_fifo_full(reg_rd_pipe_fifo_full[7:0]),
					     // Inputs
					     .app_aggregation_bypass(app_aggregation_bypass),
					     .clk_1M		(clk_1M),
					     .fifo_rdclk0	(fifo_rdclk0),
					     .fifo_rdclk1	(fifo_rdclk1),
					     .fifo_rdclk2	(fifo_rdclk2),
					     .fifo_rdclk3	(fifo_rdclk3),
					     .fifo_rdclk4	(fifo_rdclk4),
					     .fifo_rdclk5	(fifo_rdclk5),
					     .fifo_rdclk6	(fifo_rdclk6),
					     .fifo_rdclk7	(fifo_rdclk7),
					     .fifo_rdclk_rst_n0	(fifo_rdclk_rst_n0),
					     .fifo_rdclk_rst_n1	(fifo_rdclk_rst_n1),
					     .fifo_rdclk_rst_n2	(fifo_rdclk_rst_n2),
					     .fifo_rdclk_rst_n3	(fifo_rdclk_rst_n3),
					     .fifo_rdclk_rst_n4	(fifo_rdclk_rst_n4),
					     .fifo_rdclk_rst_n5	(fifo_rdclk_rst_n5),
					     .fifo_rdclk_rst_n6	(fifo_rdclk_rst_n6),
					     .fifo_rdclk_rst_n7	(fifo_rdclk_rst_n7),
					     .fifo_wrclk0	(fifo_wrclk0),
					     .fifo_wrclk1	(fifo_wrclk1),
					     .fifo_wrclk2	(fifo_wrclk2),
					     .fifo_wrclk3	(fifo_wrclk3),
					     .fifo_wrclk4	(fifo_wrclk4),
					     .fifo_wrclk5	(fifo_wrclk5),
					     .fifo_wrclk6	(fifo_wrclk6),
					     .fifo_wrclk7	(fifo_wrclk7),
					     .fifo_wrclk_rst_n0	(fifo_wrclk_rst_n0),
					     .fifo_wrclk_rst_n1	(fifo_wrclk_rst_n1),
					     .fifo_wrclk_rst_n2	(fifo_wrclk_rst_n2),
					     .fifo_wrclk_rst_n3	(fifo_wrclk_rst_n3),
					     .fifo_wrclk_rst_n4	(fifo_wrclk_rst_n4),
					     .fifo_wrclk_rst_n5	(fifo_wrclk_rst_n5),
					     .fifo_wrclk_rst_n6	(fifo_wrclk_rst_n6),
					     .fifo_wrclk_rst_n7	(fifo_wrclk_rst_n7),
					     .line_delay_en0	(line_delay_en0),
					     .line_delay_en1	(line_delay_en1),
					     .line_delay_en2	(line_delay_en2),
					     .line_delay_en3	(line_delay_en3),
					     .line_delay_en4	(line_delay_en4),
					     .line_delay_en5	(line_delay_en5),
					     .line_delay_en6	(line_delay_en6),
					     .line_delay_en7	(line_delay_en7),
					     .pipe0_aggr_id	(pipe0_aggr_id[3:0]),
					     .pipe0_bytes_en	(pipe0_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe0_csi_data	(pipe0_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe0_data_en	(pipe0_data_en),
					     .pipe0_data_type	(pipe0_data_type[5:0]),
					     .pipe0_header_en	(pipe0_header_en),
					     .pipe0_pkt_crc	(pipe0_pkt_crc[31:0]),
					     .pipe0_pkt_crc_en	(pipe0_pkt_crc_en),
					     .pipe0_virtual_channel(pipe0_virtual_channel[1:0]),
					     .pipe0_virtual_channel_x(pipe0_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe0_word_count	(pipe0_word_count[15:0]),
					     .pipe1_aggr_id	(pipe1_aggr_id[3:0]),
					     .pipe1_bytes_en	(pipe1_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe1_csi_data	(pipe1_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe1_data_en	(pipe1_data_en),
					     .pipe1_data_type	(pipe1_data_type[5:0]),
					     .pipe1_header_en	(pipe1_header_en),
					     .pipe1_pkt_crc	(pipe1_pkt_crc[31:0]),
					     .pipe1_pkt_crc_en	(pipe1_pkt_crc_en),
					     .pipe1_virtual_channel(pipe1_virtual_channel[1:0]),
					     .pipe1_virtual_channel_x(pipe1_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe1_word_count	(pipe1_word_count[15:0]),
					     .pipe2_aggr_id	(pipe2_aggr_id[3:0]),
					     .pipe2_bytes_en	(pipe2_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe2_csi_data	(pipe2_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe2_data_en	(pipe2_data_en),
					     .pipe2_data_type	(pipe2_data_type[5:0]),
					     .pipe2_header_en	(pipe2_header_en),
					     .pipe2_pkt_crc	(pipe2_pkt_crc[31:0]),
					     .pipe2_pkt_crc_en	(pipe2_pkt_crc_en),
					     .pipe2_virtual_channel(pipe2_virtual_channel[1:0]),
					     .pipe2_virtual_channel_x(pipe2_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe2_word_count	(pipe2_word_count[15:0]),
					     .pipe3_aggr_id	(pipe3_aggr_id[3:0]),
					     .pipe3_bytes_en	(pipe3_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe3_csi_data	(pipe3_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe3_data_en	(pipe3_data_en),
					     .pipe3_data_type	(pipe3_data_type[5:0]),
					     .pipe3_header_en	(pipe3_header_en),
					     .pipe3_pkt_crc	(pipe3_pkt_crc[31:0]),
					     .pipe3_pkt_crc_en	(pipe3_pkt_crc_en),
					     .pipe3_virtual_channel(pipe3_virtual_channel[1:0]),
					     .pipe3_virtual_channel_x(pipe3_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe3_word_count	(pipe3_word_count[15:0]),
					     .pipe4_aggr_id	(pipe4_aggr_id[3:0]),
					     .pipe4_bytes_en	(pipe4_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe4_csi_data	(pipe4_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe4_data_en	(pipe4_data_en),
					     .pipe4_data_type	(pipe4_data_type[5:0]),
					     .pipe4_header_en	(pipe4_header_en),
					     .pipe4_pkt_crc	(pipe4_pkt_crc[31:0]),
					     .pipe4_pkt_crc_en	(pipe4_pkt_crc_en),
					     .pipe4_virtual_channel(pipe4_virtual_channel[1:0]),
					     .pipe4_virtual_channel_x(pipe4_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe4_word_count	(pipe4_word_count[15:0]),
					     .pipe5_aggr_id	(pipe5_aggr_id[3:0]),
					     .pipe5_bytes_en	(pipe5_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe5_csi_data	(pipe5_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe5_data_en	(pipe5_data_en),
					     .pipe5_data_type	(pipe5_data_type[5:0]),
					     .pipe5_header_en	(pipe5_header_en),
					     .pipe5_pkt_crc	(pipe5_pkt_crc[31:0]),
					     .pipe5_pkt_crc_en	(pipe5_pkt_crc_en),
					     .pipe5_virtual_channel(pipe5_virtual_channel[1:0]),
					     .pipe5_virtual_channel_x(pipe5_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe5_word_count	(pipe5_word_count[15:0]),
					     .pipe6_aggr_id	(pipe6_aggr_id[3:0]),
					     .pipe6_bytes_en	(pipe6_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe6_csi_data	(pipe6_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe6_data_en	(pipe6_data_en),
					     .pipe6_data_type	(pipe6_data_type[5:0]),
					     .pipe6_header_en	(pipe6_header_en),
					     .pipe6_pkt_crc	(pipe6_pkt_crc[31:0]),
					     .pipe6_pkt_crc_en	(pipe6_pkt_crc_en),
					     .pipe6_virtual_channel(pipe6_virtual_channel[1:0]),
					     .pipe6_virtual_channel_x(pipe6_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe6_word_count	(pipe6_word_count[15:0]),
					     .pipe7_aggr_id	(pipe7_aggr_id[3:0]),
					     .pipe7_bytes_en	(pipe7_byte_en[(`MEP_CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					     .pipe7_csi_data	(pipe7_csi_data[(`MEP_CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]),
					     .pipe7_data_en	(pipe7_data_en),
					     .pipe7_data_type	(pipe7_data_type[5:0]),
					     .pipe7_header_en	(pipe7_header_en),
					     .pipe7_pkt_crc	(pipe7_pkt_crc[31:0]),
					     .pipe7_pkt_crc_en	(pipe7_pkt_crc_en),
					     .pipe7_virtual_channel(pipe7_virtual_channel[1:0]),
					     .pipe7_virtual_channel_x(pipe7_virtual_channel_x[(`MEP_CSI2_DEVICE_VCX_DWIDTH-1):0]),
					     .pipe7_word_count	(pipe7_word_count[15:0]),
					     .reg_app_ecc_addr_protect_en(reg_app_ecc_addr_protect_en),
					     .reg_app_ecc_bypass(reg_app_ecc_bypass),
					     .reg_app_ecc_fault_detc_en(reg_app_ecc_fault_detc_en),
					     .reg_app_pkt_crc_gen_dis(reg_app_pkt_crc_gen_dis),
					     .reg_app_wr_idi_data_continue(reg_app_wr_idi_data_continue),
					     .reg_clear_app_full_cnt_async_fifo_pipe0(reg_clear_app_full_cnt_async_fifo_pipe0),
					     .reg_clear_app_full_cnt_async_fifo_pipe1(reg_clear_app_full_cnt_async_fifo_pipe1),
					     .reg_clear_app_full_cnt_async_fifo_pipe2(reg_clear_app_full_cnt_async_fifo_pipe2),
					     .reg_clear_app_full_cnt_async_fifo_pipe3(reg_clear_app_full_cnt_async_fifo_pipe3),
					     .reg_clear_app_full_cnt_async_fifo_pipe4(reg_clear_app_full_cnt_async_fifo_pipe4),
					     .reg_clear_app_full_cnt_async_fifo_pipe5(reg_clear_app_full_cnt_async_fifo_pipe5),
					     .reg_clear_app_full_cnt_async_fifo_pipe6(reg_clear_app_full_cnt_async_fifo_pipe6),
					     .reg_clear_app_full_cnt_async_fifo_pipe7(reg_clear_app_full_cnt_async_fifo_pipe7),
					     .reg_clear_app_full_cnt_sync_fifo_pipe0(reg_clear_app_full_cnt_sync_fifo_pipe0),
					     .reg_clear_app_full_cnt_sync_fifo_pipe1(reg_clear_app_full_cnt_sync_fifo_pipe1),
					     .reg_clear_app_full_cnt_sync_fifo_pipe2(reg_clear_app_full_cnt_sync_fifo_pipe2),
					     .reg_clear_app_full_cnt_sync_fifo_pipe3(reg_clear_app_full_cnt_sync_fifo_pipe3),
					     .reg_clear_app_full_cnt_sync_fifo_pipe4(reg_clear_app_full_cnt_sync_fifo_pipe4),
					     .reg_clear_app_full_cnt_sync_fifo_pipe5(reg_clear_app_full_cnt_sync_fifo_pipe5),
					     .reg_clear_app_full_cnt_sync_fifo_pipe6(reg_clear_app_full_cnt_sync_fifo_pipe6),
					     .reg_clear_app_full_cnt_sync_fifo_pipe7(reg_clear_app_full_cnt_sync_fifo_pipe7),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe0(reg_clear_resv_pkt_cnt_lp_pf_pipe0),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe1(reg_clear_resv_pkt_cnt_lp_pf_pipe1),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe2(reg_clear_resv_pkt_cnt_lp_pf_pipe2),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe3(reg_clear_resv_pkt_cnt_lp_pf_pipe3),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe4(reg_clear_resv_pkt_cnt_lp_pf_pipe4),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe5(reg_clear_resv_pkt_cnt_lp_pf_pipe5),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe6(reg_clear_resv_pkt_cnt_lp_pf_pipe6),
					     .reg_clear_resv_pkt_cnt_lp_pf_pipe7(reg_clear_resv_pkt_cnt_lp_pf_pipe7),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe0(reg_clear_resv_pkt_cnt_lp_ph_pipe0),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe1(reg_clear_resv_pkt_cnt_lp_ph_pipe1),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe2(reg_clear_resv_pkt_cnt_lp_ph_pipe2),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe3(reg_clear_resv_pkt_cnt_lp_ph_pipe3),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe4(reg_clear_resv_pkt_cnt_lp_ph_pipe4),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe5(reg_clear_resv_pkt_cnt_lp_ph_pipe5),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe6(reg_clear_resv_pkt_cnt_lp_ph_pipe6),
					     .reg_clear_resv_pkt_cnt_lp_ph_pipe7(reg_clear_resv_pkt_cnt_lp_ph_pipe7),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe0(reg_clear_resv_pkt_cnt_sp_fe_pipe0),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe1(reg_clear_resv_pkt_cnt_sp_fe_pipe1),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe2(reg_clear_resv_pkt_cnt_sp_fe_pipe2),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe3(reg_clear_resv_pkt_cnt_sp_fe_pipe3),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe4(reg_clear_resv_pkt_cnt_sp_fe_pipe4),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe5(reg_clear_resv_pkt_cnt_sp_fe_pipe5),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe6(reg_clear_resv_pkt_cnt_sp_fe_pipe6),
					     .reg_clear_resv_pkt_cnt_sp_fe_pipe7(reg_clear_resv_pkt_cnt_sp_fe_pipe7),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe0(reg_clear_resv_pkt_cnt_sp_fs_pipe0),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe1(reg_clear_resv_pkt_cnt_sp_fs_pipe1),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe2(reg_clear_resv_pkt_cnt_sp_fs_pipe2),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe3(reg_clear_resv_pkt_cnt_sp_fs_pipe3),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe4(reg_clear_resv_pkt_cnt_sp_fs_pipe4),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe5(reg_clear_resv_pkt_cnt_sp_fs_pipe5),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe6(reg_clear_resv_pkt_cnt_sp_fs_pipe6),
					     .reg_clear_resv_pkt_cnt_sp_fs_pipe7(reg_clear_resv_pkt_cnt_sp_fs_pipe7),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe0(reg_clear_resv_pkt_cnt_sp_le_pipe0),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe1(reg_clear_resv_pkt_cnt_sp_le_pipe1),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe2(reg_clear_resv_pkt_cnt_sp_le_pipe2),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe3(reg_clear_resv_pkt_cnt_sp_le_pipe3),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe4(reg_clear_resv_pkt_cnt_sp_le_pipe4),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe5(reg_clear_resv_pkt_cnt_sp_le_pipe5),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe6(reg_clear_resv_pkt_cnt_sp_le_pipe6),
					     .reg_clear_resv_pkt_cnt_sp_le_pipe7(reg_clear_resv_pkt_cnt_sp_le_pipe7),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe0(reg_clear_resv_pkt_cnt_sp_ls_pipe0),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe1(reg_clear_resv_pkt_cnt_sp_ls_pipe1),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe2(reg_clear_resv_pkt_cnt_sp_ls_pipe2),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe3(reg_clear_resv_pkt_cnt_sp_ls_pipe3),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe4(reg_clear_resv_pkt_cnt_sp_ls_pipe4),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe5(reg_clear_resv_pkt_cnt_sp_ls_pipe5),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe6(reg_clear_resv_pkt_cnt_sp_ls_pipe6),
					     .reg_clear_resv_pkt_cnt_sp_ls_pipe7(reg_clear_resv_pkt_cnt_sp_ls_pipe7),
					     .reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold(reg_dbg_pkt_num_nonzero_and_fifo_empty_threshold[15:0]),
					     .reg_dbg_pkt_num_nonzero_threshold(reg_dbg_pkt_num_nonzero_threshold[15:0]),
					     .reg_dft_sync_tpram_config(reg_dft_sync_tpram_config[9:0]),
					     .reg_dft_tpram_config(reg_dft_tpram_config[8:0]),
					     .reg_last_byte_header_down_mux(reg_last_byte_header_down_mux),
					     .reg_resv_pkt_match_lp_dt_en_pipe0(reg_resv_pkt_match_lp_dt_en_pipe0),
					     .reg_resv_pkt_match_lp_dt_en_pipe1(reg_resv_pkt_match_lp_dt_en_pipe1),
					     .reg_resv_pkt_match_lp_dt_en_pipe2(reg_resv_pkt_match_lp_dt_en_pipe2),
					     .reg_resv_pkt_match_lp_dt_en_pipe3(reg_resv_pkt_match_lp_dt_en_pipe3),
					     .reg_resv_pkt_match_lp_dt_en_pipe4(reg_resv_pkt_match_lp_dt_en_pipe4),
					     .reg_resv_pkt_match_lp_dt_en_pipe5(reg_resv_pkt_match_lp_dt_en_pipe5),
					     .reg_resv_pkt_match_lp_dt_en_pipe6(reg_resv_pkt_match_lp_dt_en_pipe6),
					     .reg_resv_pkt_match_lp_dt_en_pipe7(reg_resv_pkt_match_lp_dt_en_pipe7),
					     .reg_resv_pkt_match_lp_dt_pipe0(reg_resv_pkt_match_lp_dt_pipe0[5:0]),
					     .reg_resv_pkt_match_lp_dt_pipe1(reg_resv_pkt_match_lp_dt_pipe1[5:0]),
					     .reg_resv_pkt_match_lp_dt_pipe2(reg_resv_pkt_match_lp_dt_pipe2[5:0]),
					     .reg_resv_pkt_match_lp_dt_pipe3(reg_resv_pkt_match_lp_dt_pipe3[5:0]),
					     .reg_resv_pkt_match_lp_dt_pipe4(reg_resv_pkt_match_lp_dt_pipe4[5:0]),
					     .reg_resv_pkt_match_lp_dt_pipe5(reg_resv_pkt_match_lp_dt_pipe5[5:0]),
					     .reg_resv_pkt_match_lp_dt_pipe6(reg_resv_pkt_match_lp_dt_pipe6[5:0]),
					     .reg_resv_pkt_match_lp_dt_pipe7(reg_resv_pkt_match_lp_dt_pipe7[5:0]),
					     .reg_sram_lcrc_err_oen(reg_sram_lcrc_err_oen[7:0]),
					     .reg_video_fifo_empty_depend_cnt_mux(reg_video_fifo_empty_depend_cnt_mux),
					     .reg_video_pipe_en	(reg_video_pipe_en[7:0]),
					     .time_window0	(time_window0[16:0]),
					     .time_window1	(time_window1[16:0]),
					     .time_window2	(time_window2[16:0]),
					     .time_window3	(time_window3[16:0]),
					     .time_window4	(time_window4[16:0]),
					     .time_window5	(time_window5[16:0]),
					     .time_window6	(time_window6[16:0]),
					     .time_window7	(time_window7[16:0]),
					     .up_state_video_pipe0(up_state_video_pipe0),
					     .up_state_video_pipe1(up_state_video_pipe1),
					     .up_state_video_pipe2(up_state_video_pipe2),
					     .up_state_video_pipe3(up_state_video_pipe3),
					     .up_state_video_pipe4(up_state_video_pipe4),
					     .up_state_video_pipe5(up_state_video_pipe5),
					     .up_state_video_pipe6(up_state_video_pipe6),
					     .up_state_video_pipe7(up_state_video_pipe7),
					     .video_loss_en0	(video_loss_en0),
					     .video_loss_en1	(video_loss_en1),
					     .video_loss_en2	(video_loss_en2),
					     .video_loss_en3	(video_loss_en3),
					     .video_loss_en4	(video_loss_en4),
					     .video_loss_en5	(video_loss_en5),
					     .video_loss_en6	(video_loss_en6),
					     .video_loss_en7	(video_loss_en7),
					     .pipe_fifo_full_clear(pipe_fifo_full_clear[7:0]));


/*  as6d_app_aggr  AUTO_TEMPLATE (
                 .in_video_data_vld\(.*\)(pipe2sch_video_data_vld\1),
                 .in_video_data\(.*\) (pipe2sch_video_data\1[]),
                 .sch2post_video_data_vld\(.*\)(sch2post_video_data_vld\1),
                 .csi2device\(.*\)_idi_anti_halt    (), 
                 .csi2device\(.*\)_idi_halt            (), 
                 .csi2device\(.*\)                    (aggr\1[]),
                 .video_data_fifo_empty\(.*\)(video_data_fwft_fifo_empty\1),
                 .sch\(.*\)_fse_filter(reg_sch\1_fse_filter),
)*/
as6d_app_aggr    u_as6d_app_aggregator(
                       .ack0        (ack0),
                       .ack1        (ack1),
                       .ack2        (ack2),
                       .ack3        (ack3),
                       .line_end0    (line_end0),
                       .line_end1    (line_end1),
                       .line_end2    (line_end2),
                       .line_end3    (line_end3),
                      /*AUTOINST*/
				       // Outputs
				       .app_aggr_idi_crc_err_int0(app_aggr_idi_crc_err_int0),
				       .app_aggr_idi_crc_err_int1(app_aggr_idi_crc_err_int1),
				       .app_aggr_idi_crc_err_int2(app_aggr_idi_crc_err_int2),
				       .app_aggr_idi_crc_err_int3(app_aggr_idi_crc_err_int3),
				       .csi2device0_idi_byte_en(aggr0_idi_byte_en[3:0]), // Templated
				       .csi2device0_idi_data(aggr0_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
				       .csi2device0_idi_data_en(aggr0_idi_data_en), // Templated
				       .csi2device0_idi_data_parity(aggr0_idi_data_parity[20:0]), // Templated
				       .csi2device0_idi_data_type(aggr0_idi_data_type[5:0]), // Templated
				       .csi2device0_idi_header_en(aggr0_idi_header_en), // Templated
				       .csi2device0_idi_tunnel_mode_en(aggr0_idi_tunnel_mode_en), // Templated
				       .csi2device0_idi_virtual_channel(aggr0_idi_virtual_channel[1:0]), // Templated
				       .csi2device0_idi_virtual_channel_x(aggr0_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
				       .csi2device0_idi_word_count(aggr0_idi_word_count[15:0]), // Templated
				       .csi2device1_idi_byte_en(aggr1_idi_byte_en[3:0]), // Templated
				       .csi2device1_idi_data(aggr1_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
				       .csi2device1_idi_data_en(aggr1_idi_data_en), // Templated
				       .csi2device1_idi_data_parity(aggr1_idi_data_parity[20:0]), // Templated
				       .csi2device1_idi_data_type(aggr1_idi_data_type[5:0]), // Templated
				       .csi2device1_idi_header_en(aggr1_idi_header_en), // Templated
				       .csi2device1_idi_tunnel_mode_en(aggr1_idi_tunnel_mode_en), // Templated
				       .csi2device1_idi_virtual_channel(aggr1_idi_virtual_channel[1:0]), // Templated
				       .csi2device1_idi_virtual_channel_x(aggr1_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
				       .csi2device1_idi_word_count(aggr1_idi_word_count[15:0]), // Templated
				       .csi2device2_idi_byte_en(aggr2_idi_byte_en[3:0]), // Templated
				       .csi2device2_idi_data(aggr2_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
				       .csi2device2_idi_data_en(aggr2_idi_data_en), // Templated
				       .csi2device2_idi_data_parity(aggr2_idi_data_parity[20:0]), // Templated
				       .csi2device2_idi_data_type(aggr2_idi_data_type[5:0]), // Templated
				       .csi2device2_idi_header_en(aggr2_idi_header_en), // Templated
				       .csi2device2_idi_tunnel_mode_en(aggr2_idi_tunnel_mode_en), // Templated
				       .csi2device2_idi_virtual_channel(aggr2_idi_virtual_channel[1:0]), // Templated
				       .csi2device2_idi_virtual_channel_x(aggr2_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
				       .csi2device2_idi_word_count(aggr2_idi_word_count[15:0]), // Templated
				       .csi2device3_idi_byte_en(aggr3_idi_byte_en[3:0]), // Templated
				       .csi2device3_idi_data(aggr3_idi_data[`CSI2_DEVICE_IDI_DATA_WIDTH-1:0]), // Templated
				       .csi2device3_idi_data_en(aggr3_idi_data_en), // Templated
				       .csi2device3_idi_data_parity(aggr3_idi_data_parity[20:0]), // Templated
				       .csi2device3_idi_data_type(aggr3_idi_data_type[5:0]), // Templated
				       .csi2device3_idi_header_en(aggr3_idi_header_en), // Templated
				       .csi2device3_idi_tunnel_mode_en(aggr3_idi_tunnel_mode_en), // Templated
				       .csi2device3_idi_virtual_channel(aggr3_idi_virtual_channel[1:0]), // Templated
				       .csi2device3_idi_virtual_channel_x(aggr3_idi_virtual_channel_x[`CSI2_DEVICE_VCX_DWIDTH-1:0]), // Templated
				       .csi2device3_idi_word_count(aggr3_idi_word_count[15:0]), // Templated
				       .reg_rd_send_pkt_cnt_lp_pf_aggr0(reg_rd_send_pkt_cnt_lp_pf_aggr0[31:0]),
				       .reg_rd_send_pkt_cnt_lp_pf_aggr1(reg_rd_send_pkt_cnt_lp_pf_aggr1[31:0]),
				       .reg_rd_send_pkt_cnt_lp_pf_aggr2(reg_rd_send_pkt_cnt_lp_pf_aggr2[31:0]),
				       .reg_rd_send_pkt_cnt_lp_pf_aggr3(reg_rd_send_pkt_cnt_lp_pf_aggr3[31:0]),
				       .reg_rd_send_pkt_cnt_lp_ph_aggr0(reg_rd_send_pkt_cnt_lp_ph_aggr0[31:0]),
				       .reg_rd_send_pkt_cnt_lp_ph_aggr1(reg_rd_send_pkt_cnt_lp_ph_aggr1[31:0]),
				       .reg_rd_send_pkt_cnt_lp_ph_aggr2(reg_rd_send_pkt_cnt_lp_ph_aggr2[31:0]),
				       .reg_rd_send_pkt_cnt_lp_ph_aggr3(reg_rd_send_pkt_cnt_lp_ph_aggr3[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fe_aggr0(reg_rd_send_pkt_cnt_sp_fe_aggr0[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fe_aggr1(reg_rd_send_pkt_cnt_sp_fe_aggr1[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fe_aggr2(reg_rd_send_pkt_cnt_sp_fe_aggr2[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fe_aggr3(reg_rd_send_pkt_cnt_sp_fe_aggr3[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fs_aggr0(reg_rd_send_pkt_cnt_sp_fs_aggr0[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fs_aggr1(reg_rd_send_pkt_cnt_sp_fs_aggr1[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fs_aggr2(reg_rd_send_pkt_cnt_sp_fs_aggr2[31:0]),
				       .reg_rd_send_pkt_cnt_sp_fs_aggr3(reg_rd_send_pkt_cnt_sp_fs_aggr3[31:0]),
				       .reg_rd_send_pkt_cnt_sp_le_aggr0(reg_rd_send_pkt_cnt_sp_le_aggr0[31:0]),
				       .reg_rd_send_pkt_cnt_sp_le_aggr1(reg_rd_send_pkt_cnt_sp_le_aggr1[31:0]),
				       .reg_rd_send_pkt_cnt_sp_le_aggr2(reg_rd_send_pkt_cnt_sp_le_aggr2[31:0]),
				       .reg_rd_send_pkt_cnt_sp_le_aggr3(reg_rd_send_pkt_cnt_sp_le_aggr3[31:0]),
				       .reg_rd_send_pkt_cnt_sp_ls_aggr0(reg_rd_send_pkt_cnt_sp_ls_aggr0[31:0]),
				       .reg_rd_send_pkt_cnt_sp_ls_aggr1(reg_rd_send_pkt_cnt_sp_ls_aggr1[31:0]),
				       .reg_rd_send_pkt_cnt_sp_ls_aggr2(reg_rd_send_pkt_cnt_sp_ls_aggr2[31:0]),
				       .reg_rd_send_pkt_cnt_sp_ls_aggr3(reg_rd_send_pkt_cnt_sp_ls_aggr3[31:0]),
				       .sch0_ack_aggre	(sch0_ack_aggre[7:0]),
				       .sch0_ack_concat	(sch0_ack_concat[3:0]),
				       .sch0_aggre_busy	(sch0_aggre_busy),
				       .sch0_cs		(sch0_cs[3:0]),
				       .sch0_line_end_aggre(sch0_line_end_aggre[7:0]),
				       .sch0_line_end_concat(sch0_line_end_concat[3:0]),
				       .sch0_up_state_aggre(sch0_up_state_aggre[7:0]),
				       .sch0_up_state_concat(sch0_up_state_concat[3:0]),
				       .sch1_ack_aggre	(sch1_ack_aggre[7:0]),
				       .sch1_ack_concat	(sch1_ack_concat[3:0]),
				       .sch1_aggre_busy	(sch1_aggre_busy),
				       .sch1_cs		(sch1_cs[3:0]),
				       .sch1_line_end_aggre(sch1_line_end_aggre[7:0]),
				       .sch1_line_end_concat(sch1_line_end_concat[3:0]),
				       .sch1_up_state_aggre(sch1_up_state_aggre[7:0]),
				       .sch1_up_state_concat(sch1_up_state_concat[3:0]),
				       .sch2_ack_aggre	(sch2_ack_aggre[7:0]),
				       .sch2_ack_concat	(sch2_ack_concat[3:0]),
				       .sch2_aggre_busy	(sch2_aggre_busy),
				       .sch2_cs		(sch2_cs[3:0]),
				       .sch2_line_end_aggre(sch2_line_end_aggre[7:0]),
				       .sch2_line_end_concat(sch2_line_end_concat[3:0]),
				       .sch2_up_state_aggre(sch2_up_state_aggre[7:0]),
				       .sch2_up_state_concat(sch2_up_state_concat[3:0]),
				       .sch2post_video_data_vld0(sch2post_video_data_vld0), // Templated
				       .sch2post_video_data_vld1(sch2post_video_data_vld1), // Templated
				       .sch2post_video_data_vld2(sch2post_video_data_vld2), // Templated
				       .sch2post_video_data_vld3(sch2post_video_data_vld3), // Templated
				       .sch3_ack_aggre	(sch3_ack_aggre[7:0]),
				       .sch3_ack_concat	(sch3_ack_concat[3:0]),
				       .sch3_aggre_busy	(sch3_aggre_busy),
				       .sch3_cs		(sch3_cs[3:0]),
				       .sch3_line_end_aggre(sch3_line_end_aggre[7:0]),
				       .sch3_line_end_concat(sch3_line_end_concat[3:0]),
				       .sch3_up_state_aggre(sch3_up_state_aggre[7:0]),
				       .sch3_up_state_concat(sch3_up_state_concat[3:0]),
				       .sch_data_type_align_fail_int0(sch_data_type_align_fail_int0),
				       .sch_data_type_align_fail_int1(sch_data_type_align_fail_int1),
				       .sch_data_type_align_fail_int2(sch_data_type_align_fail_int2),
				       .sch_data_type_align_fail_int3(sch_data_type_align_fail_int3),
				       .up_state_video_pipe0(up_state_video_pipe0),
				       .up_state_video_pipe1(up_state_video_pipe1),
				       .up_state_video_pipe2(up_state_video_pipe2),
				       .up_state_video_pipe3(up_state_video_pipe3),
				       .up_state_video_pipe4(up_state_video_pipe4),
				       .up_state_video_pipe5(up_state_video_pipe5),
				       .up_state_video_pipe6(up_state_video_pipe6),
				       .up_state_video_pipe7(up_state_video_pipe7),
				       // Inputs
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
				       .ack_vld_pipe0_aggregator0(ack_vld_pipe0_aggregator0),
				       .ack_vld_pipe0_aggregator1(ack_vld_pipe0_aggregator1),
				       .ack_vld_pipe0_aggregator2(ack_vld_pipe0_aggregator2),
				       .ack_vld_pipe0_aggregator3(ack_vld_pipe0_aggregator3),
				       .ack_vld_pipe1_aggregator0(ack_vld_pipe1_aggregator0),
				       .ack_vld_pipe1_aggregator1(ack_vld_pipe1_aggregator1),
				       .ack_vld_pipe1_aggregator2(ack_vld_pipe1_aggregator2),
				       .ack_vld_pipe1_aggregator3(ack_vld_pipe1_aggregator3),
				       .ack_vld_pipe2_aggregator0(ack_vld_pipe2_aggregator0),
				       .ack_vld_pipe2_aggregator1(ack_vld_pipe2_aggregator1),
				       .ack_vld_pipe2_aggregator2(ack_vld_pipe2_aggregator2),
				       .ack_vld_pipe2_aggregator3(ack_vld_pipe2_aggregator3),
				       .ack_vld_pipe3_aggregator0(ack_vld_pipe3_aggregator0),
				       .ack_vld_pipe3_aggregator1(ack_vld_pipe3_aggregator1),
				       .ack_vld_pipe3_aggregator2(ack_vld_pipe3_aggregator2),
				       .ack_vld_pipe3_aggregator3(ack_vld_pipe3_aggregator3),
				       .ack_vld_pipe4_aggregator0(ack_vld_pipe4_aggregator0),
				       .ack_vld_pipe4_aggregator1(ack_vld_pipe4_aggregator1),
				       .ack_vld_pipe4_aggregator2(ack_vld_pipe4_aggregator2),
				       .ack_vld_pipe4_aggregator3(ack_vld_pipe4_aggregator3),
				       .ack_vld_pipe5_aggregator0(ack_vld_pipe5_aggregator0),
				       .ack_vld_pipe5_aggregator1(ack_vld_pipe5_aggregator1),
				       .ack_vld_pipe5_aggregator2(ack_vld_pipe5_aggregator2),
				       .ack_vld_pipe5_aggregator3(ack_vld_pipe5_aggregator3),
				       .ack_vld_pipe6_aggregator0(ack_vld_pipe6_aggregator0),
				       .ack_vld_pipe6_aggregator1(ack_vld_pipe6_aggregator1),
				       .ack_vld_pipe6_aggregator2(ack_vld_pipe6_aggregator2),
				       .ack_vld_pipe6_aggregator3(ack_vld_pipe6_aggregator3),
				       .ack_vld_pipe7_aggregator0(ack_vld_pipe7_aggregator0),
				       .ack_vld_pipe7_aggregator1(ack_vld_pipe7_aggregator1),
				       .ack_vld_pipe7_aggregator2(ack_vld_pipe7_aggregator2),
				       .ack_vld_pipe7_aggregator3(ack_vld_pipe7_aggregator3),
				       .aggre_clk0	(aggre_clk0),
				       .aggre_clk1	(aggre_clk1),
				       .aggre_clk2	(aggre_clk2),
				       .aggre_clk3	(aggre_clk3),
				       .aggre_clk_rst_n0(aggre_clk_rst_n0),
				       .aggre_clk_rst_n1(aggre_clk_rst_n1),
				       .aggre_clk_rst_n2(aggre_clk_rst_n2),
				       .aggre_clk_rst_n3(aggre_clk_rst_n3),
				       .app_aggregation_bypass(app_aggregation_bypass),
				       .csi2device0_idi_anti_halt(),	 // Templated
				       .csi2device0_idi_halt(),		 // Templated
				       .csi2device1_idi_anti_halt(),	 // Templated
				       .csi2device1_idi_halt(),		 // Templated
				       .csi2device2_idi_anti_halt(),	 // Templated
				       .csi2device2_idi_halt(),		 // Templated
				       .csi2device3_idi_anti_halt(),	 // Templated
				       .csi2device3_idi_halt(),		 // Templated
				       .empty_vld_pipe0_aggregator0(empty_vld_pipe0_aggregator0),
				       .empty_vld_pipe0_aggregator1(empty_vld_pipe0_aggregator1),
				       .empty_vld_pipe0_aggregator2(empty_vld_pipe0_aggregator2),
				       .empty_vld_pipe0_aggregator3(empty_vld_pipe0_aggregator3),
				       .empty_vld_pipe1_aggregator0(empty_vld_pipe1_aggregator0),
				       .empty_vld_pipe1_aggregator1(empty_vld_pipe1_aggregator1),
				       .empty_vld_pipe1_aggregator2(empty_vld_pipe1_aggregator2),
				       .empty_vld_pipe1_aggregator3(empty_vld_pipe1_aggregator3),
				       .empty_vld_pipe2_aggregator0(empty_vld_pipe2_aggregator0),
				       .empty_vld_pipe2_aggregator1(empty_vld_pipe2_aggregator1),
				       .empty_vld_pipe2_aggregator2(empty_vld_pipe2_aggregator2),
				       .empty_vld_pipe2_aggregator3(empty_vld_pipe2_aggregator3),
				       .empty_vld_pipe3_aggregator0(empty_vld_pipe3_aggregator0),
				       .empty_vld_pipe3_aggregator1(empty_vld_pipe3_aggregator1),
				       .empty_vld_pipe3_aggregator2(empty_vld_pipe3_aggregator2),
				       .empty_vld_pipe3_aggregator3(empty_vld_pipe3_aggregator3),
				       .empty_vld_pipe4_aggregator0(empty_vld_pipe4_aggregator0),
				       .empty_vld_pipe4_aggregator1(empty_vld_pipe4_aggregator1),
				       .empty_vld_pipe4_aggregator2(empty_vld_pipe4_aggregator2),
				       .empty_vld_pipe4_aggregator3(empty_vld_pipe4_aggregator3),
				       .empty_vld_pipe5_aggregator0(empty_vld_pipe5_aggregator0),
				       .empty_vld_pipe5_aggregator1(empty_vld_pipe5_aggregator1),
				       .empty_vld_pipe5_aggregator2(empty_vld_pipe5_aggregator2),
				       .empty_vld_pipe5_aggregator3(empty_vld_pipe5_aggregator3),
				       .empty_vld_pipe6_aggregator0(empty_vld_pipe6_aggregator0),
				       .empty_vld_pipe6_aggregator1(empty_vld_pipe6_aggregator1),
				       .empty_vld_pipe6_aggregator2(empty_vld_pipe6_aggregator2),
				       .empty_vld_pipe6_aggregator3(empty_vld_pipe6_aggregator3),
				       .empty_vld_pipe7_aggregator0(empty_vld_pipe7_aggregator0),
				       .empty_vld_pipe7_aggregator1(empty_vld_pipe7_aggregator1),
				       .empty_vld_pipe7_aggregator2(empty_vld_pipe7_aggregator2),
				       .empty_vld_pipe7_aggregator3(empty_vld_pipe7_aggregator3),
				       .in_video_data0	(pipe2sch_video_data0[139:0]), // Templated
				       .in_video_data1	(pipe2sch_video_data1[139:0]), // Templated
				       .in_video_data2	(pipe2sch_video_data2[139:0]), // Templated
				       .in_video_data3	(pipe2sch_video_data3[139:0]), // Templated
				       .in_video_data4	(pipe2sch_video_data4[139:0]), // Templated
				       .in_video_data5	(pipe2sch_video_data5[139:0]), // Templated
				       .in_video_data6	(pipe2sch_video_data6[139:0]), // Templated
				       .in_video_data7	(pipe2sch_video_data7[139:0]), // Templated
				       .in_video_data_vld0(pipe2sch_video_data_vld0), // Templated
				       .in_video_data_vld1(pipe2sch_video_data_vld1), // Templated
				       .in_video_data_vld2(pipe2sch_video_data_vld2), // Templated
				       .in_video_data_vld3(pipe2sch_video_data_vld3), // Templated
				       .in_video_data_vld4(pipe2sch_video_data_vld4), // Templated
				       .in_video_data_vld5(pipe2sch_video_data_vld5), // Templated
				       .in_video_data_vld6(pipe2sch_video_data_vld6), // Templated
				       .in_video_data_vld7(pipe2sch_video_data_vld7), // Templated
				       .line_end4	(line_end4),
				       .line_end5	(line_end5),
				       .line_end6	(line_end6),
				       .line_end7	(line_end7),
				       .line_end_vld_pipe0_aggregator0(line_end_vld_pipe0_aggregator0),
				       .line_end_vld_pipe0_aggregator1(line_end_vld_pipe0_aggregator1),
				       .line_end_vld_pipe0_aggregator2(line_end_vld_pipe0_aggregator2),
				       .line_end_vld_pipe0_aggregator3(line_end_vld_pipe0_aggregator3),
				       .line_end_vld_pipe1_aggregator0(line_end_vld_pipe1_aggregator0),
				       .line_end_vld_pipe1_aggregator1(line_end_vld_pipe1_aggregator1),
				       .line_end_vld_pipe1_aggregator2(line_end_vld_pipe1_aggregator2),
				       .line_end_vld_pipe1_aggregator3(line_end_vld_pipe1_aggregator3),
				       .line_end_vld_pipe2_aggregator0(line_end_vld_pipe2_aggregator0),
				       .line_end_vld_pipe2_aggregator1(line_end_vld_pipe2_aggregator1),
				       .line_end_vld_pipe2_aggregator2(line_end_vld_pipe2_aggregator2),
				       .line_end_vld_pipe2_aggregator3(line_end_vld_pipe2_aggregator3),
				       .line_end_vld_pipe3_aggregator0(line_end_vld_pipe3_aggregator0),
				       .line_end_vld_pipe3_aggregator1(line_end_vld_pipe3_aggregator1),
				       .line_end_vld_pipe3_aggregator2(line_end_vld_pipe3_aggregator2),
				       .line_end_vld_pipe3_aggregator3(line_end_vld_pipe3_aggregator3),
				       .line_end_vld_pipe4_aggregator0(line_end_vld_pipe4_aggregator0),
				       .line_end_vld_pipe4_aggregator1(line_end_vld_pipe4_aggregator1),
				       .line_end_vld_pipe4_aggregator2(line_end_vld_pipe4_aggregator2),
				       .line_end_vld_pipe4_aggregator3(line_end_vld_pipe4_aggregator3),
				       .line_end_vld_pipe5_aggregator0(line_end_vld_pipe5_aggregator0),
				       .line_end_vld_pipe5_aggregator1(line_end_vld_pipe5_aggregator1),
				       .line_end_vld_pipe5_aggregator2(line_end_vld_pipe5_aggregator2),
				       .line_end_vld_pipe5_aggregator3(line_end_vld_pipe5_aggregator3),
				       .line_end_vld_pipe6_aggregator0(line_end_vld_pipe6_aggregator0),
				       .line_end_vld_pipe6_aggregator1(line_end_vld_pipe6_aggregator1),
				       .line_end_vld_pipe6_aggregator2(line_end_vld_pipe6_aggregator2),
				       .line_end_vld_pipe6_aggregator3(line_end_vld_pipe6_aggregator3),
				       .line_end_vld_pipe7_aggregator0(line_end_vld_pipe7_aggregator0),
				       .line_end_vld_pipe7_aggregator1(line_end_vld_pipe7_aggregator1),
				       .line_end_vld_pipe7_aggregator2(line_end_vld_pipe7_aggregator2),
				       .line_end_vld_pipe7_aggregator3(line_end_vld_pipe7_aggregator3),
				       .reg_app_aggr0_vc_bit_override_en(reg_app_aggr0_vc_bit_override_en[2:0]),
				       .reg_app_aggr0_vc_bit_override_value(reg_app_aggr0_vc_bit_override_value[2:0]),
				       .reg_app_aggr1_vc_bit_override_en(reg_app_aggr1_vc_bit_override_en[2:0]),
				       .reg_app_aggr1_vc_bit_override_value(reg_app_aggr1_vc_bit_override_value[2:0]),
				       .reg_app_aggr2_vc_bit_override_en(reg_app_aggr2_vc_bit_override_en[2:0]),
				       .reg_app_aggr2_vc_bit_override_value(reg_app_aggr2_vc_bit_override_value[2:0]),
				       .reg_app_aggr3_vc_bit_override_en(reg_app_aggr3_vc_bit_override_en[2:0]),
				       .reg_app_aggr3_vc_bit_override_value(reg_app_aggr3_vc_bit_override_value[2:0]),
				       .reg_app_aggr_idi_crc_chk_en(reg_app_aggr_idi_crc_chk_en[3:0]),
				       .reg_clear_send_pkt_cnt_lp_pf_aggr0(reg_clear_send_pkt_cnt_lp_pf_aggr0),
				       .reg_clear_send_pkt_cnt_lp_pf_aggr1(reg_clear_send_pkt_cnt_lp_pf_aggr1),
				       .reg_clear_send_pkt_cnt_lp_pf_aggr2(reg_clear_send_pkt_cnt_lp_pf_aggr2),
				       .reg_clear_send_pkt_cnt_lp_pf_aggr3(reg_clear_send_pkt_cnt_lp_pf_aggr3),
				       .reg_clear_send_pkt_cnt_lp_ph_aggr0(reg_clear_send_pkt_cnt_lp_ph_aggr0),
				       .reg_clear_send_pkt_cnt_lp_ph_aggr1(reg_clear_send_pkt_cnt_lp_ph_aggr1),
				       .reg_clear_send_pkt_cnt_lp_ph_aggr2(reg_clear_send_pkt_cnt_lp_ph_aggr2),
				       .reg_clear_send_pkt_cnt_lp_ph_aggr3(reg_clear_send_pkt_cnt_lp_ph_aggr3),
				       .reg_clear_send_pkt_cnt_sp_fe_aggr0(reg_clear_send_pkt_cnt_sp_fe_aggr0),
				       .reg_clear_send_pkt_cnt_sp_fe_aggr1(reg_clear_send_pkt_cnt_sp_fe_aggr1),
				       .reg_clear_send_pkt_cnt_sp_fe_aggr2(reg_clear_send_pkt_cnt_sp_fe_aggr2),
				       .reg_clear_send_pkt_cnt_sp_fe_aggr3(reg_clear_send_pkt_cnt_sp_fe_aggr3),
				       .reg_clear_send_pkt_cnt_sp_fs_aggr0(reg_clear_send_pkt_cnt_sp_fs_aggr0),
				       .reg_clear_send_pkt_cnt_sp_fs_aggr1(reg_clear_send_pkt_cnt_sp_fs_aggr1),
				       .reg_clear_send_pkt_cnt_sp_fs_aggr2(reg_clear_send_pkt_cnt_sp_fs_aggr2),
				       .reg_clear_send_pkt_cnt_sp_fs_aggr3(reg_clear_send_pkt_cnt_sp_fs_aggr3),
				       .reg_clear_send_pkt_cnt_sp_le_aggr0(reg_clear_send_pkt_cnt_sp_le_aggr0),
				       .reg_clear_send_pkt_cnt_sp_le_aggr1(reg_clear_send_pkt_cnt_sp_le_aggr1),
				       .reg_clear_send_pkt_cnt_sp_le_aggr2(reg_clear_send_pkt_cnt_sp_le_aggr2),
				       .reg_clear_send_pkt_cnt_sp_le_aggr3(reg_clear_send_pkt_cnt_sp_le_aggr3),
				       .reg_clear_send_pkt_cnt_sp_ls_aggr0(reg_clear_send_pkt_cnt_sp_ls_aggr0),
				       .reg_clear_send_pkt_cnt_sp_ls_aggr1(reg_clear_send_pkt_cnt_sp_ls_aggr1),
				       .reg_clear_send_pkt_cnt_sp_ls_aggr2(reg_clear_send_pkt_cnt_sp_ls_aggr2),
				       .reg_clear_send_pkt_cnt_sp_ls_aggr3(reg_clear_send_pkt_cnt_sp_ls_aggr3),
				       .reg_delete_lp_depend_on_wc_mux(reg_delete_lp_depend_on_wc_mux),
				       .reg_send_pkt_match_lp_dt_aggr0(reg_send_pkt_match_lp_dt_aggr0[5:0]),
				       .reg_send_pkt_match_lp_dt_aggr1(reg_send_pkt_match_lp_dt_aggr1[5:0]),
				       .reg_send_pkt_match_lp_dt_aggr2(reg_send_pkt_match_lp_dt_aggr2[5:0]),
				       .reg_send_pkt_match_lp_dt_aggr3(reg_send_pkt_match_lp_dt_aggr3[5:0]),
				       .reg_send_pkt_match_lp_dt_en_aggr0(reg_send_pkt_match_lp_dt_en_aggr0),
				       .reg_send_pkt_match_lp_dt_en_aggr1(reg_send_pkt_match_lp_dt_en_aggr1),
				       .reg_send_pkt_match_lp_dt_en_aggr2(reg_send_pkt_match_lp_dt_en_aggr2),
				       .reg_send_pkt_match_lp_dt_en_aggr3(reg_send_pkt_match_lp_dt_en_aggr3),
					  .reg_sync_aggr_check_framecount(reg_sync_aggr_check_framecount),
					  .reg_sync_aggr_check_linecount(reg_sync_aggr_check_linecount),
				       .sch0_aggre_mode	(sch0_aggre_mode[1:0]),
				       .sch0_frame_sync_lock(sch0_frame_sync_lock),
				       .sch0_fse_filter	(reg_sch0_fse_filter), // Templated
				       .sch0_master_pipe(sch0_master_pipe[1:0]),
				       .sch0_pipe0_aggre_en(sch0_pipe0_aggre_en),
				       .sch0_pipe0_concat_en(sch0_pipe0_concat_en),
				       .sch0_pipe1_aggre_en(sch0_pipe1_aggre_en),
				       .sch0_pipe1_concat_en(sch0_pipe1_concat_en),
				       .sch0_pipe2_aggre_en(sch0_pipe2_aggre_en),
				       .sch0_pipe2_concat_en(sch0_pipe2_concat_en),
				       .sch0_pipe3_aggre_en(sch0_pipe3_aggre_en),
				       .sch0_pipe3_concat_en(sch0_pipe3_concat_en),
				       .sch0_pipe4_aggre_en(sch0_pipe4_aggre_en),
				       .sch0_pipe5_aggre_en(sch0_pipe5_aggre_en),
				       .sch0_pipe6_aggre_en(sch0_pipe6_aggre_en),
				       .sch0_pipe7_aggre_en(sch0_pipe7_aggre_en),
				       .sch1_aggre_mode	(sch1_aggre_mode[1:0]),
				       .sch1_frame_sync_lock(sch1_frame_sync_lock),
				       .sch1_fse_filter	(reg_sch1_fse_filter), // Templated
				       .sch1_master_pipe(sch1_master_pipe[1:0]),
				       .sch1_pipe0_aggre_en(sch1_pipe0_aggre_en),
				       .sch1_pipe0_concat_en(sch1_pipe0_concat_en),
				       .sch1_pipe1_aggre_en(sch1_pipe1_aggre_en),
				       .sch1_pipe1_concat_en(sch1_pipe1_concat_en),
				       .sch1_pipe2_aggre_en(sch1_pipe2_aggre_en),
				       .sch1_pipe2_concat_en(sch1_pipe2_concat_en),
				       .sch1_pipe3_aggre_en(sch1_pipe3_aggre_en),
				       .sch1_pipe3_concat_en(sch1_pipe3_concat_en),
				       .sch1_pipe4_aggre_en(sch1_pipe4_aggre_en),
				       .sch1_pipe5_aggre_en(sch1_pipe5_aggre_en),
				       .sch1_pipe6_aggre_en(sch1_pipe6_aggre_en),
				       .sch1_pipe7_aggre_en(sch1_pipe7_aggre_en),
				       .sch2_aggre_mode	(sch2_aggre_mode[1:0]),
				       .sch2_frame_sync_lock(sch2_frame_sync_lock),
				       .sch2_fse_filter	(reg_sch2_fse_filter), // Templated
				       .sch2_master_pipe(sch2_master_pipe[1:0]),
				       .sch2_pipe0_aggre_en(sch2_pipe0_aggre_en),
				       .sch2_pipe0_concat_en(sch2_pipe0_concat_en),
				       .sch2_pipe1_aggre_en(sch2_pipe1_aggre_en),
				       .sch2_pipe1_concat_en(sch2_pipe1_concat_en),
				       .sch2_pipe2_aggre_en(sch2_pipe2_aggre_en),
				       .sch2_pipe2_concat_en(sch2_pipe2_concat_en),
				       .sch2_pipe3_aggre_en(sch2_pipe3_aggre_en),
				       .sch2_pipe3_concat_en(sch2_pipe3_concat_en),
				       .sch2_pipe4_aggre_en(sch2_pipe4_aggre_en),
				       .sch2_pipe5_aggre_en(sch2_pipe5_aggre_en),
				       .sch2_pipe6_aggre_en(sch2_pipe6_aggre_en),
				       .sch2_pipe7_aggre_en(sch2_pipe7_aggre_en),
				       .sch3_aggre_mode	(sch3_aggre_mode[1:0]),
				       .sch3_frame_sync_lock(sch3_frame_sync_lock),
				       .sch3_fse_filter	(reg_sch3_fse_filter), // Templated
				       .sch3_master_pipe(sch3_master_pipe[1:0]),
				       .sch3_pipe0_aggre_en(sch3_pipe0_aggre_en),
				       .sch3_pipe0_concat_en(sch3_pipe0_concat_en),
				       .sch3_pipe1_aggre_en(sch3_pipe1_aggre_en),
				       .sch3_pipe1_concat_en(sch3_pipe1_concat_en),
				       .sch3_pipe2_aggre_en(sch3_pipe2_aggre_en),
				       .sch3_pipe2_concat_en(sch3_pipe2_concat_en),
				       .sch3_pipe3_aggre_en(sch3_pipe3_aggre_en),
				       .sch3_pipe3_concat_en(sch3_pipe3_concat_en),
				       .sch3_pipe4_aggre_en(sch3_pipe4_aggre_en),
				       .sch3_pipe5_aggre_en(sch3_pipe5_aggre_en),
				       .sch3_pipe6_aggre_en(sch3_pipe6_aggre_en),
				       .sch3_pipe7_aggre_en(sch3_pipe7_aggre_en),
				       .video_data_fifo_empty0(video_data_fwft_fifo_empty0), // Templated
				       .video_data_fifo_empty1(video_data_fwft_fifo_empty1), // Templated
				       .video_data_fifo_empty2(video_data_fwft_fifo_empty2), // Templated
				       .video_data_fifo_empty3(video_data_fwft_fifo_empty3), // Templated
				       .video_data_fifo_empty4(video_data_fwft_fifo_empty4), // Templated
				       .video_data_fifo_empty5(video_data_fwft_fifo_empty5), // Templated
				       .video_data_fifo_empty6(video_data_fwft_fifo_empty6), // Templated
				       .video_data_fifo_empty7(video_data_fwft_fifo_empty7), // Templated
				       .video_loss0	(video_loss0),
				       .video_loss1	(video_loss1),
				       .video_loss2	(video_loss2),
				       .video_loss3	(video_loss3),
				       .video_pipe0_data_aggre_bypass(video_pipe0_data_aggre_bypass[139:0]),
				       .video_pipe0_vld_aggre_bypass(video_pipe0_vld_aggre_bypass),
				       .video_pipe1_data_aggre_bypass(video_pipe1_data_aggre_bypass[139:0]),
				       .video_pipe1_vld_aggre_bypass(video_pipe1_vld_aggre_bypass),
				       .video_pipe2_data_aggre_bypass(video_pipe2_data_aggre_bypass[139:0]),
				       .video_pipe2_vld_aggre_bypass(video_pipe2_vld_aggre_bypass),
				       .video_pipe3_data_aggre_bypass(video_pipe3_data_aggre_bypass[139:0]),
				       .video_pipe3_vld_aggre_bypass(video_pipe3_vld_aggre_bypass),
				       .video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
				       .video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
				       .video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
				       .video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
				       .video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
				       .video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
				       .video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
				       .video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3));

/*  as6d_app_mon_top  AUTO_TEMPLATE (
    .cpu_interface_clk    (1'd0),
    .cpu_interface_resetn(1'd0),
    .cnt_line_end_rd_side\(.*\)(reg_rd_pipe\1_dispatched_cnt_ready_for_sch[3:0]),
    .video_data_\(.*\)fifo_\(.*\)_err\(.*\)(video_data_\1fifo_mem_\2_err\3),
)*/  

as6d_app_mon_top    u_as6d_app_mon_top(/*AUTOINST*/
				       // Outputs
				       .PIN_DIG_TEST_BUS(PIN_DIG_TEST_BUS[15:0]),
				       .reg_rd_dig_test_bus(reg_rd_dig_test_bus[15:0]),
				       // Inputs
				       .cpu_interface_clk(1'd0),	 // Templated
				       .cpu_interface_resetn(1'd0),	 // Templated
				       .reg_testbus_hi8bsel_8bmode(reg_testbus_hi8bsel_8bmode),
				       .reg_testbus_sel_hi0(reg_testbus_sel_hi0[5:0]),
				       .reg_testbus_sel_hi1(reg_testbus_sel_hi1[5:0]),
				       .reg_testbus_sel_lo0(reg_testbus_sel_lo0[5:0]),
				       .reg_testbus_sel_lo1(reg_testbus_sel_lo1[5:0]),
				       .reg_testbus_sel_order0(reg_testbus_sel_order0[3:0]),
				       .reg_testbus_sel_order1(reg_testbus_sel_order1[3:0]),
				       .reg_testbus_sel_swap(reg_testbus_sel_swap[15:0]),
				       .video_loss0	(video_loss0),
				       .ack0		(ack0),
				       .line_end0	(line_end0),
				       .cnt_line_end_rd_side0(reg_rd_pipe0_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs0(fifo_rd_ctrl_cs0[2:0]),
				       .fs_detect_pipe0	(fs_detect_pipe0),
				       .up_state_video_pipe0(up_state_video_pipe0),
				       .pipe2sch_video_data_vld0(pipe2sch_video_data_vld0),
				       .video_data_afifo_double_err0(video_data_afifo_mem_double_err0), // Templated
				       .video_data_afifo_empty0(video_data_afifo_empty0),
				       .video_data_afifo_full0(video_data_afifo_full0),
				       .video_data_afifo_ovf_int0(video_data_afifo_ovf_int0),
				       .video_data_afifo_prog_empty0(video_data_afifo_prog_empty0),
				       .video_data_afifo_prog_full0(video_data_afifo_prog_full0),
				       .video_data_afifo_single_err0(video_data_afifo_mem_single_err0), // Templated
				       .video_data_afifo_udf_int0(video_data_afifo_udf_int0),
				       .video_data_fwft_fifo_double_err0(video_data_fwft_fifo_mem_double_err0), // Templated
				       .video_data_fwft_fifo_empty0(video_data_fwft_fifo_empty0),
				       .video_data_fwft_fifo_full0(video_data_fwft_fifo_full0),
				       .video_data_fwft_fifo_ovf_int0(video_data_fwft_fifo_ovf_int0),
				       .video_data_fwft_fifo_prog_full0(video_data_fwft_fifo_prog_full0),
				       .video_data_fwft_fifo_single_err0(video_data_fwft_fifo_mem_single_err0), // Templated
				       .video_data_fwft_fifo_udf_int0(video_data_fwft_fifo_udf_int0),
				       .empty_vld_pipe0_aggregator0(empty_vld_pipe0_aggregator0),
				       .empty_vld_pipe0_aggregator1(empty_vld_pipe0_aggregator1),
				       .empty_vld_pipe0_aggregator2(empty_vld_pipe0_aggregator2),
				       .empty_vld_pipe0_aggregator3(empty_vld_pipe0_aggregator3),
				       .video_loss1	(video_loss1),
				       .ack1		(ack1),
				       .line_end1	(line_end1),
				       .cnt_line_end_rd_side1(reg_rd_pipe1_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs1(fifo_rd_ctrl_cs1[2:0]),
				       .fs_detect_pipe1	(fs_detect_pipe1),
				       .up_state_video_pipe1(up_state_video_pipe1),
				       .pipe2sch_video_data_vld1(pipe2sch_video_data_vld1),
				       .video_data_afifo_double_err1(video_data_afifo_mem_double_err1), // Templated
				       .video_data_afifo_empty1(video_data_afifo_empty1),
				       .video_data_afifo_full1(video_data_afifo_full1),
				       .video_data_afifo_ovf_int1(video_data_afifo_ovf_int1),
				       .video_data_afifo_prog_empty1(video_data_afifo_prog_empty1),
				       .video_data_afifo_prog_full1(video_data_afifo_prog_full1),
				       .video_data_afifo_single_err1(video_data_afifo_mem_single_err1), // Templated
				       .video_data_afifo_udf_int1(video_data_afifo_udf_int1),
				       .video_data_fwft_fifo_double_err1(video_data_fwft_fifo_mem_double_err1), // Templated
				       .video_data_fwft_fifo_empty1(video_data_fwft_fifo_empty1),
				       .video_data_fwft_fifo_full1(video_data_fwft_fifo_full1),
				       .video_data_fwft_fifo_ovf_int1(video_data_fwft_fifo_ovf_int1),
				       .video_data_fwft_fifo_prog_full1(video_data_fwft_fifo_prog_full1),
				       .video_data_fwft_fifo_single_err1(video_data_fwft_fifo_mem_single_err1), // Templated
				       .video_data_fwft_fifo_udf_int1(video_data_fwft_fifo_udf_int1),
				       .empty_vld_pipe1_aggregator0(empty_vld_pipe1_aggregator0),
				       .empty_vld_pipe1_aggregator1(empty_vld_pipe1_aggregator1),
				       .empty_vld_pipe1_aggregator2(empty_vld_pipe1_aggregator2),
				       .empty_vld_pipe1_aggregator3(empty_vld_pipe1_aggregator3),
				       .video_loss2	(video_loss2),
				       .ack2		(ack2),
				       .line_end2	(line_end2),
				       .cnt_line_end_rd_side2(reg_rd_pipe2_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs2(fifo_rd_ctrl_cs2[2:0]),
				       .fs_detect_pipe2	(fs_detect_pipe2),
				       .up_state_video_pipe2(up_state_video_pipe2),
				       .pipe2sch_video_data_vld2(pipe2sch_video_data_vld2),
				       .video_data_afifo_double_err2(video_data_afifo_mem_double_err2), // Templated
				       .video_data_afifo_empty2(video_data_afifo_empty2),
				       .video_data_afifo_full2(video_data_afifo_full2),
				       .video_data_afifo_ovf_int2(video_data_afifo_ovf_int2),
				       .video_data_afifo_prog_empty2(video_data_afifo_prog_empty2),
				       .video_data_afifo_prog_full2(video_data_afifo_prog_full2),
				       .video_data_afifo_single_err2(video_data_afifo_mem_single_err2), // Templated
				       .video_data_afifo_udf_int2(video_data_afifo_udf_int2),
				       .video_data_fwft_fifo_double_err2(video_data_fwft_fifo_mem_double_err2), // Templated
				       .video_data_fwft_fifo_empty2(video_data_fwft_fifo_empty2),
				       .video_data_fwft_fifo_full2(video_data_fwft_fifo_full2),
				       .video_data_fwft_fifo_ovf_int2(video_data_fwft_fifo_ovf_int2),
				       .video_data_fwft_fifo_prog_full2(video_data_fwft_fifo_prog_full2),
				       .video_data_fwft_fifo_single_err2(video_data_fwft_fifo_mem_single_err2), // Templated
				       .video_data_fwft_fifo_udf_int2(video_data_fwft_fifo_udf_int2),
				       .empty_vld_pipe2_aggregator0(empty_vld_pipe2_aggregator0),
				       .empty_vld_pipe2_aggregator1(empty_vld_pipe2_aggregator1),
				       .empty_vld_pipe2_aggregator2(empty_vld_pipe2_aggregator2),
				       .empty_vld_pipe2_aggregator3(empty_vld_pipe2_aggregator3),
				       .video_loss3	(video_loss3),
				       .ack3		(ack3),
				       .line_end3	(line_end3),
				       .cnt_line_end_rd_side3(reg_rd_pipe3_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs3(fifo_rd_ctrl_cs3[2:0]),
				       .fs_detect_pipe3	(fs_detect_pipe3),
				       .up_state_video_pipe3(up_state_video_pipe3),
				       .pipe2sch_video_data_vld3(pipe2sch_video_data_vld3),
				       .video_data_afifo_double_err3(video_data_afifo_mem_double_err3), // Templated
				       .video_data_afifo_empty3(video_data_afifo_empty3),
				       .video_data_afifo_full3(video_data_afifo_full3),
				       .video_data_afifo_ovf_int3(video_data_afifo_ovf_int3),
				       .video_data_afifo_prog_empty3(video_data_afifo_prog_empty3),
				       .video_data_afifo_prog_full3(video_data_afifo_prog_full3),
				       .video_data_afifo_single_err3(video_data_afifo_mem_single_err3), // Templated
				       .video_data_afifo_udf_int3(video_data_afifo_udf_int3),
				       .video_data_fwft_fifo_double_err3(video_data_fwft_fifo_mem_double_err3), // Templated
				       .video_data_fwft_fifo_empty3(video_data_fwft_fifo_empty3),
				       .video_data_fwft_fifo_full3(video_data_fwft_fifo_full3),
				       .video_data_fwft_fifo_ovf_int3(video_data_fwft_fifo_ovf_int3),
				       .video_data_fwft_fifo_prog_full3(video_data_fwft_fifo_prog_full3),
				       .video_data_fwft_fifo_single_err3(video_data_fwft_fifo_mem_single_err3), // Templated
				       .video_data_fwft_fifo_udf_int3(video_data_fwft_fifo_udf_int3),
				       .empty_vld_pipe3_aggregator0(empty_vld_pipe3_aggregator0),
				       .empty_vld_pipe3_aggregator1(empty_vld_pipe3_aggregator1),
				       .empty_vld_pipe3_aggregator2(empty_vld_pipe3_aggregator2),
				       .empty_vld_pipe3_aggregator3(empty_vld_pipe3_aggregator3),
				       .video_loss4	(video_loss4),
				       .ack4		(ack4),
				       .line_end4	(line_end4),
				       .cnt_line_end_rd_side4(reg_rd_pipe4_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs4(fifo_rd_ctrl_cs4[2:0]),
				       .fs_detect_pipe4	(fs_detect_pipe4),
				       .up_state_video_pipe4(up_state_video_pipe4),
				       .pipe2sch_video_data_vld4(pipe2sch_video_data_vld4),
				       .video_data_afifo_double_err4(video_data_afifo_mem_double_err4), // Templated
				       .video_data_afifo_empty4(video_data_afifo_empty4),
				       .video_data_afifo_full4(video_data_afifo_full4),
				       .video_data_afifo_ovf_int4(video_data_afifo_ovf_int4),
				       .video_data_afifo_prog_empty4(video_data_afifo_prog_empty4),
				       .video_data_afifo_prog_full4(video_data_afifo_prog_full4),
				       .video_data_afifo_single_err4(video_data_afifo_mem_single_err4), // Templated
				       .video_data_afifo_udf_int4(video_data_afifo_udf_int4),
				       .video_data_fwft_fifo_double_err4(video_data_fwft_fifo_mem_double_err4), // Templated
				       .video_data_fwft_fifo_empty4(video_data_fwft_fifo_empty4),
				       .video_data_fwft_fifo_full4(video_data_fwft_fifo_full4),
				       .video_data_fwft_fifo_ovf_int4(video_data_fwft_fifo_ovf_int4),
				       .video_data_fwft_fifo_prog_full4(video_data_fwft_fifo_prog_full4),
				       .video_data_fwft_fifo_single_err4(video_data_fwft_fifo_mem_single_err4), // Templated
				       .video_data_fwft_fifo_udf_int4(video_data_fwft_fifo_udf_int4),
				       .empty_vld_pipe4_aggregator0(empty_vld_pipe4_aggregator0),
				       .empty_vld_pipe4_aggregator1(empty_vld_pipe4_aggregator1),
				       .empty_vld_pipe4_aggregator2(empty_vld_pipe4_aggregator2),
				       .empty_vld_pipe4_aggregator3(empty_vld_pipe4_aggregator3),
				       .video_loss5	(video_loss5),
				       .ack5		(ack5),
				       .line_end5	(line_end5),
				       .cnt_line_end_rd_side5(reg_rd_pipe5_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs5(fifo_rd_ctrl_cs5[2:0]),
				       .fs_detect_pipe5	(fs_detect_pipe5),
				       .up_state_video_pipe5(up_state_video_pipe5),
				       .pipe2sch_video_data_vld5(pipe2sch_video_data_vld5),
				       .video_data_afifo_double_err5(video_data_afifo_mem_double_err5), // Templated
				       .video_data_afifo_empty5(video_data_afifo_empty5),
				       .video_data_afifo_full5(video_data_afifo_full5),
				       .video_data_afifo_ovf_int5(video_data_afifo_ovf_int5),
				       .video_data_afifo_prog_empty5(video_data_afifo_prog_empty5),
				       .video_data_afifo_prog_full5(video_data_afifo_prog_full5),
				       .video_data_afifo_single_err5(video_data_afifo_mem_single_err5), // Templated
				       .video_data_afifo_udf_int5(video_data_afifo_udf_int5),
				       .video_data_fwft_fifo_double_err5(video_data_fwft_fifo_mem_double_err5), // Templated
				       .video_data_fwft_fifo_empty5(video_data_fwft_fifo_empty5),
				       .video_data_fwft_fifo_full5(video_data_fwft_fifo_full5),
				       .video_data_fwft_fifo_ovf_int5(video_data_fwft_fifo_ovf_int5),
				       .video_data_fwft_fifo_prog_full5(video_data_fwft_fifo_prog_full5),
				       .video_data_fwft_fifo_single_err5(video_data_fwft_fifo_mem_single_err5), // Templated
				       .video_data_fwft_fifo_udf_int5(video_data_fwft_fifo_udf_int5),
				       .empty_vld_pipe5_aggregator0(empty_vld_pipe5_aggregator0),
				       .empty_vld_pipe5_aggregator1(empty_vld_pipe5_aggregator1),
				       .empty_vld_pipe5_aggregator2(empty_vld_pipe5_aggregator2),
				       .empty_vld_pipe5_aggregator3(empty_vld_pipe5_aggregator3),
				       .video_loss6	(video_loss6),
				       .ack6		(ack6),
				       .line_end6	(line_end6),
				       .cnt_line_end_rd_side6(reg_rd_pipe6_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs6(fifo_rd_ctrl_cs6[2:0]),
				       .fs_detect_pipe6	(fs_detect_pipe6),
				       .up_state_video_pipe6(up_state_video_pipe6),
				       .pipe2sch_video_data_vld6(pipe2sch_video_data_vld6),
				       .video_data_afifo_double_err6(video_data_afifo_mem_double_err6), // Templated
				       .video_data_afifo_empty6(video_data_afifo_empty6),
				       .video_data_afifo_full6(video_data_afifo_full6),
				       .video_data_afifo_ovf_int6(video_data_afifo_ovf_int6),
				       .video_data_afifo_prog_empty6(video_data_afifo_prog_empty6),
				       .video_data_afifo_prog_full6(video_data_afifo_prog_full6),
				       .video_data_afifo_single_err6(video_data_afifo_mem_single_err6), // Templated
				       .video_data_afifo_udf_int6(video_data_afifo_udf_int6),
				       .video_data_fwft_fifo_double_err6(video_data_fwft_fifo_mem_double_err6), // Templated
				       .video_data_fwft_fifo_empty6(video_data_fwft_fifo_empty6),
				       .video_data_fwft_fifo_full6(video_data_fwft_fifo_full6),
				       .video_data_fwft_fifo_ovf_int6(video_data_fwft_fifo_ovf_int6),
				       .video_data_fwft_fifo_prog_full6(video_data_fwft_fifo_prog_full6),
				       .video_data_fwft_fifo_single_err6(video_data_fwft_fifo_mem_single_err6), // Templated
				       .video_data_fwft_fifo_udf_int6(video_data_fwft_fifo_udf_int6),
				       .empty_vld_pipe6_aggregator0(empty_vld_pipe6_aggregator0),
				       .empty_vld_pipe6_aggregator1(empty_vld_pipe6_aggregator1),
				       .empty_vld_pipe6_aggregator2(empty_vld_pipe6_aggregator2),
				       .empty_vld_pipe6_aggregator3(empty_vld_pipe6_aggregator3),
				       .video_loss7	(video_loss7),
				       .ack7		(ack7),
				       .line_end7	(line_end7),
				       .cnt_line_end_rd_side7(reg_rd_pipe7_dispatched_cnt_ready_for_sch[3:0]), // Templated
				       .fifo_rd_ctrl_cs7(fifo_rd_ctrl_cs7[2:0]),
				       .fs_detect_pipe7	(fs_detect_pipe7),
				       .up_state_video_pipe7(up_state_video_pipe7),
				       .pipe2sch_video_data_vld7(pipe2sch_video_data_vld7),
				       .video_data_afifo_double_err7(video_data_afifo_mem_double_err7), // Templated
				       .video_data_afifo_empty7(video_data_afifo_empty7),
				       .video_data_afifo_full7(video_data_afifo_full7),
				       .video_data_afifo_ovf_int7(video_data_afifo_ovf_int7),
				       .video_data_afifo_prog_empty7(video_data_afifo_prog_empty7),
				       .video_data_afifo_prog_full7(video_data_afifo_prog_full7),
				       .video_data_afifo_single_err7(video_data_afifo_mem_single_err7), // Templated
				       .video_data_afifo_udf_int7(video_data_afifo_udf_int7),
				       .video_data_fwft_fifo_double_err7(video_data_fwft_fifo_mem_double_err7), // Templated
				       .video_data_fwft_fifo_empty7(video_data_fwft_fifo_empty7),
				       .video_data_fwft_fifo_full7(video_data_fwft_fifo_full7),
				       .video_data_fwft_fifo_ovf_int7(video_data_fwft_fifo_ovf_int7),
				       .video_data_fwft_fifo_prog_full7(video_data_fwft_fifo_prog_full7),
				       .video_data_fwft_fifo_single_err7(video_data_fwft_fifo_mem_single_err7), // Templated
				       .video_data_fwft_fifo_udf_int7(video_data_fwft_fifo_udf_int7),
				       .empty_vld_pipe7_aggregator0(empty_vld_pipe7_aggregator0),
				       .empty_vld_pipe7_aggregator1(empty_vld_pipe7_aggregator1),
				       .empty_vld_pipe7_aggregator2(empty_vld_pipe7_aggregator2),
				       .empty_vld_pipe7_aggregator3(empty_vld_pipe7_aggregator3),
				       .sch0_ack_aggre	(sch0_ack_aggre[7:0]),
				       .sch0_ack_concat	(sch0_ack_concat[3:0]),
				       .sch0_aggre_busy	(sch0_aggre_busy),
				       .sch0_cs		(sch0_cs[3:0]),
				       .sch0_line_end_aggre(sch0_line_end_aggre[7:0]),
				       .sch0_line_end_concat(sch0_line_end_concat[3:0]),
				       .sch0_up_state_aggre(sch0_up_state_aggre[7:0]),
				       .sch0_up_state_concat(sch0_up_state_concat[3:0]),
				       .sch1_ack_aggre	(sch1_ack_aggre[7:0]),
				       .sch1_ack_concat	(sch1_ack_concat[3:0]),
				       .sch1_aggre_busy	(sch1_aggre_busy),
				       .sch1_cs		(sch1_cs[3:0]),
				       .sch1_line_end_aggre(sch1_line_end_aggre[7:0]),
				       .sch1_line_end_concat(sch1_line_end_concat[3:0]),
				       .sch1_up_state_aggre(sch1_up_state_aggre[7:0]),
				       .sch1_up_state_concat(sch1_up_state_concat[3:0]),
				       .sch2_ack_aggre	(sch2_ack_aggre[7:0]),
				       .sch2_ack_concat	(sch2_ack_concat[3:0]),
				       .sch2_aggre_busy	(sch2_aggre_busy),
				       .sch2_cs		(sch2_cs[3:0]),
				       .sch2_line_end_aggre(sch2_line_end_aggre[7:0]),
				       .sch2_line_end_concat(sch2_line_end_concat[3:0]),
				       .sch2_up_state_aggre(sch2_up_state_aggre[7:0]),
				       .sch2_up_state_concat(sch2_up_state_concat[3:0]),
				       .sch3_ack_aggre	(sch3_ack_aggre[7:0]),
				       .sch3_ack_concat	(sch3_ack_concat[3:0]),
				       .sch3_aggre_busy	(sch3_aggre_busy),
				       .sch3_cs		(sch3_cs[3:0]),
				       .sch3_line_end_aggre(sch3_line_end_aggre[7:0]),
				       .sch3_line_end_concat(sch3_line_end_concat[3:0]),
				       .sch3_up_state_aggre(sch3_up_state_aggre[7:0]),
				       .sch3_up_state_concat(sch3_up_state_concat[3:0]),
				       .sch2post_video_data_vld0(sch2post_video_data_vld0),
				       .sch2post_video_data_vld1(sch2post_video_data_vld1),
				       .sch2post_video_data_vld2(sch2post_video_data_vld2),
				       .sch2post_video_data_vld3(sch2post_video_data_vld3));
endmodule

