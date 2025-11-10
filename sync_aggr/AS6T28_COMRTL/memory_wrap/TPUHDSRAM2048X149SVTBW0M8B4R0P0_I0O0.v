
///sram wrap generated

module TPUHDSRAM2048X149SVTBW0M8B4R0P0_I0O0 #(
    parameter MEM_DEPTH   =2048,
    parameter ADDR_WIDTH  =11,
    parameter DATA_WIDTH  =149
)(
    input                          Clk,
    input       [ADDR_WIDTH-1:0]   AddrA,
    input       [ADDR_WIDTH-1:0]   AddrB,
    input       [DATA_WIDTH-1:0]   Din,
    input       [9:0]   TPRAM_CONFIG,
    input                          CEAB,
    input                          CEBB,
    input                          WEAB,
    input                          REBB,
    output      [DATA_WIDTH-1:0]   Q
);

//signals define
wire [DATA_WIDTH-1:0]   Mem_Q;

//memory instance define
`ifdef SIM
 tp_sram  #(
  .MEM_DEPTH (MEM_DEPTH),
  .ADDR_WIDTH (ADDR_WIDTH),
  .DATA_WIDTH (DATA_WIDTH)
 ) u0_tpsram (
   .clka       (Clk),
   .clkb       (Clk),
   .addra      (AddrA),
   .addrb      (AddrB),
   .din        (Din),
   .bwab        ({DATA_WIDTH{1'b0}}),
   .ceab        (CEAB),
   .cebb        (CEBB),
   .weab        (WEAB),
   .rebb        (REBB),
   .dout      (Mem_Q)
 );
`else
   `ifdef FPGA
     tp_sram  #(
      .MEM_DEPTH (MEM_DEPTH),
      .ADDR_WIDTH (ADDR_WIDTH),
      .DATA_WIDTH (DATA_WIDTH)
     ) u0_tpsram (
       .clka       (Clk),
       .clkb       (Clk),
       .addra      (AddrA),
       .addrb      (AddrB),
       .din        (Din),
       .bwab        ({DATA_WIDTH{1'b0}}),
       .ceab        (CEAB),
       .cebb        (CEBB),
       .weab        (WEAB),
       .rebb        (REBB),
       .dout      (Mem_Q)
     );
   `else 
         `ifdef TSMC_6NM_6T_LVT
            TPUHDSRAM2048X149SVTBW0M8B4R0P0   u0_tpsram (
              .clka       (Clk),
              .clkb       (Clk),
              .addra      (AddrA),
              .addrb      (AddrB),
              .din       (Din),
              .ceab        (CEAB),
              .cebb        (CEBB),
              .weab        (WEAB),
              .rebb        (REBB),
              .dout      (Mem_Q)
            );
         `elsif UMC_28HPC_ARMMEM
            tpsram_2048x149   u0_tpsram (
              .CLK       (Clk),
              .AA         (AddrB),
              .AB         (AddrA),
              .DB         (Din),
              .CENA        (CEBB || REBB),
              .CENB        (CEAB || WEAB),
              .EMA        (TPRAM_CONFIG[2:0]),
              .EMAW        (TPRAM_CONFIG[4:3]),
              .EMAS       (TPRAM_CONFIG[5]),
              .EMAP       (TPRAM_CONFIG[6]),
              .STOV       (TPRAM_CONFIG[7]),
              .STOVAB     (TPRAM_CONFIG[8]),
              .RET1N       (TPRAM_CONFIG[9]),
              .TEN        (1'b1),
              .TCENA       (1'b1),
              .TCENB       (1'b1),
              .TAA         ({ADDR_WIDTH{1'b0}}),
              .TAB         ({ADDR_WIDTH{1'b0}}),
              .TDB         ({DATA_WIDTH{1'b0}}),
              .SIA         (2'b0),
              .SE         (1'b0),
              .DFTRAMBYP   (1'b0),
              .CENYA    (),
              .AYA      (),
              .CENYB    (),
              .AYB      (),
              .SOA      (),
              .QA      (Mem_Q)
            );
         `else
           tp_sram  #(
            .MEM_DEPTH (MEM_DEPTH),
            .ADDR_WIDTH (ADDR_WIDTH),
            .DATA_WIDTH (DATA_WIDTH)
           ) u0_tpsram (
             .clka       (Clk),
             .clkb       (Clk),
             .addra      (AddrA),
             .addrb      (AddrB),
             .din       (Din),
             .bwab        ({DATA_WIDTH{1'b0}}),
             .ceab        (CEAB),
             .cebb        (CEBB),
             .weab        (WEAB),
             .rebb        (REBB),
             .dout      (Mem_Q)
           );
         `endif
   `endif
`endif

//output 0 pipeline
assign Q = Mem_Q;

endmodule
