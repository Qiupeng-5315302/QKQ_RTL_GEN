
module as6d_app_video_status_buffer_wr_ctrl(
    // =========================================================================
    // FIFO Write Side - IDI Interface (Single Channel)
    // =========================================================================
    input                   fifo_wrclk,
    input                   fifo_wrclk_rst_n,
    input                   idi_header_en,
    input   [5:0]           idi_datatype,
    input   [15:0]          idi_wordcount,
    input   [2:0]           idi_linecount,
    
    // =========================================================================
    // Timestamp Input (from pipe_mask_ctrl in aggre_clk domain)
    // =========================================================================
    input                   aggre_clk,                     // Source clock domain
    input                   aggre_clk_rst_n,               // Source reset
    input   [79:0]          local_us_cnt,                 // 80-bit timestamp from pipe_mask_ctrl (aggre_clk domain)
    
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
    // Synchronized timestamp in fifo_wrclk domain
    wire    [79:0]          us_counter_sync;
    
    // Packet processing
    reg     [5:0]           pkt_datatype;
    reg     [15:0]          pkt_id;
    reg     [79:0]          pkt_timestamp;
    
    // Packet header detection
    reg                     pkt_header_valid;
    wire                    pkt_header_valid_pre;
    
    // =========================================================================
    // Clock Domain Crossing: Synchronize local_us_cnt from aggre_clk to fifo_wrclk
    // =========================================================================
    sync_bus #(
        .BUS_WIDTH  (80),
        .INI_VALUE  (80'd0)
    ) u_sync_us_cnt (
        .src_clk    (aggre_clk),
        .src_rstn   (aggre_clk_rst_n),
        .src_bus    (local_us_cnt),
        .dst_clk    (fifo_wrclk),
        .dst_rstn   (fifo_wrclk_rst_n),
        .dst_bus    (us_counter_sync)
    );
    
    // =========================================================================
    // Packet Processing
    // =========================================================================
    reg     idi_header_en_d1;
    wire    idi_header_en_rise;
    wire    idi_header_en_fall;
    wire    wr_en_pre;

    always@(posedge fifo_wrclk or negedge fifo_wrclk_rst_n)begin
        if (~fifo_wrclk_rst_n)
            idi_header_en_d1 <= 1'd0;
        else
            idi_header_en_d1 <= idi_header_en;
    end

    assign  idi_header_en_rise = ~idi_header_en_d1 &  idi_header_en;
    assign  idi_header_en_fall =  idi_header_en_d1 & ~idi_header_en;
    
    assign  wr_en_pre = idi_header_en_fall & ~afifo_full;

    always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n) begin
        if (~fifo_wrclk_rst_n) 
            pkt_header_valid <= 1'd0;
        else
            pkt_header_valid <= idi_header_en_rise;
    end
    
    always @(posedge fifo_wrclk or negedge fifo_wrclk_rst_n) begin
        if (~fifo_wrclk_rst_n) begin
            pkt_datatype <= 6'd0;
            pkt_id <= 16'd0;
            pkt_timestamp <= 80'd0;
        end
        else if (idi_header_en_rise) begin
            pkt_datatype <= idi_datatype;
            // pkt_id: Use 3-bit linecount for LONG_PACKET (0x2C/0x2D), wordcount for FS/FE
            pkt_id <= (idi_datatype == 6'h2C || idi_datatype == 6'h2D) ? 
                      {13'd0, idi_linecount} : idi_wordcount;
            pkt_timestamp <= us_counter_sync;  // Use synchronized timestamp
        end
    end
    
    assign wr_en   = wr_en_pre;
    assign wr_data = {pkt_datatype, pkt_id, pkt_timestamp};

endmodule
