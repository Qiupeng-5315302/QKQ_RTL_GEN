
`timescale 1ns/1fs
module clk_generator(
        output wire clk_ref
);

parameter real clk_freq = 0;
parameter int jitter_en = 0;
parameter int seed = 0;
parameter string str_freq = "";

logic clk_inter = 0;

real half_clk_period;

int sel_en;

function gen_clk_period();
    sel_en = $random(seed);
    if(str_freq == "GHz" || str_freq == "Ghz") begin
        half_clk_period = 0.5/clk_freq;
    end
    if(str_freq == "MHz" || str_freq == "Mhz") begin
        half_clk_period = 0.5*(10**3)/clk_freq;
    end
    if(str_freq == "KHz" || str_freq == "Khz") begin
        half_clk_period = 0.5*(10**6)/clk_freq;
    end
    if(str_freq == "Hz" || str_freq == "hz") begin
        half_clk_period = 0.5*(10**9)/clk_freq;
    end
endfunction

initial begin
    gen_clk_period();
    $display("%m, the gen_clk_period = %0fns str = %s, clk_freq = %0d", half_clk_period, str_freq, clk_freq);
    forever begin
        if(jitter_en)begin
            gen_clk_period();
            if(sel_en[0])begin
                half_clk_period = half_clk_period * 0.99;
            end else begin
                half_clk_period = half_clk_period * 1.01;
            end
        end
        #half_clk_period;
        clk_inter = ~clk_inter;
    end
end

assign clk_ref = clk_inter;

endmodule
