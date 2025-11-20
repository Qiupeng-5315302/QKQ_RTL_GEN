

idi_interface idi_if_drv[`IDI_NUM]();
idi_interface idi_if_in[`IDI_NUM]();
idi_interface idi_if_out[`AGG_NUM]();

assign idi_if_drv[0].clk_data = fifo_wrclk0 & idi_if_drv[0].drv_enable;
assign idi_if_drv[1].clk_data = fifo_wrclk1 & idi_if_drv[0].drv_enable;
assign idi_if_drv[2].clk_data = fifo_wrclk2 & idi_if_drv[0].drv_enable;
assign idi_if_drv[3].clk_data = fifo_wrclk3 & idi_if_drv[0].drv_enable;

`include "./idi_wrapper.sv"

idi_env  u_idi_env;

initial begin

    u_idi_env = new("u_idi_env");

    u_idi_env.idi_if_drv = idi_if_drv;
    u_idi_env.idi_if_in  = idi_if_in;
    u_idi_env.idi_if_out = idi_if_out;
    /**
     * modifiled the config parameter below
     */
    u_idi_env.idi_cfg[0].disable_enable =  0; 
    
    //forever begin
        fork
            forever begin
                u_idi_env.main_phase();
                @(negedge idi_if_drv[0].drv_enable);
                @(posedge idi_if_drv[0].drv_enable);
            end
            forever begin
                if(u_idi_env.idi_cfg[0].disable_enable)begin
                    repeat(u_idi_env.idi_cfg[0].disable_start)begin
                        #1us;
                    end
                    idi_if_drv[0].drv_enable = 0;
                    repeat(3)begin
                        #10us;
                    end
                    $display("%0t, launch a new main_phase..........", $time);
                    //idi_if_drv[0].drv_enable = 1;
                    #50ms;
                end else begin
                    #100ns;
                end
            end
        join
        //join_any
        //disable fork;
    //end
end

initial begin
    #1500us;
//    $finish;
end
