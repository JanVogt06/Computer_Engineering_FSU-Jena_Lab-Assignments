module register_en_4_tb;
    logic l_clk, l_en;
    logic [3:0] l_d, l_q;

    register_en_4 dut ( .i_clk(l_clk), .i_en(l_en), .i_d(l_d), .o_q(l_q) );

    initial l_clk = 0;
    always #5 l_clk = ~l_clk;

    initial begin
        $dumpfile("dump_register_en_4.vcd");
        $dumpvars;

        l_en = 1;
        l_d = 4'b0000;
        #10;
        assert (l_q === 4'b0000);

        l_en = 1;
        l_d = 4'b1010;
        #10;
        assert (l_q === 4'b1010);

        l_en = 0;
        l_d = 4'b1111;
        #10;
        assert (l_q === 4'b1010);

        l_en = 0;
        l_d = 4'b0000;
        #10;
        assert (l_q === 4'b1010);

        l_en = 1;
        l_d = 4'b0101;
        #10;
        assert (l_q === 4'b0101);

        l_en = 1;
        l_d = 4'b1111;
        #10;
        assert (l_q === 4'b1111);

        l_en = 0;
        l_d = 4'b0011;
        #10;
        assert (l_q === 4'b1111);

        $finish;
    end
endmodule