
module  idi_pattern_driver(/*AUTOARG*/
   // Outputs
   idi_header_en, idi_data_en, idi_byte_en, idi_word_count,
   idi_virtual_channel, idi_data_type,
   // Inputs
   clk, rst_n, reg_idi_driver_enable, reg_idi_driver_total_interval,
   reg_idi_driver_pkt_interval, reg_idi_driver_word_count,
   reg_idi_driver_virtual_channel, reg_idi_driver_data_type
   );

input                   clk                             ;
input                   rst_n                           ;
input                   reg_idi_driver_enable           ;
input       [15:0]      reg_idi_driver_total_interval   ;
input       [15:0]      reg_idi_driver_pkt_interval     ;
input       [15:0]      reg_idi_driver_word_count       ;
input       [ 3:0]      reg_idi_driver_virtual_channel  ;
input       [ 5:0]      reg_idi_driver_data_type        ;

output                  idi_header_en                   ;
output                  idi_data_en                     ;
output      [ 2:0]      idi_byte_en                     ;
output      [15:0]      idi_word_count                  ;
output      [ 3:0]      idi_virtual_channel             ;
output      [ 5:0]      idi_data_type                   ;

reg             idi_header_en                           ;
reg             idi_data_en                             ;
reg  [ 2:0]     idi_byte_en                             ;
reg  [15:0]     idi_word_count                          ;
reg  [ 3:0]     idi_virtual_channel                     ;
reg  [ 5:0]     idi_data_type                           ;

reg             total_transmission_completed            ;
reg             data_transmission_start                 ;
reg  [15:0]     word_count                              ;
reg  [15:0]     word_count_d1                           ;
wire            data_transmission_end                   ;
reg             empty_interval_valid                    ;
reg  [15:0]     empty_interval_cnt                      ;
reg             bitwise_or_empty_interval_cnt_d1        ;
wire            empty_interval_end                      ;
reg             empty_interval_start                    ;
reg  [ 4:0]     pkt_bitmap                              ;
reg  [15:0]     pkt_cnt                                 ;
wire            pkt_transmission_end                    ;
wire            data_transmission_end_lock              ;
wire            pkt_0_vld                               ;
wire            pkt_1_vld                               ;
wire            pkt_2_vld                               ;
wire            pkt_3_vld                               ;
wire            pkt_4_vld                               ;

/***total_transmission_completed rtl begin***/

/*                     __   __   __________   __   __                               _   _   __________   _   _                              */
/*    idi_header_en :_|p0|_|p1|_|    p2    |_|p3|_|p4|_____________________________| |_| |_|          |_| |_| |____________________________ */
/*                                                    ____________________________                             ____________________________ */
/* total_trans_cplt :________________________________|                            |___________________________|                             */
/*                                                                                                                                          */

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        total_transmission_completed <= 1'd0;
    else if(~reg_idi_driver_enable)
        total_transmission_completed <= 1'd0;
    else if(pkt_transmission_end)
        total_transmission_completed <= 1'd1;
    else if(empty_interval_end)
        total_transmission_completed <= 1'd0;
end
/***total_transmission_completed rtl begin***/

/***pkt send sequence rtl begin***/
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        pkt_bitmap <= 5'b00001 ;
    else if(~reg_idi_driver_enable)
        pkt_bitmap <= 5'b00001 ;
    else if(reg_idi_driver_enable&&((pkt_cnt==16'd1)&&(|(pkt_bitmap[4:0] & 5'b11011))))
        pkt_bitmap <= pkt_bitmap << 1 ;
    else if(reg_idi_driver_enable&&((pkt_cnt==16'd1)&&(pkt_bitmap[2])&&data_transmission_end_lock))
        pkt_bitmap <= pkt_bitmap << 1 ;
    else if(empty_interval_end)
        pkt_bitmap <= 5'b00001 ;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        pkt_cnt <= 16'd0;
    else if(~reg_idi_driver_enable)
        pkt_cnt <= 16'd0;
    else if((~total_transmission_completed)&&(~|pkt_cnt)&&((|pkt_bitmap[4:3])|(|pkt_bitmap[1:0]))&&reg_idi_driver_enable)
        pkt_cnt <= reg_idi_driver_pkt_interval;
    else if((~total_transmission_completed)&&((data_transmission_start|(|word_count))&(~data_transmission_end))&&(|pkt_bitmap[2])&&reg_idi_driver_enable)
        pkt_cnt <= reg_idi_driver_pkt_interval;
    else if(|pkt_cnt)
        pkt_cnt <= pkt_cnt-1'd1;
end

assign  pkt_0_vld = ((~total_transmission_completed)&&(pkt_cnt == reg_idi_driver_pkt_interval)&&pkt_bitmap[0]&&reg_idi_driver_enable);
assign  pkt_1_vld = ((~total_transmission_completed)&&(pkt_cnt == reg_idi_driver_pkt_interval)&&pkt_bitmap[1]&&reg_idi_driver_enable);
assign  pkt_2_vld = ((~total_transmission_completed)&&(data_transmission_start|(|word_count)) &&pkt_bitmap[2]&&reg_idi_driver_enable);
assign  pkt_3_vld = ((~total_transmission_completed)&&(pkt_cnt == reg_idi_driver_pkt_interval)&&pkt_bitmap[3]&&reg_idi_driver_enable);
assign  pkt_4_vld = ((~total_transmission_completed)&&(pkt_cnt == reg_idi_driver_pkt_interval)&&pkt_bitmap[4]&&reg_idi_driver_enable);

assign  pkt_transmission_end = ((~total_transmission_completed)&&(pkt_cnt==16'd1)&&(pkt_bitmap[4])&&reg_idi_driver_enable);

/***pkt send sequence rtl end***/

/***pkt_2 transmission rtl begin***/
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        data_transmission_start <= 1'd0 ;
    else if(~reg_idi_driver_enable)
        data_transmission_start <= 1'd0 ;
    else if(data_transmission_start)
        data_transmission_start <= ~data_transmission_start ;
    else if((~total_transmission_completed)&&(~|word_count)&&pkt_bitmap[2]&&reg_idi_driver_enable&&(~data_transmission_end_lock))
        data_transmission_start <= 1'd1 ;
end

reg data_transmission_valid     ;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        data_transmission_valid <= 1'd0;
    else if(~reg_idi_driver_enable)
        data_transmission_valid <= 1'd0;
    else if(data_transmission_start)
        data_transmission_valid <= 1'd1;
    else if(((|word_count[2:0])& (~|word_count[15:3]))||((~|word_count[2:0])& (word_count[15:3]==13'd1)))
        data_transmission_valid <= 1'd0;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        word_count <= 16'd0;
    else if(~reg_idi_driver_enable)
        word_count <= 16'd0;
    else if(data_transmission_start)
        word_count <= reg_idi_driver_word_count;
    else if(|word_count[15:3])
        word_count[15:3] <= word_count[15:3]-1'd1;
    else if((|word_count[2:0])& (~|word_count[15:3]))
        word_count <= 16'd0;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        word_count_d1 <= 16'd0;
    else if(~reg_idi_driver_enable)
        word_count_d1 <= 16'd0;
    else 
        word_count_d1 <= word_count;
end

assign  data_transmission_end = data_transmission_valid && (((|word_count[2:0])& (~|word_count[15:3]))||((~|word_count[2:0])& (word_count[15:3]==13'd1)))  ;

reg data_transmission_end_save;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        data_transmission_end_save <= 1'd0;
    else if(~reg_idi_driver_enable)
        data_transmission_end_save <= 1'd0;
    else if(data_transmission_end)
        data_transmission_end_save <= 1'd1;
    else if(empty_interval_end)
        data_transmission_end_save <= 1'd0;
end

assign  data_transmission_end_lock = data_transmission_end | data_transmission_end_save  ;

/***pkt_2 transmission rtl end***/

/***empty_interval rtl begin***/
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        empty_interval_start <= 1'd0;
    else if(~reg_idi_driver_enable)
        empty_interval_start <= 1'd0;
    else if(pkt_transmission_end)
        empty_interval_start <= 1'd1;
    else 
        empty_interval_start <= 1'd0;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        empty_interval_valid <= 1'd0 ;
    else if(~reg_idi_driver_enable)
        empty_interval_valid <= 1'd0 ;
    else if(empty_interval_start)
        empty_interval_valid <= 1'd1 ;
    else if((~empty_interval_start)&&(empty_interval_cnt==1'd1))
        empty_interval_valid <= 1'd0 ;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        empty_interval_cnt <= 16'd0;
    else if(~reg_idi_driver_enable)
        empty_interval_cnt <= 16'd0;
    else if(empty_interval_start)
        empty_interval_cnt <= reg_idi_driver_total_interval - 16'd3;
    else if(|empty_interval_cnt)
        empty_interval_cnt <= empty_interval_cnt-1'd1;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        bitwise_or_empty_interval_cnt_d1 <= 16'd0;
    else if(~reg_idi_driver_enable)
        bitwise_or_empty_interval_cnt_d1 <= 16'd0;
    else if(|empty_interval_cnt)
        bitwise_or_empty_interval_cnt_d1 <= 1'd1;
    else 
        bitwise_or_empty_interval_cnt_d1 <= 1'd0;
end

assign  empty_interval_end =  (bitwise_or_empty_interval_cnt_d1) && (~|empty_interval_cnt)  ;

/***empty_interval rtl end***/

/***idi behavier rtl begin***/
always@(*)begin
    if(pkt_2_vld)begin
        if(|word_count[15:3])
            idi_byte_en = 3'b111;
        else if((|word_count[2:0])& (~|word_count[15:3]))
            idi_byte_en = word_count[2:0] - 1'd1;
        else
            idi_byte_en = 3'd0;
    end
    else begin
        idi_byte_en = 3'd0;
    end
end

always@(*)begin
    if(pkt_0_vld|pkt_1_vld|pkt_2_vld|pkt_3_vld|pkt_4_vld)begin
        idi_header_en = 1'd1;
    end
    else begin
        idi_header_en = 1'd0;
    end
end

always@(*)begin
    if(pkt_2_vld)begin
        if(|word_count)
            idi_data_en = 1'd1;
        else
            idi_data_en = 1'd0;
    end
    else begin
        idi_data_en = 1'd0;
    end
end

always@(*)begin
    if(pkt_2_vld)begin
        idi_word_count = reg_idi_driver_word_count;
    end
    else begin
        idi_word_count = 16'd0;
    end
end

always@(*)begin
    if(pkt_0_vld|pkt_1_vld|pkt_2_vld|pkt_3_vld|pkt_4_vld)begin
        idi_virtual_channel = reg_idi_driver_virtual_channel;
    end
    else begin
        idi_virtual_channel = 16'd0;
    end
end

always@(*)begin
    if(pkt_0_vld)begin
        idi_data_type = 6'd0;
    end
    else if(pkt_1_vld)begin
        idi_data_type = 6'd2;
    end
    else if(pkt_2_vld)begin
        idi_data_type = reg_idi_driver_data_type;
    end
    else if(pkt_3_vld)begin
        idi_data_type = 6'd3;
    end
    else if(pkt_4_vld)begin
        idi_data_type = 6'd1;
    end
    else begin
        idi_data_type = 16'd0;
    end
end
/***idi behavier rtl end***/

endmodule
