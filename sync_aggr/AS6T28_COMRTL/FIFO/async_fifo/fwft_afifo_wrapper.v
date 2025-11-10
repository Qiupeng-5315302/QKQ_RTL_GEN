
module fwft_afifo_wrapper(/*AUTOARG*/
   // Outputs
   sync_udf_int, sync_single_err, sync_prog_full, sync_ovf_int,
   sync_full, sync_empty, sync_double_err, rd_data_val, rd_data,
   async_udf_int, async_single_err, async_rd_data_val, async_rd_data,
   async_prog_full, async_prog_empty, async_ovf_int, async_full,
   async_empty, async_double_err, async_data_count,
   // Inputs
   wr_rst_n, wr_en, wr_data, wr_clk, sync_ram_bypass,reg_dft_tpram_config,
   sync_prog_full_negate_cfg, sync_prog_full_assert_cfg, rd_rst_n,
   rd_en, rd_clk, async_ram_bypass, async_prog_full_negate_cfg,
   async_prog_full_assert_cfg
   );
// -----------------------------------------------------------------------------

// parameter declaration

// -----------------------------------------------------------------------------      
parameter   SYNC_FLIPFLOP				 = 1;              //fifo address width
parameter   SYNC_ADDR_WIDTH              = 8;            
parameter   SYNC_PROG_EMPTY_ASSERT       = 4;             //fifo data count threshold of prog empty assert
parameter   SYNC_PROG_EMPTY_NEGATE       = 4;             //fifo data count threshold of prog empty negate
parameter   SYNC_FIFO_DEEP               = 1<<SYNC_ADDR_WIDTH;
parameter   SYNC_RAM_PIPE_STAGE          = 2;             //RAM read dalay

parameter   ASYNC_FLIPFLOP				 = 1;              //fifo address width
parameter   ASYNC_ADDR_WIDTH             = 8;            
parameter   ASYNC_PROG_EMPTY_ASSERT      = 4;             //fifo data count threshold of prog empty assert
parameter   ASYNC_PROG_EMPTY_NEGATE      = 4;             //fifo data count threshold of prog empty negate
parameter   ASYNC_FIFO_DEEP              = 1<<ASYNC_ADDR_WIDTH;
parameter   ASYNC_RAM_PIPE_STAGE         = 2;             //RAM read dalay

parameter   DATA_WIDTH					 = 64;
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input  [8:0]			 reg_dft_tpram_config;
input [ASYNC_ADDR_WIDTH:0] async_prog_full_assert_cfg;// To u_async_fifo_wrapper of afifo_wrapper.v
input [ASYNC_ADDR_WIDTH:0] async_prog_full_negate_cfg;// To u_async_fifo_wrapper of afifo_wrapper.v
input			async_ram_bypass;	// To u_async_fifo_wrapper of afifo_wrapper.v
input			rd_clk;			// To u_async_fifo_wrapper of afifo_wrapper.v, ...
input			rd_en;			// To u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
input			rd_rst_n;		// To u_async_fifo_wrapper of afifo_wrapper.v, ...
input [SYNC_ADDR_WIDTH:0] sync_prog_full_assert_cfg;// To u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
input [SYNC_ADDR_WIDTH:0] sync_prog_full_negate_cfg;// To u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
input			sync_ram_bypass;	// To u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
input			wr_clk;			// To u_async_fifo_wrapper of afifo_wrapper.v
input [DATA_WIDTH-1:0]	wr_data;		// To u_async_fifo_wrapper of afifo_wrapper.v
input			wr_en;			// To u_async_fifo_wrapper of afifo_wrapper.v
input			wr_rst_n;		// To u_async_fifo_wrapper of afifo_wrapper.v
// End of automatics
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [ASYNC_ADDR_WIDTH:0] async_data_count;	// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_double_err;	// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_empty;		// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_full;		// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_ovf_int;		// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_prog_empty;	// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_prog_full;	// From u_async_fifo_wrapper of afifo_wrapper.v
output [DATA_WIDTH-1:0]	async_rd_data;		// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_rd_data_val;	// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_single_err;	// From u_async_fifo_wrapper of afifo_wrapper.v
output			async_udf_int;		// From u_async_fifo_wrapper of afifo_wrapper.v
output [(DATA_WIDTH-1):0] rd_data;		// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			rd_data_val;		// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			sync_double_err;	// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			sync_empty;		// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			sync_full;		// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			sync_ovf_int;		// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			sync_prog_full;		// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			sync_single_err;	// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
output			sync_udf_int;		// From u_sync_fwft_fifo_wrapper of fwft_fifo_wrapper.v
// End of automatics
/*AUTOWIRE*/



wire [DATA_WIDTH-1:0]	async_rd_data		;		
wire					async_rd_data_val	;
wire					async_rd_en			;	
wire [DATA_WIDTH-1:0]	sync_wr_data		;	
wire					sync_wr_en			;

assign	async_rd_en		= ~async_empty;
assign	sync_wr_data	= async_rd_data;	
assign	sync_wr_en		= async_rd_data_val;	

/* afifo_wrapper	AUTO_TEMPLATE(
					.FLIPFLOP				(ASYNC_FLIPFLOP				),        
					.ADDR_WIDTH				(ASYNC_ADDR_WIDTH           ),          
					.FIFO_DEEP				(ASYNC_FIFO_DEEP			),          
					.DATA_WIDTH           	(DATA_WIDTH					),
					.PROG_EMPTY_ASSERT    	(ASYNC_PROG_EMPTY_ASSERT    ),       
					.PROG_EMPTY_NEGATE    	(ASYNC_PROG_EMPTY_NEGATE    ),       
					.RAM_PIPE_STAGE       	(ASYNC_RAM_PIPE_STAGE       ),        
					.wr_en					(wr_en),
				   	.wr_data				(wr_data[]),
				   	.wr_rst_n				(wr_rst_n),
				   	.wr_clk					(wr_clk),
				   	.rd_rst_n				(rd_rst_n),
				   	.rd_clk					(rd_clk),
					.data_count				(async_data_count[ASYNC_ADDR_WIDTH:0]),
					.prog_full_assert_cfg	(async_prog_full_assert_cfg[ASYNC_ADDR_WIDTH:0]),
		     		.prog_full_negate_cfg	(async_prog_full_negate_cfg[ASYNC_ADDR_WIDTH:0]),
					.\(.*\)					(async_\1[]),

);*/
afifo_wrapper #(/*AUTOINSTPARAM*/
		// Parameters
		.FLIPFLOP		(ASYNC_FLIPFLOP				), // Templated
		.ADDR_WIDTH		(ASYNC_ADDR_WIDTH           ), // Templated
		.DATA_WIDTH		(DATA_WIDTH					), // Templated
		.PROG_EMPTY_ASSERT	(ASYNC_PROG_EMPTY_ASSERT    ), // Templated
		.PROG_EMPTY_NEGATE	(ASYNC_PROG_EMPTY_NEGATE    ), // Templated
		.FIFO_DEEP		(ASYNC_FIFO_DEEP			), // Templated
		.RAM_PIPE_STAGE		(ASYNC_RAM_PIPE_STAGE       )) // Templated
u_async_fifo_wrapper(/*AUTOINST*/
		     // Outputs
		     .prog_full		(async_prog_full),	 // Templated
		     .full		(async_full),		 // Templated
		     .prog_empty	(async_prog_empty),	 // Templated
		     .empty		(async_empty),		 // Templated
		     .rd_data		(async_rd_data[DATA_WIDTH-1:0]), // Templated
		     .rd_data_val	(async_rd_data_val),	 // Templated
		     .single_err	(async_single_err),	 // Templated
		     .double_err	(async_double_err),	 // Templated
		     .ovf_int		(async_ovf_int),	 // Templated
		     .udf_int		(async_udf_int),	 // Templated
		     .data_count	(async_data_count[ASYNC_ADDR_WIDTH:0]), // Templated
		     // Inputs
			 .reg_dft_tpram_config( reg_dft_tpram_config  ),
		     .wr_rst_n		(wr_rst_n),		 // Templated
		     .wr_clk		(wr_clk),		 // Templated
		     .wr_en		(wr_en),		 // Templated
		     .wr_data		(wr_data[DATA_WIDTH-1:0]), // Templated
		     .prog_full_assert_cfg(async_prog_full_assert_cfg[ASYNC_ADDR_WIDTH:0]), // Templated
		     .prog_full_negate_cfg(async_prog_full_negate_cfg[ASYNC_ADDR_WIDTH:0]), // Templated
		     .ram_bypass	(async_ram_bypass),	 // Templated
		     .rd_rst_n		(rd_rst_n),		 // Templated
		     .rd_clk		(rd_clk),		 // Templated
		     .rd_en		(async_rd_en));		 // Templated



/* fwft_fifo_wrapper	AUTO_TEMPLATE(
					.FLIPFLOP				(SYNC_FLIPFLOP				),             //fifo address width
					.ADDR_WIDTH				(SYNC_ADDR_WIDTH			),          
					.FIFO_DEEP				(SYNC_FIFO_DEEP				),          
					.DATA_WIDTH           	(DATA_WIDTH					),
					.PROG_EMPTY_ASSERT    	(SYNC_PROG_EMPTY_ASSERT		),           //fifo data count threshold of prog empty assert
					.PROG_EMPTY_NEGATE    	(SYNC_PROG_EMPTY_NEGATE		),           //fifo data count threshold of prog empty negate
					.RAM_PIPE_STAGE       	(SYNC_RAM_PIPE_STAGE		),           //RAM read dalay
					.rst_n					(rd_rst_n),
					.clk					(rd_clk),
					.rd_en					(rd_en),
					.rd_data				(rd_data[]),
					.rd_data_val			(rd_data_val),
					.prog_full_assert_cfg	(sync_prog_full_assert_cfg[SYNC_ADDR_WIDTH:0]),
			 		.prog_full_negate_cfg	(sync_prog_full_negate_cfg[SYNC_ADDR_WIDTH:0]),
					.\(.*\)					(sync_\1[]),
);*/
fwft_fifo_wrapper #(/*AUTOINSTPARAM*/
		    // Parameters
		    .FLIPFLOP		(SYNC_FLIPFLOP				), // Templated
		    .ADDR_WIDTH		(SYNC_ADDR_WIDTH			), // Templated
		    .DATA_WIDTH		(DATA_WIDTH					), // Templated
		    .PROG_EMPTY_ASSERT	(SYNC_PROG_EMPTY_ASSERT		), // Templated
		    .PROG_EMPTY_NEGATE	(SYNC_PROG_EMPTY_NEGATE		), // Templated
		    .FIFO_DEEP		(SYNC_FIFO_DEEP				), // Templated
		    .RAM_PIPE_STAGE	(SYNC_RAM_PIPE_STAGE		)) // Templated
u_sync_fwft_fifo_wrapper(/*AUTOINST*/
			 // Outputs
			 .rd_data		(rd_data[(DATA_WIDTH-1):0]), // Templated
			 .rd_data_val		(rd_data_val),	 // Templated
			 .single_err		(sync_single_err), // Templated
			 .double_err		(sync_double_err), // Templated
			 .ovf_int		(sync_ovf_int),	 // Templated
			 .udf_int		(sync_udf_int),	 // Templated
			 .prog_full		(sync_prog_full), // Templated
			 .empty			(sync_empty),	 // Templated
			 .full			(sync_full),	 // Templated
			 // Inputs
			 .reg_dft_tpram_config( reg_dft_tpram_config  ),
			 .clk			(rd_clk),	 // Templated
			 .rst_n			(rd_rst_n),	 // Templated
			 .ram_bypass		(sync_ram_bypass), // Templated
			 .prog_full_assert_cfg	(sync_prog_full_assert_cfg[SYNC_ADDR_WIDTH:0]), // Templated
			 .prog_full_negate_cfg	(sync_prog_full_negate_cfg[SYNC_ADDR_WIDTH:0]), // Templated
			 .wr_data		(sync_wr_data[(DATA_WIDTH-1):0]), // Templated
			 .wr_en			(sync_wr_en),	 // Templated
			 .rd_en			(rd_en));	 // Templated	 // Templated	 // Templated	 // Templated	 // Templated)	 // Templated)

endmodule

//Local Variables :
//verilog-auto-inst-param-value : t
//verilog-library-files:()
//verilog-library-extensions :(".v"".vh"". sv"".svh")
//End:
