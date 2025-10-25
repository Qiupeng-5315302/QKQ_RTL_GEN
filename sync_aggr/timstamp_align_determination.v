// =============================================================================
// Module: timstamp_align_determination
// Description: 时戳对齐判定模块
//              通过比较4个FWFT FIFO的空满状态和本地时戳，判断当前normal_pipe_bitmap
//              中哪些pipe可以不再等待。采用3拍流水线处理。
// 
// Author: AI Generated based on pipe_mask_ctrl_design.md
// Date: 2025-10-25
// =============================================================================

module timstamp_align_determination (
    // Clock and Reset
    input  wire         clk,
    input  wire         rst_n,
    
    // Configuration
    input  wire [19:0]  reg_sync_aggr_video_timeout_threshold,
    input  wire [3:0]   pipe_normal_bitmap,
    
    // FIFO Interface - Pipe 0
    input  wire         data_vld_0,
    input  wire [101:0] data_0,
    
    // FIFO Interface - Pipe 1
    input  wire         data_vld_1,
    input  wire [101:0] data_1,
    
    // FIFO Interface - Pipe 2
    input  wire         data_vld_2,
    input  wire [101:0] data_2,
    
    // FIFO Interface - Pipe 3
    input  wire         data_vld_3,
    input  wire [101:0] data_3,
    
    // Local Timestamp
    input  wire [79:0]  local_timestamp,
    
    // Control
    input  wire         start_timestamp_align_determing,
    
    // Output
    output reg          timestamp_align_pass,
    output reg          timestamp_align_fail,
    output reg  [3:0]   timestamp_align_pass_bitmap
);

// =============================================================================
// Internal Signals
// =============================================================================

// Data valid vector
wire [3:0] data_vld;
assign data_vld = {data_vld_3, data_vld_2, data_vld_1, data_vld_0};

// Extract timestamps from FIFO data
wire [79:0] pkt_timestamp_0;
wire [79:0] pkt_timestamp_1;
wire [79:0] pkt_timestamp_2;
wire [79:0] pkt_timestamp_3;

assign pkt_timestamp_0 = data_0[79:0];
assign pkt_timestamp_1 = data_1[79:0];
assign pkt_timestamp_2 = data_2[79:0];
assign pkt_timestamp_3 = data_3[79:0];

// Pipeline Stage 1 registers
reg         stage1_valid;
reg [3:0]   stage1_normal_bitmap;
reg [3:0]   stage1_data_vld;
reg         stage1_all_data_ready;
reg [79:0]  stage1_result0;  // min(timestamp_0, timestamp_1)
reg [79:0]  stage1_result1;  // min(timestamp_2, timestamp_3)
reg [79:0]  stage1_local_timestamp;

// Pipeline Stage 2 registers
reg         stage2_valid;
reg [3:0]   stage2_normal_bitmap;
reg [3:0]   stage2_data_vld;
reg         stage2_all_data_ready;
reg [79:0]  stage2_oldest_timestamp;
reg [79:0]  stage2_local_timestamp;

// Pipeline Stage 3 registers
reg         stage3_valid;
reg [3:0]   stage3_normal_bitmap;
reg [3:0]   stage3_data_vld;
reg         stage3_all_data_ready;
reg [79:0]  stage3_time_offset;
reg         stage3_timeout;

// =============================================================================
// Pipeline Stage 1: First Level Comparison
// =============================================================================

// Stage 1: Valid signal
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_valid <= 1'b0;
    end else begin
        stage1_valid <= start_timestamp_align_determing;
    end
end

// Stage 1: Control signals sampling
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_normal_bitmap   <= 4'b0000;
        stage1_data_vld        <= 4'b0000;
        stage1_local_timestamp <= 80'h0;
    end else if (start_timestamp_align_determing) begin
        stage1_normal_bitmap   <= pipe_normal_bitmap;
        stage1_data_vld        <= data_vld;
        stage1_local_timestamp <= local_timestamp;
    end
end

// Stage 1: All data ready check
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_all_data_ready <= 1'b0;
    end else if (start_timestamp_align_determing) begin
        stage1_all_data_ready <= ((pipe_normal_bitmap & data_vld) == pipe_normal_bitmap);
    end
end

// Stage 1: First level comparison result0 (pipe0 vs pipe1)
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_result0 <= 80'h0;
    end else if (start_timestamp_align_determing) begin
        if ((pipe_normal_bitmap[0] & data_vld[0]) && (pipe_normal_bitmap[1] & data_vld[1])) begin
            stage1_result0 <= (pkt_timestamp_0 < pkt_timestamp_1) ? pkt_timestamp_0 : pkt_timestamp_1;
        end else if (pipe_normal_bitmap[0] & data_vld[0]) begin
            stage1_result0 <= pkt_timestamp_0;
        end else if (pipe_normal_bitmap[1] & data_vld[1]) begin
            stage1_result0 <= pkt_timestamp_1;
        end else begin
            stage1_result0 <= 80'hFFFFFFFFFFFFFFFFFFFF; // Max value if both empty
        end
    end
end

// Stage 1: First level comparison result1 (pipe2 vs pipe3)
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_result1 <= 80'h0;
    end else if (start_timestamp_align_determing) begin
        if ((pipe_normal_bitmap[2] & data_vld[2]) && (pipe_normal_bitmap[3] & data_vld[3])) begin
            stage1_result1 <= (pkt_timestamp_2 < pkt_timestamp_3) ? pkt_timestamp_2 : pkt_timestamp_3;
        end else if (pipe_normal_bitmap[2] & data_vld[2]) begin
            stage1_result1 <= pkt_timestamp_2;
        end else if (pipe_normal_bitmap[3] & data_vld[3]) begin
            stage1_result1 <= pkt_timestamp_3;
        end else begin
            stage1_result1 <= 80'hFFFFFFFFFFFFFFFFFFFF; // Max value if both empty
        end
    end
end

// =============================================================================
// Pipeline Stage 2: Second Level Comparison
// =============================================================================

// Stage 2: Valid signal
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage2_valid <= 1'b0;
    end else begin
        stage2_valid <= stage1_valid;
    end
end

// Stage 2: Control signals propagation
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage2_normal_bitmap   <= 4'b0000;
        stage2_data_vld        <= 4'b0000;
        stage2_all_data_ready  <= 1'b0;
        stage2_local_timestamp <= 80'h0;
    end else if (stage1_valid) begin
        stage2_normal_bitmap   <= stage1_normal_bitmap;
        stage2_data_vld        <= stage1_data_vld;
        stage2_all_data_ready  <= stage1_all_data_ready;
        stage2_local_timestamp <= stage1_local_timestamp;
    end
end

// Stage 2: Second level comparison (find oldest timestamp)
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage2_oldest_timestamp <= 80'h0;
    end else if (stage1_valid) begin
        stage2_oldest_timestamp <= (stage1_result0 < stage1_result1) ? stage1_result0 : stage1_result1;
    end
end

// =============================================================================
// Pipeline Stage 3: Timeout Determination and Output
// =============================================================================

// Stage 3: Valid signal
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage3_valid <= 1'b0;
    end else begin
        stage3_valid <= stage2_valid;
    end
end

// Stage 3: Control signals propagation
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage3_normal_bitmap  <= 4'b0000;
        stage3_data_vld       <= 4'b0000;
        stage3_all_data_ready <= 1'b0;
    end else if (stage2_valid) begin
        stage3_normal_bitmap  <= stage2_normal_bitmap;
        stage3_data_vld       <= stage2_data_vld;
        stage3_all_data_ready <= stage2_all_data_ready;
    end
end

// Stage 3: Time offset calculation
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage3_time_offset <= 80'h0;
    end else if (stage2_valid) begin
        stage3_time_offset <= stage2_local_timestamp - stage2_oldest_timestamp;
    end
end

// Stage 3: Timeout check
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage3_timeout <= 1'b0;
    end else if (stage2_valid) begin
        stage3_timeout <= (stage2_local_timestamp - stage2_oldest_timestamp) >= {60'b0, reg_sync_aggr_video_timeout_threshold};
    end
end

// =============================================================================
// Output Logic
// =============================================================================

// Output: timestamp_align_pass
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        timestamp_align_pass <= 1'b0;
    end else begin
        if (stage3_valid) begin
            if (stage3_all_data_ready || stage3_timeout) begin
                timestamp_align_pass <= 1'b1;
            end else begin
                timestamp_align_pass <= 1'b0;
            end
        end else begin
            timestamp_align_pass <= 1'b0;
        end
    end
end

// Output: timestamp_align_fail
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        timestamp_align_fail <= 1'b1;  // Default to fail state
    end else begin
        if (stage3_valid) begin
            if (stage3_all_data_ready || stage3_timeout) begin
                timestamp_align_fail <= 1'b0;
            end else begin
                timestamp_align_fail <= 1'b1;
            end
        end else begin
            timestamp_align_fail <= 1'b1;
        end
    end
end

// Output: timestamp_align_pass_bitmap
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        timestamp_align_pass_bitmap <= 4'b0000;
    end else begin
        if (stage3_valid) begin
            // Case 1: All data is ready
            if (stage3_all_data_ready) begin
                timestamp_align_pass_bitmap <= stage3_normal_bitmap;
            end
            // Case 2: Partial data ready and timeout
            else if (stage3_timeout) begin
                timestamp_align_pass_bitmap <= stage3_normal_bitmap & stage3_data_vld;
            end
            // Case 3: Partial data ready but not timeout - continue waiting
            else begin
                timestamp_align_pass_bitmap <= 4'b0000;
            end
        end else begin
            timestamp_align_pass_bitmap <= 4'b0000;
        end
    end
end

endmodule
