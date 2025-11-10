
module fifo_tb;

parameter	DATA_WIDTH = 64;
parameter	ADDR_WIDTH = 8;

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
wire [8:0]	reg_dft_tpram_config;// To u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire [ADDR_WIDTH:0]	async_prog_full_negate_cfg;// To u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire [ADDR_WIDTH:0]	async_prog_full_assert_cfg;// To u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_ram_bypass;	// To u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			clk;			// To u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire [ADDR_WIDTH:0]	prog_full_assert_cfg;	// To u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire [ADDR_WIDTH:0]	prog_full_negate_cfg;	// To u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			ram_bypass;		// To u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			rd_clk;			// To u_async_fifo_wrapper of afifo_wrapper.v, ...
wire			rd_en;			// To u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			rd_rst_n;		// To u_async_fifo_wrapper of afifo_wrapper.v, ...
wire			rst_n;			// To u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire [ADDR_WIDTH:0]	sync_prog_full_assert_cfg;// To u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire [ADDR_WIDTH:0]	sync_prog_full_negate_cfg;// To u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			sync_ram_bypass;	// To u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			wr_clk;			// To u_async_fifo_wrapper of afifo_wrapper.v, ...
wire [DATA_WIDTH-1:0]	wr_data;		// To u_sync_fifo_wrapper of fifo_wrapper.v, ..., Couldn't Merge
wire			wr_en;			// To u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			wr_rst_n;		// To u_async_fifo_wrapper of afifo_wrapper.v, ...

// End of automatics

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
wire [ADDR_WIDTH:0]	async_data_count;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_double_err;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_empty;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_full;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_ovf_int;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_prog_empty;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_prog_full;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire [DATA_WIDTH-1:0]	async_rd_data;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_rd_data_val;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_single_err;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			async_udf_int;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire [ADDR_WIDTH:0]	data_count;		// From u_async_fifo_wrapper of afifo_wrapper.v, ...
wire			double_err;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			empty;			// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			full;			// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			ovf_int;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			prog_empty;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			prog_full;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire [DATA_WIDTH-1:0]	rd_data;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ..., Couldn't Merge
wire			rd_data_val;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			single_err;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
wire			sync_double_err;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			sync_empty;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			sync_full;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			sync_ovf_int;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			sync_prog_full;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			sync_single_err;	// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			sync_udf_int;		// From u_fwft_async_fifo_wrapper of fwft_afifo_wrapper.v
wire			udf_int;		// From u_sync_fifo_wrapper of fifo_wrapper.v, ...
// End of automatics

/* fifo_wrapper	AUTO_TEMPLATE();*/
fifo_wrapper   #(
		.FLIPFLOP	(0),
		.ADDR_WIDTH	(ADDR_WIDTH),
		.DATA_WIDTH	(DATA_WIDTH)
)u_sync_fifo_wrapper(/*AUTOINST*/
		     // Outputs
		     .rd_data		(rd_data[DATA_WIDTH-1:0]),
		     .rd_data_val	(rd_data_val),
		     .prog_empty	(prog_empty),
		     .prog_full		(prog_full),
		     .ovf_int		(ovf_int),
		     .udf_int		(udf_int),
		     .empty		(empty),
		     .full		(full),
		     .single_err	(single_err),
		     .double_err	(double_err),
		     // Inputs
		     .clk		(clk),
		     .rst_n		(rst_n),
		     .ram_bypass	(ram_bypass),
		     .prog_full_assert_cfg(prog_full_assert_cfg[ADDR_WIDTH:0]),
		     .prog_full_negate_cfg(prog_full_negate_cfg[ADDR_WIDTH:0]),
		     .wr_data		(wr_data[DATA_WIDTH-1:0]),
		     .wr_en		(wr_en),
		     .rd_en		(rd_en));

/* fifo_wrapper	AUTO_TEMPLATE();*/
fifo_2048x140_app_video_pipe_wrapper   #(
		.FLIPFLOP	(0),
		.ADDR_WIDTH	(2048),
		.DATA_WIDTH	(140)
)u_sync_fifo_2048x140_app_video_pipe_wrapper(/*AUTOINST*/
		     // Outputs
		     .rd_data		(rd_data[DATA_WIDTH-1:0]),
		     .rd_data_val	(rd_data_val),
		     .prog_empty	(prog_empty),
		     .prog_full		(prog_full),
		     .ovf_int		(ovf_int),
		     .udf_int		(udf_int),
		     .empty		(empty),
		     .full		(full),
		     .single_err	(single_err),
		     .double_err	(double_err),
		     // Inputs
			 .reg_dft_tpram_config( reg_dft_tpram_config  ),
		     .clk		(clk),
		     .rst_n		(rst_n),
		     .ram_bypass	(ram_bypass),
		     .prog_full_assert_cfg(prog_full_assert_cfg[ADDR_WIDTH:0]),
		     .prog_full_negate_cfg(prog_full_negate_cfg[ADDR_WIDTH:0]),
		     .wr_data		(wr_data[DATA_WIDTH-1:0]),
		     .wr_en		(wr_en),
		     .rd_en		(rd_en));

/* fifo_wrapper	AUTO_TEMPLATE();*/
fifo_wrapper #(
		.FLIPFLOP	(1),
		.ADDR_WIDTH	(11),
		.DATA_WIDTH	(140)
)u_sync_ff_fifo_wrapper(/*AUTOINST*/
			// Outputs
			.rd_data	(rd_data[DATA_WIDTH-1:0]),
			.rd_data_val	(rd_data_val),
			.prog_empty	(prog_empty),
			.prog_full	(prog_full),
			.ovf_int	(ovf_int),
			.udf_int	(udf_int),
			.empty		(empty),
			.full		(full),
			.single_err	(single_err),
			.double_err	(double_err),
			// Inputs
			.clk		(clk),
			.rst_n		(rst_n),
			.ram_bypass	(ram_bypass),
			.prog_full_assert_cfg(prog_full_assert_cfg[ADDR_WIDTH:0]),
			.prog_full_negate_cfg(prog_full_negate_cfg[ADDR_WIDTH:0]),
			.wr_data	(wr_data[DATA_WIDTH-1:0]),
			.wr_en		(wr_en),
			.rd_en		(rd_en));

/* fwft_fifo_wrapper	AUTO_TEMPLATE();*/
fwft_fifo_wrapper #(
		.FLIPFLOP	(0),
		.ADDR_WIDTH	(ADDR_WIDTH),
		.DATA_WIDTH	(DATA_WIDTH)
)u_sync_fwft_fifo_wrapper(/*AUTOINST*/
			  // Outputs
			  .rd_data		(rd_data[(DATA_WIDTH-1):0]),
			  .rd_data_val		(rd_data_val),
			  .single_err		(single_err),
			  .double_err		(double_err),
			  .ovf_int		(ovf_int),
			  .udf_int		(udf_int),
			  .prog_full		(prog_full),
			  .empty		(empty),
			  .full			(full),
			  // Inputs
			  .clk			(clk),
			  .rst_n		(rst_n),
			  .ram_bypass		(ram_bypass),
			  .prog_full_assert_cfg	(prog_full_assert_cfg[ADDR_WIDTH:0]),
			  .prog_full_negate_cfg	(prog_full_negate_cfg[ADDR_WIDTH:0]),
			  .wr_data		(wr_data[(DATA_WIDTH-1):0]),
			  .wr_en		(wr_en),
			  .rd_en		(rd_en));

/* fwft_fifo_wrapper	AUTO_TEMPLATE();*/
fwft_fifo_2048x140_app_video_pipe_wrapper #(
		.FLIPFLOP	(0),
		.ADDR_WIDTH	(11),
		.DATA_WIDTH	(140)
)u_sync_fwft_fifo_2048x140_app_video_pipe_wrapper(/*AUTOINST*/
			  // Outputs
			  .rd_data		(rd_data[(DATA_WIDTH-1):0]),
			  .rd_data_val		(rd_data_val),
			  .single_err		(single_err),
			  .double_err		(double_err),
			  .ovf_int		(ovf_int),
			  .udf_int		(udf_int),
			  .prog_full		(prog_full),
			  .empty		(empty),
			  .full			(full),
			  // Inputs
			  .reg_dft_tpram_config( reg_dft_tpram_config  ),
			  .clk			(clk),
			  .rst_n		(rst_n),
			  .ram_bypass		(ram_bypass),
			  .prog_full_assert_cfg	(prog_full_assert_cfg[ADDR_WIDTH:0]),
			  .prog_full_negate_cfg	(prog_full_negate_cfg[ADDR_WIDTH:0]),
			  .wr_data		(wr_data[(DATA_WIDTH-1):0]),
			  .wr_en		(wr_en),
			  .rd_en		(rd_en));

/* afifo_wrapper	AUTO_TEMPLATE();*/
afifo_wrapper    #(
		.FLIPFLOP	(0),
		.ADDR_WIDTH	(ADDR_WIDTH),
		.DATA_WIDTH	(DATA_WIDTH)
)u_async_fifo_wrapper(/*AUTOINST*/
		      // Outputs
		      .prog_full	(prog_full),
		      .full		(full),
		      .prog_empty	(prog_empty),
		      .empty		(empty),
		      .rd_data		(rd_data[DATA_WIDTH-1:0]),
		      .rd_data_val	(rd_data_val),
		      .single_err	(single_err),
		      .double_err	(double_err),
		      .ovf_int		(ovf_int),
		      .udf_int		(udf_int),
		      .data_count	(data_count[ADDR_WIDTH:0]),
		      // Inputs
		      .wr_rst_n		(wr_rst_n),
		      .wr_clk		(wr_clk),
		      .wr_en		(wr_en),
		      .wr_data		(wr_data[DATA_WIDTH-1:0]),
		      .prog_full_assert_cfg(prog_full_assert_cfg[ADDR_WIDTH:0]),
		      .prog_full_negate_cfg(prog_full_negate_cfg[ADDR_WIDTH:0]),
		      .ram_bypass	(ram_bypass),
		      .rd_rst_n		(rd_rst_n),
		      .rd_clk		(rd_clk),
		      .rd_en		(rd_en));

/* afifo_wrapper	AUTO_TEMPLATE();*/
afifo_32x140_app_video_pipe_wrapper    #(
		.FLIPFLOP	(0),
		.ADDR_WIDTH	(5),
		.DATA_WIDTH	(140)
)u_async_afifo_32x140_app_video_pipe_wrapper(/*AUTOINST*/
		      // Outputs
		      .prog_full	(prog_full),
		      .full		(full),
		      .prog_empty	(prog_empty),
		      .empty		(empty),
		      .rd_data		(rd_data[DATA_WIDTH-1:0]),
		      .rd_data_val	(rd_data_val),
		      .single_err	(single_err),
		      .double_err	(double_err),
		      .ovf_int		(ovf_int),
		      .udf_int		(udf_int),
		      .data_count	(data_count[ADDR_WIDTH:0]),
		      // Inputs
			  .reg_dft_tpram_config( reg_dft_tpram_config  ),
		      .wr_rst_n		(wr_rst_n),
		      .wr_clk		(wr_clk),
		      .wr_en		(wr_en),
		      .wr_data		(wr_data[DATA_WIDTH-1:0]),
		      .prog_full_assert_cfg(prog_full_assert_cfg[ADDR_WIDTH:0]),
		      .prog_full_negate_cfg(prog_full_negate_cfg[ADDR_WIDTH:0]),
		      .ram_bypass	(ram_bypass),
		      .rd_rst_n		(rd_rst_n),
		      .rd_clk		(rd_clk),
		      .rd_en		(rd_en));

/* afifo_wrapper	AUTO_TEMPLATE();*/
afifo_wrapper    #(
		.FLIPFLOP	(1),
		.ADDR_WIDTH	(ADDR_WIDTH),
		.DATA_WIDTH	(DATA_WIDTH)
)u_async_ff_fifo_wrapper(/*AUTOINST*/
			 // Outputs
			 .prog_full		(prog_full),
			 .full			(full),
			 .prog_empty		(prog_empty),
			 .empty			(empty),
			 .rd_data		(rd_data[DATA_WIDTH-1:0]),
			 .rd_data_val		(rd_data_val),
			 .single_err		(single_err),
			 .double_err		(double_err),
			 .ovf_int		(ovf_int),
			 .udf_int		(udf_int),
			 .data_count		(data_count[ADDR_WIDTH:0]),
			 // Inputs
			 .wr_rst_n		(wr_rst_n),
			 .wr_clk		(wr_clk),
			 .wr_en			(wr_en),
			 .wr_data		(wr_data[DATA_WIDTH-1:0]),
			 .prog_full_assert_cfg	(prog_full_assert_cfg[ADDR_WIDTH:0]),
			 .prog_full_negate_cfg	(prog_full_negate_cfg[ADDR_WIDTH:0]),
			 .ram_bypass		(ram_bypass),
			 .rd_rst_n		(rd_rst_n),
			 .rd_clk		(rd_clk),
			 .rd_en			(rd_en));

/* fwft_afifo_wrapper	AUTO_TEMPLATE();*/
fwft_afifo_wrapper	#(
		.ASYNC_FLIPFLOP			(1),
		.SYNC_FLIPFLOP			(0),
		.ASYNC_ADDR_WIDTH		(4),
		.SYNC_ADDR_WIDTH		(ADDR_WIDTH),
		.DATA_WIDTH				(DATA_WIDTH)
)u_async_fwft_fifo_wrapper(/*AUTOINST*/
						  // Outputs
						  .async_data_count	(async_data_count[4:0]),
						  .async_double_err	(async_double_err),
						  .async_empty		(async_empty),
						  .async_full		(async_full),
						  .async_ovf_int	(async_ovf_int),
						  .async_prog_empty	(async_prog_empty),
						  .async_prog_full	(async_prog_full),
						  .async_rd_data	(async_rd_data[DATA_WIDTH-1:0]),
						  .async_rd_data_val	(async_rd_data_val),
						  .async_single_err	(async_single_err),
						  .async_udf_int	(async_udf_int),
						  .rd_data		(rd_data),
						  .rd_data_val		(rd_data_val),
						  .sync_double_err	(sync_double_err),
						  .sync_empty		(sync_empty),
						  .sync_full		(sync_full),
						  .sync_ovf_int		(sync_ovf_int),
						  .sync_prog_full	(sync_prog_full),
						  .sync_single_err	(sync_single_err),
						  .sync_udf_int		(sync_udf_int),
						  // Inputs
						  .async_prog_full_assert_cfg(async_prog_full_assert_cfg[4:0]),
						  .async_prog_full_negate_cfg(async_prog_full_negate_cfg[4:0]),
						  .async_ram_bypass	(async_ram_bypass),
						  .rd_clk		(rd_clk),
						  .rd_en		(rd_en),
						  .rd_rst_n		(rd_rst_n),
						  .sync_prog_full_assert_cfg(sync_prog_full_assert_cfg[ADDR_WIDTH:0]),
						  .sync_prog_full_negate_cfg(sync_prog_full_negate_cfg[ADDR_WIDTH:0]),
						  .sync_ram_bypass	(sync_ram_bypass),
						  .wr_clk		(wr_clk),
						  .wr_data		(wr_data[DATA_WIDTH-1:0]),
						  .wr_en		(wr_en),
						  .wr_rst_n		(wr_rst_n));


fwft_afifo_32x140_2048x140_app_video_pipe_wrapper	#(
		.ASYNC_FLIPFLOP			(0),
		.SYNC_FLIPFLOP			(0),
		.ASYNC_ADDR_WIDTH		(5),
		.SYNC_ADDR_WIDTH		(11),
		.DATA_WIDTH				(140)
)u_async_fwft_afifo_32x140_2048x140_app_video_pipe_wrapper(/*AUTOINST*/
						  // Outputs
						  .async_data_count	(async_data_count[4:0]),
						  .async_double_err	(async_double_err),
						  .async_empty		(async_empty),
						  .async_full		(async_full),
						  .async_ovf_int	(async_ovf_int),
						  .async_prog_empty	(async_prog_empty),
						  .async_prog_full	(async_prog_full),
						  .async_rd_data	(async_rd_data[DATA_WIDTH-1:0]),
						  .async_rd_data_val	(async_rd_data_val),
						  .async_single_err	(async_single_err),
						  .async_udf_int	(async_udf_int),
						  .rd_data		(rd_data),
						  .rd_data_val		(rd_data_val),
						  .sync_double_err	(sync_double_err),
						  .sync_empty		(sync_empty),
						  .sync_full		(sync_full),
						  .sync_ovf_int		(sync_ovf_int),
						  .sync_prog_full	(sync_prog_full),
						  .sync_single_err	(sync_single_err),
						  .sync_udf_int		(sync_udf_int),
						  // Inputs
						  .reg_dft_tpram_config( reg_dft_tpram_config  ),
						  .async_prog_full_assert_cfg(async_prog_full_assert_cfg[5:0]),
						  .async_prog_full_negate_cfg(async_prog_full_negate_cfg[5:0]),
						  .async_ram_bypass	(async_ram_bypass),
						  .rd_clk		(rd_clk),
						  .rd_en		(rd_en),
						  .rd_rst_n		(rd_rst_n),
						  .sync_prog_full_assert_cfg(sync_prog_full_assert_cfg[ADDR_WIDTH:0]),
						  .sync_prog_full_negate_cfg(sync_prog_full_negate_cfg[ADDR_WIDTH:0]),
						  .sync_ram_bypass	(sync_ram_bypass),
						  .wr_clk		(wr_clk),
						  .wr_data		(wr_data[DATA_WIDTH-1:0]),
						  .wr_en		(wr_en),
						  .wr_rst_n		(wr_rst_n));


endmodule
