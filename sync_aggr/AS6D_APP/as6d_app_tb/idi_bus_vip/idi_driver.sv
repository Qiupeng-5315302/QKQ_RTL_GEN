
`ifndef IDI_DRIVER_SV
`define IDI_DRIVER_SV

class idi_driver;
    string name;
    virtual     idi_interface idi_if;
    idi_config  idi_cfg;


    function new(string name = "idi_driver");
        $display("%m, initiate %0s.....", name);
        this.name = name;
    endfunction : new


    extern virtual task main_phase();
    extern virtual task drv_idi_bus();
    extern virtual function void set_para(idi_config idi_cfg);
    extern virtual task reset_idi();
    extern virtual task reset_data();
    extern virtual task reset_first_data();
    extern virtual task line_interval();
    extern virtual task lse_interval();


endclass : idi_driver

task idi_driver::line_interval();
    repeat(idi_cfg.line_interval)begin
        @(posedge idi_if.clk_data);
    end
endtask : line_interval

task idi_driver::lse_interval();
    repeat(idi_cfg.lse_interval)begin
        @(posedge idi_if.clk_data);
    end
endtask : lse_interval


task idi_driver::main_phase();
    $display("%m,%0s Enter main_phase.....",name);
    drv_idi_bus();
endtask : main_phase

task idi_driver::reset_idi();
    idi_if.header_en       = 0;
    idi_if.data_type       = 0;
    idi_if.data_en         = 0;
    idi_if.csi_data        = 0;
    idi_if.byte_en         = 0;
    idi_if.world_count     = 0;
    idi_if.virtual_channel = 0;
    repeat(3000)@(posedge idi_if.clk_data); 
endtask : reset_idi

task idi_driver::reset_data();
    int rep_num;
    rep_num = $urandom_range(0, 3);
    if(rep_num != 0)begin
        idi_if.data_en  = 0;
        idi_if.csi_data = 0;
        idi_if.byte_en  = 0;
    end
    repeat(rep_num)@(posedge idi_if.clk_data); 
endtask : reset_data

task idi_driver::reset_first_data();
    int rep_num;
    rep_num = $urandom_range(1, 3);
    if(rep_num != 0)begin
        idi_if.data_en  = 0;
        idi_if.csi_data = 0;
        idi_if.byte_en  = 0;
    end
    repeat(rep_num)@(posedge idi_if.clk_data); 
endtask : reset_first_data

task idi_driver::drv_idi_bus();
        reset_idi();
        for(int frame_index=0; frame_index<idi_cfg.frame_num; frame_index++)begin
            //fs
            //repeat(idi_cfg.idi_clk_pre)begin
                @(posedge idi_if.clk_data);
            //end
            if(idi_cfg.fs_en)begin
                 idi_if.header_en       = 1;
                 idi_if.data_en         = 0;
                 idi_if.byte_en         = 0;
                 idi_if.csi_data        = 0;
                 idi_if.data_type       = 0;
                 idi_if.world_count     = 1;
                 idi_if.virtual_channel = 0;
                 @(posedge idi_if.clk_data);
                 idi_if.header_en       = 0;
                 idi_if.world_count     = 0;
                 idi_if.data_type       = 0;
            end
            @(posedge idi_if.clk_data);
            //repeat(idi_cfg.idi_clk_post)begin
            //    @(posedge idi_if.clk_data);
            //end

            //line_interval();

            //line pixel
            for(int line_index=0; line_index<idi_cfg.line_num; line_index++)begin

                //repeat(idi_cfg.idi_clk_pre)begin
                //end
                if(idi_cfg.ls_en)begin
                    idi_if.header_en       = 1;
                    idi_if.data_en         = 0;
                    idi_if.byte_en         = 0;
                    idi_if.csi_data        = 0;
                    idi_if.data_type       = 2;
                    idi_if.world_count     = 1;
                    idi_if.virtual_channel = 0;
                    @(posedge idi_if.clk_data);
                    idi_if.header_en       = 0;
                    idi_if.world_count     = 0;
                    idi_if.data_type       = 0;
                end
                    @(posedge idi_if.clk_data);
                //end
                idi_if.header_en       = 1;
                idi_if.world_count     = idi_cfg.world_count[frame_index][line_index];
                idi_if.data_type       = idi_cfg.data_type[frame_index][line_index];
                idi_if.virtual_channel = idi_cfg.virtual_channel[frame_index];
                for(int data_index=0; data_index < (idi_if.world_count/8); data_index++)begin
                    if(data_index != 0)begin
                        //reset_data();
                    end else begin
                        reset_first_data();
                    end
                    idi_if.data_en         = 1;
                    idi_if.byte_en         = 7;
                    idi_if.csi_data        = idi_cfg.csi_data[frame_index][line_index][data_index];
                    //idi_if.csi_data        = line_index;
                    @(posedge idi_if.clk_data);
                end
                reset_data();
                if(idi_if.world_count%8 != 0)begin
                    idi_if.data_en        = 1;
                    idi_if.byte_en        = (idi_if.world_count%8 - 1); 
                    idi_if.csi_data       = idi_cfg.csi_data[frame_index][line_index][idi_if.world_count/8];//[(idi_if.byte_en*8+7) : 0];
                    //idi_if.csi_data        = line_index;
                    @(posedge idi_if.clk_data);
                end
                idi_if.byte_en        = 0;
                idi_if.data_en        = 0;
                idi_if.header_en      = 0;
                idi_if.csi_data       = 0;
                //reset_data();
                //repeat(idi_cfg.idi_clk_post)begin
                //    @(posedge idi_if.clk_data);
                //end

                //lse_interval();

                //repeat(idi_cfg.idi_clk_pre)begin
                    @(posedge idi_if.clk_data);
                //end
                if(idi_cfg.le_en)begin
                    idi_if.header_en       = 1;
                    idi_if.data_en         = 0;
                    idi_if.byte_en         = 0;
                    idi_if.csi_data        = 0;
                    idi_if.data_type       = 3;
                    idi_if.world_count     = 1;
                    idi_if.virtual_channel = 0;
                    @(posedge idi_if.clk_data);
                    idi_if.header_en       = 0;
                    idi_if.world_count     = 0;
                    idi_if.data_type       = 0;
                end
                @(posedge idi_if.clk_data);
                idi_if.header_en       = 0;
                //repeat(idi_cfg.idi_clk_post)begin
                //    @(posedge idi_if.clk_data);
                //end

                //line_interval();

            end


            //fe
            //repeat(idi_cfg.idi_clk_pre)begin
                @(posedge idi_if.clk_data);
            //end
            if(idi_cfg.fe_en)begin
                 idi_if.header_en       = 1;
                 idi_if.data_en         = 0;
                 idi_if.byte_en         = 0;
                 idi_if.csi_data        = 0;
                 idi_if.data_type       = 1;
                 idi_if.world_count     = 1;
                 idi_if.virtual_channel = 0;
                 @(posedge idi_if.clk_data);
                 idi_if.header_en       = 0;
                 idi_if.world_count     = 0;
                 idi_if.data_type       = 0;
            end
            //repeat(idi_cfg.idi_clk_post)begin
            //    @(posedge idi_if.clk_data);
            //end

            //frame interval
            repeat(idi_cfg.frame_interval)begin
                @(posedge idi_if.clk_data);
            end

        end
endtask : drv_idi_bus


function void idi_driver::set_para(idi_config idi_cfg);
    this.idi_cfg = idi_cfg;
endfunction : set_para
`endif
