
module as6d_app_video_loss_detect_time_window(/*AUTOARG*/
   // Outputs
   video_loss, video_lock,
   // Inputs
   clk_1M, clk_data, clk_data_rst_n, idi_header_en, idi_data_en,
   time_window, video_loss_en
   );

    input			clk_1M								;
    input			clk_data							;
    input			clk_data_rst_n						;
    input			idi_header_en						;
    input			idi_data_en							;
    input [16:0]	time_window							;
    input			video_loss_en						;
    output			video_loss							;
    output          video_lock                          ;

    //signal define 
    //pkt header inform signal
    reg             idi_header_en_d1_r                  ;
    reg             idi_data_en_d1_r                    ;
    reg             idi_header_en_d2_r                  ;
    reg             idi_data_en_d2_r                    ;
    wire            idi_header_en_re                    ;
    wire            idi_header_en_fe                    ;
    wire            packet_header_active                ;
    reg				packet_active                       ;
    reg				packet_active_nxt                   ;
    //time window count signal
    wire            clk_1M_sync                         ;
    reg	            clk_1M_sync_d1                      ;
    wire	        up_1m_freq                          ;
    reg [79:0]      rtc_us_cnt                          ;
    wire	        long_packet_active                  ;
    wire	        packet_active_wr                    ;
    wire		    emptyz			                    ;
    wire		    fullz			                    ;
    wire		    almost_full		                    ;
    wire [79:0]	    oldest_pkt_time	                    ;
    wire		    read			                    ;
    reg	            video_loss_detect_time_window_tmp   ;
    reg	            video_lock_detect_time_window_tmp   ;
    wire [79:0]     time_difference                     ;
    wire	        video_loss                          ;
    wire	        video_lock                          ;
    reg	[16:0]		data_en_interval					;
    reg	[16:0]		vc_header_en_interval				;
    reg	[16:0]		vc_frame_interval		    		;

    //logic body 
    //counter for clk_1M
    sync2_cell_rstb u_sync2_cell_rstb(
    	.clk		(clk_data		), 
    	.reset_n	(clk_data_rst_n	), 
    	.data		(clk_1M			), 
    	.qout		(clk_1M_sync	));
    
    always@(posedge clk_data or negedge clk_data_rst_n)begin
    	if(~clk_data_rst_n)
    		clk_1M_sync_d1 <= 1'd0 ;
    	else 
    		clk_1M_sync_d1 <= clk_1M_sync ;
    end
    
    assign	up_1m_freq = ~clk_1M_sync_d1 & clk_1M_sync;
    
    
    always@(posedge clk_data or negedge clk_data_rst_n)begin
    	if(~clk_data_rst_n)
    		rtc_us_cnt <= 80'd0;
    	else if(up_1m_freq)
    		rtc_us_cnt <= rtc_us_cnt + 1'd1;
    end

    // Packet Header Info 
    always @ (posedge clk_data or negedge clk_data_rst_n) begin : idi_data_info_d1_r_PROC
        if(~clk_data_rst_n) begin
            idi_header_en_d1_r       <= 1'b0;
            idi_data_en_d1_r         <= 1'b0;
        end
            else begin
                idi_header_en_d1_r       <= idi_header_en;
                idi_data_en_d1_r         <= idi_data_en;
            end
    end 

    always @ (posedge clk_data or negedge clk_data_rst_n) begin : idi_header_en_d2_r_PROC
        if(~clk_data_rst_n)begin
            idi_header_en_d2_r <= 1'b0;
            idi_data_en_d2_r <= 1'b0;
        end
        else begin
            idi_header_en_d2_r <= idi_header_en_d1_r;
            idi_data_en_d2_r <= idi_data_en_d1_r;
        end
    end 

    assign idi_header_en_re = (~idi_header_en_d2_r) & idi_header_en_d1_r;
    assign idi_header_en_fe = (~idi_header_en_d1_r) & idi_header_en_d2_r;

    //In order to ensure the receive packet is whole, packet_active is used to control the packet receive.
    always @ (posedge clk_data or negedge clk_data_rst_n) begin : packet_active_PROC
        if(~clk_data_rst_n)
            packet_active <= 1'b0;
        else
            packet_active <= packet_active_nxt;
    end //packet_active_PROC

    always @ (*) begin
        if(idi_header_en_re)
            packet_active_nxt = 1'b1;
        else
            if(idi_header_en_fe)
                packet_active_nxt = 1'b0;
            else
                packet_active_nxt = packet_active;
    end //packet_active_nxt_PROC

    // Short Packet is active
    assign packet_header_active = packet_active & idi_header_en_fe;

    // Long Packet is active
    assign long_packet_active = idi_header_en_d2_r & idi_data_en_d2_r;

    assign	packet_active_wr = packet_header_active | long_packet_active;
    
    assign	read = almost_full & packet_active_wr;
    
    as6d_app_elastbuf#(
    	.ADDR_DEPTH		(17						),
    	.DATA_WIDTH		(80						)
    ) u_as6d_app_elastbuf(
    	.clk			(clk_data				),//- clock input
    	.rstz    		(clk_data_rst_n			),//,//-//- asynchronous rstz = reset_n
    	.write   		(packet_active_wr		),//,//-//- write enable, active high
    	.datain  		(rtc_us_cnt				),//,//-//- data input
    	.read    		(read					),//,//-//- read enable, active high
    	.dataout 		(oldest_pkt_time		),//,//-//- data output
    	.clrbuff 		(1'd0					),//,//-//- synchronous clear FIFO, active high
    	.emptyz  		(emptyz					),//,//-//- empty, active low
    	.fullz   		(fullz 					),//,//-//- full, active low
    	.almost_full	(almost_full			) // //-//- almost full, remain 1, active high
    );
    
    assign time_difference = (rtc_us_cnt - oldest_pkt_time);

    always @ (posedge clk_data or negedge clk_data_rst_n)
    	if(~clk_data_rst_n)
    		video_loss_detect_time_window_tmp <= 1'b0;
    	else if(almost_full)
    		video_loss_detect_time_window_tmp <= (time_difference > time_window);
    
    always @ (posedge clk_data or negedge clk_data_rst_n)
    	if(~clk_data_rst_n)
    		video_lock_detect_time_window_tmp <= 1'b0;
    	else if(almost_full)
    		video_lock_detect_time_window_tmp <= (time_difference <= time_window);
    
    assign	video_loss = (video_loss_en) ? video_loss_detect_time_window_tmp : 1'd0 ;
    assign	video_lock = (video_loss_en) ? video_lock_detect_time_window_tmp : 1'd0 ;

endmodule
