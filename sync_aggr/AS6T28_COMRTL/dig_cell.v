
`define WAM_PROC \
wire in_sync_wam; \
`ifdef WAM_XSTATE_MESSAGE_LEVEL_INFO \
wam #(.xstate_message_level(1)) U_WAM (.dst_clk(clk), .datain(data), .dataout(in_sync_wam)); \
`else \
wam U_WAM (.dst_clk(clk), .datain(data), .dataout(in_sync_wam)); \
`endif
module clk_sparecells (CK, RST, Q);
input CK;
input RST;
output Q;

wire spare_dff1_d, spare_dff1_q;
wire spare_dff2_d, spare_dff2_q;
wire spare_dff3_d, spare_dff3_q;
wire spare_dff4_d, spare_dff4_q;
wire spare_dff5_d, spare_dff5_q;

wire rstn;
//Inv_Wrap U_DONT_RST_INV (.A(RST), .ZN(rstn));

Mux2_Wrap  U_DONT_SPARE_MUX_1 (.A(Q), .B(1'b0), .S(1'b0), .Z(spare_dff1_d));
SDFRPQ_Wrap U_DONT_SPARE_DFF_1 (.CP(CK), .CD(RST), .D(spare_dff1_d), .Q(Q) );

Mux2_Wrap  U_DONT_SPARE_MUX_2 (.A(spare_dff2_q), .B(1'b0), .S(1'b0), .Z(spare_dff2_d));
SDFRPQ_Wrap U_DONT_SPARE_DFF_2 (.CP(CK), .CD(RST), .D(spare_dff2_d), .Q(spare_dff2_q) );

Mux2_Wrap  U_DONT_SPARE_MUX_3 (.A(spare_dff3_q), .B(1'b0), .S(1'b0), .Z(spare_dff3_d));
SDFRPQ_Wrap U_DONT_SPARE_DFF_3 (.CP(CK), .CD(RST), .D(spare_dff3_d), .Q(spare_dff3_q));

Mux2_Wrap  U_DONT_SPARE_MUX_4 (.A(spare_dff4_q), .B(1'b0), .S(1'b0), .Z(spare_dff4_d));
SDFRPQ_Wrap U_DONT_SPARE_DFF_4 (.CP(CK), .CD(RST), .D(spare_dff4_d), .Q(spare_dff4_q));

Mux2_Wrap  U_DONT_SPARE_MUX_5 (.A(spare_dff5_q), .B(1'b0), .S(1'b0), .Z(spare_dff5_d));
SDFRPQ_Wrap U_DONT_SPARE_DFF_5 (.CP(CK), .CD(RST), .D(spare_dff5_d), .Q(spare_dff5_q) );

endmodule


//module clk_sparecells_udr (CK, RST, Q);
//input CK;
//input RST;
//output Q;
//
//wire spare_dff1_d, spare_dff1_q;
//wire spare_dff2_d, spare_dff2_q;
//wire spare_dff3_d, spare_dff3_q;
//wire spare_dff4_d, spare_dff4_q;
//wire spare_dff5_d, spare_dff5_q;
//
//wire rstn;
//szd_sivx6_m2 U_DONT_RST_INV (.A(RST), .Z(rstn));
//
//Mux2_Wrap  U_DONT_SPARE_MUX_1 (.A(Q), .B(1'b0), .S(1'b0), .Z(spare_dff1_d));
//SDFSNQ_Wrap U_DONT_SPARE_DFF_1 (.CK(CK), .RB(rstn), .D(spare_dff1_d), .Q(Q), .SCN(1'b0), .SI(1'b0));
////szd_ssdfrudrx4 U_DONT_SPARE_DFF_1 ( .ISOB(1'b1), .CK(CK), .RB(rstn), .D(spare_dff1_d), .Q(Q), .SCN(1'b0), .SI(1'b0));
//
//Mux2_Wrap  U_DONT_SPARE_MUX_2 (.A(spare_dff2_q), .B(1'b0), .S(1'b0), .Z(spare_dff2_d));
//SDFSNQ_Wrap U_DONT_SPARE_DFF_2 (.CK(CK), .RB(rstn), .D(spare_dff2_d), .Q(spare_dff2_q), .SCN(1'b0), .SI(1'b0));
////szd_ssdfrudrx4 U_DONT_SPARE_DFF_2 ( .ISOB(1'b1), .CK(CK), .RB(rstn), .D(spare_dff2_d), .Q(spare_dff2_q), .SCN(1'b0), .SI(1'b0));
//
//Mux2_Wrap  U_DONT_SPARE_MUX_3 (.A(spare_dff3_q), .B(1'b0), .S(1'b0), .Z(spare_dff3_d));
//SDFSNQ_Wrap U_DONT_SPARE_DFF_3 (.CK(CK), .RB(rstn), .D(spare_dff3_d), .Q(spare_dff3_q), .SCN(1'b0), .SI(1'b0));
////szd_ssdfrudrx4 U_DONT_SPARE_DFF_3 ( .ISOB(1'b1), .CK(CK), .RB(rstn), .D(spare_dff3_d), .Q(spare_dff3_q), .SCN(1'b0), .SI(1'b0));
//
//Mux2_Wrap  U_DONT_SPARE_MUX_4 (.A(spare_dff4_q), .B(1'b0), .S(1'b0), .Z(spare_dff4_d));
//SDFSNQ_Wrap U_DONT_SPARE_DFF_4 (.CK(CK), .RB(rstn), .D(spare_dff4_d), .Q(spare_dff4_q), .SCN(1'b0), .SI(1'b0));
////szd_ssdfrudrx4 U_DONT_SPARE_DFF_4 ( .ISOB(1'b1), .CK(CK), .RB(rstn), .D(spare_dff4_d), .Q(spare_dff4_q), .SCN(1'b0), .SI(1'b0));
//
//Mux2_Wrap  U_DONT_SPARE_MUX_5 (.A(spare_dff5_q), .B(1'b0), .S(1'b0), .Z(spare_dff5_d));
//SDFSNQ_Wrap U_DONT_SPARE_DFF_5 (.CK(CK), .RB(rstn), .D(spare_dff5_d), .Q(spare_dff5_q), .SCN(1'b0), .SI(1'b0));
////szd_ssdfrudrx4 U_DONT_SPARE_DFF_5 ( .ISOB(1'b1), .CK(CK), .RB(rstn), .D(spare_dff5_d), .Q(spare_dff5_q), .SCN(1'b0), .SI(1'b0));
//
//endmodule

module clk_or_cell_type1 (A, B, Z);

input A, B;
output Z;

CKOr2_Wrap U_DONT_OR ( .A1(A), .A2(B), .Z(Z) );


endmodule






module clk_mux_cell_type1 (A, B, S, Z);
input  A ;
input  B ;
input  S ;
output Z ;

CKMux2_Wrap U_DONT_MUX(.A(A), .B(B), .S(S), .Z(Z));

endmodule


//A to Z has short delay
module clk_mux_cell_type2 (A, B, S, Z);
input  A ;
input  B ;
input  S ;
output Z ;

wire S_N;
wire A_SEL;
wire B_SEL;

CKInv_Wrap  U_DONT_INV (.A(S), .ZN(S_N));
CKNand2_Wrap U_DONT_NAND_1 ( .A(A), .B(S_N), .ZN(A_SEL) );
CKNand2_Wrap U_DONT_NAND_2 ( .A(B), .B(S), .ZN(B_SEL) );
CKNand2_Wrap U_DONT_NAND_3 ( .A(A_SEL), .B(B_SEL), .ZN(Z) );

endmodule

//A to Z has short delay
module clk_mux_cell_type3 (A, B, S1, S2, Z);
input  A ;
input  B ;
input  S1 ;
input  S2 ;
output Z ;

wire A_SEL;
wire B_SEL;

//assign Z = A & S1 | B & S2;
CKNand2_Wrap U_DONT_NAND_1 ( .A(A), .B(S1), .ZN(A_SEL) );
CKNand2_Wrap U_DONT_NAND_2 ( .A(B), .B(S2), .ZN(B_SEL) );
CKNand2_Wrap U_DONT_NAND_3 ( .A(A_SEL), .B(B_SEL), .ZN(Z) );

endmodule



//not used
//module clk_xor_cell_type1 (A, B, Z);
//input  A ;
//input  B ;
//output Z ;
//
//szd_scxor2x8 U_DONT_XOR (.A ( A ) , .B(B), .Z(Z));
//
//endmodule


//A to Z has short delay
module clk_xor_cell_type2 (A, B, Z);
input  A ;
input  B ;
output Z ;

wire A_N;
wire B_N;
wire A_BN;
wire AN_B;

CKInv_Wrap  U_DONT_INV_1 (.A(A), .ZN(A_N));
CKInv_Wrap  U_DONT_INV_2 (.A(B), .ZN(B_N));
CKNand2_Wrap U_DONT_NAND_1 (.A(A), .B(B_N), .ZN(A_BN));
CKNand2_Wrap U_DONT_NAND_2 (.A(A_N), .B(B), .ZN(AN_B));
CKNand2_Wrap U_DONT_NAND_3 (.A(A_BN), .B(AN_B), .ZN(Z));


endmodule



module clk_inv_cell (A, Z);
input  A ;
output Z ;

CKInv_Wrap U_DONT_INV(.A(A), .ZN(Z));

endmodule

module clk_gate_cell_type1 (CKIN, EN, CKOUT);
input  CKIN ;
input  EN ;
output CKOUT ;

wire CKOUT_N;

CKNand2_Wrap U_DONT_NAND (.A(CKIN), .B(EN), .ZN(CKOUT_N));
CKInv_Wrap U_DONT_INV (.A(CKOUT_N), .ZN(CKOUT));

endmodule

module clk_gate_cell_type2 (CKIN, DIS, CKOUT);
input  CKIN ;
input  DIS ;
output CKOUT ;

wire CKOUT_N;

//    szd_scnr2x4 U_DONT_NAND (.A(CKIN), .B(DIS), .Z(CKOUT_N));
//    CKInv_Wrap U_DONT_INV (.A(CKOUT_N), .ZN(CKOUT));


CKOr2_Wrap   U_DONT_OR (.A1(CKIN), .A2(DIS), .Z(CKOUT) );


endmodule


//not used
//module data_mux_cell_type1 (A, B, S, Z);
//input  A ;
//input  B ;
//input  S ;
//output Z ;
//
//szd_smx2x8 U_DONT_MUX(.A(A), .B(B), .S(S), .Z(Z));
//
//endmodule

module data_mux_cell_type2 (A, B, S, Z);
input  A ;
input  B ;
input  S ;
output Z ;

wire S_N;
wire A_SEL;
wire B_SEL;

Inv_Wrap  U_DONT_INV (.A(S), .ZN(S_N));
Nand2_Wrap U_DONT_NAND_1 ( .A(A), .B(S_N), .ZN(A_SEL) );
Nand2_Wrap U_DONT_NAND_2 ( .A(B), .B(S), .ZN(B_SEL) );
Nand2_Wrap U_DONT_NAND_3 ( .A(A_SEL), .B(B_SEL), .ZN(Z) );

endmodule


module data_mux_cell_bus10 (A, B, S, Z);
input  [9:0] A ;
input  [9:0] B ;
input  S ;
output [9:0] Z ;

data_mux_cell_type2 u_mx2_0(.A(A[0]), .B(B[0]), .S(S), .Z(Z[0]));
data_mux_cell_type2 u_mx2_1(.A(A[1]), .B(B[1]), .S(S), .Z(Z[1]));
data_mux_cell_type2 u_mx2_2(.A(A[2]), .B(B[2]), .S(S), .Z(Z[2]));
data_mux_cell_type2 u_mx2_3(.A(A[3]), .B(B[3]), .S(S), .Z(Z[3]));
data_mux_cell_type2 u_mx2_4(.A(A[4]), .B(B[4]), .S(S), .Z(Z[4]));
data_mux_cell_type2 u_mx2_5(.A(A[5]), .B(B[5]), .S(S), .Z(Z[5]));
data_mux_cell_type2 u_mx2_6(.A(A[6]), .B(B[6]), .S(S), .Z(Z[6]));
data_mux_cell_type2 u_mx2_7(.A(A[7]), .B(B[7]), .S(S), .Z(Z[7]));
data_mux_cell_type2 u_mx2_8(.A(A[8]), .B(B[8]), .S(S), .Z(Z[8]));
data_mux_cell_type2 u_mx2_9(.A(A[9]), .B(B[9]), .S(S), .Z(Z[9]));

endmodule

//A: 10bit, B: 10bit
module data_xor_cell_bus10_t2 (A, B, Z);
input [9:0] A;
input [9:0] B;
output [9:0] Z;

data_xor_cell_type2 u_xor2_0 (.A(A[0]), .B(B[0]), .Z(Z[0]));
data_xor_cell_type2 u_xor2_1 (.A(A[1]), .B(B[1]), .Z(Z[1]));
data_xor_cell_type2 u_xor2_2 (.A(A[2]), .B(B[2]), .Z(Z[2]));
data_xor_cell_type2 u_xor2_3 (.A(A[3]), .B(B[3]), .Z(Z[3]));
data_xor_cell_type2 u_xor2_4 (.A(A[4]), .B(B[4]), .Z(Z[4]));
data_xor_cell_type2 u_xor2_5 (.A(A[5]), .B(B[5]), .Z(Z[5]));
data_xor_cell_type2 u_xor2_6 (.A(A[6]), .B(B[6]), .Z(Z[6]));
data_xor_cell_type2 u_xor2_7 (.A(A[7]), .B(B[7]), .Z(Z[7]));
data_xor_cell_type2 u_xor2_8 (.A(A[8]), .B(B[8]), .Z(Z[8]));
data_xor_cell_type2 u_xor2_9 (.A(A[9]), .B(B[9]), .Z(Z[9]));

endmodule


//module data_dly_cell (A,Z);
//input A;
//output Z ;
//wire Z;
//wire n1,n2,n3,n4 ;
//szd_sbufx1 U_DLY_0 ( .A(A), .Z(n1));
//szd_sbufx1 U_DLY_1 ( .A(n1), .Z(n2));
//szd_sbufx1 U_DLY_2 ( .A(n2), .Z(n3));
//szd_sbufx1 U_DLY_3 ( .A(n3), .Z(n4));
//szd_sbufx1 U_DLY_4 ( .A(n4), .Z(Z));
//endmodule


//module data_dly_cell_bus10 (A,Z);
//input [9:0] A;
//output [9:0] Z ;
//wire [9:0] Z;

//data_dly_cell u_dly_0 (.A(A[0]), .Z(Z[0]));
//data_dly_cell u_dly_1 (.A(A[1]), .Z(Z[1]));
//data_dly_cell u_dly_2 (.A(A[2]), .Z(Z[2]));
//data_dly_cell u_dly_3 (.A(A[3]), .Z(Z[3]));
//data_dly_cell u_dly_4 (.A(A[4]), .Z(Z[4]));
//data_dly_cell u_dly_5 (.A(A[5]), .Z(Z[5]));
//data_dly_cell u_dly_6 (.A(A[6]), .Z(Z[6]));
//data_dly_cell u_dly_7 (.A(A[7]), .Z(Z[7]));
//data_dly_cell u_dly_8 (.A(A[8]), .Z(Z[8]));
//data_dly_cell u_dly_9 (.A(A[9]), .Z(Z[9]));
//
//endmodule

module data_dly_cell_type2 (A,Z);
input A;
output Z ;
wire Z;
wire n1,n2,n3,n4 ;
Buf_Wrap U_DONT_DLY_0 ( .A(A), .Z(n1));
Buf_Wrap U_DONT_DLY_1 ( .A(n1), .Z(n2));
Buf_Wrap U_DONT_DLY_2 ( .A(n2), .Z(n3));
Buf_Wrap U_DONT_DLY_3 ( .A(n3), .Z(n4));
Buf_Wrap U_DONT_DLY_4 ( .A(n4), .Z(Z));
endmodule


module data_dly_cell_bus10_type2 (A,Z);
input [9:0] A;
output [9:0] Z ;
wire [9:0] Z;

data_dly_cell_type2 u_dly_0 (.A(A[0]), .Z(Z[0]));
data_dly_cell_type2 u_dly_1 (.A(A[1]), .Z(Z[1]));
data_dly_cell_type2 u_dly_2 (.A(A[2]), .Z(Z[2]));
data_dly_cell_type2 u_dly_3 (.A(A[3]), .Z(Z[3]));
data_dly_cell_type2 u_dly_4 (.A(A[4]), .Z(Z[4]));
data_dly_cell_type2 u_dly_5 (.A(A[5]), .Z(Z[5]));
data_dly_cell_type2 u_dly_6 (.A(A[6]), .Z(Z[6]));
data_dly_cell_type2 u_dly_7 (.A(A[7]), .Z(Z[7]));
data_dly_cell_type2 u_dly_8 (.A(A[8]), .Z(Z[8]));
data_dly_cell_type2 u_dly_9 (.A(A[9]), .Z(Z[9]));

endmodule


//not used
//module data_xor_cell_type1 (A, B, Z);
//input A, B;
//output Z;
//
//szd_sxor2x8 U_DONT_XOR (.A(A), .B(B), .Z(Z));
//
//endmodule

module data_xor_cell_type2 (A, B, Z);
input A, B;
output Z;

wire A_N;
wire B_N;
wire A_BN;
wire AN_B;

Inv_Wrap  U_DONT_INV_1 (.A(A), .ZN(A_N));
Inv_Wrap  U_DONT_INV_2 (.A(B), .ZN(B_N));
Nand2_Wrap U_DONT_NAND_1 (.A(A), .B(B_N), .ZN(A_BN));
Nand2_Wrap U_DONT_NAND_2 (.A(A_N), .B(B), .ZN(AN_B));
Nand2_Wrap U_DONT_NAND_3 (.A(A_BN), .B(AN_B), .ZN(Z));

endmodule


//A: 10bit, B: 1bit
module data_xor_cell_bus10 (A, B, Z);
input [9:0] A;
input B;
output [9:0] Z;

data_xor_cell_type2 u_xor2_0 (.A(A[0]), .B(B), .Z(Z[0]));
data_xor_cell_type2 u_xor2_1 (.A(A[1]), .B(B), .Z(Z[1]));
data_xor_cell_type2 u_xor2_2 (.A(A[2]), .B(B), .Z(Z[2]));
data_xor_cell_type2 u_xor2_3 (.A(A[3]), .B(B), .Z(Z[3]));
data_xor_cell_type2 u_xor2_4 (.A(A[4]), .B(B), .Z(Z[4]));
data_xor_cell_type2 u_xor2_5 (.A(A[5]), .B(B), .Z(Z[5]));
data_xor_cell_type2 u_xor2_6 (.A(A[6]), .B(B), .Z(Z[6]));
data_xor_cell_type2 u_xor2_7 (.A(A[7]), .B(B), .Z(Z[7]));
data_xor_cell_type2 u_xor2_8 (.A(A[8]), .B(B), .Z(Z[8]));
data_xor_cell_type2 u_xor2_9 (.A(A[9]), .B(B), .Z(Z[9]));

endmodule



//module sync2_udr_cell (clk, reset, data, qout);
//input clk, reset, data;
//output qout;
//
//wire reset_n;
//
//Inv_Wrap U_DONT_RST_INV (.A(reset), .Z(reset_n));
////szd_s2dsyncudrx2 U_DONT_SYNC2( .ISOB(1'b1), .Q(qout), .CK(clk), .D(data), .RB(reset_n), .SCN(1'b0), .SI(1'b0));
//SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(data), .RB(reset_n), .SCN(1'b0), .SI(1'b0));
//
//endmodule

//module sync2_udr_cell_dly (clk, reset, data, qout);
//input clk, reset, data;
//output qout;
//
//wire reset_n;
//
//Inv_Wrap U_DONT_RST_INV (.A(reset), .Z(reset_n));
////szd_s2dsyncudrx2 U_DONT_DLY( .ISOB(1'b1), .Q(qout), .CK(clk), .D(data), .RB(reset_n), .SCN(1'b0), .SI(1'b0));
//SDFSYNC2SNQ_DO_Wrap U_DONT_DLY ( .Q(qout), .CK(clk), .D(data), .RB(reset_n), .SCN(1'b0), .SI(1'b0));
//
//endmodule
//
//module sync2_udr_cell_rstb (clk, reset_n, data, qout);
//input clk, reset_n, data;
//output qout;
//
////szd_s2dsyncudrx2 U_DONT_SYNC2( .ISOB(1'b1), .Q(qout), .CK(clk), .D(data), .RB(reset_n), .SCN(1'b0), .SI(1'b0));
//SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(data), .RB(reset_n), .SCN(1'b0), .SI(1'b0));
//
//endmodule
//
//
//module sync2_udr_cell_set (clk, set, data, qout);
//input clk, set, data;
//output qout;
//
//wire data_n, set_n, qout_n;
//Inv_Wrap U_DONT_DATA_INV (.A(data), .Z(data_n));
//Inv_Wrap U_DONT_RST_INV (.A(set), .Z(set_n));
////szd_s2dsyncudrx2 U_DONT_SYNC2( .ISOB(1'b1), .Q(qout_n), .CK(clk), .D(data_n), .RB(set_n), .SCN(1'b0), .SI(1'b0));
//SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout_n), .CK(clk), .D(data_n), .RB(set_n), .SCN(1'b0), .SI(1'b0));
//Inv_Wrap U_DONT_QOUT_INV (.A(qout_n), .Z(qout));
//
//endmodule

/*
module sync2_udr_cell_set_dly (clk, set, data, qout);
input clk, set, data;
output qout;

wire data_n, set_n, qout_n;
Inv_Wrap U_DONT_DATA_INV (.A(data), .Z(data_n));
Inv_Wrap U_DONT_RST_INV (.A(set), .Z(set_n));
//szd_s2dsyncudrx2 U_DONT_DLY( .ISOB(1'b1), .Q(qout_n), .CK(clk), .D(data_n), .RB(set_n), .SCN(1'b0), .SI(1'b0));
SDFSYNC2SNQ_DO_Wrap U_DONT_DLY ( .Q(qout_n), .CK(clk), .D(data_n), .RB(set_n), .SCN(1'b0), .SI(1'b0));
Inv_Wrap U_DONT_QOUT_INV (.A(qout_n), .Z(qout));

endmodule
*/

//
//
//module sync2_udr_cell_setb (clk, set_n, data, qout);
//input clk, set_n, data;
//output qout;
//
//wire data_n, qout_n;
//SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(data), .SDN(set_n));
//
//endmodule

/*
module sync2_cell (clk, reset, data, qout);
input clk, reset, data;
output qout;

reg data_sync1;
reg data_sync2;

always @(posedge clk or posedge reset)
begin
  if(reset) begin
    data_sync1 <= 1'b0;  
    data_sync2 <= 1'b0;  
  end
else begin
    data_sync1 <= data;
    data_sync2 <= data_sync1;
  end
end

assign qout = data_sync2;

endmodule

module sync2_cell_rstb (clk, reset_n, data, qout);
input clk, reset_n, data;
output qout;

reg data_sync1;
reg data_sync2;

always @(posedge clk or negedge reset_n)
begin
  if(~reset_n) begin
    data_sync1 <= 1'b0;  
    data_sync2 <= 1'b0;  
  end
else begin
    data_sync1 <= data;
    data_sync2 <= data_sync1;
  end
end

assign qout = data_sync2;


endmodule


module sync2_cell_set (clk, set, data, qout);
input clk, set, data;
output qout;

reg data_sync1;
reg data_sync2;

always @(posedge clk or posedge set)
begin
  if(set) begin
    data_sync1 <= 1'b1;  
    data_sync2 <= 1'b1;  
  end
else begin
    data_sync1 <= data;
    data_sync2 <= data_sync1;
  end
end

assign qout = data_sync2;



endmodule

module sync2_cell_setb (clk, set_n, data, qout);
input clk, set_n, data;
output qout;

reg data_sync1;
reg data_sync2;

always @(posedge clk or negedge set_n)
begin
  if(~set_n) begin
    data_sync1 <= 1'b1;  
    data_sync2 <= 1'b1;  
  end
else begin
    data_sync1 <= data;
    data_sync2 <= data_sync1;
  end
end

assign qout = data_sync2;

endmodule

module clk_gate_cell_type3 (TE,E,CP,Q);
input TE,E,CP;
output Q;
reg E_D;
  
    always @(*)begin
     if(CP == 1'b0)
       E_D = E | TE;
    end
    assign  Q = E_D & CP;
endmodule

module csd_clk_reg_rise (CP, CD,D,Q);
 input CP;
 input CD;
 input D;
 output Q;

  always @(posedge CP or posedge CD) 
  begin
        if(CD) Q <= 1'b0;
        else   Q <= D;
  end

endmodule

module clk_and(A1,A2,Z);
input A1;
input A2;
output Z;

 assign Z = A1 && A2;

endmodule


*/

module csd_clk_reg_rise (/*AUTOARG*/CP, CD,D,Q);
 input CP,CD,D;
 output Q;
 SDFRPQ_Wrap U_DONT_SDFPRQ (.CP(CP),.D(D),.CD(CD),.Q(Q));
endmodule

module clk_gate_cell_type3 (/*AUTOARG*/TE,E,CP,Q);
input TE,E,CP;
output Q;
CKLN_Wrap U_DONT_CKLN (.CP(CP),.E(E),.TE(TE),.Q(Q));
endmodule

module clk_and(A1,A2,Z);
input A1;
input A2;
output Z;

CKAnd2_Wrap U_DONT_CK_AND2 (.A1(A1),.A2(A2),.Z(Z));

endmodule

//==============================================================================
//             CDC lib cells
//==============================================================================

//Limitation: Only used for gray code sync .
module multi_bit_sync2_cell_rstb #(
    parameter BUS_WIDTH = 10
)(qout,clk, reset_n, data);
input clk, reset_n;
input   [BUS_WIDTH-1:0] data;
output  [BUS_WIDTH-1:0] qout;
genvar i ;
generate 
    for(i = 0; i < BUS_WIDTH; i = i+1) begin:SYNC2_CELL_RSTB_BK
        sync2_cell_rstb u_sync2_cell_rstb(
            .clk(clk), 
            .reset_n(reset_n), 
            .data(data[i]), 
            .qout(qout[i]));
    end
endgenerate

endmodule

//Limitation: Only used for gray code sync .
module multi_bit_sync2_cell #(
    parameter BUS_WIDTH = 10
)(qout,clk, reset, data);
input clk, reset;
input   [BUS_WIDTH-1:0] data;
output  [BUS_WIDTH-1:0] qout;
genvar i ;
generate 
    for(i = 0;i < BUS_WIDTH; i = i+1) begin:SYNC2_CELL_BK
        sync2_cell u_sync2_cell(
            .clk(clk), 
            .reset(reset), 
            .data(data[i]), 
            .qout(qout[i]));
    end
endgenerate

endmodule


module sync2_cell (clk, reset, data, qout);
input clk, reset, data;
output qout;

//wire reset_n;

`ifdef ADD_WAM
`WAM_PROC
SDFSYNC2RPQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CP_D(clk), .D(in_sync_wam), .CD_D(reset) );
`else
//Inv_Wrap U_DONT_RST_INV (.A(reset), .ZN(reset_n));
SDFSYNC2RPQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CP_D(clk), .D(data), .CD_D(reset) );
`endif

endmodule

module sync2_cell_dly (clk, reset, data, qout);
input clk, reset, data;
output qout;

`ifdef ADD_WAM
`WAM_PROC
SDFSYNC2RPQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CP_D(clk), .D(in_sync_wam), .CD_D(reset) );
`else
SDFSYNC2RPQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CP_D(clk), .D(data), .CD_D(reset) );
`endif

endmodule

module sync2_cell_rstb (clk, reset_n, data, qout);
input clk, reset_n, data;
output qout;

wire reset;
Inv_Wrap U_DONT_RST_INV (.A(reset_n), .ZN(reset));
`ifdef ADD_WAM
`WAM_PROC
SDFSYNC2RPQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CP_D(clk), .D(in_sync_wam), .CD_D(reset) );
`else
SDFSYNC2RPQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CP_D(clk), .D(data), .CD_D(reset) );
`endif

endmodule


module sync2_cell_set (clk, set, data, qout);
input clk, set, data;
output qout;

wire set_n;

Inv_Wrap U_DONT_RST_INV (.A(set), .ZN(set_n));
`ifdef ADD_WAM
`WAM_PROC
SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(in_sync_wam), .SDN(set_n));
`else
SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(data), .SDN(set_n));
`endif

endmodule

module sync2_cell_set_dly (clk, set, data, qout);
input clk, set, data;
output qout;

wire   set_n;

Inv_Wrap U_DONT_RST_INV (.A(set), .ZN(set_n));
`ifdef ADD_WAM
`WAM_PROC
SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(in_sync_wam), .SDN(set_n));
`else
SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(data), .SDN(set_n));
`endif

endmodule
module sync2_cell_setb (clk, set_n, data, qout);
input clk, set_n, data;
output qout;

`ifdef ADD_WAM
`WAM_PROC
SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(in_sync_wam), .SDN(set_n));
`else
SDFSYNC2SNQ_DO_Wrap U_DONT_SYNC2( .Q(qout), .CK(clk), .D(data), .SDN(set_n));
`endif

endmodule

module pulse_sync_hs(SRC_CK, SRC_RST, DST_CK, DST_RST, SRC_PULSE, DST_PULSE);
/*
hs: hand shake
Sync Type: High pulse sync hand shake
Pulse MODE: 0: aligned the rise edge of the destination clock, 1: aligned the falling edge of the destination clock.
Limitation: The space between two continuous high pulse should be greater than 2SRC_CK + 2DST_CK cycles.
This module is to synchronize clock pulse from one clock domain to another, from SRC_CK to DST_CK
This synchronization is done by asserting internal signal when input pulse comes in and reset it when output pulse is generated
The limitation is input pulse cannot come continuously faster than DST_CK
If it does come too fast, before DST_PULSE is generated, only the first pulse will pass through, intermediate ones will be ignored
This module is suitable when SRC_PULSE is possibly generated multiple times to deliver the same message
2023-08-17 Bin Yuan
*/
input         SRC_CK; //Source clock
input         SRC_RST; //Source reset
input         DST_CK;//Destination clock
input         DST_RST;//Destination Reset
input         SRC_PULSE; //Source rise edge clock, last for one clock cycle, otherwise will case an assertion error
output        DST_PULSE; //Destination rise edge clock, last for one clock cycle

parameter PULSE_MODE = 0; //0: rise edge detect in destinaton domain, 1: falling edge detect in the destination domain

reg    src_level;
wire   dst_level;
reg    dst_level_d1;
wire   src_level_feedback;

always@(posedge SRC_CK or posedge SRC_RST)
  if(SRC_RST) src_level <= 1'b0;
  else if (src_level_feedback) src_level <= 1'b0;
  else if (SRC_PULSE) src_level <= 1'b1;

sync2_cell u_pulse_sync_1 (.clk(DST_CK), .reset(DST_RST), .data(src_level), .qout(dst_level));

always@(posedge DST_CK or posedge DST_RST)
  if(DST_RST) dst_level_d1 <= 1'b0;
  else dst_level_d1 <= dst_level;
  
generate 
   if(PULSE_MODE <= 0) begin : GEN_PLSMD0
      assign DST_PULSE = dst_level & ~dst_level_d1; //rising edge
   end
   if(PULSE_MODE == 1) begin : GEN_PLSMD1
      assign DST_PULSE = ~dst_level & dst_level_d1; //falling edge
   end
//   if(PULSE_MODE == 2) begin: GEN_PLSMD2
//      assign DST_PULSE = dst_level ^ dst_level_d1; //edge detect
//   end
endgenerate

sync2_cell u_pulse_sync_2 (.clk(SRC_CK), .reset(SRC_RST), .data(dst_level), .qout(src_level_feedback));

`ifdef _CDC_SIM_CHCK
assert property (@(posedge SRC_CK) disable iff (!DST_RST) SRC_PULSE |-> ##1 !SRC_PULSE) else $error("source pulse last for more than one clock cycle!"); //pulse must be only one cycle
assert property (@(posedge SRC_CK) disable iff (!DST_RST) SRC_PULSE |-> src_level) $error ("Detect the space of the two continuouse pusles is underflow the safe space clock cycle!");//
`endif

endmodule


module pulse_sync_hs_ack(SRC_CK, SRC_RST, DST_CK, DST_RST, SRC_PULSE, DST_PULSE, PULSE_ACK, IS_BUSY);
/*
hs: hand shake
Sync Type: High pulse sync hand shake
Pulse MODEL: 0: aligned the rise edge of the destination clock, 1: aligned the falling edge of the destination clock.
Limitation: The space between two continuous high pulse should be greater than 2SRC_CK + 2DST_CK cycles.
This module is to synchronize clock pulse from one clock domain to another, from SRC_CK to DST_CK
This synchronization is done by asserting internal signal when input pulse comes in and reset it when output pulse is generated
The limitation is input pulse cannot come continuously faster than DST_CK
If it does come too fast, before DST_PULSE is generated, only the first pulse will pass through, intermediate ones will be ignored
This module is suitable when SRC_PULSE is possibly generated multiple times to deliver the same message
2023-08-17 Bin Yuan
*/
input         SRC_CK; //Source clock
input         SRC_RST; //Source reset
input         DST_CK;//Destination clock
input         DST_RST;//Destination Reset
input         SRC_PULSE; //Source rise edge clock, last for one clock cycle, otherwise will case an assertion error
output        DST_PULSE; //Destination rise edge clock, last for one clock cycle
output        PULSE_ACK; //One clock cycle pulse
output        IS_BUSY;  //Indicate the Synchronizer is busy

parameter PULSE_MODE = 0; //0: rise edge detect in destinaton domain, 1: falling edge detect in the destination domain

reg    src_level;
reg    src_level_d1;
wire   dst_level;
reg    dst_level_d1;
wire   src_level_feedback;

always@(posedge SRC_CK or posedge SRC_RST)
  if(SRC_RST) src_level <= 1'b0;
  else if (src_level_feedback) src_level <= 1'b0;
  else if (SRC_PULSE) src_level <= 1'b1;

sync2_cell u_pulse_sync_1 (.clk(DST_CK), .reset(DST_RST), .data(src_level), .qout(dst_level));

always@(posedge DST_CK or posedge DST_RST)
  if(DST_RST) dst_level_d1 <= 1'b0;
  else dst_level_d1 <= dst_level;
generate 
   if(PULSE_MODE <= 0) begin : GEN_PLSMD0
      assign DST_PULSE = dst_level & ~dst_level_d1; //rising edge
   end
   if(PULSE_MODE == 1) begin: GEN_PLSMD1
      assign DST_PULSE = ~dst_level & dst_level_d1; //falling edge
   end
endgenerate

sync2_cell u_pulse_sync_2 (.clk(SRC_CK), .reset(SRC_RST), .data(dst_level), .qout(src_level_feedback));

always@(posedge SRC_CK or posedge SRC_RST)
  if(SRC_RST) src_level_d1 <= 1'b0;
  else src_level_d1 <= src_level;
  
assign PULSE_ACK = ~src_level & src_level_d1;
assign IS_BUSY = src_level;

`ifdef _CDC_SIM_CHCK
assert property (@(posedge SRC_CK) disable iff (!DST_RST) SRC_PULSE |-> ##1 !SRC_PULSE) else $error("source pulse last for more than one clock cycle!"); //pulse must be only one cycle
assert property (@(posedge SRC_CK) disable iff (!DST_RST) SRC_PULSE |-> src_level) $error ("Detect the space of the two continuouse pusles is underflow the safe space clock cycle!");//
`endif

endmodule


module databus_sync_dmux (/*AUTOARG*/SRC_CK,SRC_RST,SRC_DATA,SRC_PULSE,DST_CK,DST_RST,DST_DATA,DST_PULSE);
/*
Data Bus Sync Type: Data MuX structure
Limitation: The space between two continuous high pulse should be greater than 2SRC_CK + 2DST_CK cycles. Otherwise the bus sync will be not valid. 
                    For PT check, the bus max delay from "src_data_ff" to "dst_data_ff" must less than one DST_CK clock cycle, recommend to set the bus max delay is half of the period of the destination clock.
This module is to synchronize the data from one clock domain to another, from SRC_CK to DST_CK
This synchronization is done by using the Pulse rising edge handshake synchromizator "pulse_sync_hs"
The limitation is input pulse cannot come continuously faster than DST_CK
If it does come too fast, before DST_PULSE is generated, only the first pulse will pass through, intermediate ones will be ignored
This module is suitable when SRC_PULSE is possibly generated multiple times to deliver the same message
The max bus max delay from "src_data_ff" to "dst_data_ff" must less than one DST_CK clock cycle, recommend to set the bus max delay is half of the period of the destination clock.
2023-08-30 Bin Yuan
*/
parameter D_WIDTH = 8;

input [D_WIDTH-1:0] SRC_DATA;
input               SRC_PULSE;//
input SRC_CK;
input SRC_RST;
input DST_CK;
input DST_RST;
output [D_WIDTH-1:0] DST_DATA;
output               DST_PULSE;

reg [D_WIDTH-1: 0] src_data_ff;
reg [D_WIDTH-1: 0] dst_data_ff;
reg                src_pulse_d1;
reg                DST_PULSE;

wire [D_WIDTH-1:0] DST_DATA;
wire               dst_pule_ack;

always @(posedge SRC_CK or posedge SRC_RST) begin
    if(SRC_RST) src_data_ff <= {D_WIDTH{1'b0}};
    else if(SRC_PULSE) src_data_ff <= SRC_DATA;
end
always @(posedge SRC_CK or posedge SRC_RST) begin
    if(SRC_RST) src_pulse_d1 <= 1'b0;
    else src_pulse_d1 <= SRC_PULSE;//delay pulse for one clock cycle to make sure that src_data_ff is stable before synced it to the destination clock domain. 
end

pulse_sync_hs  #(.PULSE_MODE(1'b0)) u_pulse_sync_hs(.SRC_CK(SRC_CK), .SRC_RST(SRC_RST), .DST_CK(DST_CK), .DST_RST(DST_RST), .SRC_PULSE(src_pulse_d1), .DST_PULSE(dst_pule_ack));

always @(posedge DST_CK or posedge DST_RST) begin
    if(DST_RST) dst_data_ff <=  {D_WIDTH{1'b0}};
    else if(dst_pule_ack) dst_data_ff <= src_data_ff;
end
always @(posedge DST_CK or posedge DST_RST) begin
    if(DST_RST) DST_PULSE <=  1'b0;
    else DST_PULSE <= dst_pule_ack;
end

assign DST_DATA = dst_data_ff;

endmodule

module databus_sync_dmux_ack (/*AUTOARG*/SRC_CK,SRC_RST,SRC_DATA,SRC_PULSE,SRC_IS_BUSY,DST_CK,DST_RST,DST_DATA,DST_PULSE);
/*
Data Bus Sync Type: Data MuX Structure with ACK
Limitation: The space between two continuous high pulse should be greater than 2SRC_CK + 2DST_CK cycles. Otherwise the bus sync will be not valid. 
            For PT check, the bus max delay from "src_data_ff" to "dst_data_ff" must less than one DST_CK clock cycle, recommend to set the bus max delay is half of the period of the destination clock. 
            When SRC_IS_BUSY is asserted, indicate the synchronizator is busy. When the SRC_IS_BUSY = 1, the incoming SRC_PULSE will be ignored.
This module is to synchronize the data from one clock domain to another, from SRC_CK to DST_CK
This synchronization is done by using the Pulse rising edge handshake synchromizator "pulse_sync_hs"
The limitation is input pulse cannot come continuously faster than DST_CK
If it does come too fast, before DST_PULSE is generated, only the first pulse will pass through, intermediate ones will be ignored
This module is suitable when SRC_PULSE is possibly generated multiple times to deliver the same message
The max bus max delay from "src_data_ff" to "dst_data_ff" must less than one DST_CK clock cycle, recommend to set the bus max delay is half of the period of the destination clock.
2023-08-30 Bin Yuan
*/
parameter D_WIDTH = 8;

input [D_WIDTH-1:0] SRC_DATA;
input               SRC_PULSE;//
input  SRC_CK;
input  SRC_RST;
input  DST_CK;
input  DST_RST;
output [D_WIDTH-1:0] DST_DATA;
output               DST_PULSE;
output               SRC_IS_BUSY; //when it is asserted, indicate the synchronizator is busy, the 

reg [D_WIDTH-1: 0] src_data_ff;
reg [D_WIDTH-1: 0] dst_data_ff;
reg                src_pulse_d1;
reg                DST_PULSE;
reg                SRC_IS_BUSY;

wire [D_WIDTH-1:0] DST_DATA;
wire               dst_pule_ack;
wire               is_busy;
wire               is_busy_fall;
wire               src_pulse_gated;

assign  src_pulse_gated = SRC_PULSE & ~SRC_IS_BUSY;
always @(posedge SRC_CK or posedge SRC_RST) begin
    if(SRC_RST) src_data_ff <= {D_WIDTH{1'b0}};
    else if(src_pulse_gated) src_data_ff <= SRC_DATA;
end

always @(posedge SRC_CK or posedge SRC_RST) begin
    if(SRC_RST) src_pulse_d1 <= 1'b0;
    else src_pulse_d1 <= src_pulse_gated; //delay pulse for one clock cycle to make sure that src_data_ff is stable before synced it to the destination clock domain. 
end
pulse_sync_hs_ack  #(.PULSE_MODE(1'b0)) u_pulse_sync_hs_ack(/*AUTOINST*/.SRC_CK(SRC_CK), .SRC_RST(SRC_RST), .DST_CK(DST_CK), .DST_RST(DST_RST), .SRC_PULSE(src_pulse_d1), .DST_PULSE(dst_pule_ack), .IS_BUSY(is_busy));

always @(posedge SRC_CK or posedge SRC_RST) begin
    if(SRC_RST) SRC_IS_BUSY <= 1'b0;
    else if ( is_busy_fall ) SRC_IS_BUSY <= 1'b0;
    else if (SRC_PULSE) SRC_IS_BUSY <= 1'b1;
end
edge_det #(.PULSE_MODE(1'b1)) u_is_busy (.clk(SRC_CK),.reset(SRC_RST),.din(is_busy),.d_edge(is_busy_fall));//falling edge detect

always @(posedge DST_CK or posedge DST_RST) begin
    if(DST_RST) dst_data_ff <=  {D_WIDTH{1'b0}};
    else if(dst_pule_ack) dst_data_ff <= src_data_ff;
end
always @(posedge DST_CK or posedge DST_RST) begin
    if(DST_RST) DST_PULSE <=  1'b0;
    else DST_PULSE <= dst_pule_ack;
end
assign DST_DATA = dst_data_ff;

endmodule


//module MIPI_HOST_DWC_mipi_csi2_host_bcm23 (
//             clk_s, 
//             rst_s_n, 
//             event_s, 
//             ack_s,
//             busy_s,
//
//             clk_d, 
//             rst_d_n, 
//             event_d
//             );
//
// parameter REG_EVENT    = 1;    // RANGE 0 to 1
// parameter REG_ACK      = 1;    // RANGE 0 to 1
// parameter ACK_DELAY    = 1;    // RANGE 0 to 1
// parameter F_SYNC_TYPE  = 2;    // RANGE 0 to 4
// parameter R_SYNC_TYPE  = 2;    // RANGE 0 to 4
// parameter VERIF_EN     = 1;    // RANGE 0 to 4
// parameter PULSE_MODE   = 0;    // RANGE 0 to 3
// parameter SVA_TYPE     = 0;
//
// 
//input  clk_s;                   // clock input for source domain
//input  rst_s_n;                 // active low async. reset in clk_s domain
//input  event_s;                 // event pulseack input (active high event)
//output ack_s;                   // event pulseack output (active high event)
//output busy_s;                  // event pulseack output (active high event)
//
//input  clk_d;                   // clock input for destination domain
//input  rst_d_n;                 // active low async. reset in clk_d domain
//output event_d;                 // event pulseack output (active high event)
//
//wire   tgl_s_event_cc;
//wire   tgl_d_event_cc;
//reg    tgl_s_event_q;
//reg    tgl_s_evnt_nfb_cdc;
//wire   tgl_s_ack_x;
//reg    event_s_cap;
//
//wire   tgl_s_event_x;
//wire   tgl_d_event_d;
//wire   tgl_d_event_a;
//
//wire   tgl_s_ack_d;
//reg    srcdom_ack;
//reg    tgl_s_ack_q;
//wire   nxt_busy_state;
//reg    busy_state;
//wire   tgl_d_event_dx;    // event seen via edge detect (before registered)
//reg    tgl_d_event_q;     // registered version of event seen
//reg    tgl_d_event_qx;    // xor of dest dom data and registered version
//
//`ifndef SYNTHESIS
//`ifndef DWC_DISABLE_CDC_METHOD_REPORTING
//  initial begin
//    if ((F_SYNC_TYPE > 0)&&(F_SYNC_TYPE < 8))
//       $display("Information: *** Instance %m module is using the <Toggle Type Event Sychronizer with busy and acknowledge (3)> Clock Domain Crossing Method ***");
//  end
//
//`endif
//`endif
//
//  
//  always @ (posedge clk_s or negedge rst_s_n) begin : event_lauch_reg_PROC
//    if (rst_s_n == 1'b0) begin
//      tgl_s_event_q    <= 1'b0;
//      tgl_s_evnt_nfb_cdc<= 1'b0;
//      busy_state       <= 1'b0;
//// spyglass disable_block W528
//// SMD: A signal or variable is set but never read
//// SJ: Based on component configuration, this(these) signal(s) or parts of it will not be used to compute the final result.
//      srcdom_ack       <= 1'b0;
//// spyglass enable_block W528
//      tgl_s_ack_q      <= 1'b0;
//// spyglass disable_block W528
//// SMD: A signal or variable is set but never read
//// SJ: Based on component configuration, this(these) signal(s) or parts of it will not be used to compute the final result.
//      event_s_cap      <= 1'b0;
//// spyglass enable_block W528
//    end else begin
//      tgl_s_event_q    <= tgl_s_event_x;
//      tgl_s_evnt_nfb_cdc<= tgl_s_event_x;
//      busy_state       <= nxt_busy_state;
//      srcdom_ack       <= tgl_s_ack_x;
//      tgl_s_ack_q      <= tgl_s_ack_d;
//      event_s_cap      <= event_s;
//    end 
//  end // always : event_lauch_reg_PROC
//
//
//
//  assign tgl_s_event_cc = tgl_s_evnt_nfb_cdc;
//
//  MIPI_HOST_DWC_mipi_csi2_host_bcm21
//   #(1, F_SYNC_TYPE+8, VERIF_EN, 1) U_DW_SYNC_F(
//        .clk_d(clk_d),
//        .rst_d_n(rst_d_n),
//        .data_s(tgl_s_event_cc),
//        .data_d(tgl_d_event_d) );
//
//
//  assign tgl_d_event_cc = tgl_d_event_a;
//
//  MIPI_HOST_DWC_mipi_csi2_host_bcm21
//   #(1, R_SYNC_TYPE+8, VERIF_EN, 1) U_DW_SYNC_R(
//        .clk_d(clk_s),
//        .rst_d_n(rst_s_n),
//        .data_s(tgl_d_event_cc),
//        .data_d(tgl_s_ack_d) );
//
//  always @ (posedge clk_d or negedge rst_d_n) begin : second_sync_PROC
//    if (rst_d_n == 1'b0) begin
//      tgl_d_event_q      <= 1'b0;
//// spyglass disable_block W528
//// SMD: A signal or variable is set but never read
//// SJ: Based on component configuration, this(these) signal(s) or parts of it will not be used to compute the final result.
//      tgl_d_event_qx     <= 1'b0;
//// spyglass enable_block W528
//    end else begin
//      tgl_d_event_q      <= tgl_d_event_d;
//      tgl_d_event_qx     <= tgl_d_event_dx;
//    end
//  end // always
//
//
//generate
//    
//    if (PULSE_MODE <= 0) begin : GEN_PLSMD0
//      assign tgl_s_event_x = tgl_s_event_q   ^ (event_s && (! busy_state));
//    end
//    
//    if (PULSE_MODE == 1) begin : GEN_PLSMD1
//      assign tgl_s_event_x = tgl_s_event_q   ^ (! busy_state &(event_s & (! event_s_cap)));
//    end
//    
//    if (PULSE_MODE == 2) begin : GEN_PLSMD2
//      assign tgl_s_event_x = tgl_s_event_q  ^ (! busy_state &(event_s_cap & (!event_s)));
//    end
//    
//    if (PULSE_MODE >= 3) begin : GEN_PLSMD3
//      assign tgl_s_event_x = tgl_s_event_q ^ (! busy_state & (event_s ^ event_s_cap));
//    end
//
//endgenerate
//  assign tgl_d_event_dx = tgl_d_event_d ^ tgl_d_event_q;
//  //assign tgl_s_event_x  = tgl_s_event_q ^ (event_s & ! busy_s);
//  assign tgl_s_ack_x    = tgl_s_ack_d   ^ tgl_s_ack_q;
//  assign nxt_busy_state = tgl_s_event_x ^ tgl_s_ack_d;
//
//  generate
//    if (REG_EVENT == 0) begin : GEN_RGEVT0
//      assign event_d       = tgl_d_event_dx;
//    end
//
//    else begin : GEN_RGRVT1
//      assign event_d       = tgl_d_event_qx;
//    end
//  endgenerate
//
//  generate
//    if (REG_ACK == 0) begin : GEN_RGACK0
//      assign ack_s         = tgl_s_ack_x;
//    end
//
//    else begin : GEN_RGACK1
//      assign ack_s         = srcdom_ack;
//    end
//  endgenerate
//
//  generate
//    if (ACK_DELAY == 0) begin : GEN_AKDLY0
//      assign tgl_d_event_a = tgl_d_event_d;
//    end
//
//    else begin : GEN_AKDLY1
//      reg tgl_d_event_nfb_cdc;
//
//      always @ (posedge clk_d or negedge rst_d_n) begin : third_sync_PROC
//        if (rst_d_n == 1'b0) begin
//          tgl_d_event_nfb_cdc <= 1'b0;
//        end else begin
//          tgl_d_event_nfb_cdc <= tgl_d_event_d;
//        end
//      end // always
//
//      assign tgl_d_event_a = tgl_d_event_nfb_cdc;
//    end
//  endgenerate
//
//
//  assign busy_s = busy_state;
//
//`ifdef DWC_BCM_SNPS_ASSERT_ON
//`ifndef SYNTHESIS
//
//  DWC_mipi_csi2_host_sva03 #(F_SYNC_TYPE&7,  PULSE_MODE) P_PULSEACK_SYNC_HS (.*);
//
//  generate if (SVA_TYPE == 1) begin : GEN_SVATP_EQ_1
//    DWC_mipi_csi2_host_sva02 #(
//      .F_SYNC_TYPE    (F_SYNC_TYPE&7),
//      .PULSE_MODE     (PULSE_MODE   )
//    ) P_PULSE_SYNC_HS (
//        .clk_s        (clk_s        )
//      , .rst_s_n      (rst_s_n      )
//      , .event_s      (event_s      )
//      , .event_d      (event_d      )
//    );
//  end endgenerate
//
//  generate if ((F_SYNC_TYPE==0) || (R_SYNC_TYPE==0)) begin : GEN_SINGLE_CLOCK_CANDIDATE
//    DWC_mipi_csi2_host_sva07 #(F_SYNC_TYPE, R_SYNC_TYPE) P_CDC_CLKCOH (.*);
//  end endgenerate
//
//`endif // SYNTHESIS
//`endif // DWC_BCM_SNPS_ASSERT_ON
//
//endmodule
//
module edge_det (clk,reset,din,d_edge);
/*

*/
parameter PULSE_MODE = 0; // 0: rising edge; 1: falling edge ; 2: both rising edge or falling edge

input  clk;
input  reset;
input  din;
output d_edge;

reg din_d;

always @(posedge clk or posedge reset) begin
    if(reset) din_d <= 1'b0;
    else din_d <= din;
end

generate 
   if(PULSE_MODE <= 0) begin : GEN_PLSMD0
      assign d_edge = din & ~din_d; //rising edge
   end
   if(PULSE_MODE == 1) begin: GEN_PLSMD1
      assign d_edge = ~din & din_d; //falling edge
   end
   if(PULSE_MODE == 2) begin: GEN_PLSMD2
      assign d_edge = din ^ din_d;
   end
endgenerate

endmodule
