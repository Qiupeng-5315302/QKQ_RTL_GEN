
module afifo_clear_ctrl(/*AUTOARG*/
   // Outputs
   clear_ready, clear_done, sync_clear_req,
   // Inputs
   wr_clk, wr_rst_n, clear_trigger, sync_clear_ack, sync_clear_busy
   );
    // 写时钟域时钟和复位
    input  wire    wr_clk;
    input  wire    wr_rst_n;
    
    // 清空触发接口
    input  wire    clear_trigger;        // 清空触发脉冲输入
    output wire    clear_ready;          // 清空准备就绪标志
    output wire    clear_done;           // 清空完成标志
    
    // 与afifo_clear_sync模块的接口
    output wire    sync_clear_req;       // 到afifo_clear_sync的清空请求
    input  wire    sync_clear_ack;       // 来自afifo_clear_sync的完成应答
    input  wire    sync_clear_busy;      // 来自afifo_clear_sync的忙状态

    // =========================================================================
    // 内部信号定义
    // =========================================================================
    
    // 状态机
    reg [1:0]  clear_state;
    localparam IDLE       = 2'b00;       // 空闲状态，等待触发
    localparam CLEAR_REQ  = 2'b01;       // 发送清空请求
    localparam CLEAR_WAIT = 2'b10;       // 等待清空完成
    localparam CLEAR_DONE = 2'b11;       // 清空完成状态
    
    // 触发信号检测
    reg        clear_trigger_d1;         // 触发信号延迟1拍
    wire       clear_trigger_pulse;      // 触发脉冲检测
    
    // 输出信号内部驱动
    reg        sync_clear_req_int;
    reg        clear_ready_int;
    reg        clear_done_int;
    
    // =========================================================================
    // 触发脉冲检测
    // =========================================================================
    
    // 检测上升沿触发脉冲
    always @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            clear_trigger_d1 <= 1'b0;
        end else begin
            clear_trigger_d1 <= clear_trigger;
        end
    end
    
    assign clear_trigger_pulse = clear_trigger && !clear_trigger_d1;
    
    // =========================================================================
    // 清空控制状态机 - 三段式写法
    // =========================================================================
    
    // 下一状态组合逻辑
    reg [1:0] next_state;
    
    // 第一段：状态转移组合逻辑
    always @(*) begin
        next_state = clear_state;  // 默认保持当前状态
        case (clear_state)
            IDLE: begin
                if (clear_trigger_pulse) begin
                    next_state = CLEAR_REQ;
                end
            end
            
            CLEAR_REQ: begin
                if (sync_clear_busy) begin
                    next_state = CLEAR_WAIT;
                end
            end
            
            CLEAR_WAIT: begin
                if (sync_clear_ack) begin
                    next_state = CLEAR_DONE;
                end
            end
            
            CLEAR_DONE: begin
                next_state = IDLE;  // 保持完成状态一个时钟周期后回到空闲
            end
            
            default: begin
                next_state = IDLE;
            end
        endcase
    end
    
    // 第二段：状态寄存器更新
    always @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            clear_state <= IDLE;
        end else begin
            clear_state <= next_state;
        end
    end
    
    // 第三段：输出组合逻辑
    always @(*) begin
        // 默认输出值
        sync_clear_req_int = 1'b0;
        clear_ready_int = 1'b0;
        clear_done_int = 1'b0;
        
        case (clear_state)
            IDLE: begin
                sync_clear_req_int = 1'b0;
                clear_ready_int = 1'b1;
                clear_done_int = 1'b0;
            end
            
            CLEAR_REQ: begin
                sync_clear_req_int = 1'b1;
                clear_ready_int = 1'b0;
                clear_done_int = 1'b0;
            end
            
            CLEAR_WAIT: begin
                sync_clear_req_int = 1'b1;
                clear_ready_int = 1'b0;
                clear_done_int = 1'b0;
            end
            
            CLEAR_DONE: begin
                sync_clear_req_int = 1'b0;
                clear_ready_int = 1'b0;
                clear_done_int = 1'b1;
            end
            
            default: begin
                sync_clear_req_int = 1'b0;
                clear_ready_int = 1'b1;
                clear_done_int = 1'b0;
            end
        endcase
    end
    
    // 输出信号赋值
    assign sync_clear_req = sync_clear_req_int;
    assign clear_ready = clear_ready_int;
    assign clear_done = clear_done_int;
    


endmodule

