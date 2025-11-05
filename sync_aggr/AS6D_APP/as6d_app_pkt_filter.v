
module   as6d_app_pkt_filter (/*AUTOARG*/
   // Outputs
   out_mep0_byte_en, out_mep0_csi_data, out_mep0_data_en,
   out_mep0_data_type, out_mep0_header_en, out_mep0_tunnel_mode_en,
   out_mep0_virtual_channel, out_mep0_word_count, out_mep0_pkt_crc_en,
   out_mep0_pkt_crc, out_mep1_byte_en, out_mep1_csi_data,
   out_mep1_data_en, out_mep1_data_type, out_mep1_header_en,
   out_mep1_tunnel_mode_en, out_mep1_virtual_channel,
   out_mep1_word_count, out_mep1_pkt_crc_en, out_mep1_pkt_crc,
   out_mep2_byte_en, out_mep2_csi_data, out_mep2_data_en,
   out_mep2_data_type, out_mep2_header_en, out_mep2_tunnel_mode_en,
   out_mep2_virtual_channel, out_mep2_word_count, out_mep2_pkt_crc_en,
   out_mep2_pkt_crc, out_mep3_byte_en, out_mep3_csi_data,
   out_mep3_data_en, out_mep3_data_type, out_mep3_header_en,
   out_mep3_tunnel_mode_en, out_mep3_virtual_channel,
   out_mep3_word_count, out_mep3_pkt_crc_en, out_mep3_pkt_crc,
   // Inputs
   reg_vc_selz_l_mep3, reg_vc_selz_l_mep2, reg_vc_selz_l_mep1,
   reg_vc_selz_l_mep0, reg_vc_selz_h_mep3, reg_vc_selz_h_mep2,
   reg_vc_selz_h_mep1, reg_vc_selz_h_mep0, reg_mep3_tdi_en_force,
   reg_mep3_tdi_en, reg_mep2_tdi_en_force, reg_mep2_tdi_en,
   reg_mep1_tdi_en_force, reg_mep1_tdi_en, reg_mep0_tdi_en_force,
   reg_mep0_tdi_en, reg_mem_dt8_selz_mep3, reg_mem_dt8_selz_mep2,
   reg_mem_dt8_selz_mep1, reg_mem_dt8_selz_mep0,
   reg_mem_dt7_selz_mep3, reg_mem_dt7_selz_mep2,
   reg_mem_dt7_selz_mep1, reg_mem_dt7_selz_mep0,
   reg_mem_dt4_selz_mep3, reg_mem_dt4_selz_mep2,
   reg_mem_dt4_selz_mep1, reg_mem_dt4_selz_mep0,
   reg_mem_dt4_selz_en_mep3, reg_mem_dt4_selz_en_mep2,
   reg_mem_dt4_selz_en_mep1, reg_mem_dt4_selz_en_mep0,
   reg_mem_dt3_selz_mep3, reg_mem_dt3_selz_mep2,
   reg_mem_dt3_selz_mep1, reg_mem_dt3_selz_mep0,
   reg_mem_dt3_selz_en_mep3, reg_mem_dt3_selz_en_mep2,
   reg_mem_dt3_selz_en_mep1, reg_mem_dt3_selz_en_mep0,
   reg_mem_dt2_selz_mep3, reg_mem_dt2_selz_mep2,
   reg_mem_dt2_selz_mep1, reg_mem_dt2_selz_mep0,
   reg_mem_dt1_selz_mep3, reg_mem_dt1_selz_mep2,
   reg_mem_dt1_selz_mep1, reg_mem_dt1_selz_mep0, mep_clk_rst_n3,
   mep_clk_rst_n2, mep_clk_rst_n1, mep_clk_rst_n0, mep_clk3, mep_clk2,
   mep_clk1, mep_clk0, in_mep3_word_count, in_mep3_virtual_channel,
   in_mep3_pkt_crc_en, in_mep3_pkt_crc, in_mep3_header_en,
   in_mep3_data_type, in_mep3_data_en, in_mep3_csi_data,
   in_mep3_byte_en, in_mep2_word_count, in_mep2_virtual_channel,
   in_mep2_pkt_crc_en, in_mep2_pkt_crc, in_mep2_header_en,
   in_mep2_data_type, in_mep2_data_en, in_mep2_csi_data,
   in_mep2_byte_en, in_mep1_word_count, in_mep1_virtual_channel,
   in_mep1_pkt_crc_en, in_mep1_pkt_crc, in_mep1_header_en,
   in_mep1_data_type, in_mep1_data_en, in_mep1_csi_data,
   in_mep1_byte_en, in_mep0_word_count, in_mep0_virtual_channel,
   in_mep0_pkt_crc_en, in_mep0_pkt_crc, in_mep0_header_en,
   in_mep0_data_type, in_mep0_data_en, in_mep0_csi_data,
   in_mep0_byte_en, in_mep0_tunnel_mode_en, in_mep1_tunnel_mode_en,
   in_mep2_tunnel_mode_en, in_mep3_tunnel_mode_en
   );

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input [2:0]		in_mep0_byte_en;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [63:0]		in_mep0_csi_data;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep0_data_en;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [5:0]		in_mep0_data_type;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep0_header_en;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [31:0]		in_mep0_pkt_crc;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep0_pkt_crc_en;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [3:0]		in_mep0_virtual_channel;// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [15:0]		in_mep0_word_count;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [2:0]		in_mep1_byte_en;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [63:0]		in_mep1_csi_data;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep1_data_en;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [5:0]		in_mep1_data_type;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep1_header_en;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [31:0]		in_mep1_pkt_crc;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep1_pkt_crc_en;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [3:0]		in_mep1_virtual_channel;// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [15:0]		in_mep1_word_count;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [2:0]		in_mep2_byte_en;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [63:0]		in_mep2_csi_data;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep2_data_en;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [5:0]		in_mep2_data_type;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep2_header_en;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [31:0]		in_mep2_pkt_crc;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep2_pkt_crc_en;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [3:0]		in_mep2_virtual_channel;// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [15:0]		in_mep2_word_count;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [2:0]		in_mep3_byte_en;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [63:0]		in_mep3_csi_data;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep3_data_en;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [5:0]		in_mep3_data_type;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep3_header_en;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [31:0]		in_mep3_pkt_crc;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			in_mep3_pkt_crc_en;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [3:0]		in_mep3_virtual_channel;// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [15:0]		in_mep3_word_count;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk0;		// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk1;		// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk2;		// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk3;		// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk_rst_n0;		// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk_rst_n1;		// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk_rst_n2;		// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input			mep_clk_rst_n3;		// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v, ...
input [6:0]		reg_mem_dt1_selz_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt1_selz_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt1_selz_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt1_selz_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt2_selz_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt2_selz_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt2_selz_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt2_selz_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt3_selz_en_mep0;// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt3_selz_en_mep1;// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt3_selz_en_mep2;// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt3_selz_en_mep3;// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt3_selz_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt3_selz_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt3_selz_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt3_selz_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt4_selz_en_mep0;// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt4_selz_en_mep1;// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt4_selz_en_mep2;// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mem_dt4_selz_en_mep3;// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt4_selz_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt4_selz_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt4_selz_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_mem_dt4_selz_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt7_selz_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt7_selz_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt7_selz_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt7_selz_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt8_selz_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt8_selz_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt8_selz_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [6:0]		reg_mem_dt8_selz_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input			reg_mep0_tdi_en;	// To u0_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input			reg_mep0_tdi_en_force;	// To u0_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input			reg_mep1_tdi_en;	// To u1_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input			reg_mep1_tdi_en_force;	// To u1_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input			reg_mep2_tdi_en;	// To u2_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input			reg_mep2_tdi_en_force;	// To u2_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input			reg_mep3_tdi_en;	// To u3_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input			reg_mep3_tdi_en_force;	// To u3_as6d_app_idi_tunnel_mode_delay of as6d_app_idi_tunnel_mode_delay.v
input [7:0]		reg_vc_selz_h_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_vc_selz_h_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_vc_selz_h_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_vc_selz_h_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_vc_selz_l_mep0;	// To u0_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_vc_selz_l_mep1;	// To u1_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_vc_selz_l_mep2;	// To u2_app_pkt_filter_lane of app_pkt_filter_lane.v
input [7:0]		reg_vc_selz_l_mep3;	// To u3_app_pkt_filter_lane of app_pkt_filter_lane.v
// End of automatics
input           in_mep0_tunnel_mode_en;
input           in_mep1_tunnel_mode_en;
input           in_mep2_tunnel_mode_en;
input           in_mep3_tunnel_mode_en;
/*AUTOOUTPUT*/
output [2:0]		out_mep0_byte_en;
output [63:0]		out_mep0_csi_data;
output			out_mep0_data_en;
output [5:0]		out_mep0_data_type;
output			out_mep0_header_en;
output			out_mep0_tunnel_mode_en;
output [3:0]		out_mep0_virtual_channel;
output [15:0]		out_mep0_word_count;
output			out_mep0_pkt_crc_en;
output [31:0]		out_mep0_pkt_crc;

output [2:0]		out_mep1_byte_en;
output [63:0]		out_mep1_csi_data;
output			out_mep1_data_en;
output [5:0]		out_mep1_data_type;
output			out_mep1_header_en;
output			out_mep1_tunnel_mode_en;
output [3:0]		out_mep1_virtual_channel;
output [15:0]		out_mep1_word_count;
output			out_mep1_pkt_crc_en;
output [31:0]		out_mep1_pkt_crc;

output [2:0]		out_mep2_byte_en;
output [63:0]		out_mep2_csi_data;
output			out_mep2_data_en;
output [5:0]		out_mep2_data_type;
output			out_mep2_header_en;
output			out_mep2_tunnel_mode_en;
output [3:0]		out_mep2_virtual_channel;
output [15:0]		out_mep2_word_count;
output			out_mep2_pkt_crc_en;
output [31:0]		out_mep2_pkt_crc;

output [2:0]		out_mep3_byte_en;
output [63:0]		out_mep3_csi_data;
output			out_mep3_data_en;
output [5:0]		out_mep3_data_type;
output			out_mep3_header_en;
output			out_mep3_tunnel_mode_en;
output [3:0]		out_mep3_virtual_channel;
output [15:0]		out_mep3_word_count;
output			out_mep3_pkt_crc_en;
output [31:0]		out_mep3_pkt_crc;

wire [2:0]		idi_tunnel_mode_d1_mep0_bytes_en;
wire [63:0]		idi_tunnel_mode_d1_mep0_csi_data;
wire			idi_tunnel_mode_d1_mep0_data_en;
wire [5:0]		idi_tunnel_mode_d1_mep0_data_type;
wire			idi_tunnel_mode_d1_mep0_header_en;
wire			idi_tunnel_mode_d1_mep0_tunnel_mode_en;
wire [3:0]		idi_tunnel_mode_d1_mep0_virtual_channel;
wire [15:0]		idi_tunnel_mode_d1_mep0_word_count;
wire     		idi_tunnel_mode_d1_mep0_pkt_crc_en;
wire [31:0]	    idi_tunnel_mode_d1_mep0_pkt_crc;
wire			mep0_tdi_en;		
wire [2:0]		idi_tunnel_mode_d1_mep1_bytes_en;
wire [63:0]		idi_tunnel_mode_d1_mep1_csi_data;
wire			idi_tunnel_mode_d1_mep1_data_en;
wire [5:0]		idi_tunnel_mode_d1_mep1_data_type;
wire			idi_tunnel_mode_d1_mep1_header_en;
wire			idi_tunnel_mode_d1_mep1_tunnel_mode_en;
wire [3:0]		idi_tunnel_mode_d1_mep1_virtual_channel;
wire [15:0]		idi_tunnel_mode_d1_mep1_word_count;
wire     		idi_tunnel_mode_d1_mep1_pkt_crc_en;
wire [31:0]	    idi_tunnel_mode_d1_mep1_pkt_crc;
wire			mep1_tdi_en;		
wire [2:0]		idi_tunnel_mode_d1_mep2_bytes_en;
wire [63:0]		idi_tunnel_mode_d1_mep2_csi_data;
wire			idi_tunnel_mode_d1_mep2_data_en;
wire [5:0]		idi_tunnel_mode_d1_mep2_data_type;
wire			idi_tunnel_mode_d1_mep2_header_en;
wire			idi_tunnel_mode_d1_mep2_tunnel_mode_en;
wire [3:0]		idi_tunnel_mode_d1_mep2_virtual_channel;
wire [15:0]		idi_tunnel_mode_d1_mep2_word_count;
wire     		idi_tunnel_mode_d1_mep2_pkt_crc_en;
wire [31:0]	    idi_tunnel_mode_d1_mep2_pkt_crc;
wire			mep2_tdi_en;		
wire [2:0]		idi_tunnel_mode_d1_mep3_bytes_en;
wire [63:0]		idi_tunnel_mode_d1_mep3_csi_data;
wire			idi_tunnel_mode_d1_mep3_data_en;
wire [5:0]		idi_tunnel_mode_d1_mep3_data_type;
wire			idi_tunnel_mode_d1_mep3_header_en;
wire			idi_tunnel_mode_d1_mep3_tunnel_mode_en;
wire [3:0]		idi_tunnel_mode_d1_mep3_virtual_channel;
wire [15:0]		idi_tunnel_mode_d1_mep3_word_count;
wire     		idi_tunnel_mode_d1_mep3_pkt_crc_en;
wire [31:0]	    idi_tunnel_mode_d1_mep3_pkt_crc;
wire			mep3_tdi_en;		
wire  [2:0]		pkt_filter_out_mep0_bytes_en;
wire  [63:0]    pkt_filter_out_mep0_csi_data;
wire     		pkt_filter_out_mep0_data_en;
wire  [5:0]		pkt_filter_out_mep0_data_type;
wire     		pkt_filter_out_mep0_header_en;
wire  [3:0]		pkt_filter_out_mep0_virtual_channel;
wire  [15:0]	pkt_filter_out_mep0_word_count;
wire     		pkt_filter_out_mep0_pkt_crc_en;
wire  [31:0]	pkt_filter_out_mep0_pkt_crc;
wire  [2:0]		pkt_filter_out_mep1_bytes_en;
wire  [63:0]	pkt_filter_out_mep1_csi_data;
wire     		pkt_filter_out_mep1_data_en;
wire  [5:0]		pkt_filter_out_mep1_data_type;
wire     		pkt_filter_out_mep1_header_en;
wire  [3:0]		pkt_filter_out_mep1_virtual_channel;
wire  [15:0]	pkt_filter_out_mep1_word_count;
wire     		pkt_filter_out_mep1_pkt_crc_en;
wire  [31:0]	pkt_filter_out_mep1_pkt_crc;
wire  [2:0]		pkt_filter_out_mep2_bytes_en;
wire  [63:0]	pkt_filter_out_mep2_csi_data;
wire     		pkt_filter_out_mep2_data_en;
wire  [5:0]		pkt_filter_out_mep2_data_type;
wire     		pkt_filter_out_mep2_header_en;
wire  [3:0]		pkt_filter_out_mep2_virtual_channel;
wire  [15:0]	pkt_filter_out_mep2_word_count;
wire     		pkt_filter_out_mep2_pkt_crc_en;
wire  [31:0]	pkt_filter_out_mep2_pkt_crc;
wire  [2:0]		pkt_filter_out_mep3_bytes_en;
wire  [63:0]	pkt_filter_out_mep3_csi_data;
wire     		pkt_filter_out_mep3_data_en;
wire  [5:0]		pkt_filter_out_mep3_data_type;
wire     		pkt_filter_out_mep3_header_en;
wire  [3:0]		pkt_filter_out_mep3_virtual_channel;
wire  [15:0]	pkt_filter_out_mep3_word_count;
wire     		pkt_filter_out_mep3_pkt_crc_en;
wire  [31:0]	pkt_filter_out_mep3_pkt_crc;

/*  app_pkt_filter_lane  AUTO_TEMPLATE (
        .app_clk_data    (mep_clk@),
        .app_clk_rst_n   (mep_clk_rst_n@),
		.in_ecc	(8'd0),
		.in_dvalid	(16'd0),
		.in_hvalid	(16'd0),
		.in_vvalid	(16'd0),
		.out_ecc	(),
		.out_dvalid	(),
		.out_hvalid	(),
		.out_vvalid	(),
		.in_bytes_en(in_mep@_byte_en[2:0]),
        .in\(.*\)    (in_mep@\1[]),
        .out\(.*\)   (pkt_filter_out_mep@\1[]),
	    .reg_mem_dt\(.*\)(reg_mem_dt\1_mep@[]),
	    .reg_vc_selz\(.*\)	(reg_vc_selz\1_mep@[]),
        .in_data_crc(32'd0),
        .out_data_crc(),
)*/
app_pkt_filter_lane u0_app_pkt_filter_lane(
					   .out_csi_data	(pkt_filter_out_mep0_csi_data[64-1:0]),
					   .out_bytes_en	(pkt_filter_out_mep0_bytes_en[3-1:0]),
					   .out_header_en	(pkt_filter_out_mep0_header_en),
					   .out_data_en		(pkt_filter_out_mep0_data_en),
					   .out_data_type	(pkt_filter_out_mep0_data_type[5:0]),
					   .out_virtual_channel	(pkt_filter_out_mep0_virtual_channel[4-1:0]),
					   .out_word_count	(pkt_filter_out_mep0_word_count[15:0]),
					   .out_pkt_crc_en	(pkt_filter_out_mep0_pkt_crc_en),
					   .out_pkt_crc		(pkt_filter_out_mep0_pkt_crc[31:0]),
					   .out_data_crc	(),
					   .out_ecc		(),
					   .out_dvalid		(),
					   .out_hvalid		(),
					   .out_vvalid		(),
                        /*AUTOINST*/
					   // Inputs
					   .app_clk_data	(mep_clk0),	 // Templated
					   .app_clk_rst_n	(mep_clk_rst_n0), // Templated
					   .reg_mem_dt1_selz	(reg_mem_dt1_selz_mep0[6:0]), // Templated
					   .reg_mem_dt2_selz	(reg_mem_dt2_selz_mep0[6:0]), // Templated
					   .reg_mem_dt7_selz	(reg_mem_dt7_selz_mep0[6:0]), // Templated
					   .reg_mem_dt8_selz	(reg_mem_dt8_selz_mep0[6:0]), // Templated
					   .reg_mem_dt3_selz	(reg_mem_dt3_selz_mep0[7:0]), // Templated
					   .reg_mem_dt4_selz	(reg_mem_dt4_selz_mep0[7:0]), // Templated
					   .reg_mem_dt3_selz_en	(reg_mem_dt3_selz_en_mep0), // Templated
					   .reg_mem_dt4_selz_en	(reg_mem_dt4_selz_en_mep0), // Templated
					   .reg_vc_selz_l	(reg_vc_selz_l_mep0[7:0]), // Templated
					   .reg_vc_selz_h	(reg_vc_selz_h_mep0[7:0]), // Templated
					   .in_csi_data		(in_mep0_csi_data[64-1:0]), // Templated
					   .in_bytes_en		(in_mep0_byte_en[2:0]), // Templated
					   .in_header_en	(in_mep0_header_en), // Templated
					   .in_data_en		(in_mep0_data_en), // Templated
					   .in_data_type	(in_mep0_data_type[5:0]), // Templated
					   .in_virtual_channel	(in_mep0_virtual_channel[4-1:0]), // Templated
					   .in_word_count	(in_mep0_word_count[15:0]), // Templated
					   .in_pkt_crc_en	(in_mep0_pkt_crc_en), // Templated
					   .in_pkt_crc		(in_mep0_pkt_crc[31:0]), // Templated
					   .in_ecc		(8'd0),		 // Templated
					   .in_dvalid		(16'd0),	 // Templated
					   .in_hvalid		(16'd0),	 // Templated
					   .in_vvalid		(16'd0),	 // Templated
					   .in_data_crc		(32'd0));	 // Templated
                                         
app_pkt_filter_lane u1_app_pkt_filter_lane(
					   .out_csi_data	(pkt_filter_out_mep1_csi_data[64-1:0]),
					   .out_bytes_en	(pkt_filter_out_mep1_bytes_en[3-1:0]),
					   .out_header_en	(pkt_filter_out_mep1_header_en),
					   .out_data_en		(pkt_filter_out_mep1_data_en),
					   .out_data_type	(pkt_filter_out_mep1_data_type[5:0]),
					   .out_virtual_channel	(pkt_filter_out_mep1_virtual_channel[4-1:0]),
					   .out_word_count	(pkt_filter_out_mep1_word_count[15:0]),
					   .out_pkt_crc_en	(pkt_filter_out_mep1_pkt_crc_en),
					   .out_pkt_crc		(pkt_filter_out_mep1_pkt_crc[31:0]),
					   .out_data_crc	(),
					   .out_ecc		(),
					   .out_dvalid		(),
					   .out_hvalid		(),
					   .out_vvalid		(),
                        /*AUTOINST*/
					   // Inputs
					   .app_clk_data	(mep_clk1),	 // Templated
					   .app_clk_rst_n	(mep_clk_rst_n1), // Templated
					   .reg_mem_dt1_selz	(reg_mem_dt1_selz_mep1[6:0]), // Templated
					   .reg_mem_dt2_selz	(reg_mem_dt2_selz_mep1[6:0]), // Templated
					   .reg_mem_dt7_selz	(reg_mem_dt7_selz_mep1[6:0]), // Templated
					   .reg_mem_dt8_selz	(reg_mem_dt8_selz_mep1[6:0]), // Templated
					   .reg_mem_dt3_selz	(reg_mem_dt3_selz_mep1[7:0]), // Templated
					   .reg_mem_dt4_selz	(reg_mem_dt4_selz_mep1[7:0]), // Templated
					   .reg_mem_dt3_selz_en	(reg_mem_dt3_selz_en_mep1), // Templated
					   .reg_mem_dt4_selz_en	(reg_mem_dt4_selz_en_mep1), // Templated
					   .reg_vc_selz_l	(reg_vc_selz_l_mep1[7:0]), // Templated
					   .reg_vc_selz_h	(reg_vc_selz_h_mep1[7:0]), // Templated
					   .in_csi_data		(in_mep1_csi_data[64-1:0]), // Templated
					   .in_bytes_en		(in_mep1_byte_en[2:0]), // Templated
					   .in_header_en	(in_mep1_header_en), // Templated
					   .in_data_en		(in_mep1_data_en), // Templated
					   .in_data_type	(in_mep1_data_type[5:0]), // Templated
					   .in_virtual_channel	(in_mep1_virtual_channel[4-1:0]), // Templated
					   .in_word_count	(in_mep1_word_count[15:0]), // Templated
					   .in_pkt_crc_en	(in_mep1_pkt_crc_en), // Templated
					   .in_pkt_crc		(in_mep1_pkt_crc[31:0]), // Templated
					   .in_ecc		(8'd0),		 // Templated
					   .in_dvalid		(16'd0),	 // Templated
					   .in_hvalid		(16'd0),	 // Templated
					   .in_vvalid		(16'd0),	 // Templated
					   .in_data_crc		(32'd0));	 // Templated
                                         
app_pkt_filter_lane u2_app_pkt_filter_lane(
					   .out_csi_data	(pkt_filter_out_mep2_csi_data[64-1:0]),
					   .out_bytes_en	(pkt_filter_out_mep2_bytes_en[3-1:0]),
					   .out_header_en	(pkt_filter_out_mep2_header_en),
					   .out_data_en		(pkt_filter_out_mep2_data_en),
					   .out_data_type	(pkt_filter_out_mep2_data_type[5:0]),
					   .out_virtual_channel	(pkt_filter_out_mep2_virtual_channel[4-1:0]),
					   .out_word_count	(pkt_filter_out_mep2_word_count[15:0]),
					   .out_pkt_crc_en	(pkt_filter_out_mep2_pkt_crc_en),
					   .out_pkt_crc		(pkt_filter_out_mep2_pkt_crc[31:0]),
					   .out_data_crc	(),
					   .out_ecc		(),
					   .out_dvalid		(),
					   .out_hvalid		(),
					   .out_vvalid		(),
                        /*AUTOINST*/
					   // Inputs
					   .app_clk_data	(mep_clk2),	 // Templated
					   .app_clk_rst_n	(mep_clk_rst_n2), // Templated
					   .reg_mem_dt1_selz	(reg_mem_dt1_selz_mep2[6:0]), // Templated
					   .reg_mem_dt2_selz	(reg_mem_dt2_selz_mep2[6:0]), // Templated
					   .reg_mem_dt7_selz	(reg_mem_dt7_selz_mep2[6:0]), // Templated
					   .reg_mem_dt8_selz	(reg_mem_dt8_selz_mep2[6:0]), // Templated
					   .reg_mem_dt3_selz	(reg_mem_dt3_selz_mep2[7:0]), // Templated
					   .reg_mem_dt4_selz	(reg_mem_dt4_selz_mep2[7:0]), // Templated
					   .reg_mem_dt3_selz_en	(reg_mem_dt3_selz_en_mep2), // Templated
					   .reg_mem_dt4_selz_en	(reg_mem_dt4_selz_en_mep2), // Templated
					   .reg_vc_selz_l	(reg_vc_selz_l_mep2[7:0]), // Templated
					   .reg_vc_selz_h	(reg_vc_selz_h_mep2[7:0]), // Templated
					   .in_csi_data		(in_mep2_csi_data[64-1:0]), // Templated
					   .in_bytes_en		(in_mep2_byte_en[2:0]), // Templated
					   .in_header_en	(in_mep2_header_en), // Templated
					   .in_data_en		(in_mep2_data_en), // Templated
					   .in_data_type	(in_mep2_data_type[5:0]), // Templated
					   .in_virtual_channel	(in_mep2_virtual_channel[4-1:0]), // Templated
					   .in_word_count	(in_mep2_word_count[15:0]), // Templated
					   .in_pkt_crc_en	(in_mep2_pkt_crc_en), // Templated
					   .in_pkt_crc		(in_mep2_pkt_crc[31:0]), // Templated
					   .in_ecc		(8'd0),		 // Templated
					   .in_dvalid		(16'd0),	 // Templated
					   .in_hvalid		(16'd0),	 // Templated
					   .in_vvalid		(16'd0),	 // Templated
					   .in_data_crc		(32'd0));	 // Templated
                                         
app_pkt_filter_lane u3_app_pkt_filter_lane(
					   .out_csi_data	(pkt_filter_out_mep3_csi_data[64-1:0]),
					   .out_bytes_en	(pkt_filter_out_mep3_bytes_en[3-1:0]),
					   .out_header_en	(pkt_filter_out_mep3_header_en),
					   .out_data_en		(pkt_filter_out_mep3_data_en),
					   .out_data_type	(pkt_filter_out_mep3_data_type[5:0]),
					   .out_virtual_channel	(pkt_filter_out_mep3_virtual_channel[4-1:0]),
					   .out_word_count	(pkt_filter_out_mep3_word_count[15:0]),
					   .out_pkt_crc_en	(pkt_filter_out_mep3_pkt_crc_en),
					   .out_pkt_crc		(pkt_filter_out_mep3_pkt_crc[31:0]),
					   .out_data_crc	(),
					   .out_ecc		(),
					   .out_dvalid		(),
					   .out_hvalid		(),
					   .out_vvalid		(),
                        /*AUTOINST*/
					   // Inputs
					   .app_clk_data	(mep_clk3),	 // Templated
					   .app_clk_rst_n	(mep_clk_rst_n3), // Templated
					   .reg_mem_dt1_selz	(reg_mem_dt1_selz_mep3[6:0]), // Templated
					   .reg_mem_dt2_selz	(reg_mem_dt2_selz_mep3[6:0]), // Templated
					   .reg_mem_dt7_selz	(reg_mem_dt7_selz_mep3[6:0]), // Templated
					   .reg_mem_dt8_selz	(reg_mem_dt8_selz_mep3[6:0]), // Templated
					   .reg_mem_dt3_selz	(reg_mem_dt3_selz_mep3[7:0]), // Templated
					   .reg_mem_dt4_selz	(reg_mem_dt4_selz_mep3[7:0]), // Templated
					   .reg_mem_dt3_selz_en	(reg_mem_dt3_selz_en_mep3), // Templated
					   .reg_mem_dt4_selz_en	(reg_mem_dt4_selz_en_mep3), // Templated
					   .reg_vc_selz_l	(reg_vc_selz_l_mep3[7:0]), // Templated
					   .reg_vc_selz_h	(reg_vc_selz_h_mep3[7:0]), // Templated
					   .in_csi_data		(in_mep3_csi_data[64-1:0]), // Templated
					   .in_bytes_en		(in_mep3_byte_en[2:0]), // Templated
					   .in_header_en	(in_mep3_header_en), // Templated
					   .in_data_en		(in_mep3_data_en), // Templated
					   .in_data_type	(in_mep3_data_type[5:0]), // Templated
					   .in_virtual_channel	(in_mep3_virtual_channel[4-1:0]), // Templated
					   .in_word_count	(in_mep3_word_count[15:0]), // Templated
					   .in_pkt_crc_en	(in_mep3_pkt_crc_en), // Templated
					   .in_pkt_crc		(in_mep3_pkt_crc[31:0]), // Templated
					   .in_ecc		(8'd0),		 // Templated
					   .in_dvalid		(16'd0),	 // Templated
					   .in_hvalid		(16'd0),	 // Templated
					   .in_vvalid		(16'd0),	 // Templated
					   .in_data_crc		(32'd0));	 // Templated


/*  as6d_app_idi_tunnel_mode_delay  AUTO_TEMPLATE (
		.tdi_en		(mep@_tdi_en),
		.in_bytes_en(in_mep@_byte_en[2:0]),
        .in\(.*\)   (in_mep@\1[]),
        .out\(.*\)  (idi_tunnel_mode_d1_mep@\1[]),
        .reg_mep_tdi_en        (reg_mep@_tdi_en),
        .reg_mep_tdi_en_force      (reg_mep@_tdi_en_force),
        .clk        (mep_clk@),
        .rst_n      (mep_clk_rst_n@),
)*/
as6d_app_idi_tunnel_mode_delay u0_as6d_app_idi_tunnel_mode_delay(
								 .tdi_en		(mep0_tdi_en),
								 .out_bytes_en		(idi_tunnel_mode_d1_mep0_bytes_en[2:0]),
								 .out_csi_data		(idi_tunnel_mode_d1_mep0_csi_data[63:0]),
								 .out_data_en		(idi_tunnel_mode_d1_mep0_data_en),
								 .out_data_type		(idi_tunnel_mode_d1_mep0_data_type[5:0]),
								 .out_header_en		(idi_tunnel_mode_d1_mep0_header_en),
								 .out_virtual_channel	(idi_tunnel_mode_d1_mep0_virtual_channel[3:0]),
								 .out_word_count	(idi_tunnel_mode_d1_mep0_word_count[15:0]),
								 .out_tunnel_mode_en	(idi_tunnel_mode_d1_mep0_tunnel_mode_en),
								 .out_pkt_crc_en	(idi_tunnel_mode_d1_mep0_pkt_crc_en),
								 .out_pkt_crc		(idi_tunnel_mode_d1_mep0_pkt_crc[31:0]),
                                /*AUTOINST*/
								 // Inputs
								 .clk			(mep_clk0),	 // Templated
								 .rst_n			(mep_clk_rst_n0), // Templated
								 .reg_mep_tdi_en_force	(reg_mep0_tdi_en_force), // Templated
								 .reg_mep_tdi_en	(reg_mep0_tdi_en), // Templated
								 .in_bytes_en		(in_mep0_byte_en[2:0]), // Templated
								 .in_csi_data		(in_mep0_csi_data[63:0]), // Templated
								 .in_data_en		(in_mep0_data_en), // Templated
								 .in_data_type		(in_mep0_data_type[5:0]), // Templated
								 .in_header_en		(in_mep0_header_en), // Templated
								 .in_virtual_channel	(in_mep0_virtual_channel[3:0]), // Templated
								 .in_word_count		(in_mep0_word_count[15:0]), // Templated
								 .in_tunnel_mode_en	(in_mep0_tunnel_mode_en), // Templated
								 .in_pkt_crc_en		(in_mep0_pkt_crc_en), // Templated
								 .in_pkt_crc		(in_mep0_pkt_crc[31:0])); // Templated

as6d_app_idi_tunnel_mode_delay u1_as6d_app_idi_tunnel_mode_delay(
								 .tdi_en		(mep1_tdi_en),
								 .out_bytes_en		(idi_tunnel_mode_d1_mep1_bytes_en[2:0]),
								 .out_csi_data		(idi_tunnel_mode_d1_mep1_csi_data[63:0]),
								 .out_data_en		(idi_tunnel_mode_d1_mep1_data_en),
								 .out_data_type		(idi_tunnel_mode_d1_mep1_data_type[5:0]),
								 .out_header_en		(idi_tunnel_mode_d1_mep1_header_en),
								 .out_virtual_channel	(idi_tunnel_mode_d1_mep1_virtual_channel[3:0]),
								 .out_word_count	(idi_tunnel_mode_d1_mep1_word_count[15:0]),
								 .out_tunnel_mode_en	(idi_tunnel_mode_d1_mep1_tunnel_mode_en),
								 .out_pkt_crc_en	(idi_tunnel_mode_d1_mep1_pkt_crc_en),
								 .out_pkt_crc		(idi_tunnel_mode_d1_mep1_pkt_crc[31:0]),
                                /*AUTOINST*/
								 // Inputs
								 .clk			(mep_clk1),	 // Templated
								 .rst_n			(mep_clk_rst_n1), // Templated
								 .reg_mep_tdi_en_force	(reg_mep1_tdi_en_force), // Templated
								 .reg_mep_tdi_en	(reg_mep1_tdi_en), // Templated
								 .in_bytes_en		(in_mep1_byte_en[2:0]), // Templated
								 .in_csi_data		(in_mep1_csi_data[63:0]), // Templated
								 .in_data_en		(in_mep1_data_en), // Templated
								 .in_data_type		(in_mep1_data_type[5:0]), // Templated
								 .in_header_en		(in_mep1_header_en), // Templated
								 .in_virtual_channel	(in_mep1_virtual_channel[3:0]), // Templated
								 .in_word_count		(in_mep1_word_count[15:0]), // Templated
								 .in_tunnel_mode_en	(in_mep1_tunnel_mode_en), // Templated
								 .in_pkt_crc_en		(in_mep1_pkt_crc_en), // Templated
								 .in_pkt_crc		(in_mep1_pkt_crc[31:0])); // Templated
as6d_app_idi_tunnel_mode_delay u2_as6d_app_idi_tunnel_mode_delay(
								 .tdi_en		(mep2_tdi_en),
								 .out_bytes_en		(idi_tunnel_mode_d1_mep2_bytes_en[2:0]),
								 .out_csi_data		(idi_tunnel_mode_d1_mep2_csi_data[63:0]),
								 .out_data_en		(idi_tunnel_mode_d1_mep2_data_en),
								 .out_data_type		(idi_tunnel_mode_d1_mep2_data_type[5:0]),
								 .out_header_en		(idi_tunnel_mode_d1_mep2_header_en),
								 .out_virtual_channel	(idi_tunnel_mode_d1_mep2_virtual_channel[3:0]),
								 .out_word_count	(idi_tunnel_mode_d1_mep2_word_count[15:0]),
								 .out_tunnel_mode_en	(idi_tunnel_mode_d1_mep2_tunnel_mode_en),
								 .out_pkt_crc_en	(idi_tunnel_mode_d1_mep2_pkt_crc_en),
								 .out_pkt_crc		(idi_tunnel_mode_d1_mep2_pkt_crc[31:0]),
                                /*AUTOINST*/
								 // Inputs
								 .clk			(mep_clk2),	 // Templated
								 .rst_n			(mep_clk_rst_n2), // Templated
								 .reg_mep_tdi_en_force	(reg_mep2_tdi_en_force), // Templated
								 .reg_mep_tdi_en	(reg_mep2_tdi_en), // Templated
								 .in_bytes_en		(in_mep2_byte_en[2:0]), // Templated
								 .in_csi_data		(in_mep2_csi_data[63:0]), // Templated
								 .in_data_en		(in_mep2_data_en), // Templated
								 .in_data_type		(in_mep2_data_type[5:0]), // Templated
								 .in_header_en		(in_mep2_header_en), // Templated
								 .in_virtual_channel	(in_mep2_virtual_channel[3:0]), // Templated
								 .in_word_count		(in_mep2_word_count[15:0]), // Templated
								 .in_tunnel_mode_en	(in_mep2_tunnel_mode_en), // Templated
								 .in_pkt_crc_en		(in_mep2_pkt_crc_en), // Templated
								 .in_pkt_crc		(in_mep2_pkt_crc[31:0])); // Templated
as6d_app_idi_tunnel_mode_delay u3_as6d_app_idi_tunnel_mode_delay(
								 .tdi_en		(mep3_tdi_en),
								 .out_bytes_en		(idi_tunnel_mode_d1_mep3_bytes_en[2:0]),
								 .out_csi_data		(idi_tunnel_mode_d1_mep3_csi_data[63:0]),
								 .out_data_en		(idi_tunnel_mode_d1_mep3_data_en),
								 .out_data_type		(idi_tunnel_mode_d1_mep3_data_type[5:0]),
								 .out_header_en		(idi_tunnel_mode_d1_mep3_header_en),
								 .out_virtual_channel	(idi_tunnel_mode_d1_mep3_virtual_channel[3:0]),
								 .out_word_count	(idi_tunnel_mode_d1_mep3_word_count[15:0]),
								 .out_tunnel_mode_en	(idi_tunnel_mode_d1_mep3_tunnel_mode_en),
								 .out_pkt_crc_en	(idi_tunnel_mode_d1_mep3_pkt_crc_en),
								 .out_pkt_crc		(idi_tunnel_mode_d1_mep3_pkt_crc[31:0]),
                                /*AUTOINST*/
								 // Inputs
								 .clk			(mep_clk3),	 // Templated
								 .rst_n			(mep_clk_rst_n3), // Templated
								 .reg_mep_tdi_en_force	(reg_mep3_tdi_en_force), // Templated
								 .reg_mep_tdi_en	(reg_mep3_tdi_en), // Templated
								 .in_bytes_en		(in_mep3_byte_en[2:0]), // Templated
								 .in_csi_data		(in_mep3_csi_data[63:0]), // Templated
								 .in_data_en		(in_mep3_data_en), // Templated
								 .in_data_type		(in_mep3_data_type[5:0]), // Templated
								 .in_header_en		(in_mep3_header_en), // Templated
								 .in_virtual_channel	(in_mep3_virtual_channel[3:0]), // Templated
								 .in_word_count		(in_mep3_word_count[15:0]), // Templated
								 .in_tunnel_mode_en	(in_mep3_tunnel_mode_en), // Templated
								 .in_pkt_crc_en		(in_mep3_pkt_crc_en), // Templated
								 .in_pkt_crc		(in_mep3_pkt_crc[31:0])); // Templated

assign out_mep0_byte_en          = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_bytes_en        : pkt_filter_out_mep0_bytes_en         ;
assign out_mep0_csi_data         = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_csi_data        : pkt_filter_out_mep0_csi_data         ;
assign out_mep0_data_en          = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_data_en         : pkt_filter_out_mep0_data_en          ;
assign out_mep0_data_type        = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_data_type       : pkt_filter_out_mep0_data_type        ;
assign out_mep0_header_en        = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_header_en       : pkt_filter_out_mep0_header_en        ;
assign out_mep0_virtual_channel  = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_virtual_channel : pkt_filter_out_mep0_virtual_channel  ;
assign out_mep0_word_count       = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_word_count      : pkt_filter_out_mep0_word_count       ;
assign out_mep0_pkt_crc_en       = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_pkt_crc_en      : pkt_filter_out_mep0_pkt_crc_en       ;
assign out_mep0_pkt_crc          = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_pkt_crc         : pkt_filter_out_mep0_pkt_crc          ;
assign out_mep0_tunnel_mode_en   = mep0_tdi_en ? idi_tunnel_mode_d1_mep0_tunnel_mode_en  : 1'd0                                 ;
 
assign out_mep1_byte_en          = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_bytes_en        : pkt_filter_out_mep1_bytes_en         ;
assign out_mep1_csi_data         = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_csi_data        : pkt_filter_out_mep1_csi_data         ;
assign out_mep1_data_en          = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_data_en         : pkt_filter_out_mep1_data_en          ;
assign out_mep1_data_type        = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_data_type       : pkt_filter_out_mep1_data_type        ;
assign out_mep1_header_en        = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_header_en       : pkt_filter_out_mep1_header_en        ;
assign out_mep1_virtual_channel  = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_virtual_channel : pkt_filter_out_mep1_virtual_channel  ;
assign out_mep1_word_count       = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_word_count      : pkt_filter_out_mep1_word_count       ;
assign out_mep1_pkt_crc_en       = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_pkt_crc_en      : pkt_filter_out_mep1_pkt_crc_en       ;
assign out_mep1_pkt_crc          = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_pkt_crc         : pkt_filter_out_mep1_pkt_crc          ;
assign out_mep1_tunnel_mode_en   = mep1_tdi_en ? idi_tunnel_mode_d1_mep1_tunnel_mode_en  : 1'd0                                 ;
 
assign out_mep2_byte_en          = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_bytes_en        : pkt_filter_out_mep2_bytes_en         ;
assign out_mep2_csi_data         = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_csi_data        : pkt_filter_out_mep2_csi_data         ;
assign out_mep2_data_en          = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_data_en         : pkt_filter_out_mep2_data_en          ;
assign out_mep2_data_type        = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_data_type       : pkt_filter_out_mep2_data_type        ;
assign out_mep2_header_en        = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_header_en       : pkt_filter_out_mep2_header_en        ;
assign out_mep2_virtual_channel  = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_virtual_channel : pkt_filter_out_mep2_virtual_channel  ;
assign out_mep2_word_count       = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_word_count      : pkt_filter_out_mep2_word_count       ;
assign out_mep2_pkt_crc_en       = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_pkt_crc_en      : pkt_filter_out_mep2_pkt_crc_en       ;
assign out_mep2_pkt_crc          = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_pkt_crc         : pkt_filter_out_mep2_pkt_crc          ;
assign out_mep2_tunnel_mode_en   = mep2_tdi_en ? idi_tunnel_mode_d1_mep2_tunnel_mode_en  : 1'd0                                 ;
 
assign out_mep3_byte_en          = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_bytes_en        : pkt_filter_out_mep3_bytes_en         ;
assign out_mep3_csi_data         = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_csi_data        : pkt_filter_out_mep3_csi_data         ;
assign out_mep3_data_en          = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_data_en         : pkt_filter_out_mep3_data_en          ;
assign out_mep3_data_type        = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_data_type       : pkt_filter_out_mep3_data_type        ;
assign out_mep3_header_en        = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_header_en       : pkt_filter_out_mep3_header_en        ;
assign out_mep3_virtual_channel  = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_virtual_channel : pkt_filter_out_mep3_virtual_channel  ;
assign out_mep3_word_count       = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_word_count      : pkt_filter_out_mep3_word_count       ;
assign out_mep3_pkt_crc_en       = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_pkt_crc_en      : pkt_filter_out_mep3_pkt_crc_en       ;
assign out_mep3_pkt_crc          = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_pkt_crc         : pkt_filter_out_mep3_pkt_crc          ;
assign out_mep3_tunnel_mode_en   = mep3_tdi_en ? idi_tunnel_mode_d1_mep3_tunnel_mode_en  : 1'd0                                 ;
 

endmodule
