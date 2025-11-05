
//PRBS7  G(X) = X^7 + X^6 +1    8 steps
module prbs_7_8b ( prbs_q, prbs_d);

output  [7:0] prbs_d    ;
input   [7:0] prbs_q    ;

wire    [7:0] prbs_d    ;

    assign prbs_d[ 7] = prbs_q[ 6] ^ prbs_q[ 5] ;
    assign prbs_d[ 6] = prbs_q[ 5] ^ prbs_q[ 4] ;
    assign prbs_d[ 5] = prbs_q[ 4] ^ prbs_q[ 3] ;
    assign prbs_d[ 4] = prbs_q[ 3] ^ prbs_q[ 2] ;
    assign prbs_d[ 3] = prbs_q[ 2] ^ prbs_q[ 1] ;
    assign prbs_d[ 2] = prbs_q[ 1] ^ prbs_q[ 0] ;
    assign prbs_d[ 1] = prbs_q[ 6] ^ prbs_q[ 5] ^ prbs_q[ 0] ;
    assign prbs_d[ 0] = prbs_q[ 6] ^ prbs_q[ 4] ;

endmodule
