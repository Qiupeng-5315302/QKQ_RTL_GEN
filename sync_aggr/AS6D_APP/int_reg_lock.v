
module int_reg_lock(/*AUTOARG*/
   // Outputs
   app_async_rst_req,
   // Inputs
   video_data_fwft_fifo_ovf_int7, video_data_fwft_fifo_ovf_int6,
   video_data_fwft_fifo_ovf_int5, video_data_fwft_fifo_ovf_int4,
   video_data_fwft_fifo_ovf_int3, video_data_fwft_fifo_ovf_int2,
   video_data_fwft_fifo_ovf_int1, video_data_fwft_fifo_ovf_int0,
   sch_data_type_align_fail_int3, sch_data_type_align_fail_int2,
   sch_data_type_align_fail_int1, sch_data_type_align_fail_int0,
   reg_video_data_fwft_fifo_ovf_int_mask7,
   reg_video_data_fwft_fifo_ovf_int_mask6,
   reg_video_data_fwft_fifo_ovf_int_mask5,
   reg_video_data_fwft_fifo_ovf_int_mask4,
   reg_video_data_fwft_fifo_ovf_int_mask3,
   reg_video_data_fwft_fifo_ovf_int_mask2,
   reg_video_data_fwft_fifo_ovf_int_mask1,
   reg_video_data_fwft_fifo_ovf_int_mask0,
   reg_sch_data_type_align_fail_int_mask3,
   reg_sch_data_type_align_fail_int_mask2,
   reg_sch_data_type_align_fail_int_mask1,
   reg_sch_data_type_align_fail_int_mask0, fifo_rdclk_rst_n7,
   fifo_rdclk_rst_n6, fifo_rdclk_rst_n5, fifo_rdclk_rst_n4,
   fifo_rdclk_rst_n3, fifo_rdclk_rst_n2, fifo_rdclk_rst_n1,
   fifo_rdclk_rst_n0, fifo_rdclk7, fifo_rdclk6, fifo_rdclk5,
   fifo_rdclk4, fifo_rdclk3, fifo_rdclk2, fifo_rdclk1, fifo_rdclk0,
   aggre_clk_rst_n3, aggre_clk_rst_n2, aggre_clk_rst_n1,
   aggre_clk_rst_n0, aggre_clk3, aggre_clk2, aggre_clk1, aggre_clk0
   );

    /*AUTOINPUT*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    input		aggre_clk0;		// To u0_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		aggre_clk1;		// To u1_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		aggre_clk2;		// To u2_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		aggre_clk3;		// To u3_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		aggre_clk_rst_n0;	// To u0_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		aggre_clk_rst_n1;	// To u1_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		aggre_clk_rst_n2;	// To u2_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		aggre_clk_rst_n3;	// To u3_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		fifo_rdclk0;		// To u0_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk1;		// To u1_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk2;		// To u2_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk3;		// To u3_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk4;		// To u4_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk5;		// To u5_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk6;		// To u6_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk7;		// To u7_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n0;	// To u0_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n1;	// To u1_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n2;	// To u2_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n3;	// To u3_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n4;	// To u4_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n5;	// To u5_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n6;	// To u6_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		fifo_rdclk_rst_n7;	// To u7_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_sch_data_type_align_fail_int_mask0;// To u0_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		reg_sch_data_type_align_fail_int_mask1;// To u1_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		reg_sch_data_type_align_fail_int_mask2;// To u2_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		reg_sch_data_type_align_fail_int_mask3;// To u3_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask0;// To u0_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask1;// To u1_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask2;// To u2_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask3;// To u3_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask4;// To u4_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask5;// To u5_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask6;// To u6_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		reg_video_data_fwft_fifo_ovf_int_mask7;// To u7_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		sch_data_type_align_fail_int0;// To u0_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		sch_data_type_align_fail_int1;// To u1_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		sch_data_type_align_fail_int2;// To u2_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		sch_data_type_align_fail_int3;// To u3_pulse_cnt_sch_data_type_align_fail of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int0;// To u0_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int1;// To u1_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int2;// To u2_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int3;// To u3_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int4;// To u4_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int5;// To u5_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int6;// To u6_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    input		video_data_fwft_fifo_ovf_int7;// To u7_pulse_cnt_video_data_fwft_fifo_ovf of pulse_cnt.v
    // End of automatics
    
    output          app_async_rst_req;
    
    wire            video_data_fwft_fifo_ovf_lock0;
    wire            video_data_fwft_fifo_ovf_lock1;
    wire            video_data_fwft_fifo_ovf_lock2;
    wire            video_data_fwft_fifo_ovf_lock3;
    wire            video_data_fwft_fifo_ovf_lock4;
    wire            video_data_fwft_fifo_ovf_lock5;
    wire            video_data_fwft_fifo_ovf_lock6;
    wire            video_data_fwft_fifo_ovf_lock7;
    wire            sch_data_type_align_fail_lock0;
    wire            sch_data_type_align_fail_lock1;
    wire            sch_data_type_align_fail_lock2;
    wire            sch_data_type_align_fail_lock3;
    
    /*pulse_cnt AUTO_TEMPLATE(
        .clk(fifo_rdclk@),
        .rst_n(fifo_rdclk_rst_n@),
        .pulse(video_data_fwft_fifo_ovf_int@),
        .clear(reg_video_data_fwft_fifo_ovf_int_mask@),
        .cnt(video_data_fwft_fifo_ovf_lock@),
    )*/
    pulse_cnt #(.CNT_WDTH(1)) u0_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock0), // Templated
								    // Inputs
								    .clk		(fifo_rdclk0),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n0), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask0), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int0)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u1_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock1), // Templated
								    // Inputs
								    .clk		(fifo_rdclk1),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n1), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask1), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int1)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u2_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock2), // Templated
								    // Inputs
								    .clk		(fifo_rdclk2),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n2), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask2), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int2)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u3_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock3), // Templated
								    // Inputs
								    .clk		(fifo_rdclk3),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n3), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask3), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int3)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u4_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock4), // Templated
								    // Inputs
								    .clk		(fifo_rdclk4),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n4), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask4), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int4)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u5_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock5), // Templated
								    // Inputs
								    .clk		(fifo_rdclk5),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n5), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask5), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int5)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u6_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock6), // Templated
								    // Inputs
								    .clk		(fifo_rdclk6),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n6), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask6), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int6)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u7_pulse_cnt_video_data_fwft_fifo_ovf(/*AUTOINST*/
								    // Outputs
								    .cnt		(video_data_fwft_fifo_ovf_lock7), // Templated
								    // Inputs
								    .clk		(fifo_rdclk7),	 // Templated
								    .rst_n		(fifo_rdclk_rst_n7), // Templated
								    .clear		(reg_video_data_fwft_fifo_ovf_int_mask7), // Templated
								    .pulse		(video_data_fwft_fifo_ovf_int7)); // Templated
    
    /*pulse_cnt AUTO_TEMPLATE(
        .clk(aggre_clk@),
        .rst_n(aggre_clk_rst_n@),
        .pulse(sch_data_type_align_fail_int@),
        .clear(reg_sch_data_type_align_fail_int_mask@),
        .cnt(sch_data_type_align_fail_lock@),
    )*/
    pulse_cnt #(.CNT_WDTH(1)) u0_pulse_cnt_sch_data_type_align_fail(/*AUTOINST*/
								    // Outputs
								    .cnt		(sch_data_type_align_fail_lock0), // Templated
								    // Inputs
								    .clk		(aggre_clk0),	 // Templated
								    .rst_n		(aggre_clk_rst_n0), // Templated
								    .clear		(reg_sch_data_type_align_fail_int_mask0), // Templated
								    .pulse		(sch_data_type_align_fail_int0)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u1_pulse_cnt_sch_data_type_align_fail(/*AUTOINST*/
								    // Outputs
								    .cnt		(sch_data_type_align_fail_lock1), // Templated
								    // Inputs
								    .clk		(aggre_clk1),	 // Templated
								    .rst_n		(aggre_clk_rst_n1), // Templated
								    .clear		(reg_sch_data_type_align_fail_int_mask1), // Templated
								    .pulse		(sch_data_type_align_fail_int1)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u2_pulse_cnt_sch_data_type_align_fail(/*AUTOINST*/
								    // Outputs
								    .cnt		(sch_data_type_align_fail_lock2), // Templated
								    // Inputs
								    .clk		(aggre_clk2),	 // Templated
								    .rst_n		(aggre_clk_rst_n2), // Templated
								    .clear		(reg_sch_data_type_align_fail_int_mask2), // Templated
								    .pulse		(sch_data_type_align_fail_int2)); // Templated
    pulse_cnt #(.CNT_WDTH(1)) u3_pulse_cnt_sch_data_type_align_fail(/*AUTOINST*/
								    // Outputs
								    .cnt		(sch_data_type_align_fail_lock3), // Templated
								    // Inputs
								    .clk		(aggre_clk3),	 // Templated
								    .rst_n		(aggre_clk_rst_n3), // Templated
								    .clear		(reg_sch_data_type_align_fail_int_mask3), // Templated
								    .pulse		(sch_data_type_align_fail_int3)); // Templated

    
    assign app_async_rst_req = (video_data_fwft_fifo_ovf_lock0)|
                               (video_data_fwft_fifo_ovf_lock1)|
                               (video_data_fwft_fifo_ovf_lock2)|
                               (video_data_fwft_fifo_ovf_lock3)|
                               (video_data_fwft_fifo_ovf_lock4)|
                               (video_data_fwft_fifo_ovf_lock5)|
                               (video_data_fwft_fifo_ovf_lock6)|
                               (video_data_fwft_fifo_ovf_lock7)|
                               (sch_data_type_align_fail_lock0)|
                               (sch_data_type_align_fail_lock1)|
                               (sch_data_type_align_fail_lock2)|
                               (sch_data_type_align_fail_lock3);

endmodule
//Local Variables:
//verilog-auto-inst-param-value : t
//verilog-library-files:("../../AS6T28_DIGCOM/AS6T28_COMRTL/app_common/pulse_cnt.v")
//verilog-library-extensions:(".v"".vh"".sv"".svh")
//End:

