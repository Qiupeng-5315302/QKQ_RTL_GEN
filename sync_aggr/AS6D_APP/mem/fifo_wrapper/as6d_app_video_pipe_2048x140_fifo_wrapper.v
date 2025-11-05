
module as6d_app_video_pipe_2048x140_fifo_wrapper(/*AUTOARG*/
   // Outputs
   rd_data, rd_data_val, prog_empty, prog_full, ovf_int, udf_int,
   empty, full, single_err, double_err,
   // Inputs
   clk, rst_n, ram_bypass, prog_full_assert_cfg, prog_full_negate_cfg,
   wr_data, wr_en, rd_en
   );
// -----------------------------------------------------------------------------

// parameter declaration

// -----------------------------------------------------------------------------            
parameter   ADDR_WIDTH        = 11;              //fifo address width
parameter   DATA_WIDTH        = 140;             //fifo data width
parameter   PROG_EMPTY_ASSERT = 4;              //fifo data count threshold of prog empty assert
parameter   PROG_EMPTY_NEGATE = 4;              //fifo data count threshold of prog empty negate
parameter   FIFO_DEEP         = 1<<ADDR_WIDTH;  //fifo data depth
parameter   RAM_PIPE_STAGE    = 2;              //RAM read dalay

//output ports
output [DATA_WIDTH - 1:0] rd_data;     //output data to fifo
output                    rd_data_val; //output data valid 
output                    prog_empty;  //fifo prog_empty flag
output                    prog_full;   //fifo prog_full  flag
output                    ovf_int;     //write over flow interrupt  1=interrupt 0=no interrupt 
output                    udf_int;     //read  under flow interrupt  1=interrupt 0=no interrupt
output                    empty;       //fifo empty flag
output                    full;        //fifo full flag
output                    single_err;  //
output                    double_err;  //

//global ports
input                     clk;         //input clk 
input                     rst_n;       //globe aysn rst_n
input                     ram_bypass;         

//input ports
input  [ADDR_WIDTH:0]     prog_full_assert_cfg; // almost full assert config
input  [ADDR_WIDTH:0]     prog_full_negate_cfg; // almost full negate config

input  [DATA_WIDTH - 1:0] wr_data;     //input data to fifo
input                     wr_en;       //write enable 
input                     rd_en;       //read enable 

// -----------------------------------------------------------------------------

// wire declaration

// -----------------------------------------------------------------------------
wire   [ADDR_WIDTH - 1:0] waddr;       //binary write address
wire   [ADDR_WIDTH - 1:0] raddr;       //binary read address

// -----------------------------------------------------------------------------

// register declaration

// -----------------------------------------------------------------------------
reg    [ADDR_WIDTH:0]     data_count;  //count the data in fifo
reg    [ADDR_WIDTH:0]     w_addr;      //binary write address,the MSB is state bit
reg    [ADDR_WIDTH:0]     r_addr;      //binary read address,the MSB is state bit

wire   [DATA_WIDTH - 1:0] rd_data ;    //output data to fifo
wire                      rd_data_val; //output data valid 
reg                       prog_empty;  //fifo prog_empty flag
reg                       prog_full;   //fifo prog_full flag
reg                       ovf_int;     //write over flow interrupt  1=interrupt 0=no interrupt 
reg                       udf_int;     //read  under flow interrupt  1=interrupt 0=no interrupt
reg                       empty;       //fifo empty flag
reg                       full;        //fifo full flag

wire                      ren;         //real read enable
wire                      wen;         //real write enable

//------------------------------------------------ 
bus_delay_cg #(
    .DELAY_CYCLES ( RAM_PIPE_STAGE ),
    .BUS_WIDTH    ( 1              ),
    .INIT_VAL     ( 0              )
)bus_delay_u0 (
    .clk          ( clk            ),   
    .rst_n        ( rst_n          ),
    .inbus        ( ren            ),
    .en           ( 1'b1           ),
    .outbus       ( rd_data_val    )
);

// -----------------------------------------------------------------------------

// sync_fifo write control logic

// -----------------------------------------------------------------------------

//ram write enable 
assign wen = wr_en && (!full); //forbid writing when fifo is full

// interrupt of ovf_int and udf_int
always @( posedge clk or negedge rst_n )
    if(~rst_n)
        begin
            ovf_int <= 1'b0;
            udf_int <= 1'b0;
        end
    else 
        begin
            ovf_int <= wr_en && full;
            udf_int <= rd_en && empty;
        end 

//generate the ram write address
always @( posedge clk or negedge rst_n )
    if(~rst_n)
        w_addr <= {( ADDR_WIDTH+1 ){1'b0}};
    else if( wen )
        w_addr <= (w_addr == ( FIFO_DEEP - 1 ) ) ? {( ADDR_WIDTH+1 ){1'b0}} : (w_addr + 1'b1 );
    else
        w_addr <= w_addr;        

assign waddr = w_addr[ADDR_WIDTH-1:0]; //real write addr

// -----------------------------------------------------------------------------

// sync_fifo read control logic

// -----------------------------------------------------------------------------

//ram read enable
assign ren = rd_en && (!empty); //forbid reading when fifo is empty 

//generate the ram read address        
always @( posedge clk or negedge rst_n )
    if(~rst_n)
        r_addr <= {( ADDR_WIDTH+1 ){1'b0}};
    else if( ren ) 
        r_addr <= (r_addr == ( FIFO_DEEP - 1 ) ) ? {( ADDR_WIDTH+1 ){1'b0}} : (r_addr + 1'b1 );
    else
        r_addr <= r_addr;

assign raddr = r_addr[ADDR_WIDTH-1:0]; //real read addr

// -----------------------------------------------------------------------------

// sync_fifo status signal gengerated 

// -----------------------------------------------------------------------------

//data counter    
always @( posedge clk or negedge rst_n )
    if(~rst_n)
        data_count <= {(ADDR_WIDTH + 1){1'b0}} ;
    else if(wen && (!ren))
        data_count <= data_count + 1'b1;
    else if((!wen) && ren)
        data_count <= data_count - 1'b1;

//generated almost full signal
always @( posedge clk or negedge rst_n )
    if(~rst_n)
        begin
            prog_full <= 1'b0;
        end
    else
        begin
            if( ((!prog_full) && (data_count >= prog_full_assert_cfg)) || ( (data_count == (prog_full_assert_cfg -1))&& (wen && (!ren))) )
                begin
                    prog_full <= 1'b1;
                end
            else if(( prog_full && (data_count < prog_full_negate_cfg)) || ( (data_count == prog_full_negate_cfg)&& ((!wen) && ren)) )
                begin
                    prog_full <= 1'b0;
                end
            else
                begin
                    prog_full <= prog_full;
                end
        end

//generated full signal
always@( posedge clk or negedge rst_n )
    if(~rst_n)
        full <= 1'b0;
    else if( full && ren )
        full <= 1'b0;
    else
        full <= (data_count == FIFO_DEEP) || ( (data_count == (FIFO_DEEP-1))&& (wen && !ren));

//generated almost empty signal       
always@( posedge clk or negedge rst_n )
    if(~rst_n)
        begin
            prog_empty <= 1'b1;
        end
    else
        begin
            if( ((~prog_empty) && (data_count <= PROG_EMPTY_ASSERT)) || ( (data_count == (PROG_EMPTY_ASSERT+1))&& ((!wen) && ren)) )
                begin
                    prog_empty <= 1'b1;
                end
            else if( (prog_empty && (data_count > PROG_EMPTY_NEGATE)) || ( (data_count == (PROG_EMPTY_NEGATE))&& (wen && (!ren))) )
                begin
                    prog_empty <= 1'b0;
                end
            else
                begin
                    prog_empty <= prog_empty;
                end
        end

//generated empty signal
always@( posedge clk or negedge rst_n )
    if(~rst_n)
        empty <= 1'b1;
    else if(empty && wen)
        empty <= 1'b0;
    else
        empty <= (data_count == 0) || ( (data_count == 1)&& ((!wen) && ren));

// -----------------------------------------------------------------------------

//ram instance

// -----------------------------------------------------------------------------
as6d_app_video_pipe_1r1w_2048x140_ram_wrapper #(
    .RAM_DEPTH       ( FIFO_DEEP      ),
    .ADDR_WIDTH      ( ADDR_WIDTH     ),
    .DATA_WIDTH      ( DATA_WIDTH     ),
    .RAM_PIPE_STAGE  ( RAM_PIPE_STAGE )
) u0_as6d_app_video_pipe_1r1w_2048x140_ram_wrapper (
    //output ports                            
    .doutb         ( rd_data          ),
	.single_err	   ( single_err       ),
    .double_err    ( double_err       ),

    //global ports
    .clka          ( clk              ),        
    .clkb          ( clk              ),
	.ram_bypass	   ( ram_bypass       ),

    //input ports             
    .csa           ( wen              ),        
    .wra           ( wen              ),        
    .addra         ( waddr            ),        
    .dina          ( wr_data          ),
    .csb           ( ren              ),        
    .rdb           ( ren              ),        
    .addrb         ( raddr            )
);

endmodule

