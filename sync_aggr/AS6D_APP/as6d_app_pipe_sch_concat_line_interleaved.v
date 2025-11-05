
module as6d_app_pipe_sch_concat_line_interleaved(
/*AUTOARG*/
   // Outputs
   up_state_concat, ack_concat, line_end_concat, pipe0_wr_mode,
   pipe1_wr_mode, pipe2_wr_mode, pipe3_wr_mode, pipe0_wr_mode_strobe,
   pipe1_wr_mode_strobe, pipe2_wr_mode_strobe, pipe3_wr_mode_strobe,
   pipe_clear_bit_map, sch_data_type_align_fail_int,
   // Inputs
   aggre_clk, aggre_clk_rst_n, aggre_mode, pipe0_concat_en,
   pipe1_concat_en, pipe2_concat_en, pipe3_concat_en, video_loss0,
   video_loss1, video_loss2, video_loss3, empty0, empty1, empty2,
   empty3, ack0, ack1, ack2, ack3, line_end0, line_end1, line_end2,
   line_end3, frame_sync_lock, master_pipe, auto_mask_en,
   force_video_mask, video_mask_restart,
   video_pipe_date_type_for_concat_align_vld3,
   video_pipe_date_type_for_concat_align_vld2,
   video_pipe_date_type_for_concat_align_vld1,
   video_pipe_date_type_for_concat_align_vld0,
   video_pipe_date_type_for_concat_align3,
   video_pipe_date_type_for_concat_align2,
   video_pipe_date_type_for_concat_align1,
   video_pipe_date_type_for_concat_align0
   );    
    input                   aggre_clk;
    input                   aggre_clk_rst_n;
    input [1:0]             aggre_mode;
    input                   pipe0_concat_en;
    input                   pipe1_concat_en;
    input                   pipe2_concat_en;
    input                   pipe3_concat_en;
    input                   video_loss0;
    input                   video_loss1;
    input                   video_loss2;
    input                   video_loss3;
    input                   empty0;
    input                   empty1;
    input                   empty2;
    input                   empty3;
    input                   ack0;
    input                   ack1;
    input                   ack2;
    input                   ack3;
    input                   line_end0;
    input                   line_end1;
    input                   line_end2;
    input                   line_end3;
    input                   frame_sync_lock;
    input       [1:0]       master_pipe;
    input       [3:0]       auto_mask_en;
    input       [3:0]       force_video_mask;
    input       [3:0]       video_mask_restart;
    input                   video_pipe_date_type_for_concat_align_vld0;
    input                   video_pipe_date_type_for_concat_align_vld1;
    input                   video_pipe_date_type_for_concat_align_vld2;
    input                   video_pipe_date_type_for_concat_align_vld3;
    input       [5:0]       video_pipe_date_type_for_concat_align0;
    input       [5:0]       video_pipe_date_type_for_concat_align1;
    input       [5:0]       video_pipe_date_type_for_concat_align2;
    input       [5:0]       video_pipe_date_type_for_concat_align3;
    output reg  [3:0]       up_state_concat;
    output wire [3:0]       ack_concat;
    output wire [3:0]       line_end_concat;
    output wire [1:0]       pipe0_wr_mode;
    output wire [1:0]       pipe1_wr_mode;
    output wire [1:0]       pipe2_wr_mode;
    output wire [1:0]       pipe3_wr_mode;
    output wire             pipe0_wr_mode_strobe;
    output wire             pipe1_wr_mode_strobe;
    output wire             pipe2_wr_mode_strobe;
    output wire             pipe3_wr_mode_strobe;
    output reg  [3:0]       pipe_clear_bit_map;
    output reg              sch_data_type_align_fail_int;

    //signal define 
    //sync aggre states
    genvar                  j;
    localparam              CONCAT_INIT             = 3'd0;
    localparam              CONCAT_IDLE             = 3'd1;
    localparam              CONCAT_START_SCH        = 3'd2;
    localparam              CONCAT_WAIT_END_SCH     = 3'd3;
    localparam              CONCAT_CFG_UPDATE       = 3'd4;
    localparam              CONCAT_PIPE_CLEAR       = 3'd5;
    localparam              SCH_SILENT              = 3'd0;
    localparam              SCH_START_CONCAT        = 3'd1;
    localparam              SCH_MASTER              = 3'd2;
    localparam              SCH_ORDER               = 3'd3;
    localparam              SCH_WAIT_ACK            = 3'd4;
    localparam              SCH_CLEAR_STATE         = 3'd5;
    localparam              SCH_WAIT_LINE_END       = 3'd6;
    localparam              SCH_END_CONCAT          = 3'd7;
    wire                    start_sch_pulse;
    wire                    start_sch_pulse_datatype_align;
    reg                     end_sch_pulse;
    wire [3:0]              sch_auto_mask_en;
    wire [3:0]              sch_force_video_mask;
    wire [3:0]              sch_video_mask_restart;
    wire [3:0]              pipe_restart_bitmap;
    wire [3:0]              pipe_recover_bitmap;
    wire                    pipe_recover;
    wire [3:0]              pipe_video_loss_bit_map;
    wire                    pipe_quit;
    wire [3:0]              pipe_rdy_bitmap;
    wire                    pipe_qualify;
    reg  [3:0]              pipe_mask_bitmap;
    reg  [2:0]              concat_cs;
    reg  [2:0]              concat_ns;
    wire                    end_pipe_clear;
    reg                     master_pipe_fist_sch;
    reg  [1:0]              pipe_wr_mode            [3:0];
    reg  [3:0]              pipe_wr_mode_strobe;
    reg  [2:0]              sch_cs;
    reg  [2:0]              sch_ns;
    reg  [2:0]              order_group             [3:0];
    wire [3:0]              vld_group;
    wire [1:0]              order;
    reg  [1:0]              group_index;
    wire [1:0]              group_index_mux;
    reg                     flag;
    wire                    reg_aggre_map_en;
    reg                     master_flag;
    reg  [1:0]              up_state_save_nc;
    reg                     up_state_save_vld_nc;
    reg                     aggre_busy_pre;
    wire [3:0]              pipe_rdy;
    reg  [3:0]              pipe_mask;
    wire [3:0]              multiple_value_comparator_vld;
    wire                    out_comp_fail;

    assign end_pipe_clear         = 1'd1;

    assign sch_auto_mask_en       = {pipe3_concat_en,pipe2_concat_en,pipe1_concat_en,pipe0_concat_en} & auto_mask_en                    ;
    assign sch_force_video_mask   = {pipe3_concat_en,pipe2_concat_en,pipe1_concat_en,pipe0_concat_en} & force_video_mask                ;
    assign sch_video_mask_restart = {pipe3_concat_en,pipe2_concat_en,pipe1_concat_en,pipe0_concat_en} & video_mask_restart              ;
    
    //***concat machine state begin
    assign pipe_restart_bitmap = {(sch_video_mask_restart[3] & sch_auto_mask_en[3]) & (aggre_mode == 2'd1),
                                  (sch_video_mask_restart[2] & sch_auto_mask_en[2]) & (aggre_mode == 2'd1),
                                  (sch_video_mask_restart[1] & sch_auto_mask_en[1]) & (aggre_mode == 2'd1),
                                  (sch_video_mask_restart[0] & sch_auto_mask_en[0]) & (aggre_mode == 2'd1)};
    assign pipe_recover_bitmap = pipe_restart_bitmap & pipe_mask_bitmap;
    assign pipe_recover = |pipe_recover_bitmap;

    assign pipe_video_loss_bit_map = {video_loss3 & sch_auto_mask_en[3] & (aggre_mode == 2'd1),
                                      video_loss2 & sch_auto_mask_en[2] & (aggre_mode == 2'd1),
                                      video_loss1 & sch_auto_mask_en[1] & (aggre_mode == 2'd1),
                                      video_loss0 & sch_auto_mask_en[0] & (aggre_mode == 2'd1)};
    assign pipe_quit = |pipe_video_loss_bit_map;

    assign pipe_rdy_bitmap = {(~empty3) & pipe3_concat_en & (aggre_mode == 2'd1),
                              (~empty2) & pipe2_concat_en & (aggre_mode == 2'd1),
                              (~empty1) & pipe1_concat_en & (aggre_mode == 2'd1),
                              (~empty0) & pipe0_concat_en & (aggre_mode == 2'd1)};
    assign pipe_qualify = &(~(({pipe3_concat_en,pipe2_concat_en,pipe1_concat_en,pipe0_concat_en} & (pipe_rdy_bitmap|pipe_mask_bitmap)) ^
                               {pipe3_concat_en,pipe2_concat_en,pipe1_concat_en,pipe0_concat_en}));

    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(!aggre_clk_rst_n)begin
            concat_cs <= 3'b0;
        end
        else begin
            concat_cs <= concat_ns;
        end
    end

    always @(*)begin
        case(concat_cs)
            CONCAT_INIT:begin
                if((aggre_mode==2'b01)&&frame_sync_lock)
                    concat_ns = CONCAT_CFG_UPDATE;
                else 
                    concat_ns = CONCAT_INIT;
            end
            CONCAT_IDLE:begin
                if(pipe_quit)
                    concat_ns = CONCAT_CFG_UPDATE;
                else if(pipe_recover)
                    concat_ns = CONCAT_CFG_UPDATE;
                else if(pipe_qualify)
                    concat_ns = CONCAT_START_SCH;
                else 
                    concat_ns = CONCAT_IDLE;
            end
            CONCAT_START_SCH:begin
                    concat_ns = CONCAT_WAIT_END_SCH;
            end
            CONCAT_WAIT_END_SCH:begin
                if(end_sch_pulse)
                    concat_ns = CONCAT_IDLE;
                else 
                    concat_ns = CONCAT_WAIT_END_SCH;
            end
            CONCAT_CFG_UPDATE:begin
                concat_ns = CONCAT_PIPE_CLEAR;
            end
            CONCAT_PIPE_CLEAR:begin
                if(end_pipe_clear)
                    concat_ns = CONCAT_IDLE;
                else 
                    concat_ns = CONCAT_PIPE_CLEAR;
            end
            default:begin
                concat_ns = CONCAT_INIT;
            end
        endcase
    end

    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)
            pipe_mask_bitmap <= 4'd0;
        else if((concat_cs == CONCAT_INIT)&&(concat_ns == CONCAT_CFG_UPDATE))
            pipe_mask_bitmap <= sch_force_video_mask;
        else if((concat_cs == CONCAT_IDLE)&&(concat_ns == CONCAT_CFG_UPDATE))
            if(pipe_quit)
                pipe_mask_bitmap <= pipe_mask_bitmap | pipe_video_loss_bit_map;
            else if(pipe_recover)
                pipe_mask_bitmap <= pipe_mask_bitmap & (~pipe_recover_bitmap);
    end

    assign start_sch_pulse = ((concat_cs == CONCAT_IDLE) && (concat_ns == CONCAT_START_SCH));
    assign start_sch_pulse_datatype_align = ((concat_cs == CONCAT_IDLE) && (concat_ns == CONCAT_START_SCH)) & ~out_comp_fail;

    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)begin
            pipe_wr_mode[0] <= 2'b11;
            pipe_wr_mode[1] <= 2'b11;
            pipe_wr_mode[2] <= 2'b11;
            pipe_wr_mode[3] <= 2'b11;
            pipe_wr_mode_strobe <= 4'b0;
        end
        else if(aggre_mode==2'b01)begin
            if((concat_cs == CONCAT_CFG_UPDATE)&&(concat_ns == CONCAT_PIPE_CLEAR))begin
                pipe_wr_mode[0] <= pipe0_concat_en ? (pipe_mask_bitmap[0] ? 2'b00: 2'b10) : 2'b11;
                pipe_wr_mode[1] <= pipe1_concat_en ? (pipe_mask_bitmap[1] ? 2'b00: 2'b10) : 2'b11;
                pipe_wr_mode[2] <= pipe2_concat_en ? (pipe_mask_bitmap[2] ? 2'b00: 2'b10) : 2'b11;
                pipe_wr_mode[3] <= pipe3_concat_en ? (pipe_mask_bitmap[3] ? 2'b00: 2'b10) : 2'b11;
                pipe_wr_mode_strobe[0] <= pipe0_concat_en ? 1'b1 : 1'b0;
                pipe_wr_mode_strobe[1] <= pipe1_concat_en ? 1'b1 : 1'b0;
                pipe_wr_mode_strobe[2] <= pipe2_concat_en ? 1'b1 : 1'b0;
                pipe_wr_mode_strobe[3] <= pipe3_concat_en ? 1'b1 : 1'b0;
            end
            else begin
                pipe_wr_mode[0] <= 2'b11;
                pipe_wr_mode[1] <= 2'b11;
                pipe_wr_mode[2] <= 2'b11;
                pipe_wr_mode[3] <= 2'b11;
                pipe_wr_mode_strobe <= 4'b0;
            end
        end
        else begin
            pipe_wr_mode[0] <= 2'b11;
            pipe_wr_mode[1] <= 2'b11;
            pipe_wr_mode[2] <= 2'b11;
            pipe_wr_mode[3] <= 2'b11;
            pipe_wr_mode_strobe <= 4'b0;
        end
    end

    assign  pipe0_wr_mode = pipe_wr_mode[0];
    assign  pipe1_wr_mode = pipe_wr_mode[1];
    assign  pipe2_wr_mode = pipe_wr_mode[2];
    assign  pipe3_wr_mode = pipe_wr_mode[3];
    assign  pipe0_wr_mode_strobe = pipe_wr_mode_strobe[0];
    assign  pipe1_wr_mode_strobe = pipe_wr_mode_strobe[1];
    assign  pipe2_wr_mode_strobe = pipe_wr_mode_strobe[2];
    assign  pipe3_wr_mode_strobe = pipe_wr_mode_strobe[3];

    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)
            pipe_clear_bit_map <= 4'd0;
        else if((concat_cs == CONCAT_CFG_UPDATE)&&(concat_ns == CONCAT_PIPE_CLEAR))
            pipe_clear_bit_map <= {pipe3_concat_en,pipe2_concat_en,pipe1_concat_en,pipe0_concat_en};
        else if(end_pipe_clear)
            pipe_clear_bit_map <= 4'd0;
    end

    //***concat machine state end

    //video_pipe_date_type concat_align detect, trigger pmu reset
    assign multiple_value_comparator_vld = {start_sch_pulse & pipe_rdy_bitmap[3] & video_pipe_date_type_for_concat_align_vld3,
                                            start_sch_pulse & pipe_rdy_bitmap[2] & video_pipe_date_type_for_concat_align_vld2,
                                            start_sch_pulse & pipe_rdy_bitmap[1] & video_pipe_date_type_for_concat_align_vld1,
                                            start_sch_pulse & pipe_rdy_bitmap[0] & video_pipe_date_type_for_concat_align_vld0};
    
    /*multiple_value_comparator AUTO_TEMPLATE(
        .in_vld\(.+\)(multiple_value_comparator_vld[\1]),
        .in_data\(.+\)(video_pipe_date_type_for_concat_align\1[]),
		.out_vld	(),
		.out_data	(),
    )*/
    multiple_value_comparator#(.DATA_WDTH(6))
    u_multiple_value_comparator(/*AUTOINST*/
				// Outputs
				.out_vld	(),		 // Templated
				.out_data	(),		 // Templated
				.out_comp_fail	(out_comp_fail),
				// Inputs
				.in_vld0	(multiple_value_comparator_vld[0]), // Templated
				.in_data0	(video_pipe_date_type_for_concat_align0[5:0]), // Templated
				.in_vld1	(multiple_value_comparator_vld[1]), // Templated
				.in_data1	(video_pipe_date_type_for_concat_align1[5:0]), // Templated
				.in_vld2	(multiple_value_comparator_vld[2]), // Templated
				.in_data2	(video_pipe_date_type_for_concat_align2[5:0]), // Templated
				.in_vld3	(multiple_value_comparator_vld[3]), // Templated
				.in_data3	(video_pipe_date_type_for_concat_align3[5:0])); // Templated

    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n) sch_data_type_align_fail_int <= 1'd0;
        else if(aggre_mode == 2'd1) sch_data_type_align_fail_int <= out_comp_fail;
    end
    
    //***sync aggregation machine state begin
    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)begin
            order_group[0] <= 3'd0;
            order_group[1] <= 3'd0;
            order_group[2] <= 3'd0;
            order_group[3] <= 3'd0;
        end
        else if(start_sch_pulse_datatype_align)begin
            order_group[0] <= {pipe_rdy_bitmap[0],2'd0};
            order_group[1] <= {pipe_rdy_bitmap[1],2'd1};
            order_group[2] <= {pipe_rdy_bitmap[2],2'd2};
            order_group[3] <= {pipe_rdy_bitmap[3],2'd3};
        end
        else if((sch_ns==SCH_CLEAR_STATE)&&(sch_cs==SCH_WAIT_ACK))begin
            case(group_index_mux)
            2'd0:begin
                order_group[0] <= order_group[1];
                order_group[1] <= order_group[2];
                order_group[2] <= order_group[3];
                order_group[3] <= {1'd0,order_group[0][1:0]};
            end
            2'd1:begin
                order_group[0] <= order_group[2];
                order_group[1] <= order_group[3];
                order_group[2] <= order_group[0];
                order_group[3] <= {1'd0,order_group[1][1:0]};
            end                              
            2'd2:begin                       
                order_group[0] <= order_group[3];
                order_group[1] <= order_group[0];
                order_group[2] <= order_group[1];
                order_group[3] <= {1'd0,order_group[2][1:0]};
            end
            2'd3:begin                       
                order_group[0] <= order_group[0];
                order_group[1] <= order_group[1];
                order_group[2] <= order_group[2];
                order_group[3] <= {1'd0,order_group[3][1:0]};
            end                              
            endcase
        end
    end

    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)
            master_pipe_fist_sch <= 1'd1;
        else if(start_sch_pulse_datatype_align)
            master_pipe_fist_sch <= pipe_rdy_bitmap[master_pipe];
    end

    assign vld_group = {order_group[3][2],order_group[2][2],order_group[1][2],order_group[0][2]};
    
    always@(*)begin
        group_index   = 2'd0;
        flag        = 1'd0;
        for(int i=0;(~flag)&(i<=3);i=i+1)begin: group_index_bk
            if(vld_group[i])begin
                flag        = 1'd1;
                group_index   = i;
            end
        end
    end
    
    assign order = order_group[group_index][1:0];
    
    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(!aggre_clk_rst_n)begin
            sch_cs <= 3'b0;
        end
        else begin
            sch_cs <= sch_ns;
        end
    end
    
    //****frame_sync_lock register last config
    always @(*)begin
        case(sch_cs)
            SCH_SILENT:begin
                if(start_sch_pulse_datatype_align)
                    sch_ns = SCH_START_CONCAT;
                else
                    sch_ns = SCH_SILENT;
            end
            SCH_START_CONCAT:begin
                if(master_pipe_fist_sch)
                    sch_ns = SCH_MASTER;
                else
                    sch_ns = SCH_ORDER;
            end
            SCH_MASTER:begin
                sch_ns = SCH_WAIT_ACK;
            end
            SCH_ORDER:begin
                sch_ns = SCH_WAIT_ACK;
            end
            SCH_WAIT_ACK:begin
                if(|ack_concat)
                    sch_ns = SCH_CLEAR_STATE;
                else 
                    sch_ns = SCH_WAIT_ACK;
            end
            SCH_CLEAR_STATE:begin
                sch_ns = SCH_WAIT_LINE_END;
            end
            SCH_WAIT_LINE_END:begin
                if(|line_end_concat)
                    if(|vld_group)
                        sch_ns = SCH_ORDER;
                    else
                        sch_ns = SCH_SILENT;
                else 
                    sch_ns = SCH_WAIT_LINE_END;
            end
            default:begin
                sch_ns = SCH_SILENT;
            end
        endcase
    end
    
    assign    ack_concat      = {pipe3_concat_en&ack3,pipe2_concat_en&ack2,pipe1_concat_en&ack1,pipe0_concat_en&ack0};
    assign    line_end_concat = {pipe3_concat_en&line_end3,pipe2_concat_en&line_end2,pipe1_concat_en&line_end1,pipe0_concat_en&line_end0};
    
    generate for (j=0;j<=3;j=j+1)begin:up_state_concat_bk
        always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
            if(~aggre_clk_rst_n)
                up_state_concat[j] <= 1'd0    ;
            else if((sch_ns == SCH_MASTER)&&(master_pipe == j))
                up_state_concat[j] <= 1'd1    ;
            else if((sch_ns == SCH_ORDER)&&(order == j))
                up_state_concat[j] <= 1'd1    ;
            else if((sch_ns == SCH_CLEAR_STATE)&&(ack_concat[j]))
                up_state_concat[j] <= 1'd0    ;
        end
    end
    endgenerate
    
    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)
            master_flag <= 1'd0;
        else if(sch_cs == SCH_MASTER)
            master_flag <= 1'd1;
        else if((sch_cs == SCH_WAIT_ACK)&&(sch_ns==SCH_CLEAR_STATE))
            master_flag <= 1'd0;
    end
    
    assign group_index_mux = master_flag ? master_pipe : group_index ;
    
    //assign end_sch_pulse = (sch_cs == SCH_WAIT_LINE_END)&(sch_ns == SCH_SILENT);
    always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
        if(~aggre_clk_rst_n)
            end_sch_pulse <= 1'd0;
        else if((sch_cs == SCH_WAIT_LINE_END)&(sch_ns == SCH_SILENT))
            end_sch_pulse <= 1'd1;
        else
            end_sch_pulse <= 1'd0;
    end

    //***sync aggregation machine state end

endmodule
//Local Variables:
//verilog-auto-inst-param-value : t
//verilog-library-files:()
//verilog-library-extensions:(".v"".vh"".sv"".svh")
//End:
