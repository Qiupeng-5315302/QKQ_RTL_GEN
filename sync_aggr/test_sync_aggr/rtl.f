// RTL file list for test_sync_aggr
// Top module: as6d_app
// Generated from as6d_app_pipe_sch_concat.f and AS6D_APP/as6d_app.f

// Define macro variable for project root directory
// Usage: -D SYNC_AGGR_ROOT=/path/to/QKQ_RTL_GEN/sync_aggr

+incdir+${SYNC_AGGR_ROOT}/AS6D_APP/
+incdir+${SYNC_AGGR_ROOT}/AS6T28_COMRTL/

// Main application RTL files - Top level module
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app.v

// Video pipe related files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_video_pipe.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_video_pipe_lane.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_fifo_rd_ctrl.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_fifo_rdclk_sel.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_lcrc_check.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_video_loss_detect_time_window.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_elastbuf.v

// Aggregator related files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_aggr.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_aggr_lane.v

// IDI related files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_idi_gen.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_idi_tunnel_mode_delay.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_idi_validity_check.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_idi_validity_check_lane.v

// CRC related files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_crc_gen.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_crc_gen_lane.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_crc_chk_lane.v
${SYNC_AGGR_ROOT}/AS6D_APP/crc32_encode_wrapper_with_crc_en_app_idi.v
${SYNC_AGGR_ROOT}/AS6D_APP/crc32_decode_wrapper_with_crc_en_app_idi.v

// Pipe scheduler related files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pipe_sch_fcfs_m1.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pipe_sch_fcfs_m2.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pipe_sch_concat.v

// Pipe route related files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pipe_route.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pipe_route_lane.v

// Data processing files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_data_post.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pkt_filter.v

// Synchronization and utility files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_sync.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pulse_cnt.v
${SYNC_AGGR_ROOT}/AS6D_APP/int_reg_lock.v
${SYNC_AGGR_ROOT}/AS6D_APP/value_comparator.v
${SYNC_AGGR_ROOT}/AS6D_APP/multiple_value_comparator.v

// Monitor related files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_mon_top.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_mon_mux_lane.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_mon_sel.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_mon_swp.v

// Video pipe memory wrappers
${SYNC_AGGR_ROOT}/AS6D_APP/mem/fifo_wrapper/as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.v
${SYNC_AGGR_ROOT}/AS6D_APP/mem/fifo_wrapper/as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.v
${SYNC_AGGR_ROOT}/AS6D_APP/mem/fifo_wrapper/as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.v
${SYNC_AGGR_ROOT}/AS6D_APP/mem/fifo_wrapper/as6d_app_video_status_buffer_1r1w_16x102_afifo_wrapper.v
${SYNC_AGGR_ROOT}/AS6D_APP/mem/fifo_wrapper/as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
${SYNC_AGGR_ROOT}/AS6D_APP/mem/fifo_wrapper/as6d_app_video_status_buffer_1r1w_16x102_ram_wrapper.v
${SYNC_AGGR_ROOT}/AS6D_APP/mem/ram_wrapper/as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.v
${SYNC_AGGR_ROOT}/AS6D_APP/mem/ram_wrapper/as6d_app_video_pipe_1r1w_32x140_ram_wrapper.v

// Pipe scheduler concatenation RTL files
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pipe_sch.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_video_status_management.v
${SYNC_AGGR_ROOT}/AS6D_APP/black_pixel_generator.v
${SYNC_AGGR_ROOT}/AS6D_APP/video_status_buffer_wr_ctrl.v
${SYNC_AGGR_ROOT}/AS6D_APP/pipe_mask_ctrl.v
${SYNC_AGGR_ROOT}/AS6D_APP/video_status_determination.v
${SYNC_AGGR_ROOT}/AS6D_APP/timestamp_align_determination.v
${SYNC_AGGR_ROOT}/AS6D_APP/as6d_app_pipe_sch_concat_line_interleaved.v

// Common application files
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/app_common/app_pkt_filter_lane.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/app_common/pulse_cnt.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/app_common/monitor_idi_packet.v

// Pattern test files
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/pattern_test.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/app_video_prbs_gen.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/app_video_prbs_chk.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/idi_pattern_driver.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_7.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_9.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_11.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_15.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_16.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_23.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_31.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs_32.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs7_64b.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/prbs7_8b.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/scrambler_core_64bit.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/vprbs_err_inject.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/pattern_test/sync_bus.v

// Standard cell wrap
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/StdCell_Wrap.v
${SYNC_AGGR_ROOT}/AS6T28_COMRTL/dig_cell.v
