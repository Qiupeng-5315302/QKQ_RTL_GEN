module video_status_buffer_wr_ctrl(
    // =========================================================================
    // FIFO Write Side - IDI Interface (Single Channel)
    // =========================================================================
    input                   fifo_wr_clk,
    input                   fifo_wr_clk_rst_n,
    input                   idi_header_en,
    input   [5:0]           idi_datatype,
    input   [15:0]          idi_wordcount,
    input   [2:0]           idi_linecount,
    
    // =========================================================================
    // Timestamp Input (from pipe_mask_ctrl in aggr_clk domain)
    // =========================================================================
    input                   aggr_clk,                     // Source clock domain
    input                   aggr_clk_rst_n,               // Source reset
    input   [79:0]          local_us_cnt,                 // 80-bit timestamp from pipe_mask_ctrl (aggr_clk domain)
    
    // =========================================================================
    // AFIFO Write Interface to Status Buffer
    // =========================================================================
    output                  wr_en,
    output  [101:0]         wr_data,                      // {datatype[5:0], pkt_id[15:0], timestamp[79:0]}
    input                   afifo_full
);

// =========================================================================
// Internal Signals
// =========================================================================
// Synchronized timestamp in fifo_wr_clk domain
wire    [79:0]          us_counter_sync;

// Packet processing
reg     [5:0]           pkt_datatype;
reg     [15:0]          pkt_id;
reg     [79:0]          pkt_timestamp;

// Packet header detection
wire                    pkt_header_valid;

// =========================================================================
// Clock Domain Crossing: Synchronize local_us_cnt from aggr_clk to fifo_wr_clk
// =========================================================================
sync_bus #(
    .BUS_WIDTH  (80),
    .INI_VALUE  (80'd0)
) u_sync_us_cnt (
    .src_clk    (aggr_clk),
    .src_rstn   (aggr_clk_rst_n),
    .src_bus    (local_us_cnt),
    .dst_clk    (fifo_wr_clk),
    .dst_rstn   (fifo_wr_clk_rst_n),
    .dst_bus    (us_counter_sync)
);

// =========================================================================
// Packet Processing
// =========================================================================
assign pkt_header_valid = idi_header_en & ~afifo_full;

always @(posedge fifo_wr_clk or negedge fifo_wr_clk_rst_n) begin
    if (~fifo_wr_clk_rst_n) begin
        pkt_datatype <= 6'd0;
        pkt_id <= 16'd0;
        pkt_timestamp <= 80'd0;
    end
    else if (pkt_header_valid) begin
        pkt_datatype <= idi_datatype;
        // pkt_id: Use 3-bit linecount for LONG_PACKET (0x2C/0x2D), wordcount for FS/FE
        pkt_id <= (idi_datatype == 6'h2C || idi_datatype == 6'h2D) ? 
                  {13'd0, idi_linecount} : idi_wordcount;
        pkt_timestamp <= us_counter_sync;  // Use synchronized timestamp
    end
end

assign wr_en = pkt_header_valid;
assign wr_data = {pkt_datatype, pkt_id, pkt_timestamp};

endmodule