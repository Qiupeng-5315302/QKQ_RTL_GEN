
module  sync_bus #(
    parameter BUS_WIDTH = 16,
    parameter INI_VALUE = {BUS_WIDTH{1'b0}}
)(
    src_clk,
    src_rstn,
    src_bus,
    dst_clk,
    dst_rstn,
    dst_bus
);

input  wire                             src_clk;
input  wire                             src_rstn;
input  wire [BUS_WIDTH-1:0]             src_bus;
input  wire                             dst_clk;
input  wire                             dst_rstn;
output wire [BUS_WIDTH-1:0]             dst_bus;

reg                                     update_src;
wire                                    update_src_d2;
reg  [BUS_WIDTH-1:0]                    src_bus_buf;
reg                                     update_dst;
wire                                    update_dst_d2;
reg  [BUS_WIDTH-1:0]                    dst_bus_buf;

always @( posedge src_clk or negedge src_rstn ) begin
    if ( !src_rstn ) begin
        update_src <= 1'b0;
    end
    else if ( update_src ) begin
        update_src <= ~update_dst_d2;
    end
    else if ( !update_dst_d2 ) begin
        update_src <= 1'b1;
    end
end

always @( posedge src_clk or negedge src_rstn ) begin
    if ( !src_rstn ) begin
        src_bus_buf <= INI_VALUE;
    end
    else if ( (!update_src) && (!update_dst_d2) ) begin
        src_bus_buf <= src_bus[BUS_WIDTH-1:0];
    end
end

sync2_cell_rstb  synchronizer_to_src  (
   .clk                                (src_clk),
   .reset_n                            (src_rstn),
   .data                               (update_dst),
   .qout                               (update_dst_d2)
);

assign  dst_bus                 = dst_bus_buf[BUS_WIDTH-1:0];

always @( posedge dst_clk or negedge dst_rstn ) begin
    if ( !dst_rstn ) begin
        update_dst <= 1'b0;
    end
    else begin
        update_dst <= update_src_d2;
    end
end

always @( posedge dst_clk or negedge dst_rstn ) begin
    if ( !dst_rstn ) begin
        dst_bus_buf <= INI_VALUE;
    end
    else if ( update_src_d2 ) begin
        dst_bus_buf <= src_bus_buf[BUS_WIDTH-1:0];
    end
end

sync2_cell_rstb  synchronizer_to_dst  (
   .clk                                (dst_clk),
   .reset_n                            (dst_rstn),
   .data                               (update_src),
   .qout                               (update_src_d2)
);

endmodule

