// =============================================================================
// Module       : black_pixel_generator.v
// Description  : Black Pixel Generator for masked video pipes
//                Generates IDI-format black pixel data in sequence:
//                FS (short packet) -> LONG_PKT (header + data + footer) -> FE (short packet)
//                Single-line output mode with handshake control
// Date         : 2025-11-03
// =============================================================================

module black_pixel_generator (
    // Clock and Reset
    input  wire         clk,
    input  wire         rst_n,
    
    // Configuration Registers
    input  wire [5:0]   reg_BPG_datatype,    // Long packet datatype (e.g., 0x2A for RAW10)
    input  wire [15:0]  reg_BPG_wordcount,   // Line pixel byte count
    input  wire [2:0]   reg_BPG_vc,          // MIPI Virtual Channel
    
    // Packet Info from pipe_mask_ctrl
    input  wire [15:0]  local_framecount,    // Frame number for FS/FE packets
    
    // Handshake with schedule_concat
    output reg          unready,             // Not ready to output (1: not ready, 0: ready)
    input  wire         up_state,            // Permission to output
    output reg          ack,                 // Acknowledge start
    output reg          line_end,            // Line output complete
    
    // Data Output (IDI format)
    output reg          black_pixel_data_vld,
    output reg [139:0]  black_pixel_data
);

    //==========================================================================
    // State Encoding
    //==========================================================================
    localparam [2:0] IDLE              = 3'd0;
    localparam [2:0] WAIT_GRANT        = 3'd1;
    localparam [2:0] SEND_FS           = 3'd2;
    localparam [2:0] SEND_LONG_HEADER  = 3'd3;
    localparam [2:0] SEND_DATA         = 3'd4;
    localparam [2:0] SEND_FOOTER       = 3'd5;
    localparam [2:0] SEND_FE           = 3'd6;
    
    //==========================================================================
    // Internal Registers
    //==========================================================================
    reg [2:0]  current_state;
    reg [2:0]  next_state;
    reg [15:0] beat_counter;        // Current data beat counter
    reg [15:0] total_beats;         // Total data beats needed
    reg [3:0]  last_beat_byte_en;   // Byte enable for last beat
    
    //==========================================================================
    // Stage 1: Beat Calculation (Combinational)
    //==========================================================================
    // Calculate total beats and last beat byte enable based on wordcount
    wire [15:0] beats_calc = (reg_BPG_wordcount + 15) >> 4;  // ceil(wordcount/16)
    wire [3:0]  remainder  = reg_BPG_wordcount[3:0];
    wire [3:0]  last_byte_en_calc = (remainder == 4'd0) ? 4'b1111 :
                                    (remainder <= 4'd1) ? 4'b0001 :
                                    (remainder <= 4'd2) ? 4'b0011 :
                                    (remainder <= 4'd3) ? 4'b0111 :
                                    (remainder <= 4'd4) ? 4'b1111 :
                                    (remainder <= 4'd5) ? 4'b0001 :
                                    (remainder <= 4'd6) ? 4'b0011 :
                                    (remainder <= 4'd7) ? 4'b0111 :
                                    (remainder <= 4'd8) ? 4'b1111 :
                                    (remainder <= 4'd9) ? 4'b0001 :
                                    (remainder <= 4'd10) ? 4'b0011 :
                                    (remainder <= 4'd11) ? 4'b0111 :
                                    (remainder <= 4'd12) ? 4'b1111 :
                                    (remainder <= 4'd13) ? 4'b0001 :
                                    (remainder <= 4'd14) ? 4'b0011 : 4'b0111;
    
    //==========================================================================
    // Stage 2: Next State Logic (Combinational)
    //==========================================================================
    always @(*) begin
        next_state = current_state;
        
        case (current_state)
            IDLE: begin
                next_state = WAIT_GRANT;
            end
            
            WAIT_GRANT: begin
                if (up_state) begin
                    next_state = SEND_FS;
                end
            end
            
            SEND_FS: begin
                next_state = SEND_LONG_HEADER;
            end
            
            SEND_LONG_HEADER: begin
                next_state = SEND_DATA;
            end
            
            SEND_DATA: begin
                if (beat_counter >= total_beats - 1) begin
                    next_state = SEND_FOOTER;
                end
            end
            
            SEND_FOOTER: begin
                next_state = SEND_FE;
            end
            
            SEND_FE: begin
                next_state = IDLE;
            end
            
            default: begin
                next_state = IDLE;
            end
        endcase
    end
    
    //==========================================================================
    // Stage 3: State Register (Sequential)
    //==========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    //==========================================================================
    // Stage 4: Beat Counter and Configuration Latching
    //==========================================================================
    // Total beats calculation and latching
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            total_beats <= 16'd0;
        end
        else if (current_state == WAIT_GRANT && up_state) begin
            total_beats <= beats_calc;
        end
    end
    
    // Last beat byte enable calculation and latching
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            last_beat_byte_en <= 4'b0;
        end
        else if (current_state == WAIT_GRANT && up_state) begin
            last_beat_byte_en <= last_byte_en_calc;
        end
    end
    
    // Beat counter management
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            beat_counter <= 16'd0;
        end
        else if (current_state == WAIT_GRANT && up_state) begin
            beat_counter <= 16'd0;
        end
        else if (current_state == SEND_DATA) begin
            beat_counter <= beat_counter + 1'b1;
        end
    end
    
    //==========================================================================
    // Stage 5: Output Control Signals
    //==========================================================================
    // unready: Not ready to output (1: not ready, 0: ready with data)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            unready <= 1'b1;  // Default: not ready
        end
        else if (current_state == IDLE) begin
            unready <= 1'b0;  // Ready with data when in IDLE
        end
        else if (current_state == WAIT_GRANT && up_state) begin
            unready <= 1'b1;  // Not ready during output
        end
    end
    
    // ack: Acknowledge start
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ack <= 1'b0;
        end
        else if (current_state == WAIT_GRANT && next_state == SEND_FS) begin
            ack <= 1'b1;
        end
        else begin
            ack <= 1'b0;
        end
    end
    
    // line_end: Line complete
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            line_end <= 1'b0;
        end
        else if (current_state == SEND_FE && next_state == IDLE) begin
            line_end <= 1'b1;
        end
        else begin
            line_end <= 1'b0;
        end
    end
    
    // black_pixel_data_vld: Valid every cycle during output
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            black_pixel_data_vld <= 1'b0;
        end
        else begin
            case (current_state)
                SEND_FS, SEND_LONG_HEADER, SEND_DATA, SEND_FOOTER, SEND_FE: begin
                    black_pixel_data_vld <= 1'b1;
                end
                default: begin
                    black_pixel_data_vld <= 1'b0;
                end
            endcase
        end
    end
    
    //==========================================================================
    // Stage 6: IDI Data Generation
    //==========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            black_pixel_data <= 140'd0;
        end
        else begin
            case (current_state)
                SEND_FS: begin
                    // FS Short Packet
                    black_pixel_data[4:0]     <= reg_BPG_vc;           // Virtual Channel
                    black_pixel_data[10:5]    <= 6'h00;                // Datatype: FS
                    black_pixel_data[26:11]   <= local_framecount;     // Frame number
                    black_pixel_data[127:27]  <= 101'd0;               // Reserved
                    black_pixel_data[131:128] <= 4'd0;                 // byte_en (not used)
                    black_pixel_data[132]     <= 1'b1;                 // header_flag
                    black_pixel_data[133]     <= 1'b0;                 // footer_flag
                    black_pixel_data[134]     <= 1'b1;                 // short_flag
                    black_pixel_data[135]     <= 1'b0;                 // data_flag
                    black_pixel_data[138:136] <= 3'd0;                 // aggre_id
                    black_pixel_data[139]     <= 1'b0;                 // tunnel_mode_en
                end
                
                SEND_LONG_HEADER: begin
                    // Long Packet Header
                    black_pixel_data[4:0]     <= reg_BPG_vc;           // Virtual Channel
                    black_pixel_data[10:5]    <= reg_BPG_datatype;     // Datatype (e.g., 0x2A)
                    black_pixel_data[26:11]   <= reg_BPG_wordcount;    // Word count (bytes)
                    black_pixel_data[127:27]  <= 101'd0;               // Reserved
                    black_pixel_data[131:128] <= 4'd0;                 // byte_en (not used)
                    black_pixel_data[132]     <= 1'b1;                 // header_flag
                    black_pixel_data[133]     <= 1'b0;                 // footer_flag
                    black_pixel_data[134]     <= 1'b0;                 // short_flag
                    black_pixel_data[135]     <= 1'b0;                 // data_flag
                    black_pixel_data[138:136] <= 3'd0;                 // aggre_id
                    black_pixel_data[139]     <= 1'b0;                 // tunnel_mode_en
                end
                
                SEND_DATA: begin
                    // Long Packet Data (all black pixels = 0)
                    black_pixel_data[127:0]   <= 128'h0;               // Black pixel data
                    black_pixel_data[131:128] <= 4'b1111;              // byte_en (all valid)
                    black_pixel_data[132]     <= 1'b0;                 // header_flag
                    black_pixel_data[133]     <= 1'b0;                 // footer_flag
                    black_pixel_data[134]     <= 1'b0;                 // short_flag
                    black_pixel_data[135]     <= 1'b1;                 // data_flag
                    black_pixel_data[138:136] <= 3'd0;                 // aggre_id
                    black_pixel_data[139]     <= 1'b0;                 // tunnel_mode_en
                end
                
                SEND_FOOTER: begin
                    // Long Packet Footer (last beat with partial byte_en)
                    black_pixel_data[127:0]   <= 128'h0;               // Black pixel data
                    black_pixel_data[131:128] <= last_beat_byte_en;    // byte_en (last beat)
                    black_pixel_data[132]     <= 1'b0;                 // header_flag
                    black_pixel_data[133]     <= 1'b1;                 // footer_flag
                    black_pixel_data[134]     <= 1'b0;                 // short_flag
                    black_pixel_data[135]     <= 1'b1;                 // data_flag
                    black_pixel_data[138:136] <= 3'd0;                 // aggre_id
                    black_pixel_data[139]     <= 1'b0;                 // tunnel_mode_en
                end
                
                SEND_FE: begin
                    // FE Short Packet
                    black_pixel_data[4:0]     <= reg_BPG_vc;           // Virtual Channel
                    black_pixel_data[10:5]    <= 6'h01;                // Datatype: FE
                    black_pixel_data[26:11]   <= local_framecount;     // Frame number
                    black_pixel_data[127:27]  <= 101'd0;               // Reserved
                    black_pixel_data[131:128] <= 4'd0;                 // byte_en (not used)
                    black_pixel_data[132]     <= 1'b1;                 // header_flag
                    black_pixel_data[133]     <= 1'b0;                 // footer_flag
                    black_pixel_data[134]     <= 1'b1;                 // short_flag
                    black_pixel_data[135]     <= 1'b0;                 // data_flag
                    black_pixel_data[138:136] <= 3'd0;                 // aggre_id
                    black_pixel_data[139]     <= 1'b0;                 // tunnel_mode_en
                end
                
                default: begin
                    black_pixel_data <= 140'd0;
                end
            endcase
        end
    end

endmodule
