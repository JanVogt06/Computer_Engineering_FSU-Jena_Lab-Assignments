/**
 * Testbench of the 4-bit CLA preprocessing stage.
 */
module cla_pre_4_tb;
    logic [3:0] l_a, l_b, l_g, l_p;

    cla_pre_4 dut(
        .i_a(l_a),
        .i_b(l_b),
        .o_g(l_g),
        .o_p(l_p)
    );

    initial begin
        $dumpfile("dump_cla_pre_4.vcd");
        $dumpvars;

        // Test 1: 0000 and 0000 -> G=0000, P=0000
        l_a = 4'b0000;
        l_b = 4'b0000;
        #10;
        assert (l_g === 4'b0000);
        assert (l_p === 4'b0000);

        // Test 2: 1111 and 0000 -> G=0000, P=1111
        l_a = 4'b1111;
        l_b = 4'b0000;
        #10;
        assert (l_g === 4'b0000);
        assert (l_p === 4'b1111);

        // Test 3: 0000 and 1111 -> G=0000, P=1111
        l_a = 4'b0000;
        l_b = 4'b1111;
        #10;
        assert (l_g === 4'b0000);
        assert (l_p === 4'b1111);

        // Test 4: 1111 and 1111 -> G=1111, P=1111
        l_a = 4'b1111;
        l_b = 4'b1111;
        #10;
        assert (l_g === 4'b1111);
        assert (l_p === 4'b1111);

        // Test 5: 1010 and 0101 -> G=0000, P=1111
        l_a = 4'b1010;
        l_b = 4'b0101;
        #10;
        assert (l_g === 4'b0000);
        assert (l_p === 4'b1111);

        // Test 6: 1100 and 1010 -> G=1000, P=1110
        l_a = 4'b1100;
        l_b = 4'b1010;
        #10;
        assert (l_g === 4'b1000);
        assert (l_p === 4'b1110);

        // Test 7: 0011 and 0110 -> G=0010, P=0111
        l_a = 4'b0011;
        l_b = 4'b0110;
        #10;
        assert (l_g === 4'b0010);
        assert (l_p === 4'b0111);

        // Test 8: 1001 and 1001 -> G=1001, P=1001
        l_a = 4'b1001;
        l_b = 4'b1001;
        #10;
        assert (l_g === 4'b1001);
        assert (l_p === 4'b1001);

        $finish;
    end
endmodule