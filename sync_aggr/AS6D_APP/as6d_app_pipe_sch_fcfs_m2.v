
module as6d_app_pipe_sch_fcfs_m2(
/*AUTOARG*/
   // Outputs
   up_state_aggre_m2,
   // Inputs
   aggre_clk, aggre_clk_rst_n, aggre_mode, empty0, empty1, empty2,
   empty3, empty4, empty5, empty6, empty7, empty_vld0, empty_vld1,
   empty_vld2, empty_vld3, empty_vld4, empty_vld5, empty_vld6,
   empty_vld7, ack0, ack1, ack2, ack3, ack4, ack5, ack6, ack7,
   ack_vld0, ack_vld1, ack_vld2, ack_vld3, ack_vld4, ack_vld5,
   ack_vld6, ack_vld7, line_end0, line_end1, line_end2, line_end3,
   line_end4, line_end5, line_end6, line_end7, line_end_vld0,
   line_end_vld1, line_end_vld2, line_end_vld3, line_end_vld4,
   line_end_vld5, line_end_vld6, line_end_vld7
   );

    input                   aggre_clk                       ;
    input                   aggre_clk_rst_n                 ;
    input [1:0]             aggre_mode                      ;
    input                   empty0                          ;
    input                   empty1                          ;
    input                   empty2                          ;
    input                   empty3                          ;
    input                   empty4                          ;
    input                   empty5                          ;
    input                   empty6                          ;
    input                   empty7                          ;
    input                   empty_vld0                      ;
    input                   empty_vld1                      ;
    input                   empty_vld2                      ;
    input                   empty_vld3                      ;
    input                   empty_vld4                      ;
    input                   empty_vld5                      ;
    input                   empty_vld6                      ;
    input                   empty_vld7                      ;
    input                   ack0                            ;
    input                   ack1                            ;
    input                   ack2                            ;
    input                   ack3                            ;
    input                   ack4                            ;
    input                   ack5                            ;
    input                   ack6                            ;
    input                   ack7                            ;
    input                   ack_vld0                        ;
    input                   ack_vld1                        ;
    input                   ack_vld2                        ;
    input                   ack_vld3                        ;
    input                   ack_vld4                        ;
    input                   ack_vld5                        ;
    input                   ack_vld6                        ;
    input                   ack_vld7                        ;
    input                   line_end0                       ;
    input                   line_end1                       ;
    input                   line_end2                       ;
    input                   line_end3                       ;
    input                   line_end4                       ;
    input                   line_end5                       ;
    input                   line_end6                       ;
    input                   line_end7                       ;
    input                   line_end_vld0                   ;
    input                   line_end_vld1                   ;
    input                   line_end_vld2                   ;
    input                   line_end_vld3                   ;
    input                   line_end_vld4                   ;
    input                   line_end_vld5                   ;
    input                   line_end_vld6                   ;
    input                   line_end_vld7                   ;
    output reg  [7:0]       up_state_aggre_m2               ;

    //signal define 
    //async aggre m2 states
    genvar                  j                               ;
    localparam              M2_SCH_IDLE         = 3'd0      ;
    localparam              M2_SCH_ORDER        = 3'd1      ;
    localparam              M2_SCH_WAIT_ACK     = 3'd2      ;
    localparam              M2_SCH_CLEAR_STATE  = 3'd3      ;
    localparam              M2_SCH_WAIT_LINE_END= 3'd4      ;
    reg  [2:0]              m2_sch_cs                       ;
    reg  [2:0]              m2_sch_ns                       ;
    wire [7:0]              m2_pipe_rdy                     ;
    wire [7:0]              m2_pipe_en                      ;
    wire [7:0]              m2_pipe_ack                     ;
    wire [7:0]              m2_pipe_line_end                ;
    

    //***async aggregation method 2 begin
    //***aggre_mode = 3 : method 2   related to    empty_vld0~3/ack_vld0~3/line_end_vld0~3
    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(!aggre_clk_rst_n)begin
            m2_sch_cs <= 3'b0;
        end
        else begin
            m2_sch_cs <= m2_sch_ns;
        end
    end
    
    //****empty_vld_PIPE_SN is particular for every sch with aggr_id configuration
    //****m2_pipe_rdy is a necessary condition for sch start up
    assign  m2_pipe_rdy = {(~empty7) & (empty_vld7 & (aggre_mode == 2'd3)),
                           (~empty6) & (empty_vld6 & (aggre_mode == 2'd3)),
                           (~empty5) & (empty_vld5 & (aggre_mode == 2'd3)),
                           (~empty4) & (empty_vld4 & (aggre_mode == 2'd3)),
                           (~empty3) & (empty_vld3 & (aggre_mode == 2'd3)),
                           (~empty2) & (empty_vld2 & (aggre_mode == 2'd3)),
                           (~empty1) & (empty_vld1 & (aggre_mode == 2'd3)),
                           (~empty0) & (empty_vld0 & (aggre_mode == 2'd3))};
    
    //****only 1 bit is valid for m2_pipe_en
    assign  m2_pipe_en =  {(m2_pipe_rdy[7])&~(m2_pipe_rdy[6])&~(m2_pipe_rdy[5])&~(m2_pipe_rdy[4])&~(m2_pipe_rdy[3])&~(m2_pipe_rdy[2])&~(m2_pipe_rdy[1])&~(m2_pipe_rdy[0]),
                           (m2_pipe_rdy[6])&~(m2_pipe_rdy[5])&~(m2_pipe_rdy[4])&~(m2_pipe_rdy[3])&~(m2_pipe_rdy[2])&~(m2_pipe_rdy[1])&~(m2_pipe_rdy[0]),
                           (m2_pipe_rdy[5])&~(m2_pipe_rdy[4])&~(m2_pipe_rdy[3])&~(m2_pipe_rdy[2])&~(m2_pipe_rdy[1])&~(m2_pipe_rdy[0]),
                           (m2_pipe_rdy[4])&~(m2_pipe_rdy[3])&~(m2_pipe_rdy[2])&~(m2_pipe_rdy[1])&~(m2_pipe_rdy[0]),
                           (m2_pipe_rdy[3])&~(m2_pipe_rdy[2])&~(m2_pipe_rdy[1])&~(m2_pipe_rdy[0]),
                           (m2_pipe_rdy[2])&~(m2_pipe_rdy[1])&~(m2_pipe_rdy[0]),
                           (m2_pipe_rdy[1])&~(m2_pipe_rdy[0]),                         
                           (m2_pipe_rdy[0])};
    
    //****video_pipe lock aggr_id and reply to sch with a ack 
    assign  m2_pipe_ack = {(ack7) & (ack_vld7),
                           (ack6) & (ack_vld6),
                           (ack5) & (ack_vld5),
                           (ack4) & (ack_vld4),
                           (ack3) & (ack_vld3),
                           (ack2) & (ack_vld2),
                           (ack1) & (ack_vld1),
                           (ack0) & (ack_vld0)};
    
    //****video_pipe lock aggr_id and reply to sch with a line_end 
    assign  m2_pipe_line_end = {(line_end7) & (line_end_vld7),
                                (line_end6) & (line_end_vld6),
                                (line_end5) & (line_end_vld5),
                                (line_end4) & (line_end_vld4),
                                (line_end3) & (line_end_vld3),
                                (line_end2) & (line_end_vld2),
                                (line_end1) & (line_end_vld1),
                                (line_end0) & (line_end_vld0)};
    
    always@(*)begin
        case(m2_sch_cs)
            M2_SCH_IDLE:
                if(|m2_pipe_en)begin
                    m2_sch_ns = M2_SCH_ORDER;
                end
                else begin
                    m2_sch_ns = M2_SCH_IDLE;
                end
            M2_SCH_ORDER:
                m2_sch_ns = M2_SCH_WAIT_ACK;
            M2_SCH_WAIT_ACK:
                if(|m2_pipe_ack)begin
                    m2_sch_ns = M2_SCH_CLEAR_STATE;
                end
                else begin
                    m2_sch_ns = M2_SCH_WAIT_ACK;
                end
            M2_SCH_CLEAR_STATE:
                m2_sch_ns = M2_SCH_WAIT_LINE_END;
            M2_SCH_WAIT_LINE_END:
                if(|m2_pipe_line_end)begin
                    m2_sch_ns = M2_SCH_IDLE;
                end
                else begin
                    m2_sch_ns = M2_SCH_WAIT_LINE_END;
                end
            default:begin  
                m2_sch_ns = M2_SCH_IDLE ;
            end
        endcase
    end
    
    //****the PIPE_SN of sending pipe_en & pipe_ack & pipe_line_end is same for scheduler module in scheduling proccess
    generate for (j=0;j<=7;j=j+1)begin:up_state_aggre_m2_bk
        always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
            if(~aggre_clk_rst_n)
                up_state_aggre_m2[j] <= 1'd0;
            else if((m2_sch_ns==M2_SCH_ORDER)&(m2_pipe_en[j]))
                up_state_aggre_m2[j] <= m2_pipe_en[j];
            else if((m2_sch_ns==M2_SCH_CLEAR_STATE)&(m2_pipe_ack[j]))
                up_state_aggre_m2[j] <= 1'd0;
        end
    end
    endgenerate
    
    //***async aggregation method 2 end

endmodule
