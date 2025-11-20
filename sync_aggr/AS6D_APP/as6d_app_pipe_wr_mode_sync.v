
module as6d_app_pipe_wr_mode_sync(/*AUTOARG*/
   // Outputs
   pipe0_wr_mode, pipe1_wr_mode, pipe2_wr_mode, pipe3_wr_mode,
   // Inputs
   aggre_clk, aggre_clk_rst_n, fifo_wrclk0, fifo_wrclk1, fifo_wrclk2,
   fifo_wrclk3, fifo_wrclk_rst_n0, fifo_wrclk_rst_n1,
   fifo_wrclk_rst_n2, fifo_wrclk_rst_n3, pipe_wr_mode
   );
    input			aggre_clk;
    input			aggre_clk_rst_n;
    input			fifo_wrclk0;
    input			fifo_wrclk1;
    input			fifo_wrclk2;
    input			fifo_wrclk3;
    input			fifo_wrclk_rst_n0;
    input			fifo_wrclk_rst_n1;
    input			fifo_wrclk_rst_n2;
    input			fifo_wrclk_rst_n3;
    input    [7:0]  pipe_wr_mode;
    output   [1:0]  pipe0_wr_mode;
    output   [1:0]  pipe1_wr_mode;
    output   [1:0]  pipe2_wr_mode;
    output   [1:0]  pipe3_wr_mode;
    
    wire     [7:0]  pipe_wr_mode_sync;
    wire     [3:0]  fifo_wrclk;
    wire     [3:0]  fifo_wrclk_rst_n;

    assign  fifo_wrclk = {fifo_wrclk3,fifo_wrclk2,fifo_wrclk1,fifo_wrclk0};
    assign  fifo_wrclk_rst_n = {fifo_wrclk_rst_n3,fifo_wrclk_rst_n2,fifo_wrclk_rst_n1,fifo_wrclk_rst_n0};
    assign  pipe0_wr_mode = pipe_wr_mode_sync[1:0];
    assign  pipe1_wr_mode = pipe_wr_mode_sync[3:2];
    assign  pipe2_wr_mode = pipe_wr_mode_sync[5:4];
    assign  pipe3_wr_mode = pipe_wr_mode_sync[7:6];

    generate    
        for(genvar i=0 ; i<=3 ; i=i+1 ) begin:pipe_wr_mode_sync_bk
            sync_bus    #(
            )u_sync_bus_pipe_wr_mode(
                .src_clk(aggre_clk),
                .src_rstn(aggre_clk_rst_n),
                .src_bus(pipe_wr_mode[(i*2)+:2]),
                .dst_clk(fifo_wrclk[i]),
                .dst_rstn(fifo_wrclk_rst_n[i]),
                .dst_bus(pipe_wr_mode_sync[(i*2)+:2])
            );
        end

    endgenerate

endmodule
