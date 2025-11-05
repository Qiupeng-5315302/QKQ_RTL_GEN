module as6d_app_pipe_sch_concat(
/*AUTOARG*/
   // Outputs
   up_state_concat, ack_concat, line_end_concat, 
   pipe0_wr_mode, pipe1_wr_mode, pipe2_wr_mode, pipe3_wr_mode, 
   pipe0_wr_mode_strobe, pipe1_wr_mode_strobe, pipe2_wr_mode_strobe, pipe3_wr_mode_strobe,
   pipe_clear_bit_map, sch_data_type_align_fail_int,
   black_pixel_data_vld, black_pixel_data,
   // Inputs
   aggre_clk, aggre_clk_rst_n, aggre_mode, clk_1M,
   fifo_wr_clk_0, fifo_wr_clk_1, fifo_wr_clk_2, fifo_wr_clk_3,
   fifo_wr_clk_rst_n_0, fifo_wr_clk_rst_n_1, fifo_wr_clk_rst_n_2, fifo_wr_clk_rst_n_3,
   idi_header_en_0, idi_header_en_1, idi_header_en_2, idi_header_en_3,
   idi_datatype_0, idi_datatype_1, idi_datatype_2, idi_datatype_3,
   idi_wordcount_0, idi_wordcount_1, idi_wordcount_2, idi_wordcount_3,
   idi_linecount_0, idi_linecount_1, idi_linecount_2, idi_linecount_3,
   pipe0_concat_en, pipe1_concat_en, pipe2_concat_en, pipe3_concat_en, 
   video_loss0, video_loss1, video_loss2, video_loss3, 
   empty0, empty1, empty2, empty3, 
   ack0, ack1, ack2, ack3, 
   line_end0, line_end1, line_end2, line_end3, 
   frame_sync_lock, master_pipe, auto_mask_en,
   force_video_mask, video_mask_restart, video_mask_latch_reset,
   reg_sync_aggr_video_timeout_threshold, pipe_frame_active,
   reg_sync_aggr_check_framecount, reg_sync_aggr_check_linecount,
   video_status_info_datatype, video_status_info_linecount,
   video_status_info_wordcount, video_status_info_vc,
   video_pipe_date_type_for_concat_align_vld3,
   video_pipe_date_type_for_concat_align_vld2,
   video_pipe_date_type_for_concat_align_vld1,
   video_pipe_date_type_for_concat_align_vld0,
   video_pipe_date_type_for_concat_align3,
   video_pipe_date_type_for_concat_align2,
   video_pipe_date_type_for_concat_align1,
   video_pipe_date_type_for_concat_align0
   );    
    // =========================================================================
    // Clock and Reset
    // =========================================================================
    input                   aggre_clk;
    input                   aggre_clk_rst_n;
    input                   clk_1M;                       // 1MHz clock for us counter
    
    // =========================================================================
    // IDI Interface - FIFO Write Side (from 4 video_pipe modules)
    // =========================================================================
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
    
    // =========================================================================
    // Configuration and Control
    // =========================================================================
    input [1:0]             aggre_mode;
    input                   pipe0_concat_en;
    input                   pipe1_concat_en;
    input                   pipe2_concat_en;
    input                   pipe3_concat_en;
    input                   video_loss0;
    input                   video_loss1;
    input                   video_loss2;
    input                   video_loss3;
    input                   empty0;
    input                   empty1;
    input                   empty2;
    input                   empty3;
    input                   ack0;
    input                   ack1;
    input                   ack2;
    input                   ack3;
    input                   line_end0;
    input                   line_end1;
    input                   line_end2;
    input                   line_end3;
    input                   frame_sync_lock;
    input       [1:0]       master_pipe;
    input       [3:0]       auto_mask_en;
    input       [3:0]       force_video_mask;
    input       [3:0]       video_mask_restart;
    input                   video_mask_latch_reset;       // Video mask latch reset
    input       [19:0]      reg_sync_aggr_video_timeout_threshold;  // Timeout threshold
    input                   reg_sync_aggr_check_framecount;         // Enable framecount check
    input                   reg_sync_aggr_check_linecount;          // Enable linecount check
    input       [3:0]       pipe_frame_active;            // Pipe frame active status
    
    // =========================================================================
    // BPG Configuration Inputs
    // =========================================================================
    input       [5:0]       video_status_info_datatype;   // Video status datatype for BPG
    input       [15:0]      video_status_info_linecount;  // Video status line count for BPG
    input       [15:0]      video_status_info_wordcount;  // Video status word count for BPG
    input       [2:0]       video_status_info_vc;         // Video status virtual channel for BPG
    
    // =========================================================================
    // Video Datatype for Alignment
    // =========================================================================
    input                   video_pipe_date_type_for_concat_align_vld0;
    input                   video_pipe_date_type_for_concat_align_vld1;
    input                   video_pipe_date_type_for_concat_align_vld2;
    input                   video_pipe_date_type_for_concat_align_vld3;
    input       [5:0]       video_pipe_date_type_for_concat_align0;
    input       [5:0]       video_pipe_date_type_for_concat_align1;
    input       [5:0]       video_pipe_date_type_for_concat_align2;
    input       [5:0]       video_pipe_date_type_for_concat_align3;
    
    // =========================================================================
    // Outputs
    // =========================================================================
    output wire [1:0]       pipe0_wr_mode;
    output wire [1:0]       pipe1_wr_mode;
    output wire [1:0]       pipe2_wr_mode;
    output wire [1:0]       pipe3_wr_mode;
    output wire             up_state_concat[0:3];
    output wire [3:0]       ack_concat;
    output wire [3:0]       line_end_concat;
    output wire             pipe0_wr_mode_strobe;
    output wire             pipe1_wr_mode_strobe;
    output wire             pipe2_wr_mode_strobe;
    output wire             pipe3_wr_mode_strobe;
    output wire [3:0]       pipe_clear_bit_map;
    output wire             sch_data_type_align_fail_int;
    output wire             black_pixel_data_vld;
    output wire [139:0]     black_pixel_data;

    // =========================================================================
    // Internal Signals
    // =========================================================================
    // Signals from video_status_management to pipe_sch_concat_line_interleaved
    wire                    start_sch_pulse;
    wire    [3:0]           start_sch_pipe_mask_bitmap;
    wire    [3:0]           start_sch_pipe_rdy_bitmap;
    wire                    end_sch_pulse;
    
    // BPG Configuration Signals from video_status_management
    wire    [15:0]          local_framecount_out;
    wire    [15:0]          local_linecount_out;
    wire    [5:0]           local_pkt_datatype_out;
    
    // BPG Interface Signals
    wire                    bpg_empty;
    wire                    bpg_ack;
    wire                    bpg_line_end;
    wire                    bpg_up_state;
    
    // Pipe concat enable bitmap
    wire    [3:0]           pipe_concat_en;
    assign pipe_concat_en = {pipe3_concat_en, pipe2_concat_en, pipe1_concat_en, pipe0_concat_en};
    
// =========================================================================
// Submodule Integration 1: as6d_app_video_status_management
// =========================================================================
as6d_app_video_status_management u_video_status_management (
    // FIFO Write Side Interfaces
    .fifo_wr_clk_0          (fifo_wr_clk_0),
    .fifo_wr_clk_rst_n_0    (fifo_wr_clk_rst_n_0),
    .idi_header_en_0        (idi_header_en_0),
    .idi_datatype_0         (idi_datatype_0),
    .idi_wordcount_0        (idi_wordcount_0),
    .idi_linecount_0        (idi_linecount_0),
    
    .fifo_wr_clk_1          (fifo_wr_clk_1),
    .fifo_wr_clk_rst_n_1    (fifo_wr_clk_rst_n_1),
    .idi_header_en_1        (idi_header_en_1),
    .idi_datatype_1         (idi_datatype_1),
    .idi_wordcount_1        (idi_wordcount_1),
    .idi_linecount_1        (idi_linecount_1),
    
    .fifo_wr_clk_2          (fifo_wr_clk_2),
    .fifo_wr_clk_rst_n_2    (fifo_wr_clk_rst_n_2),
    .idi_header_en_2        (idi_header_en_2),
    .idi_datatype_2         (idi_datatype_2),
    .idi_wordcount_2        (idi_wordcount_2),
    .idi_linecount_2        (idi_linecount_2),
    
    .fifo_wr_clk_3          (fifo_wr_clk_3),
    .fifo_wr_clk_rst_n_3    (fifo_wr_clk_rst_n_3),
    .idi_header_en_3        (idi_header_en_3),
    .idi_datatype_3         (idi_datatype_3),
    .idi_wordcount_3        (idi_wordcount_3),
    .idi_linecount_3        (idi_linecount_3),
    
    // Aggregator Clock Domain
    .aggr_clk               (aggre_clk),
    .aggr_clk_rst_n         (aggre_clk_rst_n),
    .clk_1M                 (clk_1M),
    
    // Handshake with schedule_concat
    .start_sch_pulse        (start_sch_pulse),
    .start_sch_pipe_mask_bitmap (start_sch_pipe_mask_bitmap),
    .start_sch_pipe_rdy_bitmap  (start_sch_pipe_rdy_bitmap),
    .end_sch_pulse          (end_sch_pulse),
    
    // Configuration Registers
    .pipe_concat_en         (pipe_concat_en),
    .Force_Video_Mask       (force_video_mask),
    .Auto_Mask_En           (auto_mask_en),
    .Video_Mask_Restart_En  (video_mask_restart),
    .pipe_frame_active      (pipe_frame_active),
    .frame_sync_lock        (frame_sync_lock),
    .aggre_mode             (aggre_mode),
    .video_mask_latch_reset (video_mask_latch_reset),
    .reg_sync_aggr_video_timeout_threshold (reg_sync_aggr_video_timeout_threshold),
    .reg_sync_aggr_check_framecount (reg_sync_aggr_check_framecount),
    .reg_sync_aggr_check_linecount  (reg_sync_aggr_check_linecount),
    
    // BPG Configuration Inputs
    .video_status_info_datatype  (video_status_info_datatype),
    .video_status_info_linecount (video_status_info_linecount),
    .video_status_info_wordcount (video_status_info_wordcount),
    .video_status_info_vc        (video_status_info_vc),
    
    // Pipe Write Mode Control
    .pipe_clear_bit_map     (pipe_clear_bit_map),
    .pipe_wr_mode_0         (pipe0_wr_mode),
    .pipe_wr_mode_1         (pipe1_wr_mode),
    .pipe_wr_mode_2         (pipe2_wr_mode),
    .pipe_wr_mode_3         (pipe3_wr_mode),
    
    // BPG Configuration Outputs
    .local_framecount_out   (local_framecount_out),
    .local_linecount_out    (local_linecount_out),
    .local_pkt_datatype_out (local_pkt_datatype_out)
);

// =========================================================================
// Submodule Integration 2: as6d_app_pipe_sch_concat_line_interleaved
// =========================================================================
as6d_app_pipe_sch_concat_line_interleaved u_pipe_sch_concat_line_interleaved (
    // Clock and Reset
    .aggre_clk              (aggre_clk),
    .aggre_clk_rst_n        (aggre_clk_rst_n),
    
    // Configuration Inputs
    .aggre_mode             (aggre_mode),
    .pipe0_concat_en        (pipe0_concat_en),
    .pipe1_concat_en        (pipe1_concat_en),
    .pipe2_concat_en        (pipe2_concat_en),
    .pipe3_concat_en        (pipe3_concat_en),
    .pipe_mask_bitmap       (start_sch_pipe_mask_bitmap),
    .master_pipe            (master_pipe),
    .pipe_rdy_bitmap        (start_sch_pipe_rdy_bitmap),
    
    // Scheduling Control
    .start_sch_pulse        (start_sch_pulse),
    .end_sch_pulse          (end_sch_pulse),
    
    // Video Pipe DataType for Alignment Detection
    .video_pipe_date_type_for_concat_align_vld0 (video_pipe_date_type_for_concat_align_vld0),
    .video_pipe_date_type_for_concat_align0     (video_pipe_date_type_for_concat_align0),
    .video_pipe_date_type_for_concat_align_vld1 (video_pipe_date_type_for_concat_align_vld1),
    .video_pipe_date_type_for_concat_align1     (video_pipe_date_type_for_concat_align1),
    .video_pipe_date_type_for_concat_align_vld2 (video_pipe_date_type_for_concat_align_vld2),
    .video_pipe_date_type_for_concat_align2     (video_pipe_date_type_for_concat_align2),
    .video_pipe_date_type_for_concat_align_vld3 (video_pipe_date_type_for_concat_align_vld3),
    .video_pipe_date_type_for_concat_align3     (video_pipe_date_type_for_concat_align3),
    
    // Video Pipe Acknowledgement and Line End Signals
    .ack0                   (ack0),
    .ack1                   (ack1),
    .ack2                   (ack2),
    .ack3                   (ack3),
    .line_end0              (line_end0),
    .line_end1              (line_end1),
    .line_end2              (line_end2),
    .line_end3              (line_end3),
    
    // BPG Interface - Inputs from BPG
    .bpg_empty              (bpg_empty),
    .bpg_ack                (bpg_ack),
    .bpg_line_end           (bpg_line_end),
    
    // BPG Interface - Outputs to BPG
    .bpg_up_state           (bpg_up_state),
    
    // Video Pipe Up State Concat Outputs
    .up_state_concat        (up_state_concat),
    
    // Status Outputs
    .sch_data_type_align_fail_int (sch_data_type_align_fail_int)
);

// =========================================================================
// Submodule Integration 3: black_pixel_generator
// =========================================================================
black_pixel_generator u_black_pixel_generator (
    // Clock and Reset
    .clk                        (aggre_clk),
    .rst_n                      (aggre_clk_rst_n),
    
    // Configuration Registers (from top-level inputs)
    .video_status_info_datatype  (video_status_info_datatype),
    .video_status_info_wordcount (video_status_info_wordcount),
    .video_status_info_vc        (video_status_info_vc),
    
    // Packet Info from pipe_mask_ctrl
    .local_framecount       (local_framecount_out),
    
    // Handshake with schedule_concat
    .unready                (bpg_empty),            // BPG not ready = empty
    .up_state               (bpg_up_state),
    .ack                    (bpg_ack),
    .line_end               (bpg_line_end),
    
    // Data Output (IDI format) - connected to module output
    .black_pixel_data_vld   (black_pixel_data_vld),
    .black_pixel_data       (black_pixel_data)
);

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
