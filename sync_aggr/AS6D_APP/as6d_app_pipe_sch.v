
//`include "as6d_mep_all_includes.vh"
`include "as6d_app_all_includes.vh"
module as6d_app_pipe_sch#(
    parameter AGGR_ID = 2'd0
) (/*AUTOARG*/
   // Outputs
   up_state0, up_state1, up_state2, up_state3, up_state4, up_state5,
   up_state6, up_state7, sch_current_state, out_video_data_vld,
   out_video_data, up_state_aggre, up_state_concat, line_end_aggre,
   line_end_concat, ack_aggre, ack_concat, aggre_busy,
   pipe_clear_bit_map, pipe0_wr_mode, pipe1_wr_mode, pipe2_wr_mode,
   pipe3_wr_mode, pipe0_wr_mode_strobe, pipe1_wr_mode_strobe,
   pipe2_wr_mode_strobe, pipe3_wr_mode_strobe,
   sch_data_type_align_fail_int,
   // Inputs
   aggre_clk, aggre_clk_rst_n, frame_sync_lock, aggre_mode, clk_1M,
   fifo_wr_clk_0, fifo_wr_clk_1, fifo_wr_clk_2, fifo_wr_clk_3,
   fifo_wr_clk_rst_n_0, fifo_wr_clk_rst_n_1, fifo_wr_clk_rst_n_2,
   fifo_wr_clk_rst_n_3, idi_header_en_0, idi_header_en_1,
   idi_header_en_2, idi_header_en_3, idi_datatype_0, idi_datatype_1,
   idi_datatype_2, idi_datatype_3, idi_wordcount_0, idi_wordcount_1,
   idi_wordcount_2, idi_wordcount_3, idi_linecount_0, idi_linecount_1,
   idi_linecount_2, idi_linecount_3, pipe_frame_active,
   reg_sync_aggr_auto_mask_en, reg_sync_aggr_force_video_mask,
   reg_sync_aggr_video_mask_restart,
   reg_sync_aggr_video_mask_latch_reset,
   reg_sync_aggr_video_timeout_threshold,
   reg_sync_aggr_check_framecount_en,
   reg_sync_aggr_check_linecount_en,
   reg_sync_aggr_video_status_info_datatype,
   reg_sync_aggr_video_status_info_linecount,
   reg_sync_aggr_video_status_info_wordcount,
   reg_sync_aggr_video_status_info_vc, master_pipe, pipe0_concat_en,
   pipe0_aggre_en, empty_vld0, empty0, in_video_data_vld0,
   in_video_data0, ack0, ack_vld0, ack_pre0, line_end0, line_end_vld0,
   pipe1_concat_en, pipe1_aggre_en, empty_vld1, empty1,
   in_video_data_vld1, in_video_data1, ack1, ack_vld1, ack_pre1,
   line_end1, line_end_vld1, pipe2_concat_en, pipe2_aggre_en,
   empty_vld2, empty2, in_video_data_vld2, in_video_data2, ack2,
   ack_vld2, ack_pre2, line_end2, line_end_vld2, pipe3_concat_en,
   pipe3_aggre_en, empty_vld3, empty3, in_video_data_vld3,
   in_video_data3, ack3, ack_vld3, ack_pre3, line_end3, line_end_vld3,
   pipe4_aggre_en, empty_vld4, empty4, in_video_data_vld4,
   in_video_data4, ack4, ack_vld4, ack_pre4, line_end4, line_end_vld4,
   pipe5_aggre_en, empty_vld5, empty5, in_video_data_vld5,
   in_video_data5, ack5, ack_vld5, ack_pre5, line_end5, line_end_vld5,
   pipe6_aggre_en, empty_vld6, empty6, in_video_data_vld6,
   in_video_data6, ack6, ack_vld6, ack_pre6, line_end6, line_end_vld6,
   pipe7_aggre_en, empty_vld7, empty7, in_video_data_vld7,
   in_video_data7, ack7, ack_vld7, ack_pre7, line_end7, line_end_vld7,
   video_loss0, video_loss1, video_loss2, video_loss3,
   video_pipe_date_type_for_concat_align_vld3,
   video_pipe_date_type_for_concat_align_vld2,
   video_pipe_date_type_for_concat_align_vld1,
   video_pipe_date_type_for_concat_align_vld0,
   video_pipe_date_type_for_concat_align3,
   video_pipe_date_type_for_concat_align2,
   video_pipe_date_type_for_concat_align1,
   video_pipe_date_type_for_concat_align0
   );

    input                   aggre_clk;
    input                   aggre_clk_rst_n;
    input                   frame_sync_lock;
    input [1:0]             aggre_mode;
    input                   clk_1M;
    input                   fifo_wr_clk_0;
    input                   fifo_wr_clk_1;
    input                   fifo_wr_clk_2;
    input                   fifo_wr_clk_3;
    input                   fifo_wr_clk_rst_n_0;
    input                   fifo_wr_clk_rst_n_1;
    input                   fifo_wr_clk_rst_n_2;
    input                   fifo_wr_clk_rst_n_3;
    input                   idi_header_en_0;
    input                   idi_header_en_1;
    input                   idi_header_en_2;
    input                   idi_header_en_3;
    input   [5:0]           idi_datatype_0;
    input   [5:0]           idi_datatype_1;
    input   [5:0]           idi_datatype_2;
    input   [5:0]           idi_datatype_3;
    input   [15:0]          idi_wordcount_0;
    input   [15:0]          idi_wordcount_1;
    input   [15:0]          idi_wordcount_2;
    input   [15:0]          idi_wordcount_3;
    input   [2:0]           idi_linecount_0;
    input   [2:0]           idi_linecount_1;
    input   [2:0]           idi_linecount_2;
    input   [2:0]           idi_linecount_3;
    input   [3:0]           pipe_frame_active;
    input   [3:0]		    reg_sync_aggr_auto_mask_en;
    input   [3:0]		    reg_sync_aggr_force_video_mask;
    input   [3:0]		    reg_sync_aggr_video_mask_restart;
    input                   reg_sync_aggr_video_mask_latch_reset;
    input   [19:0]          reg_sync_aggr_video_timeout_threshold;
    input                   reg_sync_aggr_check_framecount_en;
    input                   reg_sync_aggr_check_linecount_en;
    input   [5:0]           reg_sync_aggr_video_status_info_datatype;
    input   [15:0]          reg_sync_aggr_video_status_info_linecount;
    input   [15:0]          reg_sync_aggr_video_status_info_wordcount;
    input   [2:0]           reg_sync_aggr_video_status_info_vc;
    input   [1:0]           master_pipe;
    input                   pipe0_concat_en;
    input                   pipe0_aggre_en;
    input                   empty_vld0;
    input                   empty0;
    input                   in_video_data_vld0;
    input    [139:0]        in_video_data0;
    input                   ack0;
    input                   ack_vld0;
    input                   ack_pre0;
    input                   line_end0;
    input                   line_end_vld0;
    input                   pipe1_concat_en;
    input                   pipe1_aggre_en;
    input                   empty_vld1;
    input                   empty1;
    input                   in_video_data_vld1;
    input    [139:0]        in_video_data1;
    input                   ack1;
    input                   ack_vld1;
    input                   ack_pre1;
    input                   line_end1;
    input                   line_end_vld1;
    input                   pipe2_concat_en;
    input                   pipe2_aggre_en;
    input                   empty_vld2;
    input                   empty2;
    input                   in_video_data_vld2;
    input    [139:0]        in_video_data2;
    input                   ack2;
    input                   ack_vld2;
    input                   ack_pre2;
    input                   line_end2;
    input                   line_end_vld2;
    input                   pipe3_concat_en;
    input                   pipe3_aggre_en;
    input                   empty_vld3;
    input                   empty3;
    input                   in_video_data_vld3;
    input    [139:0]        in_video_data3;
    input                   ack3;
    input                   ack_vld3;
    input                   ack_pre3;
    input                   line_end3;
    input                   line_end_vld3;
    input                   pipe4_aggre_en;
    input                   empty_vld4;
    input                   empty4;
    input                   in_video_data_vld4;
    input    [139:0]        in_video_data4;
    input                   ack4;
    input                   ack_vld4;
    input                   ack_pre4;
    input                   line_end4;
    input                   line_end_vld4;
    input                   pipe5_aggre_en;
    input                   empty_vld5;
    input                   empty5;
    input                   in_video_data_vld5;
    input    [139:0]        in_video_data5;
    input                   ack5;
    input                   ack_vld5;
    input                   ack_pre5;
    input                   line_end5;
    input                   line_end_vld5;
    input                   pipe6_aggre_en;
    input                   empty_vld6;
    input                   empty6;
    input                   in_video_data_vld6;
    input    [139:0]        in_video_data6;
    input                   ack6;
    input                   ack_vld6;
    input                   ack_pre6;
    input                   line_end6;
    input                   line_end_vld6;
    input                   pipe7_aggre_en;
    input                   empty_vld7;
    input                   empty7;
    input                   in_video_data_vld7;
    input    [139:0]        in_video_data7;
    input                   ack7;
    input                   ack_vld7;
    input                   ack_pre7;
    input                   line_end7;
    input                   line_end_vld7;
    input      	            video_loss0;
    input      	            video_loss1;
    input      	            video_loss2;
    input      	            video_loss3;
    input                   video_pipe_date_type_for_concat_align_vld3;
    input                   video_pipe_date_type_for_concat_align_vld2;
    input                   video_pipe_date_type_for_concat_align_vld1;
    input                   video_pipe_date_type_for_concat_align_vld0;
    input    [5:0]          video_pipe_date_type_for_concat_align3;
    input    [5:0]          video_pipe_date_type_for_concat_align2;
    input    [5:0]          video_pipe_date_type_for_concat_align1;
    input    [5:0]          video_pipe_date_type_for_concat_align0;

    output                  up_state0;
    output                  up_state1;
    output                  up_state2;
    output                  up_state3;
    output                  up_state4;
    output                  up_state5;
    output                  up_state6;
    output                  up_state7;
    output   [3:0]          sch_current_state;
    output                  out_video_data_vld;
    output   [139:0]        out_video_data;
    output   [7:0]          up_state_aggre;
    output   [3:0]          up_state_concat;
    output   [7:0]          line_end_aggre;
    output   [3:0]          line_end_concat;
    output   [7:0]          ack_aggre;
    output   [3:0]          ack_concat;
    output                  aggre_busy;
    output   [3:0]          pipe_clear_bit_map;
    output   [1:0]          pipe0_wr_mode;
    output   [1:0]          pipe1_wr_mode;
    output   [1:0]          pipe2_wr_mode;
    output   [1:0]          pipe3_wr_mode;
    output                  pipe0_wr_mode_strobe;
    output                  pipe1_wr_mode_strobe;
    output                  pipe2_wr_mode_strobe;
    output                  pipe3_wr_mode_strobe;
    output                  sch_data_type_align_fail_int;
    
    //debug state
    parameter               SCHDU_IDLE          = 4'd0      ; 
    parameter               SCHDU_PIPE0         = 4'd1      ;
    parameter               SCHDU_PIPE1         = 4'd2      ;
    parameter               SCHDU_PIPE2         = 4'd3      ;
    parameter               SCHDU_PIPE3         = 4'd4      ;
    parameter               SCHDU_PIPE4         = 4'd5      ;
    parameter               SCHDU_PIPE5         = 4'd6      ;
    parameter               SCHDU_PIPE6         = 4'd7      ;
    parameter               SCHDU_PIPE7         = 4'd8      ;
    //data out
    wire [7:0]              up_state_aggre_m2               ;
    reg  [139:0]            out_video_data_active           ;
    reg                     out_video_data_vld_active       ;
    reg  [139:0]            out_video_data_fix              ;
    reg                     out_video_data_vld_fix          ;
    wire [7:0]              video_data_vld_en               ;
    wire                    pipe0_en_fix                    ;
    wire                    pipe1_en_fix                    ;
    wire                    pipe2_en_fix                    ;
    wire                    pipe3_en_fix                    ;
    wire                    pipe4_en_fix                    ;
    wire                    pipe5_en_fix                    ;
    wire                    pipe6_en_fix                    ;
    wire                    pipe7_en_fix                    ;
    //debug states
    reg  [3:0]              sch_current_state               ;
    reg  [3:0]              sch_next_state                  ;
    //black pixel signals
    wire                    black_pixel_data_vld            ;
    wire [139:0]            black_pixel_data                ;
    wire                    black_pixel_vld_en              ;

    //***logic body***///
    //***debug state_machine begin
    always @ (posedge aggre_clk or negedge aggre_clk_rst_n) begin
        if (!aggre_clk_rst_n)
           sch_current_state <= 4'd0;
        else
            sch_current_state <= sch_next_state;
    end
    
    always @ (*) begin
        sch_next_state = sch_current_state;
        case (sch_current_state)
            SCHDU_IDLE:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_IDLE ;
    
           SCHDU_PIPE0:
               if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_PIPE0 ;
    
           SCHDU_PIPE1:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_PIPE1 ;
    
            SCHDU_PIPE2:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_PIPE2 ;
    
            SCHDU_PIPE3:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_PIPE3 ;
    
            SCHDU_PIPE4:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_PIPE4 ;
    
            SCHDU_PIPE5:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_PIPE5 ;
    
            SCHDU_PIPE6:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state7) 
                 sch_next_state =   SCHDU_PIPE7 ;
               else 
                 sch_next_state =   SCHDU_PIPE6 ;
    
            SCHDU_PIPE7:
               if (up_state0) 
                 sch_next_state =   SCHDU_PIPE0 ;
               else if (up_state1) 
                 sch_next_state =   SCHDU_PIPE1 ;
               else if (up_state2) 
                 sch_next_state =   SCHDU_PIPE2 ;
               else if (up_state3) 
                 sch_next_state =   SCHDU_PIPE3 ;
               else if (up_state4) 
                 sch_next_state =   SCHDU_PIPE4 ;
               else if (up_state5) 
                 sch_next_state =   SCHDU_PIPE5 ;
               else if (up_state6) 
                 sch_next_state =   SCHDU_PIPE6 ;
               else 
                 sch_next_state =   SCHDU_PIPE7 ;
    
           default:  
                sch_next_state =    SCHDU_IDLE ;
         endcase
    end
    //***debug state_machine end
    
    /*  as6d_app_pipe_sch_fcfs_m1  AUTO_TEMPLATE ()*/
    as6d_app_pipe_sch_fcfs_m1 u_as6d_app_pipe_sch_fcfs_m1(/*AUTOINST*/
							  // Outputs
							  .up_state_aggre	(up_state_aggre[7:0]),
							  .line_end_aggre	(line_end_aggre[7:0]),
							  .ack_aggre		(ack_aggre[7:0]),
							  .aggre_busy		(aggre_busy),
							  // Inputs
							  .aggre_clk		(aggre_clk),
							  .aggre_clk_rst_n	(aggre_clk_rst_n),
							  .aggre_mode		(aggre_mode[1:0]),
							  .pipe0_aggre_en	(pipe0_aggre_en),
							  .pipe1_aggre_en	(pipe1_aggre_en),
							  .pipe2_aggre_en	(pipe2_aggre_en),
							  .pipe3_aggre_en	(pipe3_aggre_en),
							  .pipe4_aggre_en	(pipe4_aggre_en),
							  .pipe5_aggre_en	(pipe5_aggre_en),
							  .pipe6_aggre_en	(pipe6_aggre_en),
							  .pipe7_aggre_en	(pipe7_aggre_en),
							  .empty0		(empty0),
							  .empty1		(empty1),
							  .empty2		(empty2),
							  .empty3		(empty3),
							  .empty4		(empty4),
							  .empty5		(empty5),
							  .empty6		(empty6),
							  .empty7		(empty7),
							  .ack0			(ack0),
							  .ack1			(ack1),
							  .ack2			(ack2),
							  .ack3			(ack3),
							  .ack4			(ack4),
							  .ack5			(ack5),
							  .ack6			(ack6),
							  .ack7			(ack7),
							  .ack_pre0		(ack_pre0),
							  .ack_pre1		(ack_pre1),
							  .ack_pre2		(ack_pre2),
							  .ack_pre3		(ack_pre3),
							  .ack_pre4		(ack_pre4),
							  .ack_pre5		(ack_pre5),
							  .ack_pre6		(ack_pre6),
							  .ack_pre7		(ack_pre7),
							  .line_end0		(line_end0),
							  .line_end1		(line_end1),
							  .line_end2		(line_end2),
							  .line_end3		(line_end3),
							  .line_end4		(line_end4),
							  .line_end5		(line_end5),
							  .line_end6		(line_end6),
							  .line_end7		(line_end7));
    
    /*  as6d_app_pipe_sch_async_m2  AUTO_TEMPLATE ()*/
    as6d_app_pipe_sch_fcfs_m2 u_as6d_app_pipe_sch_fcfs_m2(/*AUTOINST*/
							  // Outputs
							  .up_state_aggre_m2	(up_state_aggre_m2[7:0]),
							  // Inputs
							  .aggre_clk		(aggre_clk),
							  .aggre_clk_rst_n	(aggre_clk_rst_n),
							  .aggre_mode		(aggre_mode[1:0]),
							  .empty0		(empty0),
							  .empty1		(empty1),
							  .empty2		(empty2),
							  .empty3		(empty3),
							  .empty4		(empty4),
							  .empty5		(empty5),
							  .empty6		(empty6),
							  .empty7		(empty7),
							  .empty_vld0		(empty_vld0),
							  .empty_vld1		(empty_vld1),
							  .empty_vld2		(empty_vld2),
							  .empty_vld3		(empty_vld3),
							  .empty_vld4		(empty_vld4),
							  .empty_vld5		(empty_vld5),
							  .empty_vld6		(empty_vld6),
							  .empty_vld7		(empty_vld7),
							  .ack0			(ack0),
							  .ack1			(ack1),
							  .ack2			(ack2),
							  .ack3			(ack3),
							  .ack4			(ack4),
							  .ack5			(ack5),
							  .ack6			(ack6),
							  .ack7			(ack7),
							  .ack_vld0		(ack_vld0),
							  .ack_vld1		(ack_vld1),
							  .ack_vld2		(ack_vld2),
							  .ack_vld3		(ack_vld3),
							  .ack_vld4		(ack_vld4),
							  .ack_vld5		(ack_vld5),
							  .ack_vld6		(ack_vld6),
							  .ack_vld7		(ack_vld7),
							  .line_end0		(line_end0),
							  .line_end1		(line_end1),
							  .line_end2		(line_end2),
							  .line_end3		(line_end3),
							  .line_end4		(line_end4),
							  .line_end5		(line_end5),
							  .line_end6		(line_end6),
							  .line_end7		(line_end7),
							  .line_end_vld0	(line_end_vld0),
							  .line_end_vld1	(line_end_vld1),
							  .line_end_vld2	(line_end_vld2),
							  .line_end_vld3	(line_end_vld3),
							  .line_end_vld4	(line_end_vld4),
							  .line_end_vld5	(line_end_vld5),
							  .line_end_vld6	(line_end_vld6),
							  .line_end_vld7	(line_end_vld7));
    
    /*  as6d_app_pipe_sch_concat  AUTO_TEMPLATE ()*/
    as6d_app_pipe_sch_concat u_as6d_app_pipe_sch_concat(/*AUTOINST*/
							// Outputs
							.black_pixel_data(black_pixel_data[139:0]),
							.black_pixel_data_vld(black_pixel_data_vld),
							.local_linecount_out(local_linecount_out[15:0]),
							.local_pkt_datatype_out(local_pkt_datatype_out[5:0]),
							.pipe0_wr_mode	(pipe0_wr_mode[1:0]),
							.pipe1_wr_mode	(pipe1_wr_mode[1:0]),
							.pipe2_wr_mode	(pipe2_wr_mode[1:0]),
							.pipe3_wr_mode	(pipe3_wr_mode[1:0]),
							.sch_data_type_align_fail_int(sch_data_type_align_fail_int),
							.up_state_concat(up_state_concat/*.[0:3]*/),
							.ack_concat	(ack_concat[3:0]),
							.line_end_concat(line_end_concat[3:0]),
							// Inputs
							.ack0		(ack0),
							.ack1		(ack1),
							.ack2		(ack2),
							.ack3		(ack3),
							.aggr_clk	(aggr_clk),
							.aggr_clk_rst_n	(aggr_clk_rst_n),
							.aggre_clk	(aggre_clk),
							.aggre_clk_rst_n(aggre_clk_rst_n),
							.aggre_mode	(aggre_mode[1:0]),
							.clk_1M		(clk_1M),
							.clk_1M_rst_n	(clk_1M_rst_n),
							.empty0		(empty0),
							.empty1		(empty1),
							.empty2		(empty2),
							.empty3		(empty3),
							.fifo_wr_clk	(fifo_wr_clk),
							.fifo_wr_clk_0	(fifo_wr_clk_0),
							.fifo_wr_clk_1	(fifo_wr_clk_1),
							.fifo_wr_clk_2	(fifo_wr_clk_2),
							.fifo_wr_clk_3	(fifo_wr_clk_3),
							.fifo_wr_clk_rst_n(fifo_wr_clk_rst_n),
							.fifo_wr_clk_rst_n_0(fifo_wr_clk_rst_n_0),
							.fifo_wr_clk_rst_n_1(fifo_wr_clk_rst_n_1),
							.fifo_wr_clk_rst_n_2(fifo_wr_clk_rst_n_2),
							.fifo_wr_clk_rst_n_3(fifo_wr_clk_rst_n_3),
							.frame_sync_lock(frame_sync_lock),
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
							.line_end0	(line_end0),
							.line_end1	(line_end1),
							.line_end2	(line_end2),
							.line_end3	(line_end3),
							.master_pipe	(master_pipe[1:0]),
							.pipe_frame_active(pipe_frame_active[3:0]),
							.video_pipe_date_type_for_concat_align0(video_pipe_date_type_for_concat_align0[5:0]),
							.video_pipe_date_type_for_concat_align1(video_pipe_date_type_for_concat_align1[5:0]),
							.video_pipe_date_type_for_concat_align2(video_pipe_date_type_for_concat_align2[5:0]),
							.video_pipe_date_type_for_concat_align3(video_pipe_date_type_for_concat_align3[5:0]),
							.video_pipe_date_type_for_concat_align_vld0(video_pipe_date_type_for_concat_align_vld0),
							.video_pipe_date_type_for_concat_align_vld1(video_pipe_date_type_for_concat_align_vld1),
							.video_pipe_date_type_for_concat_align_vld2(video_pipe_date_type_for_concat_align_vld2),
							.video_pipe_date_type_for_concat_align_vld3(video_pipe_date_type_for_concat_align_vld3),
							.reg_sync_aggr_auto_mask_en(reg_sync_aggr_auto_mask_en[3:0]),
							.reg_sync_aggr_force_video_mask(reg_sync_aggr_force_video_mask[3:0]),
							.reg_sync_aggr_video_mask_restart_en(reg_sync_aggr_video_mask_restart_en[3:0]),
							.reg_sync_aggr_video_mask_latch_reset(reg_sync_aggr_video_mask_latch_reset),
							.reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
							.reg_sync_aggr_check_framecount_en(reg_sync_aggr_check_framecount_en),
							.reg_sync_aggr_check_linecount_en(reg_sync_aggr_check_linecount_en),
							.reg_sync_aggr_video_status_info_datatype(reg_sync_aggr_video_status_info_datatype[5:0]),
							.reg_sync_aggr_video_status_info_linecount(reg_sync_aggr_video_status_info_linecount[15:0]),
							.reg_sync_aggr_video_status_info_wordcount(reg_sync_aggr_video_status_info_wordcount[15:0]),
							.reg_sync_aggr_video_status_info_vc(reg_sync_aggr_video_status_info_vc[2:0]),
							.video_loss0	(video_loss0),
							.video_loss1	(video_loss1),
							.video_loss2	(video_loss2),
							.video_loss3	(video_loss3));
    
    
    
    //***up_state logic
    assign    up_state0 = (aggre_mode==2'd1) ? up_state_concat[0]   : 
                          (aggre_mode==2'd2) ? up_state_aggre[0]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[0] : 1'd0 ;
    
    assign    up_state1 = (aggre_mode==2'd1) ? up_state_concat[1]   : 
                          (aggre_mode==2'd2) ? up_state_aggre[1]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[1] : 1'd0 ;
    
    assign    up_state2 = (aggre_mode==2'd1) ? up_state_concat[2]   : 
                          (aggre_mode==2'd2) ? up_state_aggre[2]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[2] : 1'd0 ;
    
    assign    up_state3 = (aggre_mode==2'd1) ? up_state_concat[3]   :
                          (aggre_mode==2'd2) ? up_state_aggre[3]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[3] : 1'd0 ;
    
    assign    up_state4 = (aggre_mode==2'd1) ? 1'd0                 : 
                          (aggre_mode==2'd2) ? up_state_aggre[4]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[4] : 1'd0 ;
    
    assign    up_state5 = (aggre_mode==2'd1) ? 1'd0                 : 
                          (aggre_mode==2'd2) ? up_state_aggre[5]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[5] : 1'd0 ;
    
    assign    up_state6 = (aggre_mode==2'd1) ? 1'd0                 : 
                          (aggre_mode==2'd2) ? up_state_aggre[6]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[6] : 1'd0 ;
    
    assign    up_state7 = (aggre_mode==2'd1) ? 1'd0                 :
                          (aggre_mode==2'd2) ? up_state_aggre[7]    : 
                          (aggre_mode==2'd3) ? up_state_aggre_m2[7] : 1'd0 ;
    
    //***data from video pipe fifo to sch
    //***async aggregation method 2
    //***out_video_data_vld_active,out_video_data_active logic
    always@(*)begin
        if(in_video_data_vld0&(in_video_data0[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data0[139:0] ;
            out_video_data_vld_active    = in_video_data_vld0    ;
        end
        else if(in_video_data_vld1&(in_video_data1[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data1[139:0] ;
            out_video_data_vld_active    = in_video_data_vld1    ;
        end
        else if(in_video_data_vld2&(in_video_data2[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data2[139:0] ;
            out_video_data_vld_active    = in_video_data_vld2    ;
        end
        else if(in_video_data_vld3&(in_video_data3[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data3[139:0] ;
            out_video_data_vld_active    = in_video_data_vld3    ;
        end
        else if(in_video_data_vld4&(in_video_data4[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data4[139:0] ;
            out_video_data_vld_active    = in_video_data_vld4    ;
        end
        else if(in_video_data_vld5&(in_video_data5[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data5[139:0] ;
            out_video_data_vld_active    = in_video_data_vld5    ;
        end
        else if(in_video_data_vld6&(in_video_data6[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data6[139:0] ;
            out_video_data_vld_active    = in_video_data_vld6    ;
        end
        else if(in_video_data_vld7&(in_video_data7[139:136]=={2'd0,AGGR_ID}))begin
            out_video_data_active        = in_video_data7[139:0] ;
            out_video_data_vld_active    = in_video_data_vld7    ;
        end
        else begin
            out_video_data_active        = 140'd0                ;
            out_video_data_vld_active    = 1'd0                  ;
        end
    end
    
    //***data from video pipe fifo to sch
    //***sync  aggregation 
    //***async aggregation method 1
    //***out_video_data_vld_fix,out_video_data_fix logic
    assign    pipe0_en_fix    =    (aggre_mode==1) ? pipe0_concat_en : (aggre_mode==2) ? pipe0_aggre_en : 1'd0 ;
    assign    pipe1_en_fix    =    (aggre_mode==1) ? pipe1_concat_en : (aggre_mode==2) ? pipe1_aggre_en : 1'd0 ;
    assign    pipe2_en_fix    =    (aggre_mode==1) ? pipe2_concat_en : (aggre_mode==2) ? pipe2_aggre_en : 1'd0 ;
    assign    pipe3_en_fix    =    (aggre_mode==1) ? pipe3_concat_en : (aggre_mode==2) ? pipe3_aggre_en : 1'd0 ;
    assign    pipe4_en_fix    =    (aggre_mode==1) ? 1'd0            : (aggre_mode==2) ? pipe4_aggre_en : 1'd0 ;
    assign    pipe5_en_fix    =    (aggre_mode==1) ? 1'd0            : (aggre_mode==2) ? pipe5_aggre_en : 1'd0 ;
    assign    pipe6_en_fix    =    (aggre_mode==1) ? 1'd0            : (aggre_mode==2) ? pipe6_aggre_en : 1'd0 ;
    assign    pipe7_en_fix    =    (aggre_mode==1) ? 1'd0            : (aggre_mode==2) ? pipe7_aggre_en : 1'd0 ;
    
    assign video_data_vld_en = {in_video_data_vld7&pipe7_en_fix,
                                in_video_data_vld6&pipe6_en_fix,
                                in_video_data_vld5&pipe5_en_fix,
                                in_video_data_vld4&pipe4_en_fix,
                                in_video_data_vld3&pipe3_en_fix,
                                in_video_data_vld2&pipe2_en_fix,
                                in_video_data_vld1&pipe1_en_fix,
                                in_video_data_vld0&pipe0_en_fix};
    
    assign black_pixel_vld_en = black_pixel_data_vld;

    always@(*)begin
        out_video_data_vld_fix    = black_pixel_vld_en |video_data_vld_en;
    end
    
    always@(*)begin
        if(black_pixel_vld_en)
            out_video_data_fix = black_pixel_data[139:0];
        else
            case(video_data_vld_en)
                8'b0000_0001:out_video_data_fix    = in_video_data0[139:0]; 
                8'b0000_0010:out_video_data_fix    = in_video_data1[139:0];
                8'b0000_0100:out_video_data_fix    = in_video_data2[139:0];
                8'b0000_1000:out_video_data_fix    = in_video_data3[139:0];
                8'b0001_0000:out_video_data_fix    = in_video_data4[139:0]; 
                8'b0010_0000:out_video_data_fix    = in_video_data5[139:0];
                8'b0100_0000:out_video_data_fix    = in_video_data6[139:0];
                8'b1000_0000:out_video_data_fix    = in_video_data7[139:0];
                default:out_video_data_fix = 140'd0;
            endcase
    end
    
    //***out_video_data_vld,out_video_data logic
    assign    out_video_data        =    (aggre_mode == 2'd3)                       ? out_video_data_active     :
                                         (aggre_mode == 2'd1)||(aggre_mode == 2'd2) ? out_video_data_fix        :
                                         140'd0;
    
    assign    out_video_data_vld    =    (aggre_mode == 2'd3)                       ? out_video_data_vld_active :
                                         (aggre_mode == 2'd1)||(aggre_mode == 2'd2) ? out_video_data_vld_fix    :
                                         1'd0;
    
endmodule
