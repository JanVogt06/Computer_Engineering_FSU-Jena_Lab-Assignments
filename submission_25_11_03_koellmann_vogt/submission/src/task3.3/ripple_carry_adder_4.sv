/**
 * 4-bit ripple-carry adder.
 *
 * @param i_a input A.
 * @param i_b input B.
 * @param i_carry_in carry in.
 * @param o_s sum.
 * @param o_carry_out carry out.
 **/
module ripple_carry_adder_4 (
        input  logic [3:0] i_a,
                           i_b,
        input  logic       i_carry_in,
        output logic [3:0] o_s,
        output logic       o_carry_out
    );

    wire carry1, carry2, carry3;

    full_adder adder1(
        .i_a(i_a[0:0]),
        .i_b(i_b[0:0]),
        .i_carry_in(i_carry_in),
        .o_s(o_s[0:0]),
        .o_carry_out(carry1)
    );

    full_adder adder2(
        .i_a(i_a[1:1]),
        .i_b(i_b[1:1]),
        .i_carry_in(carry1),
        .o_s(o_s[1:1]),
        .o_carry_out(carry2)
    );

    full_adder adder3(
        .i_a(i_a[2:2]),
        .i_b(i_b[2:2]),
        .i_carry_in(carry2),
        .o_s(o_s[2:2]),
        .o_carry_out(carry3)
    );

    full_adder adder4(
        .i_a(i_a[3:3]),
        .i_b(i_b[3:3]),
        .i_carry_in(carry3),
        .o_s(o_s[3:3]),
        .o_carry_out(o_carry_out)
    );

endmodule
