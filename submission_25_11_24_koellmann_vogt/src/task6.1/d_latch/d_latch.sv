module d_latch ( input logic i_d, i_clk,
                 output logic o_q, o_qn );

    logic l_r, l_s;

    assign l_r = ~i_d & i_clk;
    assign l_s = i_d & i_clk;

    sr_latch sr_latch_inst ( .i_r(l_r), .i_s(l_s), .o_q(o_q), .o_qn(o_qn) );

endmodule