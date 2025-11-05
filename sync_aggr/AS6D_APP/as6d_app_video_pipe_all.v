
`include "as6d_app_all_includes.vh"
//`include "as6d_mep_all_includes.vh"
module   as6d_app_video_pipe_all #(
	parameter	VIDEO_DATA_SIZE		= 136,
	parameter	DATA_PARITY_WIDTH	= 21
)(/*AUTOARG*/
   // Outputs
   video_data_vld7, video_data_vld6, video_data_vld5, video_data_vld4,
   video_data_vld3, video_data_vld2, video_data_vld1, video_data_vld0,
   video_data_storage_fifo_full7, video_data_storage_fifo_full6,
   video_data_storage_fifo_full5, video_data_storage_fifo_full4,
   video_data_storage_fifo_full3, video_data_storage_fifo_full2,
   video_data_storage_fifo_full1, video_data_storage_fifo_full0,
   video_data_storage_fifo_empty7, video_data_storage_fifo_empty6,
   video_data_storage_fifo_empty5, video_data_storage_fifo_empty4,
   video_data_storage_fifo_empty3, video_data_storage_fifo_empty2,
   video_data_storage_fifo_empty1, video_data_storage_fifo_empty0,
   video_data_storage_fifo_amty7, video_data_storage_fifo_amty6,
   video_data_storage_fifo_amty5, video_data_storage_fifo_amty4,
   video_data_storage_fifo_amty3, video_data_storage_fifo_amty2,
   video_data_storage_fifo_amty1, video_data_storage_fifo_amty0,
   video_data_storage_fifo_aful7, video_data_storage_fifo_aful6,
   video_data_storage_fifo_aful5, video_data_storage_fifo_aful4,
   video_data_storage_fifo_aful3, video_data_storage_fifo_aful2,
   video_data_storage_fifo_aful1, video_data_storage_fifo_aful0,
   video_data7, video_data6, video_data5, video_data4, video_data3,
   video_data2, video_data1, video_data0, line_end7, line_end6,
   line_end5, line_end4, line_end3, line_end2, line_end1, line_end0,
   ack7, ack6, ack5, ack4, ack3, ack2, ack1, ack0,
   // Inputs
   up_state7, up_state6, up_state5, up_state4, up_state3, up_state2,
   up_state1, up_state0, superframe, pipe7_word_count,
   pipe7_virtual_channel_x, pipe7_virtual_channel, pipe7_header_en,
   pipe7_data_type, pipe7_data_en, pipe7_csi_data, pipe7_byte_en,
   pipe6_word_count, pipe6_virtual_channel_x, pipe6_virtual_channel,
   pipe6_header_en, pipe6_data_type, pipe6_data_en, pipe6_csi_data,
   pipe6_byte_en, pipe5_word_count, pipe5_virtual_channel_x,
   pipe5_virtual_channel, pipe5_header_en, pipe5_data_type,
   pipe5_data_en, pipe5_csi_data, pipe5_byte_en, pipe4_word_count,
   pipe4_virtual_channel_x, pipe4_virtual_channel, pipe4_header_en,
   pipe4_data_type, pipe4_data_en, pipe4_csi_data, pipe4_byte_en,
   fifo_wrclk_rst_n7, fifo_wrclk_rst_n6, fifo_wrclk_rst_n5,
   fifo_wrclk_rst_n4, fifo_wrclk_rst_n3, fifo_wrclk_rst_n2,
   fifo_wrclk_rst_n1, fifo_wrclk_rst_n0, fifo_wrclk7, fifo_wrclk6,
   fifo_wrclk5, fifo_wrclk4, fifo_wrclk3, fifo_wrclk2, fifo_wrclk1,
   fifo_wrclk0, fifo_rdclk_rst_n7, fifo_rdclk_rst_n6,
   fifo_rdclk_rst_n5, fifo_rdclk_rst_n4, fifo_rdclk_rst_n3,
   fifo_rdclk_rst_n2, fifo_rdclk_rst_n1, fifo_rdclk_rst_n0,
   fifo_rdclk7, fifo_rdclk6, fifo_rdclk5, fifo_rdclk4, fifo_rdclk3,
   fifo_rdclk2, fifo_rdclk1, fifo_rdclk0, reg_app_sch0, reg_app_sch1,
   reg_app_sch2, reg_app_sch3
   );


/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			fifo_rdclk0;		// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk1;		// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk2;		// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk3;		// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk4;		// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk5;		// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk6;		// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk7;		// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n0;	// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n1;	// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n2;	// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n3;	// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n4;	// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n5;	// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n6;	// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_rdclk_rst_n7;	// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk0;		// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk1;		// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk2;		// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk3;		// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk4;		// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk5;		// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk6;		// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk7;		// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n0;	// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n1;	// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n2;	// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n3;	// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n4;	// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n5;	// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n6;	// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input			fifo_wrclk_rst_n7;	// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe4_byte_en;// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe4_csi_data;// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe4_data_en;		// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		pipe4_data_type;	// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe4_header_en;	// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input [1:0]		pipe4_virtual_channel;	// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe4_virtual_channel_x;// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input [15:0]		pipe4_word_count;	// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe5_byte_en;// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe5_csi_data;// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe5_data_en;		// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		pipe5_data_type;	// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe5_header_en;	// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input [1:0]		pipe5_virtual_channel;	// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe5_virtual_channel_x;// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input [15:0]		pipe5_word_count;	// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe6_byte_en;// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe6_csi_data;// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe6_data_en;		// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		pipe6_data_type;	// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe6_header_en;	// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input [1:0]		pipe6_virtual_channel;	// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe6_virtual_channel_x;// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input [15:0]		pipe6_word_count;	// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe7_byte_en;// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe7_csi_data;// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe7_data_en;		// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input [5:0]		pipe7_data_type;	// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input			pipe7_header_en;	// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input [1:0]		pipe7_virtual_channel;	// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe7_virtual_channel_x;// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input [15:0]		pipe7_word_count;	// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
input			superframe;		// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v, ...
input			up_state0;		// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
input			up_state1;		// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
input			up_state2;		// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
input			up_state3;		// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
input			up_state4;		// To u4_as6d_app_video_pipe of as6d_app_video_pipe.v
input			up_state5;		// To u5_as6d_app_video_pipe of as6d_app_video_pipe.v
input			up_state6;		// To u6_as6d_app_video_pipe of as6d_app_video_pipe.v
input			up_state7;		// To u7_as6d_app_video_pipe of as6d_app_video_pipe.v
// End of automatics
input [15:0]	reg_app_sch0						;
input [15:0]	reg_app_sch1						;
input [15:0]	reg_app_sch2						;
input [15:0]	reg_app_sch3						;

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			ack0;			// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output			ack1;			// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output			ack2;			// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output			ack3;			// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output			ack4;			// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output			ack5;			// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output			ack6;			// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output			ack7;			// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end0;		// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end1;		// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end2;		// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end3;		// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end4;		// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end5;		// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end6;		// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output			line_end7;		// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data0;	// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data1;	// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data2;	// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data3;	// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data4;	// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data5;	// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data6;	// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output [(VIDEO_DATA_SIZE-1):0] video_data7;	// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful0;// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful1;// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful2;// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful3;// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful4;// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful5;// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful6;// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_aful7;// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty0;// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty1;// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty2;// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty3;// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty4;// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty5;// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty6;// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_amty7;// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty0;// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty1;// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty2;// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty3;// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty4;// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty5;// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty6;// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_empty7;// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full0;// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full1;// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full2;// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full3;// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full4;// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full5;// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full6;// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_storage_fifo_full7;// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld0;	// From u0_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld1;	// From u1_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld2;	// From u2_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld3;	// From u3_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld4;	// From u4_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld5;	// From u5_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld6;	// From u6_as6d_app_video_pipe of as6d_app_video_pipe.v
output			video_data_vld7;	// From u7_as6d_app_video_pipe of as6d_app_video_pipe.v
// End of automatics



/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)


wire [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe0_byte_en;// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe0_csi_data;// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe0_data_en;		// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		pipe0_data_type;	// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe0_header_en;	// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [1:0]		pipe0_virtual_channel;	// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe0_virtual_channel_x;// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [15:0]		pipe0_word_count;	// To u0_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe1_byte_en;// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe1_csi_data;// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe1_data_en;		// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		pipe1_data_type;	// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe1_header_en;	// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [1:0]		pipe1_virtual_channel;	// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe1_virtual_channel_x;// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [15:0]		pipe1_word_count;	// To u1_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe2_byte_en;// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe2_csi_data;// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2_data_en;		// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		pipe2_data_type;	// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe2_header_en;	// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [1:0]		pipe2_virtual_channel;	// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe2_virtual_channel_x;// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [15:0]		pipe2_word_count;	// To u2_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] pipe3_byte_en;// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0] pipe3_csi_data;// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe3_data_en;		// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [5:0]		pipe3_data_type;	// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
wire			pipe3_header_en;	// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [1:0]		pipe3_virtual_channel;	// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [(`CSI2_DEVICE_VCX_DWIDTH-1):0] pipe3_virtual_channel_x;// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v
wire [15:0]		pipe3_word_count;	// To u3_as6d_app_video_pipe of as6d_app_video_pipe.v





 /*  as6d_app_video_pipe  AUTO_TEMPLATE (
            .superframe	(superframe[]),
			.csi_data							(pipe@_csi_data[]),
			.bytes_en							(pipe@_byte_en[]),
			.header_en							(pipe@_header_en),
			.data_en							(pipe@_data_en),
			.data_type							(pipe@_data_type[]),
			.virtual_channel					(pipe@_virtual_channel[]),
			.virtual_channel_x					(pipe@_virtual_channel_x[]),
			.word_count							(pipe@_word_count[]),
            .\(.*\)   (\1@[]),

 ) */



as6d_app_video_pipe    u0_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full0), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful0), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty0), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty0), // Templated
					      .video_data_vld	(video_data_vld0), // Templated
					      .video_data	(video_data0[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack0),		 // Templated
					      .line_end		(line_end0),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk0),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n0), // Templated
					      .csi_data		(pipe0_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe0_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe0_header_en), // Templated
					      .data_en		(pipe0_data_en), // Templated
					      .data_type	(pipe0_data_type[5:0]), // Templated
					      .virtual_channel	(pipe0_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe0_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe0_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk0),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n0), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state0));	 // Templated


as6d_app_video_pipe    u1_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full1), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful1), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty1), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty1), // Templated
					      .video_data_vld	(video_data_vld1), // Templated
					      .video_data	(video_data1[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack1),		 // Templated
					      .line_end		(line_end1),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk1),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n1), // Templated
					      .csi_data		(pipe1_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe1_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe1_header_en), // Templated
					      .data_en		(pipe1_data_en), // Templated
					      .data_type	(pipe1_data_type[5:0]), // Templated
					      .virtual_channel	(pipe1_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe1_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe1_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk1),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n1), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state1));	 // Templated


as6d_app_video_pipe    u2_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full2), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful2), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty2), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty2), // Templated
					      .video_data_vld	(video_data_vld2), // Templated
					      .video_data	(video_data2[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack2),		 // Templated
					      .line_end		(line_end2),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk2),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n2), // Templated
					      .csi_data		(pipe2_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe2_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe2_header_en), // Templated
					      .data_en		(pipe2_data_en), // Templated
					      .data_type	(pipe2_data_type[5:0]), // Templated
					      .virtual_channel	(pipe2_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe2_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe2_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk2),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n2), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state2));	 // Templated


as6d_app_video_pipe    u3_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full3), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful3), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty3), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty3), // Templated
					      .video_data_vld	(video_data_vld3), // Templated
					      .video_data	(video_data3[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack3),		 // Templated
					      .line_end		(line_end3),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk3),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n3), // Templated
					      .csi_data		(pipe3_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe3_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe3_header_en), // Templated
					      .data_en		(pipe3_data_en), // Templated
					      .data_type	(pipe3_data_type[5:0]), // Templated
					      .virtual_channel	(pipe3_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe3_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe3_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk3),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n3), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state3));	 // Templated

as6d_app_video_pipe    u4_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full4), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful4), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty4), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty4), // Templated
					      .video_data_vld	(video_data_vld4), // Templated
					      .video_data	(video_data4[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack4),		 // Templated
					      .line_end		(line_end4),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk4),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n4), // Templated
					      .csi_data		(pipe4_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe4_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe4_header_en), // Templated
					      .data_en		(pipe4_data_en), // Templated
					      .data_type	(pipe4_data_type[5:0]), // Templated
					      .virtual_channel	(pipe4_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe4_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe4_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk4),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n4), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state4));	 // Templated

as6d_app_video_pipe    u5_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full5), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful5), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty5), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty5), // Templated
					      .video_data_vld	(video_data_vld5), // Templated
					      .video_data	(video_data5[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack5),		 // Templated
					      .line_end		(line_end5),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk5),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n5), // Templated
					      .csi_data		(pipe5_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe5_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe5_header_en), // Templated
					      .data_en		(pipe5_data_en), // Templated
					      .data_type	(pipe5_data_type[5:0]), // Templated
					      .virtual_channel	(pipe5_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe5_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe5_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk5),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n5), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state5));	 // Templated

as6d_app_video_pipe    u6_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full6), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful6), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty6), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty6), // Templated
					      .video_data_vld	(video_data_vld6), // Templated
					      .video_data	(video_data6[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack6),		 // Templated
					      .line_end		(line_end6),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk6),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n6), // Templated
					      .csi_data		(pipe6_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe6_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe6_header_en), // Templated
					      .data_en		(pipe6_data_en), // Templated
					      .data_type	(pipe6_data_type[5:0]), // Templated
					      .virtual_channel	(pipe6_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe6_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe6_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk6),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n6), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state6));	 // Templated


as6d_app_video_pipe    u7_as6d_app_video_pipe(/*AUTOINST*/
					      // Outputs
					      .video_data_storage_fifo_full(video_data_storage_fifo_full7), // Templated
					      .video_data_storage_fifo_aful(video_data_storage_fifo_aful7), // Templated
					      .video_data_storage_fifo_empty(video_data_storage_fifo_empty7), // Templated
					      .video_data_storage_fifo_amty(video_data_storage_fifo_amty7), // Templated
					      .video_data_vld	(video_data_vld7), // Templated
					      .video_data	(video_data7[(VIDEO_DATA_SIZE-1):0]), // Templated
					      .ack		(ack7),		 // Templated
					      .line_end		(line_end7),	 // Templated
					      // Inputs
					      .fifo_wrclk	(fifo_wrclk7),	 // Templated
					      .fifo_wrclk_rst_n	(fifo_wrclk_rst_n7), // Templated
					      .csi_data		(pipe7_csi_data[(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]), // Templated
					      .bytes_en		(pipe7_byte_en[(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0]), // Templated
					      .header_en	(pipe7_header_en), // Templated
					      .data_en		(pipe7_data_en), // Templated
					      .data_type	(pipe7_data_type[5:0]), // Templated
					      .virtual_channel	(pipe7_virtual_channel[1:0]), // Templated
					      .virtual_channel_x(pipe7_virtual_channel_x[(`CSI2_DEVICE_VCX_DWIDTH-1):0]), // Templated
					      .word_count	(pipe7_word_count[15:0]), // Templated
					      .fifo_rdclk	(fifo_rdclk7),	 // Templated
					      .fifo_rdclk_rst_n	(fifo_rdclk_rst_n7), // Templated
					      .superframe	(superframe),	 // Templated
					      .up_state		(up_state7));	 // Templated



endmodule





