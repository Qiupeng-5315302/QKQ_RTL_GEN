
task clk_force_1();
    force ppi_clk3          = clk_98M    ;  
    force ppi_clk2          = clk_99M    ;  
    force ppi_clk1          = clk_100M   ;   
    force ppi_clk0          = clk_101M   ;   
    force fifo_wrclk7       = clk_98M    ;
    force fifo_wrclk6       = clk_99M    ;
    force fifo_wrclk5       = clk_100M   ;
    force fifo_wrclk4       = clk_101M   ;
    force fifo_wrclk3       = clk_98M    ;
    force fifo_wrclk2       = clk_99M    ;
    force fifo_wrclk1       = clk_100M   ;
    force fifo_wrclk0       = clk_101M   ;
   
    force fifo_rdclk4       = clk_200M   ;    
    force fifo_rdclk5       = clk_200M   ;    
    force fifo_rdclk6       = clk_200M   ;    
    force fifo_rdclk7       = clk_200M   ;    
    force fifo_rdclk0       = clk_200M   ;    
    force fifo_rdclk1       = clk_200M   ;    
    force fifo_rdclk2       = clk_200M   ;    
    force fifo_rdclk3       = clk_200M   ;    
    force aggre_clk0        = clk_200M   ;    
    force aggre_clk1        = clk_200M   ;    
    force aggre_clk2        = clk_200M   ;    
    force aggre_clk3        = clk_200M   ;    
    force app_clk_data      = clk_100M   ;    
    force treed_reg_bank_clk= clk_100M   ;

endtask

task clk_force_2();
    force ppi_clk0          = clk_98M    ;  
    force ppi_clk1          = clk_99M    ;  
    force ppi_clk2          = clk_100M   ;   
    force ppi_clk3          = clk_101M   ;   
    force fifo_wrclk0       = clk_98M    ;
    force fifo_wrclk1       = clk_99M    ;
    force fifo_wrclk2       = clk_100M   ;
    force fifo_wrclk3       = clk_101M   ;
    force fifo_wrclk4       = clk_98M    ;
    force fifo_wrclk5       = clk_99M    ;
    force fifo_wrclk6       = clk_100M   ;
    force fifo_wrclk7       = clk_101M   ;
          
    force fifo_rdclk4       = clk_200M   ;    
    force fifo_rdclk5       = clk_200M   ;    
    force fifo_rdclk6       = clk_200M   ;    
    force fifo_rdclk7       = clk_200M   ;    
    force fifo_rdclk0       = clk_200M   ;    
    force fifo_rdclk1       = clk_200M   ;    
    force fifo_rdclk2       = clk_200M   ;    
    force fifo_rdclk3       = clk_200M   ;    
    force aggre_clk0        = clk_200M   ;    
    force aggre_clk1        = clk_200M   ;    
    force aggre_clk2        = clk_200M   ;    
    force aggre_clk3        = clk_200M   ;    
    force app_clk_data      = clk_100M   ;    
    force treed_reg_bank_clk= clk_100M   ;
endtask

task clk_force_same();
    force ppi_clk3          = clk_100M   ;  
    force ppi_clk2          = clk_100M   ;  
    force ppi_clk1          = clk_100M   ;   
    force ppi_clk0          = clk_100M   ;   
    force fifo_wrclk7       = clk_100M   ;
    force fifo_wrclk6       = clk_100M   ;
    force fifo_wrclk5       = clk_100M   ;
    force fifo_wrclk4       = clk_100M   ;
    force fifo_wrclk3       = clk_100M   ;
    force fifo_wrclk2       = clk_100M   ;
    force fifo_wrclk1       = clk_100M   ;
    force fifo_wrclk0       = clk_100M   ;
   
    force fifo_rdclk7       = clk_200M   ;    
    force fifo_rdclk6       = clk_200M   ;    
    force fifo_rdclk5       = clk_200M   ;    
    force fifo_rdclk4       = clk_200M   ;    
    force fifo_rdclk0       = clk_200M   ;    
    force fifo_rdclk1       = clk_200M   ;    
    force fifo_rdclk2       = clk_200M   ;    
    force fifo_rdclk3       = clk_200M   ;    
    force aggre_clk0        = clk_200M   ;    
    force aggre_clk1        = clk_200M   ;    
    force aggre_clk2        = clk_200M   ;    
    force aggre_clk3        = clk_200M   ;    
    force app_clk_data      = clk_100M   ;    
    force treed_reg_bank_clk= clk_100M   ;

endtask

task clk_force_1_fpga();
    force ppi_clk3          = clk_98M    ;  
    force ppi_clk2          = clk_99M    ;  
    force ppi_clk1          = clk_100M   ;   
    force ppi_clk0          = clk_101M   ;   
    force fifo_wrclk7       = clk_98M    ;
    force fifo_wrclk6       = clk_99M    ;
    force fifo_wrclk5       = clk_100M   ;
    force fifo_wrclk4       = clk_101M   ;
    force fifo_wrclk3       = clk_98M    ;
    force fifo_wrclk2       = clk_99M    ;
    force fifo_wrclk1       = clk_100M   ;
    force fifo_wrclk0       = clk_101M   ;
   
    force fifo_rdclk4       = clk_100M   ;    
    force fifo_rdclk5       = clk_100M   ;    
    force fifo_rdclk6       = clk_100M   ;    
    force fifo_rdclk7       = clk_100M   ;    
    force fifo_rdclk0       = clk_100M   ;    
    force fifo_rdclk1       = clk_100M   ;    
    force fifo_rdclk2       = clk_100M   ;    
    force fifo_rdclk3       = clk_100M   ;    
    force aggre_clk0        = clk_100M   ;    
    force aggre_clk1        = clk_100M   ;    
    force aggre_clk2        = clk_100M   ;    
    force aggre_clk3        = clk_100M   ;    
    force app_clk_data      = clk_100M   ;    
    force treed_reg_bank_clk= clk_100M   ;

endtask

task clk_force_2_fpga();
    force ppi_clk0          = clk_98M    ;  
    force ppi_clk1          = clk_99M    ;  
    force ppi_clk2          = clk_100M   ;   
    force ppi_clk3          = clk_101M   ;   
    force fifo_wrclk0       = clk_98M    ;
    force fifo_wrclk1       = clk_99M    ;
    force fifo_wrclk2       = clk_100M   ;
    force fifo_wrclk3       = clk_101M   ;
    force fifo_wrclk4       = clk_98M    ;
    force fifo_wrclk5       = clk_99M    ;
    force fifo_wrclk6       = clk_100M   ;
    force fifo_wrclk7       = clk_101M   ;
          
    force fifo_rdclk4       = clk_100M   ;    
    force fifo_rdclk5       = clk_100M   ;    
    force fifo_rdclk6       = clk_100M   ;    
    force fifo_rdclk7       = clk_100M   ;    
    force fifo_rdclk0       = clk_100M   ;    
    force fifo_rdclk1       = clk_100M   ;    
    force fifo_rdclk2       = clk_100M   ;    
    force fifo_rdclk3       = clk_100M   ;    
    force aggre_clk0        = clk_100M   ;    
    force aggre_clk1        = clk_100M   ;    
    force aggre_clk2        = clk_100M   ;    
    force aggre_clk3        = clk_100M   ;    
    force app_clk_data      = clk_100M   ;    
    force treed_reg_bank_clk= clk_100M   ;
endtask

task clk_force_same_fpga();
    force ppi_clk3          = clk_100M   ;  
    force ppi_clk2          = clk_100M   ;  
    force ppi_clk1          = clk_100M   ;   
    force ppi_clk0          = clk_100M   ;   
    force fifo_wrclk7       = clk_100M   ;
    force fifo_wrclk6       = clk_100M   ;
    force fifo_wrclk5       = clk_100M   ;
    force fifo_wrclk4       = clk_100M   ;
    force fifo_wrclk3       = clk_100M   ;
    force fifo_wrclk2       = clk_100M   ;
    force fifo_wrclk1       = clk_100M   ;
    force fifo_wrclk0       = clk_100M   ;
   
    force fifo_rdclk7       = clk_100M   ;    
    force fifo_rdclk6       = clk_100M   ;    
    force fifo_rdclk5       = clk_100M   ;    
    force fifo_rdclk4       = clk_100M   ;    
    force fifo_rdclk0       = clk_100M   ;    
    force fifo_rdclk1       = clk_100M   ;    
    force fifo_rdclk2       = clk_100M   ;    
    force fifo_rdclk3       = clk_100M   ;    
    force aggre_clk0        = clk_100M   ;    
    force aggre_clk1        = clk_100M   ;    
    force aggre_clk2        = clk_100M   ;    
    force aggre_clk3        = clk_100M   ;    
    force app_clk_data      = clk_100M   ;    
    force treed_reg_bank_clk= clk_100M   ;

endtask

task mep_idi_turn_over_vc();
        
        force    u_as6d_app.mep0_byte_en            = 'd0;
        force    u_as6d_app.mep0_csi_data           = 'd0;
        force    u_as6d_app.mep0_data_en            = 'd0;
        force    u_as6d_app.mep0_data_type          = 'd0;
        force    u_as6d_app.mep0_header_en          = 'd0;
        force    u_as6d_app.mep0_virtual_channel    = 'd0;
        force    u_as6d_app.mep0_virtual_channel_x  = 'd0;
        force    u_as6d_app.mep0_word_count         = 'd0;
endtask

task mep0_keep_silence_for_a_while();
    begin
        #0.023ms
        @(fifo_wrclk0)
        force    idi_vpg_byte_en_lane0           = 'd0;
        force    idi_vpg_data_lane0              = 'd0;
        force    idi_vpg_data_en_lane0           = 'd0;
        force    idi_vpg_dt_lane0                = 'd0;
        force    idi_vpg_vc_lane0                = 'd0;
        force    idi_vpg_vcx_lane0               = 'd0;
        force    idi_vpg_word_count_lane0        = 'd0;
        
        repeat(500)
        @(fifo_wrclk0)
        release  idi_vpg_byte_en_lane0     ;
        release  idi_vpg_data_lane0        ;
        release  idi_vpg_data_en_lane0     ;
        release  idi_vpg_dt_lane0          ;
        release  idi_vpg_vc_lane0          ;
        release  idi_vpg_vcx_lane0         ;
        release  idi_vpg_word_count_lane0  ;
    end
endtask

task header_en_keep_high_long_time();

    logic   header_en_keep_high_long_time   ;
    logic   keep_driver_header_en           ;
    
    begin
        assign header_en_keep_high_long_time = as6d_app_tb.u_as6d_app.u_as6d_app_pipe_route.mep0_header_en;
        repeat(20)begin
        @(posedge header_en_keep_high_long_time)
            if(as6d_app_tb.u_as6d_app.u_as6d_app_pipe_route.mep0_data_type[5:2] != 4'd0)begin
                force as6d_app_tb.u_as6d_app.u_as6d_app_pipe_route.mep0_header_en = 1'd1;
                #4000
                force as6d_app_tb.u_as6d_app.u_as6d_app_pipe_route.mep0_header_en = 1'd0;
                release as6d_app_tb.u_as6d_app.u_as6d_app_pipe_route.mep0_header_en;
            end
            else begin
            end
        end
    end

endtask


task cut_aggr1_idi_word_count();
    begin
        force   as6d_app_tb.u_as6d_app.u_as6d_app_aggregator.u1_as6d_app_aggr_lane.u_as6d_app_idi_gen.idi_app_header.word_count[15:0] = 'd60;
    end
endtask

task init_reg_pipe_stream_sel;
    input   [1:0]   a;
    input   [1:0]   b;
    input   [1:0]   c;
    input   [1:0]   d;
    input   [1:0]   e;
    input   [1:0]   f;
    input   [1:0]   g;
    input   [1:0]   h;
    begin
        reg_pipe0_stream_sel = a;
        reg_pipe1_stream_sel = b;
        reg_pipe2_stream_sel = c;
        reg_pipe3_stream_sel = d;
        reg_pipe4_stream_sel = e;
        reg_pipe5_stream_sel = f;
        reg_pipe6_stream_sel = g;
        reg_pipe7_stream_sel = h;
    end
endtask

task init_reg_aggr_vc_bit;
        input [2:0] aggr0_vc_override_en;
        input [2:0] aggr0_vc_override_value;
        input [2:0] aggr1_vc_override_en;
        input [2:0] aggr1_vc_override_value;
        input [2:0] aggr2_vc_override_en;
        input [2:0] aggr2_vc_override_value;
        input [2:0] aggr3_vc_override_en;
        input [2:0] aggr3_vc_override_value;
    begin
        reg_app_aggr0_vc_bit_override_en    =aggr0_vc_override_en;
        reg_app_aggr0_vc_bit_override_value =aggr0_vc_override_value;
        reg_app_aggr1_vc_bit_override_en    =aggr1_vc_override_en;
        reg_app_aggr1_vc_bit_override_value =aggr1_vc_override_value;
        reg_app_aggr2_vc_bit_override_en    =aggr2_vc_override_en;
        reg_app_aggr2_vc_bit_override_value =aggr2_vc_override_value;
        reg_app_aggr3_vc_bit_override_en    =aggr3_vc_override_en;
        reg_app_aggr3_vc_bit_override_value =aggr3_vc_override_value;
    end
endtask

task turn_over_vc();
    input   [1:0]   vc_max;
    `define TURN_OVER_VC

    force   as6d_app_tb.u0_vpg_idi.task_reg_vc_max = vc_max;
    force   as6d_app_tb.u1_vpg_idi.task_reg_vc_max = vc_max;
    force   as6d_app_tb.u2_vpg_idi.task_reg_vc_max = vc_max;
    force   as6d_app_tb.u3_vpg_idi.task_reg_vc_max = vc_max;

endtask

task init_reg_async_methed1_8pipe_pipe0145sch0_pipe2367sch1_case1();
    //***sch async methed1 cfg
    reg_app_sch0                =    16'b0011_1000_0000_0011;
    reg_app_sch1                =    16'b1100_1000_0000_1100;
    reg_app_sch2                =    16'b0000_0000_0000_0000;
    reg_app_sch3                =    16'b0000_0000_0000_0000;
    //***pipe remapping cfg
    //***pipe0 map cfg
    //***pipe1 map cfg
    //***pipe2 map cfg
    //***pipe3 map cfg
endtask//init_reg_async_methed1_8pipe_pipe0145sch0_pipe2367sch1_case1

task init_reg_async_methed1_8pipe_pipe0246sch0_pipe1357sch1_case2();
    //***sch async methed1 cfg
    reg_app_sch0                =    16'b0101_1000_0000_0101;
    reg_app_sch1                =    16'b1010_1000_0000_1010;
    reg_app_sch2                =    16'b0000_0000_0000_0000;
    reg_app_sch3                =    16'b0000_0000_0000_0000;
    //***pipe remapping cfg
    //***pipe0 map cfg
    //***pipe1 map cfg
    //***pipe2 map cfg
    //***pipe3 map cfg
endtask//init_reg_async_methed1_8pipe_pipe0246sch0_pipe1357sch1_case2

task init_reg_async_methed1_4pipe_pipe01sch0_pipe23sch1();
    //***sch async methed1 cfg
    reg_app_sch0                =    16'b0000_1000_0000_0011;
    reg_app_sch1                =    16'b0000_1000_0000_1100;
    reg_app_sch2                =    16'b0000_0000_0000_0000;
    reg_app_sch3                =    16'b0000_0000_0000_0000;
    //***pipe remapping cfg
    reg_pipe0_map_en            =    16'h001f;            
    reg_pipe1_map_en            =    16'h001f;            
    reg_pipe2_map_en            =    16'h001f;            
    reg_pipe3_map_en            =    16'h001f;            
    //***pipe0 map cfg
    //reg_pipe0_map0_vc_source    =    2'b00;        
    //reg_pipe0_map1_vc_source    =    2'b00;        
    //reg_pipe0_map2_vc_source    =    2'b00;        
    //reg_pipe0_map3_vc_source    =    2'b00;        
    //reg_pipe0_map4_vc_source    =    2'b00;        
    reg_pipe0_map0_vc_dest      =    2'b01;            
    reg_pipe0_map1_vc_dest      =    2'b01;            
    reg_pipe0_map2_vc_dest      =    2'b01;            
    reg_pipe0_map3_vc_dest      =    2'b01;            
    reg_pipe0_map4_vc_dest      =    2'b01;            
    reg_pipe0_map0_dt_source    =    6'h0;                    
    reg_pipe0_map1_dt_source    =    6'h1;                    
    reg_pipe0_map2_dt_source    =    6'h2;                    
    reg_pipe0_map3_dt_source    =    6'h3;                    
    reg_pipe0_map4_dt_source    =    6'h2B;                
    reg_pipe0_map0_dt_dest      =    6'h0;                    
    reg_pipe0_map1_dt_dest      =    6'h1;                    
    reg_pipe0_map2_dt_dest      =    6'h2;                    
    reg_pipe0_map3_dt_dest      =    6'h3;                    
    reg_pipe0_map4_dt_dest      =    6'h2B;                
    //***pipe1 map cfg
    //reg_pipe1_map0_vc_source    =    2'b00;        
    //reg_pipe1_map1_vc_source    =    2'b00;        
    //reg_pipe1_map2_vc_source    =    2'b00;        
    //reg_pipe1_map3_vc_source    =    2'b00;        
    //reg_pipe1_map4_vc_source    =    2'b00;        
    reg_pipe1_map0_vc_dest      =    2'b01;            
    reg_pipe1_map1_vc_dest      =    2'b01;            
    reg_pipe1_map2_vc_dest      =    2'b01;            
    reg_pipe1_map3_vc_dest      =    2'b01;            
    reg_pipe1_map4_vc_dest      =    2'b01;            
    reg_pipe1_map0_dt_source    =    6'h0;                    
    reg_pipe1_map1_dt_source    =    6'h1;                    
    reg_pipe1_map2_dt_source    =    6'h2;                    
    reg_pipe1_map3_dt_source    =    6'h3;                    
    reg_pipe1_map4_dt_source    =    6'h2B;                
    reg_pipe1_map0_dt_dest      =    6'h0;                    
    reg_pipe1_map1_dt_dest      =    6'h1;                    
    reg_pipe1_map2_dt_dest      =    6'h2;                    
    reg_pipe1_map3_dt_dest      =    6'h3;                    
    reg_pipe1_map4_dt_dest      =    6'h2B;                
    //***pipe2 map cfg
    //reg_pipe2_map0_vc_source    =    2'b00;        
    //reg_pipe2_map1_vc_source    =    2'b00;        
    //reg_pipe2_map2_vc_source    =    2'b00;        
    //reg_pipe2_map3_vc_source    =    2'b00;        
    //reg_pipe2_map4_vc_source    =    2'b00;        
    reg_pipe2_map0_vc_dest      =    2'b01;            
    reg_pipe2_map1_vc_dest      =    2'b01;            
    reg_pipe2_map2_vc_dest      =    2'b01;            
    reg_pipe2_map3_vc_dest      =    2'b01;            
    reg_pipe2_map4_vc_dest      =    2'b01;            
    reg_pipe2_map0_dt_source    =    6'h0;                    
    reg_pipe2_map1_dt_source    =    6'h1;                    
    reg_pipe2_map2_dt_source    =    6'h2;                    
    reg_pipe2_map3_dt_source    =    6'h3;                    
    reg_pipe2_map4_dt_source    =    6'h2B;                
    reg_pipe2_map0_dt_dest      =    6'h0;                    
    reg_pipe2_map1_dt_dest      =    6'h1;                    
    reg_pipe2_map2_dt_dest      =    6'h2;                    
    reg_pipe2_map3_dt_dest      =    6'h3;                    
    reg_pipe2_map4_dt_dest      =    6'h2B;                
    //***pipe3 map cfg
    //reg_pipe3_map0_vc_source    =    2'b00;        
    //reg_pipe3_map1_vc_source    =    2'b00;        
    //reg_pipe3_map2_vc_source    =    2'b00;        
    //reg_pipe3_map3_vc_source    =    2'b00;        
    //reg_pipe3_map4_vc_source    =    2'b00;        
    reg_pipe3_map0_vc_dest      =    2'b01;            
    reg_pipe3_map1_vc_dest      =    2'b01;            
    reg_pipe3_map2_vc_dest      =    2'b01;            
    reg_pipe3_map3_vc_dest      =    2'b01;            
    reg_pipe3_map4_vc_dest      =    2'b01;            
    reg_pipe3_map0_dt_source    =    6'h0;                    
    reg_pipe3_map1_dt_source    =    6'h1;                    
    reg_pipe3_map2_dt_source    =    6'h2;                    
    reg_pipe3_map3_dt_source    =    6'h3;                    
    reg_pipe3_map4_dt_source    =    6'h2B;                
    reg_pipe3_map0_dt_dest      =    6'h0;                    
    reg_pipe3_map1_dt_dest      =    6'h1;                    
    reg_pipe3_map2_dt_dest      =    6'h2;                    
    reg_pipe3_map3_dt_dest      =    6'h3;                    
    reg_pipe3_map4_dt_dest      =    6'h2B;                

endtask//init_reg_async_methed1_4pipe_pipe01sch0_pipe23sch1

task init_reg_async_methed2_4pipe_pipe0123sch12();
    
    //force as6d_app_tb.idi_dt_lane0[5:0] = 6'h2a;
    //force as6d_app_tb.idi_dt_lane1[5:0] = 6'h2b;
    //force as6d_app_tb.idi_dt_lane2[5:0] = 6'h2c;
    //force as6d_app_tb.idi_dt_lane3[5:0] = 6'h2d;

    //***sch async methed1 cfg
    reg_app_sch0                = 16'b0000_1100_0000_0000    ;
    reg_app_sch1                = 16'b0000_1100_0000_0000    ;
    reg_app_sch2                = 16'b0000_1100_0000_0000    ;
    reg_app_sch3                = 16'b0000_1100_0000_0000    ;
    //***pipe0 map cfg
    reg_pipe0_map0_vc_source    =    2'b00;            
    reg_pipe0_map1_vc_source    =    2'b00;            
    reg_pipe0_map2_vc_source    =    2'b00;            
    reg_pipe0_map3_vc_source    =    2'b00;            
    reg_pipe0_map4_vc_source    =    2'b00;            
    reg_pipe0_map5_vc_source    =    2'b01;        
    reg_pipe0_map6_vc_source    =    2'b01;        
    reg_pipe0_map7_vc_source    =    2'b01;        
    reg_pipe0_map8_vc_source    =    2'b01;        
    reg_pipe0_map9_vc_source    =    2'b01;        
    reg_pipe0_map0_vc_dest      =    2'b01;            
    reg_pipe0_map1_vc_dest      =    2'b01;            
    reg_pipe0_map2_vc_dest      =    2'b01;            
    reg_pipe0_map3_vc_dest      =    2'b01;            
    reg_pipe0_map4_vc_dest      =    2'b01;            
    reg_pipe0_map5_vc_dest      =    2'b00;        
    reg_pipe0_map6_vc_dest      =    2'b00;        
    reg_pipe0_map7_vc_dest      =    2'b00;        
    reg_pipe0_map8_vc_dest      =    2'b00;        
    reg_pipe0_map9_vc_dest      =    2'b00;        
    reg_pipe0_map0_dt_source    =    6'h0 ;                    
    reg_pipe0_map1_dt_source    =    6'h1 ;                    
    reg_pipe0_map2_dt_source    =    6'h2 ;                    
    reg_pipe0_map3_dt_source    =    6'h3 ;                    
    reg_pipe0_map4_dt_source    =    6'h2a;                
    reg_pipe0_map5_dt_source    =    6'h0 ;                
    reg_pipe0_map6_dt_source    =    6'h1 ;                
    reg_pipe0_map7_dt_source    =    6'h2 ;                
    reg_pipe0_map8_dt_source    =    6'h3 ;                
    reg_pipe0_map9_dt_source    =    6'h2a;                
    reg_pipe0_map0_dt_dest      =    6'h0 ;            
    reg_pipe0_map1_dt_dest      =    6'h1 ;            
    reg_pipe0_map2_dt_dest      =    6'h2 ;            
    reg_pipe0_map3_dt_dest      =    6'h3 ;            
    reg_pipe0_map4_dt_dest      =    6'h2a;            
    reg_pipe0_map5_dt_dest      =    6'h0 ;            
    reg_pipe0_map6_dt_dest      =    6'h1 ;            
    reg_pipe0_map7_dt_dest      =    6'h2 ;            
    reg_pipe0_map8_dt_dest      =    6'h3 ;            
    reg_pipe0_map9_dt_dest      =    6'h2a;            
    //***pipe1 map cfg
    reg_pipe1_map0_vc_source    =    2'b00;            
    reg_pipe1_map1_vc_source    =    2'b00;            
    reg_pipe1_map2_vc_source    =    2'b00;            
    reg_pipe1_map3_vc_source    =    2'b00;            
    reg_pipe1_map4_vc_source    =    2'b00;            
    reg_pipe1_map5_vc_source    =    2'b01;        
    reg_pipe1_map6_vc_source    =    2'b01;        
    reg_pipe1_map7_vc_source    =    2'b01;        
    reg_pipe1_map8_vc_source    =    2'b01;        
    reg_pipe1_map9_vc_source    =    2'b01;        
    reg_pipe1_map0_vc_dest      =    2'b01;            
    reg_pipe1_map1_vc_dest      =    2'b01;            
    reg_pipe1_map2_vc_dest      =    2'b01;            
    reg_pipe1_map3_vc_dest      =    2'b01;            
    reg_pipe1_map4_vc_dest      =    2'b01;            
    reg_pipe1_map5_vc_dest      =    2'b00;        
    reg_pipe1_map6_vc_dest      =    2'b00;        
    reg_pipe1_map7_vc_dest      =    2'b00;        
    reg_pipe1_map8_vc_dest      =    2'b00;        
    reg_pipe1_map9_vc_dest      =    2'b00;        
    reg_pipe1_map0_dt_source    =    6'h0 ;                    
    reg_pipe1_map1_dt_source    =    6'h1 ;                    
    reg_pipe1_map2_dt_source    =    6'h2 ;                    
    reg_pipe1_map3_dt_source    =    6'h3 ;                    
    reg_pipe1_map4_dt_source    =    6'h2b;                
    reg_pipe1_map5_dt_source    =    6'h0 ;            
    reg_pipe1_map6_dt_source    =    6'h1 ;            
    reg_pipe1_map7_dt_source    =    6'h2 ;            
    reg_pipe1_map8_dt_source    =    6'h3 ;            
    reg_pipe1_map9_dt_source    =    6'h2b;            
    reg_pipe1_map0_dt_dest      =    6'h0 ;                    
    reg_pipe1_map1_dt_dest      =    6'h1 ;                    
    reg_pipe1_map2_dt_dest      =    6'h2 ;                    
    reg_pipe1_map3_dt_dest      =    6'h3 ;                    
    reg_pipe1_map4_dt_dest      =    6'h2b;                
    reg_pipe1_map5_dt_dest      =    6'h0 ;           
    reg_pipe1_map6_dt_dest      =    6'h1 ;           
    reg_pipe1_map7_dt_dest      =    6'h2 ;           
    reg_pipe1_map8_dt_dest      =    6'h3 ;           
    reg_pipe1_map9_dt_dest      =    6'h2b;           
    //***pipe2 map cfg
    reg_pipe2_map0_vc_source    =    2'b00;            
    reg_pipe2_map1_vc_source    =    2'b00;            
    reg_pipe2_map2_vc_source    =    2'b00;            
    reg_pipe2_map3_vc_source    =    2'b00;            
    reg_pipe2_map4_vc_source    =    2'b00;            
    reg_pipe2_map5_vc_source    =    2'b01;        
    reg_pipe2_map6_vc_source    =    2'b01;        
    reg_pipe2_map7_vc_source    =    2'b01;        
    reg_pipe2_map8_vc_source    =    2'b01;        
    reg_pipe2_map9_vc_source    =    2'b01;        
    reg_pipe2_map0_vc_dest      =    2'b01;            
    reg_pipe2_map1_vc_dest      =    2'b01;            
    reg_pipe2_map2_vc_dest      =    2'b01;            
    reg_pipe2_map3_vc_dest      =    2'b01;            
    reg_pipe2_map4_vc_dest      =    2'b01;            
    reg_pipe2_map5_vc_dest      =    2'b00;        
    reg_pipe2_map6_vc_dest      =    2'b00;        
    reg_pipe2_map7_vc_dest      =    2'b00;        
    reg_pipe2_map8_vc_dest      =    2'b00;        
    reg_pipe2_map9_vc_dest      =    2'b00;        
    reg_pipe2_map0_dt_source    =    6'h0 ;                    
    reg_pipe2_map1_dt_source    =    6'h1 ;                    
    reg_pipe2_map2_dt_source    =    6'h2 ;                    
    reg_pipe2_map3_dt_source    =    6'h3 ;                    
    reg_pipe2_map4_dt_source    =    6'h2c;                
    reg_pipe2_map5_dt_source    =    6'h0 ;            
    reg_pipe2_map6_dt_source    =    6'h1 ;            
    reg_pipe2_map7_dt_source    =    6'h2 ;            
    reg_pipe2_map8_dt_source    =    6'h3 ;            
    reg_pipe2_map9_dt_source    =    6'h2c;            
    reg_pipe2_map0_dt_dest      =    6'h0 ;                    
    reg_pipe2_map1_dt_dest      =    6'h1 ;                    
    reg_pipe2_map2_dt_dest      =    6'h2 ;                    
    reg_pipe2_map3_dt_dest      =    6'h3 ;                    
    reg_pipe2_map4_dt_dest      =    6'h2c;                
    reg_pipe2_map5_dt_dest      =    6'h0 ;           
    reg_pipe2_map6_dt_dest      =    6'h1 ;           
    reg_pipe2_map7_dt_dest      =    6'h2 ;           
    reg_pipe2_map8_dt_dest      =    6'h3 ;           
    reg_pipe2_map9_dt_dest      =    6'h2c;           
    //***pipe3 map cfg
    reg_pipe3_map0_vc_source    =    2'b00;            
    reg_pipe3_map1_vc_source    =    2'b00;            
    reg_pipe3_map2_vc_source    =    2'b00;            
    reg_pipe3_map3_vc_source    =    2'b00;            
    reg_pipe3_map4_vc_source    =    2'b00;            
    reg_pipe3_map5_vc_source    =    2'b01;        
    reg_pipe3_map6_vc_source    =    2'b01;        
    reg_pipe3_map7_vc_source    =    2'b01;        
    reg_pipe3_map8_vc_source    =    2'b01;        
    reg_pipe3_map9_vc_source    =    2'b01;        
    reg_pipe3_map0_vc_dest      =    2'b01;            
    reg_pipe3_map1_vc_dest      =    2'b01;            
    reg_pipe3_map2_vc_dest      =    2'b01;            
    reg_pipe3_map3_vc_dest      =    2'b01;            
    reg_pipe3_map4_vc_dest      =    2'b01;            
    reg_pipe3_map5_vc_dest      =    2'b00;        
    reg_pipe3_map6_vc_dest      =    2'b00;        
    reg_pipe3_map7_vc_dest      =    2'b00;        
    reg_pipe3_map8_vc_dest      =    2'b00;        
    reg_pipe3_map9_vc_dest      =    2'b00;        
    reg_pipe3_map0_dt_source    =    6'h0 ;                    
    reg_pipe3_map1_dt_source    =    6'h1 ;                    
    reg_pipe3_map2_dt_source    =    6'h2 ;                    
    reg_pipe3_map3_dt_source    =    6'h3 ;                    
    reg_pipe3_map4_dt_source    =    6'h2d;                
    reg_pipe3_map5_dt_source    =    6'h0 ;            
    reg_pipe3_map6_dt_source    =    6'h1 ;            
    reg_pipe3_map7_dt_source    =    6'h2 ;            
    reg_pipe3_map8_dt_source    =    6'h3 ;            
    reg_pipe3_map9_dt_source    =    6'h2d;            
    reg_pipe3_map0_dt_dest      =    6'h0 ;                    
    reg_pipe3_map1_dt_dest      =    6'h1 ;                    
    reg_pipe3_map2_dt_dest      =    6'h2 ;                    
    reg_pipe3_map3_dt_dest      =    6'h3 ;                    
    reg_pipe3_map4_dt_dest      =    6'h2d;                
    reg_pipe3_map5_dt_dest      =    6'h0 ;           
    reg_pipe3_map6_dt_dest      =    6'h1 ;           
    reg_pipe3_map7_dt_dest      =    6'h2 ;           
    reg_pipe3_map8_dt_dest      =    6'h3 ;           
    reg_pipe3_map9_dt_dest      =    6'h2d;           

    reg_pipe0_map_en            =    16'h03ff;            
    reg_pipe1_map_en            =    16'h03ff;            
    reg_pipe2_map_en            =    16'h03ff;            
    reg_pipe3_map_en            =    16'h03ff;            
    reg_pipe0_map0_aggr_id      =    4'd1;            
    reg_pipe0_map1_aggr_id      =    4'd1;            
    reg_pipe0_map2_aggr_id      =    4'd1;            
    reg_pipe0_map3_aggr_id      =    4'd1;            
    reg_pipe0_map4_aggr_id      =    4'd1;            
    reg_pipe0_map5_aggr_id      =    4'd2;            
    reg_pipe0_map6_aggr_id      =    4'd2;            
    reg_pipe0_map7_aggr_id      =    4'd2;            
    reg_pipe0_map8_aggr_id      =    4'd2;            
    reg_pipe0_map9_aggr_id      =    4'd2;            

    reg_pipe1_map0_aggr_id      =    4'd1;            
    reg_pipe1_map1_aggr_id      =    4'd1;            
    reg_pipe1_map2_aggr_id      =    4'd1;            
    reg_pipe1_map3_aggr_id      =    4'd1;            
    reg_pipe1_map4_aggr_id      =    4'd1;            
    reg_pipe1_map5_aggr_id      =    4'd2;            
    reg_pipe1_map6_aggr_id      =    4'd2;            
    reg_pipe1_map7_aggr_id      =    4'd2;            
    reg_pipe1_map8_aggr_id      =    4'd2;            
    reg_pipe1_map9_aggr_id      =    4'd2;            

    reg_pipe2_map0_aggr_id      =    4'd1;            
    reg_pipe2_map1_aggr_id      =    4'd1;            
    reg_pipe2_map2_aggr_id      =    4'd1;            
    reg_pipe2_map3_aggr_id      =    4'd1;            
    reg_pipe2_map4_aggr_id      =    4'd1;            
    reg_pipe2_map5_aggr_id      =    4'd2;            
    reg_pipe2_map6_aggr_id      =    4'd2;            
    reg_pipe2_map7_aggr_id      =    4'd2;            
    reg_pipe2_map8_aggr_id      =    4'd2;            
    reg_pipe2_map9_aggr_id      =    4'd2;            

    reg_pipe3_map0_aggr_id      =    4'd1;            
    reg_pipe3_map1_aggr_id      =    4'd1;            
    reg_pipe3_map2_aggr_id      =    4'd1;            
    reg_pipe3_map3_aggr_id      =    4'd1;            
    reg_pipe3_map4_aggr_id      =    4'd1;            
    reg_pipe3_map5_aggr_id      =    4'd2;            
    reg_pipe3_map6_aggr_id      =    4'd2;            
    reg_pipe3_map7_aggr_id      =    4'd2;            
    reg_pipe3_map8_aggr_id      =    4'd2;            
    reg_pipe3_map9_aggr_id      =    4'd2;            
endtask//init_reg_async_methed2_4pipe_pipe0123sch12

task init_reg_async_methed2_4pipe_pipe01sch1_pipe23sch2();
    //force as6d_app_tb.idi_dt_lane0[5:0] = 6'h2a;
    //force as6d_app_tb.idi_dt_lane1[5:0] = 6'h2b;
    //force as6d_app_tb.idi_dt_lane2[5:0] = 6'h2c;
    //force as6d_app_tb.idi_dt_lane3[5:0] = 6'h2d;

    //***sch async methed1 cfg
    reg_app_sch0                = 16'b0000_1100_0000_0000    ;
    reg_app_sch1                = 16'b0000_1100_0000_0000    ;
    reg_app_sch2                = 16'b0000_1100_0000_0000    ;
    reg_app_sch3                = 16'b0000_1100_0000_0000    ;
    //***pipe0 map cfg
    reg_pipe0_map0_vc_source    =    2'b00;            
    reg_pipe0_map1_vc_source    =    2'b00;            
    reg_pipe0_map2_vc_source    =    2'b00;            
    reg_pipe0_map3_vc_source    =    2'b00;            
    reg_pipe0_map4_vc_source    =    2'b00;            
    reg_pipe0_map5_vc_source    =    2'b01;        
    reg_pipe0_map6_vc_source    =    2'b01;        
    reg_pipe0_map7_vc_source    =    2'b01;        
    reg_pipe0_map8_vc_source    =    2'b01;        
    reg_pipe0_map9_vc_source    =    2'b01;        
    reg_pipe0_map0_vc_dest      =    2'b01;            
    reg_pipe0_map1_vc_dest      =    2'b01;            
    reg_pipe0_map2_vc_dest      =    2'b01;            
    reg_pipe0_map3_vc_dest      =    2'b01;            
    reg_pipe0_map4_vc_dest      =    2'b01;            
    reg_pipe0_map5_vc_dest      =    2'b00;        
    reg_pipe0_map6_vc_dest      =    2'b00;        
    reg_pipe0_map7_vc_dest      =    2'b00;        
    reg_pipe0_map8_vc_dest      =    2'b00;        
    reg_pipe0_map9_vc_dest      =    2'b00;        
    reg_pipe0_map0_dt_source    =    6'h0 ;                    
    reg_pipe0_map1_dt_source    =    6'h1 ;                    
    reg_pipe0_map2_dt_source    =    6'h2 ;                    
    reg_pipe0_map3_dt_source    =    6'h3 ;                    
    reg_pipe0_map4_dt_source    =    6'h2a;                
    reg_pipe0_map5_dt_source    =    6'h0 ;                
    reg_pipe0_map6_dt_source    =    6'h1 ;                
    reg_pipe0_map7_dt_source    =    6'h2 ;                
    reg_pipe0_map8_dt_source    =    6'h3 ;                
    reg_pipe0_map9_dt_source    =    6'h2a;                
    reg_pipe0_map0_dt_dest      =    6'h0 ;            
    reg_pipe0_map1_dt_dest      =    6'h1 ;            
    reg_pipe0_map2_dt_dest      =    6'h2 ;            
    reg_pipe0_map3_dt_dest      =    6'h3 ;            
    reg_pipe0_map4_dt_dest      =    6'h2a;            
    reg_pipe0_map5_dt_dest      =    6'h0 ;            
    reg_pipe0_map6_dt_dest      =    6'h1 ;            
    reg_pipe0_map7_dt_dest      =    6'h2 ;            
    reg_pipe0_map8_dt_dest      =    6'h3 ;            
    reg_pipe0_map9_dt_dest      =    6'h2a;            
    //***pipe1 map cfg
    reg_pipe1_map0_vc_source    =    2'b00;            
    reg_pipe1_map1_vc_source    =    2'b00;            
    reg_pipe1_map2_vc_source    =    2'b00;            
    reg_pipe1_map3_vc_source    =    2'b00;            
    reg_pipe1_map4_vc_source    =    2'b00;            
    reg_pipe1_map5_vc_source    =    2'b01;        
    reg_pipe1_map6_vc_source    =    2'b01;        
    reg_pipe1_map7_vc_source    =    2'b01;        
    reg_pipe1_map8_vc_source    =    2'b01;        
    reg_pipe1_map9_vc_source    =    2'b01;        
    reg_pipe1_map0_vc_dest      =    2'b01;            
    reg_pipe1_map1_vc_dest      =    2'b01;            
    reg_pipe1_map2_vc_dest      =    2'b01;            
    reg_pipe1_map3_vc_dest      =    2'b01;            
    reg_pipe1_map4_vc_dest      =    2'b01;            
    reg_pipe1_map5_vc_dest      =    2'b00;        
    reg_pipe1_map6_vc_dest      =    2'b00;        
    reg_pipe1_map7_vc_dest      =    2'b00;        
    reg_pipe1_map8_vc_dest      =    2'b00;        
    reg_pipe1_map9_vc_dest      =    2'b00;        
    reg_pipe1_map0_dt_source    =    6'h0 ;                    
    reg_pipe1_map1_dt_source    =    6'h1 ;                    
    reg_pipe1_map2_dt_source    =    6'h2 ;                    
    reg_pipe1_map3_dt_source    =    6'h3 ;                    
    reg_pipe1_map4_dt_source    =    6'h2b;                
    reg_pipe1_map5_dt_source    =    6'h0 ;            
    reg_pipe1_map6_dt_source    =    6'h1 ;            
    reg_pipe1_map7_dt_source    =    6'h2 ;            
    reg_pipe1_map8_dt_source    =    6'h3 ;            
    reg_pipe1_map9_dt_source    =    6'h2b;            
    reg_pipe1_map0_dt_dest      =    6'h0 ;                    
    reg_pipe1_map1_dt_dest      =    6'h1 ;                    
    reg_pipe1_map2_dt_dest      =    6'h2 ;                    
    reg_pipe1_map3_dt_dest      =    6'h3 ;                    
    reg_pipe1_map4_dt_dest      =    6'h2b;                
    reg_pipe1_map5_dt_dest      =    6'h0 ;           
    reg_pipe1_map6_dt_dest      =    6'h1 ;           
    reg_pipe1_map7_dt_dest      =    6'h2 ;           
    reg_pipe1_map8_dt_dest      =    6'h3 ;           
    reg_pipe1_map9_dt_dest      =    6'h2b;           
    //***pipe2 map cfg
    reg_pipe2_map0_vc_source    =    2'b00;            
    reg_pipe2_map1_vc_source    =    2'b00;            
    reg_pipe2_map2_vc_source    =    2'b00;            
    reg_pipe2_map3_vc_source    =    2'b00;            
    reg_pipe2_map4_vc_source    =    2'b00;            
    reg_pipe2_map5_vc_source    =    2'b01;        
    reg_pipe2_map6_vc_source    =    2'b01;        
    reg_pipe2_map7_vc_source    =    2'b01;        
    reg_pipe2_map8_vc_source    =    2'b01;        
    reg_pipe2_map9_vc_source    =    2'b01;        
    reg_pipe2_map0_vc_dest      =    2'b01;            
    reg_pipe2_map1_vc_dest      =    2'b01;            
    reg_pipe2_map2_vc_dest      =    2'b01;            
    reg_pipe2_map3_vc_dest      =    2'b01;            
    reg_pipe2_map4_vc_dest      =    2'b01;            
    reg_pipe2_map5_vc_dest      =    2'b00;        
    reg_pipe2_map6_vc_dest      =    2'b00;        
    reg_pipe2_map7_vc_dest      =    2'b00;        
    reg_pipe2_map8_vc_dest      =    2'b00;        
    reg_pipe2_map9_vc_dest      =    2'b00;        
    reg_pipe2_map0_dt_source    =    6'h0 ;                    
    reg_pipe2_map1_dt_source    =    6'h1 ;                    
    reg_pipe2_map2_dt_source    =    6'h2 ;                    
    reg_pipe2_map3_dt_source    =    6'h3 ;                    
    reg_pipe2_map4_dt_source    =    6'h2c;                
    reg_pipe2_map5_dt_source    =    6'h0 ;            
    reg_pipe2_map6_dt_source    =    6'h1 ;            
    reg_pipe2_map7_dt_source    =    6'h2 ;            
    reg_pipe2_map8_dt_source    =    6'h3 ;            
    reg_pipe2_map9_dt_source    =    6'h2c;            
    reg_pipe2_map0_dt_dest      =    6'h0 ;                    
    reg_pipe2_map1_dt_dest      =    6'h1 ;                    
    reg_pipe2_map2_dt_dest      =    6'h2 ;                    
    reg_pipe2_map3_dt_dest      =    6'h3 ;                    
    reg_pipe2_map4_dt_dest      =    6'h2c;                
    reg_pipe2_map5_dt_dest      =    6'h0 ;           
    reg_pipe2_map6_dt_dest      =    6'h1 ;           
    reg_pipe2_map7_dt_dest      =    6'h2 ;           
    reg_pipe2_map8_dt_dest      =    6'h3 ;           
    reg_pipe2_map9_dt_dest      =    6'h2c;           
    //***pipe3 map cfg
    reg_pipe3_map0_vc_source    =    2'b00;            
    reg_pipe3_map1_vc_source    =    2'b00;            
    reg_pipe3_map2_vc_source    =    2'b00;            
    reg_pipe3_map3_vc_source    =    2'b00;            
    reg_pipe3_map4_vc_source    =    2'b00;            
    reg_pipe3_map5_vc_source    =    2'b01;        
    reg_pipe3_map6_vc_source    =    2'b01;        
    reg_pipe3_map7_vc_source    =    2'b01;        
    reg_pipe3_map8_vc_source    =    2'b01;        
    reg_pipe3_map9_vc_source    =    2'b01;        
    reg_pipe3_map0_vc_dest      =    2'b01;            
    reg_pipe3_map1_vc_dest      =    2'b01;            
    reg_pipe3_map2_vc_dest      =    2'b01;            
    reg_pipe3_map3_vc_dest      =    2'b01;            
    reg_pipe3_map4_vc_dest      =    2'b01;            
    reg_pipe3_map5_vc_dest      =    2'b00;        
    reg_pipe3_map6_vc_dest      =    2'b00;        
    reg_pipe3_map7_vc_dest      =    2'b00;        
    reg_pipe3_map8_vc_dest      =    2'b00;        
    reg_pipe3_map9_vc_dest      =    2'b00;        
    reg_pipe3_map0_dt_source    =    6'h0 ;                    
    reg_pipe3_map1_dt_source    =    6'h1 ;                    
    reg_pipe3_map2_dt_source    =    6'h2 ;                    
    reg_pipe3_map3_dt_source    =    6'h3 ;                    
    reg_pipe3_map4_dt_source    =    6'h2d;                
    reg_pipe3_map5_dt_source    =    6'h0 ;            
    reg_pipe3_map6_dt_source    =    6'h1 ;            
    reg_pipe3_map7_dt_source    =    6'h2 ;            
    reg_pipe3_map8_dt_source    =    6'h3 ;            
    reg_pipe3_map9_dt_source    =    6'h2d;            
    reg_pipe3_map0_dt_dest      =    6'h0 ;                    
    reg_pipe3_map1_dt_dest      =    6'h1 ;                    
    reg_pipe3_map2_dt_dest      =    6'h2 ;                    
    reg_pipe3_map3_dt_dest      =    6'h3 ;                    
    reg_pipe3_map4_dt_dest      =    6'h2d;                
    reg_pipe3_map5_dt_dest      =    6'h0 ;           
    reg_pipe3_map6_dt_dest      =    6'h1 ;           
    reg_pipe3_map7_dt_dest      =    6'h2 ;           
    reg_pipe3_map8_dt_dest      =    6'h3 ;           
    reg_pipe3_map9_dt_dest      =    6'h2d;           

    reg_pipe0_map_en            =    16'h03ff;            
    reg_pipe1_map_en            =    16'h03ff;            
    reg_pipe2_map_en            =    16'h03ff;            
    reg_pipe3_map_en            =    16'h03ff;            
    reg_pipe0_map0_aggr_id      =    4'd1;            
    reg_pipe0_map1_aggr_id      =    4'd1;            
    reg_pipe0_map2_aggr_id      =    4'd1;            
    reg_pipe0_map3_aggr_id      =    4'd1;            
    reg_pipe0_map4_aggr_id      =    4'd1;            
    reg_pipe0_map5_aggr_id      =    4'd1;            
    reg_pipe0_map6_aggr_id      =    4'd1;            
    reg_pipe0_map7_aggr_id      =    4'd1;            
    reg_pipe0_map8_aggr_id      =    4'd1;            
    reg_pipe0_map9_aggr_id      =    4'd1;            

    reg_pipe1_map0_aggr_id      =    4'd1;            
    reg_pipe1_map1_aggr_id      =    4'd1;            
    reg_pipe1_map2_aggr_id      =    4'd1;            
    reg_pipe1_map3_aggr_id      =    4'd1;            
    reg_pipe1_map4_aggr_id      =    4'd1;            
    reg_pipe1_map5_aggr_id      =    4'd1;            
    reg_pipe1_map6_aggr_id      =    4'd1;            
    reg_pipe1_map7_aggr_id      =    4'd1;            
    reg_pipe1_map8_aggr_id      =    4'd1;            
    reg_pipe1_map9_aggr_id      =    4'd1;            

    reg_pipe2_map0_aggr_id      =    4'd2;            
    reg_pipe2_map1_aggr_id      =    4'd2;            
    reg_pipe2_map2_aggr_id      =    4'd2;            
    reg_pipe2_map3_aggr_id      =    4'd2;            
    reg_pipe2_map4_aggr_id      =    4'd2;            
    reg_pipe2_map5_aggr_id      =    4'd2;            
    reg_pipe2_map6_aggr_id      =    4'd2;            
    reg_pipe2_map7_aggr_id      =    4'd2;            
    reg_pipe2_map8_aggr_id      =    4'd2;            
    reg_pipe2_map9_aggr_id      =    4'd2;            

    reg_pipe3_map0_aggr_id      =    4'd2;            
    reg_pipe3_map1_aggr_id      =    4'd2;            
    reg_pipe3_map2_aggr_id      =    4'd2;            
    reg_pipe3_map3_aggr_id      =    4'd2;            
    reg_pipe3_map4_aggr_id      =    4'd2;            
    reg_pipe3_map5_aggr_id      =    4'd2;            
    reg_pipe3_map6_aggr_id      =    4'd2;            
    reg_pipe3_map7_aggr_id      =    4'd2;            
    reg_pipe3_map8_aggr_id      =    4'd2;            
    reg_pipe3_map9_aggr_id      =    4'd2;            
endtask//init_reg_async_methed2_4pipe_pipe01sch1_pipe23sch2

task init_reg_async_methed2_8pipe_pipe01234567sch01();
    //force as6d_app_tb.idi_dt_lane0[5:0] = 6'h2a;
    //force as6d_app_tb.idi_dt_lane1[5:0] = 6'h2b;
    //force as6d_app_tb.idi_dt_lane2[5:0] = 6'h2c;
    //force as6d_app_tb.idi_dt_lane3[5:0] = 6'h2d;

    //***sch async methed1 cfg
    reg_app_sch0                = 16'b0000_1100_0000_0000    ;
    reg_app_sch1                = 16'b0000_1100_0000_0000    ;
    reg_app_sch2                = 16'b0000_1100_0000_0000    ;
    reg_app_sch3                = 16'b0000_1100_0000_0000    ;
    //***pipe@@ map cfg
    reg_pipe0_map0_vc_source    =    2'b00;            
    reg_pipe0_map1_vc_source    =    2'b00;            
    reg_pipe0_map2_vc_source    =    2'b00;            
    reg_pipe0_map3_vc_source    =    2'b00;            
    reg_pipe0_map4_vc_source    =    2'b00;            
    reg_pipe0_map5_vc_source    =    2'b01;        
    reg_pipe0_map6_vc_source    =    2'b01;        
    reg_pipe0_map7_vc_source    =    2'b01;        
    reg_pipe0_map8_vc_source    =    2'b01;        
    reg_pipe0_map9_vc_source    =    2'b01;        
    reg_pipe0_map0_vc_dest      =    2'b01;            
    reg_pipe0_map1_vc_dest      =    2'b01;            
    reg_pipe0_map2_vc_dest      =    2'b01;            
    reg_pipe0_map3_vc_dest      =    2'b01;            
    reg_pipe0_map4_vc_dest      =    2'b01;            
    reg_pipe0_map5_vc_dest      =    2'b00;        
    reg_pipe0_map6_vc_dest      =    2'b00;        
    reg_pipe0_map7_vc_dest      =    2'b00;        
    reg_pipe0_map8_vc_dest      =    2'b00;        
    reg_pipe0_map9_vc_dest      =    2'b00;        
    reg_pipe0_map0_dt_source    =    6'h0 ;                    
    reg_pipe0_map1_dt_source    =    6'h1 ;                    
    reg_pipe0_map2_dt_source    =    6'h2 ;                    
    reg_pipe0_map3_dt_source    =    6'h3 ;                    
    reg_pipe0_map4_dt_source    =    6'h2a;                
    reg_pipe0_map5_dt_source    =    6'h0 ;                
    reg_pipe0_map6_dt_source    =    6'h1 ;                
    reg_pipe0_map7_dt_source    =    6'h2 ;                
    reg_pipe0_map8_dt_source    =    6'h3 ;                
    reg_pipe0_map9_dt_source    =    6'h2a;                
    reg_pipe0_map0_dt_dest      =    6'h0 ;            
    reg_pipe0_map1_dt_dest      =    6'h1 ;            
    reg_pipe0_map2_dt_dest      =    6'h2 ;            
    reg_pipe0_map3_dt_dest      =    6'h3 ;            
    reg_pipe0_map4_dt_dest      =    6'h2a;            
    reg_pipe0_map5_dt_dest      =    6'h0 ;            
    reg_pipe0_map6_dt_dest      =    6'h1 ;            
    reg_pipe0_map7_dt_dest      =    6'h2 ;            
    reg_pipe0_map8_dt_dest      =    6'h3 ;            
    reg_pipe0_map9_dt_dest      =    6'h2a;            
    reg_pipe1_map0_vc_source    =    2'b00;            
    reg_pipe1_map1_vc_source    =    2'b00;            
    reg_pipe1_map2_vc_source    =    2'b00;            
    reg_pipe1_map3_vc_source    =    2'b00;            
    reg_pipe1_map4_vc_source    =    2'b00;            
    reg_pipe1_map5_vc_source    =    2'b01;        
    reg_pipe1_map6_vc_source    =    2'b01;        
    reg_pipe1_map7_vc_source    =    2'b01;        
    reg_pipe1_map8_vc_source    =    2'b01;        
    reg_pipe1_map9_vc_source    =    2'b01;        
    reg_pipe1_map0_vc_dest      =    2'b01;            
    reg_pipe1_map1_vc_dest      =    2'b01;            
    reg_pipe1_map2_vc_dest      =    2'b01;            
    reg_pipe1_map3_vc_dest      =    2'b01;            
    reg_pipe1_map4_vc_dest      =    2'b01;            
    reg_pipe1_map5_vc_dest      =    2'b00;        
    reg_pipe1_map6_vc_dest      =    2'b00;        
    reg_pipe1_map7_vc_dest      =    2'b00;        
    reg_pipe1_map8_vc_dest      =    2'b00;        
    reg_pipe1_map9_vc_dest      =    2'b00;        
    reg_pipe1_map0_dt_source    =    6'h0 ;                    
    reg_pipe1_map1_dt_source    =    6'h1 ;                    
    reg_pipe1_map2_dt_source    =    6'h2 ;                    
    reg_pipe1_map3_dt_source    =    6'h3 ;                    
    reg_pipe1_map4_dt_source    =    6'h2b;                
    reg_pipe1_map5_dt_source    =    6'h0 ;                
    reg_pipe1_map6_dt_source    =    6'h1 ;                
    reg_pipe1_map7_dt_source    =    6'h2 ;                
    reg_pipe1_map8_dt_source    =    6'h3 ;                
    reg_pipe1_map9_dt_source    =    6'h2b;                
    reg_pipe1_map0_dt_dest      =    6'h0 ;            
    reg_pipe1_map1_dt_dest      =    6'h1 ;            
    reg_pipe1_map2_dt_dest      =    6'h2 ;            
    reg_pipe1_map3_dt_dest      =    6'h3 ;            
    reg_pipe1_map4_dt_dest      =    6'h2b;            
    reg_pipe1_map5_dt_dest      =    6'h0 ;            
    reg_pipe1_map6_dt_dest      =    6'h1 ;            
    reg_pipe1_map7_dt_dest      =    6'h2 ;            
    reg_pipe1_map8_dt_dest      =    6'h3 ;            
    reg_pipe1_map9_dt_dest      =    6'h2b;            
    reg_pipe2_map0_vc_source    =    2'b00;            
    reg_pipe2_map1_vc_source    =    2'b00;            
    reg_pipe2_map2_vc_source    =    2'b00;            
    reg_pipe2_map3_vc_source    =    2'b00;            
    reg_pipe2_map4_vc_source    =    2'b00;            
    reg_pipe2_map5_vc_source    =    2'b01;        
    reg_pipe2_map6_vc_source    =    2'b01;        
    reg_pipe2_map7_vc_source    =    2'b01;        
    reg_pipe2_map8_vc_source    =    2'b01;        
    reg_pipe2_map9_vc_source    =    2'b01;        
    reg_pipe2_map0_vc_dest      =    2'b01;            
    reg_pipe2_map1_vc_dest      =    2'b01;            
    reg_pipe2_map2_vc_dest      =    2'b01;            
    reg_pipe2_map3_vc_dest      =    2'b01;            
    reg_pipe2_map4_vc_dest      =    2'b01;            
    reg_pipe2_map5_vc_dest      =    2'b00;        
    reg_pipe2_map6_vc_dest      =    2'b00;        
    reg_pipe2_map7_vc_dest      =    2'b00;        
    reg_pipe2_map8_vc_dest      =    2'b00;        
    reg_pipe2_map9_vc_dest      =    2'b00;        
    reg_pipe2_map0_dt_source    =    6'h0 ;                    
    reg_pipe2_map1_dt_source    =    6'h1 ;                    
    reg_pipe2_map2_dt_source    =    6'h2 ;                    
    reg_pipe2_map3_dt_source    =    6'h3 ;                    
    reg_pipe2_map4_dt_source    =    6'h2c;                
    reg_pipe2_map5_dt_source    =    6'h0 ;                
    reg_pipe2_map6_dt_source    =    6'h1 ;                
    reg_pipe2_map7_dt_source    =    6'h2 ;                
    reg_pipe2_map8_dt_source    =    6'h3 ;                
    reg_pipe2_map9_dt_source    =    6'h2c;                
    reg_pipe2_map0_dt_dest      =    6'h0 ;            
    reg_pipe2_map1_dt_dest      =    6'h1 ;            
    reg_pipe2_map2_dt_dest      =    6'h2 ;            
    reg_pipe2_map3_dt_dest      =    6'h3 ;            
    reg_pipe2_map4_dt_dest      =    6'h2c;            
    reg_pipe2_map5_dt_dest      =    6'h0 ;            
    reg_pipe2_map6_dt_dest      =    6'h1 ;            
    reg_pipe2_map7_dt_dest      =    6'h2 ;            
    reg_pipe2_map8_dt_dest      =    6'h3 ;            
    reg_pipe2_map9_dt_dest      =    6'h2c;            
    reg_pipe3_map0_vc_source    =    2'b00;            
    reg_pipe3_map1_vc_source    =    2'b00;            
    reg_pipe3_map2_vc_source    =    2'b00;            
    reg_pipe3_map3_vc_source    =    2'b00;            
    reg_pipe3_map4_vc_source    =    2'b00;            
    reg_pipe3_map5_vc_source    =    2'b01;        
    reg_pipe3_map6_vc_source    =    2'b01;        
    reg_pipe3_map7_vc_source    =    2'b01;        
    reg_pipe3_map8_vc_source    =    2'b01;        
    reg_pipe3_map9_vc_source    =    2'b01;        
    reg_pipe3_map0_vc_dest      =    2'b01;            
    reg_pipe3_map1_vc_dest      =    2'b01;            
    reg_pipe3_map2_vc_dest      =    2'b01;            
    reg_pipe3_map3_vc_dest      =    2'b01;            
    reg_pipe3_map4_vc_dest      =    2'b01;            
    reg_pipe3_map5_vc_dest      =    2'b00;        
    reg_pipe3_map6_vc_dest      =    2'b00;        
    reg_pipe3_map7_vc_dest      =    2'b00;        
    reg_pipe3_map8_vc_dest      =    2'b00;        
    reg_pipe3_map9_vc_dest      =    2'b00;        
    reg_pipe3_map0_dt_source    =    6'h0 ;                    
    reg_pipe3_map1_dt_source    =    6'h1 ;                    
    reg_pipe3_map2_dt_source    =    6'h2 ;                    
    reg_pipe3_map3_dt_source    =    6'h3 ;                    
    reg_pipe3_map4_dt_source    =    6'h2d;                
    reg_pipe3_map5_dt_source    =    6'h0 ;                
    reg_pipe3_map6_dt_source    =    6'h1 ;                
    reg_pipe3_map7_dt_source    =    6'h2 ;                
    reg_pipe3_map8_dt_source    =    6'h3 ;                
    reg_pipe3_map9_dt_source    =    6'h2d;                
    reg_pipe3_map0_dt_dest      =    6'h0 ;            
    reg_pipe3_map1_dt_dest      =    6'h1 ;            
    reg_pipe3_map2_dt_dest      =    6'h2 ;            
    reg_pipe3_map3_dt_dest      =    6'h3 ;            
    reg_pipe3_map4_dt_dest      =    6'h2d;            
    reg_pipe3_map5_dt_dest      =    6'h0 ;            
    reg_pipe3_map6_dt_dest      =    6'h1 ;            
    reg_pipe3_map7_dt_dest      =    6'h2 ;            
    reg_pipe3_map8_dt_dest      =    6'h3 ;            
    reg_pipe3_map9_dt_dest      =    6'h2d;            
    reg_pipe4_map0_vc_source    =    2'b00;            
    reg_pipe4_map1_vc_source    =    2'b00;            
    reg_pipe4_map2_vc_source    =    2'b00;            
    reg_pipe4_map3_vc_source    =    2'b00;            
    reg_pipe4_map4_vc_source    =    2'b00;            
    reg_pipe4_map5_vc_source    =    2'b01;        
    reg_pipe4_map6_vc_source    =    2'b01;        
    reg_pipe4_map7_vc_source    =    2'b01;        
    reg_pipe4_map8_vc_source    =    2'b01;        
    reg_pipe4_map9_vc_source    =    2'b01;        
    reg_pipe4_map0_vc_dest      =    2'b01;            
    reg_pipe4_map1_vc_dest      =    2'b01;            
    reg_pipe4_map2_vc_dest      =    2'b01;            
    reg_pipe4_map3_vc_dest      =    2'b01;            
    reg_pipe4_map4_vc_dest      =    2'b01;            
    reg_pipe4_map5_vc_dest      =    2'b00;        
    reg_pipe4_map6_vc_dest      =    2'b00;        
    reg_pipe4_map7_vc_dest      =    2'b00;        
    reg_pipe4_map8_vc_dest      =    2'b00;        
    reg_pipe4_map9_vc_dest      =    2'b00;        
    reg_pipe4_map0_dt_source    =    6'h0 ;                    
    reg_pipe4_map1_dt_source    =    6'h1 ;                    
    reg_pipe4_map2_dt_source    =    6'h2 ;                    
    reg_pipe4_map3_dt_source    =    6'h3 ;                    
    reg_pipe4_map4_dt_source    =    6'h2a;                
    reg_pipe4_map5_dt_source    =    6'h0 ;                
    reg_pipe4_map6_dt_source    =    6'h1 ;                
    reg_pipe4_map7_dt_source    =    6'h2 ;                
    reg_pipe4_map8_dt_source    =    6'h3 ;                
    reg_pipe4_map9_dt_source    =    6'h2a;                
    reg_pipe4_map0_dt_dest      =    6'h0 ;            
    reg_pipe4_map1_dt_dest      =    6'h1 ;            
    reg_pipe4_map2_dt_dest      =    6'h2 ;            
    reg_pipe4_map3_dt_dest      =    6'h3 ;            
    reg_pipe4_map4_dt_dest      =    6'h2a;            
    reg_pipe4_map5_dt_dest      =    6'h0 ;            
    reg_pipe4_map6_dt_dest      =    6'h1 ;            
    reg_pipe4_map7_dt_dest      =    6'h2 ;            
    reg_pipe4_map8_dt_dest      =    6'h3 ;            
    reg_pipe4_map9_dt_dest      =    6'h2a;            
    reg_pipe5_map0_vc_source    =    2'b00;            
    reg_pipe5_map1_vc_source    =    2'b00;            
    reg_pipe5_map2_vc_source    =    2'b00;            
    reg_pipe5_map3_vc_source    =    2'b00;            
    reg_pipe5_map4_vc_source    =    2'b00;            
    reg_pipe5_map5_vc_source    =    2'b01;        
    reg_pipe5_map6_vc_source    =    2'b01;        
    reg_pipe5_map7_vc_source    =    2'b01;        
    reg_pipe5_map8_vc_source    =    2'b01;        
    reg_pipe5_map9_vc_source    =    2'b01;        
    reg_pipe5_map0_vc_dest      =    2'b01;            
    reg_pipe5_map1_vc_dest      =    2'b01;            
    reg_pipe5_map2_vc_dest      =    2'b01;            
    reg_pipe5_map3_vc_dest      =    2'b01;            
    reg_pipe5_map4_vc_dest      =    2'b01;            
    reg_pipe5_map5_vc_dest      =    2'b00;        
    reg_pipe5_map6_vc_dest      =    2'b00;        
    reg_pipe5_map7_vc_dest      =    2'b00;        
    reg_pipe5_map8_vc_dest      =    2'b00;        
    reg_pipe5_map9_vc_dest      =    2'b00;        
    reg_pipe5_map0_dt_source    =    6'h0 ;                    
    reg_pipe5_map1_dt_source    =    6'h1 ;                    
    reg_pipe5_map2_dt_source    =    6'h2 ;                    
    reg_pipe5_map3_dt_source    =    6'h3 ;                    
    reg_pipe5_map4_dt_source    =    6'h2b;                
    reg_pipe5_map5_dt_source    =    6'h0 ;                
    reg_pipe5_map6_dt_source    =    6'h1 ;                
    reg_pipe5_map7_dt_source    =    6'h2 ;                
    reg_pipe5_map8_dt_source    =    6'h3 ;                
    reg_pipe5_map9_dt_source    =    6'h2b;                
    reg_pipe5_map0_dt_dest      =    6'h0 ;            
    reg_pipe5_map1_dt_dest      =    6'h1 ;            
    reg_pipe5_map2_dt_dest      =    6'h2 ;            
    reg_pipe5_map3_dt_dest      =    6'h3 ;            
    reg_pipe5_map4_dt_dest      =    6'h2b;            
    reg_pipe5_map5_dt_dest      =    6'h0 ;            
    reg_pipe5_map6_dt_dest      =    6'h1 ;            
    reg_pipe5_map7_dt_dest      =    6'h2 ;            
    reg_pipe5_map8_dt_dest      =    6'h3 ;            
    reg_pipe5_map9_dt_dest      =    6'h2b;            
    reg_pipe6_map0_vc_source    =    2'b00;            
    reg_pipe6_map1_vc_source    =    2'b00;            
    reg_pipe6_map2_vc_source    =    2'b00;            
    reg_pipe6_map3_vc_source    =    2'b00;            
    reg_pipe6_map4_vc_source    =    2'b00;            
    reg_pipe6_map5_vc_source    =    2'b01;        
    reg_pipe6_map6_vc_source    =    2'b01;        
    reg_pipe6_map7_vc_source    =    2'b01;        
    reg_pipe6_map8_vc_source    =    2'b01;        
    reg_pipe6_map9_vc_source    =    2'b01;        
    reg_pipe6_map0_vc_dest      =    2'b01;            
    reg_pipe6_map1_vc_dest      =    2'b01;            
    reg_pipe6_map2_vc_dest      =    2'b01;            
    reg_pipe6_map3_vc_dest      =    2'b01;            
    reg_pipe6_map4_vc_dest      =    2'b01;            
    reg_pipe6_map5_vc_dest      =    2'b00;        
    reg_pipe6_map6_vc_dest      =    2'b00;        
    reg_pipe6_map7_vc_dest      =    2'b00;        
    reg_pipe6_map8_vc_dest      =    2'b00;        
    reg_pipe6_map9_vc_dest      =    2'b00;        
    reg_pipe6_map0_dt_source    =    6'h0 ;                    
    reg_pipe6_map1_dt_source    =    6'h1 ;                    
    reg_pipe6_map2_dt_source    =    6'h2 ;                    
    reg_pipe6_map3_dt_source    =    6'h3 ;                    
    reg_pipe6_map4_dt_source    =    6'h2c;                
    reg_pipe6_map5_dt_source    =    6'h0 ;                
    reg_pipe6_map6_dt_source    =    6'h1 ;                
    reg_pipe6_map7_dt_source    =    6'h2 ;                
    reg_pipe6_map8_dt_source    =    6'h3 ;                
    reg_pipe6_map9_dt_source    =    6'h2c;                
    reg_pipe6_map0_dt_dest      =    6'h0 ;            
    reg_pipe6_map1_dt_dest      =    6'h1 ;            
    reg_pipe6_map2_dt_dest      =    6'h2 ;            
    reg_pipe6_map3_dt_dest      =    6'h3 ;            
    reg_pipe6_map4_dt_dest      =    6'h2c;            
    reg_pipe6_map5_dt_dest      =    6'h0 ;            
    reg_pipe6_map6_dt_dest      =    6'h1 ;            
    reg_pipe6_map7_dt_dest      =    6'h2 ;            
    reg_pipe6_map8_dt_dest      =    6'h3 ;            
    reg_pipe6_map9_dt_dest      =    6'h2c;            
    reg_pipe7_map0_vc_source    =    2'b00;            
    reg_pipe7_map1_vc_source    =    2'b00;            
    reg_pipe7_map2_vc_source    =    2'b00;            
    reg_pipe7_map3_vc_source    =    2'b00;            
    reg_pipe7_map4_vc_source    =    2'b00;            
    reg_pipe7_map5_vc_source    =    2'b01;        
    reg_pipe7_map6_vc_source    =    2'b01;        
    reg_pipe7_map7_vc_source    =    2'b01;        
    reg_pipe7_map8_vc_source    =    2'b01;        
    reg_pipe7_map9_vc_source    =    2'b01;        
    reg_pipe7_map0_vc_dest      =    2'b01;            
    reg_pipe7_map1_vc_dest      =    2'b01;            
    reg_pipe7_map2_vc_dest      =    2'b01;            
    reg_pipe7_map3_vc_dest      =    2'b01;            
    reg_pipe7_map4_vc_dest      =    2'b01;            
    reg_pipe7_map5_vc_dest      =    2'b00;        
    reg_pipe7_map6_vc_dest      =    2'b00;        
    reg_pipe7_map7_vc_dest      =    2'b00;        
    reg_pipe7_map8_vc_dest      =    2'b00;        
    reg_pipe7_map9_vc_dest      =    2'b00;        
    reg_pipe7_map0_dt_source    =    6'h0 ;                    
    reg_pipe7_map1_dt_source    =    6'h1 ;                    
    reg_pipe7_map2_dt_source    =    6'h2 ;                    
    reg_pipe7_map3_dt_source    =    6'h3 ;                    
    reg_pipe7_map4_dt_source    =    6'h2d;                
    reg_pipe7_map5_dt_source    =    6'h0 ;                
    reg_pipe7_map6_dt_source    =    6'h1 ;                
    reg_pipe7_map7_dt_source    =    6'h2 ;                
    reg_pipe7_map8_dt_source    =    6'h3 ;                
    reg_pipe7_map9_dt_source    =    6'h2d;                
    reg_pipe7_map0_dt_dest      =    6'h0 ;            
    reg_pipe7_map1_dt_dest      =    6'h1 ;            
    reg_pipe7_map2_dt_dest      =    6'h2 ;            
    reg_pipe7_map3_dt_dest      =    6'h3 ;            
    reg_pipe7_map4_dt_dest      =    6'h2d;            
    reg_pipe7_map5_dt_dest      =    6'h0 ;            
    reg_pipe7_map6_dt_dest      =    6'h1 ;            
    reg_pipe7_map7_dt_dest      =    6'h2 ;            
    reg_pipe7_map8_dt_dest      =    6'h3 ;            
    reg_pipe7_map9_dt_dest      =    6'h2d;            

    reg_pipe0_map_en            =    16'h03ff;            
    reg_pipe1_map_en            =    16'h03ff;            
    reg_pipe2_map_en            =    16'h03ff;            
    reg_pipe3_map_en            =    16'h03ff;            
    reg_pipe4_map_en            =    16'h03ff;            
    reg_pipe5_map_en            =    16'h03ff;            
    reg_pipe6_map_en            =    16'h03ff;            
    reg_pipe7_map_en            =    16'h03ff;            
    
    reg_pipe0_map0_aggr_id      =    4'd2;            
    reg_pipe0_map1_aggr_id      =    4'd2;            
    reg_pipe0_map2_aggr_id      =    4'd2;            
    reg_pipe0_map3_aggr_id      =    4'd2;            
    reg_pipe0_map4_aggr_id      =    4'd2;            
    reg_pipe0_map5_aggr_id      =    4'd1;            
    reg_pipe0_map6_aggr_id      =    4'd1;            
    reg_pipe0_map7_aggr_id      =    4'd1;            
    reg_pipe0_map8_aggr_id      =    4'd1;            
    reg_pipe0_map9_aggr_id      =    4'd1;            
    reg_pipe1_map0_aggr_id      =    4'd2;            
    reg_pipe1_map1_aggr_id      =    4'd2;            
    reg_pipe1_map2_aggr_id      =    4'd2;            
    reg_pipe1_map3_aggr_id      =    4'd2;            
    reg_pipe1_map4_aggr_id      =    4'd2;            
    reg_pipe1_map5_aggr_id      =    4'd1;            
    reg_pipe1_map6_aggr_id      =    4'd1;            
    reg_pipe1_map7_aggr_id      =    4'd1;            
    reg_pipe1_map8_aggr_id      =    4'd1;            
    reg_pipe1_map9_aggr_id      =    4'd1;            
    reg_pipe2_map0_aggr_id      =    4'd2;            
    reg_pipe2_map1_aggr_id      =    4'd2;            
    reg_pipe2_map2_aggr_id      =    4'd2;            
    reg_pipe2_map3_aggr_id      =    4'd2;            
    reg_pipe2_map4_aggr_id      =    4'd2;            
    reg_pipe2_map5_aggr_id      =    4'd1;            
    reg_pipe2_map6_aggr_id      =    4'd1;            
    reg_pipe2_map7_aggr_id      =    4'd1;            
    reg_pipe2_map8_aggr_id      =    4'd1;            
    reg_pipe2_map9_aggr_id      =    4'd1;            
    reg_pipe3_map0_aggr_id      =    4'd2;            
    reg_pipe3_map1_aggr_id      =    4'd2;            
    reg_pipe3_map2_aggr_id      =    4'd2;            
    reg_pipe3_map3_aggr_id      =    4'd2;            
    reg_pipe3_map4_aggr_id      =    4'd2;            
    reg_pipe3_map5_aggr_id      =    4'd1;            
    reg_pipe3_map6_aggr_id      =    4'd1;            
    reg_pipe3_map7_aggr_id      =    4'd1;            
    reg_pipe3_map8_aggr_id      =    4'd1;            
    reg_pipe3_map9_aggr_id      =    4'd1;            
    reg_pipe4_map0_aggr_id      =    4'd2;            
    reg_pipe4_map1_aggr_id      =    4'd2;            
    reg_pipe4_map2_aggr_id      =    4'd2;            
    reg_pipe4_map3_aggr_id      =    4'd2;            
    reg_pipe4_map4_aggr_id      =    4'd2;            
    reg_pipe4_map5_aggr_id      =    4'd1;            
    reg_pipe4_map6_aggr_id      =    4'd1;            
    reg_pipe4_map7_aggr_id      =    4'd1;            
    reg_pipe4_map8_aggr_id      =    4'd1;            
    reg_pipe4_map9_aggr_id      =    4'd1;            
    reg_pipe5_map0_aggr_id      =    4'd2;            
    reg_pipe5_map1_aggr_id      =    4'd2;            
    reg_pipe5_map2_aggr_id      =    4'd2;            
    reg_pipe5_map3_aggr_id      =    4'd2;            
    reg_pipe5_map4_aggr_id      =    4'd2;            
    reg_pipe5_map5_aggr_id      =    4'd1;            
    reg_pipe5_map6_aggr_id      =    4'd1;            
    reg_pipe5_map7_aggr_id      =    4'd1;            
    reg_pipe5_map8_aggr_id      =    4'd1;            
    reg_pipe5_map9_aggr_id      =    4'd1;            
    reg_pipe6_map0_aggr_id      =    4'd2;            
    reg_pipe6_map1_aggr_id      =    4'd2;            
    reg_pipe6_map2_aggr_id      =    4'd2;            
    reg_pipe6_map3_aggr_id      =    4'd2;            
    reg_pipe6_map4_aggr_id      =    4'd2;            
    reg_pipe6_map5_aggr_id      =    4'd1;            
    reg_pipe6_map6_aggr_id      =    4'd1;            
    reg_pipe6_map7_aggr_id      =    4'd1;            
    reg_pipe6_map8_aggr_id      =    4'd1;            
    reg_pipe6_map9_aggr_id      =    4'd1;            
    reg_pipe7_map0_aggr_id      =    4'd2;            
    reg_pipe7_map1_aggr_id      =    4'd2;            
    reg_pipe7_map2_aggr_id      =    4'd2;            
    reg_pipe7_map3_aggr_id      =    4'd2;            
    reg_pipe7_map4_aggr_id      =    4'd2;            
    reg_pipe7_map5_aggr_id      =    4'd1;            
    reg_pipe7_map6_aggr_id      =    4'd1;            
    reg_pipe7_map7_aggr_id      =    4'd1;            
    reg_pipe7_map8_aggr_id      =    4'd1;            
    reg_pipe7_map9_aggr_id      =    4'd1;            
endtask//init_reg_async_methed2_8pipe_pipe01234567sch01

task init_reg_concat_4pipe_pipesch1();
    test_mode = 1'd0;
    //vpg0~3 same datatype 
    vpg_dt_qst0                 = 6'h2b     ;   
    vpg_pkt_size_qst0           = 14'd400   ;
    vpg_dt_qst1                 = 6'h2b     ;   
    vpg_pkt_size_qst1           = 14'd400   ;
    vpg_dt_qst2                 = 6'h2b     ;   
    vpg_pkt_size_qst2           = 14'd400   ;
    vpg_dt_qst3                 = 6'h2b     ;   
    vpg_pkt_size_qst3           = 14'd400   ;
    //***sch sync cfg
    reg_sch1_fse_filter                         =   1'd1                       ;

    reg_pipe0_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe1_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe2_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe3_drop_ls_le_pkt                    =   1'd1                       ;

    reg_app_sch0                = 16'b0000_0000_0000_0000    ;
    reg_app_sch1                = 16'b0000_0100_1111_0000    ;
    reg_app_sch2                = 16'b0000_0000_0000_0000    ;
    reg_app_sch3                = 16'b0000_0000_0000_0000    ;
    //***pipe@@ map cfg
    reg_pipe0_map0_vc_source    =    2'b00;            
    reg_pipe0_map0_vc_dest      =    2'b00;            
    reg_pipe0_map0_dt_source    =    6'h2b;            
    reg_pipe0_map0_dt_dest      =    6'h2b;            
    reg_pipe0_map0_aggr_id      =    4'd0;            
    reg_pipe0_map_en            =    16'h0000;            
    reg_pipe1_map0_vc_source    =    2'b00;            
    reg_pipe1_map0_vc_dest      =    2'b00;            
    reg_pipe1_map0_dt_source    =    6'h2b;            
    reg_pipe1_map0_dt_dest      =    6'h2b;            
    reg_pipe1_map0_aggr_id      =    4'd0;            
    reg_pipe1_map_en            =    16'h0000;            
    reg_pipe2_map0_vc_source    =    2'b00;            
    reg_pipe2_map0_vc_dest      =    2'b00;            
    reg_pipe2_map0_dt_source    =    6'h2b;            
    reg_pipe2_map0_dt_dest      =    6'h2b;            
    reg_pipe2_map0_aggr_id      =    4'd0;            
    reg_pipe2_map_en            =    16'h0000;            
    reg_pipe3_map0_vc_source    =    2'b00;            
    reg_pipe3_map0_vc_dest      =    2'b00;            
    reg_pipe3_map0_dt_source    =    6'h2b;            
    reg_pipe3_map0_dt_dest      =    6'h2b;            
    reg_pipe3_map0_aggr_id      =    4'd0;            
    reg_pipe3_map_en            =    16'h0000;            
    reg_drop_mapping_fault_pkt  =    8'h00;

    reg_sync_aggr_0_video_mask_latch_reset = 1'd0;
    reg_sync_aggr_1_video_mask_latch_reset = 1'd0;
    reg_sync_aggr_2_video_mask_latch_reset = 1'd0;
    reg_sync_aggr_3_video_mask_latch_reset = 1'd0;
    reg_sync_aggr_auto_mask_en = 4'hf;
    reg_sync_aggr_check_framecount_en = 1'd0;
    reg_sync_aggr_check_linecount_en = 1'd0;
    reg_sync_aggr_force_video_mask = 4'h0;
    reg_sync_aggr_video_mask_restart = 4'hf;
    reg_sync_aggr_video_status_info_datatype = 6'h2a;
    reg_sync_aggr_video_status_info_linecount = 16'd20;
    reg_sync_aggr_video_status_info_vc = 5'h0;
    reg_sync_aggr_video_status_info_wordcount = 16'd200;
    reg_sync_aggr_video_timeout_threshold = 20'd20;
endtask//init_reg_concat_4pipe_pipesch1

task init_reg_concat_3pipe_pipesch1();
    test_mode = 1'd1;
    //vpg0~3 same datatype 
    vpg_dt_qst0                 = 6'h2b     ;   
    vpg_pkt_size_qst0           = 14'd400   ;
    vpg_dt_qst1                 = 6'h2b     ;   
    vpg_pkt_size_qst1           = 14'd400   ;
    vpg_dt_qst2                 = 6'h2b     ;   
    vpg_pkt_size_qst2           = 14'd400   ;
    vpg_dt_qst3                 = 6'h2b     ;   
    vpg_pkt_size_qst3           = 14'd400   ;
    //***sch sync cfg
    reg_sch1_fse_filter                         =   1'd1                       ;

    reg_pipe0_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe1_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe2_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe3_drop_ls_le_pkt                    =   1'd1                       ;

    reg_app_sch0                = 16'b0000_0000_0000_0000    ;
    reg_app_sch1                = 16'b0000_0100_0111_0000    ;
    reg_app_sch2                = 16'b0000_0000_0000_0000    ;
    reg_app_sch3                = 16'b0000_0000_0000_0000    ;
    //***pipe@@ map cfg
    //reg_pipe0_map0_vc_source    =    2'b00;            
    //reg_pipe0_map0_vc_dest      =    2'b00;            
    //reg_pipe0_map0_dt_source    =    6'h2b;            
    //reg_pipe0_map0_dt_dest      =    6'h2b;            
    //reg_pipe0_map0_aggr_id      =    4'd0;            
    //reg_pipe0_map_en            =    16'h0001;            
    //reg_pipe1_map0_vc_source    =    2'b00;            
    //reg_pipe1_map0_vc_dest      =    2'b00;            
    //reg_pipe1_map0_dt_source    =    6'h2b;            
    //reg_pipe1_map0_dt_dest      =    6'h2b;            
    //reg_pipe1_map0_aggr_id      =    4'd0;            
    //reg_pipe1_map_en            =    16'h0001;            
    //reg_pipe2_map0_vc_source    =    2'b00;            
    //reg_pipe2_map0_vc_dest      =    2'b00;            
    //reg_pipe2_map0_dt_source    =    6'h2b;            
    //reg_pipe2_map0_dt_dest      =    6'h2b;            
    //reg_pipe2_map0_aggr_id      =    4'd0;            
    //reg_pipe2_map_en            =    16'h0001;            
    //reg_pipe3_map0_vc_source    =    2'b00;            
    //reg_pipe3_map0_vc_dest      =    2'b00;            
    //reg_pipe3_map0_dt_source    =    6'h2b;            
    //reg_pipe3_map0_dt_dest      =    6'h2b;            
    //reg_pipe3_map0_aggr_id      =    4'd0;            
    //reg_pipe3_map_en            =    16'h0001;            
    //reg_drop_mapping_fault_pkt  =    8'hff;

endtask//init_reg_concat_3pipe_pipesch1

task init_reg_concat_4pipe_pipe03sch1_pipe12sch2();
    test_mode = 1'd1;
    //vpg0~3 same datatype 
    vpg_dt_qst0                 = 6'h2b     ;   
    vpg_pkt_size_qst0           = 14'd400   ;
    vpg_dt_qst1                 = 6'h2b     ;   
    vpg_pkt_size_qst1           = 14'd400   ;
    vpg_dt_qst2                 = 6'h2b     ;   
    vpg_pkt_size_qst2           = 14'd400   ;
    vpg_dt_qst3                 = 6'h2b     ;   
    vpg_pkt_size_qst3           = 14'd400   ;
    //***sch sync cfg
    reg_sch1_fse_filter                         =   1'd1                       ;
    reg_sch2_fse_filter                         =   1'd1                       ;

    reg_pipe0_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe1_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe2_drop_ls_le_pkt                    =   1'd1                       ;
    reg_pipe3_drop_ls_le_pkt                    =   1'd1                       ;

    reg_app_sch0                = 16'b0000_0000_0000_0000    ;
    reg_app_sch1                = 16'b0000_0111_1001_0000    ;
    reg_app_sch2                = 16'b0000_0110_0110_0000    ;
    reg_app_sch3                = 16'b0000_0000_0000_0000    ;
    //***pipe@@ map cfg
    //reg_pipe0_map0_vc_source    =    2'b00;            
    //reg_pipe0_map0_vc_dest      =    2'b00;            
    //reg_pipe0_map0_dt_source    =    6'h2b;            
    //reg_pipe0_map0_dt_dest      =    6'h2b;            
    //reg_pipe0_map0_aggr_id      =    4'd0;            
    //reg_pipe0_map_en            =    16'h0001;            
    //reg_pipe1_map0_vc_source    =    2'b00;            
    //reg_pipe1_map0_vc_dest      =    2'b00;            
    //reg_pipe1_map0_dt_source    =    6'h2b;            
    //reg_pipe1_map0_dt_dest      =    6'h2b;            
    //reg_pipe1_map0_aggr_id      =    4'd0;            
    //reg_pipe1_map_en            =    16'h0001;            
    //reg_pipe2_map0_vc_source    =    2'b00;            
    //reg_pipe2_map0_vc_dest      =    2'b00;            
    //reg_pipe2_map0_dt_source    =    6'h2b;            
    //reg_pipe2_map0_dt_dest      =    6'h2b;            
    //reg_pipe2_map0_aggr_id      =    4'd0;            
    //reg_pipe2_map_en            =    16'h0001;            
    //reg_pipe3_map0_vc_source    =    2'b00;            
    //reg_pipe3_map0_vc_dest      =    2'b00;            
    //reg_pipe3_map0_dt_source    =    6'h2b;            
    //reg_pipe3_map0_dt_dest      =    6'h2b;            
    //reg_pipe3_map0_aggr_id      =    4'd0;            
    //reg_pipe3_map_en            =    16'h0001;            
    //reg_drop_mapping_fault_pkt  =    8'hff;
endtask//init_reg_concat_4pipe_pipe03sch1_pipe12sch2

task init_reg_concat_4pipe_pipesch1_auto_change_pipe_wr_mode();
    test_mode = 1'd1;
    //vpg0~3 same datatype 
    vpg_dt_qst0                 = 6'h2b     ;   
    vpg_pkt_size_qst0           = 14'd400   ;
    vpg_dt_qst1                 = 6'h2b     ;   
    vpg_pkt_size_qst1           = 14'd400   ;
    vpg_dt_qst2                 = 6'h2b     ;   
    vpg_pkt_size_qst2           = 14'd400   ;
    vpg_dt_qst3                 = 6'h2b     ;   
    vpg_pkt_size_qst3           = 14'd400   ;
    //***sch sync cfg
    reg_sch1_fse_filter         = 1'd1      ;

    reg_pipe0_drop_ls_le_pkt    = 1'd1      ;
    reg_pipe1_drop_ls_le_pkt    = 1'd1      ;
    reg_pipe2_drop_ls_le_pkt    = 1'd1      ;
    reg_pipe3_drop_ls_le_pkt    = 1'd1      ;

    reg_app_sch0                = 16'b0000_0000_0000_0000    ;
    reg_app_sch1                = 16'b0000_0100_1111_0000    ;
    reg_app_sch2                = 16'b0000_0000_0000_0000    ;
    reg_app_sch3                = 16'b0000_0000_0000_0000    ;
    //***pipe@@ map cfg
    //reg_pipe0_map0_vc_source    =    2'b00;            
    //reg_pipe0_map0_vc_dest      =    2'b00;            
    //reg_pipe0_map0_dt_source    =    6'h2b;            
    //reg_pipe0_map0_dt_dest      =    6'h2b;            
    //reg_pipe0_map0_aggr_id      =    4'd0;            
    //reg_pipe0_map_en            =    16'h0001;            
    //reg_pipe1_map0_vc_source    =    2'b00;            
    //reg_pipe1_map0_vc_dest      =    2'b00;            
    //reg_pipe1_map0_dt_source    =    6'h2b;            
    //reg_pipe1_map0_dt_dest      =    6'h2b;            
    //reg_pipe1_map0_aggr_id      =    4'd0;            
    //reg_pipe1_map_en            =    16'h0001;            
    //reg_pipe2_map0_vc_source    =    2'b00;            
    //reg_pipe2_map0_vc_dest      =    2'b00;            
    //reg_pipe2_map0_dt_source    =    6'h2b;            
    //reg_pipe2_map0_dt_dest      =    6'h2b;            
    //reg_pipe2_map0_aggr_id      =    4'd0;            
    //reg_pipe2_map_en            =    16'h0001;            
    //reg_pipe3_map0_vc_source    =    2'b00;            
    //reg_pipe3_map0_vc_dest      =    2'b00;            
    //reg_pipe3_map0_dt_source    =    6'h2b;            
    //reg_pipe3_map0_dt_dest      =    6'h2b;            
    //reg_pipe3_map0_aggr_id      =    4'd0;            
    //reg_pipe3_map_en            =    16'h0001;            
    //reg_drop_mapping_fault_pkt  =    8'h0;
    #2
    vpg_vactive_lines_qst3      = 14'd8     ;

    #20
    reg_app_sch0_frame_sync_lock_force = 1'd0            ;
    reg_app_sch1_frame_sync_lock_force = 1'd0            ;
    reg_app_sch2_frame_sync_lock_force = 1'd0            ;
    reg_app_sch3_frame_sync_lock_force = 1'd0            ;
    #2000
    gpio2app_sch0_frame_sync_lock = 1'd1            ;
    gpio2app_sch1_frame_sync_lock = 1'd1            ;
    gpio2app_sch2_frame_sync_lock = 1'd1            ;
    gpio2app_sch3_frame_sync_lock = 1'd1            ;


endtask//init_reg_concat_4pipe_pipesch1_auto_change_pipe_wr_mode

task init_reg_vpg0_random_vc10_test();

    reg_mipi_host_sel           = 1'd0      ;
    vpg_packet_lost_ack0        = 1'd0      ;
    vpg_orientation_qst0        = 1'd1      ;
    vpg_mode_qst0               = 1'd0      ;  
    vpg_hsync_packet_en_qst0    = 1'd1      ;
    vpg_vc_qst0                 = 2'd0      ;  
    vpg_vcx_qst0                = 2'd0      ;  
    //vpg_dt_qst0                 = 6'h2a     ;   
    vpg_dt_qst0                 = 6'h2b     ;   
//    vpg_pkt_size_qst0           = 14'd400   ;
    vpg_pkt_size_qst0           = 14'd1920   ;
    vpg_hsa_time_qst0           = 12'h80    ;
    vpg_hbp_time_qst0           = 12'h40    ;
    vpg_hline_time_qst0         = 15'h1000  ;
    vpg_vsa_lines_qst0          = 10'ha     ;
    vpg_vbp_lines_qst0          = 10'ha     ;
    vpg_vfp_lines_qst0          = 10'ha     ;
    vpg_vactive_lines_qst0      = 14'd1200   ;
    vpg_bk_lines_qst0           = 10'h64    ;
    vpg_frame_num_mode_qst0     = 1'h1      ;
    vpg_max_frame_num_qst0      = 16'd999   ;
    vpg_line_num_mode_qst0      = 2'd1      ;
    vpg_start_line_num_qst0     = 16'd0     ;
    vpg_step_line_num_qst0      = 16'd1     ;
    
endtask

task init_reg_vpg1_random_vc10_test();

    reg_mipi_host_sel           = 1'd0      ;
    vpg_packet_lost_ack1        = 1'd0      ;
    vpg_orientation_qst1        = 1'd0      ;
    vpg_mode_qst1               = 1'd0      ;  
    vpg_hsync_packet_en_qst1    = 1'd1      ;
    vpg_vc_qst1                 = 2'd0      ;  
    vpg_vcx_qst1                = 2'd0      ;  
    vpg_dt_qst1                 = 6'h2b     ;   
    vpg_pkt_size_qst1           = 14'd600   ;
    vpg_hsa_time_qst1           = 12'd58    ;
    vpg_hbp_time_qst1           = 12'd58    ;
    vpg_hline_time_qst1         = 15'd220  ;
    vpg_vsa_lines_qst1          = 10'd1     ;
    vpg_vbp_lines_qst1          = 10'd1     ;
    vpg_vfp_lines_qst1          = 10'd1     ;
    vpg_vactive_lines_qst1      = 14'd10    ;
    vpg_bk_lines_qst1           = 10'd3     ;
    vpg_frame_num_mode_qst1     = 1'd0      ;
    vpg_max_frame_num_qst1      = 16'd21501 ;
    vpg_line_num_mode_qst1      = 2'd0      ;
    vpg_start_line_num_qst1     = 16'd2847  ;
    vpg_step_line_num_qst1      = 16'd1588  ;
    
endtask

task init_reg_vpg2_random_vc10_test();

    reg_mipi_host_sel           = 1'd0      ;
    vpg_packet_lost_ack1        = 1'd0      ;
    vpg_orientation_qst2        = 1'd0      ;
    vpg_mode_qst2               = 1'd0      ;  
    vpg_hsync_packet_en_qst2    = 1'd1      ;
    vpg_vc_qst2                 = 2'd0      ;  
    vpg_vcx_qst2                = 2'd0      ;  
    vpg_dt_qst2                 = 6'h2c     ;   
    vpg_pkt_size_qst2           = 14'd400   ;
    vpg_hsa_time_qst2           = 12'd58    ;
    vpg_hbp_time_qst2           = 12'd58    ;
    vpg_hline_time_qst2         = 15'd220  ;
    vpg_vsa_lines_qst2          = 10'd1     ;
    vpg_vbp_lines_qst2          = 10'd1     ;
    vpg_vfp_lines_qst2          = 10'd2     ;
    vpg_vactive_lines_qst2      = 14'd10    ;
    vpg_bk_lines_qst2           = 10'd2     ;
    vpg_frame_num_mode_qst2     = 1'd0      ;
    vpg_max_frame_num_qst2      = 16'd21501 ;
    vpg_line_num_mode_qst2      = 2'd0      ;
    vpg_start_line_num_qst2     = 16'd2847  ;
    vpg_step_line_num_qst2      = 16'd1588  ;
    
endtask

task init_reg_vpg3_random_vc10_test();

    reg_mipi_host_sel           = 1'd0      ;
    vpg_packet_lost_ack3        = 1'd0      ;
    vpg_orientation_qst3        = 1'd0      ;
    vpg_mode_qst3               = 1'd0      ;  
    vpg_hsync_packet_en_qst3    = 1'd1      ;
    vpg_vc_qst3                 = 2'd0      ;  
    vpg_vcx_qst3                = 2'd0      ;  
    vpg_dt_qst3                 = 6'h2a     ;   
    vpg_pkt_size_qst3           = 14'd1280  ;
    vpg_hsa_time_qst3           = 12'd50    ;
    vpg_hbp_time_qst3           = 12'd300   ;
    vpg_hline_time_qst3         = 15'd2222  ;
    vpg_vsa_lines_qst3          = 10'd5     ;
    vpg_vbp_lines_qst3          = 10'd20    ;
    vpg_vfp_lines_qst3          = 10'd5     ;
    vpg_vactive_lines_qst3      = 14'd100   ;
    vpg_bk_lines_qst3           = 10'd0     ;
    vpg_frame_num_mode_qst3     = 1'd0      ;
    vpg_max_frame_num_qst3      = 16'd21501 ;
    vpg_line_num_mode_qst3      = 2'd0      ;
    vpg_start_line_num_qst3     = 16'd2847  ;
    vpg_step_line_num_qst3      = 16'd1588  ;
    
endtask

task init_reg_as6s_app_dt_24_pixel();
    reg_mem_dt1_selz            = 7'h0                       ;
    reg_mem_dt2_selz            = 7'h0                       ;
    reg_mem_dt7_selz            = 7'h0                       ;
    reg_mem_dt8_selz            = 7'b110_0100                ;
    reg_mem_dt3_selz            = 8'd0                       ;
    reg_mem_dt4_selz            = 8'd0                       ;
    reg_mem_dt3_selz_en         = 1'd0                       ;
    reg_mem_dt4_selz_en         = 1'd0                       ;
    reg_vc_selz_l               = 8'hff                      ;
    reg_vc_selz_h               = 8'hff                      ;
endtask

task init_reg_as6s_app_dt_26_pixel();
    reg_mem_dt1_selz            = 7'h0                       ;
    reg_mem_dt2_selz            = 7'h0                       ;
    reg_mem_dt7_selz            = 7'h0                       ;
    reg_mem_dt8_selz            = 7'b110_0110                ;
    reg_mem_dt3_selz            = 8'd0                       ;
    reg_mem_dt4_selz            = 8'd0                       ;
    reg_mem_dt3_selz_en         = 1'd0                       ;
    reg_mem_dt4_selz_en         = 1'd0                       ;
    reg_vc_selz_l               = 8'hff                      ;
    reg_vc_selz_h               = 8'hff                      ;
endtask

task init_reg_as6s_app_filter_vc_dt_0_2b_pixel();
    reg_mem_dt1_selz            = 7'h0                       ;
    reg_mem_dt2_selz            = 7'h0                       ;
    reg_mem_dt7_selz            = 7'h0                       ;
    reg_mem_dt8_selz            = 7'h0                       ;
    reg_mem_dt3_selz            = 8'h2b                      ;
    reg_mem_dt4_selz            = 8'h0                       ;
    reg_mem_dt3_selz_en         = 1'd1                       ;
    reg_mem_dt4_selz_en         = 1'd0                       ;
    reg_vc_selz_l               = 8'hff                      ;
    reg_vc_selz_h               = 8'hff                      ;
endtask

task init_reg_as6s_app_filter_turn_off();
    reg_mem_dt1_selz            = 7'h0                       ;
    reg_mem_dt2_selz            = 7'h0                       ;
    reg_mem_dt7_selz            = 7'h0                       ;
    reg_mem_dt8_selz            = 7'h0                       ;
    reg_mem_dt3_selz            = 8'h0                       ;
    reg_mem_dt4_selz            = 8'h0                       ;
    reg_mem_dt3_selz_en         = 1'd0                       ;
    reg_mem_dt4_selz_en         = 1'd0                       ;
    reg_vc_selz_l               = 8'hff                      ;
    reg_vc_selz_h               = 8'hff                      ;
endtask

task init_reg_as6s_app_filter_vc_dt_0_0_pixel();
    reg_mem_dt1_selz            = 7'h0                       ;
    reg_mem_dt2_selz            = 7'h0                       ;
    reg_mem_dt7_selz            = 7'h0                       ;
    reg_mem_dt8_selz            = 7'h0                       ;
    reg_mem_dt3_selz            = 8'h0                       ;
    reg_mem_dt4_selz            = 8'h0                       ;
    reg_mem_dt3_selz_en         = 1'd0                       ;
    reg_mem_dt4_selz_en         = 1'd1                       ;
    reg_vc_selz_l               = 8'hff                      ;
    reg_vc_selz_h               = 8'hff                      ;
endtask

task init_reg_as6s_app_filter_vc_9_pixel();
    reg_mem_dt1_selz            = 7'h0                       ;
    reg_mem_dt2_selz            = 7'h0                       ;
    reg_mem_dt7_selz            = 7'h0                       ;
    reg_mem_dt8_selz            = 7'h0                       ;
    reg_mem_dt3_selz            = 8'h0                       ;
    reg_mem_dt4_selz            = 8'h0                       ;
    reg_mem_dt3_selz_en         = 1'd0                       ;
    reg_mem_dt4_selz_en         = 1'd0                       ;
    reg_vc_selz_l               = 8'hf9                      ;
    reg_vc_selz_h               = 8'hff                      ;
endtask

reg [148:0]     mem_ecc_inject_err_bitmap_rand ;
reg [148:0]     mem_ecc_inject_err_bitmap_shift;
reg [148:0]     mem_rand[19:0];
reg             err_clk;
reg             err_rst_n;
integer         ram_ecc_inject_err_index;
integer seed1 = 1;
integer seed2 = 2;
reg ecc_fault_detc_en     ;
reg ecc_addr_protect_en   ;


initial begin
    for (int i = 0; i <= 19; i = i + 1) begin
            mem_rand[i] = {$random(i)}%1000;
    end

    force as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.ecc_fault_detc_en     = ecc_fault_detc_en     ;
    force as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.ecc_addr_protect_en   = ecc_addr_protect_en   ;
    force err_clk   = as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.clk;
    force err_rst_n = as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.nrst;
    mem_ecc_inject_err_bitmap_rand = {$random(seed1)}%11 + 2;//0~149
    mem_ecc_inject_err_bitmap_shift = 149'd1;
    `ifdef ECC_ADDR_PROTECT
    ecc_addr_protect_en = 1'd1;
    `else
    ecc_addr_protect_en = 1'd0;
    `endif

    `ifdef ECC_FAULT_DETC_EN
    ecc_fault_detc_en = 1'd1;
    `else
    ecc_fault_detc_en = 1'd0;
    `endif

    forever @(negedge err_clk) begin
        for (int i = 0; i < 20; i++) begin
            mem_rand[i] <= mem_rand[19-i];
        end
        mem_ecc_inject_err_bitmap_shift = {mem_ecc_inject_err_bitmap_shift[147:0],mem_ecc_inject_err_bitmap_shift[148]};
        //mem_ecc_inject_err_bitmap_rand = {mem_ecc_inject_err_bitmap_rand[147:0],mem_ecc_inject_err_bitmap_rand[148]};
        //mem_ecc_inject_err_bitmap_rand = mem_rand[0];
        mem_ecc_inject_err_bitmap_rand = $urandom_range(0, {149{1'b1}});

    end
end

task ram_ecc_inject_err();
    begin
        force as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.QB_p_tmp0= 
            `ifdef DBIT_ERR
              mem_ecc_inject_err_bitmap_rand ^ as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.QB_p0 ;
            `elsif SBIT_ERR
              mem_ecc_inject_err_bitmap_shift ^ as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.QB_p0 ;
            `else
              as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.QB_p0 ;
            `endif
        `ifdef ECC_FAULT_DETC_EN
        force as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_2048x140_fwft_fifo_wrapper.u0_as6d_app_video_pipe_1r1w_2048x140_fifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper.u_ecc_151_fault_detc.u0_ecc_151_top.mask[150:0]=151'haaaa;
        `endif

        force as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_32x140_ram_wrapper.QB_p_tmp0 = 
            `ifdef DBIT_ERR
              mem_ecc_inject_err_bitmap_rand ^ as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_32x140_ram_wrapper.QB_p0 ;
            `elsif SBIT_ERR
              mem_ecc_inject_err_bitmap_shift ^ as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_32x140_ram_wrapper.QB_p0 ;
            `else
              as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_32x140_ram_wrapper.QB_p0 ;
            `endif
        `ifdef ECC_FAULT_DETC_EN
        force as6d_app_tb.u_as6d_app.u_as6d_app_video_pipe.u0_as6d_app_video_pipe_lane.u_as6d_app_video_pipe_1r1w_32x140_afifo_wrapper.MEM_INST_BK.u0_as6d_app_video_pipe_1r1w_32x140_ram_wrapper.u_ecc_145_fault_detc.mask0[144:0] =145'haaaa;
        `endif

    end
endtask

task crossbar_default();
    reg_crossbar_0                  = 5'd0;
    reg_crossbar_1                  = 5'd1;
    reg_crossbar_2                  = 5'd2;
    reg_crossbar_3                  = 5'd3;
    reg_crossbar_4                  = 5'd4;
    reg_crossbar_5                  = 5'd5;
    reg_crossbar_6                  = 5'd6;
    reg_crossbar_7                  = 5'd7;
    reg_crossbar_8                  = 5'd8;
    reg_crossbar_9                  = 5'd9;
    reg_crossbar_10                 = 5'd10;
    reg_crossbar_11                 = 5'd11;
    reg_crossbar_12                 = 5'd12;
    reg_crossbar_13                 = 5'd13;
    reg_crossbar_14                 = 5'd14;
    reg_crossbar_15                 = 5'd15;
    reg_crossbar_16                 = 5'd16;
    reg_crossbar_17                 = 5'd17;
    reg_crossbar_18                 = 5'd18;
    reg_crossbar_19                 = 5'd19;
    reg_crossbar_20                 = 5'd20;
    reg_crossbar_21                 = 5'd21;
    reg_crossbar_22                 = 5'd22;
    reg_crossbar_23                 = 5'd23;
    reg_crossbar_vs                 = 5'd15;
    reg_crossbar_hs                 = 5'd14;
    reg_force_mux_0                 = 1'd0;
    reg_force_mux_1                 = 1'd0;
    reg_force_mux_2                 = 1'd0;
    reg_force_mux_3                 = 1'd0;
    reg_force_mux_4                 = 1'd0;
    reg_force_mux_5                 = 1'd0;
    reg_force_mux_6                 = 1'd0;
    reg_force_mux_7                 = 1'd0;
    reg_force_mux_8                 = 1'd0;
    reg_force_mux_9                 = 1'd0;
    reg_force_mux_10                = 1'd0;
    reg_force_mux_11                = 1'd0;
    reg_force_mux_12                = 1'd0;
    reg_force_mux_13                = 1'd0;
    reg_force_mux_14                = 1'd0;
    reg_force_mux_15                = 1'd0;
    reg_force_mux_16                = 1'd0;
    reg_force_mux_17                = 1'd0;
    reg_force_mux_18                = 1'd0;
    reg_force_mux_19                = 1'd0;
    reg_force_mux_20                = 1'd0;
    reg_force_mux_21                = 1'd0;
    reg_force_mux_22                = 1'd0;
    reg_force_mux_23                = 1'd0;
    reg_force_mux_vs                = 1'd0;
    reg_force_mux_hs                = 1'd0;
    reg_invert_mux_0                = 1'd0;
    reg_invert_mux_1                = 1'd0;
    reg_invert_mux_2                = 1'd0;
    reg_invert_mux_3                = 1'd0;
    reg_invert_mux_4                = 1'd0;
    reg_invert_mux_5                = 1'd0;
    reg_invert_mux_6                = 1'd0;
    reg_invert_mux_7                = 1'd0;
    reg_invert_mux_8                = 1'd0;
    reg_invert_mux_9                = 1'd0;
    reg_invert_mux_10               = 1'd0;
    reg_invert_mux_11               = 1'd0;
    reg_invert_mux_12               = 1'd0;
    reg_invert_mux_13               = 1'd0;
    reg_invert_mux_14               = 1'd0;
    reg_invert_mux_15               = 1'd0;
    reg_invert_mux_16               = 1'd0;
    reg_invert_mux_17               = 1'd0;
    reg_invert_mux_18               = 1'd0;
    reg_invert_mux_19               = 1'd0;
    reg_invert_mux_20               = 1'd0;
    reg_invert_mux_21               = 1'd0;
    reg_invert_mux_22               = 1'd0;
    reg_invert_mux_23               = 1'd0;
    reg_invert_mux_vs               = 1'd0;
    reg_invert_mux_hs               = 1'd0;
endtask

task dvp_raw8();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2a;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd399;
    reg_de_low                      = 32'd101;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd5000;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd449;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2a;
endtask

task dvp_rgb565();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd1;
    reg_crossbar_0                  = 5'd0;
    reg_crossbar_1                  = 5'd1;
    reg_crossbar_2                  = 5'd2;
    reg_crossbar_3                  = 5'd3;
    reg_crossbar_4                  = 5'd4;
    reg_crossbar_5                  = 5'd5;
    reg_crossbar_6                  = 5'd6;
    reg_crossbar_7                  = 5'd7;
    reg_crossbar_8                  = 5'd16;
    reg_crossbar_9                  = 5'd17;
    reg_crossbar_10                 = 5'd18;
    reg_crossbar_11                 = 5'd19;
    reg_crossbar_12                 = 5'd20;
    reg_crossbar_13                 = 5'd21;
    reg_crossbar_14                 = 5'd22;
    reg_crossbar_15                 = 5'd23;
    reg_crossbar_16                 = 5'd16;
    reg_crossbar_17                 = 5'd17;
    reg_crossbar_18                 = 5'd18;
    reg_crossbar_19                 = 5'd19;
    reg_crossbar_20                 = 5'd20;
    reg_crossbar_21                 = 5'd21;
    reg_crossbar_22                 = 5'd22;
    reg_crossbar_23                 = 5'd23;
    reg_crossbar_vs                 = 5'd15;
    reg_force_dvp_data_type         = 6'h22;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd398;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_force_mux_0                 = 1'd0;
    reg_force_mux_1                 = 1'd0;
    reg_force_mux_2                 = 1'd0;
    reg_force_mux_3                 = 1'd0;
    reg_force_mux_4                 = 1'd0;
    reg_force_mux_5                 = 1'd0;
    reg_force_mux_6                 = 1'd0;
    reg_force_mux_7                 = 1'd0;
    reg_force_mux_8                 = 1'd0;
    reg_force_mux_9                 = 1'd0;
    reg_force_mux_10                = 1'd0;
    reg_force_mux_11                = 1'd0;
    reg_force_mux_12                = 1'd0;
    reg_force_mux_13                = 1'd0;
    reg_force_mux_14                = 1'd0;
    reg_force_mux_15                = 1'd0;
    reg_force_mux_16                = 1'd0;
    reg_force_mux_17                = 1'd0;
    reg_force_mux_18                = 1'd0;
    reg_force_mux_19                = 1'd0;
    reg_force_mux_20                = 1'd0;
    reg_force_mux_21                = 1'd0;
    reg_force_mux_22                = 1'd0;
    reg_force_mux_23                = 1'd0;
    reg_force_mux_vs                = 1'd0;
    reg_invert_mux_0                = 1'd0;
    reg_invert_mux_1                = 1'd0;
    reg_invert_mux_2                = 1'd0;
    reg_invert_mux_3                = 1'd0;
    reg_invert_mux_4                = 1'd0;
    reg_invert_mux_5                = 1'd0;
    reg_invert_mux_6                = 1'd0;
    reg_invert_mux_7                = 1'd0;
    reg_invert_mux_8                = 1'd0;
    reg_invert_mux_9                = 1'd0;
    reg_invert_mux_10               = 1'd0;
    reg_invert_mux_11               = 1'd0;
    reg_invert_mux_12               = 1'd0;
    reg_invert_mux_13               = 1'd0;
    reg_invert_mux_14               = 1'd0;
    reg_invert_mux_15               = 1'd0;
    reg_invert_mux_16               = 1'd0;
    reg_invert_mux_17               = 1'd0;
    reg_invert_mux_18               = 1'd0;
    reg_invert_mux_19               = 1'd0;
    reg_invert_mux_20               = 1'd0;
    reg_invert_mux_21               = 1'd0;
    reg_invert_mux_22               = 1'd0;
    reg_invert_mux_23               = 1'd0;
    reg_invert_mux_vs               = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd398;
    reg_de_low                      = 32'd102;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd448;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h22;
endtask

task dvp_raw10_byteloc8();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd400;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd320;
    reg_de_low                      = 32'd80;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd370;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw10_byteloc7();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd395;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd316;
    reg_de_low                      = 32'd84;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd366;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw10_byteloc6();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd390;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd312;
    reg_de_low                      = 32'd88;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd362;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw10_byteloc5();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd385;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd308;
    reg_de_low                      = 32'd92;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd358;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw10_byteloc4();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd380;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd304;
    reg_de_low                      = 32'd96;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd354;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw10_byteloc3();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd375;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd300;
    reg_de_low                      = 32'd100;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd350;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw10_byteloc2();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd370;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd296;
    reg_de_low                      = 32'd104;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd346;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw10_byteloc1();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2b;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd365;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd292;
    reg_de_low                      = 32'd108;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd342;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2b;
endtask

task dvp_raw12_byteloc1();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd290;
    reg_de_low                      = 32'd110;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd340;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_raw12_byteloc2();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd292;
    reg_de_low                      = 32'd108;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd342;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_raw12_byteloc3();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd294;
    reg_de_low                      = 32'd106;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd344;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_raw12_byteloc4();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd296;
    reg_de_low                      = 32'd104;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd346;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_raw12_byteloc5();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd298;
    reg_de_low                      = 32'd102;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd348;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_raw12_byteloc6();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd300;
    reg_de_low                      = 32'd100;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd350;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_raw12_byteloc7();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd302;
    reg_de_low                      = 32'd98;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd352;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_raw12_byteloc8();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h2c;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd304;
    reg_de_low                      = 32'd96;
    reg_vs2de_dly                   = 32'd1050;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd400; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd354;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h2c;
endtask

task dvp_rgb888_byteloc1();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd387;
    reg_de_low                      = 32'd113;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd437;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_rgb888_byteloc2();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd390;
    reg_de_low                      = 32'd110;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd440;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_rgb888_byteloc3();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd393;
    reg_de_low                      = 32'd107;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd443;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_rgb888_byteloc4();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd396;
    reg_de_low                      = 32'd104;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd446;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_rgb888_byteloc5();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd399;
    reg_de_low                      = 32'd101;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd449;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_rgb888_byteloc6();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd402;
    reg_de_low                      = 32'd98;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd452;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_rgb888_byteloc7();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd405;
    reg_de_low                      = 32'd95;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd455;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_rgb888_byteloc8();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h24;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd408;
    reg_de_low                      = 32'd92;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd458;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h24;
endtask

task dvp_yuv422_8bit_uyuv();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app                 = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h1e;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd396;
    reg_de_low                      = 32'd104;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;
    reg_yuyv_mode_en                = 1'd0;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd446;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h1e;
endtask

task dvp_yuv422_8bit_yuyv();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app        = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h1e;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd396;
    reg_de_low                      = 32'd104;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;
    reg_yuyv_mode_en                = 1'd1;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd446;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h1e;
endtask

task dvp_vprbs_raw8();
    crossbar_default();
    reg_dvp_mode_en_bank2app        = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h1e;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd10;
    reg_de_high                     = 32'd100;
    reg_de_low                      = 32'd10;
    reg_vs2de_dly                   = 32'd10;
    reg_yuyv_mode_en                = 1'd0;
    reg_dvp_vprbs_tx_gen_en         = 1'd0;
    reg_dvp_vprbs_tx_mode           = 3'd0;
    reg_dvp_vprbs_tx_order          = 1'd0;
    reg_dvp_vprbs_tx_vs_interval    = 16'd2000; 

    reg_dvp_vprbs_tx_gen_en         = 1'd1;

endtask


task dvp_ate_test();
    reg_dvp_pin_square_det_en       = 1'd1;
    reg_dvp_clk_frequence_det_en    = 1'd1;
    reg_dvp_mode_en_bank2app        = 1'd1;

	reg_dvp_test_en                 = 1'd1;        
endtask

task dvp_yuv422_8bit_yuyv_hs_trigger();
    force as6d_app_tb.app_clk_data                         = clk_25M;
    crossbar_default();
    reg_dvp_mode_en_bank2app        = 1'd1;
    reg_dbl_mode                    = 5'd0;
    reg_force_dvp_data_type         = 6'h1e;
    reg_force_dvp_virtual_channel   = 4'd0;
    reg_force_dvp_word_count        = 16'd399;
    reg_force_dvp_word_count_en     = 1'd0;
    reg_de_cnt                      = 32'd6;
    reg_de_high                     = 32'd396;
    reg_de_low                      = 32'd104;
    reg_vs2de_dly                   = 32'd1250;
    reg_vs2fs_dly                   = 32'd10;
    reg_vs2fe_dly                   = 32'd3540;
    reg_hs2de_dly                   = 32'd1;
    reg_yuyv_mode_en                = 1'd1;

    reg_vs2de_trigger_en            = 1'd0;

	reg_dvp_test_en                 = 1'd0;        
    reg_frame_delay                 = 16'd200;
    reg_total_h                     = 16'd500; 
    reg_total_v                     = 16'd10;
    reg_col_start                   = 16'd51;
    reg_col_end                     = 16'd446;
    reg_row_start                   = 16'd3;
    reg_row_end                     = 16'd8;
    reg_data_type                   = 6'h1e;
endtask

