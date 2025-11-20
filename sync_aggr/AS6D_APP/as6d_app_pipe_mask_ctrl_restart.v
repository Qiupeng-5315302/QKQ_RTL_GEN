
module as6d_app_pipe_mask_ctrl_restart(/*AUTOARG*/
   // Outputs
   pipe_wr_mode, pipe_restart_window, pipe_mem_clear,
   // Inputs
   video_mask_restart, update_mask, rst_n,
   reg_sync_aggr_restart_hold_threshold,
   reg_sync_aggr_clear_release_threshold, pipe_mask_bitmap,
   pipe_concat_en, frame_active, clk, clear
   );
    /*AUTOINPUT*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    input		clear;			// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input		clk;			// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input [3:0]		frame_active;		// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input [3:0]		pipe_concat_en;		// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input [3:0]		pipe_mask_bitmap;	// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input [3:0]		reg_sync_aggr_clear_release_threshold;// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input [19:0]	reg_sync_aggr_restart_hold_threshold;// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input		rst_n;			// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input		update_mask;		// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    input [3:0]		video_mask_restart;	// To u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    // End of automatics
    /*AUTOOUTPUT*/
    // Beginning of automatic outputs (from unused autoinst outputs)
    output [3:0]	pipe_mem_clear;		// From u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    output [3:0]	pipe_restart_window;	// From u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    output [7:0]	pipe_wr_mode;		// From u0_as6d_app_pipe_mask_ctrl_restart_lane of as6d_app_pipe_mask_ctrl_restart_lane.v, ...
    // End of automatics
    /*as6d_app_pipe_mask_ctrl_restart_lane  AUTO_TEMPLATE (
        .pipe_concat_en(pipe_concat_en[@]),
        .video_mask_restart(video_mask_restart[@]),
        .pipe_mask_bitmap(pipe_mask_bitmap[@]),
        .frame_active(frame_active[@]),
        .pipe_wr_mode(pipe_wr_mode[@"(+ (* 2 @) 1)":@"(* 2 @)"]),
        .pipe_mem_clear(pipe_mem_clear[@]),
        .pipe_restart_window(pipe_restart_window[@]),
    );*/
    as6d_app_pipe_mask_ctrl_restart_lane u0_as6d_app_pipe_mask_ctrl_restart_lane(/*AUTOINST*/
										 // Outputs
										 .pipe_wr_mode		(pipe_wr_mode[1:0]), // Templated
										 .pipe_mem_clear	(pipe_mem_clear[0]), // Templated
										 .pipe_restart_window	(pipe_restart_window[0]), // Templated
										 // Inputs
										 .clk			(clk),
										 .rst_n			(rst_n),
										 .clear			(clear),
										 .pipe_concat_en	(pipe_concat_en[0]), // Templated
										 .video_mask_restart	(video_mask_restart[0]), // Templated
										 .pipe_mask_bitmap	(pipe_mask_bitmap[0]), // Templated
										 .frame_active		(frame_active[0]), // Templated
										 .update_mask		(update_mask),
										 .reg_sync_aggr_restart_hold_threshold(reg_sync_aggr_restart_hold_threshold[19:0]),
										 .reg_sync_aggr_clear_release_threshold(reg_sync_aggr_clear_release_threshold[3:0]));
    as6d_app_pipe_mask_ctrl_restart_lane u1_as6d_app_pipe_mask_ctrl_restart_lane(/*AUTOINST*/
										 // Outputs
										 .pipe_wr_mode		(pipe_wr_mode[3:2]), // Templated
										 .pipe_mem_clear	(pipe_mem_clear[1]), // Templated
										 .pipe_restart_window	(pipe_restart_window[1]), // Templated
										 // Inputs
										 .clk			(clk),
										 .rst_n			(rst_n),
										 .clear			(clear),
										 .pipe_concat_en	(pipe_concat_en[1]), // Templated
										 .video_mask_restart	(video_mask_restart[1]), // Templated
										 .pipe_mask_bitmap	(pipe_mask_bitmap[1]), // Templated
										 .frame_active		(frame_active[1]), // Templated
										 .update_mask		(update_mask),
										 .reg_sync_aggr_restart_hold_threshold(reg_sync_aggr_restart_hold_threshold[19:0]),
										 .reg_sync_aggr_clear_release_threshold(reg_sync_aggr_clear_release_threshold[3:0]));
    as6d_app_pipe_mask_ctrl_restart_lane u2_as6d_app_pipe_mask_ctrl_restart_lane(/*AUTOINST*/
										 // Outputs
										 .pipe_wr_mode		(pipe_wr_mode[5:4]), // Templated
										 .pipe_mem_clear	(pipe_mem_clear[2]), // Templated
										 .pipe_restart_window	(pipe_restart_window[2]), // Templated
										 // Inputs
										 .clk			(clk),
										 .rst_n			(rst_n),
										 .clear			(clear),
										 .pipe_concat_en	(pipe_concat_en[2]), // Templated
										 .video_mask_restart	(video_mask_restart[2]), // Templated
										 .pipe_mask_bitmap	(pipe_mask_bitmap[2]), // Templated
										 .frame_active		(frame_active[2]), // Templated
										 .update_mask		(update_mask),
										 .reg_sync_aggr_restart_hold_threshold(reg_sync_aggr_restart_hold_threshold[19:0]),
										 .reg_sync_aggr_clear_release_threshold(reg_sync_aggr_clear_release_threshold[3:0]));
    as6d_app_pipe_mask_ctrl_restart_lane u3_as6d_app_pipe_mask_ctrl_restart_lane(/*AUTOINST*/
										 // Outputs
										 .pipe_wr_mode		(pipe_wr_mode[7:6]), // Templated
										 .pipe_mem_clear	(pipe_mem_clear[3]), // Templated
										 .pipe_restart_window	(pipe_restart_window[3]), // Templated
										 // Inputs
										 .clk			(clk),
										 .rst_n			(rst_n),
										 .clear			(clear),
										 .pipe_concat_en	(pipe_concat_en[3]), // Templated
										 .video_mask_restart	(video_mask_restart[3]), // Templated
										 .pipe_mask_bitmap	(pipe_mask_bitmap[3]), // Templated
										 .frame_active		(frame_active[3]), // Templated
										 .update_mask		(update_mask),
										 .reg_sync_aggr_restart_hold_threshold(reg_sync_aggr_restart_hold_threshold[19:0]),
										 .reg_sync_aggr_clear_release_threshold(reg_sync_aggr_clear_release_threshold[3:0]));
    
endmodule
