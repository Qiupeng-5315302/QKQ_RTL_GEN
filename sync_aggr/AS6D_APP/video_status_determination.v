// =============================================================================
// Module: video_status_determination
// Description: 视频状态判定模块
//              通过检查4个FWFT FIFO出口数据的datatype序列和pkt_count正确性，
//              判断timestamp_align_pass_bitmap对应的pipe中哪些视频包格式正确。
//              采用3拍流水线处理。
// Date: 2025-11-02
// =============================================================================

module video_status_determination (
    // Clock and Reset
    input  wire         clk,
    input  wire         rst_n,
    
    // Configuration
    input  wire [3:0]   Auto_Mask_En,
    input  wire [3:0]   pipe_normal_bitmap,
    input  wire [3:0]   timestamp_align_pass_bitmap,
    
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
    
    // Check Enables
    input  wire         check_video_pkt_datatype,
    input  wire         check_video_pkt_count,
    
    // Local Reference
    input  wire [5:0]   local_pkt_datatype,
    input  wire [15:0]  local_pkt_count,
    
    // Control
    input  wire         start_video_status_determing,
    
    // Output
    output reg  [3:0]   video_status_pass_bitmap,
    output reg  [3:0]   video_status_fail_bitmap
);

// =============================================================================
// Internal Signals
// =============================================================================

// Data valid vector
wire [3:0] data_vld;
assign data_vld = {data_vld_3, data_vld_2, data_vld_1, data_vld_0};

// Extract datatype from FIFO data
wire [5:0] pkt_datatype_0;
wire [5:0] pkt_datatype_1;
wire [5:0] pkt_datatype_2;
wire [5:0] pkt_datatype_3;

assign pkt_datatype_0 = data_0[101:96];
assign pkt_datatype_1 = data_1[101:96];
assign pkt_datatype_2 = data_2[101:96];
assign pkt_datatype_3 = data_3[101:96];

// Extract pkt_count from FIFO data
wire [15:0] pkt_count_0;
wire [15:0] pkt_count_1;
wire [15:0] pkt_count_2;
wire [15:0] pkt_count_3;

assign pkt_count_0 = data_0[95:80];
assign pkt_count_1 = data_1[95:80];
assign pkt_count_2 = data_2[95:80];
assign pkt_count_3 = data_3[95:80];

// =============================================================================
// Pipeline Stage 1: Datatype Detection
// =============================================================================

reg         stage1_valid;
reg [3:0]   stage1_check_bitmap;
reg [3:0]   stage1_datatype_match;
reg         stage1_check_count;  // Latch check_video_pkt_count for Stage 2

// Latch data for Stage 2 (only need count field)
reg [15:0]  stage1_pkt_count_0;
reg [15:0]  stage1_pkt_count_1;
reg [15:0]  stage1_pkt_count_2;
reg [15:0]  stage1_pkt_count_3;

// Latch local_pkt_count for Stage 2
reg [15:0]  stage1_local_pkt_count;

// Stage 1 valid signal
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_valid <= 1'b0;
    end
    else if (start_video_status_determing) begin
        stage1_valid <= 1'b1;
    end
    else begin
        stage1_valid <= 1'b0;
    end
end

// Stage 1 datatype comparison
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_check_bitmap   <= 4'b0000;
        stage1_datatype_match <= 4'b0000;
    end
    else if (start_video_status_determing) begin
        stage1_check_bitmap <= timestamp_align_pass_bitmap;
        
        // Datatype comparison for each pipe
        // If check_bitmap[i]==1 and check_video_pkt_datatype==1, compare datatype
        stage1_datatype_match[0] <= (timestamp_align_pass_bitmap[0] && check_video_pkt_datatype) ? 
                                    (pkt_datatype_0 == local_pkt_datatype) : 1'b1;
        stage1_datatype_match[1] <= (timestamp_align_pass_bitmap[1] && check_video_pkt_datatype) ? 
                                    (pkt_datatype_1 == local_pkt_datatype) : 1'b1;
        stage1_datatype_match[2] <= (timestamp_align_pass_bitmap[2] && check_video_pkt_datatype) ? 
                                    (pkt_datatype_2 == local_pkt_datatype) : 1'b1;
        stage1_datatype_match[3] <= (timestamp_align_pass_bitmap[3] && check_video_pkt_datatype) ? 
                                    (pkt_datatype_3 == local_pkt_datatype) : 1'b1;
    end
end

// Stage 1 data latching for Stage 2
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1_check_count     <= 1'b0;
        stage1_pkt_count_0     <= 16'h0;
        stage1_pkt_count_1     <= 16'h0;
        stage1_pkt_count_2     <= 16'h0;
        stage1_pkt_count_3     <= 16'h0;
        stage1_local_pkt_count <= 16'h0;
    end
    else if (start_video_status_determing) begin
        // Latch check_video_pkt_count for Stage 2 (KEY: align with data)
        stage1_check_count <= check_video_pkt_count;
        
        // Latch pkt_count for Stage 2
        stage1_pkt_count_0 <= pkt_count_0;
        stage1_pkt_count_1 <= pkt_count_1;
        stage1_pkt_count_2 <= pkt_count_2;
        stage1_pkt_count_3 <= pkt_count_3;
        
        // Latch local_pkt_count for Stage 2
        stage1_local_pkt_count <= local_pkt_count;
    end
end

// Stage 1 pass bitmap
wire [3:0] stage1_pass_bitmap;
assign stage1_pass_bitmap = stage1_check_bitmap & stage1_datatype_match;

// =============================================================================
// Pipeline Stage 2: Pkt_Count Detection
// =============================================================================

reg         stage2_valid;
reg [3:0]   stage2_pass_bitmap_raw;
reg [3:0]   stage2_count_match;

// Stage 2 valid signal
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage2_valid <= 1'b0;
    end
    else if (stage1_valid) begin
        stage2_valid <= 1'b1;
    end
    else begin
        stage2_valid <= 1'b0;
    end
end

// Stage 2 count comparison
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage2_count_match     <= 4'b0000;
        stage2_pass_bitmap_raw <= 4'b0000;
    end
    else if (stage1_valid) begin
        // Count comparison for each pipe
        // Only check pipes that passed Stage 1
        // Use latched check_count (stage1_check_count) aligned with data
        stage2_count_match[0] <= (stage1_pass_bitmap[0] && stage1_check_count) ? 
                                 (stage1_pkt_count_0 == stage1_local_pkt_count) : 1'b1;
        stage2_count_match[1] <= (stage1_pass_bitmap[1] && stage1_check_count) ? 
                                 (stage1_pkt_count_1 == stage1_local_pkt_count) : 1'b1;
        stage2_count_match[2] <= (stage1_pass_bitmap[2] && stage1_check_count) ? 
                                 (stage1_pkt_count_2 == stage1_local_pkt_count) : 1'b1;
        stage2_count_match[3] <= (stage1_pass_bitmap[3] && stage1_check_count) ? 
                                 (stage1_pkt_count_3 == stage1_local_pkt_count) : 1'b1;
        
        // Calculate pass bitmap (datatype + count both match)
        stage2_pass_bitmap_raw <= stage1_pass_bitmap & stage2_count_match;
    end
end

// =============================================================================
// Pipeline Stage 3: Global Mask Decision
// =============================================================================

// Latch pipe_normal_bitmap for Stage 3
reg [3:0] stage3_pipe_normal_bitmap;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage3_pipe_normal_bitmap <= 4'b0000;
    end
    else if (stage1_valid) begin
        // Latch at Stage 1 for use in Stage 3
        stage3_pipe_normal_bitmap <= pipe_normal_bitmap;
    end
end

// Latch Auto_Mask_En for Stage 3
reg [3:0] stage3_auto_mask_en;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage3_auto_mask_en <= 4'b1111;
    end
    else if (stage1_valid) begin
        stage3_auto_mask_en <= Auto_Mask_En;
    end
end

// Calculate fail bitmap
wire [3:0] video_status_fail_bitmap_raw;
assign video_status_fail_bitmap_raw = stage3_pipe_normal_bitmap & (~stage2_pass_bitmap_raw);

// Check if global mask should be triggered
wire global_mask_trigger;
assign global_mask_trigger = |(video_status_fail_bitmap_raw & (~stage3_auto_mask_en));

// Output generation
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        video_status_pass_bitmap <= 4'b0000;
        video_status_fail_bitmap <= 4'b0000;
    end
    else if (stage2_valid) begin
        if (global_mask_trigger) begin
            // Global mask mode: any pipe with Auto_Mask_En=0 failed
            video_status_pass_bitmap <= 4'b0000;
            video_status_fail_bitmap <= 4'b1111;
        end
        else begin
            // Normal mode: output actual result
            video_status_pass_bitmap <= stage2_pass_bitmap_raw;
            video_status_fail_bitmap <= video_status_fail_bitmap_raw;
        end
    end
end

endmodule
