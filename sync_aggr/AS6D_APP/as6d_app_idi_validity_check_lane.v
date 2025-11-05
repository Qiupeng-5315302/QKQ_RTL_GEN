
module as6d_app_idi_validity_check_lane(/*AUTOARG*/
   // Outputs
   out_idi_tunnel_mode_en, out_idi_header_en, out_idi_data_type,
   out_idi_word_count, out_idi_virtual_channel, out_idi_data,
   out_idi_data_en, out_idi_byte_en,
   // Inputs
   clk, rst_n, validity_check_en, in_idi_tunnel_mode_en,
   in_idi_header_en, in_idi_data_type, in_idi_word_count,
   in_idi_virtual_channel, in_idi_data, in_idi_data_en,
   in_idi_byte_en
   );

    input                                                       clk;
    input                                                       rst_n;
    input                                                       validity_check_en;
    input                                                       in_idi_tunnel_mode_en;
    input                                                       in_idi_header_en;
    input     [ 5:0]                                            in_idi_data_type;
    input     [15:0]                                            in_idi_word_count;
    input     [ 3:0]                                            in_idi_virtual_channel;
    input     [63:0]                                            in_idi_data;
    input                                                       in_idi_data_en;
    input     [ 2:0]                                            in_idi_byte_en;

    output                                                      out_idi_tunnel_mode_en;
    output                                                      out_idi_header_en;
    output    [ 5:0]                                            out_idi_data_type;
    output    [15:0]                                            out_idi_word_count;
    output    [ 3:0]                                            out_idi_virtual_channel;
    output    [63:0]                                            out_idi_data;
    output                                                      out_idi_data_en;
    output    [ 2:0]                                            out_idi_byte_en;
    
    localparam   SILENT               = 4'd0;
    localparam   IDLE                 = 4'd1;
    localparam   LONG_PKT             = 4'd2;
    localparam   SHROT_PKT_HEADER     = 4'd3;
    localparam   SHROT_PKT_HEADER_DN  = 4'd4;

    reg                                                         idi_tunnel_mode_en_d1;
    reg                                                         idi_header_en_d1;
    reg       [ 5:0]                                            idi_data_type_d1;
    reg       [15:0]                                            idi_word_count_d1;
    reg       [ 3:0]                                            idi_virtual_channel_d1;
    reg       [63:0]                                            idi_data_d1;
    reg                                                         idi_data_en_d1;
    reg       [ 2:0]                                            idi_byte_en_d1;
    wire                                                        idi_header_en;
    wire                                                        idi_data_en;
    wire      [ 5:0]                                            idi_data_type;
    reg                                                         out_idi_tunnel_mode_en;
    reg                                                         out_idi_header_en;
    reg       [ 5:0]                                            out_idi_data_type;
    reg       [15:0]                                            out_idi_word_count;
    reg       [ 3:0]                                            out_idi_virtual_channel;
    reg       [63:0]                                            out_idi_data;
    reg                                                         out_idi_data_en;
    reg       [ 2:0]                                            out_idi_byte_en;
    reg                                                         out_idi_pkt_crc_en;
    reg       [31:0]                                            out_idi_pkt_crc;
    
    wire                                                        long_pkt_header_en;
    wire                                                        long_pkt_data_en;
    wire                                                        short_pkt_header_en;
    wire                                                        header_dn;

    assign  idi_header_en      = in_idi_header_en;
    assign  idi_data_en        = in_idi_data_en;
    assign  idi_data_type      = in_idi_data_type;

    assign  long_pkt_header_en  =  ~idi_header_en_d1 & idi_header_en & ~idi_data_en & (|idi_data_type[5:2]);
    assign  long_pkt_data_en    =  idi_header_en &  idi_data_en ;
    assign  short_pkt_header_en =  ~idi_header_en_d1 & idi_header_en & ~idi_data_en & (~|idi_data_type[5:2]);
    assign  header_dn           =  idi_header_en_d1 & ~idi_header_en;

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            idi_header_en_d1 <= 1'd0;
        end
        else begin
            idi_header_en_d1 <= idi_header_en;
        end
    end

    reg [3:0]   current_state;
    reg [3:0]   next_state;

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)
            current_state <= 4'd0;
        else
            current_state <= next_state;
    end

    always@(*)begin
        case(current_state)
            SILENT:begin
                if(validity_check_en) next_state = IDLE;
                else next_state = SILENT;
            end
            IDLE:begin
                if(validity_check_en)begin
                    if(long_pkt_header_en) next_state = LONG_PKT;
                    else if(short_pkt_header_en) next_state = SHROT_PKT_HEADER;
                    else next_state = IDLE;
                end
                else  next_state = SILENT;
            end
            LONG_PKT:begin
                if(validity_check_en)begin
                    if(header_dn) next_state = IDLE;
                    else next_state = LONG_PKT;
                end
                else  next_state = SILENT;
            end
            SHROT_PKT_HEADER:begin
                if(validity_check_en)begin
                    if(~idi_header_en) next_state = SHROT_PKT_HEADER_DN;
                    else next_state = IDLE;
                end
                else  next_state = SILENT;
            end
            SHROT_PKT_HEADER_DN:begin
                if(validity_check_en)begin
                    if(long_pkt_header_en) next_state = LONG_PKT;
                    else if(short_pkt_header_en) next_state = SHROT_PKT_HEADER;
                    else next_state = IDLE;
                end
                else  next_state = SILENT;
            end
            default:next_state = SILENT;
        endcase
    end

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            idi_tunnel_mode_en_d1  <=  1'd0;
            idi_data_type_d1       <=  6'd0;
            idi_word_count_d1      <= 16'd0;
            idi_virtual_channel_d1 <=  4'd0; 
            idi_data_d1            <= 64'd0;
            idi_data_en_d1         <=  1'd0;
            idi_byte_en_d1         <=  3'd0;
        end
        else begin
            idi_tunnel_mode_en_d1  <= in_idi_tunnel_mode_en;
            idi_data_type_d1       <= in_idi_data_type;
            idi_word_count_d1      <= in_idi_word_count;
            idi_virtual_channel_d1 <= in_idi_virtual_channel;
            idi_data_d1            <= in_idi_data;
            idi_data_en_d1         <= in_idi_data_en;
            idi_byte_en_d1         <= in_idi_byte_en;
        end
    end

    always@(*)begin
        if(current_state == SILENT)begin
            out_idi_tunnel_mode_en  = idi_tunnel_mode_en_d1;
            out_idi_header_en       = idi_header_en_d1;
            out_idi_data_type       = idi_data_type_d1;     
            out_idi_word_count      = idi_word_count_d1;    
            out_idi_virtual_channel = idi_virtual_channel_d1;
            out_idi_data            = idi_data_d1;
            out_idi_data_en         = idi_data_en_d1;
            out_idi_byte_en         = idi_byte_en_d1;       
        end
        else if(current_state == LONG_PKT) begin
            out_idi_tunnel_mode_en  = idi_tunnel_mode_en_d1;
            out_idi_header_en       = idi_header_en_d1;
            out_idi_data_type       = idi_data_type_d1;     
            out_idi_word_count      = idi_word_count_d1;    
            out_idi_virtual_channel = idi_virtual_channel_d1;
            out_idi_data            = idi_data_d1;
            out_idi_data_en         = idi_data_en_d1;
            out_idi_byte_en         = idi_byte_en_d1;       
        end
        else if((current_state == SHROT_PKT_HEADER)&&(next_state == SHROT_PKT_HEADER_DN)) begin
            out_idi_tunnel_mode_en  = idi_tunnel_mode_en_d1;
            out_idi_header_en       = idi_header_en_d1;
            out_idi_data_type       = idi_data_type_d1;     
            out_idi_word_count      = idi_word_count_d1;    
            out_idi_virtual_channel = idi_virtual_channel_d1;
            out_idi_data            = idi_data_d1;
            out_idi_data_en         = idi_data_en_d1;
            out_idi_byte_en         = idi_byte_en_d1;       
        end
        else begin
            out_idi_tunnel_mode_en  =  1'd0;
            out_idi_header_en       =  1'd0;
            out_idi_data_type       =  6'd0;
            out_idi_word_count      = 16'd0;
            out_idi_virtual_channel =  4'd0; 
            out_idi_data            = 64'd0;
            out_idi_data_en         =  1'd0;
            out_idi_byte_en         =  3'd0;
        end
    end


endmodule
