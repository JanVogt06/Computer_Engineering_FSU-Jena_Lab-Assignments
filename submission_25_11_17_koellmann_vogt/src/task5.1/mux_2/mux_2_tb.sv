module mux_2_tb;
    parameter N = 64;
    
    logic [N-1:0] l_in0, l_in1;
    logic         l_s;
    logic [N-1:0] l_out;

    mux_2 #(.N(N)) dut(
        .i_in0(l_in0),
        .i_in1(l_in1),
        .i_s  (l_s),
        .o_out(l_out)
    );

    initial begin
        $dumpfile("dump_mux_2.vcd");
        $dumpvars(0, mux_2_tb);

        // Test 1: Select input 0
        l_in0 = 64'h1234567890ABCDEF;
        l_in1 = 64'hFEDCBA0987654321;
        l_s = 1'b0;
        #10;
        assert (l_out === l_in0);

        // Test 2: Select input 1
        l_in0 = 64'h1234567890ABCDEF;
        l_in1 = 64'hFEDCBA0987654321;
        l_s = 1'b1;
        #10;
        assert (l_out === l_in1);

        // Test 3: All zeros with select 0
        l_in0 = 64'h0;
        l_in1 = 64'hFFFFFFFFFFFFFFFF;
        l_s = 1'b0;
        #10;
        assert (l_out === 64'h0);

        // Test 4: All ones with select 1
        l_in0 = 64'h0;
        l_in1 = 64'hFFFFFFFFFFFFFFFF;
        l_s = 1'b1;
        #10;
        assert (l_out === 64'hFFFFFFFFFFFFFFFF);

        $finish;
    end

endmodule