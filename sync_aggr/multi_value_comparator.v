module multiple_value_comparator #(
    parameter   DATA_WDTH = 6
)(/*AUTOARG*/
   // Outputs
   out_vld, out_data, out_comp_fail,
   // Inputs
   in_vld0, in_data0, in_vld1, in_data1, in_vld2, in_data2, in_vld3,
   in_data3
   );
    input                       in_vld0;
    input   [DATA_WDTH-1:0]     in_data0;
    input                       in_vld1;
    input   [DATA_WDTH-1:0]     in_data1;
    input                       in_vld2;
    input   [DATA_WDTH-1:0]     in_data2;
    input                       in_vld3;
    input   [DATA_WDTH-1:0]     in_data3;
    output                      out_vld;
    output  [DATA_WDTH-1:0]     out_data;
    output                      out_comp_fail;
    
    wire                        out_vld0;
    wire    [DATA_WDTH-1:0]     out_data0;
    wire                        out_comp_fail0;
    wire                        out_vld1;
    wire    [DATA_WDTH-1:0]     out_data1;
    wire                        out_comp_fail1;
    wire                        out_vld2;
    wire    [DATA_WDTH-1:0]     out_data2;
    wire                        out_comp_fail2;

    value_comparator u0_value_comparator(
        .in_vld0(in_vld0),
        .in_data0(in_data0),
        .in_vld1(in_vld1),
        .in_data1(in_data1),
        .out_vld(out_vld0),
        .out_data(out_data0),
        .out_comp_fail(out_comp_fail0)
    );
    
    value_comparator u1_value_comparator(
        .in_vld0(out_vld0),
        .in_data0(out_data0),
        .in_vld1(in_vld2),
        .in_data1(in_data2),
        .out_vld(out_vld1),
        .out_data(out_data1),
        .out_comp_fail(out_comp_fail1)
    );

    value_comparator u2_value_comparator(
        .in_vld0(out_vld1),
        .in_data0(out_data1),
        .in_vld1(in_vld3),
        .in_data1(in_data3),
        .out_vld(out_vld2),
        .out_data(out_data2),
        .out_comp_fail(out_comp_fail2)
    );

    assign  out_vld = out_vld2;
    assign  out_data = out_data2;
    assign  out_comp_fail = out_comp_fail0|out_comp_fail1|out_comp_fail2;

endmodule
