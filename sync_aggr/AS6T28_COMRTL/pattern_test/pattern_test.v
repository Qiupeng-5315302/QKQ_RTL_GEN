
module pattern_test(/*AUTOARG*/
   // Outputs
   reg_rd_vprbs_rx_fail, reg_rd_vprbs_rx_err, reg_rd_vprbs_rx_check,
   idi_gen_word_count, idi_gen_virtual_channel, idi_gen_header_en,
   idi_gen_data_en, idi_gen_byte_en, idi_gen_data, idi_gen_data_type,
   // Inputs
   reg_vprbs_tx_pat_reset, reg_vprbs_tx_order, reg_vprbs_tx_mode,
   reg_vprbs_tx_idi_driver_word_count,
   reg_vprbs_tx_idi_driver_virtual_channel,
   reg_vprbs_tx_idi_driver_total_interval,
   reg_vprbs_tx_idi_driver_pkt_interval,
   reg_vprbs_tx_idi_driver_data_type, reg_vprbs_tx_gen_en,
   reg_vprbs_tx_err_inject_intv_time,
   reg_vprbs_tx_err_inject_intv_num, reg_vprbs_tx_err_inject_en,
   reg_vprbs_rx_uncheck_tolerance, reg_vprbs_rx_order,
   reg_vprbs_rx_mode, reg_vprbs_rx_locked_match_cnt,
   reg_vprbs_rx_lock_continue, reg_vprbs_rx_load,
   reg_vprbs_rx_err_clear, reg_vprbs_rx_chk_en, gen_rst_n, gen_clk,
   chk_rst_n, chk_clk, idi_chk_header_en, idi_chk_data_en,
   idi_chk_byte_en, idi_chk_data_type, idi_chk_data,
   reg_vprbs_loopback
   );
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			chk_clk;		// To u_app_video_prbs_chk of app_video_prbs_chk.v
input			chk_rst_n;		// To u_app_video_prbs_chk of app_video_prbs_chk.v
input			gen_clk;		// To u_idi_pattern_driver of idi_pattern_driver.v, ...
input			gen_rst_n;		// To u_idi_pattern_driver of idi_pattern_driver.v, ...
input			reg_vprbs_rx_chk_en;	// To u_app_video_prbs_chk of app_video_prbs_chk.v
input			reg_vprbs_rx_err_clear;	// To u_app_video_prbs_chk of app_video_prbs_chk.v
input			reg_vprbs_rx_load;	// To u_app_video_prbs_chk of app_video_prbs_chk.v
input			reg_vprbs_rx_lock_continue;// To u_app_video_prbs_chk of app_video_prbs_chk.v
input [3:0]		reg_vprbs_rx_locked_match_cnt;// To u_app_video_prbs_chk of app_video_prbs_chk.v
input [2:0]		reg_vprbs_rx_mode;	// To u_app_video_prbs_chk of app_video_prbs_chk.v
input			reg_vprbs_rx_order;	// To u_app_video_prbs_chk of app_video_prbs_chk.v
input [3:0]		reg_vprbs_rx_uncheck_tolerance;// To u_app_video_prbs_chk of app_video_prbs_chk.v
input			reg_vprbs_tx_err_inject_en;// To u_app_video_prbs_gen of app_video_prbs_gen.v
input [7:0]		reg_vprbs_tx_err_inject_intv_num;// To u_app_video_prbs_gen of app_video_prbs_gen.v
input [7:0]		reg_vprbs_tx_err_inject_intv_time;// To u_app_video_prbs_gen of app_video_prbs_gen.v
input			reg_vprbs_tx_gen_en;	// To u_idi_pattern_driver of idi_pattern_driver.v, ...
input [5:0]		reg_vprbs_tx_idi_driver_data_type;// To u_idi_pattern_driver of idi_pattern_driver.v
input [15:0]		reg_vprbs_tx_idi_driver_pkt_interval;// To u_idi_pattern_driver of idi_pattern_driver.v
input [15:0]		reg_vprbs_tx_idi_driver_total_interval;// To u_idi_pattern_driver of idi_pattern_driver.v
input [3:0]		reg_vprbs_tx_idi_driver_virtual_channel;// To u_idi_pattern_driver of idi_pattern_driver.v
input [15:0]		reg_vprbs_tx_idi_driver_word_count;// To u_idi_pattern_driver of idi_pattern_driver.v
input [2:0]		reg_vprbs_tx_mode;	// To u_app_video_prbs_gen of app_video_prbs_gen.v
input			reg_vprbs_tx_order;	// To u_app_video_prbs_gen of app_video_prbs_gen.v
input			reg_vprbs_tx_pat_reset;	// To u_app_video_prbs_gen of app_video_prbs_gen.v
// End of automatics
input           idi_chk_header_en       ;
input           idi_chk_data_en         ;
input  [ 2:0]    idi_chk_byte_en        ;
input  [ 5:0]    idi_chk_data_type      ;
input  [63:0]    idi_chk_data           ;
input           reg_vprbs_loopback      ;
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [3:0]		idi_gen_virtual_channel;// From u_idi_pattern_driver of idi_pattern_driver.v
output [15:0]		idi_gen_word_count;	// From u_idi_pattern_driver of idi_pattern_driver.v
output			reg_rd_vprbs_rx_check;	// From u_app_video_prbs_chk of app_video_prbs_chk.v
output [31:0]		reg_rd_vprbs_rx_err;	// From u_app_video_prbs_chk of app_video_prbs_chk.v
output			reg_rd_vprbs_rx_fail;	// From u_app_video_prbs_chk of app_video_prbs_chk.v
// End of automatics
output			idi_gen_header_en       ;
output          idi_gen_data_en         ;
output [2:0]    idi_gen_byte_en         ;
output [63:0]   idi_gen_data            ;
output [5:0]    idi_gen_data_type       ;
/***signal define ***/
wire [63:0]     idi_vpg_data            ;
wire [63:0]     idi_prbs_data           ;
wire [63:0]     prbs_data_in            ;
wire [ 2:0]     rx_byte_en              ;
wire            rx_data_en              ;
wire            rx_header_en            ;
wire [ 5:0]     rx_data_type            ;
wire [ 2:0]     idi_byte_en             ;
wire            idi_data_en             ;
wire [63:0]     idi_gen_data            ;

assign  prbs_data_in = reg_vprbs_loopback ?  idi_gen_data      : idi_chk_data       ;
assign  rx_byte_en   = reg_vprbs_loopback ?  idi_gen_byte_en   : idi_chk_byte_en    ;
assign  rx_data_en   = reg_vprbs_loopback ?  idi_gen_data_en   : idi_chk_data_en    ;
assign  rx_data_type = reg_vprbs_loopback ?  idi_gen_data_type : idi_chk_data_type  ;
assign  rx_header_en = reg_vprbs_loopback ?  idi_gen_header_en : idi_chk_header_en  ;
                     
/* app_video_prbs_chk   AUTO_TEMPLATE (
    .clk(chk_clk),
    .rst_n(chk_rst_n),
    .prbs_data_in(prbs_data_in),
    .rx_header_en(rx_header_en  ),
    .rx_data_en(rx_data_en  ),
    .rx_data_type(rx_data_type[]  ),
    .rx_byte_en(rx_byte_en[2:0]  ),
)*/
app_video_prbs_chk #(
                    .DATA_W(64)
) u_app_video_prbs_chk(/*AUTOINST*/
		       // Outputs
		       .reg_rd_vprbs_rx_fail(reg_rd_vprbs_rx_fail),
		       .reg_rd_vprbs_rx_check(reg_rd_vprbs_rx_check),
		       .reg_rd_vprbs_rx_err(reg_rd_vprbs_rx_err[31:0]),
		       // Inputs
		       .clk		(chk_clk),		 // Templated
		       .rst_n		(chk_rst_n),		 // Templated
		       .prbs_data_in	(prbs_data_in),		 // Templated
		       .reg_vprbs_rx_chk_en(reg_vprbs_rx_chk_en),
		       .reg_vprbs_rx_mode(reg_vprbs_rx_mode[2:0]),
		       .reg_vprbs_rx_order(reg_vprbs_rx_order),
		       .reg_vprbs_rx_load(reg_vprbs_rx_load),
		       .reg_vprbs_rx_lock_continue(reg_vprbs_rx_lock_continue),
		       .reg_vprbs_rx_uncheck_tolerance(reg_vprbs_rx_uncheck_tolerance[3:0]),
		       .reg_vprbs_rx_err_clear(reg_vprbs_rx_err_clear),
		       .reg_vprbs_rx_locked_match_cnt(reg_vprbs_rx_locked_match_cnt[3:0]),
		       .rx_byte_en	(rx_byte_en[2:0]  ),	 // Templated
		       .rx_data_en	(rx_data_en  ),		 // Templated
		       .rx_header_en	(rx_header_en  ),	 // Templated
		       .rx_data_type	(rx_data_type[5:0]  ));	 // Templated

/*  idi_pattern_driver    AUTO_TEMPLATE (
    .clk(gen_clk),
    .rst_n(gen_rst_n),
    .idi_header_en	(idi_gen_header_en),
    .idi_data_en	(idi_gen_data_en),
    .idi_byte_en	(idi_gen_byte_en[2:0]),
    .idi_word_count	(idi_gen_word_count[15:0]),
    .idi_virtual_channel(idi_gen_virtual_channel[3:0]),
    .idi_data_type	(idi_gen_data_type[5:0]),
	.reg_idi_driver_enable(reg_vprbs_tx_gen_en),
    .reg_idi_driver_\(.*\)(reg_vprbs_tx_idi_driver_\1[]),

)*/
idi_pattern_driver u_idi_pattern_driver(/*AUTOINST*/
					// Outputs
					.idi_header_en	(idi_gen_header_en), // Templated
					.idi_data_en	(idi_gen_data_en), // Templated
					.idi_byte_en	(idi_gen_byte_en[2:0]), // Templated
					.idi_word_count	(idi_gen_word_count[15:0]), // Templated
					.idi_virtual_channel(idi_gen_virtual_channel[3:0]), // Templated
					.idi_data_type	(idi_gen_data_type[5:0]), // Templated
					// Inputs
					.clk		(gen_clk),	 // Templated
					.rst_n		(gen_rst_n),	 // Templated
					.reg_idi_driver_enable(reg_vprbs_tx_gen_en), // Templated
					.reg_idi_driver_total_interval(reg_vprbs_tx_idi_driver_total_interval[15:0]), // Templated
					.reg_idi_driver_pkt_interval(reg_vprbs_tx_idi_driver_pkt_interval[15:0]), // Templated
					.reg_idi_driver_word_count(reg_vprbs_tx_idi_driver_word_count[15:0]), // Templated
					.reg_idi_driver_virtual_channel(reg_vprbs_tx_idi_driver_virtual_channel[3:0]), // Templated
					.reg_idi_driver_data_type(reg_vprbs_tx_idi_driver_data_type[5:0])); // Templated


/*  app_video_prbs_gen  AUTO_TEMPLATE (
    .clk(gen_clk),
    .rst_n(gen_rst_n),
	.tx_header_en(idi_gen_header_en),
    .tx_data_en(idi_gen_data_en),
    .tx_byte_en(idi_gen_byte_en[]),
	.tx_data_type(idi_gen_data_type[]),
    .prbs_data_out(idi_gen_data[]),
)*/
app_video_prbs_gen u_app_video_prbs_gen(
					.prbs_data_out	(idi_gen_data[63:0]),
					.tx_byte_en	(idi_gen_byte_en[2:0]),
					.tx_data_en	(idi_gen_data_en),
					.tx_header_en	(idi_gen_header_en),
					.tx_data_type	(idi_gen_data_type[5:0]),
                    /*AUTOINST*/
					// Inputs
					.clk		(gen_clk),	 // Templated
					.rst_n		(gen_rst_n),	 // Templated
					.reg_vprbs_tx_gen_en(reg_vprbs_tx_gen_en),
					.reg_vprbs_tx_pat_reset(reg_vprbs_tx_pat_reset),
					.reg_vprbs_tx_mode(reg_vprbs_tx_mode[2:0]),
					.reg_vprbs_tx_order(reg_vprbs_tx_order),
					.reg_vprbs_tx_err_inject_en(reg_vprbs_tx_err_inject_en),
					.reg_vprbs_tx_err_inject_intv_time(reg_vprbs_tx_err_inject_intv_time[7:0]),
					.reg_vprbs_tx_err_inject_intv_num(reg_vprbs_tx_err_inject_intv_num[7:0]));




endmodule
