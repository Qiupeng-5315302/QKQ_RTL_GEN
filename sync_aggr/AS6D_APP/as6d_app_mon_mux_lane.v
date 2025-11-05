
module        as6d_app_mon_mux_lane  (/*AUTOARG*/
   // Outputs
   dig_test_dout_lane,
   // Inputs
   reg_testbus_sel_hi, reg_testbus_sel_lo, mon_value1, mon_value2,
   mon_value3, mon_value4, mon_value5, mon_value6, mon_value7,
   mon_value8, mon_value9, mon_value10, mon_value11, mon_value12,
   mon_value13, mon_value14, mon_value15, mon_value16, mon_value17,
   mon_value18, mon_value19, mon_value20, mon_value21, mon_value22,
   mon_value23, mon_value24, mon_value25, mon_value26, mon_value27,
   mon_value28, mon_value29, mon_value30, mon_value31
   );

input [5:0]   reg_testbus_sel_hi;
input [5:0]   reg_testbus_sel_lo;
output [15:0] dig_test_dout_lane;

//input reg_testbus_hi8bsel_8bmode;



input  [15:0]   mon_value1	;
input  [15:0]   mon_value2	;
input  [15:0]   mon_value3	;
input  [15:0]   mon_value4	;
input  [15:0]   mon_value5	;
input  [15:0]   mon_value6	;
input  [15:0]   mon_value7	;
input  [15:0]   mon_value8	;
input  [15:0]   mon_value9	;
input  [15:0]   mon_value10	;
input  [15:0]   mon_value11	;
input  [15:0]   mon_value12	;
input  [15:0]   mon_value13	;
input  [15:0]   mon_value14	;
input  [15:0]   mon_value15	;
input  [15:0]   mon_value16	;
input  [15:0]   mon_value17	;
input  [15:0]   mon_value18	;
input  [15:0]   mon_value19	;
input  [15:0]   mon_value20	;
input  [15:0]   mon_value21	;
input  [15:0]   mon_value22	;
input  [15:0]   mon_value23	;
input  [15:0]   mon_value24	;
input  [15:0]   mon_value25	;
input  [15:0]   mon_value26	;
input  [15:0]   mon_value27	;
input  [15:0]   mon_value28	;
input  [15:0]   mon_value29	;
input  [15:0]   mon_value30	;
input  [15:0]   mon_value31	;

wire    [15:0]  dig_test_din_0 ;
wire    [15:0]  dig_test_din_1 ;
wire    [15:0]  dig_test_din_2 ;
wire    [15:0]  dig_test_din_3 ;
wire    [15:0]  dig_test_din_4 ;
wire    [15:0]  dig_test_din_5 ;
wire    [15:0]  dig_test_din_6 ;
wire    [15:0]  dig_test_din_7 ;
wire    [15:0]  dig_test_din_8 ;
wire    [15:0]  dig_test_din_9 ;
wire    [15:0]  dig_test_din_10 ;
wire    [15:0]  dig_test_din_11 ;
wire    [15:0]  dig_test_din_12 ;
wire    [15:0]  dig_test_din_13 ;
wire    [15:0]  dig_test_din_14 ;
wire    [15:0]  dig_test_din_15 ;
wire    [15:0]  dig_test_din_16 ;
wire    [15:0]  dig_test_din_17 ;
wire    [15:0]  dig_test_din_18 ;
wire    [15:0]  dig_test_din_19 ;
wire    [15:0]  dig_test_din_20 ;
wire    [15:0]  dig_test_din_21 ;
wire    [15:0]  dig_test_din_22 ;
wire    [15:0]  dig_test_din_23 ;
wire    [15:0]  dig_test_din_24 ;
wire    [15:0]  dig_test_din_25 ;
wire    [15:0]  dig_test_din_26 ;
wire    [15:0]  dig_test_din_27 ;
wire    [15:0]  dig_test_din_28 ;
wire    [15:0]  dig_test_din_29 ;
wire    [15:0]  dig_test_din_30 ;
wire    [15:0]  dig_test_din_31 ;

reg    [15:0] dig_test_dout;

always @(*)
   case( reg_testbus_sel_hi[5:0] )
      6'd0:   dig_test_dout = dig_test_din_0 ;
      6'd1:   dig_test_dout = dig_test_din_1 ;
      6'd2:   dig_test_dout = dig_test_din_2 ;
      6'd3:   dig_test_dout = dig_test_din_3 ;
      6'd4:   dig_test_dout = dig_test_din_4 ;
      6'd5:   dig_test_dout = dig_test_din_5 ;
      6'd6:   dig_test_dout = dig_test_din_6 ;
      6'd7:   dig_test_dout = dig_test_din_7 ;
      6'd8:   dig_test_dout = dig_test_din_8 ;
      6'd9:   dig_test_dout = dig_test_din_9 ;
      6'd10:  dig_test_dout = dig_test_din_10 ;
      6'd11:  dig_test_dout = dig_test_din_11 ;
      6'd12:  dig_test_dout = dig_test_din_12 ;
      6'd13:  dig_test_dout = dig_test_din_13 ;
      6'd14:  dig_test_dout = dig_test_din_14 ;
      6'd15:  dig_test_dout = dig_test_din_15 ;
      6'd16:  dig_test_dout = dig_test_din_16 ;
      6'd17:  dig_test_dout = dig_test_din_17 ;
      6'd18:  dig_test_dout = dig_test_din_18 ;
      6'd19:  dig_test_dout = dig_test_din_19 ;
      6'd20:  dig_test_dout = dig_test_din_20 ;
      6'd21:  dig_test_dout = dig_test_din_21 ;
      6'd22:  dig_test_dout = dig_test_din_22 ;
      6'd23:  dig_test_dout = dig_test_din_23 ;
      6'd24:  dig_test_dout = dig_test_din_24 ;
      6'd25:  dig_test_dout = dig_test_din_25 ;
      6'd26:  dig_test_dout = dig_test_din_26 ;
      6'd27:  dig_test_dout = dig_test_din_27 ;
      6'd28:  dig_test_dout = dig_test_din_28 ;
      6'd29:  dig_test_dout = dig_test_din_29 ;
      6'd30:  dig_test_dout = dig_test_din_30 ;
      6'd31:  dig_test_dout = dig_test_din_31 ;
    default:  dig_test_dout = 16'h0;
   endcase




assign dig_test_din_0  = 16'haa55;
assign dig_test_din_1  = mon_value1 [15:0];
assign dig_test_din_2  = mon_value2 [15:0];
assign dig_test_din_3  = mon_value3 [15:0];
assign dig_test_din_4  = mon_value4 [15:0];
assign dig_test_din_5  = mon_value5 [15:0];
assign dig_test_din_6  = mon_value6 [15:0];
assign dig_test_din_7  = mon_value7 [15:0];
assign dig_test_din_8  = mon_value8 [15:0];
assign dig_test_din_9  = mon_value9 [15:0];
assign dig_test_din_10 = mon_value10[15:0];
assign dig_test_din_11 = mon_value11[15:0];
assign dig_test_din_12 = mon_value12[15:0];
assign dig_test_din_13 = mon_value13[15:0];
assign dig_test_din_14 = mon_value14[15:0];
assign dig_test_din_15 = mon_value15[15:0];
assign dig_test_din_16 = mon_value16[15:0];
assign dig_test_din_17 = mon_value17[15:0];
assign dig_test_din_18 = mon_value18[15:0];
assign dig_test_din_19 = mon_value19[15:0];
assign dig_test_din_20 = mon_value20[15:0];
assign dig_test_din_21 = mon_value21[15:0];
assign dig_test_din_22 = mon_value22[15:0];
assign dig_test_din_23 = mon_value23[15:0];
assign dig_test_din_24 = mon_value24[15:0];
assign dig_test_din_25 = mon_value25[15:0];
assign dig_test_din_26 = mon_value26[15:0];
assign dig_test_din_27 = mon_value27[15:0];
assign dig_test_din_28 = mon_value28[15:0];
assign dig_test_din_29 = mon_value29[15:0];
assign dig_test_din_30 = mon_value30[15:0];
assign dig_test_din_31 = mon_value31[15:0];

assign   dig_test_dout_lane[15:0] =  dig_test_dout[15:0] ;
//assign   dig_test_dout_lane[15:8] =  dig_test_dout[15:8] ;
//assign   dig_test_dout_lane[7:0] =  reg_testbus_hi8bsel_8bmode ? dig_test_dout[15:8] : dig_test_dout[7:0] ;




endmodule
