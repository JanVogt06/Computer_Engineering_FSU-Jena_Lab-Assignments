/**
 * Testbench for the 64-bit carry-lookahead adder.
 */
module adder_tb;
    parameter N = 64;
    
    logic [N-1:0] l_a, l_b, l_s;
    logic l_carry_in, l_carry_out;

    adder #(N) dut(
        .i_a        (l_a),
        .i_b        (l_b),
        .i_carry_in (l_carry_in),
        .o_s        (l_s),
        .o_carry_out(l_carry_out)
    );

    initial begin
        $dumpfile("dump_adder.vcd");
        $dumpvars;

        // Test 1: 0 + 0 + 0 = 0, Cout=0
        l_a = 64'h0;
        l_b = 64'h0;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 64'h0);
        assert (l_carry_out === 1'b0);

        // Test 2: Simple addition without carry out
        l_a = 64'h12345678;
        l_b = 64'h87654321;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 64'h99999999);
        assert (l_carry_out === 1'b0);

        // Test 3: Addition with carry in
        l_a = 64'hAAAAAAAAAAAAAAAA;
        l_b = 64'h5555555555555554;
        l_carry_in = 1'b1;
        #10;
        assert (l_s === 64'hFFFFFFFFFFFFFFFF);
        assert (l_carry_out === 1'b0);

        // Test 4: Maximum values causing overflow
        l_a = 64'hFFFFFFFFFFFFFFFF;
        l_b = 64'h0;
        l_carry_in = 1'b1;
        #10;
        assert (l_s === 64'h0);
        assert (l_carry_out === 1'b1);

        // Test 5: Another overflow case
        l_a = 64'hFFFFFFFFFFFFFFFF;
        l_b = 64'hFFFFFFFFFFFFFFFF;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 64'hFFFFFFFFFFFFFFFE);
        assert (l_carry_out === 1'b1);

        // Test 6: Maximum overflow
        l_a = 64'hFFFFFFFFFFFFFFFF;
        l_b = 64'hFFFFFFFFFFFFFFFF;
        l_carry_in = 1'b1;
        #10;
        assert (l_s === 64'hFFFFFFFFFFFFFFFF);
        assert (l_carry_out === 1'b1);

        // Test 7: Random large numbers
        l_a = 64'h123456789ABCDEF0;
        l_b = 64'hFEDCBA9876543210;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 64'h1111111111111100);
        assert (l_carry_out === 1'b1);

        // Test 8: Alternating bit patterns
        l_a = 64'hA5A5A5A5A5A5A5A5;
        l_b = 64'h5A5A5A5A5A5A5A5A;
        l_carry_in = 1'b0;
        #10;
        assert (l_s === 64'hFFFFFFFFFFFFFFFF);
        assert (l_carry_out === 1'b0);
        $finish;
    end
endmodule