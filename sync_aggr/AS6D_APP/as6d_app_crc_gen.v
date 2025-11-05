
module as6d_app_crc_gen(/*AUTOARG*/
   // Outputs
   out_mep3_word_count, out_mep3_virtual_channel,
   out_mep3_tunnel_mode_en, out_mep3_pkt_crc_en, out_mep3_pkt_crc,
   out_mep3_header_en, out_mep3_data_type, out_mep3_data_en,
   out_mep3_csi_data, out_mep3_byte_en, out_mep2_word_count,
   out_mep2_virtual_channel, out_mep2_tunnel_mode_en,
   out_mep2_pkt_crc_en, out_mep2_pkt_crc, out_mep2_header_en,
   out_mep2_data_type, out_mep2_data_en, out_mep2_csi_data,
   out_mep2_byte_en, out_mep1_word_count, out_mep1_virtual_channel,
   out_mep1_tunnel_mode_en, out_mep1_pkt_crc_en, out_mep1_pkt_crc,
   out_mep1_header_en, out_mep1_data_type, out_mep1_data_en,
   out_mep1_csi_data, out_mep1_byte_en, out_mep0_word_count,
   out_mep0_virtual_channel, out_mep0_tunnel_mode_en,
   out_mep0_pkt_crc_en, out_mep0_pkt_crc, out_mep0_header_en,
   out_mep0_data_type, out_mep0_data_en, out_mep0_csi_data,
   out_mep0_byte_en,
   // Inputs
   reg_app_pkt_crc_gen_dis, mep_clk_rst_n3, mep_clk_rst_n2,
   mep_clk_rst_n1, mep_clk_rst_n0, mep_clk3, mep_clk2, mep_clk1,
   mep_clk0, in_mep3_word_count, in_mep3_virtual_channel,
   in_mep3_tunnel_mode_en, in_mep3_header_en, in_mep3_data_type,
   in_mep3_data_en, in_mep3_csi_data, in_mep3_byte_en,
   in_mep2_word_count, in_mep2_virtual_channel,
   in_mep2_tunnel_mode_en, in_mep2_header_en, in_mep2_data_type,
   in_mep2_data_en, in_mep2_csi_data, in_mep2_byte_en,
   in_mep1_word_count, in_mep1_virtual_channel,
   in_mep1_tunnel_mode_en, in_mep1_header_en, in_mep1_data_type,
   in_mep1_data_en, in_mep1_csi_data, in_mep1_byte_en,
   in_mep0_word_count, in_mep0_virtual_channel,
   in_mep0_tunnel_mode_en, in_mep0_header_en, in_mep0_data_type,
   in_mep0_data_en, in_mep0_csi_data, in_mep0_byte_en
   );

    /*AUTOINPUT*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    input [2:0]		in_mep0_byte_en;	// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [63:0]	in_mep0_csi_data;	// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep0_data_en;	// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [5:0]		in_mep0_data_type;	// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep0_header_en;	// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep0_tunnel_mode_en;	// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [3:0]		in_mep0_virtual_channel;// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [15:0]	in_mep0_word_count;	// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [2:0]		in_mep1_byte_en;	// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [63:0]	in_mep1_csi_data;	// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep1_data_en;	// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [5:0]		in_mep1_data_type;	// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep1_header_en;	// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep1_tunnel_mode_en;	// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [3:0]		in_mep1_virtual_channel;// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [15:0]	in_mep1_word_count;	// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [2:0]		in_mep2_byte_en;	// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [63:0]	in_mep2_csi_data;	// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep2_data_en;	// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [5:0]		in_mep2_data_type;	// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep2_header_en;	// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep2_tunnel_mode_en;	// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [3:0]		in_mep2_virtual_channel;// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [15:0]	in_mep2_word_count;	// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [2:0]		in_mep3_byte_en;	// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [63:0]	in_mep3_csi_data;	// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep3_data_en;	// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [5:0]		in_mep3_data_type;	// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep3_header_en;	// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		in_mep3_tunnel_mode_en;	// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [3:0]		in_mep3_virtual_channel;// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input [15:0]	in_mep3_word_count;	// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk0;		// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk1;		// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk2;		// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk3;		// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk_rst_n0;		// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk_rst_n1;		// To u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk_rst_n2;		// To u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		mep_clk_rst_n3;		// To u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    input		reg_app_pkt_crc_gen_dis;// To u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v, ...
    // End of automatics
    /*AUTOOUTPUT*/
    // Beginning of automatic outputs (from unused autoinst outputs)
    output [2:0]	out_mep0_byte_en;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [63:0]	out_mep0_csi_data;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep0_data_en;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [5:0]	out_mep0_data_type;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep0_header_en;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [31:0]	out_mep0_pkt_crc;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep0_pkt_crc_en;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep0_tunnel_mode_en;// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [3:0]	out_mep0_virtual_channel;// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [15:0]	out_mep0_word_count;	// From u0_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [2:0]	out_mep1_byte_en;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [63:0]	out_mep1_csi_data;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep1_data_en;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [5:0]	out_mep1_data_type;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep1_header_en;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [31:0]	out_mep1_pkt_crc;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep1_pkt_crc_en;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep1_tunnel_mode_en;// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [3:0]	out_mep1_virtual_channel;// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [15:0]	out_mep1_word_count;	// From u1_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [2:0]	out_mep2_byte_en;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [63:0]	out_mep2_csi_data;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep2_data_en;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [5:0]	out_mep2_data_type;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep2_header_en;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [31:0]	out_mep2_pkt_crc;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep2_pkt_crc_en;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep2_tunnel_mode_en;// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [3:0]	out_mep2_virtual_channel;// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [15:0]	out_mep2_word_count;	// From u2_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [2:0]	out_mep3_byte_en;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [63:0]	out_mep3_csi_data;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep3_data_en;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [5:0]	out_mep3_data_type;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep3_header_en;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [31:0]	out_mep3_pkt_crc;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep3_pkt_crc_en;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output		out_mep3_tunnel_mode_en;// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [3:0]	out_mep3_virtual_channel;// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    output [15:0]	out_mep3_word_count;	// From u3_as6d_app_crc_gen_lane of as6d_app_crc_gen_lane.v
    // End of automatics
    
    
    /*as6d_app_crc_gen_lane AUTO_TEMPLATE(
	    .clk(mep_clk@[]),
	    .rst_n(mep_clk_rst_n@[]),
        .in_idi_data(in_mep@_csi_data[]),
        .in_idi_\(.*\)	(in_mep@_\1[]),
        .out_idi_data(out_mep@_csi_data[]),
        .out_idi_\(.*\)	(out_mep@_\1[]),
		.pcs2mep_data_stat	(1'd1),
        .idi_crc_en(out_mep@_crc_en),
        .idi_crc(out_mep@_crc[]),
    )*/
    as6d_app_crc_gen_lane u0_as6d_app_crc_gen_lane(/*AUTOINST*/
						   // Outputs
						   .out_idi_tunnel_mode_en(out_mep0_tunnel_mode_en), // Templated
						   .out_idi_header_en	(out_mep0_header_en), // Templated
						   .out_idi_data_type	(out_mep0_data_type[5:0]), // Templated
						   .out_idi_word_count	(out_mep0_word_count[15:0]), // Templated
						   .out_idi_virtual_channel(out_mep0_virtual_channel[3:0]), // Templated
						   .out_idi_data	(out_mep0_csi_data[63:0]), // Templated
						   .out_idi_data_en	(out_mep0_data_en), // Templated
						   .out_idi_byte_en	(out_mep0_byte_en[2:0]), // Templated
						   .out_idi_pkt_crc_en	(out_mep0_pkt_crc_en), // Templated
						   .out_idi_pkt_crc	(out_mep0_pkt_crc[31:0]), // Templated
						   // Inputs
						   .clk			(mep_clk0),	 // Templated
						   .rst_n		(mep_clk_rst_n0), // Templated
						   .reg_app_pkt_crc_gen_dis(reg_app_pkt_crc_gen_dis),
						   .pcs2mep_data_stat	(1'd1),		 // Templated
						   .in_idi_tunnel_mode_en(in_mep0_tunnel_mode_en), // Templated
						   .in_idi_header_en	(in_mep0_header_en), // Templated
						   .in_idi_data_type	(in_mep0_data_type[5:0]), // Templated
						   .in_idi_word_count	(in_mep0_word_count[15:0]), // Templated
						   .in_idi_virtual_channel(in_mep0_virtual_channel[3:0]), // Templated
						   .in_idi_data		(in_mep0_csi_data[63:0]), // Templated
						   .in_idi_data_en	(in_mep0_data_en), // Templated
						   .in_idi_byte_en	(in_mep0_byte_en[2:0])); // Templated

    as6d_app_crc_gen_lane u1_as6d_app_crc_gen_lane(/*AUTOINST*/
						   // Outputs
						   .out_idi_tunnel_mode_en(out_mep1_tunnel_mode_en), // Templated
						   .out_idi_header_en	(out_mep1_header_en), // Templated
						   .out_idi_data_type	(out_mep1_data_type[5:0]), // Templated
						   .out_idi_word_count	(out_mep1_word_count[15:0]), // Templated
						   .out_idi_virtual_channel(out_mep1_virtual_channel[3:0]), // Templated
						   .out_idi_data	(out_mep1_csi_data[63:0]), // Templated
						   .out_idi_data_en	(out_mep1_data_en), // Templated
						   .out_idi_byte_en	(out_mep1_byte_en[2:0]), // Templated
						   .out_idi_pkt_crc_en	(out_mep1_pkt_crc_en), // Templated
						   .out_idi_pkt_crc	(out_mep1_pkt_crc[31:0]), // Templated
						   // Inputs
						   .clk			(mep_clk1),	 // Templated
						   .rst_n		(mep_clk_rst_n1), // Templated
						   .reg_app_pkt_crc_gen_dis(reg_app_pkt_crc_gen_dis),
						   .pcs2mep_data_stat	(1'd1),		 // Templated
						   .in_idi_tunnel_mode_en(in_mep1_tunnel_mode_en), // Templated
						   .in_idi_header_en	(in_mep1_header_en), // Templated
						   .in_idi_data_type	(in_mep1_data_type[5:0]), // Templated
						   .in_idi_word_count	(in_mep1_word_count[15:0]), // Templated
						   .in_idi_virtual_channel(in_mep1_virtual_channel[3:0]), // Templated
						   .in_idi_data		(in_mep1_csi_data[63:0]), // Templated
						   .in_idi_data_en	(in_mep1_data_en), // Templated
						   .in_idi_byte_en	(in_mep1_byte_en[2:0])); // Templated

    as6d_app_crc_gen_lane u2_as6d_app_crc_gen_lane(/*AUTOINST*/
						   // Outputs
						   .out_idi_tunnel_mode_en(out_mep2_tunnel_mode_en), // Templated
						   .out_idi_header_en	(out_mep2_header_en), // Templated
						   .out_idi_data_type	(out_mep2_data_type[5:0]), // Templated
						   .out_idi_word_count	(out_mep2_word_count[15:0]), // Templated
						   .out_idi_virtual_channel(out_mep2_virtual_channel[3:0]), // Templated
						   .out_idi_data	(out_mep2_csi_data[63:0]), // Templated
						   .out_idi_data_en	(out_mep2_data_en), // Templated
						   .out_idi_byte_en	(out_mep2_byte_en[2:0]), // Templated
						   .out_idi_pkt_crc_en	(out_mep2_pkt_crc_en), // Templated
						   .out_idi_pkt_crc	(out_mep2_pkt_crc[31:0]), // Templated
						   // Inputs
						   .clk			(mep_clk2),	 // Templated
						   .rst_n		(mep_clk_rst_n2), // Templated
						   .reg_app_pkt_crc_gen_dis(reg_app_pkt_crc_gen_dis),
						   .pcs2mep_data_stat	(1'd1),		 // Templated
						   .in_idi_tunnel_mode_en(in_mep2_tunnel_mode_en), // Templated
						   .in_idi_header_en	(in_mep2_header_en), // Templated
						   .in_idi_data_type	(in_mep2_data_type[5:0]), // Templated
						   .in_idi_word_count	(in_mep2_word_count[15:0]), // Templated
						   .in_idi_virtual_channel(in_mep2_virtual_channel[3:0]), // Templated
						   .in_idi_data		(in_mep2_csi_data[63:0]), // Templated
						   .in_idi_data_en	(in_mep2_data_en), // Templated
						   .in_idi_byte_en	(in_mep2_byte_en[2:0])); // Templated

    as6d_app_crc_gen_lane u3_as6d_app_crc_gen_lane(/*AUTOINST*/
						   // Outputs
						   .out_idi_tunnel_mode_en(out_mep3_tunnel_mode_en), // Templated
						   .out_idi_header_en	(out_mep3_header_en), // Templated
						   .out_idi_data_type	(out_mep3_data_type[5:0]), // Templated
						   .out_idi_word_count	(out_mep3_word_count[15:0]), // Templated
						   .out_idi_virtual_channel(out_mep3_virtual_channel[3:0]), // Templated
						   .out_idi_data	(out_mep3_csi_data[63:0]), // Templated
						   .out_idi_data_en	(out_mep3_data_en), // Templated
						   .out_idi_byte_en	(out_mep3_byte_en[2:0]), // Templated
						   .out_idi_pkt_crc_en	(out_mep3_pkt_crc_en), // Templated
						   .out_idi_pkt_crc	(out_mep3_pkt_crc[31:0]), // Templated
						   // Inputs
						   .clk			(mep_clk3),	 // Templated
						   .rst_n		(mep_clk_rst_n3), // Templated
						   .reg_app_pkt_crc_gen_dis(reg_app_pkt_crc_gen_dis),
						   .pcs2mep_data_stat	(1'd1),		 // Templated
						   .in_idi_tunnel_mode_en(in_mep3_tunnel_mode_en), // Templated
						   .in_idi_header_en	(in_mep3_header_en), // Templated
						   .in_idi_data_type	(in_mep3_data_type[5:0]), // Templated
						   .in_idi_word_count	(in_mep3_word_count[15:0]), // Templated
						   .in_idi_virtual_channel(in_mep3_virtual_channel[3:0]), // Templated
						   .in_idi_data		(in_mep3_csi_data[63:0]), // Templated
						   .in_idi_data_en	(in_mep3_data_en), // Templated
						   .in_idi_byte_en	(in_mep3_byte_en[2:0])); // Templated

endmodule
