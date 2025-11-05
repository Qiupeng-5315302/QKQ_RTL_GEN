
module prbs_32 (prbs_q, prbs_d);

parameter DW  = 160;
parameter DW2 = DW * 2;

input  [DW-1:0]  prbs_q;
output [DW-1:0]  prbs_d;

wire   [DW-1:0]  prbs_d;
wire   [DW2-1:0] prbs_p;

assign prbs_p = {prbs_q, prbs_d};

genvar i;
generate
  for (i = 0; i < DW; i = i + 1) begin
    assign prbs_d[i] = prbs_p[i+1] ^ prbs_p[i+2] ^ prbs_p[i+22] ^ prbs_p[i+32];
  end
endgenerate

endmodule
