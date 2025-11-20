
// =============================================================================
// Module       : black_pixel_generator.v
// Description  : Black Pixel Generator for masked video pipes
//                Generates IDI-format black pixel data in sequence:
//                FS (short packet) -> LONG_PKT (header + data + footer) -> FE (short packet)
//                Single-line output mode with handshake control
// Date         : 2025-11-03
// =============================================================================

module as6d_app_black_pixel_generator (
    // Clock and Reset
    input  wire         clk,
    input  wire         rst_n,
    
    // Configuration Registers
    input  wire [5:0]   local_pkt_datatype,   // Long packet datatype (e.g., 0x2A for RAW10)
    input  wire [15:0]  video_status_info_wordcount,  // Line pixel byte count
    input  wire [4:0]   video_status_info_vc,         // MIPI Virtual Channel
    
    // Packet Info from pipe_mask_ctrl
    input  wire [15:0]  local_framecount,             // Frame number for FS/FE packets
    
    // Handshake with schedule_concat
    output reg          unready,                      // Not ready to output (1: not ready, 0: ready)
    input  wire         up_state,                     // Permission to output
    output reg          ack,                          // Acknowledge start
    output reg          line_end,                     // Line output complete
    
    // Data Output (IDI format)
    output reg          black_pixel_data_vld,
    output reg [139:0]  black_pixel_data
);

    //==========================================================================
    // State Encoding
    //==========================================================================
    localparam    BPG_RX_SILENT     = 3'd0                      ;
    localparam    BPG_RX_IDLE       = 3'd1                      ;
    localparam    BPG_RX_SHORT      = 3'd2                      ; 
    localparam    BPG_RX_HEADER     = 3'd3                      ; 
    localparam    BPG_RX_DATA       = 3'd4                      ; 
    localparam    BPG_RX_FOOTER     = 3'd5                      ; 
    localparam    BPG_RX_LINE_CRC   = 3'd6                      ; 
    localparam    BPG_RX_LINE_END   = 3'd7                      ; 
    
    //==========================================================================
    // Internal Registers
    //==========================================================================
    reg [ 2:0]  current_state;
    reg [ 2:0]  next_state;
    reg [15:0]  beat_counter;        // Current data beat counter
    reg [15:0]  total_beats;         // Total data beats needed
    reg [ 3:0]  last_beat_byte_en;   // Byte enable for last beat
    reg [ 5:0]  local_pkt_datatype_bpg;
    
    //==========================================================================
    // Stage 1: Beat Calculation (Combinational)
    //==========================================================================
    // Calculate total beats and last beat byte enable based on wordcount
    wire [15:0] beats_calc = (video_status_info_wordcount + 15) >> 4;  // ceil(wordcount/16)
    wire [3:0]  remainder  = video_status_info_wordcount[3:0];
    wire [3:0]  last_byte_en_calc = (remainder == 4'd0)  ? 4'd15 :
                                    (remainder <= 4'd1)  ? 4'd0 :
                                    (remainder <= 4'd2)  ? 4'd1 :
                                    (remainder <= 4'd3)  ? 4'd2 :
                                    (remainder <= 4'd4)  ? 4'd3 :
                                    (remainder <= 4'd5)  ? 4'd4 :
                                    (remainder <= 4'd6)  ? 4'd5 :
                                    (remainder <= 4'd7)  ? 4'd6 :
                                    (remainder <= 4'd8)  ? 4'd7 :
                                    (remainder <= 4'd9)  ? 4'd8 :
                                    (remainder <= 4'd10) ? 4'd9 :
                                    (remainder <= 4'd11) ? 4'd10 :
                                    (remainder <= 4'd12) ? 4'd11 :
                                    (remainder <= 4'd13) ? 4'd12 :
                                    (remainder <= 4'd14) ? 4'd13 : 4'd14;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            local_pkt_datatype_bpg <= 6'd0;
        end
        else if(up_state) begin
            local_pkt_datatype_bpg <= local_pkt_datatype;
        end
    end

    assign  sp_pkt          = (local_pkt_datatype_bpg == 6'h00 || local_pkt_datatype_bpg == 6'h01);
    assign  lp_ps_pkt       = (|local_pkt_datatype_bpg[5:2]);
    assign  lp_pf_pkt       = (beat_counter == (total_beats - 1));
    //==========================================================================
    // Stage 2: Next State Logic (Combinational)
    //==========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= BPG_RX_SILENT;
        end
        else begin
            current_state <= next_state;
        end
    end


    always @(*)begin
        case(current_state)
            BPG_RX_SILENT:begin
                if(up_state)
                    next_state =  BPG_RX_IDLE;
                else 
                    next_state =  BPG_RX_SILENT;
            end
            BPG_RX_IDLE:begin
                if(sp_pkt)
                    next_state = BPG_RX_SHORT;
                else if(lp_ps_pkt)
                    next_state = BPG_RX_HEADER;
                else 
                    next_state = BPG_RX_IDLE;
            end
            BPG_RX_SHORT:begin
                    next_state = BPG_RX_LINE_END;
            end
            BPG_RX_HEADER:begin
                if(lp_pf_pkt)
                    next_state = BPG_RX_FOOTER;
                else
                    next_state = BPG_RX_DATA;
            end
            BPG_RX_DATA:begin
                if(lp_pf_pkt)
                    next_state = BPG_RX_FOOTER;
                else 
                    next_state = BPG_RX_DATA;
            end
            BPG_RX_FOOTER:begin
                next_state = BPG_RX_LINE_END;
            end
            BPG_RX_LINE_END:begin
                next_state = BPG_RX_SILENT;
            end
            default:begin
                next_state = BPG_RX_SILENT;
            end
        endcase
    end
      
    //==========================================================================
    // Stage 4: Beat Counter and Configuration Latching
    //==========================================================================
    // Total beats calculation and latching
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            total_beats <= 16'd0;
        end
        else if ((|local_pkt_datatype_bpg[5:2]) && up_state) begin
            total_beats <= beats_calc;
        end
    end
    
    // Last beat byte enable calculation and latching
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            last_beat_byte_en <= 4'b0;
        end
        else if ((|local_pkt_datatype_bpg[5:2]) && up_state) begin
            last_beat_byte_en <= last_byte_en_calc;
        end
    end
    
    // Beat counter management
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            beat_counter <= 16'd0;
        end
        else if (current_state == BPG_RX_HEADER) begin
            beat_counter <= 16'd0;
        end
        else  begin
            beat_counter <= beat_counter + 1'b1;
        end
    end
    
    //==========================================================================
    // Stage 5: Output Control Signals
    //==========================================================================
    // unready: Not ready to output (1: not ready, 0: ready with data)
    assign unready = 1'b1;
    
    // ack: Acknowledge start
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ack <= 1'b0;
        end
        else if ((current_state == BPG_RX_SILENT)&& up_state) begin
            ack <= 1'b1;
        end
        else begin
            ack <= 1'b0;
        end
    end
    
    // line_end: Line complete
    assign line_end = (current_state==BPG_RX_LINE_END) ? 1'd1 : 1'd0;
    
    // black_pixel_data_vld: Valid every cycle during output
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            black_pixel_data_vld <= 1'b0;
        end
        else begin
            case (current_state)
                BPG_RX_SHORT, BPG_RX_HEADER, BPG_RX_DATA, BPG_RX_FOOTER: begin
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
                BPG_RX_SHORT: begin
                    // FS Short Packet
                    black_pixel_data[4:0]     <= video_status_info_vc; // Virtual Channel
                    black_pixel_data[10:5]    <= local_pkt_datatype_bpg;                // Datatype: FS
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
                
                BPG_RX_HEADER: begin
                    // Long Packet Header
                    black_pixel_data[4:0]     <= video_status_info_vc;       // Virtual Channel
                    black_pixel_data[10:5]    <= local_pkt_datatype_bpg; // Datatype (e.g., 0x2A)
                    black_pixel_data[26:11]   <= video_status_info_wordcount;// Word count (bytes)
                    black_pixel_data[127:27]  <= 101'd0;               // Reserved
                    black_pixel_data[131:128] <= 4'd0;                 // byte_en (not used)
                    black_pixel_data[132]     <= 1'b1;                 // header_flag
                    black_pixel_data[133]     <= 1'b0;                 // footer_flag
                    black_pixel_data[134]     <= 1'b0;                 // short_flag
                    black_pixel_data[135]     <= 1'b0;                 // data_flag
                    black_pixel_data[138:136] <= 3'd0;                 // aggre_id
                    black_pixel_data[139]     <= 1'b0;                 // tunnel_mode_en
                end
                
                BPG_RX_DATA: begin
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
                
                BPG_RX_FOOTER: begin
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
            
                default: begin
                    black_pixel_data <= 140'd0;
                end
            endcase
        end
    end

endmodule
