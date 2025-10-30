module cla_pre_4(
        input  wire [3:0] i_a,
                          i_b,
        output wire [3:0] o_g,
                          o_p
    );

    and gate_g0(o_g[0], i_a[0], i_b[0]);
    and gate_g1(o_g[1], i_a[1], i_b[1]);
    and gate_g2(o_g[2], i_a[2], i_b[2]);
    and gate_g3(o_g[3], i_a[3], i_b[3]);

    or gate_p0(o_p[0], i_a[0], i_b[0]);
    or gate_p1(o_p[1], i_a[1], i_b[1]);
    or gate_p2(o_p[2], i_a[2], i_b[2]);
    or gate_p3(o_p[3], i_a[3], i_b[3]);
endmodule

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

module cla_block_4()
endmodule