
module  as6d_app_crc_gen_lane(/*AUTOARG*/
   // Outputs
   out_idi_tunnel_mode_en, out_idi_header_en, out_idi_data_type,
   out_idi_word_count, out_idi_virtual_channel, out_idi_data,
   out_idi_data_en, out_idi_byte_en, out_idi_pkt_crc_en,
   out_idi_pkt_crc,
   // Inputs
   clk, rst_n, reg_app_pkt_crc_gen_dis, pcs2mep_data_stat,
   in_idi_tunnel_mode_en, in_idi_header_en, in_idi_data_type,
   in_idi_word_count, in_idi_virtual_channel, in_idi_data,
   in_idi_data_en, in_idi_byte_en
   );

    input                                                       clk;
    input                                                       rst_n;
    input                                                       reg_app_pkt_crc_gen_dis;
    input                                                       pcs2mep_data_stat;
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
    output                                                      out_idi_pkt_crc_en;
    output    [31:0]                                            out_idi_pkt_crc;
    
    localparam   SILENT           = 4'd0;
    localparam   IDLE             = 4'd1;
    localparam   LONG_PKT_HEADER  = 4'd2;
    localparam   LONG_PKT_DATA    = 4'd3;
    localparam   LONG_PKT_FOOTER  = 4'd4;
    localparam   LONG_PKT_CRC     = 4'd5;
    localparam   SHORT_PKT_HEADER = 4'd6;
    localparam   SHORT_PKT_CRC    = 4'd7;

    genvar                  i;
    wire                    long_pkt_header_en;
    wire                    long_pkt_data_en;
    wire                    short_pkt_header_en;
    wire                    idi_header_en;
    wire                    idi_data_en;
    wire      [ 5:0]        idi_data_type;
    wire      [63:0]        idi_data;
    wire                    idi_tunnel_mode_en;
    reg       [ 3:0]        current_state;
    reg       [ 3:0]        next_state;
    reg                     idi_header_en_d1;
    wire                    header_dn;
    wire                    first_slice;
    wire                    middle_slice;
    wire                    last_slice;
    wire                    idi_data_req_pre_crc;
    wire      [ 1:0]        idi_data_slice_pre_crc;
    wire      [ 2:0]        idi_byte_en_pre_crc;
    wire                    swap_data_en;
    wire      [63:0]        swap_idi_data;
    wire      [63:0]        idi_data_post_swap;
    reg       [63:0]        idi_data_post_padding_zero;
    wire      [63:0]        idi_data_pre_crc;
    wire      [ 1:0]        idi_data_slice_post_crc;
    wire      [63:0]        idi_data_post_crc;

    reg                     out_idi_tunnel_mode_en;
    reg                     out_idi_header_en;
    reg       [ 5:0]        out_idi_data_type;
    reg       [15:0]        out_idi_word_count;
    reg       [ 3:0]        out_idi_virtual_channel;
    reg       [63:0]        out_idi_data;
    reg                     out_idi_data_en;
    reg       [ 2:0]        out_idi_byte_en;
    wire                    out_idi_crc_en;
    wire      [31:0]        out_idi_crc;

    assign  idi_tunnel_mode_en = in_idi_tunnel_mode_en;
    assign  idi_header_en      = in_idi_header_en;
    assign  idi_data_en        = in_idi_data_en;
    assign  idi_data_type      = in_idi_data_type;
    assign  idi_data           = in_idi_data;

    assign  long_pkt_header_en  = ~idi_header_en_d1 & idi_header_en & ~idi_data_en & (|idi_data_type[5:2]);
    assign  long_pkt_data_en    =  idi_header_en &  idi_data_en ;
    assign  short_pkt_header_en =  idi_header_en & ~idi_data_en & (~|idi_data_type[5:2]);
    assign  header_dn           =  idi_header_en_d1 & ~idi_header_en;

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            idi_header_en_d1 <= 1'd0;
        end
        else begin
            idi_header_en_d1 <= idi_header_en;
        end
    end

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)
            current_state <= 4'd0;
        else
            current_state <= next_state;
    end

    always@(*)begin
        case(current_state)
            SILENT:begin
                if(pcs2mep_data_stat) next_state = IDLE;
                else next_state = SILENT;
            end
            IDLE:begin
                if(pcs2mep_data_stat)begin
                    if(long_pkt_header_en) next_state = LONG_PKT_HEADER;
                    else if(long_pkt_data_en) next_state = LONG_PKT_DATA;
                    else next_state = IDLE;
                end
                else next_state = SILENT;
            end
            LONG_PKT_HEADER:begin
                if(pcs2mep_data_stat)begin
                    if(long_pkt_data_en) next_state = LONG_PKT_DATA;
                    else if(header_dn) next_state = LONG_PKT_CRC;
                    else next_state = LONG_PKT_HEADER;
                end
                else next_state = SILENT;
            end
            LONG_PKT_DATA:begin
                if(pcs2mep_data_stat)begin
                    if(header_dn) next_state = LONG_PKT_CRC;
                    else next_state = LONG_PKT_DATA;
                end
                else next_state = SILENT;
            end
            LONG_PKT_CRC:begin
                if(pcs2mep_data_stat) next_state = IDLE;
                else next_state = SILENT;
            end
            default:begin
                next_state = SILENT;
            end
        endcase
    end
    

    assign  first_slice  = ((current_state == LONG_PKT_HEADER)&&(next_state == LONG_PKT_DATA)) && long_pkt_data_en;
    assign  middle_slice = ((current_state == LONG_PKT_DATA)&&(next_state == LONG_PKT_DATA)) && long_pkt_data_en;
    assign  last_slice   = (((current_state == LONG_PKT_DATA)||(current_state == LONG_PKT_HEADER))&&(next_state == LONG_PKT_CRC));
    
    assign  idi_data_req_pre_crc   = first_slice|middle_slice|last_slice;
    assign  idi_data_slice_pre_crc = first_slice  ? 2'b01 :
                                     middle_slice ? 2'b00 :
                                     last_slice   ? 2'b10 : 2'b00;

    assign  idi_byte_en_pre_crc    = 3'h7 ;

    assign  swap_data_en = ((idi_data_type == 6'h1a)||(idi_data_type == 6'h1e))|idi_tunnel_mode_en;

    generate 
        for(i=0;i<=7;i=i+1)begin:SWAP_IDI_DATA_BK
            assign swap_idi_data[i*8+:8] = idi_data[(7-i)*8+:8];
        end
    endgenerate

    assign  idi_data_post_swap  = swap_data_en ? swap_idi_data : idi_data;

    always@(*)begin
        if(idi_byte_en_pre_crc == 3'd7)
            idi_data_post_padding_zero = {      idi_data_post_swap[63:0]};
        else if(idi_byte_en_pre_crc == 3'd6)
            idi_data_post_padding_zero = {8'd0 ,idi_data_post_swap[55:0]};
        else if(idi_byte_en_pre_crc == 3'd5)
            idi_data_post_padding_zero = {16'd0,idi_data_post_swap[47:0]};
        else if(idi_byte_en_pre_crc == 3'd4)
            idi_data_post_padding_zero = {24'd0,idi_data_post_swap[39:0]};
        else if(idi_byte_en_pre_crc == 3'd3)
            idi_data_post_padding_zero = {32'd0,idi_data_post_swap[31:0]};
        else if(idi_byte_en_pre_crc == 3'd2)
            idi_data_post_padding_zero = {40'd0,idi_data_post_swap[23:0]};
        else if(idi_byte_en_pre_crc == 3'd1)
            idi_data_post_padding_zero = {48'd0,idi_data_post_swap[15:0]};
        else if(idi_byte_en_pre_crc == 3'd0)
            idi_data_post_padding_zero = {56'd0,idi_data_post_swap[ 7:0]};
        else
            idi_data_post_padding_zero = 64'd0;
    end
         
    assign  idi_data_pre_crc = idi_data_post_padding_zero;

    crc32_encode_wrapper_with_crc_en_app_idi u_as6d_app_rx_crc_gen (
        .clk            ( clk                                  ),
        .rst_n          ( rst_n                                ),
        .data_in        ( idi_data_pre_crc[63:0]               ),
        .data_slice_in  ( idi_data_slice_pre_crc[1:0]          ),
        .data_req_in    ( idi_data_req_pre_crc                 ),
        .byte_en_in     ( idi_byte_en_pre_crc                  ),
        .crc_en_in      ( 1'd0                                 ),

        .data_out       ( idi_data_post_crc[63:0]              ),
        .data_slice_out ( idi_data_slice_post_crc[1:0]         ),
        .data_req_out   (                                      )
    );
    
    assign out_idi_pkt_crc_en = (~reg_app_pkt_crc_gen_dis) ? (idi_data_slice_post_crc == 2'b10) : 1'd0 ;
    assign out_idi_pkt_crc    = (~reg_app_pkt_crc_gen_dis) ? idi_data_post_crc[31:0] : 32'd0 ;
    
    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            out_idi_tunnel_mode_en  <=  1'd0;
            out_idi_header_en       <=  1'd0;
            out_idi_data_type       <=  6'd0;
            out_idi_word_count      <= 16'd0;
            out_idi_virtual_channel <=  4'd0; 
            out_idi_data            <= 64'd0;
            out_idi_data_en         <=  1'd0;
            out_idi_byte_en         <=  3'd0;
        end
        else begin
            out_idi_tunnel_mode_en  <= in_idi_tunnel_mode_en;
            out_idi_header_en       <= in_idi_header_en;
            out_idi_data_type       <= in_idi_data_type;
            out_idi_word_count      <= in_idi_word_count;
            out_idi_virtual_channel <= in_idi_virtual_channel;
            out_idi_data            <= in_idi_data;
            out_idi_data_en         <= in_idi_data_en;
            out_idi_byte_en         <= in_idi_byte_en;
        end
    end

endmodule
