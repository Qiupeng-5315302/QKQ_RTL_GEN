
// =============================================================================
// Module       : pipe_mask_ctrl.v
// Description  : Video pipeline mask control state machine
//                Eight-state FSM with complete functionality
//                Supports Force/Auto/Restart mask modes
// Date         : 2025-10-30
// =============================================================================

module as6d_app_pipe_mask_ctrl (
    // Clock and Reset
    input  wire        clk,
    input  wire        rst_n,
    
    // Configuration Registers
    input  wire [3:0]  pipe_concat_en,
    input  wire [3:0]  force_video_mask,
    input  wire [3:0]  auto_mask_en,
    input  wire [3:0]  video_mask_restart,
    input  wire [3:0]  pipe_frame_active,
    input  wire        frame_sync_lock,
    input  wire [1:0]  aggre_mode,
    input  wire        video_mask_latch_reset,

    input  wire [ 5:0] reg_sync_aggr_video_status_info_datatype,
    input  wire [15:0] reg_sync_aggr_video_status_info_linecount,    
    input  wire [15:0] reg_sync_aggr_video_status_info_wordcount,
    input  wire [ 4:0] reg_sync_aggr_video_status_info_vc,
    
    // FIFO Interface (for sub-modules)
    input  wire         data_vld_0,
    input  wire         data_vld_1,
    input  wire         data_vld_2,
    input  wire         data_vld_3,
    input  wire [101:0] data_0,
    input  wire [101:0] data_1,
    input  wire [101:0] data_2,
    input  wire [101:0] data_3,
    input  wire [ 19:0] reg_sync_aggr_video_timeout_threshold,
    input  wire         reg_sync_aggr_check_framecount_en,
    input  wire         reg_sync_aggr_check_linecount_en,
    
    // Schedule Concat Interface
    output reg         start_sch_pulse,
    input  wire        end_sch_pulse,
    
    // Video Pipe Control
    output reg  [7:0]  pipe_wr_mode,
    output wire        pipe0_mem_clear,
    output wire        pipe1_mem_clear,
    output wire        pipe2_mem_clear,
    output wire        pipe3_mem_clear,
    
    // Bitmap Outputs
    output reg  [3:0]  pipe_mask_bitmap,
    output wire [3:0]  pipe_normal_bitmap,
    output wire [3:0]  pipe_restart_bitmap,
    output wire [3:0]  video_status_pass_bitmap,

    //clk_1M
    input  wire        clk_1M,
    input  wire        clk_1M_rst_n,
    output reg  [79:0] local_us_cnt,
    
    // Local Packet Info Outputs (for BPG)
    output wire [15:0] local_framecount_out,
    output wire [15:0] local_linecount_out,
    output wire [ 5:0] local_pkt_datatype_out,

    output wire        video_status_buffer_rd_en_0,
    output wire        video_status_buffer_rd_en_1,
    output wire        video_status_buffer_rd_en_2,
    output wire        video_status_buffer_rd_en_3
);

    //==========================================================================
    // State Encoding
    //==========================================================================
    localparam [2:0] INIT                             = 3'd0;
    localparam [2:0] IDLE                             = 3'd1;
    localparam [2:0] DURING_TIMESTAMP_ALIGN_DETERMING = 3'd2;
    localparam [2:0] DURING_VIDEO_STATUS_DETERMING    = 3'd3;
    localparam [2:0] MASK_BITMAP_SUB_RECOVER          = 3'd4;
    localparam [2:0] MASK_BITMAP_ADD_TIME_OUT         = 3'd5;
    localparam [2:0] CLEAR_MASK_PIPE                  = 3'd6;
    localparam [2:0] DURING_SCHEDULING_PIPE           = 3'd7;
    
    //==========================================================================
    // Internal Registers and Wires
    //==========================================================================
    reg [2:0]  current_state;
    reg [2:0]  next_state;
    reg [3:0]  delay_cnt;
    
    // Latched configuration (set in INIT, fixed in IDLE)
    reg [3:0]  local_force_video_mask;
    reg [3:0]  local_auto_mask_en;
    
    // Debug fault flag (internal only)
    reg        fault_clear_mask_pipe_error;
    
    // Signals from/to timestamp_align_determination sub-module
    wire       start_timestamp_align;
    wire       timestamp_align_pass;
    wire       timestamp_align_fail;
    wire [3:0] timestamp_align_pass_bitmap;
    
    // Signals from/to video_status_determination sub-module
    wire       start_video_status_determing;

    wire [3:0] video_status_fail_bitmap;
    
    reg  [3:0] pipe_mem_clear;
    wire       update_mask;
    // Derived signals
    assign pipe_normal_bitmap  = ~pipe_mask_bitmap & pipe_concat_en;
    assign pipe_restart_bitmap = pipe_mask_bitmap & video_mask_restart & pipe_frame_active;
    
    // Control pulse generation
    assign start_timestamp_align = (current_state == IDLE) && 
                                  (|((pipe_normal_bitmap | pipe_restart_bitmap) & {data_vld_3,data_vld_2,data_vld_1,data_vld_0}));

    assign start_video_status_determing = (current_state == DURING_TIMESTAMP_ALIGN_DETERMING) && 
                                          (next_state == DURING_VIDEO_STATUS_DETERMING);
    
    //==========================================================================
    // Stage 1: Next State Logic (Combinational)
    //==========================================================================
    always @(*) begin
        next_state = current_state;
        
        case (current_state)
            INIT: begin
                if (aggre_mode == 2'b01 && frame_sync_lock) begin
                    next_state = IDLE;
                end
            end
            
            IDLE: begin
                if (video_mask_latch_reset) begin
                    next_state = INIT;
                end
                else if (start_timestamp_align) begin
                    next_state = DURING_TIMESTAMP_ALIGN_DETERMING;
                end
            end
            
            DURING_TIMESTAMP_ALIGN_DETERMING: begin
                if (delay_cnt == 4'd3) begin
                    if (timestamp_align_fail) begin
                        next_state = IDLE;
                    end
                    else if (timestamp_align_pass) begin
                        next_state = DURING_VIDEO_STATUS_DETERMING;
                    end
                end
            end
            
            DURING_VIDEO_STATUS_DETERMING: begin
                if (delay_cnt == 4'd3) begin
                    next_state = MASK_BITMAP_SUB_RECOVER;
                end
            end
            
            MASK_BITMAP_SUB_RECOVER: begin
                next_state = MASK_BITMAP_ADD_TIME_OUT;
            end
            
            MASK_BITMAP_ADD_TIME_OUT: begin
                next_state = CLEAR_MASK_PIPE;
            end
            
            CLEAR_MASK_PIPE: begin
                if (&pipe_mask_bitmap) begin
                    next_state = INIT;
                end
                else if (|video_status_pass_bitmap) begin
                    next_state = DURING_SCHEDULING_PIPE;
                end
                else begin
                    next_state = IDLE;
                end
            end
            
            DURING_SCHEDULING_PIPE: begin
                if (end_sch_pulse) begin
                    next_state = IDLE;
                end
            end
            
            default: begin
                next_state = INIT;
            end
        endcase
    end
    
    //==========================================================================
    // Stage 2: State Register (Sequential)
    //==========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= INIT;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    // Delay Counter (Sequential)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            delay_cnt <= 4'd0;
        end
        else begin
            // delay_cnt only resets when entering specific states that need counting
            if (next_state == DURING_TIMESTAMP_ALIGN_DETERMING && current_state == IDLE) begin
                delay_cnt <= 4'd1;
            end
            else if (next_state == DURING_VIDEO_STATUS_DETERMING && current_state == DURING_TIMESTAMP_ALIGN_DETERMING) begin
                delay_cnt <= 4'd1;
            end
            else if (current_state == DURING_TIMESTAMP_ALIGN_DETERMING && delay_cnt < 4'd3) begin
                delay_cnt <= delay_cnt + 1'b1;
            end
            else if (current_state == DURING_VIDEO_STATUS_DETERMING && delay_cnt < 4'd3) begin
                delay_cnt <= delay_cnt + 1'b1;
            end
        end
    end
    
    //==========================================================================
    // Stage 3: Output Logic
    //==========================================================================
    
    // Configuration latching
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            local_force_video_mask <= 4'b0;
            local_auto_mask_en     <= 4'b0;
        end
        else if (current_state == INIT) begin
            local_force_video_mask <= force_video_mask;
            local_auto_mask_en     <= auto_mask_en;
        end
    end
    
    // pipe_mask_bitmap management
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pipe_mask_bitmap <= 4'b1111;
        end
        else begin
            case (next_state)
                INIT: begin
                    pipe_mask_bitmap <= pipe_concat_en & local_force_video_mask;
                end
                
                MASK_BITMAP_SUB_RECOVER: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap & ~(pipe_restart_bitmap & video_status_pass_bitmap);
                end
                
                MASK_BITMAP_ADD_TIME_OUT: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap | (pipe_normal_bitmap & video_status_fail_bitmap);
                end
                default: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap;
                end
            endcase
        end
    end
    
    // start_sch_pulse generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            start_sch_pulse <= 1'b0;
        end
        else if (current_state != DURING_SCHEDULING_PIPE && next_state == DURING_SCHEDULING_PIPE) begin
            start_sch_pulse <= 1'b1;
        end
        else begin
            start_sch_pulse <= 1'b0;
        end
    end
    
    wire    [3:0]   pipe_mem_clear_restart;
    wire    [3:0]   pipe_restart_window;
    wire    [7:0]   pipe_wr_mode_restart;
    // pipe_wr_mode generation
    always @(*) begin
        integer i;
        for (i = 0; i < 4; i = i + 1) begin:pipe_wr_mode_bk
            if (pipe_restart_window[i]) begin
                pipe_wr_mode[(2*i) +: 2] = pipe_wr_mode_restart[(2*i) +: 2];
            end
            else begin
                pipe_wr_mode[(2*i) +: 2] = pipe_mask_bitmap[i] ? 2'b00 : 2'b10 ;
            end
        end
    end
    // pipe_mem_clear generation
    always @(*) begin
        integer i;
        for (i = 0; i < 4; i = i + 1) begin:pipe_wr_mode_bk
            if (pipe_restart_window[i]) begin
                pipe_mem_clear[i] = pipe_mem_clear_restart[i];
            end
            else begin
                pipe_mem_clear[i] = pipe_mask_bitmap[i] ? 1'b1 : 2'b0 ;
            end
        end
    end
    
    assign  pipe0_mem_clear = pipe_mem_clear[0];
    assign  pipe1_mem_clear = pipe_mem_clear[1];
    assign  pipe2_mem_clear = pipe_mem_clear[2];
    assign  pipe3_mem_clear = pipe_mem_clear[3];

    assign  update_mask = (next_state == CLEAR_MASK_PIPE);

    // Fault detection for debug
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fault_clear_mask_pipe_error <= 1'b0;
        end
        else if (current_state == CLEAR_MASK_PIPE) begin
            if (!(&pipe_mask_bitmap) && !(|video_status_pass_bitmap)) begin
                fault_clear_mask_pipe_error <= 1'b1;
            end
        end
        else if (current_state == INIT) begin
            fault_clear_mask_pipe_error <= 1'b0;
        end
    end
    
    //==========================================================================
    // local us_cnt
    //==========================================================================

    wire    [79:0]  local_timestamp;
    reg             clk_1M_edge;
    wire            clk_1M_edge_sync;
    reg             clk_1M_edge_sync_d1;
    wire            clk_1M_edge_sync_pulse;

    always @(posedge clk_1M or negedge clk_1M_rst_n)begin
        if(!clk_1M_rst_n)
            clk_1M_edge <= 1'd0;
        else
            clk_1M_edge <= ~clk_1M_edge;
    end

    sync2_cell_rstb u_sync2_cell_rstb_clk_1M_edge(   
        .clk(clk),
        .reset_n(rst_n),
        .data(clk_1M_edge),
        .qout(clk_1M_edge_sync)
    ); //1us

    always@(posedge clk or negedge rst_n)begin
        if (!rst_n)
            clk_1M_edge_sync_d1 <= 1'd0;
        else
            clk_1M_edge_sync_d1 <= clk_1M_edge_sync;
    end

    assign    clk_1M_edge_sync_pulse = clk_1M_edge_sync_d1 ^ clk_1M_edge_sync;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            local_us_cnt <= 80'd0;
        else if (clk_1M_edge_sync_pulse)
            local_us_cnt <= local_us_cnt + 1'd1;
    end

    assign local_timestamp = local_us_cnt;

    //==========================================================================
    // clear signal gen
    //==========================================================================

    assign clear = (current_state == INIT);

    //==========================================================================
    // local packet info maintain
    //==========================================================================
  
    reg     [15:0]  local_linecount;
    reg     [15:0]  local_framecount;
    reg     [ 1:0]  local_datatype_cs;
    reg     [ 1:0]  local_datatype_ns;

    localparam  DATATYPE_IDLE       = 2'd0;
    localparam  DATATYPE_FS         = 2'd1;
    localparam  DATATYPE_LONGPKT    = 2'd2;
    localparam  DATATYPE_FE         = 2'd3;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            local_linecount <= 16'd1;
        end
        else if(start_sch_pulse && (local_datatype_cs == DATATYPE_LONGPKT)) begin
            local_linecount <= local_linecount + 16'd1;
        end
        else if(start_sch_pulse && (local_datatype_cs == DATATYPE_FS)) begin
            local_linecount <= 16'd1;
        end
    end

    // Local framecount management: increment on FE
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            local_framecount <= 16'd0;
        end
        else if (current_state == INIT) begin
            // Reset to first received frame number or 0
            local_framecount <= 16'd0;
        end
        else if(start_sch_pulse && (local_datatype_cs == DATATYPE_FE)) begin
            local_framecount <= local_framecount + 16'd1;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            local_datatype_cs <= DATATYPE_IDLE;
        end
        else if (clear) begin
            local_datatype_cs <= DATATYPE_IDLE;
        end
        
        else begin
            local_datatype_cs <= local_datatype_ns;
        end
    end

    always @(*) begin
        case(local_datatype_cs)
            DATATYPE_IDLE:
                if(~clear)
                    local_datatype_ns = DATATYPE_FS;
                else 
                    local_datatype_ns = DATATYPE_IDLE;
            DATATYPE_FS:
                if(start_sch_pulse)
                    local_datatype_ns = DATATYPE_LONGPKT;
                else
                    local_datatype_ns = DATATYPE_FS;
            DATATYPE_LONGPKT:
                if(start_sch_pulse && (local_linecount == reg_sync_aggr_video_status_info_linecount))
                    local_datatype_ns = DATATYPE_FE;
                else 
                    local_datatype_ns = DATATYPE_LONGPKT;
            DATATYPE_FE:
                if(start_sch_pulse)
                    local_datatype_ns = DATATYPE_FS;
                else 
                    local_datatype_ns = DATATYPE_FE;
        endcase
    end
    wire [5:0] local_pkt_datatype;
    wire [15:0] local_pkt_count;
    assign check_datatype_fs = (local_datatype_cs == DATATYPE_FS);
    assign check_datatype_fe = (local_datatype_cs == DATATYPE_FE);
    assign check_datatype_shortpkt = check_datatype_fs || check_datatype_fe;
    assign check_datatype_longpkt = (local_datatype_cs == DATATYPE_LONGPKT);
    assign check_pkt_datatype = check_datatype_shortpkt || check_datatype_longpkt;
    assign check_shortpkt_framecount = check_datatype_shortpkt && reg_sync_aggr_check_framecount_en;
    assign check_longpkt_linecount = check_datatype_longpkt && reg_sync_aggr_check_linecount_en;
    assign check_pkt_count = check_shortpkt_framecount | check_longpkt_linecount;

    assign local_pkt_datatype = (check_datatype_fs) ? 6'h0 :
                                (check_datatype_fe) ? 6'h1 :
                                (check_datatype_longpkt) ? reg_sync_aggr_video_status_info_datatype : 6'h0;

    assign local_pkt_count = (check_datatype_fs) ? local_framecount :
                             (check_datatype_fe) ? local_framecount :
                             (check_datatype_longpkt) ? local_linecount : 16'h0;

    // Outputs for BPG module
    assign local_framecount_out  = local_framecount;
    assign local_linecount_out   = local_linecount;
    assign local_pkt_datatype_out = local_pkt_datatype;

    assign video_status_buffer_rd_en_0 = video_status_pass_bitmap[0] && ((current_state == CLEAR_MASK_PIPE) && (next_state == DURING_SCHEDULING_PIPE));
    assign video_status_buffer_rd_en_1 = video_status_pass_bitmap[1] && ((current_state == CLEAR_MASK_PIPE) && (next_state == DURING_SCHEDULING_PIPE));
    assign video_status_buffer_rd_en_2 = video_status_pass_bitmap[2] && ((current_state == CLEAR_MASK_PIPE) && (next_state == DURING_SCHEDULING_PIPE));
    assign video_status_buffer_rd_en_3 = video_status_pass_bitmap[3] && ((current_state == CLEAR_MASK_PIPE) && (next_state == DURING_SCHEDULING_PIPE));
    //==========================================================================
    // Sub-Module Instantiation
    //==========================================================================
    
    // Timestamp Alignment Determination Module
    /*  as6d_app_timestamp_align_determination  AUTO_TEMPLATE (
    )*/
    as6d_app_timestamp_align_determination u_as6d_app_timestamp_align_determination (/*AUTOINST*/
										     // Outputs
										     .timestamp_align_pass(timestamp_align_pass),
										     .timestamp_align_fail(timestamp_align_fail),
										     .timestamp_align_pass_bitmap(timestamp_align_pass_bitmap[3:0]),
										     // Inputs
										     .clk		(clk),
										     .rst_n		(rst_n),
										     .reg_sync_aggr_video_timeout_threshold(reg_sync_aggr_video_timeout_threshold[19:0]),
										     .pipe_normal_bitmap(pipe_normal_bitmap[3:0]),
										     .pipe_restart_bitmap(pipe_restart_bitmap[3:0]),
										     .data_vld_0	(data_vld_0),
										     .data_0		(data_0[101:0]),
										     .data_vld_1	(data_vld_1),
										     .data_1		(data_1[101:0]),
										     .data_vld_2	(data_vld_2),
										     .data_2		(data_2[101:0]),
										     .data_vld_3	(data_vld_3),
										     .data_3		(data_3[101:0]),
										     .local_timestamp	(local_timestamp[79:0]),
										     .start_timestamp_align(start_timestamp_align));
    
    // Video Status Determination Module
    /*as6d_app_video_status_determination  AUTO_TEMPLATE (
        .auto_mask_en(local_auto_mask_en),
        .check_video_pkt_datatype(check_pkt_datatype),
		.check_video_pkt_count(check_pkt_count),
    )*/
    as6d_app_video_status_determination u_as6d_app_video_status_determination (/*AUTOINST*/
									       // Outputs
									       .video_status_pass_bitmap(video_status_pass_bitmap[3:0]),
									       .video_status_fail_bitmap(video_status_fail_bitmap[3:0]),
									       // Inputs
									       .clk		(clk),
									       .rst_n		(rst_n),
									       .auto_mask_en	(local_auto_mask_en), // Templated
									       .pipe_normal_bitmap(pipe_normal_bitmap[3:0]),
									       .timestamp_align_pass_bitmap(timestamp_align_pass_bitmap[3:0]),
									       .data_vld_0	(data_vld_0),
									       .data_0		(data_0[101:0]),
									       .data_vld_1	(data_vld_1),
									       .data_1		(data_1[101:0]),
									       .data_vld_2	(data_vld_2),
									       .data_2		(data_2[101:0]),
									       .data_vld_3	(data_vld_3),
									       .data_3		(data_3[101:0]),
									       .check_video_pkt_datatype(check_pkt_datatype), // Templated
									       .check_video_pkt_count(check_pkt_count), // Templated
									       .local_pkt_datatype(local_pkt_datatype[5:0]),
									       .local_pkt_count	(local_pkt_count[15:0]),
									       .start_video_status_determing(start_video_status_determing));

    // pipe_mask_ctrl_restart Module
    /*as6d_app_pipe_mask_ctrl_restart  AUTO_TEMPLATE (
        .clear(1'd0),
        .frame_active(pipe_frame_active[]),
        .reg_sync_aggr_clear_release_threshold(4'd15),
        .reg_sync_aggr_restart_hold_threshold(20'd1000),
        .pipe_wr_mode(pipe_wr_mode_restart[]),
        .pipe_mem_clear(pipe_mem_clear_restart[]),
    );*/
    as6d_app_pipe_mask_ctrl_restart u_as6d_app_pipe_mask_ctrl_restart(/*AUTOINST*/
								      // Outputs
								      .pipe_mem_clear	(pipe_mem_clear_restart[3:0]), // Templated
								      .pipe_restart_window(pipe_restart_window[3:0]),
								      .pipe_wr_mode	(pipe_wr_mode_restart[7:0]), // Templated
								      // Inputs
								      .clear		(1'd0),		 // Templated
								      .clk		(clk),
								      .frame_active	(pipe_frame_active[3:0]), // Templated
								      .pipe_concat_en	(pipe_concat_en[3:0]),
								      .pipe_mask_bitmap	(pipe_mask_bitmap[3:0]),
								      .reg_sync_aggr_clear_release_threshold(4'd15), // Templated
								      .reg_sync_aggr_restart_hold_threshold(20'd1000), // Templated
								      .rst_n		(rst_n),
								      .update_mask	(update_mask),
								      .video_mask_restart(video_mask_restart[3:0]));

endmodule

