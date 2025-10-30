module cla_logic_4(
        input  wire [3:0] i_g,
                          i_p,
        output wire       o_g,
                          o_p
    );

    wire w1, w2, w3, w4, w5;

    and gate_and1(w1, i_g[0], i_p[1]);
    or gate_or1(w2, w1, i_g[1]);
    and gate_and2(w3, w2, i_p[2]);
    or gate_or2(w4, w3, i_g[2]);
    and gate_and3(w5, w4, i_p[3]);
    or gate_or3(o_g, w5, i_g[3]);

    and gate_p(o_p, i_p[0], i_p[1], i_p[2], i_p[3]);

endmodule