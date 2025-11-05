
//PRBS7  G(X) = X^7 + X^6 +1    64 steps
module prbs_7_64b ( prbs_q, prbs_d);

output  [63:0] prbs_d   ;
input   [63:0] prbs_q   ;

wire    [63:0] prbs_d   ;

    assign prbs_d[63] = prbs_q[ 6] ^ prbs_q[ 5] ;
    assign prbs_d[62] = prbs_q[ 5] ^ prbs_q[ 4] ;
    assign prbs_d[61] = prbs_q[ 4] ^ prbs_q[ 3] ;
    assign prbs_d[60] = prbs_q[ 3] ^ prbs_q[ 2] ;
    assign prbs_d[59] = prbs_q[ 2] ^ prbs_q[ 1] ;
    assign prbs_d[58] = prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[57] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 0] ;
    assign prbs_d[56] = prbs_q[ 6] ^ prbs_q[ 4] ;
    assign prbs_d[55] = prbs_q[ 5] ^ prbs_q[ 3] ;
    assign prbs_d[54] = prbs_q[ 4] ^ prbs_q[ 2] ;
    assign prbs_d[53] = prbs_q[ 3] ^ prbs_q[ 1] ;
    assign prbs_d[52] = prbs_q[ 2] ^ prbs_q[ 0] ;
    assign prbs_d[51] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 1] ;
    assign prbs_d[50] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 0] ;
    assign prbs_d[49] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 3] ;
    assign prbs_d[48] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 2] ;
    assign prbs_d[47] = prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 1] ;
    assign prbs_d[46] = prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[45] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 2] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[44] = prbs_q[ 6] ^ prbs_q[ 4] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[43] = prbs_q[ 6] ^ prbs_q[ 3] ^ prbs_q[ 0] ;
    assign prbs_d[42] = prbs_q[ 6] ^ prbs_q[ 2] ;
    assign prbs_d[41] = prbs_q[ 5] ^ prbs_q[ 1] ;
    assign prbs_d[40] = prbs_q[ 4] ^ prbs_q[ 0] ;
    assign prbs_d[39] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 3] ;
    assign prbs_d[38] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 2] ;
    assign prbs_d[37] = prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 1] ;
    assign prbs_d[36] = prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 0] ;
    assign prbs_d[35] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 2] ^ prbs_q[ 1] ;
    assign prbs_d[34] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[33] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 0] ;
    assign prbs_d[32] = prbs_q[ 6] ^ prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 2] ;
    assign prbs_d[31] = prbs_q[ 5] ^ prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 1] ;
    assign prbs_d[30] = prbs_q[ 4] ^ prbs_q[ 2] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[29] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 3] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[28] = prbs_q[ 6] ^ prbs_q[ 4] ^ prbs_q[ 2] ^ prbs_q[ 0] ;
    assign prbs_d[27] = prbs_q[ 6] ^ prbs_q[ 3] ^ prbs_q[ 1] ;
    assign prbs_d[26] = prbs_q[ 5] ^ prbs_q[ 2] ^ prbs_q[ 0] ;
    assign prbs_d[25] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 1] ;
    assign prbs_d[24] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 0] ;
    assign prbs_d[23] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 2] ;
    assign prbs_d[22] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 1] ;
    assign prbs_d[21] = prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[20] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[19] = prbs_q[ 6] ^ prbs_q[ 4] ^ prbs_q[ 2] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[18] = prbs_q[ 6] ^ prbs_q[ 3] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[17] = prbs_q[ 6] ^ prbs_q[ 2] ^ prbs_q[ 0] ;
    assign prbs_d[16] = prbs_q[ 6] ^ prbs_q[ 1] ;
    assign prbs_d[15] = prbs_q[ 5] ^ prbs_q[ 0] ;
    assign prbs_d[14] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 4] ;
    assign prbs_d[13] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 3] ;
    assign prbs_d[12] = prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 2] ;
    assign prbs_d[11] = prbs_q[ 3] ^ prbs_q[ 2] ^ prbs_q[ 1] ;
    assign prbs_d[10] = prbs_q[ 2] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[ 9] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[ 8] = prbs_q[ 6] ^ prbs_q[ 4] ^ prbs_q[ 0] ;
    assign prbs_d[ 7] = prbs_q[ 6] ^ prbs_q[ 3] ;
    assign prbs_d[ 6] = prbs_q[ 5] ^ prbs_q[ 2] ;
    assign prbs_d[ 5] = prbs_q[ 4] ^ prbs_q[ 1] ;
    assign prbs_d[ 4] = prbs_q[ 3] ^ prbs_q[ 0] ;
    assign prbs_d[ 3] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 2] ;
    assign prbs_d[ 2] = prbs_q[ 5] ^ prbs_q[ 4] ^ prbs_q[ 1] ;
    assign prbs_d[ 1] = prbs_q[ 4] ^ prbs_q[ 3] ^ prbs_q[ 0] ;
    assign prbs_d[ 0] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 3] ^ prbs_q[ 2] ;


endmodule
