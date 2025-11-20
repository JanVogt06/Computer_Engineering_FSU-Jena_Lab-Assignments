module d_flip_flop ( input logic i_d, i_clk,
                     output logic o_q, o_qn );

    logic l_primary_q, l_primary_qn;
    
    d_latch d_latch_primary ( .i_d(i_d), .i_clk(~i_clk), .o_q(l_primary_q), .o_qn(l_primary_qn) );
    d_latch d_latch_secondary ( .i_d(l_primary_q), .i_clk(i_clk), .o_q(o_q), .o_qn(o_qn) );
endmodule