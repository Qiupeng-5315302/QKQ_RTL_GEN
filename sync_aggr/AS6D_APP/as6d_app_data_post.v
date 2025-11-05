
`include "as6d_app_all_includes.vh"
module as6d_app_data_post #(
	parameter	VIDEO_DATA_SIZE		= 136
)(
	aggre_clk			,
	aggre_clk_rst_n		,
	in_video_data_vld	,
	in_video_data		,
	master_pipe			,
	aggre_mode			,
	pipe0_concat_en		,
	pipe1_concat_en		,
	pipe2_concat_en		,
	pipe3_concat_en		,
	pipe0_aggre_en		,
	pipe1_aggre_en		,
	pipe2_aggre_en		,
	pipe3_aggre_en		,
	fse_filter			,
	out_video_data_vld	,
	out_video_data		


);
input							aggre_clk			;
input							aggre_clk_rst_n		;
input							fse_filter			;
input							in_video_data_vld	;
input	[VIDEO_DATA_SIZE-1:0]	in_video_data		;
input	[1:0]					master_pipe			;
input	[1:0]					aggre_mode			;
input							pipe0_concat_en		;
input							pipe1_concat_en		;
input							pipe2_concat_en		;
input							pipe3_concat_en		;
input							pipe0_aggre_en		;
input							pipe1_aggre_en		;
input							pipe2_aggre_en		;
input							pipe3_aggre_en		;
output							out_video_data_vld	;
output	[VIDEO_DATA_SIZE-1:0]	out_video_data		;

app_header	idi_app_header	;
app_data    idi_app_data	;

reg	[VIDEO_DATA_SIZE-1:0]	video_data		;
reg							video_data_vld	;
integer i ;

assign idi_app_header.data_flag			= video_data[135];
assign idi_app_header.short_flag		= video_data[134];
assign idi_app_header.footer_flag		= video_data[133];
assign idi_app_header.header_flag		= video_data[132];
assign idi_app_header.rsv				= video_data[131:48];
assign idi_app_header.parity			= video_data[47:27];
assign idi_app_header.word_count		= video_data[26:11];
assign idi_app_header.data_type			= video_data[10:5];
assign idi_app_header.virtual_channel	= video_data[4:0];
                                                
assign idi_app_data.data_flag			= video_data[135];
assign idi_app_data.short_flag			= video_data[134];
assign idi_app_data.footer_flag			= video_data[133];
assign idi_app_data.header_flag			= video_data[132];
assign idi_app_data.byte_en				= video_data[131:128];
assign idi_app_data.csi_data			= video_data[127:0];

wire		sp_fs		;
wire		sp_fe		;
wire		sp_ls		;
wire		sp_le		;
assign	sp_fs = (idi_app_header.short_flag) && (idi_app_header.data_type==`CSI_FRAME_START);
assign	sp_fe = (idi_app_header.short_flag) && (idi_app_header.data_type==`CSI_FRAME_END);
assign	sp_ls = (idi_app_header.short_flag) && (idi_app_header.data_type==`CSI_LINE_START);
assign	sp_le = (idi_app_header.short_flag) && (idi_app_header.data_type==`CSI_LINE_END);

reg	[2:0] order_group [3:0];
always@(*)begin
	order_group[0] = {pipe0_concat_en,2'd0};
	order_group[1] = {pipe1_concat_en,2'd1};
	order_group[2] = {pipe2_concat_en,2'd2};
	order_group[3] = {pipe3_concat_en,2'd3};
end

reg [2:0] order_group_sf[3:0];
always@(*)begin
	case(master_pipe)
	2'd0:begin
		order_group_sf[0] = order_group[0];
		order_group_sf[1] = order_group[1];
		order_group_sf[2] = order_group[2];
		order_group_sf[3] = order_group[3];
	end
	2'd1:begin
		order_group_sf[0] = order_group[1];
		order_group_sf[1] = order_group[2];
		order_group_sf[2] = order_group[3];
		order_group_sf[3] = order_group[0];
	end
	2'd2:begin
		order_group_sf[0] = order_group[2];
		order_group_sf[1] = order_group[3];
		order_group_sf[2] = order_group[0];
		order_group_sf[3] = order_group[1];
	end
	2'd3:begin
		order_group_sf[0] = order_group[3];
		order_group_sf[1] = order_group[0];
		order_group_sf[2] = order_group[1];
		order_group_sf[3] = order_group[2];
	end
	endcase
end

wire [3:0] vld_group;
assign vld_group = {order_group_sf[3][2],order_group_sf[2][2],order_group_sf[1][2],order_group_sf[0][2]};

reg	[1:0]	vld_index			;
reg			flag				;
always@(*)begin
	vld_index = 2'd0	;
	flag = 1'd0			;
	for(i=3;(~flag)&(i>=0);i=i-1)begin: vld_index_bk
		if(vld_group[i])begin
			flag		= 1'd1	;
			vld_index	= i		;
		end
	end
end
wire [1:0] last_pipe ;
assign	last_pipe =	order_group_sf[vld_index][1:0];


wire							out_video_data_vld	;
wire	[VIDEO_DATA_SIZE-1:0]	out_video_data		;

reg								video_data_vld_d1	;
reg		[VIDEO_DATA_SIZE-1:0]	video_data_d1		;

assign	out_video_data_vld	=	video_data_vld_d1	;
assign	out_video_data		=	video_data_d1;
								
								
assign	video_data_vld		=	in_video_data_vld	;
assign	video_data			=	in_video_data		;	
								
								

//wire	pipe0_en;
//wire	pipe1_en;
//wire	pipe2_en;
//wire	pipe3_en;
//assign	pipe0_en	=	(aggre_mode==1) ? pipe0_concat_en : (aggre_mode==2) ? pipe0_aggre_en : 1'd0 ;
//assign	pipe1_en	=	(aggre_mode==1) ? pipe1_concat_en : (aggre_mode==2) ? pipe1_aggre_en : 1'd0 ;
//assign	pipe2_en	=	(aggre_mode==1) ? pipe2_concat_en : (aggre_mode==2) ? pipe2_aggre_en : 1'd0 ;
//assign	pipe3_en	=	(aggre_mode==1) ? pipe3_concat_en : (aggre_mode==2) ? pipe3_aggre_en : 1'd0 ;

//wire [3:0]	video_data_vld_en;
//assign video_data_vld_en = {in_video_data_vld3&pipe3_en,
//							in_video_data_vld2&pipe2_en,
//							in_video_data_vld1&pipe1_en,
//							in_video_data_vld0&pipe0_en};

//always@(*)begin
//	video_data_vld	= |video_data_vld_en;
//end
//
//always@(*)begin
//	case(video_data_vld_en)
//	4'd1:video_data		= in_video_data0; 
//	4'd2:video_data		= in_video_data1;
//	4'd4:video_data		= in_video_data2;
//	4'd8:video_data		= in_video_data3;
//	default:video_data	= {VIDEO_DATA_SIZE{1'd0}};
//	endcase
//end

wire [1:0] pipe_concat_num;
wire [2:0] pipe_concat_num_pre;
assign pipe_concat_num_pre = (pipe3_concat_en + pipe2_concat_en + pipe1_concat_en + pipe0_concat_en)	;
assign pipe_concat_num = pipe_concat_num_pre - 1'd1 ;



reg	[1:0]	fs_cnt;
reg [1:0]	fe_cnt;
always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
	if(~aggre_clk_rst_n)
		fs_cnt <=	2'd0	;
	else if(video_data_vld & (idi_app_header.data_type == `CSI_FRAME_START) & (idi_app_header.short_flag))
		fs_cnt <=	(fs_cnt == pipe_concat_num) ? 2'd0 : fs_cnt + 1'd1	;
end

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
	if(~aggre_clk_rst_n)
		fe_cnt <=	2'd0	;
	else if(video_data_vld & (idi_app_header.data_type == `CSI_FRAME_END) & (idi_app_header.short_flag))
		fe_cnt <=	(fe_cnt == pipe_concat_num) ? 2'd0 : fe_cnt + 1'd1	;
end

wire fs_trans_en = ~(|fs_cnt)	;
wire fe_trans_en = (fe_cnt == pipe_concat_num) ;

always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
	if(~aggre_clk_rst_n)begin
		video_data_vld_d1	<=	1'd0	;
	end
	else if(video_data_vld & sp_fs & fse_filter)begin
		video_data_vld_d1 <= fs_trans_en ? 1'd1 : 1'd0	;
	end
	else if(video_data_vld & sp_fe & fse_filter)begin
		video_data_vld_d1 <= fe_trans_en ? 1'd1 : 1'd0	;
	end
	else if(video_data_vld)begin
		video_data_vld_d1 <= 1'd1	;
	end
	else begin
		video_data_vld_d1 <= 1'd0	;
	end
end


always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
	if(~aggre_clk_rst_n)begin
		video_data_d1	<= 	{VIDEO_DATA_SIZE{1'd0}};
	end
	else if(video_data_vld & sp_fs & fse_filter)begin
		video_data_d1	<= 	fs_trans_en ? video_data : {VIDEO_DATA_SIZE{1'd0}};
	end
	else if(video_data_vld & sp_fe & fse_filter)begin
		video_data_d1	<= 	fe_trans_en ? video_data : {VIDEO_DATA_SIZE{1'd0}};
	end
	else if(video_data_vld)begin
		video_data_d1	<= 	video_data;
	end
end

endmodule
