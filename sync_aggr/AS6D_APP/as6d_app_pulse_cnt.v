
module as6d_app_pulse_cnt#(
    parameter   CNT_WDTH    =   32
)(/*AUTOARG*/
   // Outputs
   cnt,
   // Inputs
   clk, rst_n, clear, pulse
   );
input                   clk;
input                   rst_n;
input                   clear;
input                   pulse;
output [CNT_WDTH-1:0]   cnt;

reg    [CNT_WDTH-1:0]   cnt;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        cnt <= {CNT_WDTH{1'd0}};
    else if(clear)
        cnt <= {CNT_WDTH{1'd0}};
    else if(pulse)
        cnt <= (cnt == {CNT_WDTH{1'd1}}) ? cnt :cnt + 1'd1 ;
end

endmodule
