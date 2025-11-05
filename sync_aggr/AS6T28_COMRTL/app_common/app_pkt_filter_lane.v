
module   app_pkt_filter_lane (/*AUTOARG*/
   // Outputs
   out_csi_data, out_bytes_en, out_header_en, out_data_en,
   out_data_type, out_virtual_channel, out_word_count, out_pkt_crc_en,
   out_pkt_crc, out_ecc, out_dvalid, out_hvalid, out_vvalid,
   out_data_crc,
   // Inputs
   app_clk_data, app_clk_rst_n, reg_mem_dt1_selz, reg_mem_dt2_selz,
   reg_mem_dt7_selz, reg_mem_dt8_selz, reg_mem_dt3_selz,
   reg_mem_dt4_selz, reg_mem_dt3_selz_en, reg_mem_dt4_selz_en,
   reg_vc_selz_l, reg_vc_selz_h, in_csi_data, in_bytes_en,
   in_header_en, in_data_en, in_data_type, in_virtual_channel,
   in_word_count, in_pkt_crc_en, in_pkt_crc, in_ecc, in_dvalid,
   in_hvalid, in_vvalid, in_data_crc
   );

output  [64-1:0]  out_csi_data            ;
output  [3-1:0]   out_bytes_en            ;
output            out_header_en           ;
output            out_data_en             ;
output  [5:0]     out_data_type           ;
output  [4-1:0]   out_virtual_channel     ;
output  [15:0]    out_word_count          ;
output            out_pkt_crc_en          ;
output  [31:0]    out_pkt_crc             ;
output  [7:0]     out_ecc                 ;
output  [16-1:0]  out_dvalid              ;
output  [16-1:0]  out_hvalid              ;
output  [16-1:0]  out_vvalid              ;
output  [32-1:0]  out_data_crc            ;

input             app_clk_data            ;
input             app_clk_rst_n           ;

input   [6:0]     reg_mem_dt1_selz        ;
input   [6:0]     reg_mem_dt2_selz        ;
input   [6:0]     reg_mem_dt7_selz        ;
input   [6:0]     reg_mem_dt8_selz        ;
input   [7:0]     reg_mem_dt3_selz        ;
input   [7:0]     reg_mem_dt4_selz        ;
input             reg_mem_dt3_selz_en     ;
input             reg_mem_dt4_selz_en     ;
input   [7:0]     reg_vc_selz_l           ;
input   [7:0]     reg_vc_selz_h           ;

input   [64-1:0]  in_csi_data             ;
input   [3-1:0]   in_bytes_en             ;
input             in_header_en            ;
input             in_data_en              ;
input   [5:0]     in_data_type            ;
input   [4-1:0]   in_virtual_channel      ;
input   [15:0]    in_word_count           ;
input             in_pkt_crc_en           ;
input   [31:0]    in_pkt_crc              ;
input   [7:0]     in_ecc                  ;
input   [16-1:0]  in_dvalid               ;
input   [16-1:0]  in_hvalid               ;
input   [16-1:0]  in_vvalid               ;
input   [32-1:0]  in_data_crc             ;

reg               dt_enable_flag1         ;
reg               dt_enable_flag2         ;
reg               dt_enable_flag3         ;
reg               dt_enable_flag4         ;
reg               dtvc_enable_flag5       ;
reg               dtvc_enable_flag6       ;
reg               vc_enable_flag7         ;
reg               vc_enable_flag8         ;
wire              dt_enable_d1            ;
wire              dtvc_enable_d2          ;
wire              vc_enable_d3            ;

app_idi_host    app_idi_i        ;
app_idi_host    app_idi_d1       ;
app_idi_host    app_idi_d1_pre   ;
app_idi_host    app_idi_d2       ;
app_idi_host    app_idi_d2_pre   ;
app_idi_host    app_idi_d3       ;
app_idi_host    app_idi_d3_pre   ;
app_idi_host    app_idi_d4       ;
app_idi_host    app_idi_o        ;

//32+`MEP_CSI2_HOST_IDI_CSIDATA_SIZE+`MEP_CSI2_HOST_BYTES_EN_SIZE+`MEP_CSI2_HOST_VC_WIDTH+(3*`MEP_CSI2_HOST_N_VIRT_CH)+crc+crc_en;
localparam    IDI_BUS_WIDTH = 32+64+3+4+(3*16)+32+32+1;

assign    app_idi_i.csi_data        = in_csi_data                   ;
assign    app_idi_i.bytes_en        = in_bytes_en                   ;
assign    app_idi_i.header_en       = in_header_en                  ;
assign    app_idi_i.data_en         = in_data_en                    ;
assign    app_idi_i.data_type       = in_data_type                  ;
assign    app_idi_i.virtual_channel = in_virtual_channel            ;
assign    app_idi_i.word_count      = in_word_count                 ;
assign    app_idi_i.ecc             = in_ecc                        ;
assign    app_idi_i.pkt_crc_en      = in_pkt_crc_en                 ;
assign    app_idi_i.pkt_crc         = in_pkt_crc                    ;
assign    app_idi_i.dvalid          = in_dvalid                     ;
assign    app_idi_i.hvalid          = in_hvalid                     ;
assign    app_idi_i.vvalid          = in_vvalid                     ;
assign    app_idi_i.data_crc        = in_data_crc                   ;
assign    out_csi_data              = app_idi_d3.csi_data           ;
assign    out_bytes_en              = app_idi_d3.bytes_en           ;
assign    out_header_en             = app_idi_d3.header_en          ;
assign    out_data_en               = app_idi_d3.data_en            ;
assign    out_data_type             = app_idi_d3.data_type          ;
assign    out_virtual_channel       = app_idi_d3.virtual_channel    ;
assign    out_word_count            = app_idi_d3.word_count         ;
assign    out_ecc                   = app_idi_d3.ecc                ;
assign    out_pkt_crc_en            = app_idi_d3.pkt_crc_en         ;
assign    out_pkt_crc               = app_idi_d3.pkt_crc            ;
assign    out_dvalid                = app_idi_d3.dvalid             ;
assign    out_hvalid                = app_idi_d3.hvalid             ;
assign    out_vvalid                = app_idi_d3.vvalid             ;           
assign    out_data_crc              = app_idi_d3.data_crc           ;           

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        dt_enable_flag1 <= 1'd0;
    //permit csi short packet
    else if((reg_mem_dt1_selz[6])&&(app_idi_i.data_type[5:2]==4'd0)&&app_idi_i.header_en)
        dt_enable_flag1 <= 1'd1;
    else if((reg_mem_dt1_selz[6])&&(app_idi_i.data_type==reg_mem_dt1_selz[5:0])&&app_idi_i.header_en)
        dt_enable_flag1 <= 1'd1;
    else
        dt_enable_flag1 <= 1'd0;
end

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        dt_enable_flag2 <= 1'd0;
    else if((reg_mem_dt2_selz[6])&&(app_idi_i.data_type[5:2]==4'd0)&&app_idi_i.header_en)
        dt_enable_flag2 <= 1'd1;
    else if((reg_mem_dt2_selz[6])&&(app_idi_i.data_type==reg_mem_dt2_selz[5:0])&&app_idi_i.header_en)
        dt_enable_flag2 <= 1'd1;
    else
        dt_enable_flag2 <= 1'd0;
end

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        dt_enable_flag3 <= 1'd0;
    else if((reg_mem_dt7_selz[6])&&(app_idi_i.data_type[5:2]==4'd0)&&app_idi_i.header_en)
        dt_enable_flag3 <= 1'd1;
    else if((reg_mem_dt7_selz[6])&&(app_idi_i.data_type==reg_mem_dt7_selz[5:0])&&app_idi_i.header_en)
        dt_enable_flag3 <= 1'd1;
    else
        dt_enable_flag3 <= 1'd0;
end

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        dt_enable_flag4 <= 1'd0;
    else if((reg_mem_dt8_selz[6])&&(app_idi_i.data_type[5:2]==4'd0)&&app_idi_i.header_en)
        dt_enable_flag4 <= 1'd1;
    else if((reg_mem_dt8_selz[6])&&(app_idi_i.data_type==reg_mem_dt8_selz[5:0])&&app_idi_i.header_en)
        dt_enable_flag4 <= 1'd1;
    else
        dt_enable_flag4 <= 1'd0;
end

assign dt_enable_d1 = (reg_mem_dt1_selz[6]|reg_mem_dt2_selz[6]|reg_mem_dt7_selz[6]|reg_mem_dt8_selz[6]) ? (dt_enable_flag1|dt_enable_flag2|dt_enable_flag3|dt_enable_flag4) : 1'd1;

/*    bus_delay    AUTO_TEMPLATE(
    .clk    (app_clk_data),
    .rst_n  (app_clk_rst_n),
    .inbus  (app_idi_i),
    .outbus (app_idi_d1_pre),
);*/
bus_delay #(
    .DELAY_CYCLES (1),
    .BUS_WIDTH    (IDI_BUS_WIDTH)
)u0_bus_delay(
	     .outbus		(app_idi_d1_pre),	
	     .inbus			(app_idi_i),	
        /*AUTOINST*/
	      // Inputs
	      .clk			(app_clk_data),		 // Templated
	      .rst_n			(app_clk_rst_n));	 // Templated

assign app_idi_d1 = app_idi_d1_pre & {IDI_BUS_WIDTH{dt_enable_d1}};

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        dtvc_enable_flag5 <= 1'd0;
    //permit csi short packet within select vc
    else if((reg_mem_dt3_selz_en)&&({app_idi_d1.virtual_channel[1:0],app_idi_d1.data_type[5:2]}=={reg_mem_dt3_selz[7:6],4'd0})&&app_idi_d1.header_en)
        dtvc_enable_flag5 <= 1'd1;
    else if((reg_mem_dt3_selz_en)&&({app_idi_d1.virtual_channel[1:0],app_idi_d1.data_type}==reg_mem_dt3_selz[7:0])&&app_idi_d1.header_en)
        dtvc_enable_flag5 <= 1'd1;
    else
        dtvc_enable_flag5 <= 1'd0;
end

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        dtvc_enable_flag6 <= 1'd0;
    else if((reg_mem_dt4_selz_en)&&({app_idi_d1.virtual_channel[1:0],app_idi_d1.data_type[5:2]}=={reg_mem_dt4_selz[7:6],4'd0})&&app_idi_d1.header_en)
        dtvc_enable_flag6 <= 1'd1;
    else if((reg_mem_dt4_selz_en)&&({app_idi_d1.virtual_channel[1:0],app_idi_d1.data_type}==reg_mem_dt4_selz[7:0])&&app_idi_d1.header_en)
        dtvc_enable_flag6 <= 1'd1;
    else
        dtvc_enable_flag6 <= 1'd0;
end

assign dtvc_enable_d2 = (reg_mem_dt3_selz_en|reg_mem_dt4_selz_en) ? (dtvc_enable_flag5|dtvc_enable_flag6) : 1'd1 ;

/*    bus_delay    AUTO_TEMPLATE(
    .clk    (app_clk_data),
    .rst_n    (app_clk_rst_n),
    .inbus    (app_idi_d1),
    .outbus    (app_idi_d2_pre),
);*/
bus_delay #(
    .DELAY_CYCLES (1),
    .BUS_WIDTH    (IDI_BUS_WIDTH)
)u1_bus_delay(
	     .outbus		(app_idi_d2_pre),
	     .inbus			(app_idi_d1),		 
        /*AUTOINST*/
	      // Inputs
	      .clk			(app_clk_data),		 // Templated
	      .rst_n			(app_clk_rst_n));	 // Templated

assign app_idi_d2 = app_idi_d2_pre & {IDI_BUS_WIDTH{dtvc_enable_d2}};

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        vc_enable_flag7 <= 1'd0;
    else if((reg_vc_selz_l[0])&&(app_idi_d2.virtual_channel[3:0]==4'd0)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;                                                
    else if((reg_vc_selz_l[1])&&(app_idi_d2.virtual_channel[3:0]==4'd1)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;                                                
    else if((reg_vc_selz_l[2])&&(app_idi_d2.virtual_channel[3:0]==4'd2)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;                                                
    else if((reg_vc_selz_l[3])&&(app_idi_d2.virtual_channel[3:0]==4'd3)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;                                                
    else if((reg_vc_selz_l[4])&&(app_idi_d2.virtual_channel[3:0]==4'd4)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;                                                
    else if((reg_vc_selz_l[5])&&(app_idi_d2.virtual_channel[3:0]==4'd5)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;                                                
    else if((reg_vc_selz_l[6])&&(app_idi_d2.virtual_channel[3:0]==4'd6)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;                                                
    else if((reg_vc_selz_l[7])&&(app_idi_d2.virtual_channel[3:0]==4'd7)&&app_idi_d2.header_en)
        vc_enable_flag7 <= 1'd1;
    else 
        vc_enable_flag7 <= 1'd0;
end

always@(posedge app_clk_data or negedge app_clk_rst_n)begin
    if(~app_clk_rst_n)
        vc_enable_flag8 <= 1'd0;
    else if((reg_vc_selz_h[0])&&(app_idi_d2.virtual_channel[3:0]==4'd8)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;                                                
    else if((reg_vc_selz_h[1])&&(app_idi_d2.virtual_channel[3:0]==4'd9)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;                                                
    else if((reg_vc_selz_h[2])&&(app_idi_d2.virtual_channel[3:0]==4'd10)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;                                                
    else if((reg_vc_selz_h[3])&&(app_idi_d2.virtual_channel[3:0]==4'd11)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;                                                
    else if((reg_vc_selz_h[4])&&(app_idi_d2.virtual_channel[3:0]==4'd12)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;                                                
    else if((reg_vc_selz_h[5])&&(app_idi_d2.virtual_channel[3:0]==4'd13)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;                                                
    else if((reg_vc_selz_h[6])&&(app_idi_d2.virtual_channel[3:0]==4'd14)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;                                                
    else if((reg_vc_selz_h[7])&&(app_idi_d2.virtual_channel[3:0]==4'd15)&&app_idi_d2.header_en)
        vc_enable_flag8 <= 1'd1;
    else 
        vc_enable_flag8 <= 1'd0;
end

assign vc_enable_d3 = vc_enable_flag7 | vc_enable_flag8;

/*    bus_delay    AUTO_TEMPLATE(
    .clk    (app_clk_data),
    .rst_n  (app_clk_rst_n),
    .inbus  (app_idi_d2),
    .outbus (app_idi_d3_pre),
);*/
bus_delay #(
    .DELAY_CYCLES (1),
    .BUS_WIDTH    (IDI_BUS_WIDTH)
)u2_bus_delay(
	     .outbus		(app_idi_d3_pre),
	     .inbus			(app_idi_d2),
         /*AUTOINST*/
	      // Inputs
	      .clk			(app_clk_data),		 // Templated
	      .rst_n			(app_clk_rst_n));	 // Templated

assign app_idi_d3 = app_idi_d3_pre & {IDI_BUS_WIDTH{vc_enable_d3}};


endmodule 
//Local Variables:
//verilog-auto-inst-param-value : t
//verilog-library-files:("../BUS_DELAY/bus_delay.v")
//verilog-library-extensions:(".v"".vh"".sv"".svh")
//End:

