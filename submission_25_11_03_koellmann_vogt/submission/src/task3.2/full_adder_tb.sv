/**
* Testbench of the gate-level full adder.
*/
module full_adder_tb;
    logic l_a, l_b, l_s;
    logic l_carry_in, l_carry_out;

    full_adder dut (
        .i_a        (l_a),
        .i_b        (l_b),
        .i_carry_in (l_carry_in),
        .o_s        (l_s),
        .o_carry_out(l_carry_out)
    );

    initial begin
        $dumpfile("dump_full_adder.vcd");
        $dumpvars;

        // Test Case 1: 0 + 0 + 0 = 0, kein Übertrag
        l_a = 1'b0;
        l_b = 1'b0;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 1'b0);
        assert (l_carry_out === 1'b0);

        // Test Case 2: 1 + 0 + 0 = 1, kein Übertrag
        l_a = 1'b1;
        l_b = 1'b0;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 1'b1);
        assert (l_carry_out === 1'b0);

        // Test Case 3: 0 + 1 + 0 = 1, kein Übertrag
        l_a = 1'b0;
        l_b = 1'b1;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 1'b1);
        assert (l_carry_out === 1'b0);

        // Test Case 4: 0 + 0 + 1 = 1, kein Übertrag (Carry-In durchreichen)
        l_a = 1'b0;
        l_b = 1'b0;
        l_carry_in = 1'b1;
        #10;
        assert (l_s === 1'b1);
        assert (l_carry_out === 1'b0);

        // Test Case 5: 1 + 1 + 0 = 10, Summe = 0, Übertrag = 1
        l_a = 1'b1;
        l_b = 1'b1;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 1'b0);
        assert (l_carry_out === 1'b1);

        // Test Case 6: 1 + 0 + 1 = 10, Summe = 0, Übertrag = 1
        l_a = 1'b1;
        l_b = 1'b0;
        l_carry_in = 1'b1;
        #10;
        assert (l_s === 1'b0);
        assert (l_carry_out === 1'b1);

        // Test Case 7: 0 + 1 + 1 = 10, Summe = 0, Übertrag = 1
        l_a = 1'b0;
        l_b = 1'b1;
        l_carry_in = 1'b1;
        #10;
        assert (l_s === 1'b0);
        assert (l_carry_out === 1'b1);

        // Test Case 8: 1 + 1 + 1 = 11, Summe = 1, Übertrag = 1
        l_a = 1'b1;
        l_b = 1'b1;
        l_carry_in = 1'b1;
        #10;
        assert (l_s === 1'b1);
        assert (l_carry_out === 1'b1);

        $finish;
    end
endmodule