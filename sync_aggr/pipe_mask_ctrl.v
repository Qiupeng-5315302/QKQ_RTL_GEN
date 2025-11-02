// =============================================================================
// Module       : pipe_mask_ctrl.v
// Description  : Video pipeline mask control state machine
//                Eight-state FSM with complete functionality
//                Supports Force/Auto/Restart mask modes
// Date         : 2025-10-30
// =============================================================================

module pipe_mask_ctrl (
    // Clock and Reset
    input  wire        clk,
    input  wire        rst_n,
    
    // Configuration Registers
    input  wire [3:0]  pipe_concat_en,
    input  wire [3:0]  Force_Video_Mask,
    input  wire [3:0]  Auto_Mask_En,
    input  wire [3:0]  Video_Mask_Restart_En,
    input  wire [3:0]  pipe_frame_active,
    input  wire        frame_sync_lock,
    input  wire [1:0]  aggre_mode,
    input  wire        video_mask_latch_reset,
    
    // FIFO Interface (for sub-modules)
    input  wire [3:0]  data_vld,
    input  wire [101:0] data_0,
    input  wire [101:0] data_1,
    input  wire [101:0] data_2,
    input  wire [101:0] data_3,
    input  wire [79:0] local_timestamp,
    input  wire [19:0] reg_sync_aggr_video_timeout_threshold,
    
    // Schedule Concat Interface
    output reg         start_sch_pulse,
    input  wire        end_sch_pulse,
    
    // Video Pipe Control
    output reg  [3:0]  pipe_clear_pulse,
    output reg  [7:0]  pipe_wr_mode,
    
    // Bitmap Outputs
    output reg  [3:0]  pipe_mask_bitmap,
    output wire [3:0]  pipe_normal_bitmap,
    output wire [3:0]  pipe_restart_bitmap
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
    wire [3:0] video_status_pass_bitmap;
    wire [3:0] video_status_fail_bitmap;
    
    // Derived signals
    assign pipe_normal_bitmap  = ~pipe_mask_bitmap & pipe_concat_en;
    assign pipe_restart_bitmap = pipe_mask_bitmap & Video_Mask_Restart_En & pipe_frame_active;
    
    // Control pulse generation
    assign start_timestamp_align = (current_state == IDLE) && 
                                         (next_state == DURING_TIMESTAMP_ALIGN_DETERMING);
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
                else if (|((pipe_normal_bitmap | pipe_restart_bitmap) & data_vld)) begin
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
            local_force_video_mask <= Force_Video_Mask;
            local_auto_mask_en     <= Auto_Mask_En;
        end
    end
    
    // pipe_mask_bitmap management
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pipe_mask_bitmap <= 4'b1111;
        end
        else begin
            case (current_state)
                INIT: begin
                    if (next_state == IDLE) begin
                        pipe_mask_bitmap <= pipe_concat_en & local_force_video_mask;
                    end
                end
                
                MASK_BITMAP_SUB_RECOVER: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap & ~(pipe_restart_bitmap & video_status_pass_bitmap);
                end
                
                MASK_BITMAP_ADD_TIME_OUT: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap | (pipe_normal_bitmap & video_status_fail_bitmap);
                end
            endcase
        end
    end
    
    // pipe_clear_pulse generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pipe_clear_pulse <= 4'b0;
        end
        else if (current_state != CLEAR_MASK_PIPE && next_state == CLEAR_MASK_PIPE) begin
            pipe_clear_pulse <= pipe_mask_bitmap;
        end
        else begin
            pipe_clear_pulse <= 4'b0;
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
    
    // pipe_wr_mode generation
    always @(*) begin
        integer i;
        for (i = 0; i < 4; i = i + 1) begin
            if (pipe_mask_bitmap[i] && !Video_Mask_Restart_En[i]) begin
                pipe_wr_mode[2*i+1 : 2*i] = 2'b00;
            end
            else begin
                pipe_wr_mode[2*i+1 : 2*i] = 2'b10;
            end
        end
    end
    
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


    //==========================================================================
    // local packet info maintain
    //==========================================================================
    wire    [ 5:0]  video_status_info_datatype;
    wire    [15:0]  video_status_info_linecount;    
    wire    [15:0]  video_status_info_wordcount;
    wire    [ 2:0]  video_status_info_vc;    
   
    reg     [15:0]  local_linecount;

    reg [1:0] local_datatype_cs;
    reg [1:0] local_datatype_ns;

    localparam  DATATYPE_IDLE       = 2'd0;
    localparam  DATATYPE_FS         = 2'd1;
    localparam  DATATYPE_LONGPKT    = 2'd2;
    localparam  DATATYPE_FE         = 2'd3;


    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            local_linecount <= 16'd0;
        end
        else if(start_sch_pulse && (local_datatype_cs == DATATYPE_LONGPKT)) begin
            local_linecount <= local_linecount + 16'd1;
        end
        else if(start_sch_pulse && (local_datatype_cs == DATATYPE_FS)) begin
            local_linecount <= 16'd0;
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
                if(start_sch_pulse && (local_linecount == video_status_info_linecount))
                    local_datatype_ns = DATATYPE_FE;
                else 
                    local_datatype_ns = DATATYPE_LONGPKT;
            DATATYPE_FE:
                if(start_sch_pulse)
                    local_datatype_ns = DATATYPE_FS;
                else 
                    local_datatype_ns = DATATYPE_FS;
        endcase
    end

    assign check_datatype_fs = (local_datatype_cs == DATATYPE_FS);
    assign check_datatype_fe = (local_datatype_cs == DATATYPE_FE);
    assign check_datatype_shortpkt = check_datatype_fs || check_datatype_fe;
    assign check_datatype_longpkt = (local_datatype_cs == DATATYPE_LONGPKT);
    assign check_pkt_datatype = check_datatype_shortpkt || check_datatype_longpkt;
    assign check_shortpkt_framecount = check_datatype_shortpkt && reg_sync_aggr_check_framecount;
    assign check_longpkt_linecount = check_datatype_longpkt && reg_sync_aggr_check_linecount;
    assign check_pkt_count = check_shortpkt_framecount | check_longpkt_linecount;

    assign local_pkt_datatype = (check_datatype_fs) ? 6'h0 :
                                (check_datatype_fe) ? 6'h1 :
                                (check_datatype_longpkt) ? video_status_info_datatype : 6'h0;

    assign local_pkt_count = (check_datatype_fs) ? local_framecount :
                             (check_datatype_fe) ? local_framecount :
                             (check_datatype_longpkt) ? local_linecount : 16'h0;


    //==========================================================================
    // Sub-Module Instantiation
    //==========================================================================
    
    // Timestamp Alignment Determination Module
    timestamp_align_determination u_timestamp_align_determination (
        .clk                                    (clk),
        .rst_n                                  (rst_n),
        .reg_sync_aggr_video_timeout_threshold  (reg_sync_aggr_video_timeout_threshold),
        .pipe_normal_bitmap                     (pipe_normal_bitmap),
        .pipe_restart_bitmap                    (pipe_restart_bitmap),
        .data_vld_0                             (data_vld[0]),
        .data_vld_1                             (data_vld[1]),
        .data_vld_2                             (data_vld[2]),
        .data_vld_3                             (data_vld[3]),
        .data_0                                 (data_0),
        .data_1                                 (data_1),
        .data_2                                 (data_2),
        .data_3                                 (data_3),
        .local_timestamp                        (local_timestamp),
        .start_timestamp_align                  (start_timestamp_align),
        .timestamp_align_pass                   (timestamp_align_pass),
        .timestamp_align_fail                   (timestamp_align_fail),
        .timestamp_align_pass_bitmap            (timestamp_align_pass_bitmap)
    );
    
    // Video Status Determination Module
    video_status_determination u_video_status_determination (
        .clk                                    (clk),
        .rst_n                                  (rst_n),
        .Auto_Mask_En                           (local_auto_mask_en),
        .pipe_normal_bitmap                     (pipe_normal_bitmap),
        .timestamp_align_pass_bitmap            (timestamp_align_pass_bitmap),
        .data_vld_0                             (data_vld[0]),
        .data_vld_1                             (data_vld[1]),
        .data_vld_2                             (data_vld[2]),
        .data_vld_3                             (data_vld[3]),
        .data_0                                 (data_0),
        .data_1                                 (data_1),
        .data_2                                 (data_2),
        .data_3                                 (data_3),
        .check_video_pkt_datatype               (check_pkt_datatype),
        .check_video_pkt_count                  (check_pkt_count),
        .local_pkt_datatype                     (local_pkt_datatype),
        .local_pkt_count                        (local_pkt_count),
        .start_video_status_determing           (start_video_status_determing),
        .video_status_pass_bitmap               (video_status_pass_bitmap),
        .video_status_fail_bitmap               (video_status_fail_bitmap)
    );

endmodule

