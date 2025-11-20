module d_latch_tb;
    logic l_d, l_clk, l_q, l_qn;

    d_latch dut ( .i_d(l_d), .i_clk(l_clk), .o_q(l_q), .o_qn(l_qn) );

    initial l_clk = 0;
    always #5 l_clk = ~l_clk;

    initial begin
        $dumpfile("dump_d_latch.vcd");
        $dumpvars;

        l_d = 0;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        #2;
        l_d = 1;
        assert (l_q === 0);
        assert (l_qn === 1);

        #4;
        assert (l_q === 1);
        assert (l_qn === 0);

        l_d = 1;
        #6;
        assert (l_q === 1);
        assert (l_qn === 0);

        l_d = 0;
        #4;
        assert (l_q === 0);
        assert (l_qn === 1);

        #4;
        assert (l_q === 0);
        assert (l_qn === 1);

        l_d = 1;
        #6;
        assert (l_q === 1);
        assert (l_qn === 0);

        $finish;
    end
endmodule