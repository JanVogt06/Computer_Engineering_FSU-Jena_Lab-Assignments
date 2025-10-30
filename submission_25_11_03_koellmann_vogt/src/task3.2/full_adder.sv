/**
 * Gate-level implementation of a full adder.
 *
 * @param i_a input A.
 * @param i_b input B.
 * @param i_carry_in carry in.
 * @param o_s sum.
 * @param o_carry_out carry out.
 **/
module full_adder(
        input  wire i_a,
                    i_b,
                    i_carry_in,
        output wire o_s,
                    o_carry_out
    );

    xor gate_s(o_s, i_a, i_b, i_carry_in);

    wire l_ab, l_ac, l_bc;

    and gate_ab(l_ab, i_a, i_b);
    and gate_ac(l_ac, i_a, i_carry_in);
    and gate_bc(l_bc, i_b, i_carry_in);

    or gate_cout(o_carry_out, l_ab, l_ac, l_bc);
endmodule