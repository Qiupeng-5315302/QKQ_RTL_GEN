
module as6d_app_fifo_rdclk_sel#(
	parameter	PIPE_SN = 2'd0
)(
	input	[15:0]	reg_app_sch0,
	input	[15:0]	reg_app_sch1,
	input	[15:0]	reg_app_sch2,
	input	[15:0]	reg_app_sch3,
	output	[1:0]	fifo_rdclk_sel
);
assign	fifo_rdclk_sel =	((reg_app_sch0[10]&reg_app_sch0[PIPE_SN])|(reg_app_sch0[11]&reg_app_sch0[PIPE_SN]))?2'd0:	
							((reg_app_sch1[10]&reg_app_sch1[PIPE_SN])|(reg_app_sch1[11]&reg_app_sch1[PIPE_SN]))?2'd1:	
							((reg_app_sch2[10]&reg_app_sch2[PIPE_SN])|(reg_app_sch2[11]&reg_app_sch2[PIPE_SN]))?2'd2:	
							((reg_app_sch3[10]&reg_app_sch3[PIPE_SN])|(reg_app_sch3[11]&reg_app_sch3[PIPE_SN]))?2'd3:	
							PIPE_SN;

endmodule
