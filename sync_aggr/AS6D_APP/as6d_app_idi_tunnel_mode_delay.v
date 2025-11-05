
module as6d_app_idi_tunnel_mode_delay (/*AUTOARG*/
   // Outputs
   tdi_en, out_bytes_en, out_csi_data, out_data_en, out_data_type,
   out_header_en, out_virtual_channel, out_word_count,
   out_tunnel_mode_en, out_pkt_crc_en, out_pkt_crc,
   // Inputs
   clk, rst_n, reg_mep_tdi_en_force, reg_mep_tdi_en, in_bytes_en,
   in_csi_data, in_data_en, in_data_type, in_header_en,
   in_virtual_channel, in_word_count, in_tunnel_mode_en,
   in_pkt_crc_en, in_pkt_crc
   );

    output	    	    tdi_en                      ;
    output	[2:0]	    out_bytes_en                ;
    output	[63:0]      out_csi_data                ;
    output	  	        out_data_en                 ;
    output	[5:0]	    out_data_type               ;
    output	  	        out_header_en               ;
    output	[3:0]	    out_virtual_channel         ;
    output	[15:0]      out_word_count              ;
    output	            out_tunnel_mode_en          ;
    output	            out_pkt_crc_en              ;
    output	[31:0]      out_pkt_crc                 ;
    
    input               clk                         ;
    input               rst_n                       ;
    input               reg_mep_tdi_en_force        ;
    input               reg_mep_tdi_en              ;
    input	[2:0]	    in_bytes_en                 ;
    input	[63:0]      in_csi_data                 ;
    input	  	        in_data_en                  ;
    input	[5:0]	    in_data_type                ;
    input	  	        in_header_en                ;
    input	[3:0]	    in_virtual_channel          ;
    input	[15:0]      in_word_count               ;
    input	            in_tunnel_mode_en           ;
    input	            in_pkt_crc_en               ;
    input	[31:0]      in_pkt_crc                  ;

    reg                 tunnel_mode_lock            ;
    
    app_idi_tunnel  app_idi_tunnel_pre;
    app_idi_tunnel  app_idi_tunnel_d1;
    
    assign	app_idi_tunnel_pre.bytes_en             =   in_bytes_en       ;
    assign	app_idi_tunnel_pre.csi_data             =   in_csi_data       ;
    assign	app_idi_tunnel_pre.data_en	            =   in_data_en	      ;
    assign	app_idi_tunnel_pre.data_type            =   in_data_type      ;
    assign	app_idi_tunnel_pre.header_en            =   in_header_en      ;
    assign	app_idi_tunnel_pre.virtual_channel      =   in_virtual_channel;	
    assign	app_idi_tunnel_pre.word_count           =   in_word_count     ;
    assign	app_idi_tunnel_pre.tunnel_mode_en       =   in_tunnel_mode_en ;
    assign	app_idi_tunnel_pre.pkt_crc_en           =   in_pkt_crc_en     ;
    assign	app_idi_tunnel_pre.pkt_crc              =   in_pkt_crc        ;
    
    assign	out_bytes_en        = app_idi_tunnel_d1.bytes_en        ;
    assign	out_csi_data        = app_idi_tunnel_d1.csi_data        ;
    assign	out_data_en	        = app_idi_tunnel_d1.data_en	        ;
    assign	out_data_type       = app_idi_tunnel_d1.data_type       ;
    assign	out_header_en       = app_idi_tunnel_d1.header_en       ;
    assign	out_virtual_channel = app_idi_tunnel_d1.virtual_channel ;
    assign	out_word_count      = app_idi_tunnel_d1.word_count      ;
    assign	out_tunnel_mode_en  = app_idi_tunnel_d1.tunnel_mode_en  ;
    assign	out_pkt_crc_en      = app_idi_tunnel_d1.pkt_crc_en  ;
    assign	out_pkt_crc         = app_idi_tunnel_d1.pkt_crc     ;
    
    //app_idi_tunnel DW = 129
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)
            app_idi_tunnel_d1 <= 129'd0;
        else
            app_idi_tunnel_d1 <= app_idi_tunnel_pre;
    end
    
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)
            tunnel_mode_lock <= 1'd0;
        else if(app_idi_tunnel_pre.tunnel_mode_en)
            tunnel_mode_lock <= 1'd1;
    end
    
    assign  tdi_en  = reg_mep_tdi_en_force ? reg_mep_tdi_en : tunnel_mode_lock ;
    
endmodule
