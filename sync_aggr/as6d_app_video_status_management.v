module as6d_app_video_status_management(
    // =========================================================================
    // FIFO Write Side Interfaces (from 4 video_pipe modules)
    // =========================================================================
    // FIFO 0 Write Interface
    input                   fifo_wr_clk_0,
    input                   fifo_wr_clk_rst_n_0,
    input                   idi_header_en_0,
    input   [5:0]           idi_datatype_0,
    input   [15:0]          idi_wordcount_0,
    input   [2:0]           idi_linecount_0,
    
    // FIFO 1 Write Interface
    input                   fifo_wr_clk_1,
    input                   fifo_wr_clk_rst_n_1,
    input                   idi_header_en_1,
    input   [5:0]           idi_datatype_1,
    input   [15:0]          idi_wordcount_1,
    input   [2:0]           idi_linecount_1,
    
    // FIFO 2 Write Interface
    input                   fifo_wr_clk_2,
    input                   fifo_wr_clk_rst_n_2,
    input                   idi_header_en_2,
    input   [5:0]           idi_datatype_2,
    input   [15:0]          idi_wordcount_2,
    input   [2:0]           idi_linecount_2,
    
    // FIFO 3 Write Interface
    input                   fifo_wr_clk_3,
    input                   fifo_wr_clk_rst_n_3,
    input                   idi_header_en_3,
    input   [5:0]           idi_datatype_3,
    input   [15:0]          idi_wordcount_3,
    input   [2:0]           idi_linecount_3,
    
    // =========================================================================
    // Aggregator Clock Domain
    // =========================================================================
    input                   aggr_clk,                     // Aggregator main clock
    input                   aggr_clk_rst_n,               // Aggregator reset (active low)
    input                   clk_1M,                       // 1MHz clock for us counter / timeout
    
    // =========================================================================
    // Handshake with schedule_concat
    // =========================================================================
    output                  start_sch_pulse,              // Start scheduling pulse to schedule_concat
    output  [3:0]           start_sch_pipe_mask_bitmap,   // Mask pipe bitmap aligned with start_sch_pulse
    input                   end_sch_pulse,                // End scheduling pulse from schedule_concat
    
    // =========================================================================
    // Configuration Registers for pipe_mask_ctrl
    // =========================================================================
    input   [3:0]           pipe_concat_en,               // Pipe concat enable bitmap
    input   [3:0]           Force_Video_Mask,             // Force video mask bitmap
    input   [3:0]           Auto_Mask_En,                 // Auto mask enable bitmap
    input   [3:0]           Video_Mask_Restart_En,        // Video mask restart enable bitmap
    input   [3:0]           pipe_frame_active,            // Pipe frame active status
    input                   frame_sync_lock,              // Frame sync lock status
    input   [1:0]           aggre_mode,                   // Aggregation mode
    input                   video_mask_latch_reset,       // Video mask latch reset
    input   [19:0]          reg_sync_aggr_video_timeout_threshold, // Video timeout threshold
    
    // =========================================================================
    // Pipe Write Mode Control (to video_pipe modules)
    // =========================================================================
    output  [3:0]           pipe_clear_bit_map,           // Clear pipe control (pipe序号)
    output  [1:0]           pipe_wr_mode_0,               // Pipe 0 write mode control
    output  [1:0]           pipe_wr_mode_1,               // Pipe 1 write mode control
    output  [1:0]           pipe_wr_mode_2,               // Pipe 2 write mode control
    output  [1:0]           pipe_wr_mode_3,               // Pipe 3 write mode control
    
    // =========================================================================
    // BPG Configuration Outputs (from pipe_mask_ctrl)
    // =========================================================================
    output  [15:0]          local_framecount_out,         // Frame number for BPG
    output  [15:0]          local_linecount_out,          // Line number for BPG
    output  [5:0]           local_pkt_datatype_out        // Packet datatype for BPG
);

// =========================================================================
// Internal Signals
// =========================================================================
// us Counter from pipe_mask_ctrl (aggr_clk domain)
wire    [79:0]          local_us_cnt;

// AFIFO signals between buffer_wr_ctrl and pipe_mask_ctrl
wire                    afifo_wr_en_0, afifo_wr_en_1, afifo_wr_en_2, afifo_wr_en_3;
wire    [101:0]         afifo_wr_data_0, afifo_wr_data_1, afifo_wr_data_2, afifo_wr_data_3;
wire                    afifo_full_0, afifo_full_1, afifo_full_2, afifo_full_3;

wire                    afifo_rd_en_0, afifo_rd_en_1, afifo_rd_en_2, afifo_rd_en_3;
wire    [101:0]         afifo_rd_data_0, afifo_rd_data_1, afifo_rd_data_2, afifo_rd_data_3;
wire                    afifo_empty_0, afifo_empty_1, afifo_empty_2, afifo_empty_3;

// =========================================================================
// Submodule: video_status_buffer_wr_ctrl (4 instances)
// Note: us_counter is now provided by pipe_mask_ctrl's local_us_cnt output
// =========================================================================
// Instance 0
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_0(
    .fifo_wr_clk            (fifo_wr_clk_0),
    .fifo_wr_clk_rst_n      (fifo_wr_clk_rst_n_0),
    .idi_header_en          (idi_header_en_0),
    .idi_datatype           (idi_datatype_0),
    .idi_wordcount          (idi_wordcount_0),
    .idi_linecount          (idi_linecount_0),
    .aggr_clk               (aggr_clk),
    .aggr_clk_rst_n         (aggr_clk_rst_n),
    .local_us_cnt           (local_us_cnt),
    .wr_en                  (afifo_wr_en_0),
    .wr_data                (afifo_wr_data_0),
    .afifo_full             (afifo_full_0)
);

// Instance 1
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_1(
    .fifo_wr_clk            (fifo_wr_clk_1),
    .fifo_wr_clk_rst_n      (fifo_wr_clk_rst_n_1),
    .idi_header_en          (idi_header_en_1),
    .idi_datatype           (idi_datatype_1),
    .idi_wordcount          (idi_wordcount_1),
    .idi_linecount          (idi_linecount_1),
    .aggr_clk               (aggr_clk),
    .aggr_clk_rst_n         (aggr_clk_rst_n),
    .local_us_cnt           (local_us_cnt),
    .wr_en                  (afifo_wr_en_1),
    .wr_data                (afifo_wr_data_1),
    .afifo_full             (afifo_full_1)
);

// Instance 2
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_2(
    .fifo_wr_clk            (fifo_wr_clk_2),
    .fifo_wr_clk_rst_n      (fifo_wr_clk_rst_n_2),
    .idi_header_en          (idi_header_en_2),
    .idi_datatype           (idi_datatype_2),
    .idi_wordcount          (idi_wordcount_2),
    .idi_linecount          (idi_linecount_2),
    .aggr_clk               (aggr_clk),
    .aggr_clk_rst_n         (aggr_clk_rst_n),
    .local_us_cnt           (local_us_cnt),
    .wr_en                  (afifo_wr_en_2),
    .wr_data                (afifo_wr_data_2),
    .afifo_full             (afifo_full_2)
);

// Instance 3
video_status_buffer_wr_ctrl u_video_status_buffer_wr_ctrl_3(
    .fifo_wr_clk            (fifo_wr_clk_3),
    .fifo_wr_clk_rst_n      (fifo_wr_clk_rst_n_3),
    .idi_header_en          (idi_header_en_3),
    .idi_datatype           (idi_datatype_3),
    .idi_wordcount          (idi_wordcount_3),
    .idi_linecount          (idi_linecount_3),
    .aggr_clk               (aggr_clk),
    .aggr_clk_rst_n         (aggr_clk_rst_n),
    .local_us_cnt           (local_us_cnt),
    .wr_en                  (afifo_wr_en_3),
    .wr_data                (afifo_wr_data_3),
    .afifo_full             (afifo_full_3)
);

// =========================================================================
// TODO: Instantiate 4 AFIFO modules (async FIFO)
// =========================================================================
// afifo #(.DATA_WIDTH(102), .ADDR_WIDTH(4)) u_afifo_0 (
//     .wr_clk     (fifo_wr_clk_0),
//     .wr_rst_n   (fifo_wr_clk_rst_n_0),
//     .wr_en      (afifo_wr_en_0),
//     .wr_data    (afifo_wr_data_0),
//     .full       (afifo_full_0),
//     .rd_clk     (aggr_clk),
//     .rd_rst_n   (aggr_clk_rst_n),
//     .rd_en      (afifo_rd_en_0),
//     .rd_data    (afifo_rd_data_0),
//     .empty      (afifo_empty_0)
// );
// ... similar for afifo_1, afifo_2, afifo_3

// =========================================================================
// Submodule: pipe_mask_ctrl
// =========================================================================
pipe_mask_ctrl u_pipe_mask_ctrl(
    // Clock and Reset
    .clk                                (aggr_clk),
    .rst_n                              (aggr_clk_rst_n),
    
    // Configuration Registers
    .pipe_concat_en                     (pipe_concat_en),
    .Force_Video_Mask                   (Force_Video_Mask),
    .Auto_Mask_En                       (Auto_Mask_En),
    .Video_Mask_Restart_En              (Video_Mask_Restart_En),
    .pipe_frame_active                  (pipe_frame_active),
    .frame_sync_lock                    (frame_sync_lock),
    .aggre_mode                         (aggre_mode),
    .video_mask_latch_reset             (video_mask_latch_reset),
    
    // FIFO Interface (connected to AFIFO read side)
    .data_vld_0                         (~afifo_empty_0),
    .data_vld_1                         (~afifo_empty_1),
    .data_vld_2                         (~afifo_empty_2),
    .data_vld_3                         (~afifo_empty_3),
    .data_0                             (afifo_rd_data_0),
    .data_1                             (afifo_rd_data_1),
    .data_2                             (afifo_rd_data_2),
    .data_3                             (afifo_rd_data_3),
    .reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold),
    
    // Schedule Concat Interface
    .start_sch_pulse                    (start_sch_pulse),
    .end_sch_pulse                      (end_sch_pulse),
    
    // Video Pipe Control
    .pipe_clear_pulse                   (pipe_clear_bit_map),
    .pipe_wr_mode                       ({pipe_wr_mode_3, pipe_wr_mode_2, pipe_wr_mode_1, pipe_wr_mode_0}),
    
    // Bitmap Outputs
    .pipe_mask_bitmap                   (start_sch_pipe_mask_bitmap),
    .pipe_normal_bitmap                 (),  // Not used
    .pipe_restart_bitmap                (),  // Not used
    
    // BPG Configuration Outputs
    .local_framecount_out               (local_framecount_out),
    .local_linecount_out                (local_linecount_out),
    .local_pkt_datatype_out             (local_pkt_datatype_out),
    
    // us Counter (1MHz clock domain)
    .clk_1M                             (clk_1M),
    .clk_1M_rst_n                       (aggr_clk_rst_n),
    .local_us_cnt                       (local_us_cnt)  // Output to video_status_buffer_wr_ctrl instances
);

endmodule
