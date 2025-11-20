module d_flip_flop_tb;
    logic l_d, l_clk, l_q, l_qn;

    d_flip_flop dut ( .i_d(l_d), .i_clk(l_clk), .o_q(l_q), .o_qn(l_qn) );

    initial l_clk = 0;
    always #5 l_clk = ~l_clk;

    initial begin
        $dumpfile("dump_d_flip_flop.vcd");
        $dumpvars;

        l_d = 0;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        l_d = 1;
        #3;
        assert (l_q === 0);
        assert (l_qn === 1);

        #7;
        assert (l_q === 1);
        assert (l_qn === 0);

        l_d = 0;
        #3;
        assert (l_q === 1);
        assert (l_qn === 0);

        #7;
        assert (l_q === 0);
        assert (l_qn === 1);

        l_d = 1;
        #10;
        assert (l_q === 1);
        assert (l_qn === 0);

        l_d = 0;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        $finish;
    end
endmodule