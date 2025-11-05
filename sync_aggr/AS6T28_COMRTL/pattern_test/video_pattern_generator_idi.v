
module video_pattern_generator_idi(/*AUTOARG*/
   // Outputs
   idi_word_count, idi_byte_en, idi_header_en, idi_data_en, idi_data,
   idi_vc, idi_vcx, idi_dt,
   // Inputs
   vpg_vsa_lines_qst, vpg_vfp_lines_qst, vpg_vcx_qst, vpg_vc_qst,
   vpg_vbp_lines_qst, vpg_vactive_lines_qst, vpg_step_line_num_qst,
   vpg_start_line_num_qst, vpg_pkt_size_qst, vpg_packet_lost_ack,
   vpg_orientation_qst, vpg_mode_qst, vpg_max_frame_num_qst,
   vpg_line_num_mode_qst, vpg_hsync_packet_en_qst, vpg_hsa_time_qst,
   vpg_hline_time_qst, vpg_hbp_time_qst, vpg_frame_num_mode_qst,
   vpg_en, vpg_dt_qst, vpg_bk_lines_qst, rst_n, clk,
   reg_app_vc_turn_over_en, reg_app_vc_turn_over_mode
   );

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			clk;			// To u_video_pattern_generator of video_pattern_generator.v
input			rst_n;			// To u_video_pattern_generator of video_pattern_generator.v
input [9:0]		vpg_bk_lines_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [5:0]		vpg_dt_qst;		// To u_video_pattern_generator of video_pattern_generator.v
input			vpg_en;			// To u_video_pattern_generator of video_pattern_generator.v
input			vpg_frame_num_mode_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [11:0]		vpg_hbp_time_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [14:0]		vpg_hline_time_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [11:0]		vpg_hsa_time_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input			vpg_hsync_packet_en_qst;// To u_video_pattern_generator of video_pattern_generator.v
input [1:0]		vpg_line_num_mode_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [15:0]		vpg_max_frame_num_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input			vpg_mode_qst;		// To u_video_pattern_generator of video_pattern_generator.v
input			vpg_orientation_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input			vpg_packet_lost_ack;	// To u_video_pattern_generator of video_pattern_generator.v
input [13:0]		vpg_pkt_size_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [15:0]		vpg_start_line_num_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [15:0]		vpg_step_line_num_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [13:0]		vpg_vactive_lines_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [9:0]		vpg_vbp_lines_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [1:0]		vpg_vc_qst;		// To u_video_pattern_generator of video_pattern_generator.v
input [2:0]		vpg_vcx_qst;		// To u_video_pattern_generator of video_pattern_generator.v
input [9:0]		vpg_vfp_lines_qst;	// To u_video_pattern_generator of video_pattern_generator.v
input [9:0]		vpg_vsa_lines_qst;	// To u_video_pattern_generator of video_pattern_generator.v
// End of automatics
/*AUTOOUTPUT*/
input           reg_app_vc_turn_over_en;
input           reg_app_vc_turn_over_mode;
/*idi output*/
output    [15:0]        idi_word_count;
output    [2 :0]        idi_byte_en;
output                  idi_header_en;
output                  idi_data_en;
output    [63:0]        idi_data;
output    [1 :0]        idi_vc;
output    [1 :0]        idi_vcx;
output    [5 :0]        idi_dt;

//parameter   CSI2_DEVICE_VPG_BK_LINES_RS         = 10,    
//parameter   CSI2_DEVICE_VPG_DT_RS               =  6,
//parameter   CSI2_DEVICE_VPG_FRAME_NUM_MODE_RS   =  1,
//parameter   CSI2_DEVICE_VPG_HBP_TIME_RS         = 12,
//parameter   CSI2_DEVICE_VPG_HLINE_TIME_RS       = 15,
//parameter   CSI2_DEVICE_VPG_HSA_TIME_RS         = 12,
//parameter   CSI2_DEVICE_VPG_LINE_NUM_MODE_RS    =  2,
//parameter   CSI2_DEVICE_VPG_MAX_FRAME_NUM_RS    = 16,
//parameter   CSI2_DEVICE_VPG_PKT_SIZE_RS         = 14,
//parameter   CSI2_DEVICE_VPG_START_LINE_NUM_RS   = 16,
//parameter   CSI2_DEVICE_VPG_STEP_LINE_NUM_RS    = 16,
//parameter   CSI2_DEVICE_VPG_ACT_LINES_RS        = 14,
//parameter   CSI2_DEVICE_VPG_VBP_LINES_RS        = 10,
//parameter   CSI2_DEVICE_VPG_VC_RS               =  2,
//parameter   CSI2_DEVICE_VCX_DWIDTH              =  3,
//parameter   CSI2_DEVICE_VPG_VFP_LINES_RS        = 10,
//parameter   CSI2_DEVICE_VPG_VSA_LINES_RS        = 10,
//parameter   CSI2_DEVICE_HD_WIDTH                = 27,
//parameter   CSI2_DEVICE_NAP_PLD_WIDTH           = 64

reg                                     short_packet_cnt        ;
reg  [15:0]                             word_count              ;
reg  [15:0]                             idi_word_count          ;
reg   [2:0]                             idi_byte_en             ;
reg                                     idi_header_en           ;
reg                                     idi_data_en             ;
reg  [63:0]                             idi_data            ;
wire  [9:0]                             idi_vcdt                ;
wire  [1:0]                             idi_vc                  ;
wire  [1:0]                             idi_vcx                 ;
wire  [5:0]                             idi_dt                  ;
wire                                    vpg_header_gen_en       ;
wire                                    vpg_payload_gen_en      ;
wire                                    vpg_active              ;
wire                                    vpg_packet_lost         ;
wire                                    vpg_packet_req          ;
wire[27-1:0]                            vpg_header              ;
wire[64-1:0]                            vpg_payload             ;
wire                                    vpg_elastbuf_emptyz     ;
reg    [9:0]                            idi_vcdt_lock           ;
reg                                     idi_vcdt_lock_vld       ;
reg [1:0]                               vc_turn_over            ;
wire[1:0]                               vpg_vc                  ;
wire[1:0]                               turn_over_max           ;
wire[63:0]                              idi_prbs_data           ;
wire[63:0]                              idi_data                ;

assign    vpg_payload_gen_en            = 1'd1        ;

/*  video_pattern_generator  AUTO_TEMPLATE (
        .vpg_vc_qst        (vpg_vc_qst[2-1:0]),
        .vpg_vcx_qst        (vpg_vcx_qst[3-1:0]),
        .vpg_dt_qst        (vpg_dt_qst[6-1:0]),
        .vpg_pkt_size_qst    (vpg_pkt_size_qst[14-1:0]),
        .vpg_hsa_time_qst    (vpg_hsa_time_qst[12-1:0]),
        .vpg_hbp_time_qst    (vpg_hbp_time_qst[12-1:0]),
        .vpg_hline_time_qst    (vpg_hline_time_qst[15-1:0]),
        .vpg_vsa_lines_qst    (vpg_vsa_lines_qst[10-1:0]),
        .vpg_vbp_lines_qst    (vpg_vbp_lines_qst[10-1:0]),
        .vpg_vfp_lines_qst    (vpg_vfp_lines_qst[10-1:0]),
        .vpg_vactive_lines_qst(vpg_vactive_lines_qst[14-1:0]),
        .vpg_bk_lines_qst    (vpg_bk_lines_qst[10-1:0]),
        .vpg_frame_num_mode_qst(vpg_frame_num_mode_qst),
        .vpg_max_frame_num_qst(vpg_max_frame_num_qst[16-1:0]),
        .vpg_line_num_mode_qst(vpg_line_num_mode_qst[2-1:0]),
        .vpg_start_line_num_qst(vpg_start_line_num_qst[16-1:0]),
        .vpg_step_line_num_qst(vpg_step_line_num_qst[16-1:0]),
        .ppi_clk                         (clk),
        .ppi_clkrstz                     (rst_n),
        .\(.*\)                             (\1[]),
)*/
video_pattern_generator#(/*AUTOINSTPARAM*/)
u_video_pattern_generator(
                .vpg_active            (vpg_active),
                .vpg_packet_lost        (vpg_packet_lost),
                .vpg_packet_req        (vpg_packet_req),
                .vpg_header            (vpg_header[27-1:0]),
                .vpg_payload            (vpg_payload[64-1:0]),
                .vpg_elastbuf_emptyz    (vpg_elastbuf_emptyz),
                .vpg_header_gen_en    (vpg_header_gen_en),
                .vpg_payload_gen_en    (vpg_payload_gen_en),
                /*AUTOINST*/
			  // Inputs
			  .ppi_clk		(clk),		 // Templated
			  .ppi_clkrstz		(rst_n),	 // Templated
			  .vpg_en		(vpg_en),	 // Templated
			  .vpg_packet_lost_ack	(vpg_packet_lost_ack), // Templated
			  .vpg_orientation_qst	(vpg_orientation_qst), // Templated
			  .vpg_mode_qst		(vpg_mode_qst),	 // Templated
			  .vpg_hsync_packet_en_qst(vpg_hsync_packet_en_qst), // Templated
			  .vpg_vc_qst		(vpg_vc_qst[2-1:0]), // Templated
			  .vpg_vcx_qst		(vpg_vcx_qst[3-1:0]), // Templated
			  .vpg_dt_qst		(vpg_dt_qst[6-1:0]), // Templated
			  .vpg_pkt_size_qst	(vpg_pkt_size_qst[14-1:0]), // Templated
			  .vpg_hsa_time_qst	(vpg_hsa_time_qst[12-1:0]), // Templated
			  .vpg_hbp_time_qst	(vpg_hbp_time_qst[12-1:0]), // Templated
			  .vpg_hline_time_qst	(vpg_hline_time_qst[15-1:0]), // Templated
			  .vpg_vsa_lines_qst	(vpg_vsa_lines_qst[10-1:0]), // Templated
			  .vpg_vbp_lines_qst	(vpg_vbp_lines_qst[10-1:0]), // Templated
			  .vpg_vfp_lines_qst	(vpg_vfp_lines_qst[10-1:0]), // Templated
			  .vpg_vactive_lines_qst(vpg_vactive_lines_qst[14-1:0]), // Templated
			  .vpg_bk_lines_qst	(vpg_bk_lines_qst[10-1:0]), // Templated
			  .vpg_frame_num_mode_qst(vpg_frame_num_mode_qst), // Templated
			  .vpg_max_frame_num_qst(vpg_max_frame_num_qst[16-1:0]), // Templated
			  .vpg_line_num_mode_qst(vpg_line_num_mode_qst[2-1:0]), // Templated
			  .vpg_start_line_num_qst(vpg_start_line_num_qst[16-1:0]), // Templated
			  .vpg_step_line_num_qst(vpg_step_line_num_qst[16-1:0])); // Templated

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        short_packet_cnt <= 1'd0;
    else if((vpg_header[5:2]==4'd0)&vpg_packet_req)
        short_packet_cnt <= short_packet_cnt ? 1'd0  : 1'd1;
    else 
        short_packet_cnt <= short_packet_cnt ? 1'd0 : short_packet_cnt;
end

assign    vpg_header_gen_en = ~short_packet_cnt & vpg_packet_req;

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        word_count <= 16'd0;
    else if((vpg_header[5:2]!=4'd0)&vpg_packet_req)
        word_count <= vpg_header[23:8];
    else if(|word_count[15:3])
        word_count[15:3] <= word_count[15:3]-1'd1;
    else if((|word_count[2:0])& (~|word_count[15:3]))
        word_count <= 16'd0;
end

always@(*)begin
    if(|word_count[15:3])
        idi_byte_en = 3'b111;
    else if((|word_count[2:0])& (~|word_count[15:3]))
        idi_byte_en = word_count[2:0] - 1'd1;
    else
        idi_byte_en = 3'd0;
end

always@(*)begin
    if(vpg_header_gen_en)
        idi_header_en = 1'd1;
    else if(|word_count)
        idi_header_en = 1'd1;
    else
        idi_header_en = 1'd0;
end

always@(*)begin
    if(|word_count)
        idi_data_en = 1'd1;
    else
        idi_data_en = 1'd0;
end

always@(*)begin
    if(idi_data_en)
        idi_data = vpg_payload;
    else
        idi_data = 64'd0    ;
end

assign    idi_vcdt = vpg_packet_req ? {vpg_header[25:24],vpg_vc,vpg_header[5:0]} :
                idi_vcdt_lock_vld ? idi_vcdt_lock :
                8'd0;

assign {idi_vcx,idi_vc,idi_dt} = idi_vcdt;

assign idi_word_count = vpg_header[23:8];


assign turn_over_max = reg_app_vc_turn_over_mode? 2'b01 : 2'b11 ;

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        idi_vcdt_lock      <= 10'd0;
        idi_vcdt_lock_vld <= 1'd0;
    end
    else if((vpg_packet_req)&&(vpg_header[5:2] != 4'd0))begin
        idi_vcdt_lock      <= {vpg_header[25:24],vpg_vc,vpg_header[5:0]};
        idi_vcdt_lock_vld <= 1'd1;
    end
    else if(word_count<=8)begin
        idi_vcdt_lock      <= 10'd0;
        idi_vcdt_lock_vld <= 1'd0;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        vc_turn_over <= 2'd0;
    else if(idi_header_en&(idi_dt==2'b11))
        vc_turn_over <= (vc_turn_over == turn_over_max) ? 2'b00 : vc_turn_over+1'd1;
end


assign vpg_vc = reg_app_vc_turn_over_en ? vc_turn_over : vpg_header[7:6] ;

endmodule
// Local Variables:
// verilog-auto-inst-param-value:t
// End:
