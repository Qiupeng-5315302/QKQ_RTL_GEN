
///sram wrap generated

module TPSRAM32X149SVTBW0M8B4R0P0_I0O0_WRAPPER #(
    parameter MEM_DEPTH   =32,
    parameter ADDR_WIDTH  =5,
    parameter DATA_WIDTH  =149
)(
    input                          ClkA,
    input                          ClkB,
    input       [ADDR_WIDTH-1:0]   AddrA,
    input       [ADDR_WIDTH-1:0]   AddrB,
    input       [DATA_WIDTH-1:0]   Din,
    input       [8:0]   TPRAM_CONFIG,
    input                          CEAB,
    input                          CEBB,
    input                          WEAB,
    input                          REBB,
    output      [DATA_WIDTH-1:0]   Q
);

wire [75:0]    sram_1_din ;
wire [75:0]    sram_1_q ;
assign  sram_1_din = {3'd0,Din[148:76]};
assign  Q[148:76] = sram_1_q[72:0];

TPSRAM32X76SVTBW0M8B4R0P0_I0O0 u_sram_0 (/*AUTOINST*/
					 // Outputs
					 .Q			(Q[75:0]),	 // Templated
					 // Inputs
					 .ClkA			(ClkA),		 // Templated
					 .ClkB			(ClkB),		 // Templated
					 .AddrA			(AddrA[4:0]),	 // Templated
					 .AddrB			(AddrB[4:0]),	 // Templated
					 .Din			(Din[75:0]),	 // Templated
					 .TPRAM_CONFIG		(TPRAM_CONFIG[8:0]),
					 .CEAB			(CEAB),
					 .CEBB			(CEBB),
					 .WEAB			(WEAB),		 // Templated
					 .REBB			(REBB));		 // Templated

TPSRAM32X76SVTBW0M8B4R0P0_I0O0 u_sram_1 (/*AUTOINST*/
					 // Outputs
					 .Q			(sram_1_q[75:0]),	 // Templated
					 // Inputs
					 .ClkA			(ClkA),		 // Templated
					 .ClkB			(ClkB),		 // Templated
					 .AddrA			(AddrA[4:0]),	 // Templated
					 .AddrB			(AddrB[4:0]),	 // Templated
					 .Din			(sram_1_din[75:0]),	 // Templated
					 .TPRAM_CONFIG		(TPRAM_CONFIG[8:0]),
					 .CEAB			(CEAB),
					 .CEBB			(CEBB),
					 .WEAB			(WEAB),		 // Templated
					 .REBB			(REBB));		 // Templated

endmodule
