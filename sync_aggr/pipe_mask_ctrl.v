// =============================================================================
// File Name    : pipe_mask_ctrl.v
// Author       : Auto-generated from pipe_mask_ctrl_design.md
// Description  : Video pipeline mask control state machine
//                Three-stage state machine implementation
//                Maintains pipe_mask_bitmap and generates pipe_normal_bitmap
// License      : MIT License
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
    input  wire        frame_sync_lock,
    input  wire [1:0]  aggre_mode,
    input  wire        video_mask_latch_reset,
    
    // Status Signals from Timestamp Alignment Determination Module
    input  wire        timestamp_align_succeed,
    input  wire        timestamp_align_fail,
    
    // Status Signals from Video Status Determination Module
    input  wire [3:0]  video_status_pass_bitmap,
    input  wire [3:0]  video_status_fail_bitmap,
    
    // SCH Concat Interface
    input  wire        end_sch_pulse,
    output reg         start_sch_pulse,
    
    // Bitmap Outputs
    output reg  [3:0]  pipe_mask_bitmap,
    output wire [3:0]  pipe_normal_bitmap
);

    // State Encoding
    localparam [3:0] INIT                             = 4'd0;
    localparam [3:0] IDLE                             = 4'd1;
    localparam [3:0] DURING_TIMESTAMP_ALIGN_DETERMING = 4'd2;
    localparam [3:0] DURING_VIDEO_STATUS_DETERMING    = 4'd3;
    localparam [3:0] DURING_SCHEDULING_PIPE           = 4'd4;
    localparam [3:0] MASK_BITMAP_ADD_TIME_OUT         = 4'd5;
    localparam [3:0] MASK_BITMAP_ADD_FORCE            = 4'd6;
    localparam [3:0] MASK_BITMAP_SUB                  = 4'd7;

    // Internal Registers
    reg [3:0] current_state;
    reg [3:0] next_state;
    reg [3:0] delay_cnt;
    reg [3:0] video_status_pass_bitmap_latch;
    
    // pipe_normal_bitmap = ~pipe_mask_bitmap & pipe_concat_en
    assign pipe_normal_bitmap = ~pipe_mask_bitmap & pipe_concat_en;

    // Stage 1: State Register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= INIT;
        end else begin
            current_state <= next_state;
        end
    end

    // Stage 2: Next State Logic
    always @(*) begin
        next_state = current_state;
        
        case (current_state)
            INIT: begin
                if (frame_sync_lock && (aggre_mode == 2'b01)) begin
                    next_state = IDLE;
                end
            end
            
            IDLE: begin
                if (video_mask_latch_reset) begin
                    next_state = INIT;
                end else if (|Force_Video_Mask) begin
                    next_state = MASK_BITMAP_ADD_FORCE;
                end else if (|Video_Mask_Restart_En) begin
                    next_state = MASK_BITMAP_SUB;
                end else begin
                    next_state = DURING_TIMESTAMP_ALIGN_DETERMING;
                end
            end
            
            DURING_TIMESTAMP_ALIGN_DETERMING: begin
                if (delay_cnt == 4'd2) begin
                    if (timestamp_align_succeed) begin
                        next_state = DURING_VIDEO_STATUS_DETERMING;
                    end else if (timestamp_align_fail) begin
                        next_state = IDLE;
                    end
                end
            end
            
            DURING_VIDEO_STATUS_DETERMING: begin
                if (delay_cnt == 4'd3) begin
                    if (|video_status_fail_bitmap) begin
                        next_state = MASK_BITMAP_ADD_TIME_OUT;
                    end else begin
                        next_state = DURING_SCHEDULING_PIPE;
                    end
                end
            end
            
            DURING_SCHEDULING_PIPE: begin
                if (end_sch_pulse) begin
                    next_state = IDLE;
                end
            end
            
            MASK_BITMAP_ADD_TIME_OUT: begin
                if (delay_cnt == 4'd10) begin
                    if (|video_status_pass_bitmap_latch) begin
                        next_state = DURING_SCHEDULING_PIPE;
                    end else begin
                        next_state = IDLE;
                    end
                end
            end
            
            MASK_BITMAP_ADD_FORCE: begin
                next_state = IDLE;
            end
            
            MASK_BITMAP_SUB: begin
                next_state = IDLE;
            end
            
            default: begin
                next_state = INIT;
            end
        endcase
    end

    // Stage 3: Output Logic - Delay Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            delay_cnt <= 4'd0;
        end else begin
            case (current_state)
                DURING_TIMESTAMP_ALIGN_DETERMING: begin
                    if (delay_cnt < 4'd2) begin
                        delay_cnt <= delay_cnt + 1'b1;
                    end else begin
                        delay_cnt <= 4'd0;
                    end
                end
                
                DURING_VIDEO_STATUS_DETERMING: begin
                    if (delay_cnt < 4'd3) begin
                        delay_cnt <= delay_cnt + 1'b1;
                    end else begin
                        delay_cnt <= 4'd0;
                    end
                end
                
                MASK_BITMAP_ADD_TIME_OUT: begin
                    if (delay_cnt < 4'd10) begin
                        delay_cnt <= delay_cnt + 1'b1;
                    end else begin
                        delay_cnt <= 4'd0;
                    end
                end
                
                default: begin
                    delay_cnt <= 4'd0;
                end
            endcase
        end
    end

    // Latch video_status_pass_bitmap
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            video_status_pass_bitmap_latch <= 4'd0;
        end else begin
            if (current_state == DURING_TIMESTAMP_ALIGN_DETERMING && 
                delay_cnt == 4'd2 && timestamp_align_succeed) begin
                video_status_pass_bitmap_latch <= video_status_pass_bitmap;
            end
        end
    end

    // pipe_mask_bitmap Control
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pipe_mask_bitmap <= 4'b0000;
        end else begin
            case (current_state)
                INIT: begin
                    if (next_state == IDLE) begin
                        pipe_mask_bitmap <= 4'b0000;
                    end
                end
                
                IDLE: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap;
                end
                
                MASK_BITMAP_ADD_TIME_OUT: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap | (video_status_fail_bitmap & Auto_Mask_En);
                end
                
                MASK_BITMAP_ADD_FORCE: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap | Force_Video_Mask;
                end
                
                MASK_BITMAP_SUB: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap & ~Video_Mask_Restart_En;
                end
                
                default: begin
                    pipe_mask_bitmap <= pipe_mask_bitmap;
                end
            endcase
        end
    end

    // start_sch_pulse Generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            start_sch_pulse <= 1'b0;
        end else begin
            if (current_state != DURING_SCHEDULING_PIPE && next_state == DURING_SCHEDULING_PIPE) begin
                start_sch_pulse <= 1'b1;
            end else begin
                start_sch_pulse <= 1'b0;
            end
        end
    end

endmodule