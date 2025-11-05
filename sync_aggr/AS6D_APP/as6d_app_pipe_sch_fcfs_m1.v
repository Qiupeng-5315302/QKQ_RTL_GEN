
module as6d_app_pipe_sch_fcfs_m1(
/*AUTOARG*/
   // Outputs
   up_state_aggre, line_end_aggre, ack_aggre, aggre_busy,
   // Inputs
   aggre_clk, aggre_clk_rst_n, aggre_mode, pipe0_aggre_en,
   pipe1_aggre_en, pipe2_aggre_en, pipe3_aggre_en, pipe4_aggre_en,
   pipe5_aggre_en, pipe6_aggre_en, pipe7_aggre_en, empty0, empty1,
   empty2, empty3, empty4, empty5, empty6, empty7, ack0, ack1, ack2,
   ack3, ack4, ack5, ack6, ack7, ack_pre0, ack_pre1, ack_pre2,
   ack_pre3, ack_pre4, ack_pre5, ack_pre6, ack_pre7, line_end0,
   line_end1, line_end2, line_end3, line_end4, line_end5, line_end6,
   line_end7
   );
    input                   aggre_clk                       ;
    input                   aggre_clk_rst_n                 ;
    input [1:0]             aggre_mode                      ;
    input                   pipe0_aggre_en                  ;
    input                   pipe1_aggre_en                  ;
    input                   pipe2_aggre_en                  ;
    input                   pipe3_aggre_en                  ;
    input                   pipe4_aggre_en                  ;
    input                   pipe5_aggre_en                  ;
    input                   pipe6_aggre_en                  ;
    input                   pipe7_aggre_en                  ;
    input                   empty0                          ;
    input                   empty1                          ;
    input                   empty2                          ;
    input                   empty3                          ;
    input                   empty4                          ;
    input                   empty5                          ;
    input                   empty6                          ;
    input                   empty7                          ;
    input                   ack0                            ;
    input                   ack1                            ;
    input                   ack2                            ;
    input                   ack3                            ;
    input                   ack4                            ;
    input                   ack5                            ;
    input                   ack6                            ;
    input                   ack7                            ;
    input                   ack_pre0                        ;
    input                   ack_pre1                        ;
    input                   ack_pre2                        ;
    input                   ack_pre3                        ;
    input                   ack_pre4                        ;
    input                   ack_pre5                        ;
    input                   ack_pre6                        ;
    input                   ack_pre7                        ;
    input                   line_end0                       ;
    input                   line_end1                       ;
    input                   line_end2                       ;
    input                   line_end3                       ;
    input                   line_end4                       ;
    input                   line_end5                       ;
    input                   line_end6                       ;
    input                   line_end7                       ;
    output reg  [7:0]       up_state_aggre                  ;
    output wire [7:0]       line_end_aggre                  ;
    output wire [7:0]       ack_aggre                       ;
    output                  aggre_busy                      ;
    
    //signal define 
    //async aggre m1 states
    genvar                  j                               ;
    wire                    pipe0_rdy                       ;
    wire                    pipe1_rdy                       ;
    wire                    pipe2_rdy                       ;
    wire                    pipe3_rdy                       ;
    wire                    pipe4_rdy                       ;
    wire                    pipe5_rdy                       ;
    wire                    pipe6_rdy                       ;
    wire                    pipe7_rdy                       ;
    wire                    pipe0_en                        ;
    wire                    pipe1_en                        ;
    wire                    pipe2_en                        ;
    wire                    pipe3_en                        ;
    wire                    pipe4_en                        ;
    wire                    pipe5_en                        ;
    wire                    pipe6_en                        ;
    wire                    pipe7_en                        ;
    wire [7:0]              pipe_en                         ;
    wire [7:0]              ack_aggre_pre                   ;
    reg                     aggre_busy_pre                  ;
    
    //logic design 
    //***async aggregation method 1 begin
    //***aggre_mode = 2 : method 1   ignore empty_vld0~3
    assign  pipe0_rdy = (~empty0) & (aggre_mode == 2'd2);
    assign  pipe1_rdy = (~empty1) & (aggre_mode == 2'd2);
    assign  pipe2_rdy = (~empty2) & (aggre_mode == 2'd2);
    assign  pipe3_rdy = (~empty3) & (aggre_mode == 2'd2);
    assign  pipe4_rdy = (~empty4) & (aggre_mode == 2'd2);
    assign  pipe5_rdy = (~empty5) & (aggre_mode == 2'd2);
    assign  pipe6_rdy = (~empty6) & (aggre_mode == 2'd2);
    assign  pipe7_rdy = (~empty7) & (aggre_mode == 2'd2);
    
    assign  pipe0_en = (pipe0_aggre_en&pipe0_rdy);
    assign  pipe1_en = (pipe1_aggre_en&pipe1_rdy)&~(pipe0_aggre_en&pipe0_rdy);
    assign  pipe2_en = (pipe2_aggre_en&pipe2_rdy)&~(pipe1_aggre_en&pipe1_rdy)&~(pipe0_aggre_en&pipe0_rdy);
    assign  pipe3_en = (pipe3_aggre_en&pipe3_rdy)&~(pipe2_aggre_en&pipe2_rdy)&~(pipe1_aggre_en&pipe1_rdy)&~(pipe0_aggre_en&pipe0_rdy);
    assign  pipe4_en = (pipe4_aggre_en&pipe4_rdy)&~(pipe3_aggre_en&pipe3_rdy)&~(pipe2_aggre_en&pipe2_rdy)&~(pipe1_aggre_en&pipe1_rdy)&~(pipe0_aggre_en&pipe0_rdy);
    assign  pipe5_en = (pipe5_aggre_en&pipe5_rdy)&~(pipe4_aggre_en&pipe4_rdy)&~(pipe3_aggre_en&pipe3_rdy)&~(pipe2_aggre_en&pipe2_rdy)&~(pipe1_aggre_en&pipe1_rdy)&~(pipe0_aggre_en&pipe0_rdy);
    assign  pipe6_en = (pipe6_aggre_en&pipe6_rdy)&~(pipe5_aggre_en&pipe5_rdy)&~(pipe4_aggre_en&pipe4_rdy)&~(pipe3_aggre_en&pipe3_rdy)&~(pipe2_aggre_en&pipe2_rdy)&~(pipe1_aggre_en&pipe1_rdy)&~(pipe0_aggre_en&pipe0_rdy);
    assign  pipe7_en = (pipe7_aggre_en&pipe7_rdy)&~(pipe6_aggre_en&pipe6_rdy)&~(pipe5_aggre_en&pipe5_rdy)&~(pipe4_aggre_en&pipe4_rdy)&~(pipe3_aggre_en&pipe3_rdy)&~(pipe2_aggre_en&pipe2_rdy)&~(pipe1_aggre_en&pipe1_rdy)&~(pipe0_aggre_en&pipe0_rdy);
    
    assign  pipe_en  = {pipe7_en,pipe6_en,pipe5_en,pipe4_en,
                        pipe3_en,pipe2_en,pipe1_en,pipe0_en};
    
    assign  ack_aggre   = {pipe7_aggre_en&ack7,pipe6_aggre_en&ack6,pipe5_aggre_en&ack5,pipe4_aggre_en&ack4,
                           pipe3_aggre_en&ack3,pipe2_aggre_en&ack2,pipe1_aggre_en&ack1,pipe0_aggre_en&ack0};
    
    assign  line_end_aggre = {pipe7_aggre_en&line_end7,pipe6_aggre_en&line_end6,pipe5_aggre_en&line_end5,pipe4_aggre_en&line_end4,
                              pipe3_aggre_en&line_end3,pipe2_aggre_en&line_end2,pipe1_aggre_en&line_end1,pipe0_aggre_en&line_end0};
    
    assign  ack_aggre_pre[0] = pipe0_aggre_en&ack_pre0;
    assign  ack_aggre_pre[1] = pipe1_aggre_en&ack_pre1;
    assign  ack_aggre_pre[2] = pipe2_aggre_en&ack_pre2;
    assign  ack_aggre_pre[3] = pipe3_aggre_en&ack_pre3;
    assign  ack_aggre_pre[4] = pipe4_aggre_en&ack_pre4;
    assign  ack_aggre_pre[5] = pipe5_aggre_en&ack_pre5;
    assign  ack_aggre_pre[6] = pipe6_aggre_en&ack_pre6;
    assign  ack_aggre_pre[7] = pipe7_aggre_en&ack_pre7;
    
    //****up_state_aggre[j] |-> ack_aggre_pre[j]
    //****up_state_aggre[j] |=> aggre_busy_pre
    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)
            aggre_busy_pre <= 1'd0;
        else if(|ack_aggre_pre)
            aggre_busy_pre <= 1'd1;
        else if((~|pipe_en) & (|line_end_aggre))
            aggre_busy_pre <= 1'd0;
    end
    
    generate for (j=0;j<=7;j=j+1) begin:up_state_aggre_bk
        always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
            if(~aggre_clk_rst_n)
                up_state_aggre[j] <= 1'd0    ;
            //**** pipe_en[j]&(~aggre_busy_pre) |=> ~pipe_en[j]&up_state_aggre[j] |=> ack_aggre[j] |=> ~up_state_aggre[j]
            else if(ack_aggre[j])
                up_state_aggre[j] <= 1'd0    ;
            //**** pipe_en[j]&(~aggre_busy_pre) |=> pipe_en[j]&up_state_aggre[j] |=> ~|up_state_aggre
            else if(pipe_en[j] & (~aggre_busy_pre))
                up_state_aggre[j] <= (~|up_state_aggre)    ;
            else if(pipe_en[j] & (|line_end_aggre))
                up_state_aggre[j] <= 1'd1    ;
        end
    end
    endgenerate
    
    assign aggre_busy = aggre_busy_pre;
    
    //***async aggregation method 1 end
    
endmodule
