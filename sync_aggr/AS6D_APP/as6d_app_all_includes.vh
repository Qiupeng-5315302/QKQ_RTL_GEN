
`ifndef __AS6D_APP_ALL_INCLUDES__
`define __AS6D_APP_ALL_INCLUDES__

//mipi header define
typedef struct packed {
    logic               data_flag;
    logic               short_flag;
    logic               footer_flag;
    logic               header_flag;
    logic [83:0]        rsv;
    logic [20:0]        parity;
    logic [15:0]        word_count;
    logic [5:0]         data_type;
    logic [4:0]			virtual_channel;
} app_header;

typedef struct packed {
    logic               data_flag;
    logic               short_flag;
    logic               footer_flag;
    logic               header_flag;
    logic [3:0]			byte_en;
    logic [127:0]		csi_data;
} app_data;

typedef struct packed {
	logic  [63:0]		csi_data			;
	logic  [2:0]		bytes_en			;
	logic               header_en			;
	logic               data_en				;
	logic  [5:0]        data_type			;
	logic  [1:0]		virtual_channel		;
	logic  [1:0]		virtual_channel_x	;
	logic  [15:0]		word_count			;			
	logic       		pkt_crc_en			;			
	logic  [31:0]		pkt_crc	    		;			
} app_idi_if;

typedef struct packed {
	logic  [63:0]		csi_data			;
	logic  [2:0]		bytes_en			;
	logic               header_en			;
	logic               data_en				;
	logic  [5:0]        data_type			;
	logic  [1:0]		virtual_channel		;
	logic  [1:0]		virtual_channel_x	;
	logic  [15:0]		word_count			;			
	logic  [3:0]		aggr_id			    ;			
	logic       		pkt_crc_en			;			
	logic  [31:0]		pkt_crc	    		;			
} app_route_if;

typedef struct packed {
    logic  [64-1:0]    	csi_data;
    logic  [3-1:0]      bytes_en;
    logic               header_en;
    logic               data_en;
    logic  [5:0]        data_type;
    logic  [4-1:0]      virtual_channel;
    logic  [15:0]       word_count;
    logic               pkt_crc_en;
    logic  [31:0]       pkt_crc;
    logic  [7:0]        ecc;
    logic  [16-1:0]     dvalid;
    logic  [16-1:0]     hvalid;
    logic  [16-1:0]     vvalid;			
    logic  [32-1:0]     data_crc;			
} app_idi_host;

typedef struct packed {
    logic  [64-1:0]    	csi_data;
    logic  [3-1:0]      bytes_en;
    logic               header_en;
    logic               data_en;
    logic  [5:0]        data_type;
    logic  [4-1:0]      virtual_channel;
    logic  [15:0]       word_count;
    logic               tunnel_mode_en;
    logic               pkt_crc_en;
    logic  [31:0]       pkt_crc;
} app_idi_tunnel;
`endif
