module as6d_app_pipe_sch_concat_line_interleaved(
    // Clock and Reset
    input                   aggre_clk,
    input                   aggre_clk_rst_n,
    
    // Configuration Inputs
    input   [1:0]           aggre_mode,                         // 汇聚模式
    input   [3:0]           pipe_concat_en
    input   [3:0]           pipe_mask_bitmap,
    input   [1:0]           master_pipe,                        // 主pipe选择
    input   [3:0]           pipe_rdy_bitmap,                    // pipe就绪位图
    
    // Scheduling Control
    input                   start_sch_pulse,
    output  reg             end_sch_pulse,
    
    // Video Pipe DataType for Alignment Detection
    input                   video_pipe_date_type_for_concat_align_vld0,
    input   [5:0]           video_pipe_date_type_for_concat_align0,
    input                   video_pipe_date_type_for_concat_align_vld1,
    input   [5:0]           video_pipe_date_type_for_concat_align1,
    input                   video_pipe_date_type_for_concat_align_vld2,
    input   [5:0]           video_pipe_date_type_for_concat_align2,
    input                   video_pipe_date_type_for_concat_align_vld3,
    input   [5:0]           video_pipe_date_type_for_concat_align3,
    
    // Video Pipe Acknowledgement and Line End Signals
    input                   empty0,
    input                   empty1,
    input                   empty2,
    input                   empty3,
    input                   ack0,
    input                   ack1,
    input                   ack2,
    input                   ack3,
    input                   line_end0,
    input                   line_end1,
    input                   line_end2,
    input                   line_end3,
    
    // BPG Interface - Inputs from BPG
    input                   bpg_empty,                          // BPG empty signal
    input                   bpg_ack,                            // BPG ack signal
    input                   bpg_line_end,                       // BPG line_end signal
    
    // BPG Interface - Outputs to BPG
    output  reg             bpg_up_state,                       // BPG up_state (4-bit, one per pipe)
    
    // Video Pipe Up State Concat Outputs
    output  reg             up_state_concat[0:3],
    output  wire            ack_concat[0:3],
    output  wire            line_end_concat[0:3],
    
    // Status Outputs
    output  reg             sch_data_type_align_fail_int
    );
    
    // State Machine Parameters
    localparam SCH_SILENT           = 3'd0;
    localparam SCH_START_CONCAT     = 3'd1;
    localparam SCH_MASTER           = 3'd2;
    localparam SCH_ORDER            = 3'd3;
    localparam SCH_WAIT_ACK         = 3'd4;
    localparam SCH_CLEAR_STATE      = 3'd5;
    localparam SCH_WAIT_LINE_END    = 3'd6;
    
    // Internal Signals
    reg     [2:0]           order_group[0:3];
    reg     [2:0]           sch_cs, sch_ns;
    reg                     master_flag;
    reg     [1:0]           group_index;
    reg                     flag;
    reg                     up_state_internal[0:3];         // Internal up_state before splitting
    
    wire                    start_sch_pulse_datatype_align;
    wire    [3:0]           multiple_value_comparator_vld;
    wire                    out_comp_fail;
    wire    [3:0]           vld_group;
    wire    [1:0]           order;
    wire    [3:0]           ack_concat;
    wire    [3:0]           line_end_concat;
    wire    [1:0]           group_index_mux;
    
    // BPG MUX signals - combine video_pipe and BPG based on pipe_mask_bitmap
    wire    [0:3]           ack_combined;
    wire    [0:3]           line_end_combined;
    wire    [0:3]           bpg_up_state_bitmap;
    
    integer                 j;
    genvar                  i;
    
    // =========================================================================
    // BPG MUX Logic - Combine video_pipe and BPG signals based on pipe_mask_bitmap
    // =========================================================================
    // When pipe_mask_bitmap[i] = 1: pipe is masked, use BPG signals
    // When pipe_mask_bitmap[i] = 0: pipe is normal, use video_pipe signals
    
    assign ack_combined[0] = pipe_mask_bitmap[0] ? bpg_ack : ack0;
    assign ack_combined[1] = pipe_mask_bitmap[1] ? bpg_ack : ack1;
    assign ack_combined[2] = pipe_mask_bitmap[2] ? bpg_ack : ack2;
    assign ack_combined[3] = pipe_mask_bitmap[3] ? bpg_ack : ack3;
    
    assign line_end_combined[0] = pipe_mask_bitmap[0] ? bpg_line_end : line_end0;
    assign line_end_combined[1] = pipe_mask_bitmap[1] ? bpg_line_end : line_end1;
    assign line_end_combined[2] = pipe_mask_bitmap[2] ? bpg_line_end : line_end2;
    assign line_end_combined[3] = pipe_mask_bitmap[3] ? bpg_line_end : line_end3;
    
    // Output assignments - split up_state between video_pipe and BPG
    // up_state_concat: only for non-masked pipes (video_pipe)
    // bpg_up_state: only for masked pipes (BPG)

    assign up_state_concat = up_state_internal & (~pipe_mask_bitmap);
    assign bpg_up_state_bitmap = up_state_internal & pipe_mask_bitmap;
    assign bpg_up_state = |bpg_up_state_bitmap ;
    
    assign start_sch_pulse_datatype_align = start_sch_pulse & ~out_comp_fail;

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
        if(~aggre_clk_rst_n) 
            sch_data_type_align_fail_int <= 1'd0;
        else if(aggre_mode == 2'd1) 
            sch_data_type_align_fail_int <= out_comp_fail;
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
            order_group[0] <= {pipe_concat_en[0],2'd0};
            order_group[1] <= {pipe_concat_en[1],2'd1};
            order_group[2] <= {pipe_concat_en[2],2'd2};
            order_group[3] <= {pipe_concat_en[3],2'd3};
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
                sch_ns = SCH_MASTER;
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
    
    assign    ack_concat      = {pipe_concat_en[3]&ack_combined[3],pipe_concat_en[2]&ack_combined[2],pipe_concat_en[1]&ack_combined[1],pipe_concat_en[0]&ack_combined[0]};
    assign    line_end_concat = {pipe_concat_en[3]&line_end_combined[3],pipe_concat_en[2]&line_end_combined[2],pipe_concat_en[1]&line_end_combined[1],pipe_concat_en[0]&line_end_combined[0]};
    
    generate for (i=0;i<=3;i=i+1)begin:up_state_internal_bk
        always@(posedge aggre_clk or negedge aggre_clk_rst_n)begin
            if(~aggre_clk_rst_n)
                up_state_internal[i] <= 1'd0    ;
            else if((sch_ns == SCH_MASTER)&&(master_pipe == i))
                up_state_internal[i] <= 1'd1    ;
            else if((sch_ns == SCH_ORDER)&&(order == i))
                up_state_internal[i] <= 1'd1    ;
            else if((sch_ns == SCH_CLEAR_STATE)&&(ack_concat[i]))
                up_state_internal[i] <= 1'd0    ;
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
