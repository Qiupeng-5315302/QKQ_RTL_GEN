
module crc32_decode_wrapper_with_crc_en_app_idi(/*AUTOARG*/
   // Outputs
   data_out, data_slice_out, data_req_out, crc_err_out,
   // Inputs
   clk, rst_n, data_in, data_slice_in, data_req_in, byte_en_in
   );
    //inputs
    input                                               clk;
    input                                               rst_n;
    input      [127:0]                                  data_in;
    input      [1:0]                                    data_slice_in;
    input                                               data_req_in;
    input      [3:0]                                    byte_en_in;    //byte location

    //outputs
    output     [127:0]                                  data_out;
    output     [1:0]                                    data_slice_out;
    output                                              data_req_out;
    output reg                                          crc_err_out;

    //signal definition
    wire       [31:0]                                   crc_32_in;
    wire       [31:0]                                   crc_32_out;
    reg        [31:0]                                   crc_32_reg;

    wire       [3:0]                                    byte_en_in_real;
    wire                                                crc_en_in_real;

    localparam SLICE_MIDDLE = 2'b00;
    localparam SLICE_FIRST  = 2'b01;
    localparam SLICE_LAST   = 2'b10;
    localparam SLICE_ONLY   = 2'b11;

    //logic body
    assign crc_32_in       = ( data_slice_in == SLICE_ONLY  )? 32'b0:
                             ( data_slice_in == SLICE_FIRST )? 32'b0: crc_32_reg;

    assign byte_en_in_real = byte_en_in;

    //assign crc_en_in_real  = data_req_in && (( data_slice_in == SLICE_ONLY ) || ( data_slice_in == SLICE_LAST ));
    assign crc_en_in_real  = data_req_in ;

    crc32_128bit_with_crc_en u_crc32_128bit_with_crc_en (
        .data_in    ( data_in         ),
        .crc_in     ( crc_32_in       ),
        .byte_en_in ( byte_en_in_real ),
        .crc_en_in  ( crc_en_in_real  ),
        .crc_out    ( crc_32_out      )
    );

    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            crc_32_reg <= 32'b0;
        end
        else if(data_req_in && (data_slice_in == SLICE_ONLY))begin
            crc_32_reg <= 32'b0;
        end
        else if(data_req_in && (data_slice_in == SLICE_FIRST))begin
            crc_32_reg <= crc_32_out;
        end
        else if(data_req_in && (data_slice_in == SLICE_MIDDLE))begin
            crc_32_reg <= crc_32_out;
        end
        else if(data_req_in && (data_slice_in == SLICE_LAST))begin
            crc_32_reg <= 32'b0;
        end
    end

    assign data_out       = data_in;
    assign data_req_out   = data_req_in;
    assign data_slice_out = data_slice_in;

    always @(*)begin
        if(data_req_in && ( data_slice_in == SLICE_LAST ))begin
            crc_err_out = ~(&crc_32_out);
        end
        else begin
            crc_err_out = 1'd0;
        end
    end

endmodule

