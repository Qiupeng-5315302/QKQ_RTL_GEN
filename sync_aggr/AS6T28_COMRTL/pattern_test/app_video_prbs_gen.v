
module app_video_prbs_gen(/*AUTOARG*/
   // Outputs
   prbs_data_out,
   // Inputs
   clk, rst_n, reg_vprbs_tx_gen_en, reg_vprbs_tx_pat_reset,
   reg_vprbs_tx_mode, reg_vprbs_tx_order, reg_vprbs_tx_err_inject_en,
   reg_vprbs_tx_err_inject_intv_time,
   reg_vprbs_tx_err_inject_intv_num, tx_data_type, tx_byte_en,
   tx_data_en, tx_header_en
   );

/***IO define***/
input           clk                                 ; 
input           rst_n                               ; 
input           reg_vprbs_tx_gen_en                 ;
input           reg_vprbs_tx_pat_reset              ;
input  [2:0]    reg_vprbs_tx_mode                   ;
input           reg_vprbs_tx_order                  ;//order == 1 ==> invert , 0 ===> original order
input           reg_vprbs_tx_err_inject_en          ;
input  [7:0]    reg_vprbs_tx_err_inject_intv_time   ;
input  [7:0]    reg_vprbs_tx_err_inject_intv_num    ;
input  [5:0]    tx_data_type                        ;
input  [2:0]    tx_byte_en                          ;
input           tx_data_en                          ;
input           tx_header_en                        ;

output [63:0]   prbs_data_out                       ;

/***signal define***/
wire    [63:0]  prbs_data_out           ;
wire    [63:0]  prbs_err_ijct_post      ;
wire    [63:0]  prbs_q_inv              ;//reverse and inverted      
wire    [63:0]  prbs_inv_post           ;
reg     [63:0]  prbs_d                  ; 
reg     [63:0]  prbs_q                  ;
reg     [63:0]  prbs_d_post             ;
reg     [63:0]  dbg_prbs_q              ;
wire    [63:0]  prbs_d_7_64b            ;
wire    [63:0]  prbs_d_9_64b            ;
wire    [63:0]  prbs_d_11_64b           ;
wire    [63:0]  prbs_d_15_64b           ;
wire    [63:0]  prbs_d_23_64b           ;
wire    [63:0]  prbs_d_31_64b           ;
wire    [63:0]  dbg_prbs_d_7_64b        ;
wire    [63:0]  dbg_prbs_d_9_64b        ;
wire    [63:0]  dbg_prbs_d_11_64b       ;
wire    [63:0]  dbg_prbs_d_15_64b       ;
wire    [63:0]  dbg_prbs_d_23_64b       ;
wire    [63:0]  dbg_prbs_d_31_64b       ;
reg             tx_header_en_d1         ;
wire            header_en_rise          ;

/***logic design***/
prbs_7#(64,128)  u_rx_prbs_7_64b_gen( .prbs_q(prbs_q), .prbs_d(prbs_d_7_64b));
prbs_9#(64,128)  u_rx_prbs_9_64b_gen( .prbs_q(prbs_q), .prbs_d(prbs_d_9_64b));
prbs_11#(64,128) u_rx_prbs_11_64b_gen( .prbs_q(prbs_q), .prbs_d(prbs_d_11_64b));
prbs_15#(64,128) u_rx_prbs_15_64b_gen( .prbs_q(prbs_q), .prbs_d(prbs_d_15_64b));
prbs_23#(64,128) u_rx_prbs_23_64b_gen( .prbs_q(prbs_q), .prbs_d(prbs_d_23_64b));
prbs_31#(64,128) u_rx_prbs_31_64b_gen( .prbs_q(prbs_q), .prbs_d(prbs_d_31_64b));

`ifdef VPRBS_DBG
prbs_7#(64,128)  u_rx_prbs_7_64b_dbg( .prbs_q(dbg_prbs_q), .prbs_d(dbg_prbs_d_7_64b));
prbs_9#(64,128)  u_rx_prbs_9_64b_dbg( .prbs_q(dbg_prbs_q), .prbs_d(dbg_prbs_d_9_64b));
prbs_11#(64,128) u_rx_prbs_11_64b_dbg( .prbs_q(dbg_prbs_q), .prbs_d(dbg_prbs_d_11_64b));
prbs_15#(64,128) u_rx_prbs_15_64b_dbg( .prbs_q(dbg_prbs_q), .prbs_d(dbg_prbs_d_15_64b));
prbs_23#(64,128) u_rx_prbs_23_64b_dbg( .prbs_q(dbg_prbs_q), .prbs_d(dbg_prbs_d_23_64b));
prbs_31#(64,128) u_rx_prbs_31_64b_dbg( .prbs_q(dbg_prbs_q), .prbs_d(dbg_prbs_d_31_64b));
`endif

//the logic----
always @ (*)begin
    case(reg_vprbs_tx_mode)
    3'b000:  prbs_d = prbs_d_7_64b   ; //PRBS7  G(X) = X^7 + X^6 +1         64 steps
    3'b001:  prbs_d = prbs_d_9_64b   ; //PRBS9  G(X) = X^9 + X^5 +1         64 steps
    3'b010:  prbs_d = prbs_d_11_64b  ; //PRBS11 G(X) = X^11 + X^9 + 1       64 steps
    3'b011:  prbs_d = prbs_d_15_64b  ; //PRBS15  G(X) = X^15 + X^14 +1      64 steps
    3'b100:  prbs_d = prbs_d_23_64b  ; //PRBS23  G(X) = X^23 + X^18 +1      64 steps
    3'b101:  prbs_d = prbs_d_31_64b  ; //PRBS31 G(X) = X^31 + X^28 + 1      64 steps
    default: prbs_d = prbs_d_7_64b   ; 
    endcase    
end//end of else
      
//`CSI_YUV420_8_BIT_LEGACY  :data_type = 6'h1a
//`CSI_YUV422_8_BIT         :data_type = 6'h1e
always@(*)begin
    if((tx_data_type == 6'h1a) || (tx_data_type == 6'h1e))begin
        case(tx_byte_en)
        3'd0:prbs_d_post = {prbs_d[63:56],56'd0};
        3'd1:prbs_d_post = {prbs_d[63:48],48'd0};
        3'd2:prbs_d_post = {prbs_d[63:40],40'd0};
        3'd3:prbs_d_post = {prbs_d[63:32],32'd0};
        3'd4:prbs_d_post = {prbs_d[63:24],24'd0};
        3'd5:prbs_d_post = {prbs_d[63:16],16'd0};
        3'd6:prbs_d_post = {prbs_d[63: 8], 8'd0};
        3'd7:prbs_d_post = prbs_d[63:0];
        endcase
    end
    else begin
        case(tx_byte_en)
        3'd0:prbs_d_post = {56'd0,prbs_d[63:56]};
        3'd1:prbs_d_post = {48'd0,prbs_d[63:48]};
        3'd2:prbs_d_post = {40'd0,prbs_d[63:40]};
        3'd3:prbs_d_post = {32'd0,prbs_d[63:32]};
        3'd4:prbs_d_post = {24'd0,prbs_d[63:24]};
        3'd5:prbs_d_post = {16'd0,prbs_d[63:16]};
        3'd6:prbs_d_post = { 8'd0,prbs_d[63:8]};
        3'd7:prbs_d_post = prbs_d[63:0];
        endcase
    end
end

reg [63:0]  prbs_d_load;
always@(*)begin
    case(tx_byte_en)
    3'd0:prbs_d_load = {56'd0,prbs_d[63:56]};
    3'd1:prbs_d_load = {48'd0,prbs_d[63:48]};
    3'd2:prbs_d_load = {40'd0,prbs_d[63:40]};
    3'd3:prbs_d_load = {32'd0,prbs_d[63:32]};
    3'd4:prbs_d_load = {24'd0,prbs_d[63:24]};
    3'd5:prbs_d_load = {16'd0,prbs_d[63:16]};
    3'd6:prbs_d_load = { 8'd0,prbs_d[63:8]};
    3'd7:prbs_d_load = prbs_d[63:0];
    endcase
end

//flip_flops 
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        prbs_q <=  64'hffff_ffff_ffff_ffff ;
    else if( ~reg_vprbs_tx_gen_en ) 
        prbs_q <=  64'hffff_ffff_ffff_ffff ;
    else if( reg_vprbs_tx_pat_reset ) 
        prbs_q <=  64'hffff_ffff_ffff_ffff ;
    else if(tx_data_en)
        prbs_q <= prbs_d_load;
end

`ifdef VPRBS_DBG
//debug flip_flops 
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        dbg_prbs_q <=  64'hffff_ffff_ffff_ffff ;
    else if( ~reg_vprbs_tx_gen_en ) 
        dbg_prbs_q <=  64'hffff_ffff_ffff_ffff ;
    else if( reg_vprbs_tx_pat_reset ) 
        dbg_prbs_q <=  64'hffff_ffff_ffff_ffff ;
    else if(tx_data_en)
        dbg_prbs_q <= prbs_d;
end
`endif

assign prbs_inv_post = reg_vprbs_tx_order ? ~prbs_d_post : prbs_d_post ;
assign prbs_data_out = prbs_err_ijct_post;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        tx_header_en_d1 <= 1'd0;
    else
        tx_header_en_d1 <= tx_header_en;
end

assign  header_en_rise = ~tx_header_en_d1 && tx_header_en;

/*  vprbs_err_inject  AUTO_TEMPLATE (
    .data_in(prbs_inv_post),
    .data_out(prbs_err_ijct_post),
    .data_en(tx_data_en),
	.reg_vprbs_err_inject_\(.*\)(reg_vprbs_tx_err_inject_\1),
	.err_inject_restart	(header_en_rise),
)*/
vprbs_err_inject u_prbs_err_inject(/*AUTOINST*/
				   // Outputs
				   .data_out		(prbs_err_ijct_post), // Templated
				   // Inputs
				   .clk			(clk),
				   .rst_n		(rst_n),
				   .data_in		(prbs_inv_post), // Templated
				   .data_en		(tx_data_en),	 // Templated
				   .err_inject_restart	(header_en_rise), // Templated
				   .reg_vprbs_err_inject_en(reg_vprbs_tx_err_inject_en), // Templated
				   .reg_vprbs_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time), // Templated
				   .reg_vprbs_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num)); // Templated

endmodule
