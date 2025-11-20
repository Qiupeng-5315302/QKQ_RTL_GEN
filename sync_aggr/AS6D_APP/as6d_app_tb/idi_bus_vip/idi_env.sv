
`ifndef IDI_ENV_SV
`define IDI_ENV_SV

class idi_env;

    string name;

    event   idi_pkt_evt;

    virtual idi_interface idi_if_drv[`IDI_NUM];
    virtual idi_interface idi_if_in[`IDI_NUM];
    virtual idi_interface idi_if_out[`AGG_NUM];

    idi_packet idi_pkt_in[`IDI_NUM];
    idi_packet idi_pkt_out[`AGG_NUM][$];

    idi_config    idi_cfg[`IDI_NUM];
    idi_driver    idi_drv[`IDI_NUM];
    idi_monitor   idi_mon_in[`IDI_NUM];
    idi_monitor   idi_mon_out[`AGG_NUM];
    
    function new(string name = "idi_env");
        $display("%m, initiate %0s.....", name);
        this.name = name;
        build_phase();
    endfunction : new

    extern virtual task main_phase();
    extern virtual function void build_phase();
    extern virtual function void connect_phase();
    extern virtual function void idi_compare();
    extern virtual task idi_compare_phase();

endclass : idi_env

task idi_env::main_phase();
    $display("%m,%0s,%0t Enter main_phase.....",name, $time);
    connect_phase();
    repeat(10)@(posedge idi_if_in[0].clk_data);
    fork
            for(int i=0; i<`IDI_NUM; i++)begin
                automatic int j=i;
                fork
                    idi_drv[j].main_phase();
                join_none
            end
            for(int i=0; i<`IDI_NUM; i++)begin
                automatic int p=i;
                fork
                    idi_mon_in[p].main_phase();
                join_none
            end
            for(int i=0; i<`AGG_NUM; i++)begin
                automatic int y=i;
                fork
                    idi_mon_out[y].main_phase();
                join_none
            end
            //idi_compare_phase();
    join
endtask : main_phase

function void idi_env::build_phase();
    for(int i=0; i<`IDI_NUM; i++)begin
        idi_cfg[i] = new($psprintf("idi_cfg_%0d", i));
        idi_drv[i] = new($psprintf("idi_drv_%0d", i));
        idi_mon_in[i] = new($psprintf("idi_mon_in_%0d", i));
        idi_cfg[i].randomize() with {
            frame_num == 5;
            line_num  == 20;
            ls_en == 1;
            le_en == 1;
            fs_en == 1;
            fe_en == 1;
        };
    end
    for(int i=0; i<`AGG_NUM; i++)begin
        idi_mon_out[i] = new($psprintf("idi_mon_out_%0d", i));
    end
endfunction : build_phase



function void idi_env::connect_phase();
    $display("this is in connect_phase");
    for(int k=0; k<`IDI_NUM; k++)begin
        idi_drv[k].set_para(idi_cfg[k]);
        idi_drv[k].idi_if=idi_if_drv[k];
        idi_mon_in[k].idi_if=idi_if_in[k];
        idi_mon_in[k].inout_en = 0;
    end
    for(int k=0; k<`AGG_NUM; k++)begin
        idi_mon_out[k].inout_en = 1;
        idi_mon_out[k].idi_if=idi_if_out[k];
    end
endfunction : connect_phase

task idi_env::idi_compare_phase();
    fork
        for(int i=0; i<`AGG_NUM; i++)begin
            automatic int y = i;
            fork
                begin
                    forever begin
                        wait(idi_mon_out[y].idi_pkt_q.size() == `IDI_NUM);
                        $display("%0t, idi_mon_out size equal IDI_NUM......", $time);
                        for(int j=0; j<`IDI_NUM; j++)begin
                            idi_pkt_out[y].push_back(idi_mon_out[y].idi_pkt_q.pop_front());
                        end
                        ->idi_pkt_evt;
                    end
                end
            join_none
        end
        
        forever begin
            @idi_pkt_evt;
            $display("%0t, Recive the idi_pkt_evt..........", $time);
            for(int i=0; i<`IDI_NUM; i++)begin
                idi_pkt_in[i] = idi_mon_in[i].idi_pkt_q.pop_front();
            end
            idi_compare();
        end
    join
endtask : idi_compare_phase


function void idi_env::idi_compare();
    idi_packet idi_pkt_in_temp;
    idi_packet idi_pkt_out_temp;
    int         pkt_in_size;
    int         pkt_out_size;
    for(int i=0; i<`AGG_NUM; i++)begin
        $display("=======================idi_%0d_input===================", i);
        if(idi_pkt_in[i] != null)begin
            pkt_in_size = idi_pkt_in[i].idi_data.size();
            for(int j=0; j < pkt_in_size; j++)begin
                $display("idi_pkt_in[%0d].idi_data[%0d] = %0h", i, j, idi_pkt_in[i].idi_data.pop_front);
            end
        end else begin
            $display("idi_pkt_in[%0d] is empty............", i,);
        end
    end

    for(int i=0; i<`AGG_NUM; i++)begin
        if(idi_pkt_out[i].size() == `IDI_NUM)begin
            for(int k=0; k < `IDI_NUM; k++)begin
                $display("++++++++++++++++++++++++++idi_%0d_agg_line_%0d+++++++++++++++++++++++", i, k);
                idi_pkt_out_temp =  idi_pkt_out[i].pop_front();
                pkt_out_size = idi_pkt_out_temp.idi_data.size();
                for(int j=0; j < pkt_out_size; j++)begin
                    $display("idi_pkt_out[%0d][%0d].idi_data[%0d] = %0h", i, k, j, idi_pkt_out_temp.idi_data.pop_front);
                end
            end
        end else begin
            $display("idi_pkt_out[%0d] has not aggr AGG_NUM frame............", i,);
        end
    end

endfunction : idi_compare


`endif
