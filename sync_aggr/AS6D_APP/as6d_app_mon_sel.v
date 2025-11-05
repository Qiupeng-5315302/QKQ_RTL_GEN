
module as6d_app_mon_sel (/*AUTOARG*/
   // Outputs
   dig_test_dout,
   // Inputs
   reg_testbus_sel_order, dig_test_dout_lane0
   );

input  [3:0]  reg_testbus_sel_order;

input  [15:0] dig_test_dout_lane0;
output [15:0] dig_test_dout;

//output [3:0]  testbus_lane_sel_out_side_a_cmn;
//output [3:0]  testbus_lane_sel_out_side_b_cmn;


wire   [15:0] dig_test_dout_mux;
reg    [15:0] dig_test_dout;


//MY    always@*
//MY      if(reg_testbus_lane_sel == 4'b00)
//MY        dig_test_dout_lane_sel = dig_test_dout_lane0;
//MY      else
//MY        dig_test_dout_lane_sel = dig_test_dout_lane1;
//MY    
//MY    
//MY    always@*
//MY      if(reg_testbus_pll_lane_sel == 4'b00)
//MY        dig_test_dout_pll_lane_sel = dig_test_dout_pll_lane0;
//MY      else
//MY        dig_test_dout_pll_lane_sel = dig_test_dout_pll_lane0;
//MY    
//MY    
//MY    
//MY    always@*
//MY      case(reg_testbus_sel_hi_cmn)
//MY      6'h0: dig_test_dout_mux = dig_test_dout_lane_sel;
//MY      6'h1: dig_test_dout_mux = dig_test_dout_pll_lane_sel;
//MY      default: dig_test_dout_mux = dig_test_dout_cmn;
//MY      endcase



assign  dig_test_dout_mux = dig_test_dout_lane0;



always@*
  case(reg_testbus_sel_order)
  4'h0: dig_test_dout = dig_test_dout_mux;
  4'h1: dig_test_dout = {dig_test_dout_mux[14:0], dig_test_dout_mux[   15]};
  4'h2: dig_test_dout = {dig_test_dout_mux[13:0], dig_test_dout_mux[15:14]};
  4'h3: dig_test_dout = {dig_test_dout_mux[12:0], dig_test_dout_mux[15:13]};
  4'h4: dig_test_dout = {dig_test_dout_mux[11:0], dig_test_dout_mux[15:12]};
  4'h5: dig_test_dout = {dig_test_dout_mux[10:0], dig_test_dout_mux[15:11]};
  4'h6: dig_test_dout = {dig_test_dout_mux[ 9:0], dig_test_dout_mux[15:10]};
  4'h7: dig_test_dout = {dig_test_dout_mux[ 8:0], dig_test_dout_mux[15: 9]};
  4'h8: dig_test_dout = {dig_test_dout_mux[ 7:0], dig_test_dout_mux[15: 8]};
  4'h9: dig_test_dout = {dig_test_dout_mux[ 6:0], dig_test_dout_mux[15: 7]};
  4'ha: dig_test_dout = {dig_test_dout_mux[ 5:0], dig_test_dout_mux[15: 6]};
  4'hb: dig_test_dout = {dig_test_dout_mux[ 4:0], dig_test_dout_mux[15: 5]};
  4'hc: dig_test_dout = {dig_test_dout_mux[ 3:0], dig_test_dout_mux[15: 4]};
  4'hd: dig_test_dout = {dig_test_dout_mux[ 2:0], dig_test_dout_mux[15: 3]};
  4'he: dig_test_dout = {dig_test_dout_mux[ 1:0], dig_test_dout_mux[15: 2]};
  4'hf: dig_test_dout = {dig_test_dout_mux[   0], dig_test_dout_mux[15: 1]};
  default: dig_test_dout = dig_test_dout_mux;
  endcase

endmodule
