
module        as6d_app_mon_top  (/*AUTOARG*/
   // Outputs
   reg_rd_dig_test_bus, PIN_DIG_TEST_BUS,
   // Inputs
   reg_testbus_sel_swap, reg_testbus_sel_order1,
   reg_testbus_sel_order0, reg_testbus_sel_lo1, reg_testbus_sel_lo0,
   reg_testbus_sel_hi1, reg_testbus_sel_hi0,
   reg_testbus_hi8bsel_8bmode, cpu_interface_resetn,
   cpu_interface_clk, video_loss0, ack0, line_end0,
   cnt_line_end_rd_side0, fifo_rd_ctrl_cs0, fs_detect_pipe0,
   up_state_video_pipe0, pipe2sch_video_data_vld0,
   video_data_afifo_double_err0, video_data_afifo_empty0,
   video_data_afifo_full0, video_data_afifo_ovf_int0,
   video_data_afifo_prog_empty0, video_data_afifo_prog_full0,
   video_data_afifo_single_err0, video_data_afifo_udf_int0,
   video_data_fwft_fifo_double_err0, video_data_fwft_fifo_empty0,
   video_data_fwft_fifo_full0, video_data_fwft_fifo_ovf_int0,
   video_data_fwft_fifo_prog_full0, video_data_fwft_fifo_single_err0,
   video_data_fwft_fifo_udf_int0, empty_vld_pipe0_aggregator0,
   empty_vld_pipe0_aggregator1, empty_vld_pipe0_aggregator2,
   empty_vld_pipe0_aggregator3, video_loss1, ack1, line_end1,
   cnt_line_end_rd_side1, fifo_rd_ctrl_cs1, fs_detect_pipe1,
   up_state_video_pipe1, pipe2sch_video_data_vld1,
   video_data_afifo_double_err1, video_data_afifo_empty1,
   video_data_afifo_full1, video_data_afifo_ovf_int1,
   video_data_afifo_prog_empty1, video_data_afifo_prog_full1,
   video_data_afifo_single_err1, video_data_afifo_udf_int1,
   video_data_fwft_fifo_double_err1, video_data_fwft_fifo_empty1,
   video_data_fwft_fifo_full1, video_data_fwft_fifo_ovf_int1,
   video_data_fwft_fifo_prog_full1, video_data_fwft_fifo_single_err1,
   video_data_fwft_fifo_udf_int1, empty_vld_pipe1_aggregator0,
   empty_vld_pipe1_aggregator1, empty_vld_pipe1_aggregator2,
   empty_vld_pipe1_aggregator3, video_loss2, ack2, line_end2,
   cnt_line_end_rd_side2, fifo_rd_ctrl_cs2, fs_detect_pipe2,
   up_state_video_pipe2, pipe2sch_video_data_vld2,
   video_data_afifo_double_err2, video_data_afifo_empty2,
   video_data_afifo_full2, video_data_afifo_ovf_int2,
   video_data_afifo_prog_empty2, video_data_afifo_prog_full2,
   video_data_afifo_single_err2, video_data_afifo_udf_int2,
   video_data_fwft_fifo_double_err2, video_data_fwft_fifo_empty2,
   video_data_fwft_fifo_full2, video_data_fwft_fifo_ovf_int2,
   video_data_fwft_fifo_prog_full2, video_data_fwft_fifo_single_err2,
   video_data_fwft_fifo_udf_int2, empty_vld_pipe2_aggregator0,
   empty_vld_pipe2_aggregator1, empty_vld_pipe2_aggregator2,
   empty_vld_pipe2_aggregator3, video_loss3, ack3, line_end3,
   cnt_line_end_rd_side3, fifo_rd_ctrl_cs3, fs_detect_pipe3,
   up_state_video_pipe3, pipe2sch_video_data_vld3,
   video_data_afifo_double_err3, video_data_afifo_empty3,
   video_data_afifo_full3, video_data_afifo_ovf_int3,
   video_data_afifo_prog_empty3, video_data_afifo_prog_full3,
   video_data_afifo_single_err3, video_data_afifo_udf_int3,
   video_data_fwft_fifo_double_err3, video_data_fwft_fifo_empty3,
   video_data_fwft_fifo_full3, video_data_fwft_fifo_ovf_int3,
   video_data_fwft_fifo_prog_full3, video_data_fwft_fifo_single_err3,
   video_data_fwft_fifo_udf_int3, empty_vld_pipe3_aggregator0,
   empty_vld_pipe3_aggregator1, empty_vld_pipe3_aggregator2,
   empty_vld_pipe3_aggregator3, video_loss4, ack4, line_end4,
   cnt_line_end_rd_side4, fifo_rd_ctrl_cs4, fs_detect_pipe4,
   up_state_video_pipe4, pipe2sch_video_data_vld4,
   video_data_afifo_double_err4, video_data_afifo_empty4,
   video_data_afifo_full4, video_data_afifo_ovf_int4,
   video_data_afifo_prog_empty4, video_data_afifo_prog_full4,
   video_data_afifo_single_err4, video_data_afifo_udf_int4,
   video_data_fwft_fifo_double_err4, video_data_fwft_fifo_empty4,
   video_data_fwft_fifo_full4, video_data_fwft_fifo_ovf_int4,
   video_data_fwft_fifo_prog_full4, video_data_fwft_fifo_single_err4,
   video_data_fwft_fifo_udf_int4, empty_vld_pipe4_aggregator0,
   empty_vld_pipe4_aggregator1, empty_vld_pipe4_aggregator2,
   empty_vld_pipe4_aggregator3, video_loss5, ack5, line_end5,
   cnt_line_end_rd_side5, fifo_rd_ctrl_cs5, fs_detect_pipe5,
   up_state_video_pipe5, pipe2sch_video_data_vld5,
   video_data_afifo_double_err5, video_data_afifo_empty5,
   video_data_afifo_full5, video_data_afifo_ovf_int5,
   video_data_afifo_prog_empty5, video_data_afifo_prog_full5,
   video_data_afifo_single_err5, video_data_afifo_udf_int5,
   video_data_fwft_fifo_double_err5, video_data_fwft_fifo_empty5,
   video_data_fwft_fifo_full5, video_data_fwft_fifo_ovf_int5,
   video_data_fwft_fifo_prog_full5, video_data_fwft_fifo_single_err5,
   video_data_fwft_fifo_udf_int5, empty_vld_pipe5_aggregator0,
   empty_vld_pipe5_aggregator1, empty_vld_pipe5_aggregator2,
   empty_vld_pipe5_aggregator3, video_loss6, ack6, line_end6,
   cnt_line_end_rd_side6, fifo_rd_ctrl_cs6, fs_detect_pipe6,
   up_state_video_pipe6, pipe2sch_video_data_vld6,
   video_data_afifo_double_err6, video_data_afifo_empty6,
   video_data_afifo_full6, video_data_afifo_ovf_int6,
   video_data_afifo_prog_empty6, video_data_afifo_prog_full6,
   video_data_afifo_single_err6, video_data_afifo_udf_int6,
   video_data_fwft_fifo_double_err6, video_data_fwft_fifo_empty6,
   video_data_fwft_fifo_full6, video_data_fwft_fifo_ovf_int6,
   video_data_fwft_fifo_prog_full6, video_data_fwft_fifo_single_err6,
   video_data_fwft_fifo_udf_int6, empty_vld_pipe6_aggregator0,
   empty_vld_pipe6_aggregator1, empty_vld_pipe6_aggregator2,
   empty_vld_pipe6_aggregator3, video_loss7, ack7, line_end7,
   cnt_line_end_rd_side7, fifo_rd_ctrl_cs7, fs_detect_pipe7,
   up_state_video_pipe7, pipe2sch_video_data_vld7,
   video_data_afifo_double_err7, video_data_afifo_empty7,
   video_data_afifo_full7, video_data_afifo_ovf_int7,
   video_data_afifo_prog_empty7, video_data_afifo_prog_full7,
   video_data_afifo_single_err7, video_data_afifo_udf_int7,
   video_data_fwft_fifo_double_err7, video_data_fwft_fifo_empty7,
   video_data_fwft_fifo_full7, video_data_fwft_fifo_ovf_int7,
   video_data_fwft_fifo_prog_full7, video_data_fwft_fifo_single_err7,
   video_data_fwft_fifo_udf_int7, empty_vld_pipe7_aggregator0,
   empty_vld_pipe7_aggregator1, empty_vld_pipe7_aggregator2,
   empty_vld_pipe7_aggregator3, sch0_ack_aggre, sch0_ack_concat,
   sch0_aggre_busy, sch0_cs, sch0_line_end_aggre,
   sch0_line_end_concat, sch0_up_state_aggre, sch0_up_state_concat,
   sch1_ack_aggre, sch1_ack_concat, sch1_aggre_busy, sch1_cs,
   sch1_line_end_aggre, sch1_line_end_concat, sch1_up_state_aggre,
   sch1_up_state_concat, sch2_ack_aggre, sch2_ack_concat,
   sch2_aggre_busy, sch2_cs, sch2_line_end_aggre,
   sch2_line_end_concat, sch2_up_state_aggre, sch2_up_state_concat,
   sch3_ack_aggre, sch3_ack_concat, sch3_aggre_busy, sch3_cs,
   sch3_line_end_aggre, sch3_line_end_concat, sch3_up_state_aggre,
   sch3_up_state_concat, sch2post_video_data_vld0,
   sch2post_video_data_vld1, sch2post_video_data_vld2,
   sch2post_video_data_vld3
   );

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			cpu_interface_clk;	// To mon_swp of as6d_app_mon_swp.v
input			cpu_interface_resetn;	// To mon_swp of as6d_app_mon_swp.v
input			reg_testbus_hi8bsel_8bmode;// To mon_swp of as6d_app_mon_swp.v
input [5:0]		reg_testbus_sel_hi0;	// To app_mon_mux_lane0 of as6d_app_mon_mux_lane.v
input [5:0]		reg_testbus_sel_hi1;	// To app_mon_mux_lane1 of as6d_app_mon_mux_lane.v
input [5:0]		reg_testbus_sel_lo0;	// To app_mon_mux_lane0 of as6d_app_mon_mux_lane.v
input [5:0]		reg_testbus_sel_lo1;	// To app_mon_mux_lane1 of as6d_app_mon_mux_lane.v
input [3:0]		reg_testbus_sel_order0;	// To mon_sel0 of as6d_app_mon_sel.v
input [3:0]		reg_testbus_sel_order1;	// To mon_sel1 of as6d_app_mon_sel.v
input [15:0]		reg_testbus_sel_swap;	// To mon_swp of as6d_app_mon_swp.v
// End of automatics
input                               video_loss0                             ;
input                               ack0                                    ;
input                               line_end0                               ;
input [3:0]                         cnt_line_end_rd_side0                   ;
input [2:0]                         fifo_rd_ctrl_cs0                        ;
input                               fs_detect_pipe0                         ;
input                               up_state_video_pipe0                    ;
input                               pipe2sch_video_data_vld0                ;
input                               video_data_afifo_double_err0            ;
input                               video_data_afifo_empty0                 ;
input                               video_data_afifo_full0                  ;
input                               video_data_afifo_ovf_int0               ;
input                               video_data_afifo_prog_empty0            ;
input                               video_data_afifo_prog_full0             ;
input                               video_data_afifo_single_err0            ;
input                               video_data_afifo_udf_int0               ;
input                               video_data_fwft_fifo_double_err0        ;
input                               video_data_fwft_fifo_empty0             ;
input                               video_data_fwft_fifo_full0              ;
input                               video_data_fwft_fifo_ovf_int0           ;
input                               video_data_fwft_fifo_prog_full0         ;
input                               video_data_fwft_fifo_single_err0        ;
input                               video_data_fwft_fifo_udf_int0           ;
input                               empty_vld_pipe0_aggregator0             ;
input                               empty_vld_pipe0_aggregator1             ;
input                               empty_vld_pipe0_aggregator2             ;
input                               empty_vld_pipe0_aggregator3             ;
input                               video_loss1                             ;
input                               ack1                                    ;
input                               line_end1                               ;
input [3:0]                         cnt_line_end_rd_side1                   ;
input [2:0]                         fifo_rd_ctrl_cs1                        ;
input                               fs_detect_pipe1                         ;
input                               up_state_video_pipe1                    ;
input                               pipe2sch_video_data_vld1                ;
input                               video_data_afifo_double_err1            ;
input                               video_data_afifo_empty1                 ;
input                               video_data_afifo_full1                  ;
input                               video_data_afifo_ovf_int1               ;
input                               video_data_afifo_prog_empty1            ;
input                               video_data_afifo_prog_full1             ;
input                               video_data_afifo_single_err1            ;
input                               video_data_afifo_udf_int1               ;
input                               video_data_fwft_fifo_double_err1        ;
input                               video_data_fwft_fifo_empty1             ;
input                               video_data_fwft_fifo_full1              ;
input                               video_data_fwft_fifo_ovf_int1           ;
input                               video_data_fwft_fifo_prog_full1         ;
input                               video_data_fwft_fifo_single_err1        ;
input                               video_data_fwft_fifo_udf_int1           ;
input                               empty_vld_pipe1_aggregator0             ;
input                               empty_vld_pipe1_aggregator1             ;
input                               empty_vld_pipe1_aggregator2             ;
input                               empty_vld_pipe1_aggregator3             ;
input                               video_loss2                             ;
input                               ack2                                    ;
input                               line_end2                               ;
input [3:0]                         cnt_line_end_rd_side2                   ;
input [2:0]                         fifo_rd_ctrl_cs2                        ;
input                               fs_detect_pipe2                         ;
input                               up_state_video_pipe2                    ;
input                               pipe2sch_video_data_vld2                ;
input                               video_data_afifo_double_err2            ;
input                               video_data_afifo_empty2                 ;
input                               video_data_afifo_full2                  ;
input                               video_data_afifo_ovf_int2               ;
input                               video_data_afifo_prog_empty2            ;
input                               video_data_afifo_prog_full2             ;
input                               video_data_afifo_single_err2            ;
input                               video_data_afifo_udf_int2               ;
input                               video_data_fwft_fifo_double_err2        ;
input                               video_data_fwft_fifo_empty2             ;
input                               video_data_fwft_fifo_full2              ;
input                               video_data_fwft_fifo_ovf_int2           ;
input                               video_data_fwft_fifo_prog_full2         ;
input                               video_data_fwft_fifo_single_err2        ;
input                               video_data_fwft_fifo_udf_int2           ;
input                               empty_vld_pipe2_aggregator0             ;
input                               empty_vld_pipe2_aggregator1             ;
input                               empty_vld_pipe2_aggregator2             ;
input                               empty_vld_pipe2_aggregator3             ;
input                               video_loss3                             ;
input                               ack3                                    ;
input                               line_end3                               ;
input [3:0]                         cnt_line_end_rd_side3                   ;
input [2:0]                         fifo_rd_ctrl_cs3                        ;
input                               fs_detect_pipe3                         ;
input                               up_state_video_pipe3                    ;
input                               pipe2sch_video_data_vld3                ;
input                               video_data_afifo_double_err3            ;
input                               video_data_afifo_empty3                 ;
input                               video_data_afifo_full3                  ;
input                               video_data_afifo_ovf_int3               ;
input                               video_data_afifo_prog_empty3            ;
input                               video_data_afifo_prog_full3             ;
input                               video_data_afifo_single_err3            ;
input                               video_data_afifo_udf_int3               ;
input                               video_data_fwft_fifo_double_err3        ;
input                               video_data_fwft_fifo_empty3             ;
input                               video_data_fwft_fifo_full3              ;
input                               video_data_fwft_fifo_ovf_int3           ;
input                               video_data_fwft_fifo_prog_full3         ;
input                               video_data_fwft_fifo_single_err3        ;
input                               video_data_fwft_fifo_udf_int3           ;
input                               empty_vld_pipe3_aggregator0             ;
input                               empty_vld_pipe3_aggregator1             ;
input                               empty_vld_pipe3_aggregator2             ;
input                               empty_vld_pipe3_aggregator3             ;
input                               video_loss4                             ;
input                               ack4                                    ;
input                               line_end4                               ;
input [3:0]                         cnt_line_end_rd_side4                   ;
input [2:0]                         fifo_rd_ctrl_cs4                        ;
input                               fs_detect_pipe4                         ;
input                               up_state_video_pipe4                    ;
input                               pipe2sch_video_data_vld4                ;
input                               video_data_afifo_double_err4            ;
input                               video_data_afifo_empty4                 ;
input                               video_data_afifo_full4                  ;
input                               video_data_afifo_ovf_int4               ;
input                               video_data_afifo_prog_empty4            ;
input                               video_data_afifo_prog_full4             ;
input                               video_data_afifo_single_err4            ;
input                               video_data_afifo_udf_int4               ;
input                               video_data_fwft_fifo_double_err4        ;
input                               video_data_fwft_fifo_empty4             ;
input                               video_data_fwft_fifo_full4              ;
input                               video_data_fwft_fifo_ovf_int4           ;
input                               video_data_fwft_fifo_prog_full4         ;
input                               video_data_fwft_fifo_single_err4        ;
input                               video_data_fwft_fifo_udf_int4           ;
input                               empty_vld_pipe4_aggregator0             ;
input                               empty_vld_pipe4_aggregator1             ;
input                               empty_vld_pipe4_aggregator2             ;
input                               empty_vld_pipe4_aggregator3             ;
input                               video_loss5                             ;
input                               ack5                                    ;
input                               line_end5                               ;
input [3:0]                         cnt_line_end_rd_side5                   ;
input [2:0]                         fifo_rd_ctrl_cs5                        ;
input                               fs_detect_pipe5                         ;
input                               up_state_video_pipe5                    ;
input                               pipe2sch_video_data_vld5                ;
input                               video_data_afifo_double_err5            ;
input                               video_data_afifo_empty5                 ;
input                               video_data_afifo_full5                  ;
input                               video_data_afifo_ovf_int5               ;
input                               video_data_afifo_prog_empty5            ;
input                               video_data_afifo_prog_full5             ;
input                               video_data_afifo_single_err5            ;
input                               video_data_afifo_udf_int5               ;
input                               video_data_fwft_fifo_double_err5        ;
input                               video_data_fwft_fifo_empty5             ;
input                               video_data_fwft_fifo_full5              ;
input                               video_data_fwft_fifo_ovf_int5           ;
input                               video_data_fwft_fifo_prog_full5         ;
input                               video_data_fwft_fifo_single_err5        ;
input                               video_data_fwft_fifo_udf_int5           ;
input                               empty_vld_pipe5_aggregator0             ;
input                               empty_vld_pipe5_aggregator1             ;
input                               empty_vld_pipe5_aggregator2             ;
input                               empty_vld_pipe5_aggregator3             ;
input                               video_loss6                             ;
input                               ack6                                    ;
input                               line_end6                               ;
input [3:0]                         cnt_line_end_rd_side6                   ;
input [2:0]                         fifo_rd_ctrl_cs6                        ;
input                               fs_detect_pipe6                         ;
input                               up_state_video_pipe6                    ;
input                               pipe2sch_video_data_vld6                ;
input                               video_data_afifo_double_err6            ;
input                               video_data_afifo_empty6                 ;
input                               video_data_afifo_full6                  ;
input                               video_data_afifo_ovf_int6               ;
input                               video_data_afifo_prog_empty6            ;
input                               video_data_afifo_prog_full6             ;
input                               video_data_afifo_single_err6            ;
input                               video_data_afifo_udf_int6               ;
input                               video_data_fwft_fifo_double_err6        ;
input                               video_data_fwft_fifo_empty6             ;
input                               video_data_fwft_fifo_full6              ;
input                               video_data_fwft_fifo_ovf_int6           ;
input                               video_data_fwft_fifo_prog_full6         ;
input                               video_data_fwft_fifo_single_err6        ;
input                               video_data_fwft_fifo_udf_int6           ;
input                               empty_vld_pipe6_aggregator0             ;
input                               empty_vld_pipe6_aggregator1             ;
input                               empty_vld_pipe6_aggregator2             ;
input                               empty_vld_pipe6_aggregator3             ;
input                               video_loss7                             ;
input                               ack7                                    ;
input                               line_end7                               ;
input [3:0]                         cnt_line_end_rd_side7                   ;
input [2:0]                         fifo_rd_ctrl_cs7                        ;
input                               fs_detect_pipe7                         ;
input                               up_state_video_pipe7                    ;
input                               pipe2sch_video_data_vld7                ;
input                               video_data_afifo_double_err7            ;
input                               video_data_afifo_empty7                 ;
input                               video_data_afifo_full7                  ;
input                               video_data_afifo_ovf_int7               ;
input                               video_data_afifo_prog_empty7            ;
input                               video_data_afifo_prog_full7             ;
input                               video_data_afifo_single_err7            ;
input                               video_data_afifo_udf_int7               ;
input                               video_data_fwft_fifo_double_err7        ;
input                               video_data_fwft_fifo_empty7             ;
input                               video_data_fwft_fifo_full7              ;
input                               video_data_fwft_fifo_ovf_int7           ;
input                               video_data_fwft_fifo_prog_full7         ;
input                               video_data_fwft_fifo_single_err7        ;
input                               video_data_fwft_fifo_udf_int7           ;
input                               empty_vld_pipe7_aggregator0             ;
input                               empty_vld_pipe7_aggregator1             ;
input                               empty_vld_pipe7_aggregator2             ;
input                               empty_vld_pipe7_aggregator3             ;

input [7:0]                         sch0_ack_aggre                          ;
input [3:0]                         sch0_ack_concat                         ;
input                               sch0_aggre_busy                         ;
input [3:0]                         sch0_cs                                 ;
input [7:0]                         sch0_line_end_aggre                     ;
input [3:0]                         sch0_line_end_concat                    ;
input [7:0]                         sch0_up_state_aggre                     ;
input [3:0]                         sch0_up_state_concat                    ;
input [7:0]                         sch1_ack_aggre                          ;
input [3:0]                         sch1_ack_concat                         ;
input                               sch1_aggre_busy                         ;
input [3:0]                         sch1_cs                                 ;
input [7:0]                         sch1_line_end_aggre                     ;
input [3:0]                         sch1_line_end_concat                    ;
input [7:0]                         sch1_up_state_aggre                     ;
input [3:0]                         sch1_up_state_concat                    ;
input [7:0]                         sch2_ack_aggre                          ;
input [3:0]                         sch2_ack_concat                         ;
input                               sch2_aggre_busy                         ;
input [3:0]                         sch2_cs                                 ;
input [7:0]                         sch2_line_end_aggre                     ;
input [3:0]                         sch2_line_end_concat                    ;
input [7:0]                         sch2_up_state_aggre                     ;
input [3:0]                         sch2_up_state_concat                    ;
input [7:0]                         sch3_ack_aggre                          ;
input [3:0]                         sch3_ack_concat                         ;
input                               sch3_aggre_busy                         ;
input [3:0]                         sch3_cs                                 ;
input [7:0]                         sch3_line_end_aggre                     ;
input [3:0]                         sch3_line_end_concat                    ;
input [7:0]                         sch3_up_state_aggre                     ;
input [3:0]                         sch3_up_state_concat                    ;
input                               sch2post_video_data_vld0                ;
input                               sch2post_video_data_vld1                ;
input                               sch2post_video_data_vld2                ;
input                               sch2post_video_data_vld3                ;
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [15:0]		PIN_DIG_TEST_BUS;	// From mon_swp of as6d_app_mon_swp.v
output [15:0]		reg_rd_dig_test_bus;	// From mon_swp of as6d_app_mon_swp.v
// End of automatics


/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [15:0]		dig_test_dout0;		// From mon_sel0 of as6d_app_mon_sel.v
wire [15:0]		dig_test_dout0_lane0;	// From app_mon_mux_lane0 of as6d_app_mon_mux_lane.v
wire [15:0]		dig_test_dout1;		// From mon_sel1 of as6d_app_mon_sel.v
wire [15:0]		dig_test_dout1_lane0;	// From app_mon_mux_lane1 of as6d_app_mon_mux_lane.v
// End of automatics
wire    [15:0]    video_pipe_mon_bus0_lane0    ;    
wire    [15:0]    video_pipe_mon_bus1_lane0    ;    
wire    [15:0]    video_pipe_mon_bus0_lane1    ;    
wire    [15:0]    video_pipe_mon_bus1_lane1    ;    
wire    [15:0]    video_pipe_mon_bus0_lane2    ;    
wire    [15:0]    video_pipe_mon_bus1_lane2    ;    
wire    [15:0]    video_pipe_mon_bus0_lane3    ;    
wire    [15:0]    video_pipe_mon_bus1_lane3    ;    
wire    [15:0]    video_pipe_mon_bus0_lane4    ;    
wire    [15:0]    video_pipe_mon_bus1_lane4    ;    
wire    [15:0]    video_pipe_mon_bus0_lane5    ;    
wire    [15:0]    video_pipe_mon_bus1_lane5    ;    
wire    [15:0]    video_pipe_mon_bus0_lane6    ;    
wire    [15:0]    video_pipe_mon_bus1_lane6    ;    
wire    [15:0]    video_pipe_mon_bus0_lane7    ;    
wire    [15:0]    video_pipe_mon_bus1_lane7    ;    

wire    [15:0]    sch_mon_bus0_aggregator0    ;    
wire    [15:0]    sch_mon_bus1_aggregator0    ;    
wire    [15:0]    sch_mon_bus2_aggregator0    ;    
wire    [15:0]    sch_mon_bus0_aggregator1    ;    
wire    [15:0]    sch_mon_bus1_aggregator1    ;    
wire    [15:0]    sch_mon_bus2_aggregator1    ;    
wire    [15:0]    sch_mon_bus0_aggregator2    ;    
wire    [15:0]    sch_mon_bus1_aggregator2    ;    
wire    [15:0]    sch_mon_bus2_aggregator2    ;    
wire    [15:0]    sch_mon_bus0_aggregator3    ;    
wire    [15:0]    sch_mon_bus1_aggregator3    ;    
wire    [15:0]    sch_mon_bus2_aggregator3    ;    

assign    video_pipe_mon_bus0_lane0    =   {video_loss0,ack0,line_end0,cnt_line_end_rd_side0,fifo_rd_ctrl_cs0,fs_detect_pipe0,up_state_video_pipe0,pipe2sch_video_data_vld0,3'd0};
assign    video_pipe_mon_bus1_lane0    =   {video_data_afifo_single_err0,video_data_afifo_double_err0,video_data_afifo_ovf_int0,video_data_afifo_udf_int0,video_data_afifo_full0,video_data_afifo_empty0,video_data_afifo_prog_full0,video_data_afifo_prog_empty0,
                                            video_data_fwft_fifo_single_err0 ,video_data_fwft_fifo_double_err0 ,video_data_fwft_fifo_ovf_int0 ,video_data_fwft_fifo_udf_int0 ,video_data_fwft_fifo_full0 ,video_data_fwft_fifo_empty0 ,video_data_fwft_fifo_prog_full0 ,1'd1};

assign    video_pipe_mon_bus0_lane1    =   {video_loss1,ack1,line_end1,cnt_line_end_rd_side1,fifo_rd_ctrl_cs1,fs_detect_pipe1,up_state_video_pipe1,pipe2sch_video_data_vld0,3'd0};
assign    video_pipe_mon_bus1_lane1    =   {video_data_afifo_single_err1,video_data_afifo_double_err1,video_data_afifo_ovf_int1,video_data_afifo_udf_int1,video_data_afifo_full1,video_data_afifo_empty1,video_data_afifo_prog_full1,video_data_afifo_prog_empty1,
                                            video_data_fwft_fifo_single_err1 ,video_data_fwft_fifo_double_err1 ,video_data_fwft_fifo_ovf_int1 ,video_data_fwft_fifo_udf_int1 ,video_data_fwft_fifo_full1 ,video_data_fwft_fifo_empty1 ,video_data_fwft_fifo_prog_full1 ,1'd1};

assign    video_pipe_mon_bus0_lane2    =   {video_loss2,ack2,line_end2,cnt_line_end_rd_side2,fifo_rd_ctrl_cs2,fs_detect_pipe2,up_state_video_pipe2,pipe2sch_video_data_vld0,3'd0};
assign    video_pipe_mon_bus1_lane2    =   {video_data_afifo_single_err2,video_data_afifo_double_err2,video_data_afifo_ovf_int2,video_data_afifo_udf_int2,video_data_afifo_full2,video_data_afifo_empty2,video_data_afifo_prog_full2,video_data_afifo_prog_empty2,
                                            video_data_fwft_fifo_single_err2 ,video_data_fwft_fifo_double_err2 ,video_data_fwft_fifo_ovf_int2 ,video_data_fwft_fifo_udf_int2 ,video_data_fwft_fifo_full2 ,video_data_fwft_fifo_empty2 ,video_data_fwft_fifo_prog_full2 ,1'd1};

assign    video_pipe_mon_bus0_lane3    =   {video_loss3,ack3,line_end3,cnt_line_end_rd_side3,fifo_rd_ctrl_cs3,fs_detect_pipe3,up_state_video_pipe3,pipe2sch_video_data_vld0,3'd0};
assign    video_pipe_mon_bus1_lane3    =   {video_data_afifo_single_err3,video_data_afifo_double_err3,video_data_afifo_ovf_int3,video_data_afifo_udf_int3,video_data_afifo_full3,video_data_afifo_empty3,video_data_afifo_prog_full3,video_data_afifo_prog_empty3,
                                            video_data_fwft_fifo_single_err3 ,video_data_fwft_fifo_double_err3 ,video_data_fwft_fifo_ovf_int3 ,video_data_fwft_fifo_udf_int3 ,video_data_fwft_fifo_full3 ,video_data_fwft_fifo_empty3 ,video_data_fwft_fifo_prog_full3 ,1'd1};

assign    video_pipe_mon_bus0_lane4    =   {video_loss4,ack4,line_end4,cnt_line_end_rd_side4,fifo_rd_ctrl_cs4,fs_detect_pipe4,up_state_video_pipe4,pipe2sch_video_data_vld4,3'd0};
assign    video_pipe_mon_bus1_lane4    =   {video_data_afifo_single_err4,video_data_afifo_double_err4,video_data_afifo_ovf_int4,video_data_afifo_udf_int4,video_data_afifo_full4,video_data_afifo_empty4,video_data_afifo_prog_full4,video_data_afifo_prog_empty4,
                                            video_data_fwft_fifo_single_err4 ,video_data_fwft_fifo_double_err4 ,video_data_fwft_fifo_ovf_int4 ,video_data_fwft_fifo_udf_int4 ,video_data_fwft_fifo_full4 ,video_data_fwft_fifo_empty4 ,video_data_fwft_fifo_prog_full4 ,1'd1};

assign    video_pipe_mon_bus0_lane5    =   {video_loss5,ack5,line_end5,cnt_line_end_rd_side5,fifo_rd_ctrl_cs5,fs_detect_pipe5,up_state_video_pipe5,pipe2sch_video_data_vld5,3'd0};
assign    video_pipe_mon_bus1_lane5    =   {video_data_afifo_single_err5,video_data_afifo_double_err5,video_data_afifo_ovf_int5,video_data_afifo_udf_int5,video_data_afifo_full5,video_data_afifo_empty5,video_data_afifo_prog_full5,video_data_afifo_prog_empty5,
                                            video_data_fwft_fifo_single_err5 ,video_data_fwft_fifo_double_err5 ,video_data_fwft_fifo_ovf_int5 ,video_data_fwft_fifo_udf_int5 ,video_data_fwft_fifo_full5 ,video_data_fwft_fifo_empty5 ,video_data_fwft_fifo_prog_full5 ,1'd1};

assign    video_pipe_mon_bus0_lane6    =   {video_loss6,ack6,line_end6,cnt_line_end_rd_side6,fifo_rd_ctrl_cs6,fs_detect_pipe6,up_state_video_pipe6,pipe2sch_video_data_vld6,3'd0};
assign    video_pipe_mon_bus1_lane6    =   {video_data_afifo_single_err6,video_data_afifo_double_err6,video_data_afifo_ovf_int6,video_data_afifo_udf_int6,video_data_afifo_full6,video_data_afifo_empty6,video_data_afifo_prog_full6,video_data_afifo_prog_empty6,
                                            video_data_fwft_fifo_single_err6 ,video_data_fwft_fifo_double_err6 ,video_data_fwft_fifo_ovf_int6 ,video_data_fwft_fifo_udf_int6 ,video_data_fwft_fifo_full6 ,video_data_fwft_fifo_empty6 ,video_data_fwft_fifo_prog_full6 ,1'd1};

assign    video_pipe_mon_bus0_lane7    =   {video_loss7,ack7,line_end7,cnt_line_end_rd_side7,fifo_rd_ctrl_cs7,fs_detect_pipe7,up_state_video_pipe7,pipe2sch_video_data_vld7,3'd0};
assign    video_pipe_mon_bus1_lane7    =   {video_data_afifo_single_err7,video_data_afifo_double_err7,video_data_afifo_ovf_int7,video_data_afifo_udf_int7,video_data_afifo_full7,video_data_afifo_empty7,video_data_afifo_prog_full7,video_data_afifo_prog_empty7,
                                            video_data_fwft_fifo_single_err7 ,video_data_fwft_fifo_double_err7 ,video_data_fwft_fifo_ovf_int7 ,video_data_fwft_fifo_udf_int7 ,video_data_fwft_fifo_full7 ,video_data_fwft_fifo_empty7 ,video_data_fwft_fifo_prog_full7 ,1'd1};

assign    sch_mon_bus0_aggregator0    =    {empty_vld_pipe0_aggregator0,empty_vld_pipe1_aggregator0,empty_vld_pipe2_aggregator0,empty_vld_pipe3_aggregator0,empty_vld_pipe4_aggregator0,empty_vld_pipe5_aggregator0,empty_vld_pipe6_aggregator0,empty_vld_pipe7_aggregator0,sch0_up_state_aggre};    
assign    sch_mon_bus1_aggregator0    =    {sch0_cs,sch0_up_state_concat,sch1_ack_concat,sch0_line_end_concat};                                                                                                                                                                                
assign    sch_mon_bus2_aggregator0    =    {sch2post_video_data_vld0};                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                                                               
assign    sch_mon_bus0_aggregator1    =    {empty_vld_pipe0_aggregator1,empty_vld_pipe1_aggregator1,empty_vld_pipe2_aggregator1,empty_vld_pipe3_aggregator1,empty_vld_pipe4_aggregator1,empty_vld_pipe5_aggregator1,empty_vld_pipe6_aggregator1,empty_vld_pipe7_aggregator1,sch1_up_state_aggre};        
assign    sch_mon_bus1_aggregator1    =    {sch1_cs,sch1_up_state_concat,sch1_ack_concat,sch1_line_end_concat};                                                                                                                                                                                                     
assign    sch_mon_bus2_aggregator1    =    {sch2post_video_data_vld1};                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                                                               
assign    sch_mon_bus0_aggregator2    =    {empty_vld_pipe0_aggregator2,empty_vld_pipe1_aggregator2,empty_vld_pipe2_aggregator2,empty_vld_pipe3_aggregator2,empty_vld_pipe4_aggregator2,empty_vld_pipe5_aggregator2,empty_vld_pipe6_aggregator2,empty_vld_pipe7_aggregator2,sch2_up_state_aggre};        
assign    sch_mon_bus1_aggregator2    =    {sch2_cs,sch2_up_state_concat,sch1_ack_concat,sch2_line_end_concat};                                                                                                                                                                                                     
assign    sch_mon_bus2_aggregator2    =    {sch2post_video_data_vld2};                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                                                               
assign    sch_mon_bus0_aggregator3    =    {empty_vld_pipe0_aggregator3,empty_vld_pipe1_aggregator3,empty_vld_pipe2_aggregator3,empty_vld_pipe3_aggregator3,empty_vld_pipe4_aggregator3,empty_vld_pipe5_aggregator3,empty_vld_pipe6_aggregator3,empty_vld_pipe7_aggregator3,sch3_up_state_aggre};        
assign    sch_mon_bus1_aggregator3    =    {sch3_cs,sch3_up_state_concat,sch1_ack_concat,sch3_line_end_concat};                                                                                            
assign    sch_mon_bus2_aggregator3    =    {sch2post_video_data_vld3};    
/* as6d_app_mon_mux_lane AUTO_TEMPLATE (
    .reg_testbus_sel_hi_lane (reg_testbus_sel_hi@_lane[]),
    .dig_test_dout_lane      (dig_test_dout@_lane0[]),
    .pipe_mon_val_lane                   (pipe_mon_val[15:0]),
    .\(reg_testbus_sel.+\)     (\1@[]),
    .mon_value1     (video_pipe_mon_bus0_lane0[]),
    .mon_value2     (video_pipe_mon_bus1_lane0[]),
    .mon_value3     (video_pipe_mon_bus0_lane1[]),
    .mon_value4     (video_pipe_mon_bus1_lane1[]),
    .mon_value5     (video_pipe_mon_bus0_lane2[]),
    .mon_value6     (video_pipe_mon_bus1_lane2[]),
    .mon_value7     (video_pipe_mon_bus0_lane3[]),
    .mon_value8     (video_pipe_mon_bus1_lane3[]),
    .mon_value9     (video_pipe_mon_bus0_lane4[]),
    .mon_value10    (video_pipe_mon_bus1_lane4[]),
    .mon_value11    (video_pipe_mon_bus0_lane5[]),
    .mon_value12    (video_pipe_mon_bus1_lane5[]),
    .mon_value13    (sch_mon_bus0_aggregator0[]),
    .mon_value14    (sch_mon_bus1_aggregator0[]),
    .mon_value15    (sch_mon_bus2_aggregator0[]),
    .mon_value16    (sch_mon_bus0_aggregator1[]),
    .mon_value17    (sch_mon_bus1_aggregator1[]),
    .mon_value18    (sch_mon_bus2_aggregator1[]),
    .mon_value19    (sch_mon_bus0_aggregator2[]),
    .mon_value20    (sch_mon_bus1_aggregator2[]),
    .mon_value21    (sch_mon_bus2_aggregator2[]),
    .mon_value22    (sch_mon_bus0_aggregator3[]),
    .mon_value23    (sch_mon_bus1_aggregator3[]),
    .mon_value24    (sch_mon_bus2_aggregator3[]),
    .mon_value25    (video_pipe_mon_bus0_lane6[]),
    .mon_value26    (video_pipe_mon_bus1_lane6[]),
    .mon_value27    (video_pipe_mon_bus0_lane7[]),
    .mon_value28    (video_pipe_mon_bus1_lane7[]),
    .mon_value\(.*\)(16'd0),
)*/


as6d_app_mon_mux_lane  app_mon_mux_lane0(/*AUTOINST*/
					 // Outputs
					 .dig_test_dout_lane	(dig_test_dout0_lane0[15:0]), // Templated
					 // Inputs
					 .reg_testbus_sel_hi	(reg_testbus_sel_hi0[5:0]), // Templated
					 .reg_testbus_sel_lo	(reg_testbus_sel_lo0[5:0]), // Templated
					 .mon_value1		(video_pipe_mon_bus0_lane0[15:0]), // Templated
					 .mon_value2		(video_pipe_mon_bus1_lane0[15:0]), // Templated
					 .mon_value3		(video_pipe_mon_bus0_lane1[15:0]), // Templated
					 .mon_value4		(video_pipe_mon_bus1_lane1[15:0]), // Templated
					 .mon_value5		(video_pipe_mon_bus0_lane2[15:0]), // Templated
					 .mon_value6		(video_pipe_mon_bus1_lane2[15:0]), // Templated
					 .mon_value7		(video_pipe_mon_bus0_lane3[15:0]), // Templated
					 .mon_value8		(video_pipe_mon_bus1_lane3[15:0]), // Templated
					 .mon_value9		(video_pipe_mon_bus0_lane4[15:0]), // Templated
					 .mon_value10		(video_pipe_mon_bus1_lane4[15:0]), // Templated
					 .mon_value11		(video_pipe_mon_bus0_lane5[15:0]), // Templated
					 .mon_value12		(video_pipe_mon_bus1_lane5[15:0]), // Templated
					 .mon_value13		(sch_mon_bus0_aggregator0[15:0]), // Templated
					 .mon_value14		(sch_mon_bus1_aggregator0[15:0]), // Templated
					 .mon_value15		(sch_mon_bus2_aggregator0[15:0]), // Templated
					 .mon_value16		(sch_mon_bus0_aggregator1[15:0]), // Templated
					 .mon_value17		(sch_mon_bus1_aggregator1[15:0]), // Templated
					 .mon_value18		(sch_mon_bus2_aggregator1[15:0]), // Templated
					 .mon_value19		(sch_mon_bus0_aggregator2[15:0]), // Templated
					 .mon_value20		(sch_mon_bus1_aggregator2[15:0]), // Templated
					 .mon_value21		(sch_mon_bus2_aggregator2[15:0]), // Templated
					 .mon_value22		(sch_mon_bus0_aggregator3[15:0]), // Templated
					 .mon_value23		(sch_mon_bus1_aggregator3[15:0]), // Templated
					 .mon_value24		(sch_mon_bus2_aggregator3[15:0]), // Templated
					 .mon_value25		(video_pipe_mon_bus0_lane6[15:0]), // Templated
					 .mon_value26		(video_pipe_mon_bus1_lane6[15:0]), // Templated
					 .mon_value27		(video_pipe_mon_bus0_lane7[15:0]), // Templated
					 .mon_value28		(video_pipe_mon_bus1_lane7[15:0]), // Templated
					 .mon_value29		(16'd0),	 // Templated
					 .mon_value30		(16'd0),	 // Templated
					 .mon_value31		(16'd0));	 // Templated



as6d_app_mon_mux_lane  app_mon_mux_lane1(/*AUTOINST*/
					 // Outputs
					 .dig_test_dout_lane	(dig_test_dout1_lane0[15:0]), // Templated
					 // Inputs
					 .reg_testbus_sel_hi	(reg_testbus_sel_hi1[5:0]), // Templated
					 .reg_testbus_sel_lo	(reg_testbus_sel_lo1[5:0]), // Templated
					 .mon_value1		(video_pipe_mon_bus0_lane0[15:0]), // Templated
					 .mon_value2		(video_pipe_mon_bus1_lane0[15:0]), // Templated
					 .mon_value3		(video_pipe_mon_bus0_lane1[15:0]), // Templated
					 .mon_value4		(video_pipe_mon_bus1_lane1[15:0]), // Templated
					 .mon_value5		(video_pipe_mon_bus0_lane2[15:0]), // Templated
					 .mon_value6		(video_pipe_mon_bus1_lane2[15:0]), // Templated
					 .mon_value7		(video_pipe_mon_bus0_lane3[15:0]), // Templated
					 .mon_value8		(video_pipe_mon_bus1_lane3[15:0]), // Templated
					 .mon_value9		(video_pipe_mon_bus0_lane4[15:0]), // Templated
					 .mon_value10		(video_pipe_mon_bus1_lane4[15:0]), // Templated
					 .mon_value11		(video_pipe_mon_bus0_lane5[15:0]), // Templated
					 .mon_value12		(video_pipe_mon_bus1_lane5[15:0]), // Templated
					 .mon_value13		(sch_mon_bus0_aggregator0[15:0]), // Templated
					 .mon_value14		(sch_mon_bus1_aggregator0[15:0]), // Templated
					 .mon_value15		(sch_mon_bus2_aggregator0[15:0]), // Templated
					 .mon_value16		(sch_mon_bus0_aggregator1[15:0]), // Templated
					 .mon_value17		(sch_mon_bus1_aggregator1[15:0]), // Templated
					 .mon_value18		(sch_mon_bus2_aggregator1[15:0]), // Templated
					 .mon_value19		(sch_mon_bus0_aggregator2[15:0]), // Templated
					 .mon_value20		(sch_mon_bus1_aggregator2[15:0]), // Templated
					 .mon_value21		(sch_mon_bus2_aggregator2[15:0]), // Templated
					 .mon_value22		(sch_mon_bus0_aggregator3[15:0]), // Templated
					 .mon_value23		(sch_mon_bus1_aggregator3[15:0]), // Templated
					 .mon_value24		(sch_mon_bus2_aggregator3[15:0]), // Templated
					 .mon_value25		(video_pipe_mon_bus0_lane6[15:0]), // Templated
					 .mon_value26		(video_pipe_mon_bus1_lane6[15:0]), // Templated
					 .mon_value27		(video_pipe_mon_bus0_lane7[15:0]), // Templated
					 .mon_value28		(video_pipe_mon_bus1_lane7[15:0]), // Templated
					 .mon_value29		(16'd0),	 // Templated
					 .mon_value30		(16'd0),	 // Templated
					 .mon_value31		(16'd0));	 // Templated




as6d_app_mon_swp  mon_swp (/*AUTOINST*/
			   // Outputs
			   .reg_rd_dig_test_bus	(reg_rd_dig_test_bus[15:0]),
			   .PIN_DIG_TEST_BUS	(PIN_DIG_TEST_BUS[15:0]),
			   // Inputs
			   .reg_testbus_sel_swap(reg_testbus_sel_swap[15:0]),
			   .reg_testbus_hi8bsel_8bmode(reg_testbus_hi8bsel_8bmode),
			   .dig_test_dout0	(dig_test_dout0[15:0]),
			   .dig_test_dout1	(dig_test_dout1[15:0]),
			   .cpu_interface_clk	(cpu_interface_clk),
			   .cpu_interface_resetn(cpu_interface_resetn));




/* as6d_app_mon_sel AUTO_TEMPLATE (
  .reg_testbus_lane_sel\(.*\) (reg_testbus_lane_sel@\1[]),
  .reg_testbus_sel_hi_cmn     (reg_testbus_sel_hi@_cmn[]),
  .reg_testbus_sel_order      (reg_testbus_sel_order@[]),
  .dig_test_dout\(.*\)        (dig_test_dout@\1[]),
  .testbus_lane_sel\(.*\)     (testbus_lane_sel@\1[]),
) */


as6d_app_mon_sel  mon_sel0 (/*AUTOINST*/
			    // Outputs
			    .dig_test_dout	(dig_test_dout0[15:0]), // Templated
			    // Inputs
			    .reg_testbus_sel_order(reg_testbus_sel_order0[3:0]), // Templated
			    .dig_test_dout_lane0(dig_test_dout0_lane0[15:0])); // Templated



as6d_app_mon_sel  mon_sel1 (/*AUTOINST*/
			    // Outputs
			    .dig_test_dout	(dig_test_dout1[15:0]), // Templated
			    // Inputs
			    .reg_testbus_sel_order(reg_testbus_sel_order1[3:0]), // Templated
			    .dig_test_dout_lane0(dig_test_dout1_lane0[15:0])); // Templated



endmodule
