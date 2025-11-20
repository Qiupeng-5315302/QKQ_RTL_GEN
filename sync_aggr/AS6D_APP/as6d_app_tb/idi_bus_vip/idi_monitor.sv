
`ifndef IDI_MONITOR_SV
`define IDI_MONITOR_SV


class idi_packet;
    bit[15:0]           world_count[$];
    bit[5:0]            data_type[$];
    bit[3:0]            virtual_channel[$];
    bit[63:0]           idi_data[$];
    bit[2:0]            byte_en[$];
endclass : idi_packet

class idi_monitor;

    string      name;
    bit         inout_en; //0: input monitor; 1: output monitor;

    virtual     idi_interface idi_if;

    idi_packet  idi_pkt;
    idi_packet  idi_pkt_q[$];


    function new(string name = "idi_monitor");
        $display("%m, initiate %0s.....", name);
        this.name = name;
    endfunction : new

    extern virtual task main_phase();
    extern virtual task mon_idi_bus();
    extern virtual function void push_idi_pkt();
    extern virtual function void pop_idi_pkt();


endclass : idi_monitor


task idi_monitor::main_phase();
    $display("%m,%0s Enter main_phase.....",name);
    mon_idi_bus();
endtask : main_phase


function void idi_monitor::push_idi_pkt();
    //$display("%0t,%0s Enter push_idi_pkt.....",$time, name);
    idi_pkt.world_count.push_back(idi_if.world_count);
    idi_pkt.data_type.push_back(idi_if.data_type);
    idi_pkt.byte_en.push_back(idi_if.byte_en);
    idi_pkt.idi_data.push_back(idi_if.csi_data);
    idi_pkt.virtual_channel.push_back(idi_if.virtual_channel);
    if(inout_en)begin //to equal to input monitor queue size
            idi_pkt.world_count.push_back(idi_if.world_count);
            idi_pkt.data_type.push_back(idi_if.data_type);
            idi_pkt.byte_en.push_back(idi_if.byte_en);
            idi_pkt.virtual_channel.push_back(idi_if.virtual_channel);
            idi_pkt.idi_data.push_back(idi_if.csi_data_msb);
    end 
endfunction : push_idi_pkt

function void idi_monitor::pop_idi_pkt();
    $display("%0t,%0s Enter pop_idi_pkt.....",$time, name);
    idi_pkt.world_count.pop_back();
    idi_pkt.data_type.pop_back();
    idi_pkt.byte_en.pop_back();
    idi_pkt.idi_data.pop_back();
    idi_pkt.virtual_channel.pop_back();
endfunction : pop_idi_pkt

task idi_monitor::mon_idi_bus();
    int expect_qsize;
    forever begin
        wait(idi_if.header_en && idi_if.data_en);
        @(negedge idi_if.clk_data);
        if(idi_pkt == null)begin
            idi_pkt = new();
        end
        push_idi_pkt();
        if(inout_en)begin
            expect_qsize = (idi_if.world_count%16==0) ? (idi_if.world_count/16*2) : ((idi_if.world_count/16+1)*2); //input 64bit, output 128bit
        end else begin
            expect_qsize = (idi_if.world_count%8==0) ? idi_if.world_count/8 : (idi_if.world_count/8+1); //input 64bit, output 128bit

        end
        if((idi_if.data_type < 4) || (idi_pkt.data_type.size() == expect_qsize))begin
            idi_pkt_q.push_back(idi_pkt);
            if(inout_en)begin
                if((idi_if.world_count%16 <= 8) && (idi_if.world_count%16 > 0))begin
                    pop_idi_pkt(); //pop out the last 0
                end
                $write("monitor_out\t%0s\t%0t\tidi_data:\t",name,$time);
            end else begin
                $write("monitor_in\t%0s\t%0t\tidi_data:\t",name,$time);
            end
            foreach(idi_pkt.idi_data[i]) begin
                $write("[%0x]\t", idi_pkt.idi_data[i]);
            end
            $write("\n\n");
            idi_pkt = null;
        end 
        @(posedge idi_if.clk_data);#1ns;
    end
endtask : mon_idi_bus


`endif
