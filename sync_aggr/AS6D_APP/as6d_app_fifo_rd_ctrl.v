
//`include "as6d_mep_all_includes.vh"
`include "as6d_app_all_includes.vh"
module as6d_app_fifo_rd_ctrl #(
    parameter    VIDEO_DATA_SIZE = 140
)(/*AUTOARG*/
   // Outputs
   ack, line_end, video_data_fifo_rd, video_data, video_data_vld,
   current_state, ack_pre, ack_vld_aggregator, sram_lcrc_err,
   // Inputs
   fifo_rdclk, fifo_rdclk_rst_n, up_state, video_data_fifo_empty,
   video_data_fifo_rdata, reg_video_fifo_empty_depend_cnt_mux,
   pkt_aggr_id, pkt_aggr_id_vld, reg_app_pkt_crc_gen_dis,
   reg_sram_lcrc_err_oen
   );

input                                   fifo_rdclk                          ;
input                                   fifo_rdclk_rst_n                    ;
input                                   up_state                            ;
input                                   video_data_fifo_empty               ;
input      [(VIDEO_DATA_SIZE-1):0]      video_data_fifo_rdata               ;
input                                   reg_video_fifo_empty_depend_cnt_mux ;
input      [3:0]                        pkt_aggr_id                         ;
input                                   pkt_aggr_id_vld                     ;
input                                   reg_app_pkt_crc_gen_dis             ;
input                                   reg_sram_lcrc_err_oen               ;

output                                  ack                                 ;
output                                  line_end                            ;
output                                  video_data_fifo_rd                  ;
output     [(VIDEO_DATA_SIZE-1):0]      video_data                          ;
output                                  video_data_vld                      ;
output     [2:0]                        current_state                       ;
output                                  ack_pre                             ;
output     [3:0]                        ack_vld_aggregator                  ;
output                                  sram_lcrc_err                       ;

//signal define
localparam    APP_RX_SILENT     = 3'd0                      ;
localparam    APP_RX_IDLE       = 3'd1                      ;
localparam    APP_RX_SHORT      = 3'd2                      ; 
localparam    APP_RX_HEADER     = 3'd3                      ; 
localparam    APP_RX_DATA       = 3'd4                      ; 
localparam    APP_RX_FOOTER     = 3'd5                      ; 
localparam    APP_RX_LINE_CRC   = 3'd6                      ; 
localparam    APP_RX_LINE_END   = 3'd7                      ; 

app_header  rd_ctrl_app_header                              ;
app_data    rd_ctrl_app_data                                ;

reg                         ack                             ;
wire                        line_end                        ;
reg                         video_data_fifo_rd              ;
reg [(VIDEO_DATA_SIZE-1):0] video_data                      ;
reg                         video_data_vld                  ;
reg [2:0]                   current_state                   ;
wire                        ack_pre                         ;
reg [3:0]                   ack_vld_aggregator              ;
wire                        sram_lcrc_err                   ;

genvar                      j                               ;
wire                        data_en                         ;
wire                        short_en                        ;
wire                        footer_en                       ;
wire                        header_en                       ;
wire [5:0]                  data_type                       ;
wire                        sp_ls                           ;
wire                        sp_le                           ;
wire                        sp_fs                           ;
wire                        sp_fe                           ;
wire                        lp_ps                           ;
wire                        lp_pf                           ;
wire                        lp_payload                      ;
wire                        empty                           ;
wire                        sp_pkt                          ;
wire                        lp_ps_pkt                       ;
wire                        lp_pf_pkt                       ;
wire                        lp_payload_pkt                  ;
wire                        lp_crc_pkt                      ;
reg  [2:0]                  next_state                      ;
reg                         fifo_rd_junk                    ;
wire                        junk_clear                      ;
wire             			crc_out_crc                     ;
reg                         lcrc_in_data_vld                ;
reg                         lcrc_in_crc_vld                 ;
wire [31:0]                 lcrc_in_crc                     ;
wire                        lcrc_out_crc_err                ;
wire                        video_crc_err                   ;

//logic design
assign    rd_ctrl_app_header  =    video_data_fifo_rdata[135:0];
assign    rd_ctrl_app_data    =    video_data_fifo_rdata[135:0];
assign    {data_en,short_en,footer_en,header_en} = video_data_fifo_rdata[135:132];

//observer data
assign    sp_ls         =    (~empty)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_LINE_START);
assign    sp_le         =    (~empty)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_LINE_END);
assign    sp_fs         =    (~empty)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_FRAME_START);
assign    sp_fe         =    (~empty)&short_en&(rd_ctrl_app_header.short_flag)&&(rd_ctrl_app_header.data_type==`CSI_FRAME_END);
assign    lp_ps         =    (~empty)&header_en ;
assign    lp_pf         =    (~empty)&footer_en ;
assign    lp_payload    =    (~empty)&data_en ;
assign    empty         =    video_data_fifo_empty;

//state machine jump condition
assign  sp_pkt          = ({data_en,short_en,footer_en,header_en} == 4'b0100)&&(rd_ctrl_app_header.data_type[5:2]==4'd0);
assign  lp_ps_pkt       = ({data_en,short_en,footer_en,header_en} == 4'b0001);
assign  lp_pf_pkt       = (        {short_en,footer_en,header_en} ==  3'b010);
assign  lp_payload_pkt  = ({data_en,short_en,          header_en} == 3'b10_0);
assign  lp_crc_pkt      = ({data_en,short_en,footer_en,header_en} == 4'b0000);

//state machine body
always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(!fifo_rdclk_rst_n)begin
        current_state <= 3'b0;
    end
    else begin
        current_state <= next_state;
    end
end

always @(*)begin
    case(current_state)
        APP_RX_SILENT:begin
            if(up_state)
                next_state =  APP_RX_IDLE;
            else 
                next_state =  APP_RX_SILENT;
        end
        APP_RX_IDLE:begin
            if(~empty)
                if(sp_pkt)
                    next_state = APP_RX_SHORT;
                else if(lp_ps_pkt)
                    next_state = APP_RX_HEADER;
                else 
                    next_state = APP_RX_IDLE;
            else 
                next_state = APP_RX_IDLE;
        end
        APP_RX_SHORT:begin
                next_state = reg_video_fifo_empty_depend_cnt_mux ? APP_RX_LINE_END : APP_RX_IDLE;
        end
        APP_RX_HEADER:begin
            if(~empty)
                if(lp_pf_pkt)
                    next_state = APP_RX_FOOTER;
                else if(lp_payload_pkt)
                    next_state = APP_RX_DATA;
                else
                    next_state = APP_RX_IDLE;
            else
                    next_state = APP_RX_DATA;
        end
        APP_RX_DATA:begin
            if(~empty)
                if(lp_pf_pkt)
                    next_state = APP_RX_FOOTER;
                else if(lp_payload_pkt)
                    next_state = APP_RX_DATA;
                else
                    next_state = APP_RX_IDLE;
            else
                    next_state = APP_RX_DATA;
        end
        APP_RX_FOOTER:begin
            if(reg_app_pkt_crc_gen_dis)
                next_state = APP_RX_LINE_END;
            else begin
                if(~empty)
                    if(lp_crc_pkt)
                        next_state = APP_RX_LINE_CRC;
                    else
                        next_state = APP_RX_IDLE;
                else
                    next_state = APP_RX_FOOTER;
            end

        end
        APP_RX_LINE_CRC:begin
            next_state = APP_RX_LINE_END;
        end
        APP_RX_LINE_END:begin
            next_state = APP_RX_SILENT;
        end
        default:begin
            next_state = APP_RX_IDLE;
        end
    endcase
end

//junk data read
always@(*)begin
    if(current_state == APP_RX_IDLE)begin
        if(~empty)
            if(sp_pkt)
                fifo_rd_junk = 1'd0;
            else if(lp_ps_pkt)
                fifo_rd_junk = 1'd0;
            else 
                fifo_rd_junk = 1'd1;
        else 
            fifo_rd_junk = 1'd0; 
    end
    else
        fifo_rd_junk = 1'd0;
end

assign  junk_clear  =   fifo_rd_junk;

//fifo_read en = normal data rd | junk data rd
always@(*)begin
    if (~empty)
        if((next_state == APP_RX_SHORT)||(next_state == APP_RX_DATA)||(next_state == APP_RX_FOOTER)||(next_state == APP_RX_HEADER)||(next_state == APP_RX_LINE_CRC))
            video_data_fifo_rd = 1'd1;
        else if(fifo_rd_junk)
            video_data_fifo_rd = 1'd1;
        else
            video_data_fifo_rd = 1'd0;
    else
        video_data_fifo_rd = 1'd0;
end

//module data out
always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        video_data_vld <= 1'd0;
    else 
        video_data_vld <= video_data_fifo_rd&(~junk_clear) ? 1'd1 : 1'd0;
end

always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        video_data <= {(VIDEO_DATA_SIZE){1'd0}};
    else if (video_data_fifo_rd&(~junk_clear))
        video_data <= video_data_fifo_rdata;
end

always@(posedge fifo_rdclk or negedge fifo_rdclk_rst_n)begin
    if(~fifo_rdclk_rst_n)
        ack <= 1'd0;
    else if((current_state == APP_RX_SILENT)&&(up_state))
        ack <= 1'd1;
    else
        ack <= 1'd0;
end

assign  ack_pre = ((current_state == APP_RX_SILENT)&&(up_state));

assign line_end = (current_state==APP_RX_LINE_END) ? 1'd1 : 1'd0;

//ack_vld for sch within aggr_id
always@(*)begin
    if(ack)
        case(pkt_aggr_id)
            4'd0: ack_vld_aggregator = pkt_aggr_id_vld ? 4'b0001 : 4'b0000 ;
            4'd1: ack_vld_aggregator = pkt_aggr_id_vld ? 4'b0010 : 4'b0000 ;
            4'd2: ack_vld_aggregator = pkt_aggr_id_vld ? 4'b0100 : 4'b0000 ;
            4'd3: ack_vld_aggregator = pkt_aggr_id_vld ? 4'b1000 : 4'b0000 ;
            default:ack_vld_aggregator = 4'b0000 ;
        endcase
    else
        ack_vld_aggregator = 4'b0000;
end

assign  sram_lcrc_err = reg_sram_lcrc_err_oen ? video_crc_err : 1'd0 ;

/*as6d_app_crc_chk_lane AUTO_TEMPLATE(
    .clk(fifo_rdclk),
    .rst_n(fifo_rdclk_rst_n),
	.pcs2mep_data_stat(reg_sram_lcrc_err_oen));
    .video_crc_err	(video_crc_err),
)*/
as6d_app_crc_chk_lane u_as6d_app_crc_chk_lane(/*AUTOINST*/
					      // Outputs
					      .video_crc_err	(video_crc_err),
					      // Inputs
					      .clk		(fifo_rdclk),	 // Templated
					      .rst_n		(fifo_rdclk_rst_n), // Templated
					      .video_data_vld	(video_data_vld),
					      .video_data	(video_data[139:0]),
					      .pcs2mep_data_stat(reg_sram_lcrc_err_oen)); // Templated

endmodule
