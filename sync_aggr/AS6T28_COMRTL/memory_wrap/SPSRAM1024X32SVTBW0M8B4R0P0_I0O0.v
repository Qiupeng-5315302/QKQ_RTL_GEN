
///sram wrap generated

module SPSRAM1024X32SVTBW0M8B4R0P0_I0O0 #(
    parameter MEM_DEPTH   =1024,
    parameter ADDR_WIDTH  =10,
    parameter DATA_WIDTH  =32
)(
    input                          Clk,
    input       [ADDR_WIDTH-1:0]   Addr,
    input       [DATA_WIDTH-1:0]   Din,
    input                          CEB,
    input                          WEB,
    input       [6:0]             SPRAM_CONFIG,
    output      [DATA_WIDTH-1:0]   Q
);

//signals define
wire [DATA_WIDTH-1:0]   Mem_Q;

//memory instance define
`ifdef SIM
 sp_sram  #(
  .MEM_DEPTH (MEM_DEPTH),
  .ADDR_WIDTH (ADDR_WIDTH),
  .DATA_WIDTH (DATA_WIDTH)
 ) u0_spsram (
   .clk       (Clk),
   .addr      (Addr),
   .din       (Din),
   .bwb        ({DATA_WIDTH{1'b0}}),
   .ceb        (CEB),
   .web        (WEB),
   .dout      (Mem_Q)
 );
`else
   `ifdef FPGA
         sp_sram  #(
          .MEM_DEPTH (MEM_DEPTH),
          .ADDR_WIDTH (ADDR_WIDTH),
          .DATA_WIDTH (DATA_WIDTH)
         ) u0_spsram (
           .clk       (Clk),
           .addr      (Addr),
           .din       (Din),
           .bwb        ({DATA_WIDTH{1'b0}}),
           .ceb        (CEB),
           .web        (WEB),
           .dout      (Mem_Q)
         );
   `else 
         `ifdef TSMC_6NM_6T_LVT
            SPSRAM1024X32SVTBW0M8B4R0P0   u0_spsram (
              .clk       (Clk),
              .addr      (Addr),
              .din       (Din),
              .ceb        (CEB),
              .web        (WEB),
              .dout      (Mem_Q)
            );
         `elsif UMC_28HPC_ARMMEM
            spsram_1024x32   u0_spsram (
              .CLK       (Clk),
              .A         (Addr),
              .D         (Din),
              .CEN       (CEB),
              .WEN       (WEB),
              .EMA        (SPRAM_CONFIG[2:0]),
              .EMAW       (SPRAM_CONFIG[4:3]),
              .EMAS       (SPRAM_CONFIG[5]),
              .RET1N      (SPRAM_CONFIG[6]),
              .TEN        (1'b1),
              .TCEN       (1'b1),
              .TWEN       (1'b1),
              .TA         ({ADDR_WIDTH{1'b0}}),
              .TD         ({DATA_WIDTH{1'b0}}),
              .SI         (2'b0),
              .SE         (1'b0),
              .DFTRAMBYP  (1'b0),
              .CENY      (),
              .WENY      (),
              .AY        (),
              .SO        (),
              .Q          (Mem_Q)
            );
         `else
           sp_sram  #(
            .MEM_DEPTH (MEM_DEPTH),
            .ADDR_WIDTH (ADDR_WIDTH),
            .DATA_WIDTH (DATA_WIDTH)
           ) u0_spsram (
             .clk       (Clk),
             .addr      (Addr),
             .din       (Din),
             .bwb        ({DATA_WIDTH{1'b0}}),
             .ceb        (CEB),
             .web        (WEB),
             .dout      (Mem_Q)
           );
         `endif
   `endif
`endif

//output 0 pipeline
assign Q = Mem_Q;

endmodule
