
`ifndef IDI_CONFIG_SV
`define IDI_CONFIG_SV

class idi_config; 
    rand bit[31:0]      idi_clk_pre;
    rand bit[31:0]      idi_clk_post;

         bit[15:0]      world_count[][];
         bit[5:0]       data_type[][];
         bit[3:0]       virtual_channel[];
         bit[63:0]      csi_data[][][];

    rand bit            fs_en;
    rand bit            fe_en;
    rand bit            ls_en;
    rand bit            le_en;

    rand bit[31:0]      frame_num;
    rand bit[31:0]      line_num;

    rand bit[31:0]      line_interval;
    rand bit[31:0]      lse_interval;
    rand bit[31:0]      frame_interval;

         bit            disable_enable;
    rand bit[31:0]      disable_start;

    int dt;
    static int dt_inst;

    constraint clk_data_c {
        idi_clk_pre  inside  {[20:30]};
        idi_clk_post inside {[20:30]};
        line_interval  inside {[300:500]};
        lse_interval  inside {[90:120]};
        frame_interval   inside {[3000:5000]};
        disable_start   inside {[400:700]};
    }

    constraint world_count_c {
        frame_num   inside {[4:6]};
        line_num    inside {[15:30]};
    }


    function new(string name);
        $display("%m, initiate %0s....", name);
        dt = dt_inst;
        dt_inst++;
    endfunction : new

    function void pre_randomize();
    endfunction: pre_randomize

    function void post_randomize();
        int wd_cnt;
        int div_cnt;
        virtual_channel = new[frame_num];
        data_type       = new[frame_num];
        world_count     = new[frame_num];
        csi_data        = new[frame_num];
        foreach(data_type[i])begin
            data_type[i]   = new[line_num];
            world_count[i] = new[line_num];
            csi_data[i]    = new[line_num];
        end

        /*
        assert(std::randomize(virtual_channel) with {
            foreach(virtual_channel[i]){ 
                virtual_channel[i] inside{[0:15]};
            }
        });

        assert(std::randomize(data_type) with {
            foreach(data_type[i]){ 
                foreach(data_type[i][j]){ 
                    data_type[i][j] inside{[24:28]};
                }
            }
        });

        assert(std::randomize(world_count) with {
            foreach(world_count[i]){ 
                foreach(world_count[i][j]){ 
                    world_count[i][j] inside{[300:500]};
                }
            }
        });

        for(int i=0; i<frame_num; i++)begin
            for(int j=0; j<line_num; j++)begin
                csi_data[i][j] = new[(world_count[i][j]/8)];
            end
        end

        assert(std::randomize(csi_data) with {
            foreach(csi_data[i]){ 
                foreach(csi_data[i][j]){ 
                    foreach(csi_data[i][j][k]){ 
                        csi_data[i][j][k] inside{[{1'b1, 63'h0}:$]};
                    }
                }
            }
        });

        foreach(virtual_channel[i])begin
            assert(std::randomize(virtual_channel) with {virtual_channel[i] inside {[4'h0: 4'h1]};});
        end

        */

        for(int i=0; i<frame_num; i++)begin
            virtual_channel[i] = $urandom_range(0, 2);
            for(int j=0; j<line_num; j++)begin
                //data_type[i][j] = 6'h2a + dt;//$urandom_range(6'h24, 6'h28);
                data_type[i][j] = 6'h2a;//$urandom_range(6'h24, 6'h28);
                world_count[i][j] = $urandom_range(200, 300);
                if((world_count[i][j]%8 == 0))begin
                    csi_data[i][j] = new[(world_count[i][j]/8)];
                    wd_cnt = world_count[i][j]/8;
                end else begin
                    csi_data[i][j] = new[(world_count[i][j]/8+1)];
                    wd_cnt = world_count[i][j]/8+1;
                end
                div_cnt = world_count[i][j]%8;
                for(int k=0; k<wd_cnt; k++)begin
                    //csi_data[i][j][k][31:0] = $urandom_range(64'h8000_0000_0000_0000, 64'hffff_ffff_ffff_ffff);
                    //csi_data[i][j][k][63:32] = $urandom_range(64'h8000_0000_0000_0000, 64'hffff_ffff_ffff_ffff);
                    csi_data[i][j][k][31:0] = k;
                    csi_data[i][j][k][63:32] = j;
                    if((div_cnt != 0) & (k == (wd_cnt-1)))begin //
                        //csi_data[i][j][k] = csi_data[i][j][k]>>(64-8*div_cnt);
                    csi_data[i][j][k][31:0] = k;
                    csi_data[i][j][k][63:32] = j;
                    end
                end
            end
        end

        $display("frame_num = %0d", frame_num);
        $display("fs_en = %0d", fs_en);
        $display("fe_en = %0d", fe_en);
        $display("ls_en = %0d", ls_en);
        $display("le_en = %0d", le_en);
        $display("line_num  = %0d", line_num);
        $display("idi_clk_pre= %0d", idi_clk_pre);
        $display("idi_clk_post= %0d", idi_clk_post);
        $display("line_interval= %0d", line_interval);
        $display("lse_interval= %0d", lse_interval);
        $display("frame_interval= %0d", frame_interval);

        $display("wd_cnt = %0d", wd_cnt);
        foreach(virtual_channel[i])begin
            $display("virtual_channel[%0d] = %0d", i,virtual_channel[i]);
        end

    endfunction : post_randomize

endclass : idi_config


`endif
