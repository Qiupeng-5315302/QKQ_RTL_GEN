
module monitor_idi_packet(/*AUTOARG*/
   // Outputs
   reg_rd_resv_pkt_cnt_lp_pf, reg_rd_resv_pkt_cnt_lp_ph,
   reg_rd_resv_pkt_cnt_sp_le, reg_rd_resv_pkt_cnt_sp_ls,
   reg_rd_resv_pkt_cnt_sp_fe, reg_rd_resv_pkt_cnt_sp_fs,
   // Inputs
   clk, rst_n, header_en, data_type, reg_resv_pkt_match_lp_dt,
   reg_resv_pkt_match_lp_dt_en, reg_clear_resv_pkt_cnt_lp_pf,
   reg_clear_resv_pkt_cnt_lp_ph, reg_clear_resv_pkt_cnt_sp_le,
   reg_clear_resv_pkt_cnt_sp_ls, reg_clear_resv_pkt_cnt_sp_fe,
   reg_clear_resv_pkt_cnt_sp_fs
   );

    input                                               clk;
    input                                               rst_n;
    input                                               header_en;
    input  [5:0]                                        data_type;
    input  [5:0]                                        reg_resv_pkt_match_lp_dt;
    input                                               reg_resv_pkt_match_lp_dt_en;
    input                                               reg_clear_resv_pkt_cnt_lp_pf;
    input                                               reg_clear_resv_pkt_cnt_lp_ph;
    input                                               reg_clear_resv_pkt_cnt_sp_le;
    input                                               reg_clear_resv_pkt_cnt_sp_ls;
    input                                               reg_clear_resv_pkt_cnt_sp_fe;
    input                                               reg_clear_resv_pkt_cnt_sp_fs;

    output [31:0]                                       reg_rd_resv_pkt_cnt_lp_pf;
    output [31:0]                                       reg_rd_resv_pkt_cnt_lp_ph;
    output [31:0]                                       reg_rd_resv_pkt_cnt_sp_le;
    output [31:0]                                       reg_rd_resv_pkt_cnt_sp_ls;
    output [31:0]                                       reg_rd_resv_pkt_cnt_sp_fe;
    output [31:0]                                       reg_rd_resv_pkt_cnt_sp_fs;

    genvar                                              j;
    reg                                                 header_en_d1;
    reg  [5:0]                                          data_type_d1;
    wire                                                header_up;
    wire                                                header_dn;
    reg                                                 header_up_d1;
    wire                                                wr_header;
    wire                                                wr_footer;
    wire                                                wr_data;
    wire                                                wr_short;
    wire                                                sp_fs;
    wire                                                sp_fe;
    wire                                                sp_ls;
    wire                                                sp_le;
    wire                                                lp_dt;
    wire                                                lp_ph;
    wire                                                lp_pf;
    wire [5:0]                                          pkt_pulse;
    wire [31:0]                                         pulse_cnt_block[5:0];
    wire [5:0]                                          pulse_cnt_clear;
    
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            header_en_d1               <=  1'd0                                        ;
            data_type_d1               <=  6'd0                                        ;
        end
        else begin
            header_en_d1               <=  header_en                                   ;
            data_type_d1               <=  data_type                                   ;
        end
    end
    
    assign header_up = header_en & (~header_en_d1);
    assign header_dn = ~header_en & header_en_d1;
    
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            header_up_d1 <= 1'd0;
        else
            header_up_d1 <= header_up;
    end
    
    assign    sp_fs = data_type_d1 == `CSI_FRAME_START;
    assign    sp_fe = data_type_d1 == `CSI_FRAME_END;
    assign    sp_ls = data_type_d1 == `CSI_LINE_START;
    assign    sp_le = data_type_d1 == `CSI_LINE_END;
    assign    lp_dt = reg_resv_pkt_match_lp_dt_en ? (data_type_d1 == reg_resv_pkt_match_lp_dt) : 1'd1 ;
    
    assign    wr_header    = (~header_up)&(~header_dn)&(header_up_d1);
    assign    wr_footer    = (~header_up)&(header_dn)&(~header_up_d1);
    assign    wr_short     = (~header_up)&(header_dn)&(header_up_d1);
    
    assign    pkt_pulse[5]     = wr_footer&lp_dt;
    assign    pkt_pulse[4]     = wr_header&lp_dt;
    assign    pkt_pulse[3]     = wr_short&sp_le;
    assign    pkt_pulse[2]     = wr_short&sp_ls;
    assign    pkt_pulse[1]     = wr_short&sp_fe;
    assign    pkt_pulse[0]     = wr_short&sp_fs;
    
    assign pulse_cnt_clear = {reg_clear_resv_pkt_cnt_lp_pf,
                              reg_clear_resv_pkt_cnt_lp_ph,
                              reg_clear_resv_pkt_cnt_sp_le,
                              reg_clear_resv_pkt_cnt_sp_ls,
                              reg_clear_resv_pkt_cnt_sp_fe,
                              reg_clear_resv_pkt_cnt_sp_fs};
    
    generate for (j=0;j<=5;j=j+1) begin:pulse_cnt_pkt_bk
        pulse_cnt pulse_cnt_pkt(
            .cnt    (pulse_cnt_block[j]),
            .clk    (clk),
            .rst_n  (rst_n),
            .clear  (pulse_cnt_clear[j]),
            .pulse  (pkt_pulse[j])
        );
    end
    endgenerate
    
    assign     reg_rd_resv_pkt_cnt_lp_pf = pulse_cnt_block[5];
    assign     reg_rd_resv_pkt_cnt_lp_ph = pulse_cnt_block[4];
    assign     reg_rd_resv_pkt_cnt_sp_le = pulse_cnt_block[3];
    assign     reg_rd_resv_pkt_cnt_sp_ls = pulse_cnt_block[2];
    assign     reg_rd_resv_pkt_cnt_sp_fe = pulse_cnt_block[1];
    assign     reg_rd_resv_pkt_cnt_sp_fs = pulse_cnt_block[0];

endmodule
