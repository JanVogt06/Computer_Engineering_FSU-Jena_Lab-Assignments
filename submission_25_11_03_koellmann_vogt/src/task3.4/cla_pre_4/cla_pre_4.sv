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