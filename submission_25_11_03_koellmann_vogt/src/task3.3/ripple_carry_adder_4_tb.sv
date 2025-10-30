/**
 * Testbench of the 4-bit ripple-carry adder.
 */
module ripple_carry_adder_4_tb;
    logic [3:0] l_a, l_b, l_s;
    logic l_carry_in, l_carry_out;

    ripple_carry_adder_4 dut (
        .i_a        (l_a),
        .i_b        (l_b),
        .i_carry_in (l_carry_in),
        .o_s        (l_s),
        .o_carry_out(l_carry_out)
    );

    initial begin
        $dumpfile("dump_ripple_carry_adder_4.vcd");
        $dumpvars;

        l_a = 4'b0000;
        l_b = 4'b0000;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 4'b0000);
        assert (l_carry_out === 1'b0);

        // TODO: add additional tests

        $finish;
    end
endmodule
