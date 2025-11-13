module alu_nzcv #(parameter N=64) ( 
    input  logic [N-1:0] i_a,
                         i_b,
    input  logic [1:0]   i_alu_ctrl,
    output logic [N-1:0] o_result,
    output logic [3:0]   o_nzcv 
);

    // Alu von Aufgabe 5.2 (benötigt für Zwischensignale)
    logic [N-1:0] l_or, l_and;
    assign l_or  = i_a | i_b;
    assign l_and = i_a & i_b;

    logic [N-1:0] l_mux_2_result;
    mux_2 #(.N(N)) mux_2_inst (
        .i_in0(i_b), 
        .i_in1(~i_b), 
        .i_s  (i_alu_ctrl[0]), 
        .o_out(l_mux_2_result)
    );

    logic [N-1:0] l_adder_result;
    logic         l_carry_out;
    adder #(.N(N)) adder_inst (
        .i_a        (i_a), 
        .i_b        (l_mux_2_result), 
        .i_carry_in (i_alu_ctrl[0]), 
        .o_s        (l_adder_result), 
        .o_carry_out(l_carry_out)
    );

    mux_4 #(.N(N)) mux_4_inst (
        .i_in0(l_adder_result),
        .i_in1(l_adder_result),
        .i_in2(l_and),
        .i_in3(l_or),
        .i_s  (i_alu_ctrl),
        .o_out(o_result)
    );

    // NZCV Flags
    assign o_nzcv[3] = o_result[N-1];
    assign o_nzcv[2] = ~(|o_result);
    assign o_nzcv[1] = l_carry_out & ~i_alu_ctrl[1];

    logic l_same_sign;
    xor_3 xor_3_inst (
        .i_in0(i_a[N-1]), 
        .i_in1(i_b[N-1]), 
        .i_in2(i_alu_ctrl[0]), 
        .o_res(l_same_sign)
    );

    assign o_nzcv[0] = ~i_alu_ctrl[1] & ~l_same_sign & (i_a[N-1] ^ l_adder_result[N-1]);

endmodule