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
    output  [3:0]           start_sch_pipe_rdy_bitmap,   // rdy pipe bitmap aligned with start_sch_pulse
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
    // BPG Configuration Inputs
    // =========================================================================
    input   [5:0]           video_status_info_datatype,   // Video status datatype for BPG
    input   [15:0]          video_status_info_linecount,  // Video status line count for BPG
    input   [15:0]          video_status_info_wordcount,  // Video status word count for BPG
    input   [2:0]           video_status_info_vc,         // Video status virtual channel for BPG
    
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

// Video Status Buffer signals between buffer_wr_ctrl and pipe_mask_ctrl
wire                    video_status_buffer_wr_en_0, video_status_buffer_wr_en_1, video_status_buffer_wr_en_2, video_status_buffer_wr_en_3;
wire    [101:0]         video_status_buffer_wr_data_0, video_status_buffer_wr_data_1, video_status_buffer_wr_data_2, video_status_buffer_wr_data_3;
wire                    video_status_buffer_full_0, video_status_buffer_full_1, video_status_buffer_full_2, video_status_buffer_full_3;

wire                    video_status_buffer_rd_en_0, video_status_buffer_rd_en_1, video_status_buffer_rd_en_2, video_status_buffer_rd_en_3;
wire    [101:0]         video_status_buffer_rd_data_0, video_status_buffer_rd_data_1, video_status_buffer_rd_data_2, video_status_buffer_rd_data_3;
wire                    video_status_buffer_empty_0, video_status_buffer_empty_1, video_status_buffer_empty_2, video_status_buffer_empty_3;

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
    .wr_en                  (video_status_buffer_wr_en_0),
    .wr_data                (video_status_buffer_wr_data_0),
    .afifo_full             (video_status_buffer_full_0)
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
    .wr_en                  (video_status_buffer_wr_en_1),
    .wr_data                (video_status_buffer_wr_data_1),
    .afifo_full             (video_status_buffer_full_1)
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
    .wr_en                  (video_status_buffer_wr_en_2),
    .wr_data                (video_status_buffer_wr_data_2),
    .afifo_full             (video_status_buffer_full_2)
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
    .wr_en                  (video_status_buffer_wr_en_3),
    .wr_data                (video_status_buffer_wr_data_3),
    .afifo_full             (video_status_buffer_full_3)
);

// =========================================================================
// Submodule: 4 AFIFO Instances
// =========================================================================
// AFIFO Instance 0
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper u_video_status_buffer_0 (
    // Write Clock Domain
    .wr_clk                     (fifo_wr_clk_0),
    .wr_rst_n                   (fifo_wr_clk_rst_n_0),
    .wr_data                    (video_status_buffer_wr_data_0),
    .wr_en                      (video_status_buffer_wr_en_0),
    .wr_domain_clear            (1'b0),
    
    // Read Clock Domain
    .rd_clk                     (aggr_clk),
    .rd_rst_n                   (aggr_clk_rst_n),
    .rd_data                    (video_status_buffer_rd_data_0),
    .rd_data_val                (video_status_buffer_rd_data_val_0),        // data_vld connected to data_val
    .rd_en                      (video_status_buffer_rd_en_0),       // Read when not empty
    .rd_domain_clear            (1'b0),
    
    // Status Flags
    .empty                      (video_status_buffer_empty_0),
    .full                       (video_status_buffer_full_0),
    .prog_full                  (),                     // Not used
    .data_count                 (),                     // Not used
    
    // Configuration (set to default safe values)
    .ram_bypass                 (1'b0),
    .reg_dft_tpram_config       (9'b0),
    .prog_full_assert_cfg       (5'd14),                // Almost full threshold
    .prog_full_negate_cfg       (5'd12),
    .ecc_addr_protect_en        (1'b0),
    .ecc_bypass                 (1'b1),                 // Bypass ECC
    .ecc_fault_detc_en          (1'b0),
    
    // Status outputs (ignored for now)
    .ecc_fault                  (),
    .single_err                 (),
    .double_err                 (),
    .ovf_int                    (),
    .udf_int                    ()
);

// AFIFO Instance 1
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper u_video_status_buffer_1 (
    // Write Clock Domain
    .wr_clk                     (fifo_wr_clk_1),
    .wr_rst_n                   (fifo_wr_clk_rst_n_1),
    .wr_data                    (video_status_buffer_wr_data_1),
    .wr_en                      (video_status_buffer_wr_en_1),
    .wr_domain_clear            (1'b0),
    
    // Read Clock Domain
    .rd_clk                     (aggr_clk),
    .rd_rst_n                   (aggr_clk_rst_n),
    .rd_data                    (video_status_buffer_rd_data_1),
    .rd_data_val                (video_status_buffer_rd_data_val_1),
    .rd_en                      (video_status_buffer_rd_en_1),
    .rd_domain_clear            (1'b0),
    
    // Status Flags
    .empty                      (video_status_buffer_empty_1),
    .full                       (video_status_buffer_full_1),
    .prog_full                  (),
    .data_count                 (),
    
    // Configuration
    .ram_bypass                 (1'b0),
    .reg_dft_tpram_config       (9'b0),
    .prog_full_assert_cfg       (5'd14),
    .prog_full_negate_cfg       (5'd12),
    .ecc_addr_protect_en        (1'b0),
    .ecc_bypass                 (1'b1),
    .ecc_fault_detc_en          (1'b0),
    
    // Status outputs
    .ecc_fault                  (),
    .single_err                 (),
    .double_err                 (),
    .ovf_int                    (),
    .udf_int                    ()
);

// AFIFO Instance 2
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper u_video_status_buffer_2 (
    // Write Clock Domain
    .wr_clk                     (fifo_wr_clk_2),
    .wr_rst_n                   (fifo_wr_clk_rst_n_2),
    .wr_data                    (video_status_buffer_wr_data_2),
    .wr_en                      (video_status_buffer_wr_en_2),
    .wr_domain_clear            (1'b0),
    
    // Read Clock Domain
    .rd_clk                     (aggr_clk),
    .rd_rst_n                   (aggr_clk_rst_n),
    .rd_data                    (video_status_buffer_rd_data_2),
    .rd_data_val                (video_status_buffer_rd_data_val_2),
    .rd_en                      (video_status_buffer_rd_en_2),
    .rd_domain_clear            (1'b0),
    
    // Status Flags
    .empty                      (video_status_buffer_empty_2),
    .full                       (video_status_buffer_full_2),
    .prog_full                  (),
    .data_count                 (),
    
    // Configuration
    .ram_bypass                 (1'b0),
    .reg_dft_tpram_config       (9'b0),
    .prog_full_assert_cfg       (5'd14),
    .prog_full_negate_cfg       (5'd12),
    .ecc_addr_protect_en        (1'b0),
    .ecc_bypass                 (1'b1),
    .ecc_fault_detc_en          (1'b0),
    
    // Status outputs
    .ecc_fault                  (),
    .single_err                 (),
    .double_err                 (),
    .ovf_int                    (),
    .udf_int                    ()
);

// AFIFO Instance 3
as6d_app_video_status_buffer_1r1w_16x102_fwft_afifo_wrapper u_video_status_buffer_3 (
    // Write Clock Domain
    .wr_clk                     (fifo_wr_clk_3),
    .wr_rst_n                   (fifo_wr_clk_rst_n_3),
    .wr_data                    (video_status_buffer_wr_data_3),
    .wr_en                      (video_status_buffer_wr_en_3),
    .wr_domain_clear            (1'b0),
    
    // Read Clock Domain
    .rd_clk                     (aggr_clk),
    .rd_rst_n                   (aggr_clk_rst_n),
    .rd_data                    (video_status_buffer_rd_data_3),
    .rd_data_val                (video_status_buffer_rd_data_val_3),
    .rd_en                      (video_status_buffer_rd_en_3),
    .rd_domain_clear            (1'b0),
    
    // Status Flags
    .empty                      (video_status_buffer_empty_3),
    .full                       (video_status_buffer_full_3),
    .prog_full                  (),
    .data_count                 (),
    
    // Configuration
    .ram_bypass                 (1'b0),
    .reg_dft_tpram_config       (9'b0),
    .prog_full_assert_cfg       (5'd14),
    .prog_full_negate_cfg       (5'd12),
    .ecc_addr_protect_en        (1'b0),
    .ecc_bypass                 (1'b1),
    .ecc_fault_detc_en          (1'b0),
    
    // Status outputs
    .ecc_fault                  (),
    .single_err                 (),
    .double_err                 (),
    .ovf_int                    (),
    .udf_int                    ()
);

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
    
    // BPG Configuration Inputs
    .video_status_info_datatype         (video_status_info_datatype),
    .video_status_info_linecount        (video_status_info_linecount),
    .video_status_info_wordcount        (video_status_info_wordcount),
    .video_status_info_vc               (video_status_info_vc),
    
    // FIFO Interface (connected to Video Status Buffer read side)
    .data_vld_0                         (video_status_buffer_rd_data_val_0),
    .data_vld_1                         (video_status_buffer_rd_data_val_1),
    .data_vld_2                         (video_status_buffer_rd_data_val_2),
    .data_vld_3                         (video_status_buffer_rd_data_val_3),
    .data_0                             (video_status_buffer_rd_data_0),
    .data_1                             (video_status_buffer_rd_data_1),
    .data_2                             (video_status_buffer_rd_data_2),
    .data_3                             (video_status_buffer_rd_data_3),
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
    .video_status_pass_bitmap           (start_sch_pipe_rdy_bitmap),
    
    // BPG Configuration Outputs
    .local_framecount_out               (local_framecount_out),
    .local_linecount_out                (local_linecount_out),
    .local_pkt_datatype_out             (local_pkt_datatype_out),
    
    // us Counter (1MHz clock domain)
    .clk_1M                             (clk_1M),
    .clk_1M_rst_n                       (aggr_clk_rst_n),
    .local_us_cnt                       (local_us_cnt),  // Output to video_status_buffer_wr_ctrl instances

    .video_status_buffer_rd_en_0        (video_status_buffer_rd_en_0),
    .video_status_buffer_rd_en_1        (video_status_buffer_rd_en_1),
    .video_status_buffer_rd_en_2        (video_status_buffer_rd_en_2),
    .video_status_buffer_rd_en_3        (video_status_buffer_rd_en_3)
);

endmodule
