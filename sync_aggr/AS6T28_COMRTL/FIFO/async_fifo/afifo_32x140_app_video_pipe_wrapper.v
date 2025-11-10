
module afifo_32x140_app_video_pipe_wrapper(/*AUTOARG*/
   // Outputs
   prog_full, full, prog_empty, empty, rd_data, rd_data_val,
   single_err, double_err, ovf_int, udf_int, data_count,
   // Inputs
   wr_rst_n, wr_clk, wr_en, wr_data, prog_full_assert_cfg,reg_dft_tpram_config,
   prog_full_negate_cfg, ram_bypass, rd_rst_n, rd_clk, rd_en
   );
// -----------------------------------------------------------------------------

// parameter declaration

// -----------------------------------------------------------------------------      
parameter   FLIPFLOP				= 1;              //fifo address width
parameter   ADDR_WIDTH              = 8;            
parameter   DATA_WIDTH              = 64;
parameter   PROG_EMPTY_ASSERT       = 4;             //fifo data count threshold of prog empty assert
parameter   PROG_EMPTY_NEGATE       = 4;             //fifo data count threshold of prog empty negate
parameter   FIFO_DEEP               = 1<<ADDR_WIDTH;
parameter   RAM_PIPE_STAGE          = 2;             //RAM read dalay

//output ports
output                   prog_full;                  //prog_full
output                   full;                       //full

output                   prog_empty;                 //prog_empty
output                   empty;                      //empty
output  [DATA_WIDTH-1:0] rd_data;                    //rd_data
output                   rd_data_val;                //output data valid 
output					 single_err;     
output					 double_err;     
output                   ovf_int;                    //write over flow interrupt  1=interrupt 0=no interrupt (wr_clk domain)
output                   udf_int;                    //read  under flow interrupt  1=interrupt 0=no interrupt (rd_clk domain)
output [ADDR_WIDTH:0]    data_count; 

//input ports
input  [8:0]			 reg_dft_tpram_config;
input                    wr_rst_n;                   //fifo reset
input                    wr_clk;                     //write clock
input                    wr_en;                      //input write enable
input  [DATA_WIDTH-1:0]  wr_data;                    //be writed data
input  [ADDR_WIDTH:0]    prog_full_assert_cfg;       //FIFO almost full assert config
input  [ADDR_WIDTH:0]    prog_full_negate_cfg;       //FIFO almost full negate config
input           		 ram_bypass		;            //
input                    rd_rst_n;                   //fifo reset
input                    rd_clk;                     //read clock
input                    rd_en;                      //input read enable

// -----------------------------------------------------------------------------

// wire declaration

// -----------------------------------------------------------------------------  
wire                     wen;                        //fifo write enable
wire    [ADDR_WIDTH-1:0] wr_addr;                    //fifo write address
wire                     ren;                        //fifo read enable
wire    [ADDR_WIDTH-1:0] rd_addr;                    //fifo read address

wire    [ADDR_WIDTH:0]   wr_gap;                     //gap from write pointer to read pointer
wire    [ADDR_WIDTH:0]   rd_gap;                     //gap from read pointer to write pointer

wire    [ADDR_WIDTH:0]   waddr_sync;                 //waddr sync to rclk
wire    [ADDR_WIDTH:0]   raddr_sync;                 //raddr sync to wclk

wire    [ADDR_WIDTH:0]   wr_data_cnt;                //FIFO Data Count, Sync to wclk
wire    [1:0]            ovf_nc0;                    //ovf_nc0
wire                     ovf_nc1;                    //ovf_nc1
wire                     ovf_nc2;                    //ovf_nc2

// -----------------------------------------------------------------------------

// register declaration

// -----------------------------------------------------------------------------
wire    [DATA_WIDTH-1:0] rd_data;                    //fifo data output
wire                     rd_data_val;                //output data valid 
reg                      prog_full;                  //fifo almost full
reg                      full;                       //fifo full
reg                      prog_empty;                 //fifo almost empty
reg                      empty;                      //fifo empty
reg                      ovf_int;                    //write over flow interrupt  1=interrupt 0=no interrupt (wr_clk domain) 
reg                      udf_int;                    //read  under flow interrupt  1=interrupt 0=no interrupt (rd_clk domain)

reg     [ADDR_WIDTH:0]   waddr;                      //write address , the MSB is state bit
reg     [ADDR_WIDTH:0]   waddr_gray;                 //write address to gray code
reg     [ADDR_WIDTH:0]   waddr_gray_sync_temp;       //waddr_gray_sync_temp sync to rclk 
reg     [ADDR_WIDTH:0]   waddr_gray_sync;            //waddr_gray_sync_temp sync to rclk 

reg     [ADDR_WIDTH:0]   raddr;                      //read address , the MSB is state bit
reg     [ADDR_WIDTH:0]   raddr_gray;                 //read address to gray code
reg     [ADDR_WIDTH:0]   raddr_gray_sync_temp;       //raddr_gray_sync_temp sync to wclk 
reg     [ADDR_WIDTH:0]   raddr_gray_sync;            //raddr_gray_sync_temp sync to wclk 

// -----------------------------------------------------------------------------

//  overview

//  ========

//  The module completes asynchronous FIFO with gray_coded address

// -----------------------------------------------------------------------------
assign data_count = rd_gap;

bus_delay #(
    .DELAY_CYCLES ( RAM_PIPE_STAGE ),
    .BUS_WIDTH    ( 1              ),
    .INIT_VAL     ( 0              )
)bus_delay_u0 (
    .clk     ( rd_clk      ),   
    .rst_n   ( rd_rst_n    ),
    .inbus   ( ren         ),
    .outbus  ( rd_data_val )
);

//SUBHEADER----------------------------------------------------------- 

//NAME: gray2bin 

//TYPE: func 

//----------------------------------------------------------------------------- 

//PURPOSE: gray change to bin 

//----------------------------------------------------------------------------- 

//PARAMETERS 

//PARAM  NAME:    RANGE:         DESCRIPTION:            DEFAULT:         UNITS 

//N/A           

//----------------------------------------------------------------------------- 

//Other: N/A 

//END_SUBHEADER---------------------------------------------------
function       [ADDR_WIDTH:0]   gray2bin;    //to change the gray code to bin code
   input       [ADDR_WIDTH:0]   gray_in;     //input gray code
   reg         [ADDR_WIDTH:0]   gray_code;   //reg gray 
   reg         [ADDR_WIDTH:0]   bin_code;    //bin code result
   integer i,j;                              //integer
   reg tmp;                                  //tmp
   begin
       gray_code = gray_in;
       for(i=0;i<=ADDR_WIDTH;i=i+1)
           begin
               tmp=1'b0;
               for(j=i;j<=ADDR_WIDTH;j=j+1)
                   tmp=gray_code[j]^tmp;
               bin_code[i]=tmp;
           end
       gray2bin= bin_code;
   end
endfunction 

// -----------------------------------------------------------------------------

// async_fifo write control logic

// -----------------------------------------------------------------------------

//ram write enable & address
assign wen = wr_en && (!full);                  //forbid writing when fifo is full

//ovf_int generated
always @(posedge wr_clk or negedge wr_rst_n)
    if(~wr_rst_n)
        ovf_int <= 1'b0;
    else
        ovf_int <= wr_en && full;

//fifo write address generated
always @(posedge wr_clk or negedge wr_rst_n)
    if(~wr_rst_n)     
        waddr <= {(ADDR_WIDTH + 1){1'b0}};
    else if(wen)                                //forbid writing when fifo is full
        waddr <= waddr + 1'b1;

assign wr_addr = waddr[ADDR_WIDTH-1:0];         //real write addr

//fifo write address: bin to gray       
always @(posedge wr_clk or negedge wr_rst_n)
    if(~wr_rst_n)  
        waddr_gray  <= {(ADDR_WIDTH + 1){1'b0}};
    else
        waddr_gray  <= waddr ^ {1'b0,waddr[ADDR_WIDTH:1]};

//fifo read address gray sync       
always @(posedge wr_clk or negedge wr_rst_n)
    if(~wr_rst_n)begin
        raddr_gray_sync_temp <= {(ADDR_WIDTH + 1){1'b0}};
        raddr_gray_sync      <= {(ADDR_WIDTH + 1){1'b0}};
    end
    else begin
        raddr_gray_sync_temp <= raddr_gray;
        raddr_gray_sync      <= raddr_gray_sync_temp;
    end

//fifo raddr address gray to bin
assign raddr_sync = gray2bin(raddr_gray_sync);//fifo raddr address gray to bin 

//gap form write pointer to read pointer
assign {ovf_nc0,wr_gap} = (raddr_sync - waddr) + FIFO_DEEP; //
assign {ovf_nc1,wr_data_cnt[ADDR_WIDTH:0]} = waddr[ADDR_WIDTH:0] - raddr_sync[ADDR_WIDTH:0]; //

//generated almost full signal       
always @(posedge wr_clk or negedge wr_rst_n)
    if(~wr_rst_n)  
        begin
            prog_full <= 1'b0;
        end
    else
        begin
            if( wr_data_cnt>=prog_full_assert_cfg )
                begin
                    prog_full <= 1'b1;
                end
            else if((wr_data_cnt < prog_full_negate_cfg) )
                begin
                    prog_full <= 1'b0;
                end
            else
                begin
                    prog_full <= prog_full;
                end
        end

//generated full signal
always @(posedge wr_clk or negedge wr_rst_n)
    if(~wr_rst_n)  
        full <= 1'b0;
    else
        full <= (!(|wr_gap)) || ((wr_gap==1)&wr_en);

// -----------------------------------------------------------------------------

// async_fifo read control logic

// -----------------------------------------------------------------------------

//ram read enable
assign ren = rd_en && (!empty);                  //forbid reading when fifo is empty 

//udf_int generated
always @(posedge rd_clk or negedge rd_rst_n)
    if(~rd_rst_n)
        udf_int <= 1'b0;
    else
        udf_int <= rd_en && empty;

//fifo read addr generated
always @(posedge rd_clk or negedge rd_rst_n)
    if(~rd_rst_n)
        raddr <= {(ADDR_WIDTH + 1){1'b0}};
    else if(ren)                           
        raddr <= raddr + 1'b1;

assign rd_addr = raddr[ADDR_WIDTH-1:0]; //real read address

//fifo read addr: bin to gray
always @(posedge rd_clk or negedge rd_rst_n)
    if(~rd_rst_n)
        raddr_gray  <= {(ADDR_WIDTH + 1){1'b0}};
    else
        raddr_gray  <= raddr ^ {1'b0,raddr[ADDR_WIDTH:1]};        

//fifo write address sync       
always @(posedge rd_clk or negedge rd_rst_n)
    if(~rd_rst_n)begin
        waddr_gray_sync_temp <= {(ADDR_WIDTH + 1){1'b0}};
        waddr_gray_sync      <= {(ADDR_WIDTH + 1){1'b0}};
    end
    else begin
        waddr_gray_sync_temp <= waddr_gray;
        waddr_gray_sync      <= waddr_gray_sync_temp;
    end

assign waddr_sync = gray2bin(waddr_gray_sync); //write addr bin

//gap form read pointer to write pointer
assign  {ovf_nc2,rd_gap} = waddr_sync - raddr; //

//generated almost empty signal
always @(posedge rd_clk or negedge rd_rst_n)
    if(~rd_rst_n)
        begin
            prog_empty <= 1'b1;
        end
    else
        begin
            if( rd_gap<=PROG_EMPTY_ASSERT )
                begin
                    prog_empty <= 1'b1;
                end
            else if( (rd_gap > PROG_EMPTY_NEGATE) )
                begin
                    prog_empty <= 1'b0;
                end
            else
                begin
                    prog_empty <= prog_empty;
                end
        end  

//generated empty signal
always @(posedge rd_clk or negedge rd_rst_n)
    if(~rd_rst_n)
        empty <= 1'b1;
    else
        empty <= (!(|rd_gap)) || ((rd_gap==1)&rd_en);

// -----------------------------------------------------------------------------

//ram instance

// -----------------------------------------------------------------------------
generate if(FLIPFLOP==0)
RAM32X140_WRAPPER #(
    .RAM_DEPTH			( FIFO_DEEP			),
    .ADDR_WIDTH      	( ADDR_WIDTH     	),
    .DATA_WIDTH      	( DATA_WIDTH     	),
    .PARITY_WIDTH		( 9					),
    .RAM_PIPE_STAGE  	( RAM_PIPE_STAGE 	)
) u0_ram_wrapper (
    //output ports                            
    .QB_F				( rd_data          ),
	.SINGLE_ERR_B		( single_err       ),
    .DOUBLE_ERR_B		( double_err       ),

    //global ports
    .w_clk				( wr_clk           ),
    .r_clk          	( rd_clk           ),
    .w_nrst        		( wr_rst_n         ),        
    .r_nrst        		( rd_rst_n         ),

    //input ports             
    .reg_dft_tpram_config( reg_dft_tpram_config  ),
    .BYPASS_WRITE_A		( 1'd0				),
	.CHECK_IN_A  		( 1'd0				),
    .BYPASS_READ_B  	( 1'd0		       	),
    .CSA_F				( wen              ),
    .WEA_F           	( wen              ),
    .AA_F				( wr_addr          ),
    .DA_F				( wr_data          ),
    .CSB_F				( ren              ),
    .REB_F				( ren              ),
    .AB_F				( rd_addr          )
);
else 
sram_wrapper #(
    .FLIPFLOP	 (FLIPFLOP		),
    .MEM_DEPTH   (FIFO_DEEP		),
    .ADDR_WIDTH  (ADDR_WIDTH	),
    .DATA_WIDTH  (DATA_WIDTH	)
)u0_sram_wrapper(
    .ClkA		 (wr_clk		),		//input                          
    .ClkB		 (rd_clk		),		//input                          
    .AddrA		 (wr_addr		),		//input       [ADDR_WIDTH-1:0]   
    .AddrB		 (rd_addr		),		//input       [ADDR_WIDTH-1:0]   
    .Din		 (wr_data		),    	//input       [DATA_WIDTH-1:0]   
    .CEAB		 (wen			),   	//input                          
    .CEBB		 (ren			),   	//input                          
    .WEAB		 (wen			),   	//input                          
    .REBB		 (ren			),   	//input                          
    .Q			 (rd_data		)      	//output      [DATA_WIDTH-1:0]   
);
endgenerate

endmodule

