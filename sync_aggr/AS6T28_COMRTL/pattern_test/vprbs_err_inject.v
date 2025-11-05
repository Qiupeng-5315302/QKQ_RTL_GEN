
module vprbs_err_inject(/*autoarg*/
   // Outputs
   data_out,
   // Inputs
   clk, rst_n, data_in, data_en, err_inject_restart,
   reg_vprbs_err_inject_en, reg_vprbs_err_inject_intv_time,
   reg_vprbs_err_inject_intv_num
   );

    //inputs
    input                                         clk;
    input                                         rst_n;
    input      [63:0]                             data_in;
    input                                         data_en;
    input                                         err_inject_restart;
    input                                         reg_vprbs_err_inject_en;
    input      [ 7:0]                             reg_vprbs_err_inject_intv_time;
    input      [ 7:0]                             reg_vprbs_err_inject_intv_num;

    //outputs
    output     [63:0]                             data_out;

    reg        [63:0]                             data_c;
    wire       [32:0]                             scrb_out;
    reg        [ 7:0]                             vprbs_err_inject_intv_time_cnt;
    reg        [ 7:0]                             vprbs_err_inject_intv_num_cnt;
    wire       [ 7:0]                             reg_vprbs_err_inject_intv_num;
    wire       [ 7:0]                             reg_vprbs_err_inject_intv_time;
    wire                                          scrb_vld;
    reg        [32:0]                             scrb_save;

    assign scrb_vld = reg_vprbs_err_inject_en&&
                      (vprbs_err_inject_intv_time_cnt == (reg_vprbs_err_inject_intv_time))&&
                      (vprbs_err_inject_intv_num_cnt < (reg_vprbs_err_inject_intv_num));

    assign data_out = scrb_vld ? data_c : data_in ;
    

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)
            scrb_save <= {33{1'b1}};
        else if((data_en)&scrb_vld)
            scrb_save <= scrb_out;
    end
    
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)
            vprbs_err_inject_intv_time_cnt <= {8{1'b0}};
        else if(err_inject_restart)
            vprbs_err_inject_intv_time_cnt <= {8{1'b0}};
        else if(!reg_vprbs_err_inject_en)
            vprbs_err_inject_intv_time_cnt <= {8{1'b0}};
        else if(data_en)
            vprbs_err_inject_intv_time_cnt <= (vprbs_err_inject_intv_time_cnt >= (reg_vprbs_err_inject_intv_time)) ? {32{1'b0}}: vprbs_err_inject_intv_time_cnt + 1'd1;
    end

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)
            vprbs_err_inject_intv_num_cnt <= {8{1'b0}};
        else if(err_inject_restart)
            vprbs_err_inject_intv_num_cnt <= {8{1'b0}};
        else if(!reg_vprbs_err_inject_en)
            vprbs_err_inject_intv_num_cnt <= {8{1'b0}};
        else if((data_en)&&(vprbs_err_inject_intv_time_cnt == (reg_vprbs_err_inject_intv_time)))
            vprbs_err_inject_intv_num_cnt <= (vprbs_err_inject_intv_num_cnt == reg_vprbs_err_inject_intv_num) ? vprbs_err_inject_intv_num_cnt : vprbs_err_inject_intv_num_cnt + 1'd1;
    end

    scrambler_core_64bit u_scrambler_core_64bit(
       // Outputs
       .data_out    (data_c), 
       .lfsr_c      (scrb_out),
       // Inputs
       .data_in     (data_in), 
       .lfsr_q      (scrb_save)
       );



endmodule
