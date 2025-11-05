
module data_mapping(/*AUTOARG*/
   // Outputs
   out_csi_data_mapped, out_data_mapped_en,
   // Inputs
   clk_data, rst_n, header_en_flag, footer_en_flag, data_type,
   csi_data, data_en
   );
    input                                          clk_data;
    input                                          rst_n;
    input                                          header_en_flag;
    input                                          footer_en_flag;
    input      [5:0]                               data_type;
    input      [(`CSI2_HOST_IDI_CSIDATA_SIZE-1):0] csi_data;
    input                                          data_en;
    output     [(`CSI2_HOST_IDI_CSIDATA_SIZE-1):0] out_csi_data_mapped;
    output                                         out_data_mapped_en;

    reg                                            packet_first_data;
    wire                                           packet_first_data_flag;
    reg                                            packet_first_data_flag_d1;
    reg                                            header_en_flag_d1;
    reg                                            footer_en_flag_d1;
    reg        [5:0]                               data_type_d1;
    reg        [(`CSI2_HOST_IDI_CSIDATA_SIZE-1):0] csi_data_d1;
    reg        [(`CSI2_HOST_IDI_CSIDATA_SIZE-1):0] csi_data_d2;
    reg        [111:0]                             csi_data_tmp;
    reg        [111:0]                             csi_data_tmp_mapped;
    reg        [111:0]                             csi_data_tmp_mapped_d1;
    reg                                            data_tmp_en;
    reg                                            data_tmp_mapped_en;
    reg        [(`CSI2_HOST_IDI_CSIDATA_SIZE-1):0] csi_data_mapped;
    reg                                            data_mapped_en;
    reg        [1:0]                               cnt3;
    reg        [2:0]                               cnt5;
    reg        [2:0]                               cnt7;
    reg        [3:0]                               cnt9;
    reg                                            cnt3_nc;
    reg                                            cnt5_nc;
    reg                                            cnt7_nc;
    reg                                            cnt9_nc;
    reg        [1:0]                               cnt3_d1;
    reg        [2:0]                               cnt5_d1;
    reg        [2:0]                               cnt7_d1;
    reg        [3:0]                               cnt9_d1;
    reg                                            cnt3_d1_nc;
    reg                                            cnt5_d1_nc;
    reg                                            cnt7_d1_nc;
    reg                                            cnt9_d1_nc;

    //width convert

    //packet first data detect
    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            packet_first_data <= 1'b0;
        end
        else if(header_en_flag)begin
            packet_first_data <= 1'b1;
        end
        else if(data_en)begin
            packet_first_data <= 1'b0;
        end
    end

    assign packet_first_data_flag = data_en && packet_first_data;

     always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            packet_first_data_flag_d1 <= 1'b0;
        end
        else if(packet_first_data_flag)begin
            packet_first_data_flag_d1 <= 1'b1;
        end
        else begin
            packet_first_data_flag_d1 <= 1'b0;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            header_en_flag_d1 <= 1'b0;
        end
        else if(header_en_flag)begin
            header_en_flag_d1 <= 1'b1;
        end
        else begin
            header_en_flag_d1 <= 1'b0;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            footer_en_flag_d1 <= 1'b0;
        end
        else if(footer_en_flag)begin
            footer_en_flag_d1 <= 1'b1;
        end
        else begin
            footer_en_flag_d1 <= 1'b0;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            data_type_d1 <= 6'b0;
        end
        else if(header_en_flag)begin
            data_type_d1 <= data_type;
        end
    end

    //cycle count
    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt3_nc,cnt3} <= 3'b0;
        end
        else if(header_en_flag)begin
            {cnt3_nc,cnt3} <= 3'b0;
        end
        else if(data_en && (cnt3 >= 2'd2))begin
            {cnt3_nc,cnt3} <= 3'b0;
        end
        else if(data_en)begin
            {cnt3_nc,cnt3} <= cnt3 + 1'b1;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt5_nc,cnt5} <= 4'b0;
        end
        else if(header_en_flag)begin
            {cnt5_nc,cnt5} <= 4'b0;
        end
        else if(data_en && (cnt5 >= 3'd4))begin
            {cnt5_nc,cnt5} <= 4'b0;
        end
        else if(data_en)begin
            {cnt5_nc,cnt5} <= cnt5 + 1'b1;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt7_nc,cnt7} <= 4'b0;
        end
        else if(header_en_flag)begin
            {cnt7_nc,cnt7} <= 4'b0;
        end
        else if(data_en && (cnt7 >= 3'd6))begin
            {cnt7_nc,cnt7} <= 4'b0;
        end
        else if(data_en)begin
            {cnt7_nc,cnt7} <= cnt7 + 1'b1;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt9_nc,cnt9} <= 5'b0;
        end
        else if(header_en_flag)begin
            {cnt9_nc,cnt9} <= 5'b0;
        end
        else if(data_en && (cnt9 >= 4'd8))begin
            {cnt9_nc,cnt9} <= 5'b0;
        end
        else if(data_en)begin
            {cnt9_nc,cnt9} <= cnt9 + 1'b1;
        end
    end

    //width convert
    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            csi_data_d1 <= {`CSI2_HOST_IDI_CSIDATA_SIZE{1'b0}};
            csi_data_d2 <= {`CSI2_HOST_IDI_CSIDATA_SIZE{1'b0}};
        end
        else if(data_en)begin
            csi_data_d1 <= csi_data;
            csi_data_d2 <= csi_data_d1;
        end
    end

    always @(*)begin
        case(data_type_d1)
            `CSI_NULL_BYTE,`CSI_BLANKING_DATA,`CSI_EMBEDDED_DATA,`CSI_RAW8,`CSI_YUV422_8_BIT,`CSI_YUV420_8_BIT,`CSI_YUV420_8_BIT_LEGACY,`CSI_RGB565,`CSI_RGB555:begin
                csi_data_tmp = {48'b0,csi_data};
                data_tmp_en  = data_en;
            end
            `CSI_RAW10,`CSI_YUV422_10_BIT,`CSI_YUV420_10_BIT:begin
                case(cnt5)
                    3'd0:begin
                        csi_data_tmp = {72'b0,csi_data[39:0]};
                        data_tmp_en  = data_en;
                    end
                    3'd1:begin
                        csi_data_tmp = {32'b0,csi_data[55:0],csi_data_d1[63:40]};
                        data_tmp_en  = data_en;
                    end
                    3'd2:begin
                        csi_data_tmp = {72'b0,csi_data[31:0],csi_data_d1[63:56]};
                        data_tmp_en  = data_en;
                    end
                    3'd3:begin
                        csi_data_tmp = {32'b0,csi_data[47:0],csi_data_d1[63:32]};
                        data_tmp_en  = data_en;
                    end
                    3'd4:begin
                        csi_data_tmp = {32'b0,csi_data[63:0],csi_data_d1[63:48]};
                        data_tmp_en  = data_en;
                    end
                    default:begin
                        csi_data_tmp = 112'b0;
                        data_tmp_en  = 1'b0;
                    end
                endcase
            end
            `CSI_RAW12,`CSI_RGB888:begin
                case(cnt3)
                    2'd0:begin
                        csi_data_tmp = {64'b0,csi_data[47:0]};
                        data_tmp_en  = data_en;
                    end
                    2'd1:begin
                        csi_data_tmp = {40'b0,csi_data[55:0],csi_data_d1[63:48]};
                        data_tmp_en  = data_en;
                    end
                    2'd2:begin
                        csi_data_tmp = {40'b0,csi_data[63:0],csi_data_d1[63:56]};
                        data_tmp_en  = data_en;
                    end
                    default:begin
                        csi_data_tmp = 112'b0;
                        data_tmp_en  = 1'b0;
                    end
                endcase
            end
            `CSI_RAW14:begin
                case(cnt7)
                    3'd0:begin
                        csi_data_tmp = {56'b0,csi_data[55:0]};
                        data_tmp_en  = data_en;
                    end
                    3'd1:begin
                        csi_data_tmp = {56'b0,csi_data[47:0],csi_data_d1[63:56]};
                        data_tmp_en  = data_en;
                    end
                    3'd2:begin
                        csi_data_tmp = {56'b0,csi_data[39:0],csi_data_d1[63:48]};
                        data_tmp_en  = data_en;
                    end
                    3'd3:begin
                        csi_data_tmp = {56'b0,csi_data[31:0],csi_data_d1[63:40]};
                        data_tmp_en  = data_en;
                    end
                    3'd4:begin
                        csi_data_tmp = {56'b0,csi_data[23:0],csi_data_d1[63:32]};
                        data_tmp_en  = data_en;
                    end
                    3'd5:begin
                        csi_data_tmp = {56'b0,csi_data[15:0],csi_data_d1[63:24]};
                        data_tmp_en  = data_en;
                    end
                    3'd6:begin
                        csi_data_tmp = {csi_data[63:0],csi_data_d1[63:16]};
                        data_tmp_en  = data_en;
                    end
                    default:begin
                        csi_data_tmp = 112'b0;
                        data_tmp_en  = 1'b0;
                    end
                endcase
            end
            `CSI_RGB666:begin
                case(cnt9)
                    4'd0:begin
                        csi_data_tmp = {58'b0,csi_data[53:0]};
                        data_tmp_en  = data_en;
                    end
                    4'd1:begin
                        csi_data_tmp = {40'b0,csi_data[61:0],csi_data_d1[63:54]};
                        data_tmp_en  = data_en;
                    end
                    4'd2:begin
                        csi_data_tmp = {58'b0,csi_data[51:0],csi_data_d1[63:62]};
                        data_tmp_en  = data_en;
                    end
                    4'd3:begin
                        csi_data_tmp = {40'b0,csi_data[59:0],csi_data_d1[63:52]};
                        data_tmp_en  = data_en;
                    end
                    4'd4:begin
                        csi_data_tmp = {58'b0,csi_data[49:0],csi_data_d1[63:60]};
                        data_tmp_en  = data_en;
                    end
                    4'd5:begin
                        csi_data_tmp = {40'b0,csi_data[57:0],csi_data_d1[63:50]};
                        data_tmp_en  = data_en;
                    end
                    4'd6:begin
                        csi_data_tmp = {58'b0,csi_data[47:0],csi_data_d1[63:58]};
                        data_tmp_en  = data_en;
                    end
                    4'd7:begin
                        csi_data_tmp = {40'b0,csi_data[55:0],csi_data_d1[63:48]};
                        data_tmp_en  = data_en;
                    end
                    4'd8:begin
                        csi_data_tmp = {40'b0,csi_data[63:0],csi_data_d1[63:56]};
                        data_tmp_en  = data_en;
                    end
                    default:begin
                        csi_data_tmp = 112'b0;
                        data_tmp_en  = 1'b0;
                    end
                endcase
            end
            default:begin
                csi_data_tmp = 112'b0;
                data_tmp_en  = 1'b0;
            end
        endcase
    end
                
    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            csi_data_tmp_mapped <= 112'b0;
        end
        else if(data_tmp_en)begin
            case(data_type_d1)
                `CSI_NULL_BYTE,`CSI_BLANKING_DATA,`CSI_EMBEDDED_DATA:begin
                    csi_data_tmp_mapped <= csi_data_tmp;
                end
                `CSI_RAW8:begin
                    csi_data_tmp_mapped <= csi_data_tmp;
                end
                `CSI_RAW10:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:80],csi_raw10_mapping(csi_data_tmp[79:40]),csi_raw10_mapping(csi_data_tmp[39:0])};
                end
                `CSI_RAW12:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:96],csi_raw12_mapping(csi_data_tmp[95:48]),csi_raw12_mapping(csi_data_tmp[47:0])};
                end
                `CSI_RAW14:begin
                    csi_data_tmp_mapped <= {csi_raw14_mapping(csi_data_tmp[111:56]),csi_raw14_mapping(csi_data_tmp[55:0])};
                end
                `CSI_YUV422_8_BIT:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:64],csi_yuv422_8_bit_mapping(csi_data_tmp[63:0])};
                end
                `CSI_YUV422_10_BIT:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:80],csi_raw10_mapping(csi_data_tmp[79:40]),csi_raw10_mapping(csi_data_tmp[39:0])};
                end
                `CSI_YUV420_8_BIT:begin
                    csi_data_tmp_mapped <= csi_data_tmp;
                end
                `CSI_YUV420_10_BIT:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:80],csi_raw10_mapping(csi_data_tmp[79:40]),csi_raw10_mapping(csi_data_tmp[39:0])};
                end
                `CSI_YUV420_8_BIT_LEGACY:begin
                    csi_data_tmp_mapped <= csi_data_tmp;
                end
                `CSI_RGB666:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:72],csi_rgb666_mapping(csi_data_tmp[71:36]),csi_rgb666_mapping(csi_data_tmp[35:0])};
                end
                `CSI_RGB888:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:96],csi_rgb888_mapping(csi_data_tmp[95:48]),csi_rgb888_mapping(csi_data_tmp[47:0])};
                end
                `CSI_RGB565:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:64],csi_rgb565_mapping(csi_data_tmp[63:32]),csi_rgb565_mapping(csi_data_tmp[31:0])};
                end
                `CSI_RGB555:begin
                    csi_data_tmp_mapped <= {csi_data_tmp[111:64],csi_rgb565_mapping(csi_data_tmp[63:32]),csi_rgb565_mapping(csi_data_tmp[31:0])};
                end
                default:begin
                    csi_data_tmp_mapped <= 112'b0;
                end
            endcase
        end
    end
                    
    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            data_tmp_mapped_en <= 1'b0;
        end
        else if(data_tmp_en)begin
            data_tmp_mapped_en <= 1'b1;
        end
        else if(footer_en_flag)begin
            data_tmp_mapped_en <= 1'b1;
        end
        else begin
            data_tmp_mapped_en <= 1'b0;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            csi_data_tmp_mapped_d1 <= 112'b0;
        end
        else if(data_tmp_mapped_en)begin
            csi_data_tmp_mapped_d1 <= csi_data_tmp_mapped;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt3_d1_nc,cnt3_d1} <= 3'b0;
        end
        else if(header_en_flag_d1)begin
            {cnt3_d1_nc,cnt3_d1} <= 3'b0;
        end
        else if(data_tmp_mapped_en && (cnt3_d1 >= 2'd2))begin
            {cnt3_d1_nc,cnt3_d1} <= 3'b0;
        end
        else if(data_tmp_mapped_en)begin
            {cnt3_d1_nc,cnt3_d1} <= cnt3_d1 + 1'b1;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt5_d1_nc,cnt5_d1} <= 4'b0;
        end
        else if(header_en_flag_d1)begin
            {cnt5_d1_nc,cnt5_d1} <= 4'b0;
        end
        else if(data_tmp_mapped_en && (cnt5_d1 >= 3'd4))begin
            {cnt5_d1_nc,cnt5_d1} <= 4'b0;
        end
        else if(data_tmp_mapped_en)begin
            {cnt5_d1_nc,cnt5_d1} <= cnt5_d1 + 1'b1;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt7_d1_nc,cnt7_d1} <= 4'b0;
        end
        else if(header_en_flag_d1)begin
            {cnt7_d1_nc,cnt7_d1} <= 4'b0;
        end
        else if(data_tmp_mapped_en && (cnt7_d1 >= 3'd6))begin
            {cnt7_d1_nc,cnt7_d1} <= 4'b0;
        end
        else if(data_tmp_mapped_en)begin
            {cnt7_d1_nc,cnt7_d1} <= cnt7_d1 + 1'b1;
        end
    end

    always @(posedge clk_data or negedge rst_n)begin
        if(!rst_n)begin
            {cnt9_d1_nc,cnt9_d1} <= 5'b0;
        end
        else if(header_en_flag_d1)begin
            {cnt9_d1_nc,cnt9_d1} <= 5'b0;
        end
        else if(data_tmp_mapped_en && (cnt9_d1 >= 4'd8))begin
            {cnt9_d1_nc,cnt9_d1} <= 5'b0;
        end
        else if(data_tmp_mapped_en)begin
            {cnt9_d1_nc,cnt9_d1} <= cnt9_d1 + 1'b1;
        end
    end

    always @(*)begin
        case(data_type_d1)
            `CSI_NULL_BYTE,`CSI_BLANKING_DATA,`CSI_EMBEDDED_DATA,`CSI_RAW8,`CSI_YUV422_8_BIT,`CSI_YUV420_8_BIT,`CSI_YUV420_8_BIT_LEGACY,`CSI_RGB565,`CSI_RGB555:begin
                if(packet_first_data_flag_d1)begin
                    csi_data_mapped = 64'b0;
                    data_mapped_en  = 1'b0;
                end
//                else if(footer_en_flag_d1)begin
//                    csi_data_mapped = csi_data_tmp_mapped_d1[63:0];
//                    data_mapped_en  = 1'b1;
//                end
                else begin
                    csi_data_mapped = csi_data_tmp_mapped_d1[63:0];
                    data_mapped_en  = data_tmp_mapped_en;
                end
            end
            `CSI_RAW10,`CSI_YUV422_10_BIT,`CSI_YUV420_10_BIT:begin
                case(cnt5_d1)
                    3'd0:begin
                        if(packet_first_data_flag_d1)begin
                            csi_data_mapped = 64'b0;
                            data_mapped_en  = 1'b0;
                        end
//                        else if(footer_en_flag_d1)begin
//                            csi_data_mapped = csi_data_tmp_mapped_d1[79:16];
//                            data_mapped_en  = 1'b1;
//                        end
                        else begin
                            csi_data_mapped = csi_data_tmp_mapped_d1[79:16];
                            data_mapped_en  = data_tmp_mapped_en;
                        end
                    end
                    3'd1:begin
                        csi_data_mapped = {csi_data_tmp_mapped[23:0],csi_data_tmp_mapped_d1[39: 0]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd2:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 7:0],csi_data_tmp_mapped_d1[79:24]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd3:begin
                        csi_data_mapped = {csi_data_tmp_mapped[31:0],csi_data_tmp_mapped_d1[39: 8]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd4:begin
                        csi_data_mapped = {csi_data_tmp_mapped[15:0],csi_data_tmp_mapped_d1[79:32]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    default:begin
                        csi_data_mapped = 64'b0;
                        data_mapped_en  = 1'b0;
                    end
                endcase
            end
            `CSI_RAW12,`CSI_RGB888:begin
                case(cnt3_d1)
                    2'd0:begin
                        if(packet_first_data_flag_d1)begin
                            csi_data_mapped = 64'b0;
                            data_mapped_en  = 1'b0;
                        end
//                        else if(footer_en_flag_d1)begin
//                            csi_data_mapped = csi_data_tmp_mapped_d1[71: 8];
//                            data_mapped_en  = 1'b1;
//                        end
                        else begin
                            csi_data_mapped = csi_data_tmp_mapped_d1[71: 8];
                            data_mapped_en  = data_tmp_mapped_en;
                        end
                    end
                    2'd1:begin
                        csi_data_mapped = {csi_data_tmp_mapped[15:0],csi_data_tmp_mapped_d1[47: 0]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    2'd2:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 7:0],csi_data_tmp_mapped_d1[71:16]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    default:begin
                        csi_data_mapped = 64'b0;
                        data_mapped_en  = 1'b0;
                    end
                endcase
            end
            `CSI_RAW14:begin
                case(cnt7_d1)
                    3'd0:begin
                        if(packet_first_data_flag_d1)begin
                            csi_data_mapped = 64'b0;
                            data_mapped_en  = 1'b0;
                        end
//                        else if(footer_en_flag_d1)begin
//                            csi_data_mapped = csi_data_tmp_mapped_d1[111:48];
//                            data_mapped_en  = 1'b1;
//                        end
                        else begin
                            csi_data_mapped = csi_data_tmp_mapped_d1[111:48];
                            data_mapped_en  = data_tmp_mapped_en;
                        end
                    end
                    3'd1:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 7:0],csi_data_tmp_mapped_d1[ 55: 0]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd2:begin
                        csi_data_mapped = {csi_data_tmp_mapped[15:0],csi_data_tmp_mapped_d1[ 55: 8]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd3:begin
                        csi_data_mapped = {csi_data_tmp_mapped[23:0],csi_data_tmp_mapped_d1[ 55:16]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd4:begin
                        csi_data_mapped = {csi_data_tmp_mapped[31:0],csi_data_tmp_mapped_d1[ 55:24]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd5:begin
                        csi_data_mapped = {csi_data_tmp_mapped[39:0],csi_data_tmp_mapped_d1[ 55:32]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    3'd6:begin
                        csi_data_mapped = {csi_data_tmp_mapped[47:0],csi_data_tmp_mapped_d1[ 55:40]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    default:begin
                        csi_data_mapped = 64'b0;
                        data_mapped_en  = 1'b0;
                    end
                endcase
            end
            `CSI_RGB666:begin
                case(cnt9_d1)
                    4'd0:begin
                        if(packet_first_data_flag_d1)begin
                            csi_data_mapped = 64'b0;
                            data_mapped_en  = 1'b0;
                        end
//                        else if(footer_en_flag_d1)begin
//                            csi_data_mapped = csi_data_tmp_mapped_d1[71: 8];
//                            data_mapped_en  = 1'b1;
//                        end
                        else begin
                            csi_data_mapped = csi_data_tmp_mapped_d1[71: 8];
                            data_mapped_en  = data_tmp_mapped_en;
                        end
                    end
                    4'd1:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 9:0],csi_data_tmp_mapped_d1[ 53: 0]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    4'd2:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 1:0],csi_data_tmp_mapped_d1[ 71:10]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    4'd3:begin
                        csi_data_mapped = {csi_data_tmp_mapped[11:0],csi_data_tmp_mapped_d1[ 53: 2]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    4'd4:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 3:0],csi_data_tmp_mapped_d1[ 71:12]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    4'd5:begin
                        csi_data_mapped = {csi_data_tmp_mapped[13:0],csi_data_tmp_mapped_d1[ 53: 4]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    4'd6:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 5:0],csi_data_tmp_mapped_d1[ 71:14]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    4'd7:begin
                        csi_data_mapped = {csi_data_tmp_mapped[15:0],csi_data_tmp_mapped_d1[ 53: 6]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    4'd8:begin
                        csi_data_mapped = {csi_data_tmp_mapped[ 7:0],csi_data_tmp_mapped_d1[ 71:16]};
                        data_mapped_en  = data_tmp_mapped_en;
                    end
                    default:begin
                        csi_data_mapped = 64'b0;
                        data_mapped_en  = 1'b0;
                    end
                endcase
            end
            default:begin
                csi_data_mapped = 64'b0;
                data_mapped_en  = 1'b0;
            end
        endcase
    end

    assign out_csi_data_mapped = data_mapped_en?csi_data_mapped:{`CSI2_HOST_IDI_CSIDATA_SIZE{1'b0}};
    assign out_data_mapped_en  = data_mapped_en;

//function
    function automatic [39:0] csi_raw10_mapping;
        input [39:0] data_pre_mapping;
        begin
            csi_raw10_mapping = {data_pre_mapping[31:24],data_pre_mapping[39:38],data_pre_mapping[23:16],data_pre_mapping[37:36],
                                 data_pre_mapping[15: 8],data_pre_mapping[35:34],data_pre_mapping[ 7: 0],data_pre_mapping[33:32]};
        end
    endfunction

    function automatic [47:0] csi_raw12_mapping;
        input [47:0] data_pre_mapping;
        begin
            csi_raw12_mapping = {data_pre_mapping[39:32],data_pre_mapping[47:44],data_pre_mapping[31:24],data_pre_mapping[43:40],
                                 data_pre_mapping[15: 8],data_pre_mapping[23:20],data_pre_mapping[ 7: 0],data_pre_mapping[19:16]};
        end
    endfunction

    function automatic [55:0] csi_raw14_mapping;
        input [55:0] data_pre_mapping;
        begin
            csi_raw14_mapping = {data_pre_mapping[31:24],data_pre_mapping[55:50],data_pre_mapping[23:16],data_pre_mapping[49:44],
                                 data_pre_mapping[15: 8],data_pre_mapping[43:38],data_pre_mapping[ 7: 0],data_pre_mapping[37:32]};
        end
    endfunction

    function automatic [63:0] csi_yuv422_8_bit_mapping;
        input [63:0] data_pre_mapping;
        begin
            csi_yuv422_8_bit_mapping  = {data_pre_mapping[ 7: 0],data_pre_mapping[15: 8],data_pre_mapping[23:16],data_pre_mapping[31:24],
                                         data_pre_mapping[39:32],data_pre_mapping[47:40],data_pre_mapping[55:48],data_pre_mapping[63:56]};
        end
    endfunction

    function automatic [35:0] csi_rgb666_mapping;
        input [35:0] data_pre_mapping;
        begin
            csi_rgb666_mapping = {data_pre_mapping[23:18],data_pre_mapping[29:24],data_pre_mapping[35:30],
                                  data_pre_mapping[ 5: 0],data_pre_mapping[11: 6],data_pre_mapping[17:12]};
        end
    endfunction

    function automatic [47:0] csi_rgb888_mapping;
        input [47:0] data_pre_mapping;
        begin
            csi_rgb888_mapping = {data_pre_mapping[31:24],data_pre_mapping[39:32],data_pre_mapping[47:40],
                                  data_pre_mapping[ 7: 0],data_pre_mapping[15: 8],data_pre_mapping[23:16]};
        end
    endfunction

    function automatic [31:0] csi_rgb565_mapping;
        input [31:0] data_pre_mapping;
        begin
            csi_rgb565_mapping = {data_pre_mapping[20:16],data_pre_mapping[26:21],data_pre_mapping[31:27],
                                  data_pre_mapping[ 4: 0],data_pre_mapping[10: 5],data_pre_mapping[15:11]};
        end
    endfunction

endmodule
