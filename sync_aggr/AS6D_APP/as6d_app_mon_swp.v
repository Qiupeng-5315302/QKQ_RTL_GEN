
module   as6d_app_mon_swp  (/*AUTOARG*/
   // Outputs
   reg_rd_dig_test_bus, PIN_DIG_TEST_BUS,
   // Inputs
   reg_testbus_sel_swap, reg_testbus_hi8bsel_8bmode, dig_test_dout0,
   dig_test_dout1, cpu_interface_clk, cpu_interface_resetn
   );

input  [15:0] reg_testbus_sel_swap;
input         reg_testbus_hi8bsel_8bmode;
input  [15:0] dig_test_dout0;
input  [15:0] dig_test_dout1;

input         cpu_interface_clk;
input         cpu_interface_resetn; //set false path
output [15:0] reg_rd_dig_test_bus;
output [15:0] PIN_DIG_TEST_BUS;

reg    [15:0] reg_rd_dig_test_bus;
wire   [15:0] dig_test_dout_swap;

assign dig_test_dout_swap = dig_test_dout0 & ~reg_testbus_sel_swap |
                            dig_test_dout1 & reg_testbus_sel_swap;

assign PIN_DIG_TEST_BUS[15:8] = dig_test_dout_swap[15:8];
assign PIN_DIG_TEST_BUS[7:0] = reg_testbus_hi8bsel_8bmode ? PIN_DIG_TEST_BUS[15:8] : dig_test_dout_swap[7:0];

always@(posedge cpu_interface_clk or negedge cpu_interface_resetn)
  if(!cpu_interface_resetn) reg_rd_dig_test_bus <= 16'h0;
  else reg_rd_dig_test_bus <= PIN_DIG_TEST_BUS;


endmodule



