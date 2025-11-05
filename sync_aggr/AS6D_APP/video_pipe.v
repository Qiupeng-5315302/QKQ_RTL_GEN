
module video_pipe(/*AUTOARG*/
   // Outputs
   mep_tx_idi_data_storage_fifo_rdata,
   mep_tx_idi_data_storage_fifo_full,
   mep_tx_idi_data_storage_fifo_aful,
   mep_tx_idi_data_storage_fifo_empty,
   mep_tx_idi_data_storage_fifo_amty,
   // Inputs
   clk_data, rst_n, csi_data, bytes_en, header_en, data_en, data_type,
   data_parity, virtual_channel, virtual_channel_x, word_count,
   mep2pcs_clk_data, mep2pcs_rst_n, mep_tx_idi_data_storage_fifo_rd
   );
    //inputs
    input												clk_data;
    input                                             	rst_n;
    input  [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]      	csi_data;
    input  [(`CSI2_DEVICE_IDI_DATA_BYTEEN_WIDTH-1):0] 	bytes_en;
    input                                             	header_en;
    input                                             	data_en;
    input  [5:0]                                      	data_type;
    input  [(`CSI2_DEVICE_IDI_DATA_PARITY_WIDTH-1):0] 	data_parity;
    input  [1:0]										virtual_channel;
    input  [(`CSI2_DEVICE_VCX_DWIDTH-1):0]              virtual_channel_x;
    input  [15:0]										word_count;

    input												mep2pcs_clk_data;
    input                                             	mep2pcs_rst_n;
    input                                             	mep_tx_idi_data_storage_fifo_rd;

    //outputs
    output [(`CSI2_DEVICE_IDI_CSIDATA_SIZE+3):0]        mep_tx_idi_data_storage_fifo_rdata;
    output												mep_tx_idi_data_storage_fifo_full;
    output                                            	mep_tx_idi_data_storage_fifo_aful;
    output                                            	mep_tx_idi_data_storage_fifo_empty;
    output                                            	mep_tx_idi_data_storage_fifo_amty;

    //signal definition
    reg                                               header_en_d1;
    wire                                              header_en_flag;
    reg                                               header_en_flag_d1;
    wire                                              footer_en_flag;
    reg                                               footer_en_flag_d1;
    wire                                              short_packet_en;
    reg                                               data_en_d1;
    reg  [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]          csi_data_d1;

         mep_tx_idi_header                            mep_tx_idi_header_w_pre;
         mep_tx_idi_header                            mep_tx_idi_header_w_pre_d1;
         mep_tx_idi_header                            mep_tx_idi_header_w;
         mep_tx_idi_data                              mep_tx_idi_data_w_pre;
         mep_tx_idi_data                              mep_tx_idi_data_w_pre_d1;
         mep_tx_idi_data                              mep_tx_idi_data_w;

    wire                                              data_mapped_en;
    wire [(`CSI2_DEVICE_IDI_CSIDATA_SIZE-1):0]          csi_data_mapped;
    wire                                              mep_tx_idi_data_storage_fifo_wr;
    reg  [(`CSI2_DEVICE_IDI_CSIDATA_SIZE+3):0]          mep_tx_idi_data_storage_fifo_wdata;

    //logic body
    always @(posedge clk_data or negedge rst_n) begin
        if(!rst_n) begin
            header_en_d1 <= 1'b0;
        end
        else begin
            header_en_d1 <= header_en;
        end
    end

    always @(posedge clk_data or negedge rst_n) begin
        if(!rst_n) begin
            data_en_d1 <= 1'b0;
        end
        else begin
            data_en_d1 <= data_en;
        end
    end

    always @(posedge clk_data or negedge rst_n) begin
        if(!rst_n) begin
            header_en_flag_d1 <= 1'b0;
        end
        else begin
            header_en_flag_d1 <= header_en_flag;
        end
    end

    always @(posedge clk_data or negedge rst_n) begin
        if(!rst_n) begin
            footer_en_flag_d1 <= 1'b0;
        end
        else begin
            footer_en_flag_d1 <= footer_en_flag;
        end
    end

    always @(posedge clk_data or negedge rst_n) begin
        if(!rst_n) begin
            mep_tx_idi_header_w_pre_d1 <= {(`CSI2_DEVICE_IDI_CSIDATA_SIZE + 4){1'b0}};
        end
        else begin
            mep_tx_idi_header_w_pre_d1 <= mep_tx_idi_header_w_pre;
        end
    end

    always @(posedge clk_data or negedge rst_n) begin
        if(!rst_n) begin
            mep_tx_idi_data_w_pre_d1 <= {(`CSI2_DEVICE_IDI_CSIDATA_SIZE + 4){1'b0}};
        end
        else begin
            mep_tx_idi_data_w_pre_d1 <= mep_tx_idi_data_w_pre;
        end
    end

    assign header_en_flag = header_en && (~header_en_d1);
    assign footer_en_flag = (~header_en) && header_en_d1;
    assign short_packet_en = header_en_flag_d1 && footer_en_flag;

    assign mep_tx_idi_header_w_pre.data_en         = 1'b0;
    assign mep_tx_idi_header_w_pre.short_packet_en = 1'b0;
    assign mep_tx_idi_header_w_pre.footer_en_flag  = 1'b0;
    assign mep_tx_idi_header_w_pre.header_en_flag  = 1'b0;
    assign mep_tx_idi_header_w_pre.rsv             = 30'b0;
    assign mep_tx_idi_header_w_pre.ecc             = 'b0;
    assign mep_tx_idi_header_w_pre.word_count      = word_count;
    assign mep_tx_idi_header_w_pre.data_type       = data_type;
    assign mep_tx_idi_header_w_pre.virtual_channel = {virtual_channel,virtual_channel_x};

    assign mep_tx_idi_header_w.data_en         = mep_tx_idi_header_w_pre_d1.data_en;
    assign mep_tx_idi_header_w.short_packet_en = short_packet_en;
    assign mep_tx_idi_header_w.footer_en_flag  = footer_en_flag_d1;
    assign mep_tx_idi_header_w.header_en_flag  = header_en_flag_d1;
    assign mep_tx_idi_header_w.rsv             = 30'b0;
    assign mep_tx_idi_header_w.ecc             = 'b0;
    assign mep_tx_idi_header_w.word_count      = mep_tx_idi_header_w_pre_d1.word_count;
    assign mep_tx_idi_header_w.data_type       = mep_tx_idi_header_w_pre_d1.data_type;
    assign mep_tx_idi_header_w.virtual_channel = mep_tx_idi_header_w_pre_d1.virtual_channel;

    assign mep_tx_idi_data_w_pre.data_en         = data_en;
    assign mep_tx_idi_data_w_pre.short_packet_en = 1'b0;
    assign mep_tx_idi_data_w_pre.footer_en_flag  = 1'b0;
    assign mep_tx_idi_data_w_pre.header_en_flag  = 1'b0;
    assign mep_tx_idi_data_w_pre.csi_data        = csi_data;

    assign mep_tx_idi_data_w.data_en         = data_mapped_en;
    assign mep_tx_idi_data_w.short_packet_en = mep_tx_idi_data_w_pre_d1.short_packet_en;
    assign mep_tx_idi_data_w.footer_en_flag  = footer_en_flag_d1;
    assign mep_tx_idi_data_w.header_en_flag  = mep_tx_idi_data_w_pre_d1.header_en_flag;
    assign mep_tx_idi_data_w.csi_data        = csi_data_mapped;
  
    
    assign mep_tx_idi_data_storage_fifo_wr = mep_tx_idi_header_w.header_en_flag || mep_tx_idi_data_w.data_en;
                                             
    always @(*) begin
        if(mep_tx_idi_header_w.header_en_flag) begin
            mep_tx_idi_data_storage_fifo_wdata = mep_tx_idi_header_w;
        end
        else if(mep_tx_idi_data_w.data_en) begin
            mep_tx_idi_data_storage_fifo_wdata = mep_tx_idi_data_w;
        end
//        else if(mep_tx_idi_data_w.footer_en_flag)begin
//            mep_tx_idi_data_storage_fifo_wdata = mep_tx_idi_data_w;
//        end
        else begin
            mep_tx_idi_data_storage_fifo_wdata = {(`CSI2_DEVICE_IDI_CSIDATA_SIZE + 4){1'b0}};
        end
    end

    data_mapping data_mapping_app (
        .clk_data            ( clk_data        ),
        .rst_n               ( rst_n           ),
        .header_en_flag      ( header_en_flag  ),
        .footer_en_flag      ( footer_en_flag  ),
        .data_type           ( data_type       ),
        .csi_data            ( csi_data        ),
        .data_en             ( data_en         ),
        .out_csi_data_mapped ( csi_data_mapped ),
        .out_data_mapped_en  ( data_mapped_en  )
    );

    generic_fifo #(
        .DWIDTH              ( `CSI2_DEVICE_IDI_CSIDATA_SIZE + 4 ),
        .AWIDTH              ( 10                              ),
        .EARLY_READ          ( 1                               ),
        .CLOCK_CROSSING      ( 1                               ),
        .ALMOST_EMPTY_THRESH ( 6                               ),
        .ALMOST_FULL_THRESH  ( 1020                            )
    )u_mep_tx_data_storage_fifo_app (
        //inputs
        .wclk          ( clk_data                           ),
        .wrst_n        ( rst_n                              ),
        .wen           ( mep_tx_idi_data_storage_fifo_wr    ),
        .wdata         ( mep_tx_idi_data_storage_fifo_wdata ),
        .wfull         ( mep_tx_idi_data_storage_fifo_full  ),
        .walmost_full  ( mep_tx_idi_data_storage_fifo_aful  ),
        //outputs
        .rclk          ( mep2pcs_clk_data                   ),
        .rrst_n        ( mep2pcs_rst_n                      ),
        .ren           ( mep_tx_idi_data_storage_fifo_rd    ),
        .rdata         ( mep_tx_idi_data_storage_fifo_rdata ),
        .rempty        ( mep_tx_idi_data_storage_fifo_empty ),
        .ralmost_empty ( mep_tx_idi_data_storage_fifo_amty  )
    );

endmodule 
