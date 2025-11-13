module alu #(parameter N=64) ( 
    input  logic [N-1:0] i_a,
                         i_b,
    input  logic [1:0]   i_alu_ctrl,
    output logic [N-1:0] o_result,
    output logic         o_carry_out 
);

    logic [N-1:0] l_or, l_and;
    assign l_or  = i_a | i_b;
    assign l_and = i_a & i_b;

    logic [N-1:0] l_mux_2_result;
    mux_2 #(N) mux_2_inst (
        .i_in0(i_b), 
        .i_in1(~i_b), 
        .i_s(i_alu_ctrl[0]), 
        .o_out(l_mux_2_result)
    );

    logic [N-1:0] l_adder_result;
    adder #(N) adder_inst (
        .i_a(i_a), 
        .i_b(l_mux_2_result), 
        .i_carry_in(i_alu_ctrl[0]), 
        .o_s(l_adder_result), 
        .o_carry_out(o_carry_out)
    );

    mux_4 #(N) mux_4_inst (
        .i_in0(l_adder_result),  // 2'b00: ADD
        .i_in1(l_adder_result),  // 2'b01: SUB
        .i_in2(l_and),           // 2'b10: AND
        .i_in3(l_or),            // 2'b11: OR
        .i_s(i_alu_ctrl),
        .o_out(o_result)
    );

endmodule