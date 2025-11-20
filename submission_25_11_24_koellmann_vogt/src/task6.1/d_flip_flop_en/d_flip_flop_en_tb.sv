module d_flip_flop_en_tb;
    logic l_d, l_clk, l_en, l_q, l_qn;

    d_flip_flop_en dut ( .i_d(l_d), .i_clk(l_clk), .i_en(l_en), .o_q(l_q), .o_qn(l_qn) );

    initial l_clk = 0;
    always #5 l_clk = ~l_clk;

    initial begin
        $dumpfile("dump_d_flip_flop_en.vcd");
        $dumpvars;

        l_en = 1;
        l_d = 0;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        l_en = 1;
        l_d = 1;
        #10;
        assert (l_q === 1);
        assert (l_qn === 0);

        l_en = 0;
        l_d = 0;
        #10;
        assert (l_q === 1);
        assert (l_qn === 0);

        l_en = 0;
        l_d = 1;
        #10;
        assert (l_q === 1);
        assert (l_qn === 0);

        l_en = 1;
        l_d = 0;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        l_en = 0;
        l_d = 1;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        l_en = 1;
        l_d = 1;
        #10;
        assert (l_q === 1);
        assert (l_qn === 0);

        $finish;
    end
endmodule