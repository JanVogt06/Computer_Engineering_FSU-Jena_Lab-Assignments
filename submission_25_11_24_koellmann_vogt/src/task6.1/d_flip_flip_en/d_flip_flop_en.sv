module d_flip_flop_en ( input logic i_d, i_clk, i_en,
                        output logic o_q, o_qn );

    logic l_d_mux;
    assign l_d_mux = i_en ? i_d : o_q;
    d_flip_flop d_flip_flop_inst ( .i_d(l_d_mux), .i_clk(i_clk), .o_q(o_q), .o_qn(o_qn) );

endmodule