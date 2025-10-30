module cla_block_4(
        input  wire [3:0] i_a,
                          i_b,
        input  wire       i_carry_in,
        output wire [3:0] o_s,
        output wire       o_carry_out
    );

    wire [3:0] l_g1, l_p1;
    cla_pre_4 cla_pre(
        .i_a (i_a),
        .i_b (i_b),
        .o_g (l_g1),
        .o_p (l_p1)
    );

    wire l_g2, l_p2;
    cla_logic_4 cla_logic(
        .i_g (l_g1),
        .i_p (l_p1),
        .o_g (l_g2),
        .o_p (l_p2)
    );

    wire l_pc;
    and gate_pc(l_pc, l_p2, i_carry_in);
    or gate_cout(o_carry_out, l_g2, l_pc);

    ripple_carry_adder_4 adder(
        .i_a (i_a),
        .i_b (i_b),
        .i_carry_in (i_carry_in),
        .o_s (o_s)
    );
endmodule