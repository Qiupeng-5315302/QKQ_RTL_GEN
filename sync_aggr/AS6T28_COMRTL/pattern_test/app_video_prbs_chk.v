
module app_video_prbs_chk #(
    parameter   DATA_W = 64,
    parameter   BYTE_W = $clog2(DATA_W/8)
)(/*AUTOARG*/
   // Outputs
   reg_rd_vprbs_rx_check, reg_rd_vprbs_rx_fail, reg_rd_vprbs_rx_err,
   // Inputs
   clk, rst_n, prbs_data_in, reg_vprbs_rx_chk_en, reg_vprbs_rx_mode,
   reg_vprbs_rx_order, reg_vprbs_rx_load, reg_vprbs_rx_lock_continue,
   reg_vprbs_rx_uncheck_tolerance, reg_vprbs_rx_err_clear,
   reg_vprbs_rx_locked_match_cnt, rx_byte_en, rx_data_en,
   rx_header_en, rx_data_type
   );

/***IO define***/
input                           clk                                 ;
input                           rst_n                               ;
input [DATA_W-1:0]              prbs_data_in                        ;
input                           reg_vprbs_rx_chk_en                 ;
input [2:0]                     reg_vprbs_rx_mode                   ;
input                           reg_vprbs_rx_order                  ;//1= invert, 0= normal (default)
input                           reg_vprbs_rx_load                   ;
input                           reg_vprbs_rx_lock_continue          ;//1: continous locked_match_cnt match will trigger lock; 0: total locked_match_cnt match will trigger lock
input [3:0]                     reg_vprbs_rx_uncheck_tolerance      ;
input                           reg_vprbs_rx_err_clear              ;
input [3:0]                     reg_vprbs_rx_locked_match_cnt       ;
input [BYTE_W-1:0]              rx_byte_en                          ;
input                           rx_data_en                          ;
input                           rx_header_en                        ;
input [5:0]                     rx_data_type                        ;

output                          reg_rd_vprbs_rx_check               ;
output                          reg_rd_vprbs_rx_fail                ;
output[31:0]                    reg_rd_vprbs_rx_err                 ;
/***signal define***/
wire                            vprbs_rx_check_pulse                ;
wire                            vprbs_rx_fail_pulse                 ;
wire  [DATA_W-1:0]              prbs_local_inv_post                 ;
reg   [DATA_W-1:0]              cal_prbs                            ;
reg   [DATA_W-1:0]              lcpb_d                              ;   
reg   [DATA_W-1:0]              lcpb_q                              ;
wire                            comp_res                            ;
wire  [DATA_W-1:0]              inv_prbsin_64                       ; 
wire  [DATA_W-1:0]              inv_prbsin_32                       ; 
wire                            match                               ;
reg                             locked_d                            ;
reg                             locked_q                            ;
reg   [3:0]                     cnt_d                               ;
reg   [3:0]                     cnt_q                               ;
wire  [DATA_W-1:0]              cal_prbs_7                          ;
wire  [DATA_W-1:0]              cal_prbs_11                         ;
wire  [DATA_W-1:0]              cal_prbs_9                          ;
wire  [DATA_W-1:0]              cal_prbs_15                         ;
wire  [DATA_W-1:0]              cal_prbs_23                         ;
wire  [DATA_W-1:0]              cal_prbs_31                         ;
wire  [DATA_W-1:0]              prbs_in_inv_post                    ;
reg   [DATA_W-1:0]              prbs_in_shft_post                   ;
reg   [DATA_W-1:0]              prbs_local_shft_post                ;
reg   [DATA_W-1:0]              prbs_in_shft_post_load              ;
reg   [DATA_W-1:0]              prbs_local_shft_post_load           ;
reg   [31:0]                    reg_rd_vprbs_rx_err                 ;
wire                            reg_vprbs_rx_err_clear              ;
reg                             rx_header_en_d1                     ;
wire                            check_restart                       ;
reg   [3:0]                     rx_uncheck_tolerance_cnt            ;
wire                            force_check                         ;
wire  [DATA_W-1:0]              comp_res_xor                        ;
wire  [$clog2(DATA_W):0]        err_sim_d                           ;
wire  [32:0]                    vprbs_err_d                         ;
wire                            reg_vprbs_rx_unswap                 ;
wire  [DATA_W-1:0]              prbs_in_swap_post                   ;
wire                            data_type_unswap_flag               ;
reg                             reg_rd_vprbs_rx_check               ;
reg                             reg_rd_vprbs_rx_fail                ;
wire                            vprbs_rx_err_restart                ;
/***logic design***/

/***force_check rtl begin***/
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        rx_uncheck_tolerance_cnt <= 4'd0;
    else if(check_restart)
        rx_uncheck_tolerance_cnt <= 4'd0;
    else if(reg_vprbs_rx_chk_en & (rx_data_en))
        rx_uncheck_tolerance_cnt <= (rx_uncheck_tolerance_cnt == reg_vprbs_rx_uncheck_tolerance) ? rx_uncheck_tolerance_cnt : rx_uncheck_tolerance_cnt + 1'd1;
end

assign force_check = (rx_uncheck_tolerance_cnt >= reg_vprbs_rx_uncheck_tolerance);
/***force_check rtl end***/

/***check_restart rtl begin***/
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        rx_header_en_d1 <= 1'd0;
    else
        rx_header_en_d1 <= rx_header_en;
end

assign  check_restart = ~rx_header_en_d1 && rx_header_en;
/***check_restart rtl end***/

//`CSI_YUV420_8_BIT_LEGACY  :data_type = 6'h1a
//`CSI_YUV422_8_BIT         :data_type = 6'h1e
//
/***match rtl begin***/
generate if(DATA_W==64)begin: prbs_swap_64_bk
    assign prbs_in_swap_post = prbs_data_in  ;
end
else if(DATA_W==128)begin: prbs_swap_128_bk
    assign reg_vprbs_rx_unswap = (rx_byte_en <= 4'd7);
    assign data_type_unswap_flag = ((rx_data_type == 6'h1a) || (rx_data_type == 6'h1e));
    assign prbs_in_swap_post = (reg_vprbs_rx_unswap | data_type_unswap_flag) ? prbs_data_in : {prbs_data_in[63:0],prbs_data_in[127:64]} ;
end
endgenerate

assign prbs_in_inv_post = reg_vprbs_rx_order ? ~prbs_in_swap_post : prbs_in_swap_post ;

generate if(DATA_W==64)begin: prbs_compare_64_bk
    always@(*)begin
        if((rx_data_type == 6'h1a) || (rx_data_type == 6'h1e))begin
            case(rx_byte_en)
            3'd0:prbs_in_shft_post = {prbs_in_inv_post[63:56],56'd0};
            3'd1:prbs_in_shft_post = {prbs_in_inv_post[63:48],48'd0};
            3'd2:prbs_in_shft_post = {prbs_in_inv_post[63:40],40'd0};
            3'd3:prbs_in_shft_post = {prbs_in_inv_post[63:32],32'd0};
            3'd4:prbs_in_shft_post = {prbs_in_inv_post[63:24],24'd0};
            3'd5:prbs_in_shft_post = {prbs_in_inv_post[63:16],16'd0};
            3'd6:prbs_in_shft_post = {prbs_in_inv_post[63: 8], 8'd0};
            3'd7:prbs_in_shft_post = prbs_in_inv_post[63:0];
            endcase
        end
        else begin
            case(rx_byte_en)
            3'd0:prbs_in_shft_post = {56'd0,prbs_in_inv_post[ 7:0]};
            3'd1:prbs_in_shft_post = {48'd0,prbs_in_inv_post[15:0]};
            3'd2:prbs_in_shft_post = {40'd0,prbs_in_inv_post[23:0]};
            3'd3:prbs_in_shft_post = {32'd0,prbs_in_inv_post[31:0]};
            3'd4:prbs_in_shft_post = {24'd0,prbs_in_inv_post[39:0]};
            3'd5:prbs_in_shft_post = {16'd0,prbs_in_inv_post[47:0]};
            3'd6:prbs_in_shft_post = { 8'd0,prbs_in_inv_post[55:0]};
            3'd7:prbs_in_shft_post = prbs_in_inv_post[63:0];
            endcase
        end
    end

    always@(*)begin
        case(rx_byte_en)
        3'd0:prbs_in_shft_post_load = {56'd0,prbs_in_inv_post[63:56]};
        3'd1:prbs_in_shft_post_load = {48'd0,prbs_in_inv_post[63:48]};
        3'd2:prbs_in_shft_post_load = {40'd0,prbs_in_inv_post[63:40]};
        3'd3:prbs_in_shft_post_load = {32'd0,prbs_in_inv_post[63:32]};
        3'd4:prbs_in_shft_post_load = {24'd0,prbs_in_inv_post[63:24]};
        3'd5:prbs_in_shft_post_load = {16'd0,prbs_in_inv_post[63:16]};
        3'd6:prbs_in_shft_post_load = { 8'd0,prbs_in_inv_post[63: 8]};
        3'd7:prbs_in_shft_post_load = prbs_in_inv_post[63:0];
        endcase
    end

    always@(*)begin
        if((rx_data_type == 6'h1a) || (rx_data_type == 6'h1e))begin
            case(rx_byte_en)
            3'd0:prbs_local_shft_post = {prbs_local_inv_post[63:56],56'd0};
            3'd1:prbs_local_shft_post = {prbs_local_inv_post[63:48],48'd0};
            3'd2:prbs_local_shft_post = {prbs_local_inv_post[63:40],40'd0};
            3'd3:prbs_local_shft_post = {prbs_local_inv_post[63:32],32'd0};
            3'd4:prbs_local_shft_post = {prbs_local_inv_post[63:24],24'd0};
            3'd5:prbs_local_shft_post = {prbs_local_inv_post[63:16],16'd0};
            3'd6:prbs_local_shft_post = {prbs_local_inv_post[63: 8], 8'd0};
            3'd7:prbs_local_shft_post = prbs_local_inv_post[63:0];
            endcase
        end
        else begin
            case(rx_byte_en)
            3'd0:prbs_local_shft_post = {56'd0,prbs_local_inv_post[63:56]};
            3'd1:prbs_local_shft_post = {48'd0,prbs_local_inv_post[63:48]};
            3'd2:prbs_local_shft_post = {40'd0,prbs_local_inv_post[63:40]};
            3'd3:prbs_local_shft_post = {32'd0,prbs_local_inv_post[63:32]};
            3'd4:prbs_local_shft_post = {24'd0,prbs_local_inv_post[63:24]};
            3'd5:prbs_local_shft_post = {16'd0,prbs_local_inv_post[63:16]};
            3'd6:prbs_local_shft_post = { 8'd0,prbs_local_inv_post[63: 8]};
            3'd7:prbs_local_shft_post = prbs_local_inv_post[63:0];
            endcase
        end
    end

    always@(*)begin
        case(rx_byte_en)
        3'd0:prbs_local_shft_post_load = {56'd0,prbs_local_inv_post[63:56]};
        3'd1:prbs_local_shft_post_load = {48'd0,prbs_local_inv_post[63:48]};
        3'd2:prbs_local_shft_post_load = {40'd0,prbs_local_inv_post[63:40]};
        3'd3:prbs_local_shft_post_load = {32'd0,prbs_local_inv_post[63:32]};
        3'd4:prbs_local_shft_post_load = {24'd0,prbs_local_inv_post[63:24]};
        3'd5:prbs_local_shft_post_load = {16'd0,prbs_local_inv_post[63:16]};
        3'd6:prbs_local_shft_post_load = { 8'd0,prbs_local_inv_post[63: 8]};
        3'd7:prbs_local_shft_post_load = prbs_local_inv_post[63:0];
        endcase
    end

end
else if(DATA_W==128)begin: prbs_compare_128_bk
    always@(*)begin
        if((rx_data_type == 6'h1a) || (rx_data_type == 6'h1e))begin
            case(rx_byte_en)
            4'd0 :prbs_in_shft_post = {prbs_in_inv_post[127:120],120'd0};
            4'd1 :prbs_in_shft_post = {prbs_in_inv_post[127:112],112'd0};
            4'd2 :prbs_in_shft_post = {prbs_in_inv_post[127:104],104'd0};
            4'd3 :prbs_in_shft_post = {prbs_in_inv_post[127: 96], 96'd0};
            4'd4 :prbs_in_shft_post = {prbs_in_inv_post[127: 88], 88'd0};
            4'd5 :prbs_in_shft_post = {prbs_in_inv_post[127: 80], 80'd0};
            4'd6 :prbs_in_shft_post = {prbs_in_inv_post[127: 72], 72'd0};
            4'd7 :prbs_in_shft_post = {prbs_in_inv_post[127: 64], 64'd0};
            4'd8 :prbs_in_shft_post = {prbs_in_inv_post[127: 56], 56'd0};
            4'd9 :prbs_in_shft_post = {prbs_in_inv_post[127: 48], 48'd0};
            4'd10:prbs_in_shft_post = {prbs_in_inv_post[127: 40], 40'd0};
            4'd11:prbs_in_shft_post = {prbs_in_inv_post[127: 32], 32'd0};
            4'd12:prbs_in_shft_post = {prbs_in_inv_post[127: 24], 24'd0};
            4'd13:prbs_in_shft_post = {prbs_in_inv_post[127: 16], 16'd0};
            4'd14:prbs_in_shft_post = {prbs_in_inv_post[127:  8],  8'd0};
            4'd15:prbs_in_shft_post = prbs_in_inv_post[127:0];
            endcase
        end
        else begin
            case(rx_byte_en)
            4'd0 :prbs_in_shft_post = {120'd0,prbs_in_inv_post[  7:0]};
            4'd1 :prbs_in_shft_post = {112'd0,prbs_in_inv_post[ 15:0]};
            4'd2 :prbs_in_shft_post = {104'd0,prbs_in_inv_post[ 23:0]};
            4'd3 :prbs_in_shft_post = { 96'd0,prbs_in_inv_post[ 31:0]};
            4'd4 :prbs_in_shft_post = { 88'd0,prbs_in_inv_post[ 39:0]};
            4'd5 :prbs_in_shft_post = { 80'd0,prbs_in_inv_post[ 47:0]};
            4'd6 :prbs_in_shft_post = { 72'd0,prbs_in_inv_post[ 55:0]};
            4'd7 :prbs_in_shft_post = { 64'd0,prbs_in_inv_post[ 63:0]};
            4'd8 :prbs_in_shft_post = { 56'd0,prbs_in_inv_post[ 71:0]};
            4'd9 :prbs_in_shft_post = { 48'd0,prbs_in_inv_post[ 79:0]};
            4'd10:prbs_in_shft_post = { 40'd0,prbs_in_inv_post[ 87:0]};
            4'd11:prbs_in_shft_post = { 32'd0,prbs_in_inv_post[ 95:0]};
            4'd12:prbs_in_shft_post = { 24'd0,prbs_in_inv_post[103:0]};
            4'd13:prbs_in_shft_post = { 16'd0,prbs_in_inv_post[111:0]};
            4'd14:prbs_in_shft_post = {  8'd0,prbs_in_inv_post[119:0]};
            4'd15:prbs_in_shft_post = prbs_in_inv_post[127:0];
            endcase
        end
    end

    always@(*)begin
        case(rx_byte_en)
        4'd0 :prbs_in_shft_post_load = {120'd0,prbs_in_inv_post[127:120]};
        4'd1 :prbs_in_shft_post_load = {112'd0,prbs_in_inv_post[127:112]};
        4'd2 :prbs_in_shft_post_load = {104'd0,prbs_in_inv_post[127:104]};
        4'd3 :prbs_in_shft_post_load = { 96'd0,prbs_in_inv_post[127: 96]};
        4'd4 :prbs_in_shft_post_load = { 88'd0,prbs_in_inv_post[127: 88]};
        4'd5 :prbs_in_shft_post_load = { 80'd0,prbs_in_inv_post[127: 80]};
        4'd6 :prbs_in_shft_post_load = { 72'd0,prbs_in_inv_post[127: 72]};
        4'd7 :prbs_in_shft_post_load = { 64'd0,prbs_in_inv_post[127: 64]};
        4'd8 :prbs_in_shft_post_load = { 56'd0,prbs_in_inv_post[127: 56]};
        4'd9 :prbs_in_shft_post_load = { 48'd0,prbs_in_inv_post[127: 48]};
        4'd10:prbs_in_shft_post_load = { 40'd0,prbs_in_inv_post[127: 40]};
        4'd11:prbs_in_shft_post_load = { 32'd0,prbs_in_inv_post[127: 32]};
        4'd12:prbs_in_shft_post_load = { 24'd0,prbs_in_inv_post[127: 24]};
        4'd13:prbs_in_shft_post_load = { 16'd0,prbs_in_inv_post[127: 16]};
        4'd14:prbs_in_shft_post_load = {  8'd0,prbs_in_inv_post[127:  8]};
        4'd15:prbs_in_shft_post_load = prbs_in_inv_post[127:0];
        endcase
    end

    always@(*)begin
        if((rx_data_type == 6'h1a) || (rx_data_type == 6'h1e))begin
            case(rx_byte_en)
            4'd0 :prbs_local_shft_post = {prbs_local_inv_post[127:120],120'd0};
            4'd1 :prbs_local_shft_post = {prbs_local_inv_post[127:112],112'd0};
            4'd2 :prbs_local_shft_post = {prbs_local_inv_post[127:104],104'd0};
            4'd3 :prbs_local_shft_post = {prbs_local_inv_post[127: 96], 96'd0};
            4'd4 :prbs_local_shft_post = {prbs_local_inv_post[127: 88], 88'd0};
            4'd5 :prbs_local_shft_post = {prbs_local_inv_post[127: 80], 80'd0};
            4'd6 :prbs_local_shft_post = {prbs_local_inv_post[127: 72], 72'd0};
            4'd7 :prbs_local_shft_post = {prbs_local_inv_post[127: 64], 64'd0};
            4'd8 :prbs_local_shft_post = {prbs_local_inv_post[127: 56], 56'd0};
            4'd9 :prbs_local_shft_post = {prbs_local_inv_post[127: 48], 48'd0};
            4'd10:prbs_local_shft_post = {prbs_local_inv_post[127: 40], 40'd0};
            4'd11:prbs_local_shft_post = {prbs_local_inv_post[127: 32], 32'd0};
            4'd12:prbs_local_shft_post = {prbs_local_inv_post[127: 24], 24'd0};
            4'd13:prbs_local_shft_post = {prbs_local_inv_post[127: 16], 16'd0};
            4'd14:prbs_local_shft_post = {prbs_local_inv_post[127:  8],  8'd0};
            4'd15:prbs_local_shft_post = prbs_local_inv_post[127:0];
            endcase
        end
        else begin
            case(rx_byte_en)
            4'd0 :prbs_local_shft_post = {120'd0,prbs_local_inv_post[127:120]};
            4'd1 :prbs_local_shft_post = {112'd0,prbs_local_inv_post[127:112]};
            4'd2 :prbs_local_shft_post = {104'd0,prbs_local_inv_post[127:104]};
            4'd3 :prbs_local_shft_post = { 96'd0,prbs_local_inv_post[127: 96]};
            4'd4 :prbs_local_shft_post = { 88'd0,prbs_local_inv_post[127: 88]};
            4'd5 :prbs_local_shft_post = { 80'd0,prbs_local_inv_post[127: 80]};
            4'd6 :prbs_local_shft_post = { 72'd0,prbs_local_inv_post[127: 72]};
            4'd7 :prbs_local_shft_post = { 64'd0,prbs_local_inv_post[127: 64]};
            4'd8 :prbs_local_shft_post = { 56'd0,prbs_local_inv_post[127: 56]};
            4'd9 :prbs_local_shft_post = { 48'd0,prbs_local_inv_post[127: 48]};
            4'd10:prbs_local_shft_post = { 40'd0,prbs_local_inv_post[127: 40]};
            4'd11:prbs_local_shft_post = { 32'd0,prbs_local_inv_post[127: 32]};
            4'd12:prbs_local_shft_post = { 24'd0,prbs_local_inv_post[127: 24]};
            4'd13:prbs_local_shft_post = { 16'd0,prbs_local_inv_post[127: 16]};
            4'd14:prbs_local_shft_post = {  8'd0,prbs_local_inv_post[127:  8]};
            4'd15:prbs_local_shft_post = prbs_local_inv_post[127:0];
            endcase
        end
    end

    always@(*)begin
        case(rx_byte_en)
            4'd0 :prbs_local_shft_post_load = {120'd0,prbs_local_inv_post[127:120]};
            4'd1 :prbs_local_shft_post_load = {112'd0,prbs_local_inv_post[127:112]};
            4'd2 :prbs_local_shft_post_load = {104'd0,prbs_local_inv_post[127:104]};
            4'd3 :prbs_local_shft_post_load = { 96'd0,prbs_local_inv_post[127: 96]};
            4'd4 :prbs_local_shft_post_load = { 88'd0,prbs_local_inv_post[127: 88]};
            4'd5 :prbs_local_shft_post_load = { 80'd0,prbs_local_inv_post[127: 80]};
            4'd6 :prbs_local_shft_post_load = { 72'd0,prbs_local_inv_post[127: 72]};
            4'd7 :prbs_local_shft_post_load = { 64'd0,prbs_local_inv_post[127: 64]};
            4'd8 :prbs_local_shft_post_load = { 56'd0,prbs_local_inv_post[127: 56]};
            4'd9 :prbs_local_shft_post_load = { 48'd0,prbs_local_inv_post[127: 48]};
            4'd10:prbs_local_shft_post_load = { 40'd0,prbs_local_inv_post[127: 40]};
            4'd11:prbs_local_shft_post_load = { 32'd0,prbs_local_inv_post[127: 32]};
            4'd12:prbs_local_shft_post_load = { 24'd0,prbs_local_inv_post[127: 24]};
            4'd13:prbs_local_shft_post_load = { 16'd0,prbs_local_inv_post[127: 16]};
            4'd14:prbs_local_shft_post_load = {  8'd0,prbs_local_inv_post[127:  8]};
            4'd15:prbs_local_shft_post_load = prbs_local_inv_post[127:0];
        endcase
    end
end
endgenerate

//PRBS data output always equal to the calculated data !!
//assign  prbs_local_inv_post  = reg_vprbs_rx_order? ~cal_prbs : cal_prbs;
assign  prbs_local_inv_post  = cal_prbs;

//compare the PRBS data here 
assign  comp_res = (prbs_local_shft_post == prbs_in_shft_post)  ;//normal order

assign  match = (comp_res & reg_vprbs_rx_chk_en & (rx_data_en));

prbs_7#(DATA_W,DATA_W*2)  u_tx_prbs_7( .prbs_q(lcpb_q), .prbs_d(cal_prbs_7));
prbs_9#(DATA_W,DATA_W*2)  u_tx_prbs_9( .prbs_q(lcpb_q), .prbs_d(cal_prbs_9));
prbs_11#(DATA_W,DATA_W*2) u_tx_prbs_11( .prbs_q(lcpb_q), .prbs_d(cal_prbs_11));
prbs_15#(DATA_W,DATA_W*2) u_tx_prbs_15( .prbs_q(lcpb_q), .prbs_d(cal_prbs_15));
prbs_23#(DATA_W,DATA_W*2) u_tx_prbs_23( .prbs_q(lcpb_q), .prbs_d(cal_prbs_23));
prbs_31#(DATA_W,DATA_W*2) u_tx_prbs_31( .prbs_q(lcpb_q), .prbs_d(cal_prbs_31));

//calculate the predict data
always @(*)begin
   case(reg_vprbs_rx_mode)
   3'b000:cal_prbs = cal_prbs_7  ; //PRBS7  G(X) = X^7 + X^6 +1    64 steps
   3'b001:cal_prbs = cal_prbs_9  ; //PRBS9  G(X) = X^9 + X^5 +1    64 steps
   3'b010:cal_prbs = cal_prbs_11 ; //PRBS11  G(X) = X^11 + X^9 +1    64 steps   
   3'b011:cal_prbs = cal_prbs_15 ; //PRBS15  G(X) = X^15 + X^14 +1    64 steps
   3'b100:cal_prbs = cal_prbs_23 ; //PRBS23  G(X) = X^23 + X^18 +1    64 steps
   3'b101:cal_prbs = cal_prbs_31 ; //PRBS31 G(X) = X^31 + X^28 + 1  20 steps
   default :cal_prbs = cal_prbs_7  ; //PRBS7  G(X) = X^7 + X^6 +1    64 steps
   endcase
end   
/***match rtl end***/

/***lcpb_d rtl begin***/
always @(*)begin
    //to load the input [63:0]
    if(reg_vprbs_rx_load) begin //always load from the input data
        lcpb_d = prbs_in_shft_post_load ;//normal order
    end else begin //do not load from the input data after locked
        if(!locked_q) begin //not locked yet, load from the input data
            lcpb_d = prbs_in_shft_post_load ;//normal order
        end else  //already locked, load from internal data
            lcpb_d = prbs_local_shft_post_load;//prbs shft right until reaching byte_en num, the last 7 bits are taken for polynomial calculation(prbs7)
    end
end
/***lcpb_d rtl end***/

/***locked rtl begin***/
always @(*)begin
    //the locked counter
    if(!reg_vprbs_rx_chk_en) begin
        cnt_d   = 4'b0000;
        locked_d= 1'b0  ;
    end else if(~locked_q) begin
        if(match) begin
            if(cnt_q == reg_vprbs_rx_locked_match_cnt) begin
                cnt_d   = reg_vprbs_rx_locked_match_cnt;
                locked_d= 1'b1  ;
            end else begin
                cnt_d   = cnt_q + 1'b1;
                locked_d= 1'b0 ;
            end
        end else begin
            if(reg_vprbs_rx_lock_continue) begin  //go to relock from 0
                cnt_d   = 4'b0000;
                locked_d= 1'b0  ;
            end else begin
                cnt_d   = cnt_q ;
                locked_d= locked_q ;
            end
        end
    end else begin
        cnt_d   = cnt_q ;
        locked_d= locked_q ;
    end
end   

//flip-flops
always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        lcpb_q      <= {DATA_W{1'd1}} ;
        cnt_q       <= 4'h0 ;
        locked_q    <= 1'b0 ;
    end
    else if(check_restart) begin
        lcpb_q      <= {DATA_W{1'd1}} ;
        cnt_q       <= 4'h0 ;
        locked_q    <= 1'b0 ;
    end
    else if(~reg_vprbs_rx_chk_en) begin
        lcpb_q      <= {DATA_W{1'd1}} ;
        cnt_q       <= 4'h0 ;
        locked_q    <= 1'b0 ;
    end
    else if(rx_data_en)begin
        lcpb_q      <= lcpb_d ;
        cnt_q       <= cnt_d ;
        locked_q    <= locked_d ;
    end
/***locked rtl end***/

assign  vprbs_rx_check_pulse = reg_vprbs_rx_chk_en & rx_data_en;

assign  vprbs_rx_fail_pulse  = reg_vprbs_rx_chk_en & (locked_d|force_check) & rx_data_en & ~match; 

assign  comp_res_xor = (prbs_local_shft_post ^ prbs_in_shft_post)  ;//normal order

generate if(DATA_W==64)
    begin: err_sim_d_64_bk
        assign err_sim_d =  {5'd0,comp_res_xor[0]}  + {5'd0,comp_res_xor[1]} +
                            {5'd0,comp_res_xor[2]}  + {5'd0,comp_res_xor[3]} +
                            {5'd0,comp_res_xor[4]}  + {5'd0,comp_res_xor[5]} +
                            {5'd0,comp_res_xor[6]}  + {5'd0,comp_res_xor[7]} +
                            {5'd0,comp_res_xor[8]}  + {5'd0,comp_res_xor[9]} +
                            {5'd0,comp_res_xor[10]} + {5'd0,comp_res_xor[11]} +
                            {5'd0,comp_res_xor[12]} + {5'd0,comp_res_xor[13]} +
                            {5'd0,comp_res_xor[14]} + {5'd0,comp_res_xor[15]} +
                            {5'd0,comp_res_xor[16]} + {5'd0,comp_res_xor[17]} +
                            {5'd0,comp_res_xor[18]} + {5'd0,comp_res_xor[19]} +
                            {5'd0,comp_res_xor[20]} + {5'd0,comp_res_xor[21]} +
                            {5'd0,comp_res_xor[22]} + {5'd0,comp_res_xor[23]} +
                            {5'd0,comp_res_xor[24]} + {5'd0,comp_res_xor[25]} +
                            {5'd0,comp_res_xor[26]} + {5'd0,comp_res_xor[27]} +
                            {5'd0,comp_res_xor[28]} + {5'd0,comp_res_xor[29]} +
                            {5'd0,comp_res_xor[30]} + {5'd0,comp_res_xor[31]} +
                            {5'd0,comp_res_xor[32]} + {5'd0,comp_res_xor[33]} +
                            {5'd0,comp_res_xor[34]} + {5'd0,comp_res_xor[35]} +
                            {5'd0,comp_res_xor[36]} + {5'd0,comp_res_xor[37]} +
                            {5'd0,comp_res_xor[38]} + {5'd0,comp_res_xor[39]} +
                            {5'd0,comp_res_xor[40]} + {5'd0,comp_res_xor[41]} +
                            {5'd0,comp_res_xor[42]} + {5'd0,comp_res_xor[43]} +
                            {5'd0,comp_res_xor[44]} + {5'd0,comp_res_xor[45]} +
                            {5'd0,comp_res_xor[46]} + {5'd0,comp_res_xor[47]} +
                            {5'd0,comp_res_xor[48]} + {5'd0,comp_res_xor[49]} +
                            {5'd0,comp_res_xor[50]} + {5'd0,comp_res_xor[51]} +
                            {5'd0,comp_res_xor[52]} + {5'd0,comp_res_xor[53]} +
                            {5'd0,comp_res_xor[54]} + {5'd0,comp_res_xor[55]} +
                            {5'd0,comp_res_xor[56]} + {5'd0,comp_res_xor[57]} +
                            {5'd0,comp_res_xor[58]} + {5'd0,comp_res_xor[59]} +
                            {5'd0,comp_res_xor[60]} + {5'd0,comp_res_xor[61]} +
                            {5'd0,comp_res_xor[62]} + {5'd0,comp_res_xor[63]};
    end
else if(DATA_W==128)
    begin: err_sim_d_128_bk
        assign err_sim_d =  {6'd0,comp_res_xor[0]}   + {6'd0,comp_res_xor[1]} +
                            {6'd0,comp_res_xor[2]}   + {6'd0,comp_res_xor[3]} +
                            {6'd0,comp_res_xor[4]}   + {6'd0,comp_res_xor[5]} +
                            {6'd0,comp_res_xor[6]}   + {6'd0,comp_res_xor[7]} +
                            {6'd0,comp_res_xor[8]}   + {6'd0,comp_res_xor[9]} +
                            {6'd0,comp_res_xor[10]}  + {6'd0,comp_res_xor[11]} +
                            {6'd0,comp_res_xor[12]}  + {6'd0,comp_res_xor[13]} +
                            {6'd0,comp_res_xor[14]}  + {6'd0,comp_res_xor[15]} +
                            {6'd0,comp_res_xor[16]}  + {6'd0,comp_res_xor[17]} +
                            {6'd0,comp_res_xor[18]}  + {6'd0,comp_res_xor[19]} +
                            {6'd0,comp_res_xor[20]}  + {6'd0,comp_res_xor[21]} +
                            {6'd0,comp_res_xor[22]}  + {6'd0,comp_res_xor[23]} +
                            {6'd0,comp_res_xor[24]}  + {6'd0,comp_res_xor[25]} +
                            {6'd0,comp_res_xor[26]}  + {6'd0,comp_res_xor[27]} +
                            {6'd0,comp_res_xor[28]}  + {6'd0,comp_res_xor[29]} +
                            {6'd0,comp_res_xor[30]}  + {6'd0,comp_res_xor[31]} +
                            {6'd0,comp_res_xor[32]}  + {6'd0,comp_res_xor[33]} +
                            {6'd0,comp_res_xor[34]}  + {6'd0,comp_res_xor[35]} +
                            {6'd0,comp_res_xor[36]}  + {6'd0,comp_res_xor[37]} +
                            {6'd0,comp_res_xor[38]}  + {6'd0,comp_res_xor[39]} +
                            {6'd0,comp_res_xor[40]}  + {6'd0,comp_res_xor[41]} +
                            {6'd0,comp_res_xor[42]}  + {6'd0,comp_res_xor[43]} +
                            {6'd0,comp_res_xor[44]}  + {6'd0,comp_res_xor[45]} +
                            {6'd0,comp_res_xor[46]}  + {6'd0,comp_res_xor[47]} +
                            {6'd0,comp_res_xor[48]}  + {6'd0,comp_res_xor[49]} +
                            {6'd0,comp_res_xor[50]}  + {6'd0,comp_res_xor[51]} +
                            {6'd0,comp_res_xor[52]}  + {6'd0,comp_res_xor[53]} +
                            {6'd0,comp_res_xor[54]}  + {6'd0,comp_res_xor[55]} +
                            {6'd0,comp_res_xor[56]}  + {6'd0,comp_res_xor[57]} +
                            {6'd0,comp_res_xor[58]}  + {6'd0,comp_res_xor[59]} +
                            {6'd0,comp_res_xor[60]}  + {6'd0,comp_res_xor[61]} +
                            {6'd0,comp_res_xor[62]}  + {6'd0,comp_res_xor[63]} +
                            {6'd0,comp_res_xor[64]}  + {6'd0,comp_res_xor[65]} +
                            {6'd0,comp_res_xor[66]}  + {6'd0,comp_res_xor[67]} +
                            {6'd0,comp_res_xor[68]}  + {6'd0,comp_res_xor[69]} +
                            {6'd0,comp_res_xor[70]}  + {6'd0,comp_res_xor[71]} +
                            {6'd0,comp_res_xor[72]}  + {6'd0,comp_res_xor[73]} +
                            {6'd0,comp_res_xor[74]}  + {6'd0,comp_res_xor[75]} +
                            {6'd0,comp_res_xor[76]}  + {6'd0,comp_res_xor[77]} +
                            {6'd0,comp_res_xor[78]}  + {6'd0,comp_res_xor[79]} +
                            {6'd0,comp_res_xor[80]}  + {6'd0,comp_res_xor[81]} +
                            {6'd0,comp_res_xor[82]}  + {6'd0,comp_res_xor[83]} +
                            {6'd0,comp_res_xor[84]}  + {6'd0,comp_res_xor[85]} +
                            {6'd0,comp_res_xor[86]}  + {6'd0,comp_res_xor[87]} +
                            {6'd0,comp_res_xor[88]}  + {6'd0,comp_res_xor[89]} +
                            {6'd0,comp_res_xor[90]}  + {6'd0,comp_res_xor[91]} +
                            {6'd0,comp_res_xor[92]}  + {6'd0,comp_res_xor[93]} +
                            {6'd0,comp_res_xor[94]}  + {6'd0,comp_res_xor[95]} +
                            {6'd0,comp_res_xor[96]}  + {6'd0,comp_res_xor[97]} +
                            {6'd0,comp_res_xor[98]}  + {6'd0,comp_res_xor[99]} +
                            {6'd0,comp_res_xor[100]} + {6'd0,comp_res_xor[101]} +
                            {6'd0,comp_res_xor[102]} + {6'd0,comp_res_xor[103]} +
                            {6'd0,comp_res_xor[104]} + {6'd0,comp_res_xor[105]} +
                            {6'd0,comp_res_xor[106]} + {6'd0,comp_res_xor[107]} +
                            {6'd0,comp_res_xor[108]} + {6'd0,comp_res_xor[109]} +
                            {6'd0,comp_res_xor[110]} + {6'd0,comp_res_xor[111]} +
                            {6'd0,comp_res_xor[112]} + {6'd0,comp_res_xor[113]} +
                            {6'd0,comp_res_xor[114]} + {6'd0,comp_res_xor[115]} +
                            {6'd0,comp_res_xor[116]} + {6'd0,comp_res_xor[117]} +
                            {6'd0,comp_res_xor[118]} + {6'd0,comp_res_xor[119]} +
                            {6'd0,comp_res_xor[120]} + {6'd0,comp_res_xor[121]} +
                            {6'd0,comp_res_xor[122]} + {6'd0,comp_res_xor[123]} +
                            {6'd0,comp_res_xor[124]} + {6'd0,comp_res_xor[125]} +
                            {6'd0,comp_res_xor[126]} + {6'd0,comp_res_xor[127]};
    end
endgenerate

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        reg_rd_vprbs_rx_check <=  1'd0;
    end
    else if(reg_vprbs_rx_err_clear)begin
        reg_rd_vprbs_rx_check <=  1'd0;
    end
    else if(~reg_rd_vprbs_rx_check) begin
        reg_rd_vprbs_rx_check <=  vprbs_rx_check_pulse;
    end
end

assign vprbs_rx_err_restart = ~reg_rd_vprbs_rx_check &  vprbs_rx_check_pulse;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        reg_rd_vprbs_rx_fail <=  1'd0;
    end
    else if(reg_vprbs_rx_err_clear)begin
        reg_rd_vprbs_rx_fail <=  1'd0;
    end
    else if(~reg_rd_vprbs_rx_fail) begin
        reg_rd_vprbs_rx_fail <=  vprbs_rx_fail_pulse;
    end
end

assign  vprbs_err_d = reg_rd_vprbs_rx_err + err_sim_d;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        reg_rd_vprbs_rx_err <= 32'd0;
    else if(~reg_vprbs_rx_chk_en)
        reg_rd_vprbs_rx_err <= 32'd0;
    else if(reg_vprbs_rx_err_clear)
        reg_rd_vprbs_rx_err <= 32'd0;
    else if(vprbs_rx_err_restart)
        reg_rd_vprbs_rx_err <= 32'd0;
    else if(vprbs_rx_fail_pulse)
        reg_rd_vprbs_rx_err <= (vprbs_err_d[32]^vprbs_err_d[31]) ? 32'hffff_ffff : vprbs_err_d[31:0];
end

endmodule 
