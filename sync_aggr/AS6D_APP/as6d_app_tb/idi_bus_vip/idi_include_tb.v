

idi_interface idi_if_in[`IDI_NUM]();
idi_interface idi_if_out[`AGG_NUM]();

for(genvar i=0; i<`IDI_NUM; i++)begin
    assign idi_if_in[i].clk_data = clk_100mhz;
end
for(genvar i=0; i<`AGG_NUM; i++)begin
    assign idi_if_out[i].clk_data = clk_100mhz;
end

idi_env  u_idi_env;

initial begin

    u_idi_env = new("u_idi_env");

    u_idi_env.idi_if_in  = idi_if_in;
    u_idi_env.idi_if_out = idi_if_out;

    u_idi_env.main_phase();

end

initial begin
    #1500us;
    $finish;
end
