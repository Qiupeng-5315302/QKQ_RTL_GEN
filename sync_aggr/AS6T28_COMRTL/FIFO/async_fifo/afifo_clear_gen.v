
module afifo_clear_gen(/*AUTOARG*/
   // Outputs
   vp_buffer_wr_clear, vp_buffer_rd_clear,
   // Inputs
   vp_wr_clk, vp_wr_clk_rst_n, vp_rd_clk, vp_rd_clk_rst_n,
   clear_trigger
   );
    input   vp_wr_clk;
    input   vp_wr_clk_rst_n;
    input   vp_rd_clk;
    input   vp_rd_clk_rst_n;
    
    input   clear_trigger;
    output  vp_buffer_wr_clear;
    output  vp_buffer_rd_clear;

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		sync_clear_ack;		// From u_afifo_clear_sync of afifo_clear_sync.v
    wire		sync_clear_busy;	// From u_afifo_clear_sync of afifo_clear_sync.v
    wire		sync_clear_req;		// From u_afifo_clear_ctrl of afifo_clear_ctrl.v
    // End of automatics

    /*afifo_clear_ctrl AUTO_TEMPLATE(
        .wr_clk(vp_wr_clk),
        .wr_rst_n(vp_wr_clk_rst_n),
        .clear_trigger(clear_trigger),
        .clear_ready(),
        .clear_done(),
    )*/
    afifo_clear_ctrl u_afifo_clear_ctrl(/*AUTOINST*/
					// Outputs
					.clear_ready	(),		 // Templated
					.clear_done	(),		 // Templated
					.sync_clear_req	(sync_clear_req),
					// Inputs
					.wr_clk		(vp_wr_clk),	 // Templated
					.wr_rst_n	(vp_wr_clk_rst_n), // Templated
					.clear_trigger	(clear_trigger), // Templated
					.sync_clear_ack	(sync_clear_ack),
					.sync_clear_busy(sync_clear_busy));
    
    /*afifo_clear_sync AUTO_TEMPLATE(
        .wr_clk(vp_wr_clk),
        .wr_rst_n(vp_wr_clk_rst_n),
        .rd_clk(vp_rd_clk),
        .rd_rst_n(vp_rd_clk_rst_n),
        .main_clk(vp_wr_clk),
        .main_rst_n(vp_wr_clk_rst_n),
        .wr_domain_clear(vp_buffer_wr_clear),
        .rd_domain_clear(vp_buffer_rd_clear),
    )*/
    afifo_clear_sync#(
        .CLEAR_DONE_DELAY_CYCLES(3)
    )u_afifo_clear_sync(/*AUTOINST*/
			// Outputs
			.sync_clear_ack	(sync_clear_ack),
			.sync_clear_busy(sync_clear_busy),
			.wr_domain_clear(vp_buffer_wr_clear),	 // Templated
			.rd_domain_clear(vp_buffer_rd_clear),	 // Templated
			// Inputs
			.wr_clk		(vp_wr_clk),		 // Templated
			.wr_rst_n	(vp_wr_clk_rst_n),	 // Templated
			.rd_clk		(vp_rd_clk),		 // Templated
			.rd_rst_n	(vp_rd_clk_rst_n),	 // Templated
			.main_clk	(vp_wr_clk),		 // Templated
			.main_rst_n	(vp_wr_clk_rst_n),	 // Templated
			.sync_clear_req	(sync_clear_req));

endmodule
//Local Variables:
//verilog-auto-inst-param-value : t
//verilog-library-files:()
//verilog-library-extensions:(".v"".vh"".sv"".svh")
//End:

