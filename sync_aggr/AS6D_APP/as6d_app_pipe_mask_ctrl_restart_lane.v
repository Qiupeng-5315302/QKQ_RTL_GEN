
module as6d_app_pipe_mask_ctrl_restart_lane(/*AUTOARG*/
   // Outputs
   pipe_wr_mode, pipe_mem_clear, pipe_restart_window,
   // Inputs
   clk, rst_n, clear, pipe_concat_en, video_mask_restart,
   pipe_mask_bitmap, frame_active, update_mask,
   reg_sync_aggr_restart_hold_threshold,
   reg_sync_aggr_clear_release_threshold
   );

    input               clk;
    input               rst_n;
    input               clear;
    input               pipe_concat_en;
    input               video_mask_restart;
    input               pipe_mask_bitmap;
    input               frame_active;
    input               update_mask;
    input      [19:0]   reg_sync_aggr_restart_hold_threshold;
    input      [ 3:0]   reg_sync_aggr_clear_release_threshold;
    output reg [ 1:0]   pipe_wr_mode;
    output reg          pipe_mem_clear;
    output wire         pipe_restart_window;
    
    localparam          PIPE_RESTART_IDLE = 3'd0;
    localparam          PIPE_RESTART_CLEAR_HOLD = 3'd1;
    localparam          PIPE_RESTART_CLEAR_RELEASE = 3'd2;
    localparam          PIPE_RESTART_DECT_FRAME_ACTIVE = 3'd3;
    localparam          PIPE_RESTART_UPDATE_MASK = 3'd4;
    localparam          PIPE_RESTART_OVER = 3'd5;
    reg   [ 2:0]        current_state;
    reg   [ 2:0]        next_state;
    reg   [19:0]        restart_hold_cnt;
    wire                restart_hold_cnt_reach;
    reg   [ 3:0]        clear_release_cnt;

    assign restart_hold_cnt_reach = (current_state == PIPE_RESTART_CLEAR_HOLD) && (video_mask_restart & pipe_mask_bitmap & pipe_concat_en) && (restart_hold_cnt == reg_sync_aggr_restart_hold_threshold);
    assign clear_release_cnt_reach = (current_state == PIPE_RESTART_CLEAR_RELEASE) && (clear_release_cnt == reg_sync_aggr_clear_release_threshold);
    assign pipe_restart_window = (restart_hold_cnt == reg_sync_aggr_restart_hold_threshold);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= PIPE_RESTART_IDLE;
        end
        else if (clear)
            current_state <= PIPE_RESTART_IDLE;
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case(current_state)
            PIPE_RESTART_IDLE:begin
                if (video_mask_restart & pipe_mask_bitmap & pipe_concat_en)
                    next_state = PIPE_RESTART_CLEAR_HOLD;
                else
                    next_state = PIPE_RESTART_IDLE;
            end
            PIPE_RESTART_CLEAR_HOLD:begin
                if (restart_hold_cnt_reach)
                    next_state = PIPE_RESTART_CLEAR_RELEASE;
                else if(!(video_mask_restart & pipe_mask_bitmap & pipe_concat_en))
                    next_state = PIPE_RESTART_IDLE;
                else
                    next_state = PIPE_RESTART_CLEAR_HOLD;
            end
            PIPE_RESTART_CLEAR_RELEASE:begin
                if (clear_release_cnt_reach)
                    next_state = PIPE_RESTART_DECT_FRAME_ACTIVE;
                else
                    next_state = PIPE_RESTART_CLEAR_RELEASE;
            end
            PIPE_RESTART_DECT_FRAME_ACTIVE:begin
                if (frame_active)
                    next_state = PIPE_RESTART_UPDATE_MASK;
                else
                    next_state = PIPE_RESTART_DECT_FRAME_ACTIVE;
            end
            PIPE_RESTART_UPDATE_MASK:begin
                if (update_mask)
                    next_state = PIPE_RESTART_OVER;
                else
                    next_state = PIPE_RESTART_UPDATE_MASK;
            end
            PIPE_RESTART_OVER:begin
                    next_state = PIPE_RESTART_IDLE;
            end
            default:next_state = PIPE_RESTART_IDLE;
        endcase
    end

    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            restart_hold_cnt <= 20'd1;
        else if (clear) 
            restart_hold_cnt <= 20'd1;
        else if((current_state == PIPE_RESTART_CLEAR_HOLD) && (video_mask_restart & pipe_mask_bitmap & pipe_concat_en))
            restart_hold_cnt <= (restart_hold_cnt == reg_sync_aggr_restart_hold_threshold) ? restart_hold_cnt : restart_hold_cnt + 1'd1;
        else if (current_state == PIPE_RESTART_OVER) 
            restart_hold_cnt <= 20'd1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            clear_release_cnt <= 4'd1;
        else if (clear) 
            clear_release_cnt <= 4'd1;
        else if(current_state == PIPE_RESTART_CLEAR_RELEASE)
            clear_release_cnt <= (clear_release_cnt == reg_sync_aggr_clear_release_threshold) ? clear_release_cnt : clear_release_cnt + 1'd1;
        else if(current_state == PIPE_RESTART_OVER)
            clear_release_cnt <= 4'd1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            pipe_mem_clear <= 1'd1;
        else if ((current_state == PIPE_RESTART_CLEAR_HOLD)&&(next_state == PIPE_RESTART_CLEAR_RELEASE))
            pipe_mem_clear <= 1'd0;
        else if(current_state == PIPE_RESTART_OVER)
            pipe_mem_clear <= 1'd1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            pipe_wr_mode <= 2'b00;
        else if ((current_state == PIPE_RESTART_CLEAR_RELEASE)&&(next_state == PIPE_RESTART_DECT_FRAME_ACTIVE))
            pipe_wr_mode <= 2'b10;
        else if(current_state == PIPE_RESTART_OVER)
            pipe_wr_mode <= 2'b00;
    end







endmodule
