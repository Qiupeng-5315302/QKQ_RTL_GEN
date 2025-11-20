
`timescale 1ns/1fs
module tb_top;

    logic clk_100mhz;

    clk_generator#(100, 1, 600, "Mhz")u0_clk_gen_100hz(clk_100mhz);

    `include "idi_include_tb.v"


initial begin
    $timeformat(-9 , 6, " ns", 10);
end

`include "dump.v"

endmodule
