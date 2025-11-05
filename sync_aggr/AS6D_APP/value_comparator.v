
module value_comparator #(
    parameter   DATA_WDTH = 6
)(/*AUTOARG*/
   // Outputs
   out_vld, out_data, out_comp_fail,
   // Inputs
   in_vld0, in_vld1, in_data0, in_data1
   );
    input                           in_vld0;
    input                           in_vld1;
    input      [DATA_WDTH-1:0]      in_data0;
    input      [DATA_WDTH-1:0]      in_data1;
    output                          out_vld;
    output reg [DATA_WDTH-1:0]      out_data;
    output                          out_comp_fail;
    
    assign      out_vld = in_vld0|in_vld1;
    
    always@(*)begin
        if(in_vld0) out_data = in_data0;
        else if(in_vld1) out_data = in_data1;
        else out_data = {(DATA_WDTH){1'b1}};
    end

    assign      out_comp_fail = (in_vld0&in_vld1) ? |(in_data0^in_data1) : 1'd0 ;
    
endmodule
