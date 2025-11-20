
//DUT output
assign idi_if_out[0].clk_data                    = `AGG_PATH.aggre_clk0; 
assign idi_if_out[0].world_count                 = `AGG_PATH.aggr0_idi_word_count; 
assign idi_if_out[0].byte_en                     = `AGG_PATH.aggr0_idi_byte_en; 
assign idi_if_out[0].header_en                   = `AGG_PATH.aggr0_idi_header_en; 
assign idi_if_out[0].data_en                     = `AGG_PATH.aggr0_idi_data_en; 
assign idi_if_out[0].csi_data                    = `AGG_PATH.aggr0_idi_data[63:0]; 
assign idi_if_out[0].csi_data_msb                = `AGG_PATH.aggr0_idi_data[127:64]; 
assign idi_if_out[0].virtual_channel[1:0]        = `AGG_PATH.aggr0_idi_virtual_channel; 
assign idi_if_out[0].virtual_channel[3:2]        = `AGG_PATH.aggr0_idi_virtual_channel_x; 
assign idi_if_out[0].data_type                   = `AGG_PATH.aggr0_idi_data_type; 

assign idi_if_out[1].clk_data                    = `AGG_PATH.aggre_clk1; 
assign idi_if_out[1].world_count                 = `AGG_PATH.aggr1_idi_word_count;        
assign idi_if_out[1].byte_en                     = `AGG_PATH.aggr1_idi_byte_en;           
assign idi_if_out[1].header_en                   = `AGG_PATH.aggr1_idi_header_en;         
assign idi_if_out[1].data_en                     = `AGG_PATH.aggr1_idi_data_en;           
assign idi_if_out[1].csi_data                    = `AGG_PATH.aggr1_idi_data[63:0]; 
assign idi_if_out[1].csi_data_msb                = `AGG_PATH.aggr1_idi_data[127:64]; 
assign idi_if_out[1].virtual_channel[1:0]        = `AGG_PATH.aggr1_idi_virtual_channel;   
assign idi_if_out[1].virtual_channel[3:2]        = `AGG_PATH.aggr1_idi_virtual_channel_x; 
assign idi_if_out[1].data_type                   = `AGG_PATH.aggr1_idi_data_type; 

assign idi_if_out[2].clk_data                    = `AGG_PATH.aggre_clk2; 
assign idi_if_out[2].world_count                 = `AGG_PATH.aggr2_idi_word_count;        
assign idi_if_out[2].byte_en                     = `AGG_PATH.aggr2_idi_byte_en;           
assign idi_if_out[2].header_en                   = `AGG_PATH.aggr2_idi_header_en;         
assign idi_if_out[2].data_en                     = `AGG_PATH.aggr2_idi_data_en;           
assign idi_if_out[2].csi_data                    = `AGG_PATH.aggr2_idi_data[63:0]; 
assign idi_if_out[2].csi_data_msb                = `AGG_PATH.aggr2_idi_data[127:64]; 
assign idi_if_out[2].virtual_channel[1:0]        = `AGG_PATH.aggr2_idi_virtual_channel;   
assign idi_if_out[2].virtual_channel[3:2]        = `AGG_PATH.aggr2_idi_virtual_channel_x; 
assign idi_if_out[2].data_type                   = `AGG_PATH.aggr2_idi_data_type;  

assign idi_if_out[3].clk_data                    = `AGG_PATH.aggre_clk3; 
assign idi_if_out[3].world_count                 = `AGG_PATH.aggr3_idi_word_count;        
assign idi_if_out[3].byte_en                     = `AGG_PATH.aggr3_idi_byte_en;           
assign idi_if_out[3].header_en                   = `AGG_PATH.aggr3_idi_header_en;         
assign idi_if_out[3].data_en                     = `AGG_PATH.aggr3_idi_data_en;           
assign idi_if_out[3].csi_data                    = `AGG_PATH.aggr3_idi_data[63:0]; 
assign idi_if_out[3].csi_data_msb                = `AGG_PATH.aggr3_idi_data[127:64]; 
assign idi_if_out[3].virtual_channel[1:0]        = `AGG_PATH.aggr3_idi_virtual_channel;   
assign idi_if_out[3].virtual_channel[3:2]        = `AGG_PATH.aggr3_idi_virtual_channel_x; 
assign idi_if_out[3].data_type                   = `AGG_PATH.aggr3_idi_data_type; 



//DUT input
assign idi_if_in[0].clk_data                    = `AGG_PATH.fifo_wrclk0; 
assign idi_if_in[0].world_count                 = `AGG_PATH.mep0_word_count; 
assign idi_if_in[0].byte_en                     = `AGG_PATH.mep0_byte_en; 
assign idi_if_in[0].header_en                   = `AGG_PATH.mep0_header_en; 
assign idi_if_in[0].data_en                     = `AGG_PATH.mep0_data_en; 
assign idi_if_in[0].csi_data                    = `AGG_PATH.mep0_csi_data[63:0]; 
assign idi_if_in[0].virtual_channel[1:0]        = `AGG_PATH.mep0_virtual_channel; 
assign idi_if_in[0].virtual_channel[3:2]        = `AGG_PATH.mep0_virtual_channel_x; 
assign idi_if_in[0].data_type                   = `AGG_PATH.mep0_data_type; 

assign idi_if_in[1].clk_data                    = `AGG_PATH.fifo_wrclk1; 
assign idi_if_in[1].world_count                 = `AGG_PATH.mep1_word_count;        
assign idi_if_in[1].byte_en                     = `AGG_PATH.mep1_byte_en;           
assign idi_if_in[1].header_en                   = `AGG_PATH.mep1_header_en;         
assign idi_if_in[1].data_en                     = `AGG_PATH.mep1_data_en;           
assign idi_if_in[1].csi_data                    = `AGG_PATH.mep1_csi_data[63:0]; 
assign idi_if_in[1].virtual_channel[1:0]        = `AGG_PATH.mep1_virtual_channel;   
assign idi_if_in[1].virtual_channel[3:2]        = `AGG_PATH.mep1_virtual_channel_x; 
assign idi_if_in[1].data_type                   = `AGG_PATH.mep1_data_type; 

assign idi_if_in[2].clk_data                    = `AGG_PATH.fifo_wrclk2; 
assign idi_if_in[2].world_count                 = `AGG_PATH.mep2_word_count;        
assign idi_if_in[2].byte_en                     = `AGG_PATH.mep2_byte_en;           
assign idi_if_in[2].header_en                   = `AGG_PATH.mep2_header_en;         
assign idi_if_in[2].data_en                     = `AGG_PATH.mep2_data_en;           
assign idi_if_in[2].csi_data                    = `AGG_PATH.mep2_csi_data[63:0]; 
assign idi_if_in[2].virtual_channel[1:0]        = `AGG_PATH.mep2_virtual_channel;   
assign idi_if_in[2].virtual_channel[3:2]        = `AGG_PATH.mep2_virtual_channel_x; 
assign idi_if_in[2].data_type                   = `AGG_PATH.mep2_data_type;  

assign idi_if_in[3].clk_data                    = `AGG_PATH.fifo_wrclk3; 
assign idi_if_in[3].world_count                 = `AGG_PATH.mep3_word_count;        
assign idi_if_in[3].byte_en                     = `AGG_PATH.mep3_byte_en;           
assign idi_if_in[3].header_en                   = `AGG_PATH.mep3_header_en;         
assign idi_if_in[3].data_en                     = `AGG_PATH.mep3_data_en;           
assign idi_if_in[3].csi_data                    = `AGG_PATH.mep3_csi_data[63:0]; 
assign idi_if_in[3].virtual_channel[1:0]        = `AGG_PATH.mep3_virtual_channel;   
assign idi_if_in[3].virtual_channel[3:2]        = `AGG_PATH.mep3_virtual_channel_x; 
assign idi_if_in[3].data_type                   = `AGG_PATH.mep3_data_type; 
