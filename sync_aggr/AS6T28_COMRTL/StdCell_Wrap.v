
/////////////////////////////////////////////////
////////      STD Cell Wrap File  ///////////////
/////////////////////////////////////////////////
//V0.1 initial version, create in 2022/6/29, by yanhaitao


//timescale
`timescale 1ns/1ps

//define
//`define SIM
//`define FPGA
//`define TSMC_6NM_6T_LVT

//`define ARM_UD_MODEL
//`define UMCARM_28HPCP_9TLVT
//`define UMCARM_28HPCP_7TLVT

//CKInv_Wrap module
module CKInv_Wrap (
input A,
output ZN
);

`ifdef SIM
 assign ZN = ~A;
`elsif FPGA
      assign ZN = ~A;
   `elsif TSMC_6NM_6T_LVT
        CKND4BWP240H8P57CPDLVT U0_CKINV(
          .ZN  (ZN),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        INV_X4B_A9PP140ZTL_C35 U0_CKINV(
          .Y   (ZN),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        INV_X4B_A7PP140ZTL_C35 U0_CKINV(
          .Y   (ZN),
          .A   (A)
          ); 
     `else
          assign ZN = ~A;
`endif
endmodule
module CKInv_X16_Wrap (
input A,
output ZN
);

`ifdef SIM
 assign ZN = ~A;
`elsif FPGA
      assign ZN = ~A;
   `elsif TSMC_6NM_6T_LVT
        CKND16BWP240H8P57CPDLVT U0_CKINV(
          .ZN  (ZN),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        INV_X16B_A9PP140ZTL_C35 U0_CKINV(
          .Y   (ZN),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        INV_X16B_A7PP140ZTL_C35 U0_CKINV(
          .Y   (ZN),
          .A   (A)
          ); 
     `else
          assign ZN = ~A;
`endif
endmodule

//CKBuf_Wrap module
module CKBuf_Wrap (
input A,
output Z
);

`ifdef SIM
 assign Z = A;
`elsif FPGA
      assign Z = A;
   `elsif TSMC_6NM_6T_LVT
        CKBD4BWP240H8P57CPDLVT U0_CKBUF(
          .Z  (Z),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        BUF_X4B_A9PP140ZTL_C35 U0_CKBUF(
          .Y   (Z),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        BUF_X4B_A7PP140ZTL_C35 U0_CKBUF(
          .Y   (Z),
          .A   (A)
          ); 
   `else
          assign Z = A;
`endif
endmodule

//CKBuf_Wrap module
//CKBuf_Wrap_X16 module
module CKBuf_X16_Wrap (
input A,
output Z
);

`ifdef SIM
 assign Z = A;
`elsif FPGA
      assign Z = A;
   `elsif TSMC_6NM_6T_LVT
        CKBD16BWP240H8P57CPDLVT U0_CKBUF(
          .Z  (Z),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        BUF_X16B_A9PP140ZTL_C35 U0_CKBUF(
          .Y   (Z),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        BUF_X16B_A7PP140ZTL_C35 U0_CKBUF(
          .Y   (Z),
          .A   (A)
          ); 
   `else
          assign Z = A;
`endif
endmodule

//CKBuf_Wrap X16 module


module OCC_BUF_Wrap (
input A,
input PIN_SCN,
input PIN_SCN_CLK,
output Z
);

`ifdef SIM
 assign Z = A;
`elsif FPGA
      assign Z = A;
   `elsif TSMC_6NM_6T_LVT
        CKBD4BWP240H8P57CPDLVT U0_CKBUF(
          .Z  (Z),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        BUF_X4B_A9PP140ZTL_C35 U0_CKBUF(
          .Y   (Z),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        BUF_X4B_A7PP140ZTL_C35 U0_CKBUF(
          .Y   (Z),
          .A   (A)
          ); 
   `else
          assign Z = A;
`endif
endmodule

//CKAnd2_Wrap module
module CKAnd2_Wrap (
input A1,
input A2,
output Z
);

`ifdef SIM
 assign Z = A1 && A2;
`elsif FPGA
      assign Z = A1 && A2;
   `elsif TSMC_6NM_6T_LVT
        CKAN2D4BWP240H8P57CPDLVT U0_CKAND2(
          .Z  (Z),
          .A1 (A1),
          .A2 (A2)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        AND2_X4B_A9PP140ZTL_C35 U0_CKAND2(
          .Y   (Z),
          .A   (A1),
          .B   (A2)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        AND2_X4B_A7PP140ZTL_C35 U0_CKAND2(
          .Y   (Z),
          .A   (A1),
          .B   (A2)
          ); 
         `else
          assign Z = A1 && A2;
`endif
endmodule
//CKNor2_Wrap modul
module CKNor2_Wrap (
input A,
input B,
output Y
);
`ifdef SIM
 assign Y = !(A | B);
 `elsif UMCARM_28HPCP_7TLVT
    NOR2_X4B_A7PP140ZTL_C35 U0_CKNOR2(
        .Y(Y),
        .A(A),
        .B(B)
    );
  `else
    assign Y = !(A | B);
`endif
endmodule
//CKNand2_Wrap module
module CKNand2_Wrap (
input A,
input B,
output ZN
);

`ifdef SIM
 assign ZN = !(A && B);
`elsif FPGA
      assign ZN = !(A && B);
   `elsif TSMC_6NM_6T_LVT
        CKNAN2D4BWP240H8P57CPDLVT U0_CKNAND2(
          .ZN (ZN),
          .A1 (A),
          .A2 (B)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        NAND2_X4B_A9PP140ZTL_C35 U0_CKNAND2(
          .Y   (ZN),
          .A   (A),
          .B   (B)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        NAND2_X4B_A7PP140ZTL_C35 U0_CKNAND2(
          .Y   (ZN),
          .A   (A),
          .B   (B)
          ); 
         `else
          assign ZN = !(A && B);
`endif
endmodule

//CKOr2_Wrap module
module CKOr2_Wrap (
input A1,
input A2,
output Z
);

`ifdef SIM
 assign Z = A1 || A2;
`elsif FPGA
      assign Z = A1 || A2;  //fpga no clockor
   `elsif TSMC_6NM_6T_LVT
        CKOR2D4BWP240H8P57CPDLVT U0_CKOR2(
          .Z  (Z),
          .A1 (A1),
          .A2 (A2)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        OR2_X4B_A9PP140ZTL_C35 U0_CKOR2(
          .Y   (Z),
          .A   (A1),
          .B   (A2)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        OR2_X4B_A7PP140ZTL_C35 U0_CKOR2(
          .Y   (Z),
          .A   (A1),
          .B   (A2)
          ); 
         `else
          assign Z = A1 || A2;
`endif
endmodule

//CKMux2_Wrap module
module CKMux2_Wrap (
input A,
input B,
input S,
output Z
);

`ifdef SIM
 assign Z = S ? B : A;
`elsif FPGA
    //default sel clock mux, "defparam" can synthesis by vivado
    parameter [1:0] SEL = 2'd2;  
    generate 
        if (SEL == 2'd0) begin : sel_clock_a
            assign Z = A;
        end else if (SEL == 2'd1) begin : sel_clock_b
            assign Z = B;
        end else if (SEL == 2'd2) begin : clock_mux
            assign Z = S ? B : A;
        end else begin : clock_bufg_mux  //fpga SYNC MUX
            `ifdef FPGA_SIM
              assign Z = S ? B : A;
            `else
              BUFGMUX #(.CLK_SEL_TYPE("SYNC")) BUFGMUX_inst (.O(Z), .I0(A), .I1(B), .S(S));
            `endif
        end
    endgenerate

   `elsif TSMC_6NM_6T_LVT
        CKMUX2D4BWP240H8P57CPDLVT U0_CKMUX2(
          .Z  (Z),
          .I0 (A),
          .I1 (B),
          .S  (S )
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        MX2_X4B_A9PP140ZTL_C35 U0_CKMUX2(
          .Y   (Z),
          .A   (A),
          .B   (B),
          .S0  (S)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        MX2_X4B_A7PP140ZTL_C35 U0_CKMUX2(
          .Y   (Z),
          .A   (A),
          .B   (B),
          .S0  (S)
          ); 
         `else
          assign Z = S ? B : A;
`endif
endmodule

//Inv_Wrap module
module Inv_Wrap (
input A,
output ZN
);

`ifdef SIM
 assign ZN = ~A;
`elsif FPGA
      assign ZN = ~A;
   `elsif TSMC_6NM_6T_LVT
        INVD1BWP240H8P57CPDLVT U0_INV(
          .ZN  (ZN),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        INV_X4B_A9PP140ZTL_C35 U0_INV(
          .Y   (ZN),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        INV_X4B_A7PP140ZTL_C35 U0_INV(
          .Y   (ZN),
          .A   (A)
          ); 
         `else
          assign ZN = ~A;
`endif
endmodule

//Inv_Wrap module
module Inv_X16_Wrap (
input A,
output ZN
);

`ifdef SIM
 assign ZN = ~A;
`elsif FPGA
      assign ZN = ~A;
   `elsif TSMC_6NM_6T_LVT
        INVD16BWP240H8P57CPDLVT U0_INV(
          .ZN  (ZN),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        INV_X16B_A9PP140ZTL_C35 U0_INV(
          .Y   (ZN),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        INV_X16B_A7PP140ZTL_C35 U0_INV(
          .Y   (ZN),
          .A   (A)
          ); 
         `else
          assign ZN = ~A;
`endif
endmodule

//Buf_Wrap module
module Buf_Wrap (
input A,
output Z
);

`ifdef SIM
 assign Z = A;
`elsif FPGA
      assign Z = A;
   `elsif TSMC_6NM_6T_LVT
        BUFFD1BWP240H8P57CPDLVT U0_BUF(
          .Z  (Z),
          .I   (A)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        BUF_X4B_A9PP140ZTL_C35 U0_BUF(
          .Y   (Z),
          .A   (A)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        BUF_X4B_A7PP140ZTL_C35 U0_BUF(
          .Y   (Z),
          .A   (A)
          ); 
         `else
          assign Z = A;
`endif
endmodule

//and2_Wrap module
module And2_Wrap (
input A,
input B,
output Z
);

`ifdef SIM
 assign Z = A && B;
`elsif FPGA
      assign Z = A && B;
   `elsif TSMC_6NM_6T_LVT
        AN2D4BWP240H8P57CPDLVT U0_AND2(
          .Z  (Z),
          .A1 (A),
          .A2 (B)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        AND2_X4B_A9PP140ZTL_C35 U0_AND2(
          .Y   (Z),
          .A   (A),
          .B   (B)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        AND2_X4B_A7PP140ZTL_C35 U0_AND2(
          .Y   (Z),
          .A   (A),
          .B   (B)
          ); 
         `else
          assign Z = A && B;
`endif
endmodule

//Nand2_Wrap module
module Nand2_Wrap (
input A,
input B,
output ZN
);

`ifdef SIM
 assign ZN = !(A && B);
`elsif FPGA
      assign ZN = !(A && B);
   `elsif TSMC_6NM_6T_LVT
        NAN2D4BWP240H8P57CPDLVT U0_NAND2(
          .ZN (ZN),
          .A1 (A),
          .A2 (B)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        NAND2_X4B_A9PP140ZTL_C35 U0_NAND2(
          .Y   (ZN),
          .A   (A),
          .B   (B)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        NAND2_X4B_A7PP140ZTL_C35 U0_NAND2(
          .Y   (ZN),
          .A   (A),
          .B   (B)
          ); 
         `else
          assign ZN = !(A && B);
`endif
endmodule

//Or2_Wrap module
module Or2_Wrap (
input A1,
input A2,
output Z
);

`ifdef SIM
 assign Z = A1 || A2;
`elsif FPGA
      assign Z = A1 || A2;
   `elsif TSMC_6NM_6T_LVT
        OR2D4BWP240H8P57CPDLVT U0_OR2(
          .Z  (Z),
          .A1 (A1),
          .A2 (A2)
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        OR2_X4B_A9PP140ZTL_C35 U0_OR2(
          .Y   (Z),
          .A   (A1),
          .B   (A2)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        OR2_X4B_A7PP140ZTL_C35 U0_OR2(
          .Y   (Z),
          .A   (A1),
          .B   (A2)
          ); 
         `else
          assign Z = A1 || A2;
`endif
endmodule

//Mux2_Wrap module
module Mux2_Wrap (
input A,
input B,
input S,
output Z
);

`ifdef SIM
 assign Z = S ? B : A;
`elsif FPGA
      assign Z = S ? B : A;
   `elsif TSMC_6NM_6T_LVT
        MUX2D1BWP240H8P57CPDLVT U0_MUX2(
          .Z  (Z),
          .I0 (A),
          .I1 (B),
          .S  (S )
          ); 
   `elsif UMCARM_28HPCP_9TLVT
        MX2_X4B_A9PP140ZTL_C35 U0_MUX2(
          .Y   (Z),
          .A   (A),
          .B   (B),
          .S0  (S)
          ); 
   `elsif UMCARM_28HPCP_7TLVT
        MX2_X4B_A7PP140ZTL_C35 U0_MUX2(
          .Y   (Z),
          .A   (A),
          .B   (B),
          .S0  (S)
          ); 
         `else
          assign Z = S ? B : A;
`endif
endmodule

//SDFRPQ_Wrap module
module SDFRPQ_Wrap (
input CP,
input D,
input CD,
output Q
);

`ifdef SIM
  reg Q_Int;
  always @(posedge CP or posedge CD) begin 
    if(CD == 1'b1) begin
      Q_Int <= 1'b0;
    end else begin
      Q_Int <= D;
      end
  end
  assign Q = Q_Int;
`elsif FPGA
      reg Q_Int;
      always @(posedge CP or posedge CD) begin 
           if(CD == 1'b1) begin
             Q_Int <= 1'b0;
           end else begin
             Q_Int <= D;
             end
         end
       assign Q = Q_Int;
   `elsif TSMC_6NM_6T_LVT
          wire Q_Int;
        SDFRPQD1BWP240H8P57CPDLVT U0_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP ),
          .CD (CD),
          .Q  (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire Q_Int;
          wire CD_Int;
        SDFFRPQ_X1M_A9PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP),
          .R    (CD),
          .Q    (Q_Int)
          ); 
         assign Q = Q_Int;
//         assign CD = ~CD_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire Q_Int;
          wire CD_Int;
        SDFFRPQ_X1M_A7PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP),
          .R    (CD),
          .Q    (Q_Int)
          ); 
         assign Q = Q_Int;
//         assign CD = ~CD_Int;
         `else
          reg Q_Int;
          always @(posedge CP or posedge CD) begin 
            if(CD == 1'b1) begin
              Q_Int <= 1'b0;
            end else begin
              Q_Int <= D;
              end
          end
         assign Q = Q_Int;
`endif
endmodule

//SDFRNQ_Wrap module
module SDFRNQ_Wrap (
input CP,
input D,
input CDN,
output Q
);

`ifdef SIM
  reg Q_Int;
  always @(posedge CP or negedge CDN) begin 
    if(CDN == 1'b0) begin
      Q_Int <= 1'b0;
    end else begin
      Q_Int <= D;
      end
  end
  assign Q = Q_Int;
`elsif FPGA
      reg Q_Int;
      always @(posedge CP or negedge CDN) begin 
           if(CDN == 1'b0) begin
             Q_Int <= 1'b0;
           end else begin
             Q_Int <= D;
             end
         end
       assign Q = Q_Int;
   `elsif TSMC_6NM_6T_LVT
          wire Q_Int;
        SDFRPQD1BWP240H8P57CPDLVT U0_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP ),
          .CD (~CDN),
          .Q  (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire Q_Int;
          wire CD_Int;
        SDFFRPQ_X1M_A9PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP),
          .R    (~CDN),
          .Q    (Q_Int)
          ); 
         assign Q = Q_Int;
//         assign CD = ~CD_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire Q_Int;
          wire CD_Int;
          wire CD;
        INV_X2B_A7PP140ZTL_C35 U_CDN(.Y(CD), .A(CDN));
        SDFFRPQ_X1M_A7PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP),
          .R    (CD),
          .Q    (Q_Int)
          ); 
         assign Q = Q_Int;
//         assign CD = ~CD_Int;
         `else
          reg Q_Int;
          always @(posedge CP or posedge CDN) begin 
            if(CDN == 1'b1) begin
              Q_Int <= 1'b0;
            end else begin
              Q_Int <= D;
              end
          end
         assign Q = Q_Int;
`endif
endmodule

//SDFSNQ_Wrap module
module SDFSNQ_Wrap (
input CP,
input D,
input SDN,
output Q
);

`ifdef SIM
  reg Q_Int;
  always @(posedge CP or negedge SDN) begin 
    if(SDN == 1'b0) begin
      Q_Int <= 1'b1;
    end else begin
      Q_Int <= D;
      end
  end
  assign Q = Q_Int;
`elsif FPGA
      reg Q_Int;
      always @(posedge CP or negedge SDN) begin 
           if(SDN == 1'b0) begin
             Q_Int <= 1'b1;
           end else begin
             Q_Int <= D;
             end
         end
       assign Q = Q_Int;
   `elsif TSMC_6NM_6T_LVT
          wire Q_Int;
        SDFSNQD1BWP240H8P57CPDLVT U0_SDFSNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP ),
          .SDN (SDN),
          .Q  (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire Q_Int;
        SDFFSQ_X1M_A9PP140ZTL_C35 U0_SDFSNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP),
          .SN   (SDN),
          .Q    (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire Q_Int;
        SDFFSQ_X1M_A7PP140ZTL_C35 U0_SDFSNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP),
          .SN   (SDN),
          .Q    (Q_Int)
          ); 
         assign Q = Q_Int;
         `else
          reg Q_Int;
          always @(posedge CP or negedge SDN) begin 
            if(SDN == 1'b0) begin
              Q_Int <= 1'b1;
            end else begin
              Q_Int <= D;
              end
          end
         assign Q = Q_Int;
`endif
endmodule

//CKLN_Wrap module
module CKLN_Wrap (
input CP,
input E,
input TE,
output Q
);

`ifdef SIM
  wire E_Int;
  reg Q_Int;
  assign E_Int = E || TE;
  always @(*) begin 
      if (CP == 1'b0) begin 
      Q_Int <= E_Int;
        end
      end
  assign Q = Q_Int && CP;
`elsif FPGA
    reg Q_Int;
    always @(posedge CP) begin
        Q_Int <= (E || TE);    //use ff, no latch
    end
    //default no clock gating, "defparam" can synthesis by vivado
    parameter [1:0] SEL = 2'd0; 
    generate
        if (SEL == 2'd0) begin : no_gating
            assign Q = CP;
        end else if (SEL == 2'd1) begin : sel_gate
            assign Q = Q_Int && CP;
        end else if (SEL == 2'd2) begin : sel_bufgce
            `ifdef FPGA_SIM
                assign Q = Q_Int && CP;
            `else
                BUFGCE #(.CE_TYPE("SYNC"),.IS_CE_INVERTED(1'b0),.IS_I_INVERTED(1'b0),.SIM_DEVICE("ULTRASCALE_PLUS")) BUFGCE_inst (.O(Q),.CE(E || TE),.I(CP));
            `endif
        end else begin : sel_bufg
            `ifdef FPGA_SIM
                assign Q = CP;
            `else
                BUFG BUFG_inst (.O(Q), .I(CP));
            `endif
        end
    endgenerate

   `elsif TSMC_6NM_6T_LVT
          wire Q_Int;
        CKLNQD4BWP240H8P57CPDLVT U0_CKLN(
          .CP (CP ),
          .E  (E),
          .TE (TE),
          .Q  (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire Q_Int;
        PREICG_X4B_A9PP140ZTL_C35 U0_CKLN(
          .CK   (CP),
          .E   (E),
          .SE   (TE),
          .ECK   (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire Q_Int;
        PREICG_X4B_A7PP140ZTL_C35 U0_CKLN(
          .CK   (CP),
          .E   (E),
          .SE   (TE),
          .ECK   (Q_Int)
          ); 
         assign Q = Q_Int;
         `else
            wire E_Int;
            reg Q_Int;
            assign E_Int = E || TE;
            always @(*) begin 
                if (CP == 1'b0) begin 
                Q_Int = E_Int;
                  end
                end
            assign Q = Q_Int && CP;
`endif
endmodule


//CKLH_Wrap module
module CKLH_Wrap (
input CPN,
input E,
input TE,
output Q
);

`ifdef SIM
  wire E_Int;
  reg Q_Int;
  assign E_Int = E || TE;
  always @(*) begin 
      if (CPN == 1'b1) begin 
      Q_Int <= E_Int;
        end
      end
  assign Q = (~Q_Int) || CPN;
`elsif FPGA
       wire E_Int;
       reg Q_Int;
       assign E_Int = E || TE;
       always @(*) begin 
           if (CPN == 1'b1) begin 
           Q_Int <= E_Int;
             end
           end
       assign Q = (~Q_Int) || CPN;
   `elsif TSMC_6NM_6T_LVT
          wire Q_Int;
        CKLHQD4BWP240H8P57CPDLVT U0_CKLH(
          .CPN (CPN ),
          .E  (E),
          .TE (TE),
          .Q  (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire Q_Int;
        PREICGN_X4B_A9PP140ZTL_C35 U0_CKLH(
          .CK   (CPN),
          .E    (E),
          .SE   (TE),
          .ECK  (Q_Int)
          ); 
         assign Q = Q_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire Q_Int;
        PREICGN_X4B_A7PP140ZTL_C35 U0_CKLH(
          .CK   (CPN),
          .E    (E),
          .SE   (TE),
          .ECK  (Q_Int)
          ); 
         assign Q = Q_Int;
         `else
            wire E_Int;
            reg Q_Int;
            assign E_Int = E || TE;
            always @(*) begin 
                if (CPN == 1'b1) begin 
                Q_Int = E_Int;
                  end
                end
            assign Q = (~Q_Int) || CPN;
`endif
endmodule

//SDFSYNC2RPQ_Wrap module
module SDFSYNC2RPQ_Wrap (
input CP_S,
input CP_D,
input D,
input CD_S,
input CD_D,
output Q
);

`ifdef SIM
  reg QS_Int;
  reg QD1_Int;
  reg QD2_Int;
  always @(posedge CP_S or posedge CD_S) begin 
    if(CD_S == 1'b1) begin
      QS_Int <= 1'b0;
    end else begin
      QS_Int <= D;
      end
  end
  always @(posedge CP_D or posedge CD_D) begin 
    if(CD_D == 1'b1) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
    end else begin
      QD1_Int <= QS_Int;
      QD2_Int <= QD1_Int;
      end
  end
  assign Q = QD2_Int;
`elsif FPGA
        reg QS_Int;
        reg QD1_Int;
        reg QD2_Int;
        always @(posedge CP_S or posedge CD_S) begin 
          if(CD_S == 1'b1) begin
            QS_Int <= 1'b0;
          end else begin
            QS_Int <= D;
            end
        end
        always @(posedge CP_D or posedge CD_D) begin 
          if(CD_D == 1'b1) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
          end else begin
            QD1_Int <= QS_Int;
            QD2_Int <= QD1_Int;
            end
        end
  assign Q = QD2_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QS_Int;
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U0_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_S),
          .CD (CD_S),
          .Q  (QS_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QS_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QS_Int;
          wire QD2_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A9PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ2D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_S_Int = CD_S;
         assign CD_D_Int = CD_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QS_Int;
          wire QD2_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A7PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ2D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_S_Int = CD_S;
         assign CD_D_Int = CD_D;
         `else
              reg QS_Int;
              reg QD1_Int;
              reg QD2_Int;
              always @(posedge CP_S or posedge CD_S) begin 
                if(CD_S == 1'b1) begin
                  QS_Int <= 1'b0;
                end else begin
                  QS_Int <= D;
                  end
              end
              always @(posedge CP_D or posedge CD_D) begin 
                if(CD_D == 1'b1) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                end else begin
                  QD1_Int <= QS_Int;
                  QD2_Int <= QD1_Int;
                  end
              end
              assign Q = QD2_Int;
`endif
endmodule

//SDFSYNC2RNQ_Wrap module
module SDFSYNC2RNQ_Wrap (
input CP_S,
input CP_D,
input D,
input CDN_S,
input CDN_D,
output Q
);

`ifdef SIM
  reg QS_Int;
  reg QD1_Int;
  reg QD2_Int;
  always @(posedge CP_S or posedge CDN_S) begin 
    if(CDN_S == 1'b0) begin
      QS_Int <= 1'b0;
    end else begin
      QS_Int <= D;
      end
  end
  always @(posedge CP_D or posedge CDN_D) begin 
    if(CDN_D == 1'b0) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
    end else begin
      QD1_Int <= QS_Int;
      QD2_Int <= QD1_Int;
      end
  end
  assign Q = QD2_Int;
`elsif FPGA
        reg QS_Int;
        reg QD1_Int;
        reg QD2_Int;
        always @(posedge CP_S or posedge CDN_S) begin 
          if(CDN_S == 1'b0) begin
            QS_Int <= 1'b0;
          end else begin
            QS_Int <= D;
            end
        end
        always @(posedge CP_D or posedge CDN_D) begin 
          if(CDN_D == 1'b0) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
          end else begin
            QD1_Int <= QS_Int;
            QD2_Int <= QD1_Int;
            end
        end
  assign Q = QD2_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QS_Int;
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U0_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_S),
          .CD (~CDN_S),
          .Q  (QS_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QS_Int),
          .CP (CP_D),
          .CD (~CD_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (~CD_D),
          .Q  (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QS_Int;
          wire QD2_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A9PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ2D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_S_Int = ~CDN_S;
         assign CD_D_Int = ~CDN_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QS_Int;
          wire QD2_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A7PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ2D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_S_Int = ~CDN_S;
         assign CD_D_Int = ~CDN_D;
         `else
              reg QS_Int;
              reg QD1_Int;
              reg QD2_Int;
              always @(posedge CP_S or posedge CDN_S) begin 
                if(CDN_S == 1'b0) begin
                  QS_Int <= 1'b0;
                end else begin
                  QS_Int <= D;
                  end
              end
              always @(posedge CP_D or posedge CDN_D) begin 
                if(CDN_D == 1'b0) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                end else begin
                  QD1_Int <= QS_Int;
                  QD2_Int <= QD1_Int;
                  end
              end
              assign Q = QD2_Int;
`endif
endmodule

//SDFSYNC2SNQ_Wrap module
module SDFSYNC2SNQ_Wrap (
input CP_S,
input CP_D,
input D,
input SDN_S,
input SDN_D,
output Q
);

`ifdef SIM
  reg QS_Int;
  reg QD1_Int;
  reg QD2_Int;
  always @(posedge CP_S or negedge SDN_S) begin 
    if(SDN_S == 1'b0) begin
      QS_Int <= 1'b1;
    end else begin
      QS_Int <= D;
      end
  end
  always @(posedge CP_D or negedge SDN_D) begin 
    if(SDN_D == 1'b0) begin
      QD1_Int <= 1'b1;
      QD2_Int <= 1'b1;
    end else begin
      QD1_Int <= QS_Int;
      QD2_Int <= QD1_Int;
      end
  end
  assign Q = QD2_Int;
`elsif FPGA
        reg QS_Int;
        reg QD1_Int;
        reg QD2_Int;
        always @(posedge CP_S or negedge SDN_S) begin 
          if(SDN_S == 1'b0) begin
            QS_Int <= 1'b1;
          end else begin
            QS_Int <= D;
            end
        end
        always @(posedge CP_D or negedge SDN_D) begin 
          if(SDN_D == 1'b0) begin
            QD1_Int <= 1'b1;
            QD2_Int <= 1'b1;
          end else begin
            QD1_Int <= QS_Int;
            QD2_Int <= QD1_Int;
            end
        end
  assign Q = QD2_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QS_Int;
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U0_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_S),
          .SDN (SDN_S),
          .Q  (QS_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U1_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QS_Int),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U2_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QS_Int;
          wire QD2_Int;
        SDFFSQ_X1M_A9PP140ZTL_C35 U0_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .SN   (SDN_S),
          .Q    (QS_Int)
          ); 
        SDFFYSQ2D_X1M_A9PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .SN   (SDN_D),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire QS_Int;
          wire QD2_Int;
        SDFFSQ_X1M_A7PP140ZTL_C35 U0_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .SN   (SDN_S),
          .Q    (QS_Int)
          ); 
        SDFFYSQ2D_X1M_A7PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .SN   (SDN_D),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         `else
              reg QS_Int;
              reg QD1_Int;
              reg QD2_Int;
              always @(posedge CP_S or negedge SDN_S) begin 
                if(SDN_S == 1'b0) begin
                  QS_Int <= 1'b1;
                end else begin
                  QS_Int <= D;
                  end
              end
              always @(posedge CP_D or negedge SDN_D) begin 
                if(SDN_D == 1'b0) begin
                  QD1_Int <= 1'b1;
                  QD2_Int <= 1'b1;
                end else begin
                  QD1_Int <= QS_Int;
                  QD2_Int <= QD1_Int;
                  end
              end
              assign Q = QD2_Int;
`endif
endmodule

//SDFSYNC3RPQ_Wrap module
module SDFSYNC3RPQ_Wrap (
input CP_S,
input CP_D,
input D,
input CD_S,
input CD_D,
output Q
);

`ifdef SIM
  reg QS_Int;
  reg QD1_Int;
  reg QD2_Int;
  reg QD3_Int;
  always @(posedge CP_S or posedge CD_S) begin 
    if(CD_S == 1'b1) begin
      QS_Int <= 1'b0;
    end else begin
      QS_Int <= D;
      end
  end
  always @(posedge CP_D or posedge CD_D) begin 
    if(CD_D == 1'b1) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
      QD3_Int <= 1'b0;
    end else begin
      QD1_Int <= QS_Int;
      QD2_Int <= QD1_Int;
      QD3_Int <= QD2_Int;
      end
  end
  assign Q = QD3_Int;
`elsif FPGA
        reg QS_Int;
        reg QD1_Int;
        reg QD2_Int;
        reg QD3_Int;
        always @(posedge CP_S or posedge CD_S) begin 
          if(CD_S == 1'b1) begin
            QS_Int <= 1'b0;
          end else begin
            QS_Int <= D;
            end
        end
        always @(posedge CP_D or posedge CD_D) begin 
          if(CD_D == 1'b1) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
            QD3_Int <= 1'b0;
          end else begin
            QD1_Int <= QS_Int;
            QD2_Int <= QD1_Int;
            QD3_Int <= QD2_Int;
            end
        end
  assign Q = QD3_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QS_Int;
          wire QD1_Int;
          wire QD2_Int;
          wire QD3_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U0_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_S),
          .CD (CD_S),
          .Q  (QS_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QS_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD2_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U3_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD2_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QS_Int;
          wire QD3_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A9PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ3D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_S_Int = CD_S;
         assign CD_D_Int = CD_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QS_Int;
          wire QD3_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A7PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ3D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_S_Int = CD_S;
         assign CD_D_Int = CD_D;
         `else
              reg QS_Int;
              reg QD1_Int;
              reg QD2_Int;
              reg QD3_Int;
              always @(posedge CP_S or posedge CD_S) begin 
                if(CD_S == 1'b1) begin
                  QS_Int <= 1'b0;
                end else begin
                  QS_Int <= D;
                  end
              end
              always @(posedge CP_D or posedge CD_D) begin 
                if(CD_D == 1'b1) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                  QD3_Int <= 1'b0;
                end else begin
                  QD1_Int <= QS_Int;
                  QD2_Int <= QD1_Int;
                  QD3_Int <= QD2_Int;
                  end
              end
              assign Q = QD3_Int;
`endif
endmodule

//SDFSYNC3RNQ_Wrap module
module SDFSYNC3RNQ_Wrap (
input CP_S,
input CP_D,
input D,
input CDN_S,
input CDN_D,
output Q
);

`ifdef SIM
  reg QS_Int;
  reg QD1_Int;
  reg QD2_Int;
  reg QD3_Int;
  always @(posedge CP_S or posedge CDN_S) begin 
    if(CDN_S == 1'b0) begin
      QS_Int <= 1'b0;
    end else begin
      QS_Int <= D;
      end
  end
  always @(posedge CP_D or posedge CDN_D) begin 
    if(CDN_D == 1'b0) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
      QD3_Int <= 1'b0;
    end else begin
      QD1_Int <= QS_Int;
      QD2_Int <= QD1_Int;
      QD3_Int <= QD2_Int;
      end
  end
  assign Q = QD3_Int;
`elsif FPGA
        reg QS_Int;
        reg QD1_Int;
        reg QD2_Int;
        reg QD3_Int;
        always @(posedge CP_S or posedge CDN_S) begin 
          if(CDN_S == 1'b0) begin
            QS_Int <= 1'b0;
          end else begin
            QS_Int <= D;
            end
        end
        always @(posedge CP_D or posedge CDN_D) begin 
          if(CDN_D == 1'b0) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
            QD3_Int <= 1'b0;
          end else begin
            QD1_Int <= QS_Int;
            QD2_Int <= QD1_Int;
            QD3_Int <= QD2_Int;
            end
        end
  assign Q = QD3_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QS_Int;
          wire QD1_Int;
          wire QD2_Int;
          wire QD3_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U0_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_S),
          .CD (~CD_S),
          .Q  (QS_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QS_Int),
          .CP (CP_D),
          .CD (~CD_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (~CD_D),
          .Q  (QD2_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U3_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD2_Int),
          .CP (CP_D),
          .CD (~CD_D),
          .Q  (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QS_Int;
          wire QD3_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A9PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ3D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_S_Int = ~CDN_S;
         assign CD_D_Int = ~CDN_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QS_Int;
          wire QD3_Int;
          wire CD_S_Int;
          wire CD_D_Int;
        SDFFRPQ_X1M_A7PP140ZTL_C35 U0_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .R    (CD_S_Int),
          .Q    (QS_Int)
          ); 
        SDFFYRPQ3D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_S_Int = ~CDN_S;
         assign CD_D_Int = ~CDN_D;
         `else
              reg QS_Int;
              reg QD1_Int;
              reg QD2_Int;
              reg QD3_Int;
              always @(posedge CP_S or posedge CDN_S) begin 
                if(CDN_S == 1'b0) begin
                  QS_Int <= 1'b0;
                end else begin
                  QS_Int <= D;
                  end
              end
              always @(posedge CP_D or posedge CDN_D) begin 
                if(CDN_D == 1'b0) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                  QD3_Int <= 1'b0;
                end else begin
                  QD1_Int <= QS_Int;
                  QD2_Int <= QD1_Int;
                  QD3_Int <= QD2_Int;
                  end
              end
              assign Q = QD3_Int;
`endif
endmodule

//SDFSYNC3SNQ_Wrap module
module SDFSYNC3SNQ_Wrap (
input CP_S,
input CP_D,
input D,
input SDN_S,
input SDN_D,
output Q
);

`ifdef SIM
  reg QS_Int;
  reg QD1_Int;
  reg QD2_Int;
  reg QD3_Int;
  always @(posedge CP_S or negedge SDN_S) begin 
    if(SDN_S == 1'b0) begin
      QS_Int <= 1'b1;
    end else begin
      QS_Int <= D;
      end
  end
  always @(posedge CP_D or negedge SDN_D) begin 
    if(SDN_D == 1'b0) begin
      QD1_Int <= 1'b1;
      QD2_Int <= 1'b1;
      QD3_Int <= 1'b1;
    end else begin
      QD1_Int <= QS_Int;
      QD2_Int <= QD1_Int;
      QD3_Int <= QD2_Int;
      end
  end
  assign Q = QD3_Int;
`elsif FPGA
        reg QS_Int;
        reg QD1_Int;
        reg QD2_Int;
        reg QD3_Int;
        always @(posedge CP_S or negedge SDN_S) begin 
          if(SDN_S == 1'b0) begin
            QS_Int <= 1'b1;
          end else begin
            QS_Int <= D;
            end
        end
        always @(posedge CP_D or negedge SDN_D) begin 
          if(SDN_D == 1'b0) begin
            QD1_Int <= 1'b1;
            QD2_Int <= 1'b1;
            QD3_Int <= 1'b1;
          end else begin
            QD1_Int <= QS_Int;
            QD2_Int <= QD1_Int;
            QD3_Int <= QD2_Int;
            end
        end
  assign Q = QD3_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QS_Int;
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U0_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_S),
          .SDN (SDN_S),
          .Q  (QS_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U1_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QS_Int),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U2_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD2_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U3_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD2_Int),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QS_Int;
          wire QD3_Int;
        SDFFSQ_X1M_A9PP140ZTL_C35 U0_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .SN   (SDN_S),
          .Q    (QS_Int)
          ); 
        SDFFYSQ3D_X1M_A9PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .SN   (SDN_D),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire QS_Int;
          wire QD3_Int;
        SDFFSQ_X1M_A7PP140ZTL_C35 U0_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_S),
          .SN   (SDN_S),
          .Q    (QS_Int)
          ); 
        SDFFYSQ3D_X1M_A7PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (QS_Int),
          .CK   (CP_D),
          .SN   (SDN_D),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         `else
              reg QS_Int;
              reg QD1_Int;
              reg QD2_Int;
              reg QD3_Int;
              always @(posedge CP_S or negedge SDN_S) begin 
                if(SDN_S == 1'b0) begin
                  QS_Int <= 1'b1;
                end else begin
                  QS_Int <= D;
                  end
              end
              always @(posedge CP_D or negedge SDN_D) begin 
                if(SDN_D == 1'b0) begin
                  QD1_Int <= 1'b1;
                  QD2_Int <= 1'b1;
                  QD3_Int <= 1'b1;
                end else begin
                  QD1_Int <= QS_Int;
                  QD2_Int <= QD1_Int;
                  QD3_Int <= QD2_Int;
                  end
              end
              assign Q = QD3_Int;
`endif
endmodule

//SDFSYNC2RPQ_DO_Wrap module
module SDFSYNC2RPQ_DO_Wrap (
input CP_D,
input D,
input CD_D,
output Q
);

`ifdef SIM
  reg QD1_Int;
  reg QD2_Int;
  always @(posedge CP_D or posedge CD_D) begin 
    if(CD_D == 1'b1) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
    end else begin
      QD1_Int <= D;
      QD2_Int <= QD1_Int;
      end
  end
  assign Q = QD2_Int;
`elsif FPGA
        reg QD1_Int;
        reg QD2_Int;
        always @(posedge CP_D or posedge CD_D) begin 
          if(CD_D == 1'b1) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
          end else begin
            QD1_Int <= D;
            QD2_Int <= QD1_Int;
            end
        end
  assign Q = QD2_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QD2_Int;
          wire CD_D_Int;
        SDFFYRPQ2D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_D_Int = CD_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QD2_Int;
          wire CD_D_Int;
        SDFFYRPQ2D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_D_Int = CD_D;
         `else
              reg QD1_Int;
              reg QD2_Int;
              always @(posedge CP_D or posedge CD_D) begin 
                if(CD_D == 1'b1) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                end else begin
                  QD1_Int <= D;
                  QD2_Int <= QD1_Int;
                  end
              end
              assign Q = QD2_Int;
`endif
endmodule

//SDFSYNC2RNQ_DO_Wrap module
module SDFSYNC2RNQ_DO_Wrap (
input CP_D,
input D,
input CDN_D,
output Q
);

`ifdef SIM
  reg QD1_Int;
  reg QD2_Int;
  always @(posedge CP_D or posedge CDN_D) begin 
    if(CDN_D == 1'b0) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
    end else begin
      QD1_Int <= D;
      QD2_Int <= QD1_Int;
      end
  end
  assign Q = QD2_Int;
`elsif FPGA
        reg QD1_Int;
        reg QD2_Int;
        always @(posedge CP_D or posedge CDN_D) begin 
          if(CDN_D == 1'b0) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
          end else begin
            QD1_Int <= D;
            QD2_Int <= QD1_Int;
            end
        end
  assign Q = QD2_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_D),
          .CD (~CDN_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (~CDN_D),
          .Q  (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QD2_Int;
          wire CD_D_Int;
        SDFFYRPQ2D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_D_Int = ~CDN_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QD2_Int;
          wire CD_D_Int;
        SDFFYRPQ2D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         assign CD_D_Int = ~CDN_D;
         `else
              reg QD1_Int;
              reg QD2_Int;
              always @(posedge CP_D or posedge CDN_D) begin 
                if(CDN_D == 1'b0) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                end else begin
                  QD1_Int <= D;
                  QD2_Int <= QD1_Int;
                  end
              end
              assign Q = QD2_Int;
`endif
endmodule

//SDFSYNC2SNQ_DO_Wrap module
module SDFSYNC2SNQ_DO_Wrap (
input CK,
input D,
input SDN,
output Q
);

`ifdef SIM
  reg QD1_Int;
  reg QD2_Int;
  always @(posedge CK or negedge SDN) begin 
    if(SDN == 1'b0) begin
      QD1_Int <= 1'b1;
      QD2_Int <= 1'b1;
    end else begin
      QD1_Int <= D;
      QD2_Int <= QD1_Int;
      end
  end
  assign Q = QD2_Int;
`elsif FPGA
        reg QD1_Int;
        reg QD2_Int;
        always @(posedge CK or negedge SDN) begin 
          if(SDN == 1'b0) begin
            QD1_Int <= 1'b1;
            QD2_Int <= 1'b1;
          end else begin
            QD1_Int <= D;
            QD2_Int <= QD1_Int;
            end
        end
  assign Q = QD2_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U1_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CK),
          .SDN (SDN),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U2_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CK),
          .SDN (SDN),
          .Q  (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QD2_Int;
        SDFFYSQ2D_X1M_A9PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CK),
          .SN   (SDN),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire QD2_Int;
        SDFFYSQ2D_X1M_A7PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CK),
          .SN   (SDN),
          .Q   (QD2_Int)
          ); 
         assign Q = QD2_Int;
         `else
              reg QD1_Int;
              reg QD2_Int;
              always @(posedge CK or negedge SDN) begin 
                if(SDN == 1'b0) begin
                  QD1_Int <= 1'b1;
                  QD2_Int <= 1'b1;
                end else begin
                  QD1_Int <= D;
                  QD2_Int <= QD1_Int;
                  end
              end
              assign Q = QD2_Int;
`endif
endmodule

//SDFSYNC3RPQ_DO_Wrap module
module SDFSYNC3RPQ_DO_Wrap (
input CP_D,
input D,
input CD_D,
output Q
);

`ifdef SIM
  reg QD1_Int;
  reg QD2_Int;
  reg QD3_Int;
  always @(posedge CP_D or posedge CD_D) begin 
    if(CD_D == 1'b1) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
      QD3_Int <= 1'b0;
    end else begin
      QD1_Int <= D;
      QD2_Int <= QD1_Int;
      QD3_Int <= QD2_Int;
      end
  end
  assign Q = QD3_Int;
`elsif FPGA
        reg QD1_Int;
        reg QD2_Int;
        reg QD3_Int;
        always @(posedge CP_D or posedge CD_D) begin 
          if(CD_D == 1'b1) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
            QD3_Int <= 1'b0;
          end else begin
            QD1_Int <= D;
            QD2_Int <= QD1_Int;
            QD3_Int <= QD2_Int;
            end
        end
  assign Q = QD3_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QD1_Int;
          wire QD2_Int;
          wire QD3_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD2_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U3_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD2_Int),
          .CP (CP_D),
          .CD (CD_D),
          .Q  (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QD3_Int;
          wire CD_D_Int;
        SDFFYRPQ3D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_D_Int = CD_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QD3_Int;
          wire CD_D_Int;
        SDFFYRPQ3D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_D_Int = CD_D;
         `else
              reg QD1_Int;
              reg QD2_Int;
              reg QD3_Int;
              always @(posedge CP_D or posedge CD_D) begin 
                if(CD_D == 1'b1) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                  QD3_Int <= 1'b0;
                end else begin
                  QD1_Int <= D;
                  QD2_Int <= QD1_Int;
                  QD3_Int <= QD2_Int;
                  end
              end
              assign Q = QD3_Int;
`endif
endmodule

//SDFSYNC3RNQ_DO_Wrap module
module SDFSYNC3RNQ_DO_Wrap (
input CP_D,
input D,
input CDN_D,
output Q
);

`ifdef SIM
  reg QD1_Int;
  reg QD2_Int;
  reg QD3_Int;
  always @(posedge CP_D or posedge CDN_D) begin 
    if(CDN_D == 1'b0) begin
      QD1_Int <= 1'b0;
      QD2_Int <= 1'b0;
      QD3_Int <= 1'b0;
    end else begin
      QD1_Int <= D;
      QD2_Int <= QD1_Int;
      QD3_Int <= QD2_Int;
      end
  end
  assign Q = QD3_Int;
`elsif FPGA
        reg QD1_Int;
        reg QD2_Int;
        reg QD3_Int;
        always @(posedge CP_D or posedge CDN_D) begin 
          if(CDN_D == 1'b0) begin
            QD1_Int <= 1'b0;
            QD2_Int <= 1'b0;
            QD3_Int <= 1'b0;
          end else begin
            QD1_Int <= D;
            QD2_Int <= QD1_Int;
            QD3_Int <= QD2_Int;
            end
        end
  assign Q = QD3_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QD1_Int;
          wire QD2_Int;
          wire QD3_Int;
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U1_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_D),
          .CD (~CDN_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U2_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .CD (~CDN_D),
          .Q  (QD2_Int)
          ); 
        SDFSYNC1RPQD1BWP240H8P57CPDLVT U3_SDFRPQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD2_Int),
          .CP (CP_D),
          .CD (~CDN_D),
          .Q  (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QD3_Int;
          wire CD_D_Int;
        SDFFYRPQ3D_X1M_A9PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_D_Int = ~CDN_D;
   `elsif UMCARM_28HPCP_7TLVT
          wire QD3_Int;
          wire CD_D_Int;
        SDFFYRPQ3D_X1M_A7PP140ZTL_C35 U1_SDFRPQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .R   (CD_D_Int),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         assign CD_D_Int = ~CDN_D;
         `else
              reg QD1_Int;
              reg QD2_Int;
              reg QD3_Int;
              always @(posedge CP_D or posedge CDN_D) begin 
                if(CDN_D == 1'b0) begin
                  QD1_Int <= 1'b0;
                  QD2_Int <= 1'b0;
                  QD3_Int <= 1'b0;
                end else begin
                  QD1_Int <= D;
                  QD2_Int <= QD1_Int;
                  QD3_Int <= QD2_Int;
                  end
              end
              assign Q = QD3_Int;
`endif
endmodule

//SDFSYNC3SNQ_DO_Wrap module
module SDFSYNC3SNQ_DO_Wrap (
input CP_D,
input D,
input SDN_D,
output Q
);

`ifdef SIM
  reg QD1_Int;
  reg QD2_Int;
  reg QD3_Int;
  always @(posedge CP_D or negedge SDN_D) begin 
    if(SDN_D == 1'b0) begin
      QD1_Int <= 1'b1;
      QD2_Int <= 1'b1;
      QD3_Int <= 1'b1;
    end else begin
      QD1_Int <= D;
      QD2_Int <= QD1_Int;
      QD3_Int <= QD2_Int;
      end
  end
  assign Q = QD3_Int;
`elsif FPGA
        reg QD1_Int;
        reg QD2_Int;
        reg QD3_Int;
        always @(posedge CP_D or negedge SDN_D) begin 
          if(SDN_D == 1'b0) begin
            QD1_Int <= 1'b1;
            QD2_Int <= 1'b1;
            QD3_Int <= 1'b1;
          end else begin
            QD1_Int <= D;
            QD2_Int <= QD1_Int;
            QD3_Int <= QD2_Int;
            end
        end
  assign Q = QD3_Int;
   `elsif TSMC_6NM_6T_LVT
          wire QD1_Int;
          wire QD2_Int;
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U1_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (D),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD1_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U2_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD1_Int),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD2_Int)
          ); 
        SDFSYNC1SNQD1BWP240H8P57CPDLVT U3_SDFSYNC1SNQ(
          .SI (1'b0),
          .SE (1'b0),
          .D  (QD2_Int),
          .CP (CP_D),
          .SDN (SDN_D),
          .Q  (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_9TLVT
          wire QD3_Int;
        SDFFYSQ3D_X1M_A9PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .SN   (SDN_D),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
   `elsif UMCARM_28HPCP_7TLVT
          wire QD3_Int;
        SDFFYSQ3D_X1M_A7PP140ZTL_C35 U1_SDFSYNC1SNQ(
          .SI   (1'b0),
          .SE   (1'b0),
          .D    (D),
          .CK   (CP_D),
          .SN   (SDN_D),
          .Q   (QD3_Int)
          ); 
         assign Q = QD3_Int;
         `else
              reg QD1_Int;
              reg QD2_Int;
              reg QD3_Int;
              always @(posedge CP_D or negedge SDN_D) begin 
                if(SDN_D == 1'b0) begin
                  QD1_Int <= 1'b1;
                  QD2_Int <= 1'b1;
                  QD3_Int <= 1'b1;
                end else begin
                  QD1_Int <= D;
                  QD2_Int <= QD1_Int;
                  QD3_Int <= QD2_Int;
                  end
              end
              assign Q = QD3_Int;
`endif
endmodule



