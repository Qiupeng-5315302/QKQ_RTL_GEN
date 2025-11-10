module as6d_app_video_status_management(/*AUTOARG*/
   // Outputs
   start_sch_video_status_pass_bitmap, start_sch_pulse,
   start_sch_pipe_mask_bitmap, pipe3_wr_mode, pipe2_wr_mode,
   pipe1_wr_mode, pipe0_wr_mode, local_pkt_datatype_out,
   local_linecount_out, local_framecount_out,
   // Inputs
   reg_sync_aggr_video_timeout_threshold,
   reg_sync_aggr_video_status_info_wordcount,
   reg_sync_aggr_video_status_info_vc,
   reg_sync_aggr_video_status_info_linecount,
   reg_sync_aggr_video_status_info_datatype,
   reg_sync_aggr_check_linecount_en,
   reg_sync_aggr_check_framecount_en, pipe_frame_active,
   pipe_concat_en, idi_wordcount_3, idi_wordcount_2, idi_wordcount_1,
   idi_wordcount_0, idi_linecount_3, idi_linecount_2, idi_linecount_1,
   idi_linecount_0, idi_header_en_3, idi_header_en_2, idi_header_en_1,
   idi_header_en_0, idi_datatype_3, idi_datatype_2, idi_datatype_1,
   idi_datatype_0, frame_sync_lock, fifo_wr_clk_rst_n_3,
   fifo_wr_clk_rst_n_2, fifo_wr_clk_rst_n_1, fifo_wr_clk_rst_n_0,
   fifo_wr_clk_rst_n, fifo_wr_clk_3, fifo_wr_clk_2, fifo_wr_clk_1,
   fifo_wr_clk_0, fifo_wr_clk, end_sch_pulse, clk_1M_rst_n, clk_1M,
   aggre_mode, aggre_clk_rst_n, aggre_clk, aggr_clk_rst_n, aggr_clk,
   reg_sync_aggr_force_video_mask, reg_sync_aggr_auto_mask_en,
   reg_sync_aggr_video_mask_restart_en,
   reg_sync_aggr_video_mask_latch_reset
   );
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			aggr_clk;		// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v, ...
input			aggr_clk_rst_n;		// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v, ...
input			aggre_clk;		// To u_video_status_buffer_0 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v, ...
input			aggre_clk_rst_n;	// To u_video_status_buffer_0 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v, ...
input [1:0]		aggre_mode;		// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input			clk_1M;			// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input			clk_1M_rst_n;		// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input			end_sch_pulse;		// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input			fifo_wr_clk;		// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v, ...
input			fifo_wr_clk_0;		// To u_video_status_buffer_0 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			fifo_wr_clk_1;		// To u_video_status_buffer_1 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			fifo_wr_clk_2;		// To u_video_status_buffer_2 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			fifo_wr_clk_3;		// To u_video_status_buffer_3 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			fifo_wr_clk_rst_n;	// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v, ...
input			fifo_wr_clk_rst_n_0;	// To u_video_status_buffer_0 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			fifo_wr_clk_rst_n_1;	// To u_video_status_buffer_1 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			fifo_wr_clk_rst_n_2;	// To u_video_status_buffer_2 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			fifo_wr_clk_rst_n_3;	// To u_video_status_buffer_3 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
input			frame_sync_lock;	// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input [5:0]		idi_datatype_0;		// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v
input [5:0]		idi_datatype_1;		// To u_video_status_buffer_wr_ctrl_1 of video_status_buffer_wr_ctrl.v
input [5:0]		idi_datatype_2;		// To u_video_status_buffer_wr_ctrl_2 of video_status_buffer_wr_ctrl.v
input [5:0]		idi_datatype_3;		// To u_video_status_buffer_wr_ctrl_3 of video_status_buffer_wr_ctrl.v
input			idi_header_en_0;	// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v
input			idi_header_en_1;	// To u_video_status_buffer_wr_ctrl_1 of video_status_buffer_wr_ctrl.v
input			idi_header_en_2;	// To u_video_status_buffer_wr_ctrl_2 of video_status_buffer_wr_ctrl.v
input			idi_header_en_3;	// To u_video_status_buffer_wr_ctrl_3 of video_status_buffer_wr_ctrl.v
input [2:0]		idi_linecount_0;	// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v
input [2:0]		idi_linecount_1;	// To u_video_status_buffer_wr_ctrl_1 of video_status_buffer_wr_ctrl.v
input [2:0]		idi_linecount_2;	// To u_video_status_buffer_wr_ctrl_2 of video_status_buffer_wr_ctrl.v
input [2:0]		idi_linecount_3;	// To u_video_status_buffer_wr_ctrl_3 of video_status_buffer_wr_ctrl.v
input [15:0]		idi_wordcount_0;	// To u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v
input [15:0]		idi_wordcount_1;	// To u_video_status_buffer_wr_ctrl_1 of video_status_buffer_wr_ctrl.v
input [15:0]		idi_wordcount_2;	// To u_video_status_buffer_wr_ctrl_2 of video_status_buffer_wr_ctrl.v
input [15:0]		idi_wordcount_3;	// To u_video_status_buffer_wr_ctrl_3 of video_status_buffer_wr_ctrl.v
input [3:0]		pipe_concat_en;		// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input [3:0]		pipe_frame_active;	// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input			reg_sync_aggr_check_framecount_en;// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input			reg_sync_aggr_check_linecount_en;// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input [5:0]		reg_sync_aggr_video_status_info_datatype;// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input [15:0]		reg_sync_aggr_video_status_info_linecount;// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input [4:0]		reg_sync_aggr_video_status_info_vc;// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input [15:0]		reg_sync_aggr_video_status_info_wordcount;// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
input [19:0]		reg_sync_aggr_video_timeout_threshold;// To u_pipe_mask_ctrl of pipe_mask_ctrl.v
// End of automatics
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [15:0]		local_framecount_out;	// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [15:0]		local_linecount_out;	// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [5:0]		local_pkt_datatype_out;	// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [1:0]		pipe0_wr_mode;		// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [1:0]		pipe1_wr_mode;		// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [1:0]		pipe2_wr_mode;		// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [1:0]		pipe3_wr_mode;		// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [3:0]		start_sch_pipe_mask_bitmap;// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output			start_sch_pulse;	// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
output [3:0]		start_sch_video_status_pass_bitmap;// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
// End of automatics


input  [3:0]    reg_sync_aggr_force_video_mask;
input  [3:0]    reg_sync_aggr_auto_mask_en;
input  [3:0]    reg_sync_aggr_video_mask_restart_en;
input           reg_sync_aggr_video_mask_latch_reset;







// =========================================================================
// Internal Signals
// =========================================================================

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [79:0]		local_us_cnt;		// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
wire [3:0]		pipe_clear_pulse;	// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
wire [101:0]		video_status_buffer_data_0;// From u_video_status_buffer_0 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire [101:0]		video_status_buffer_data_1;// From u_video_status_buffer_1 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire [101:0]		video_status_buffer_data_2;// From u_video_status_buffer_2 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire [101:0]		video_status_buffer_data_3;// From u_video_status_buffer_3 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_data_vld_0;// From u_video_status_buffer_0 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_data_vld_1;// From u_video_status_buffer_1 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_data_vld_2;// From u_video_status_buffer_2 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_data_vld_3;// From u_video_status_buffer_3 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_full_0;// From u_video_status_buffer_0 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_full_1;// From u_video_status_buffer_1 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_full_2;// From u_video_status_buffer_2 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_full_3;// From u_video_status_buffer_3 of as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v
wire			video_status_buffer_rd_en_0;// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
wire			video_status_buffer_rd_en_1;// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
wire			video_status_buffer_rd_en_2;// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
wire			video_status_buffer_rd_en_3;// From u_pipe_mask_ctrl of pipe_mask_ctrl.v
wire [101:0]		video_status_buffer_wr_data_0;// From u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v
wire [101:0]		video_status_buffer_wr_data_1;// From u_video_status_buffer_wr_ctrl_1 of video_status_buffer_wr_ctrl.v
wire [101:0]		video_status_buffer_wr_data_2;// From u_video_status_buffer_wr_ctrl_2 of video_status_buffer_wr_ctrl.v
wire [101:0]		video_status_buffer_wr_data_3;// From u_video_status_buffer_wr_ctrl_3 of video_status_buffer_wr_ctrl.v
wire			video_status_buffer_wr_en_0;// From u_video_status_buffer_wr_ctrl_0 of video_status_buffer_wr_ctrl.v
wire			video_status_buffer_wr_en_1;// From u_video_status_buffer_wr_ctrl_1 of video_status_buffer_wr_ctrl.v
wire			video_status_buffer_wr_en_2;// From u_video_status_buffer_wr_ctrl_2 of video_status_buffer_wr_ctrl.v
wire			video_status_buffer_wr_en_3;// From u_video_status_buffer_wr_ctrl_3 of video_status_buffer_wr_ctrl.v
// End of automatics


// =========================================================================
// Submodule: video_status_buffer_wr_ctrl (4 instances)
// Note: us_counter is now provided by pipe_mask_ctrl's local_us_cnt output
// =========================================================================
 /*  video_status_buffer_wr_ctrl  AUTO_TEMPLATE (
    .wr_en(video_status_buffer_wr_en_@),
    .wr_data(video_status_buffer_wr_data_@[]),
    .afifo_full(video_status_buffer_full_@),
    .idi_header_en(idi_header_en_@),
    .idi_datatype(idi_datatype_@[]),
    .idi_wordcount(idi_wordcount_@[]),
    .idi_linecount(idi_linecount_@[]),
)*/
// Instance 0
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_0(/*AUTOINST*/
							    // Outputs
							    .wr_en		(video_status_buffer_wr_en_0), // Templated
							    .wr_data		(video_status_buffer_wr_data_0[101:0]), // Templated
							    // Inputs
							    .fifo_wr_clk	(fifo_wr_clk),
							    .fifo_wr_clk_rst_n	(fifo_wr_clk_rst_n),
							    .idi_header_en	(idi_header_en_0), // Templated
							    .idi_datatype	(idi_datatype_0[5:0]), // Templated
							    .idi_wordcount	(idi_wordcount_0[15:0]), // Templated
							    .idi_linecount	(idi_linecount_0[2:0]), // Templated
							    .aggr_clk		(aggr_clk),
							    .aggr_clk_rst_n	(aggr_clk_rst_n),
							    .local_us_cnt	(local_us_cnt[79:0]),
							    .afifo_full		(video_status_buffer_full_0)); // Templated

// Instance 1
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_1(/*AUTOINST*/
							    // Outputs
							    .wr_en		(video_status_buffer_wr_en_1), // Templated
							    .wr_data		(video_status_buffer_wr_data_1[101:0]), // Templated
							    // Inputs
							    .fifo_wr_clk	(fifo_wr_clk),
							    .fifo_wr_clk_rst_n	(fifo_wr_clk_rst_n),
							    .idi_header_en	(idi_header_en_1), // Templated
							    .idi_datatype	(idi_datatype_1[5:0]), // Templated
							    .idi_wordcount	(idi_wordcount_1[15:0]), // Templated
							    .idi_linecount	(idi_linecount_1[2:0]), // Templated
							    .aggr_clk		(aggr_clk),
							    .aggr_clk_rst_n	(aggr_clk_rst_n),
							    .local_us_cnt	(local_us_cnt[79:0]),
							    .afifo_full		(video_status_buffer_full_1)); // Templated

// Instance 2
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_2(/*AUTOINST*/
							    // Outputs
							    .wr_en		(video_status_buffer_wr_en_2), // Templated
							    .wr_data		(video_status_buffer_wr_data_2[101:0]), // Templated
							    // Inputs
							    .fifo_wr_clk	(fifo_wr_clk),
							    .fifo_wr_clk_rst_n	(fifo_wr_clk_rst_n),
							    .idi_header_en	(idi_header_en_2), // Templated
							    .idi_datatype	(idi_datatype_2[5:0]), // Templated
							    .idi_wordcount	(idi_wordcount_2[15:0]), // Templated
							    .idi_linecount	(idi_linecount_2[2:0]), // Templated
							    .aggr_clk		(aggr_clk),
							    .aggr_clk_rst_n	(aggr_clk_rst_n),
							    .local_us_cnt	(local_us_cnt[79:0]),
							    .afifo_full		(video_status_buffer_full_2)); // Templated

// Instance 3
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_3(/*AUTOINST*/
							    // Outputs
							    .wr_en		(video_status_buffer_wr_en_3), // Templated
							    .wr_data		(video_status_buffer_wr_data_3[101:0]), // Templated
							    // Inputs
							    .fifo_wr_clk	(fifo_wr_clk),
							    .fifo_wr_clk_rst_n	(fifo_wr_clk_rst_n),
							    .idi_header_en	(idi_header_en_3), // Templated
							    .idi_datatype	(idi_datatype_3[5:0]), // Templated
							    .idi_wordcount	(idi_wordcount_3[15:0]), // Templated
							    .idi_linecount	(idi_linecount_3[2:0]), // Templated
							    .aggr_clk		(aggr_clk),
							    .aggr_clk_rst_n	(aggr_clk_rst_n),
							    .local_us_cnt	(local_us_cnt[79:0]),
							    .afifo_full		(video_status_buffer_full_3)); // Templated

// =========================================================================
// Submodule: 4 AFIFO Instances
// =========================================================================
 /*  as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper  AUTO_TEMPLATE (
    .FLIPFLOP(1),
    .ADDR_WIDTH(4),
    .DATA_WIDTH(102),
    .PROG_EMPTY_ASSERT(8),
    .PROG_EMPTY_NEGATE(8),
    .FIFO_DEEP(16),
    .RAM_PIPE_STAGE	(1),
    .wr_clk(fifo_wr_clk_@),
    .wr_rst_n(fifo_wr_clk_rst_n_@),
    .rd_clk(aggre_clk),
    .rd_rst_n(aggre_clk_rst_n),
    .wr_en(video_status_buffer_wr_en_@),
    .wr_data(video_status_buffer_wr_data_@[]),
    .rd_en(video_status_buffer_rd_en_@),
    .rd_data(video_status_buffer_data_@[]),
    .rd_data_val(video_status_buffer_data_vld_@),
    .ecc_fault(),
    .single_err(),
    .double_err(),
    .ovf_int(),
    .udf_int(),
    .prog_full(),
    .empty(),
    .full(video_status_buffer_full_@[]),
    .data_count(),
    .wr_domain_clear(pipe_clear_pulse[@]),
    .rd_domain_clear(pipe_clear_pulse[@]),
    .ram_bypass(1'd1),
    .reg_dft_tpram_config(9'd0),
    .prog_full_assert_cfg(8),
    .prog_full_negate_cfg(8),
    .ecc_addr_protect_en(1'd1),
    .ecc_fault_detc_en	(1'd1),
    .ecc_bypass	(1'd0),
)*/

// AFIFO Instance 0
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper#(/*AUTOINSTPARAM*/
							     // Parameters
							     .FLIPFLOP		(1),		 // Templated
							     .ADDR_WIDTH	(4),		 // Templated
							     .DATA_WIDTH	(102),		 // Templated
							     .PROG_EMPTY_ASSERT	(8),		 // Templated
							     .PROG_EMPTY_NEGATE	(8),		 // Templated
							     .FIFO_DEEP		(16),		 // Templated
							     .RAM_PIPE_STAGE	(1))		 // Templated
u_video_status_buffer_0 (/*AUTOINST*/
			 // Outputs
			 .rd_data		(video_status_buffer_data_0[101:0]), // Templated
			 .rd_data_val		(video_status_buffer_data_vld_0), // Templated
			 .ecc_fault		(),		 // Templated
			 .single_err		(),		 // Templated
			 .double_err		(),		 // Templated
			 .ovf_int		(),		 // Templated
			 .udf_int		(),		 // Templated
			 .prog_full		(),		 // Templated
			 .empty			(),		 // Templated
			 .full			(video_status_buffer_full_0), // Templated
			 .data_count		(),		 // Templated
			 // Inputs
			 .wr_clk		(fifo_wr_clk_0), // Templated
			 .wr_rst_n		(fifo_wr_clk_rst_n_0), // Templated
			 .rd_clk		(aggre_clk),	 // Templated
			 .rd_rst_n		(aggre_clk_rst_n), // Templated
			 .ram_bypass		(1'd1),		 // Templated
			 .reg_dft_tpram_config	(9'd0),		 // Templated
			 .prog_full_assert_cfg	(8),		 // Templated
			 .prog_full_negate_cfg	(8),		 // Templated
			 .ecc_addr_protect_en	(1'd1),		 // Templated
			 .ecc_fault_detc_en	(1'd1),		 // Templated
			 .ecc_bypass		(1'd0),		 // Templated
			 .wr_data		(video_status_buffer_wr_data_0[101:0]), // Templated
			 .wr_en			(video_status_buffer_wr_en_0), // Templated
			 .rd_en			(video_status_buffer_rd_en_0), // Templated
			 .wr_domain_clear	(pipe_clear_pulse[0]), // Templated
			 .rd_domain_clear	(pipe_clear_pulse[0])); // Templated

// AFIFO Instance 1
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper#(/*AUTOINSTPARAM*/
							     // Parameters
							     .FLIPFLOP		(1),		 // Templated
							     .ADDR_WIDTH	(4),		 // Templated
							     .DATA_WIDTH	(102),		 // Templated
							     .PROG_EMPTY_ASSERT	(8),		 // Templated
							     .PROG_EMPTY_NEGATE	(8),		 // Templated
							     .FIFO_DEEP		(16),		 // Templated
							     .RAM_PIPE_STAGE	(1))		 // Templated
u_video_status_buffer_1 (/*AUTOINST*/
			 // Outputs
			 .rd_data		(video_status_buffer_data_1[101:0]), // Templated
			 .rd_data_val		(video_status_buffer_data_vld_1), // Templated
			 .ecc_fault		(),		 // Templated
			 .single_err		(),		 // Templated
			 .double_err		(),		 // Templated
			 .ovf_int		(),		 // Templated
			 .udf_int		(),		 // Templated
			 .prog_full		(),		 // Templated
			 .empty			(),		 // Templated
			 .full			(video_status_buffer_full_1), // Templated
			 .data_count		(),		 // Templated
			 // Inputs
			 .wr_clk		(fifo_wr_clk_1), // Templated
			 .wr_rst_n		(fifo_wr_clk_rst_n_1), // Templated
			 .rd_clk		(aggre_clk),	 // Templated
			 .rd_rst_n		(aggre_clk_rst_n), // Templated
			 .ram_bypass		(1'd1),		 // Templated
			 .reg_dft_tpram_config	(9'd0),		 // Templated
			 .prog_full_assert_cfg	(8),		 // Templated
			 .prog_full_negate_cfg	(8),		 // Templated
			 .ecc_addr_protect_en	(1'd1),		 // Templated
			 .ecc_fault_detc_en	(1'd1),		 // Templated
			 .ecc_bypass		(1'd0),		 // Templated
			 .wr_data		(video_status_buffer_wr_data_1[101:0]), // Templated
			 .wr_en			(video_status_buffer_wr_en_1), // Templated
			 .rd_en			(video_status_buffer_rd_en_1), // Templated
			 .wr_domain_clear	(pipe_clear_pulse[1]), // Templated
			 .rd_domain_clear	(pipe_clear_pulse[1])); // Templated

// AFIFO Instance 2
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper#(/*AUTOINSTPARAM*/
							     // Parameters
							     .FLIPFLOP		(1),		 // Templated
							     .ADDR_WIDTH	(4),		 // Templated
							     .DATA_WIDTH	(102),		 // Templated
							     .PROG_EMPTY_ASSERT	(8),		 // Templated
							     .PROG_EMPTY_NEGATE	(8),		 // Templated
							     .FIFO_DEEP		(16),		 // Templated
							     .RAM_PIPE_STAGE	(1))		 // Templated
u_video_status_buffer_2 (/*AUTOINST*/
			 // Outputs
			 .rd_data		(video_status_buffer_data_2[101:0]), // Templated
			 .rd_data_val		(video_status_buffer_data_vld_2), // Templated
			 .ecc_fault		(),		 // Templated
			 .single_err		(),		 // Templated
			 .double_err		(),		 // Templated
			 .ovf_int		(),		 // Templated
			 .udf_int		(),		 // Templated
			 .prog_full		(),		 // Templated
			 .empty			(),		 // Templated
			 .full			(video_status_buffer_full_2), // Templated
			 .data_count		(),		 // Templated
			 // Inputs
			 .wr_clk		(fifo_wr_clk_2), // Templated
			 .wr_rst_n		(fifo_wr_clk_rst_n_2), // Templated
			 .rd_clk		(aggre_clk),	 // Templated
			 .rd_rst_n		(aggre_clk_rst_n), // Templated
			 .ram_bypass		(1'd1),		 // Templated
			 .reg_dft_tpram_config	(9'd0),		 // Templated
			 .prog_full_assert_cfg	(8),		 // Templated
			 .prog_full_negate_cfg	(8),		 // Templated
			 .ecc_addr_protect_en	(1'd1),		 // Templated
			 .ecc_fault_detc_en	(1'd1),		 // Templated
			 .ecc_bypass		(1'd0),		 // Templated
			 .wr_data		(video_status_buffer_wr_data_2[101:0]), // Templated
			 .wr_en			(video_status_buffer_wr_en_2), // Templated
			 .rd_en			(video_status_buffer_rd_en_2), // Templated
			 .wr_domain_clear	(pipe_clear_pulse[2]), // Templated
			 .rd_domain_clear	(pipe_clear_pulse[2])); // Templated

// AFIFO Instance 3
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper#(/*AUTOINSTPARAM*/
							     // Parameters
							     .FLIPFLOP		(1),		 // Templated
							     .ADDR_WIDTH	(4),		 // Templated
							     .DATA_WIDTH	(102),		 // Templated
							     .PROG_EMPTY_ASSERT	(8),		 // Templated
							     .PROG_EMPTY_NEGATE	(8),		 // Templated
							     .FIFO_DEEP		(16),		 // Templated
							     .RAM_PIPE_STAGE	(1))		 // Templated
u_video_status_buffer_3 (/*AUTOINST*/
			 // Outputs
			 .rd_data		(video_status_buffer_data_3[101:0]), // Templated
			 .rd_data_val		(video_status_buffer_data_vld_3), // Templated
			 .ecc_fault		(),		 // Templated
			 .single_err		(),		 // Templated
			 .double_err		(),		 // Templated
			 .ovf_int		(),		 // Templated
			 .udf_int		(),		 // Templated
			 .prog_full		(),		 // Templated
			 .empty			(),		 // Templated
			 .full			(video_status_buffer_full_3), // Templated
			 .data_count		(),		 // Templated
			 // Inputs
			 .wr_clk		(fifo_wr_clk_3), // Templated
			 .wr_rst_n		(fifo_wr_clk_rst_n_3), // Templated
			 .rd_clk		(aggre_clk),	 // Templated
			 .rd_rst_n		(aggre_clk_rst_n), // Templated
			 .ram_bypass		(1'd1),		 // Templated
			 .reg_dft_tpram_config	(9'd0),		 // Templated
			 .prog_full_assert_cfg	(8),		 // Templated
			 .prog_full_negate_cfg	(8),		 // Templated
			 .ecc_addr_protect_en	(1'd1),		 // Templated
			 .ecc_fault_detc_en	(1'd1),		 // Templated
			 .ecc_bypass		(1'd0),		 // Templated
			 .wr_data		(video_status_buffer_wr_data_3[101:0]), // Templated
			 .wr_en			(video_status_buffer_wr_en_3), // Templated
			 .rd_en			(video_status_buffer_rd_en_3), // Templated
			 .wr_domain_clear	(pipe_clear_pulse[3]), // Templated
			 .rd_domain_clear	(pipe_clear_pulse[3])); // Templated

wire [3:0]  force_video_mask;
wire [3:0]  auto_mask_en;
wire [3:0]  video_mask_restart_en;
wire        video_mask_latch_reset;

assign  force_video_mask        = pipe_concat_en & reg_sync_aggr_force_video_mask;
assign  auto_mask_en            = pipe_concat_en & reg_sync_aggr_auto_mask_en;
assign  video_mask_restart_en   = pipe_concat_en & reg_sync_aggr_video_mask_restart_en;
assign  video_mask_latch_reset  = reg_sync_aggr_video_mask_latch_reset;

// =========================================================================
// Submodule: pipe_mask_ctrl
// =========================================================================
 /*  pipe_mask_ctrl  AUTO_TEMPLATE (
    .clk(aggre_clk),
    .rst_n(aggre_clk_rst_n),
    .Force_Video_Mask(force_video_mask[]),
    .Auto_Mask_En(auto_mask_en[]),
    .Video_Mask_Restart_En(video_mask_restart_en[]),
    .video_mask_latch_reset(video_mask_latch_reset[]),
    .data_vld_\([0-3]\)(video_status_buffer_data_vld_\1),
    .data_\([0-3]\)(video_status_buffer_data_\1[]),
    .pipe_mask_bitmap(start_sch_pipe_mask_bitmap[]),
    .video_status_pass_bitmap(start_sch_video_status_pass_bitmap[]),
    .start_sch_pulse(start_sch_pulse),
    .pipe_normal_bitmap(),
    .pipe_restart_bitmap(),
)*/

pipe_mask_ctrl u_pipe_mask_ctrl(/*AUTOINST*/
				// Outputs
				.start_sch_pulse(start_sch_pulse), // Templated
				.pipe_clear_pulse(pipe_clear_pulse[3:0]),
				.pipe0_wr_mode	(pipe0_wr_mode[1:0]),
				.pipe1_wr_mode	(pipe1_wr_mode[1:0]),
				.pipe2_wr_mode	(pipe2_wr_mode[1:0]),
				.pipe3_wr_mode	(pipe3_wr_mode[1:0]),
				.pipe_mask_bitmap(start_sch_pipe_mask_bitmap[3:0]), // Templated
				.pipe_normal_bitmap(),		 // Templated
				.pipe_restart_bitmap(),		 // Templated
				.video_status_pass_bitmap(start_sch_video_status_pass_bitmap[3:0]), // Templated
				.local_us_cnt	(local_us_cnt[79:0]),
				.local_framecount_out(local_framecount_out[15:0]),
				.local_linecount_out(local_linecount_out[15:0]),
				.local_pkt_datatype_out(local_pkt_datatype_out[5:0]),
				.video_status_buffer_rd_en_0(video_status_buffer_rd_en_0),
				.video_status_buffer_rd_en_1(video_status_buffer_rd_en_1),
				.video_status_buffer_rd_en_2(video_status_buffer_rd_en_2),
				.video_status_buffer_rd_en_3(video_status_buffer_rd_en_3),
				// Inputs
				.clk		(aggre_clk),	 // Templated
				.rst_n		(aggre_clk_rst_n), // Templated
				.pipe_concat_en	(pipe_concat_en[3:0]),
				.Force_Video_Mask(force_video_mask[3:0]), // Templated
				.Auto_Mask_En	(auto_mask_en[3:0]), // Templated
				.Video_Mask_Restart_En(video_mask_restart_en[3:0]), // Templated
				.pipe_frame_active(pipe_frame_active[3:0]),
				.frame_sync_lock(frame_sync_lock),
				.aggre_mode	(aggre_mode[1:0]),
				.video_mask_latch_reset(video_mask_latch_reset), // Templated
				.reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
				.reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
				.reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
				.reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[4:0]),
				.data_vld_0	(video_status_buffer_data_vld_0), // Templated
				.data_vld_1	(video_status_buffer_data_vld_1), // Templated
				.data_vld_2	(video_status_buffer_data_vld_2), // Templated
				.data_vld_3	(video_status_buffer_data_vld_3), // Templated
				.data_0		(video_status_buffer_data_0[101:0]), // Templated
				.data_1		(video_status_buffer_data_1[101:0]), // Templated
				.data_2		(video_status_buffer_data_2[101:0]), // Templated
				.data_3		(video_status_buffer_data_3[101:0]), // Templated
				.reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
				.reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
				.reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
				.end_sch_pulse	(end_sch_pulse),
				.clk_1M		(clk_1M),
				.clk_1M_rst_n	(clk_1M_rst_n));

endmodule
//Local Variables:
//verilog-auto-inst-param-value : t
//verilog-library-files:("./mem/fifo_wrapper/as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper.v")
//verilog-library-extensions:(".v"".vh"".sv"".svh")
//End:
