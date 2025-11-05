
module  as6d_app_crc_chk_lane(/*AUTOARG*/
   // Outputs
   video_crc_err,
   // Inputs
   clk, rst_n, video_data_vld, video_data, pcs2mep_data_stat
   );

    input                                                       clk;
    input                                                       rst_n;
    input                                                       video_data_vld;
    input     [139:0]                                           video_data;
    input                                                       pcs2mep_data_stat;

    output reg                                                  video_crc_err;
    
    localparam   SILENT           = 4'd0;
    localparam   IDLE             = 4'd1;
    localparam   LONG_PKT_HEADER  = 4'd2;
    localparam   LONG_PKT_DATA    = 4'd3;
    localparam   LONG_PKT_FOOTER  = 4'd4;
    localparam   LONG_PKT_CRC     = 4'd5;
    localparam   SHORT_PKT_HEADER = 4'd6;
    localparam   SHORT_PKT_CRC    = 4'd7;

    app_header  rd_ctrl_app_header;
    app_data    rd_ctrl_app_data;

    genvar                  i;
    reg       [  5:0]       idi_data_type;
    wire      [127:0]       idi_data;
    wire      [  3:0]       idi_byte_en;
    reg                     idi_tunnel_mode_en;
    reg       [  3:0]       current_state;
    reg       [  3:0]       next_state;
    reg                     idi_header_en_d1;
    reg                     header_dn_d1;
    wire                    first_slice;
    wire                    middle_slice;
    wire                    last_slice;
    wire                    idi_data_req_pre_crc;
    wire      [  1:0]       idi_data_slice_pre_crc;
    wire      [  3:0]       idi_byte_en_pre_crc;
    wire                    swap_data_en;
    wire      [127:0]       swap_idi_data;
    wire      [127:0]       idi_data_post_swap;
    reg       [127:0]       idi_data_post_padding_zero;
    wire      [127:0]       idi_data_pre_crc;
    wire      [  1:0]       idi_data_slice_post_crc;
    wire      [127:0]       idi_data_post_crc;
    wire                    data_en;
    wire                    short_en;
    wire                    footer_en;
    wire                    header_en;
    wire      [  5:0]       data_type;
    wire                    sp_ls;
    wire                    sp_le;
    wire                    sp_fs;
    wire                    sp_fe;
    wire                    lp_ps;
    wire                    lp_pf;
    wire                    lp_payload;
    wire                    sp_pkt;
    wire                    lp_ps_pkt;
    wire                    lp_pf_pkt;
    wire                    lp_payload_pkt;
    wire                    video_crc_err_pre;

    //observer signal begin
    assign  sp_ls         =    (video_data_vld)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_LINE_START);
    assign  sp_le         =    (video_data_vld)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_LINE_END);
    assign  sp_fs         =    (video_data_vld)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_FRAME_START);
    assign  sp_fe         =    (video_data_vld)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_FRAME_END);
    assign  lp_ps         =    (video_data_vld)&header_en;
    assign  lp_pf         =    (video_data_vld)&footer_en;
    assign  lp_payload    =    (video_data_vld)&data_en;

    assign  sp_pkt          = ({data_en,short_en,footer_en,header_en} == 4'b0100)&&(rd_ctrl_app_header.data_type[5:2]==4'd0);
    assign  lp_pf_pkt       = (        {short_en,footer_en,header_en} ==  3'b010);
    assign  lp_payload_pkt  = ({data_en,short_en,          header_en} == 3'b10_0);
    //observer signal end

    //logic design
    assign    rd_ctrl_app_header  =    video_data[135:0];
    assign    rd_ctrl_app_data    =    video_data[135:0];
    assign    {data_en,short_en,footer_en,header_en} = video_data[135:132];

    assign    lp_ps_pkt       = ({data_en,short_en,footer_en,header_en} == 4'b0001)&&(rd_ctrl_app_header.data_type[5:2]!=4'd0);
    

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)
            idi_data_type   <= 6'd0;
        else if(video_data_vld & ((current_state == IDLE)&(next_state == LONG_PKT_HEADER)))
            idi_data_type   <= rd_ctrl_app_header.data_type;
    end

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)
            idi_tunnel_mode_en   <= 1'd0;
        else if(video_data_vld & ((current_state == IDLE)&(next_state == LONG_PKT_HEADER)))
            idi_tunnel_mode_en   <= video_data[139];
    end
    
    assign  idi_byte_en     = rd_ctrl_app_data.byte_en;
    assign  idi_data        = rd_ctrl_app_data.csi_data;

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
                    if(video_data_vld&header_en&&lp_ps_pkt) next_state = LONG_PKT_HEADER;
                    else if(video_data_vld&data_en) next_state = LONG_PKT_DATA;
                    else next_state = IDLE;
                end
                else next_state = SILENT;
            end
            LONG_PKT_HEADER:begin
                if(pcs2mep_data_stat)begin
                    if(video_data_vld&footer_en) next_state = LONG_PKT_FOOTER;
                    else if(video_data_vld&data_en) next_state = LONG_PKT_DATA;
                    else next_state = LONG_PKT_HEADER;
                end
                else next_state = SILENT;
            end
            LONG_PKT_DATA:begin
                if(pcs2mep_data_stat)begin
                    if(video_data_vld&footer_en) next_state = LONG_PKT_FOOTER;
                    else next_state = LONG_PKT_DATA;
                end
                else next_state = SILENT;
            end
            LONG_PKT_FOOTER:begin
                if(pcs2mep_data_stat)begin
                    if(video_data_vld) next_state = LONG_PKT_CRC;
                    else next_state = LONG_PKT_FOOTER;
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
    

    assign  first_slice  = video_data_vld && ((current_state == LONG_PKT_HEADER)&&((next_state == LONG_PKT_DATA)||(next_state == LONG_PKT_FOOTER))) && data_en;
    assign  middle_slice = video_data_vld && ((current_state == LONG_PKT_DATA)&&((next_state == LONG_PKT_DATA)||(next_state == LONG_PKT_FOOTER))) && data_en;
    assign  last_slice   = video_data_vld && ((current_state == LONG_PKT_FOOTER)&&(next_state == LONG_PKT_CRC));
    
    assign  idi_data_req_pre_crc   = first_slice|middle_slice|last_slice;
    assign  idi_data_slice_pre_crc = first_slice  ? 2'b01 :
                                     middle_slice ? 2'b00 :
                                     last_slice   ? 2'b10 : 2'b00;

    assign  idi_byte_en_pre_crc    = last_slice ? 4'h3 :
                                     (first_slice|middle_slice) ? (idi_byte_en <= 7)  ? 4'h7 : 4'hf :
                                     4'b0;

    assign  swap_data_en = (first_slice|middle_slice)&(((idi_data_type == 6'h1a)||(idi_data_type == 6'h1e)) || idi_tunnel_mode_en);

    generate 
        for(i=0;i<=15;i=i+1)begin:SWAP_IDI_DATA_BK
            assign swap_idi_data[i*8+:8] = idi_data[(15-i)*8+:8];
        end
    endgenerate

    assign  idi_data_post_swap  = swap_data_en ? swap_idi_data : idi_data;

    always@(*)begin
        if(idi_byte_en_pre_crc == 4'd15)
            idi_data_post_padding_zero = {       idi_data_post_swap[127:0]};
        else if(idi_byte_en_pre_crc == 4'd14)      
            idi_data_post_padding_zero = { 8'd0 ,idi_data_post_swap[119:0]};
        else if(idi_byte_en_pre_crc == 4'd13)      
            idi_data_post_padding_zero = { 16'd0,idi_data_post_swap[111:0]};
        else if(idi_byte_en_pre_crc == 4'd12)      
            idi_data_post_padding_zero = { 24'd0,idi_data_post_swap[103:0]};
        else if(idi_byte_en_pre_crc == 4'd11)      
            idi_data_post_padding_zero = { 32'd0,idi_data_post_swap[ 95:0]};
        else if(idi_byte_en_pre_crc == 4'd10)                                
            idi_data_post_padding_zero = { 40'd0,idi_data_post_swap[ 87:0]};
        else if(idi_byte_en_pre_crc == 4'd9)                                 
            idi_data_post_padding_zero = { 48'd0,idi_data_post_swap[ 79:0]};
        else if(idi_byte_en_pre_crc == 4'd8)                                 
            idi_data_post_padding_zero = { 56'd0,idi_data_post_swap[ 71:0]};
        else if(idi_byte_en_pre_crc == 4'd7)                                 
            idi_data_post_padding_zero = { 64'd0,idi_data_post_swap[ 63:0]};
        else if(idi_byte_en_pre_crc == 4'd6)                                 
            idi_data_post_padding_zero = { 72'd0,idi_data_post_swap[ 55:0]};
        else if(idi_byte_en_pre_crc == 4'd5)                                 
            idi_data_post_padding_zero = { 80'd0,idi_data_post_swap[ 47:0]};
        else if(idi_byte_en_pre_crc == 4'd4)                                 
            idi_data_post_padding_zero = { 88'd0,idi_data_post_swap[ 39:0]};
        else if(idi_byte_en_pre_crc == 4'd3)                                 
            idi_data_post_padding_zero = { 96'd0,idi_data_post_swap[ 31:0]};
        else if(idi_byte_en_pre_crc == 4'd2)                                 
            idi_data_post_padding_zero = {104'd0,idi_data_post_swap[ 23:0]};
        else if(idi_byte_en_pre_crc == 4'd1)                                 
            idi_data_post_padding_zero = {112'd0,idi_data_post_swap[ 15:0]};
        else if(idi_byte_en_pre_crc == 4'd0)                                 
            idi_data_post_padding_zero = {120'd0,idi_data_post_swap[  7:0]};
        else
            idi_data_post_padding_zero = 128'd0;
    end
         
    assign  idi_data_pre_crc = idi_data_post_padding_zero;

    crc32_decode_wrapper_with_crc_en_app_idi u_as6d_app_rx_crc_chk (
        .clk            ( clk                                  ),
        .rst_n          ( rst_n                                ),
        .data_in        ( idi_data_pre_crc[127:0]              ),
        .data_slice_in  ( idi_data_slice_pre_crc[1:0]          ),
        .data_req_in    ( idi_data_req_pre_crc                 ),
        .byte_en_in     ( idi_byte_en_pre_crc                  ),

        .data_out       ( idi_data_post_crc[127:0]             ),
        .data_slice_out ( idi_data_slice_post_crc[1:0]         ),
        .data_req_out   (                                      ),
        .crc_err_out    ( video_crc_err_pre                    )
    );

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)
            video_crc_err <= 1'd0;
        else
            video_crc_err <= video_crc_err_pre;
    end
    
endmodule
