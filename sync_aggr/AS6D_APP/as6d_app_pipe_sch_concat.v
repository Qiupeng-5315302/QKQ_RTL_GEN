module as6d_app_pipe_sch_concat(
/*AUTOARG*/
   // Outputs
   up_state_concat, sch_data_type_align_fail_int, pipe3_wr_mode,
   pipe2_wr_mode, pipe1_wr_mode, pipe0_wr_mode,
   local_pkt_datatype_out, local_linecount_out, black_pixel_data_vld,
   black_pixel_data, ack_concat, line_end_concat,
   // Inputs
   video_pipe_date_type_for_concat_align_vld3,
   video_pipe_date_type_for_concat_align_vld2,
   video_pipe_date_type_for_concat_align_vld1,
   video_pipe_date_type_for_concat_align_vld0,
   video_pipe_date_type_for_concat_align3,
   video_pipe_date_type_for_concat_align2,
   video_pipe_date_type_for_concat_align1,
   video_pipe_date_type_for_concat_align0, pipe_frame_active,
   master_pipe, line_end3, line_end2, line_end1, line_end0,
   idi_wordcount_3, idi_wordcount_2, idi_wordcount_1, idi_wordcount_0,
   idi_linecount_3, idi_linecount_2, idi_linecount_1, idi_linecount_0,
   idi_header_en_3, idi_header_en_2, idi_header_en_1, idi_header_en_0,
   idi_datatype_3, idi_datatype_2, idi_datatype_1, idi_datatype_0,
   frame_sync_lock, fifo_wr_clk_rst_n_3, fifo_wr_clk_rst_n_2,
   fifo_wr_clk_rst_n_1, fifo_wr_clk_rst_n_0, fifo_wr_clk_rst_n,
   fifo_wr_clk_3, fifo_wr_clk_2, fifo_wr_clk_1, fifo_wr_clk_0,
   fifo_wr_clk, empty3, empty2, empty1, empty0, clk_1M_rst_n, clk_1M,
   aggre_mode, aggre_clk_rst_n, aggre_clk, aggr_clk_rst_n, aggr_clk,
   ack3, ack2, ack1, ack0, reg_sync_aggr_auto_mask_en,
   reg_sync_aggr_force_video_mask,
   reg_sync_aggr_video_mask_restart_en,
   reg_sync_aggr_video_mask_latch_reset,
   reg_sync_aggr_video_timeout_threshold,
   reg_sync_aggr_check_framecount_en,
   reg_sync_aggr_check_linecount_en,
   reg_sync_aggr_video_status_info_datatype,
   reg_sync_aggr_video_status_info_linecount,
   reg_sync_aggr_video_status_info_wordcount,
   reg_sync_aggr_video_status_info_vc, video_loss0, video_loss1,
   video_loss2, video_loss3
   );    
    
    /*AUTOINPUT*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    input		ack0;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		ack1;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		ack2;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		ack3;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		aggr_clk;		// To u_video_status_management of as6d_app_video_status_management.v
    input		aggr_clk_rst_n;		// To u_video_status_management of as6d_app_video_status_management.v
    input		aggre_clk;		// To u_video_status_management of as6d_app_video_status_management.v, ...
    input		aggre_clk_rst_n;	// To u_video_status_management of as6d_app_video_status_management.v, ...
    input [1:0]		aggre_mode;		// To u_video_status_management of as6d_app_video_status_management.v, ...
    input		clk_1M;			// To u_video_status_management of as6d_app_video_status_management.v
    input		clk_1M_rst_n;		// To u_video_status_management of as6d_app_video_status_management.v
    input		empty0;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		empty1;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		empty2;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		empty3;			// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		fifo_wr_clk;		// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_0;		// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_1;		// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_2;		// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_3;		// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_rst_n;	// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_rst_n_0;	// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_rst_n_1;	// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_rst_n_2;	// To u_video_status_management of as6d_app_video_status_management.v
    input		fifo_wr_clk_rst_n_3;	// To u_video_status_management of as6d_app_video_status_management.v
    input		frame_sync_lock;	// To u_video_status_management of as6d_app_video_status_management.v
    input [5:0]		idi_datatype_0;		// To u_video_status_management of as6d_app_video_status_management.v
    input [5:0]		idi_datatype_1;		// To u_video_status_management of as6d_app_video_status_management.v
    input [5:0]		idi_datatype_2;		// To u_video_status_management of as6d_app_video_status_management.v
    input [5:0]		idi_datatype_3;		// To u_video_status_management of as6d_app_video_status_management.v
    input		idi_header_en_0;	// To u_video_status_management of as6d_app_video_status_management.v
    input		idi_header_en_1;	// To u_video_status_management of as6d_app_video_status_management.v
    input		idi_header_en_2;	// To u_video_status_management of as6d_app_video_status_management.v
    input		idi_header_en_3;	// To u_video_status_management of as6d_app_video_status_management.v
    input [2:0]		idi_linecount_0;	// To u_video_status_management of as6d_app_video_status_management.v
    input [2:0]		idi_linecount_1;	// To u_video_status_management of as6d_app_video_status_management.v
    input [2:0]		idi_linecount_2;	// To u_video_status_management of as6d_app_video_status_management.v
    input [2:0]		idi_linecount_3;	// To u_video_status_management of as6d_app_video_status_management.v
    input [15:0]	idi_wordcount_0;	// To u_video_status_management of as6d_app_video_status_management.v
    input [15:0]	idi_wordcount_1;	// To u_video_status_management of as6d_app_video_status_management.v
    input [15:0]	idi_wordcount_2;	// To u_video_status_management of as6d_app_video_status_management.v
    input [15:0]	idi_wordcount_3;	// To u_video_status_management of as6d_app_video_status_management.v
    input		line_end0;		// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		line_end1;		// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		line_end2;		// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		line_end3;		// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input [1:0]		master_pipe;		// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input [3:0]		pipe_frame_active;	// To u_video_status_management of as6d_app_video_status_management.v
    input [5:0]		video_pipe_date_type_for_concat_align0;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input [5:0]		video_pipe_date_type_for_concat_align1;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input [5:0]		video_pipe_date_type_for_concat_align2;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input [5:0]		video_pipe_date_type_for_concat_align3;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		video_pipe_date_type_for_concat_align_vld0;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		video_pipe_date_type_for_concat_align_vld1;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		video_pipe_date_type_for_concat_align_vld2;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    input		video_pipe_date_type_for_concat_align_vld3;// To u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    // End of automatics
    /*AUTOOUTPUT*/
    // Beginning of automatic outputs (from unused autoinst outputs)
    output [139:0]	black_pixel_data;	// From u_black_pixel_generator of black_pixel_generator.v
    output		black_pixel_data_vld;	// From u_black_pixel_generator of black_pixel_generator.v
    output [15:0]	local_linecount_out;	// From u_video_status_management of as6d_app_video_status_management.v
    output [5:0]	local_pkt_datatype_out;	// From u_video_status_management of as6d_app_video_status_management.v
    output [1:0]	pipe0_wr_mode;		// From u_video_status_management of as6d_app_video_status_management.v
    output [1:0]	pipe1_wr_mode;		// From u_video_status_management of as6d_app_video_status_management.v
    output [1:0]	pipe2_wr_mode;		// From u_video_status_management of as6d_app_video_status_management.v
    output [1:0]	pipe3_wr_mode;		// From u_video_status_management of as6d_app_video_status_management.v
    output		sch_data_type_align_fail_int;// From u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    output		up_state_concat [0:3];	// From u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    // End of automatics

    input       [3:0]       reg_sync_aggr_auto_mask_en;
    input       [3:0]       reg_sync_aggr_force_video_mask;
    input       [3:0]       reg_sync_aggr_video_mask_restart_en;
    input                   reg_sync_aggr_video_mask_latch_reset;       // Video mask latch reset
    input       [19:0]      reg_sync_aggr_video_timeout_threshold;  // Timeout threshold
    input                   reg_sync_aggr_check_framecount_en,
    input                   reg_sync_aggr_check_linecount_en,
    input       [5:0]       reg_sync_aggr_video_status_info_datatype;   // Video status datatype for BPG
    input       [15:0]      reg_sync_aggr_video_status_info_linecount;  // Video status line count for BPG
    input       [15:0]      reg_sync_aggr_video_status_info_wordcount;  // Video status word count for BPG
    input       [2:0]       reg_sync_aggr_video_status_info_vc;         // Video status virtual channel for BPG
    
    input                   video_loss0;
    input                   video_loss1;
    input                   video_loss2;
    input                   video_loss3;
    output wire [3:0]       ack_concat;
    output wire [3:0]       line_end_concat;
    


    // =========================================================================
    // Internal Signals
    // =========================================================================

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		bpg_ack;		// From u_black_pixel_generator of black_pixel_generator.v
    wire		bpg_empty;		// From u_black_pixel_generator of black_pixel_generator.v
    wire		bpg_line_end;		// From u_black_pixel_generator of black_pixel_generator.v
    wire		bpg_up_state;		// From u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    wire		end_sch_pulse;		// From u_pipe_sch_concat_line_interleaved of as6d_app_pipe_sch_concat_line_interleaved.v
    wire [15:0]		local_framecount_out;	// From u_video_status_management of as6d_app_video_status_management.v
    wire [3:0]		start_sch_pipe_mask_bitmap;// From u_video_status_management of as6d_app_video_status_management.v
    wire		start_sch_pulse;	// From u_video_status_management of as6d_app_video_status_management.v
    wire [3:0]		start_sch_video_status_pass_bitmap;// From u_video_status_management of as6d_app_video_status_management.v
    // End of automatics

    // Pipe concat enable bitmap
    wire    [3:0]           pipe_concat_en;
    assign pipe_concat_en = {pipe3_concat_en, pipe2_concat_en, pipe1_concat_en, pipe0_concat_en};
    
// =========================================================================
// Submodule Integration 1: as6d_app_video_status_management
// =========================================================================
/*as6d_app_video_status_management AUTO_TEMPLATE(
)*/
as6d_app_video_status_management u_video_status_management (/*AUTOINST*/
							    // Outputs
							    .local_framecount_out(local_framecount_out[15:0]),
							    .local_linecount_out(local_linecount_out[15:0]),
							    .local_pkt_datatype_out(local_pkt_datatype_out[5:0]),
							    .pipe0_wr_mode	(pipe0_wr_mode[1:0]),
							    .pipe1_wr_mode	(pipe1_wr_mode[1:0]),
							    .pipe2_wr_mode	(pipe2_wr_mode[1:0]),
							    .pipe3_wr_mode	(pipe3_wr_mode[1:0]),
							    .start_sch_pipe_mask_bitmap(start_sch_pipe_mask_bitmap[3:0]),
							    .start_sch_pulse	(start_sch_pulse),
							    .start_sch_video_status_pass_bitmap(start_sch_video_status_pass_bitmap[3:0]),
							    // Inputs
							    .aggr_clk		(aggr_clk),
							    .aggr_clk_rst_n	(aggr_clk_rst_n),
							    .aggre_clk		(aggre_clk),
							    .aggre_clk_rst_n	(aggre_clk_rst_n),
							    .aggre_mode		(aggre_mode[1:0]),
							    .clk_1M		(clk_1M),
							    .clk_1M_rst_n	(clk_1M_rst_n),
							    .end_sch_pulse	(end_sch_pulse),
							    .fifo_wr_clk	(fifo_wr_clk),
							    .fifo_wr_clk_0	(fifo_wr_clk_0),
							    .fifo_wr_clk_1	(fifo_wr_clk_1),
							    .fifo_wr_clk_2	(fifo_wr_clk_2),
							    .fifo_wr_clk_3	(fifo_wr_clk_3),
							    .fifo_wr_clk_rst_n	(fifo_wr_clk_rst_n),
							    .fifo_wr_clk_rst_n_0(fifo_wr_clk_rst_n_0),
							    .fifo_wr_clk_rst_n_1(fifo_wr_clk_rst_n_1),
							    .fifo_wr_clk_rst_n_2(fifo_wr_clk_rst_n_2),
							    .fifo_wr_clk_rst_n_3(fifo_wr_clk_rst_n_3),
							    .frame_sync_lock	(frame_sync_lock),
							    .idi_datatype_0	(idi_datatype_0[5:0]),
							    .idi_datatype_1	(idi_datatype_1[5:0]),
							    .idi_datatype_2	(idi_datatype_2[5:0]),
							    .idi_datatype_3	(idi_datatype_3[5:0]),
							    .idi_header_en_0	(idi_header_en_0),
							    .idi_header_en_1	(idi_header_en_1),
							    .idi_header_en_2	(idi_header_en_2),
							    .idi_header_en_3	(idi_header_en_3),
							    .idi_linecount_0	(idi_linecount_0[2:0]),
							    .idi_linecount_1	(idi_linecount_1[2:0]),
							    .idi_linecount_2	(idi_linecount_2[2:0]),
							    .idi_linecount_3	(idi_linecount_3[2:0]),
							    .idi_wordcount_0	(idi_wordcount_0[15:0]),
							    .idi_wordcount_1	(idi_wordcount_1[15:0]),
							    .idi_wordcount_2	(idi_wordcount_2[15:0]),
							    .idi_wordcount_3	(idi_wordcount_3[15:0]),
							    .pipe_concat_en	(pipe_concat_en[3:0]),
							    .pipe_frame_active	(pipe_frame_active[3:0]),
							    .reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
							    .reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
							    .reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
							    .reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
							    .reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[4:0]),
							    .reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
							    .reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
							    .reg_sync_aggr_force_video_mask(reg_sync_aggr_force_video_mask[3:0]),
							    .reg_sync_aggr_auto_mask_en(reg_sync_aggr_auto_mask_en[3:0]),
							    .reg_sync_aggr_video_mask_restart_en(reg_sync_aggr_video_mask_restart_en[3:0]),
							    .reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_video_mask_latch_reset));

// =========================================================================
// Submodule Integration 2: as6d_app_pipe_sch_concat_line_interleaved
// =========================================================================
/*as6d_app_pipe_sch_concat_line_interleaved AUTO_TEMPLATE(
    .pipe_mask_bitmap(start_sch_pipe_mask_bitmap[]),
    .pipe_rdy_bitmap(start_sch_video_status_pass_bitmap[]),
)*/
as6d_app_pipe_sch_concat_line_interleaved u_pipe_sch_concat_line_interleaved (/*AUTOINST*/
									      // Outputs
									      .end_sch_pulse	(end_sch_pulse),
									      .bpg_up_state	(bpg_up_state),
									      .up_state_concat	(up_state_concat/*.[0:3]*/),
									      .ack_concat	(ack_concat/*.[0:3]*/),
									      .line_end_concat	(line_end_concat/*.[0:3]*/),
									      .sch_data_type_align_fail_int(sch_data_type_align_fail_int),
									      // Inputs
									      .aggre_clk	(aggre_clk),
									      .aggre_clk_rst_n	(aggre_clk_rst_n),
									      .aggre_mode	(aggre_mode[1:0]),
									      .pipe_concat_en	(pipe_concat_en[3:0]),
									      .pipe_mask_bitmap	(start_sch_pipe_mask_bitmap[3:0]), // Templated
									      .master_pipe	(master_pipe[1:0]),
									      .pipe_rdy_bitmap	(start_sch_video_status_pass_bitmap[3:0]), // Templated
									      .start_sch_pulse	(start_sch_pulse),
									      .video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
									      .video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
									      .video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
									      .video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
									      .video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
									      .video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
									      .video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
									      .video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
									      .empty0		(empty0),
									      .empty1		(empty1),
									      .empty2		(empty2),
									      .empty3		(empty3),
									      .ack0		(ack0),
									      .ack1		(ack1),
									      .ack2		(ack2),
									      .ack3		(ack3),
									      .line_end0	(line_end0),
									      .line_end1	(line_end1),
									      .line_end2	(line_end2),
									      .line_end3	(line_end3),
									      .bpg_empty	(bpg_empty),
									      .bpg_ack		(bpg_ack),
									      .bpg_line_end	(bpg_line_end));

// =========================================================================
// Submodule Integration 3: black_pixel_generator
// =========================================================================
/*black_pixel_generator AUTO_TEMPLATE(
    .clk(aggre_clk),
    .rst_n(aggre_clk_rst_n),
    .local_framecount(local_framecount_out),
    .video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[]),
    .video_status_info_wordcount(reg_sync_aggr_video_status_info_linecount[]),
    .video_status_info_vc(reg_sync_aggr_video_status_info_vc[]),
    .local_framecount(local_framecount_out),
    .unready(bpg_empty),
    .up_state(bpg_up_state),
    .ack(bpg_ack),
    .line_end(bpg_line_end),
)*/
black_pixel_generator u_black_pixel_generator (/*AUTOINST*/
					       // Outputs
					       .unready		(bpg_empty),	 // Templated
					       .ack		(bpg_ack),	 // Templated
					       .line_end	(bpg_line_end),	 // Templated
					       .black_pixel_data_vld(black_pixel_data_vld),
					       .black_pixel_data(black_pixel_data[139:0]),
					       // Inputs
					       .clk		(aggre_clk),	 // Templated
					       .rst_n		(aggre_clk_rst_n), // Templated
					       .video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]), // Templated
					       .video_status_info_wordcount(reg_sync_aggr_video_status_info_linecount[15:0]), // Templated
					       .video_status_info_vc(reg_sync_aggr_video_status_info_vc[2:0]), // Templated
					       .local_framecount(local_framecount_out), // Templated
					       .up_state	(bpg_up_state));	 // Templated

// =========================================================================
// Output Signal Assignments
// =========================================================================
// ack_concat and line_end_concat outputs - combine from video pipes and BPG
assign ack_concat = {
    (start_sch_pipe_mask_bitmap[3] ? bpg_ack : ack3),
    (start_sch_pipe_mask_bitmap[2] ? bpg_ack : ack2),
    (start_sch_pipe_mask_bitmap[1] ? bpg_ack : ack1),
    (start_sch_pipe_mask_bitmap[0] ? bpg_ack : ack0)
};

assign line_end_concat = {
    (start_sch_pipe_mask_bitmap[3] ? bpg_line_end : line_end3),
    (start_sch_pipe_mask_bitmap[2] ? bpg_line_end : line_end2),
    (start_sch_pipe_mask_bitmap[1] ? bpg_line_end : line_end1),
    (start_sch_pipe_mask_bitmap[0] ? bpg_line_end : line_end0)
};

// pipe_wr_mode_strobe outputs - currently not implemented, set to 0
assign pipe0_wr_mode_strobe = 1'b0;
assign pipe1_wr_mode_strobe = 1'b0;
assign pipe2_wr_mode_strobe = 1'b0;
assign pipe3_wr_mode_strobe = 1'b0;

endmodule
//Local Variables:
//verilog-auto-inst-param-value : t
//verilog-library-files:()
//verilog-library-extensions:(".v"".vh"".sv"".svh")
//End:
