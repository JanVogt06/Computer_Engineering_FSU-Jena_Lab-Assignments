/**
 * Testbench of the 4-bit CLA logic stage.
 */
module cla_logic_4_tb;
    logic [3:0] l_g, l_p;
    logic l_g_out, l_p_out;

    cla_logic_4 dut(
        .i_g(l_g),
        .i_p(l_p),
        .o_g(l_g_out),
        .o_p(l_p_out)
    );

    initial begin
        $dumpfile("dump_cla_logic_4.vcd");
        $dumpvars;

        // Test 1: All zeros -> G=0, P=0
        l_g = 4'b0000;
        l_p = 4'b0000;
        #10;
        assert (l_g_out === 1'b0);
        assert (l_p_out === 1'b0);

        // Test 2: G3=1, all P=0 -> G=1, P=0
        l_g = 4'b1000;
        l_p = 4'b0000;
        #10;
        assert (l_g_out === 1'b1);
        assert (l_p_out === 1'b0);

        // Test 3: All P=1, G=0 -> G=0, P=1
        l_g = 4'b0000;
        l_p = 4'b1111;
        #10;
        assert (l_g_out === 1'b0);
        assert (l_p_out === 1'b1);

        // Test 4: All ones -> G=1, P=1
        l_g = 4'b1111;
        l_p = 4'b1111;
        #10;
        assert (l_g_out === 1'b1);
        assert (l_p_out === 1'b1);

        l_g = 4'b0001;
        l_p = 4'b1110;
        #10;
        assert (l_g_out === 1'b1);
        assert (l_p_out === 1'b0);

        l_g = 4'b0010;
        l_p = 4'b1100;
        #10;
        assert (l_g_out === 1'b1);
        assert (l_p_out === 1'b0);

        l_g = 4'b0100;
        l_p = 4'b1000;
        #10;
        assert (l_g_out === 1'b1);
        assert (l_p_out === 1'b0);

        l_g = 4'b0001;
        l_p = 4'b0000;
        #10;
        assert (l_g_out === 1'b0);
        assert (l_p_out === 1'b0);

        l_g = 4'b0010;
        l_p = 4'b0100;
        #10;
        assert (l_g_out === 1'b0);
        assert (l_p_out === 1'b0);

        l_g = 4'b0101;
        l_p = 4'b1010;
        #10;
        assert (l_g_out === 1'b1);
        assert (l_p_out === 1'b0);

        $finish;
    end
endmodule