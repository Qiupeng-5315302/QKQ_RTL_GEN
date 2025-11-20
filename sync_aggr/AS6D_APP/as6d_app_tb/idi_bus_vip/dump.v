
initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars(0, tb_top);
end
