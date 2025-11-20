module register_en_4 ( input logic i_clk,
                       input logic i_en,
                       input logic [3:0] i_d,
                       output logic [3:0] o_q );

    logic [3:0] l_qn;

    d_flip_flop_en dff0 ( .i_d(i_d[0]), .i_clk(i_clk), .i_en(i_en), .o_q(o_q[0]), .o_qn(l_qn[0]) );
    d_flip_flop_en dff1 ( .i_d(i_d[1]), .i_clk(i_clk), .i_en(i_en), .o_q(o_q[1]), .o_qn(l_qn[1]) );
    d_flip_flop_en dff2 ( .i_d(i_d[2]), .i_clk(i_clk), .i_en(i_en), .o_q(o_q[2]), .o_qn(l_qn[2]) );
    d_flip_flop_en dff3 ( .i_d(i_d[3]), .i_clk(i_clk), .i_en(i_en), .o_q(o_q[3]), .o_qn(l_qn[3]) );

endmodule