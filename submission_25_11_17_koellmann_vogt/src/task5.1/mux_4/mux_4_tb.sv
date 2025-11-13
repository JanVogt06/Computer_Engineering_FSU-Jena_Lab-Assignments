module mux_4_tb;
    parameter N = 64;
    
    logic [N-1:0] l_in0, l_in1, l_in2, l_in3;
    logic [1:0]   l_s;
    logic [N-1:0] l_out;

    mux_4 #(N) dut(
        .i_in0(l_in0),
        .i_in1(l_in1),
        .i_in2(l_in2),
        .i_in3(l_in3),
        .i_s  (l_s),
        .o_out(l_out)
    );

    initial begin
        $dumpfile("dump_mux_4.vcd");
        $dumpvars(0, mux_4_tb);

        // Setze unterschiedliche Werte für alle Eingänge
        l_in0 = 64'hAAAAAAAAAAAAAAAA;
        l_in1 = 64'hBBBBBBBBBBBBBBBB;
        l_in2 = 64'hCCCCCCCCCCCCCCCC;
        l_in3 = 64'hDDDDDDDDDDDDDDDD;

        // Test 1: Select input 0
        l_s = 2'b00;
        #10;
        assert (l_out === l_in0);

        // Test 2: Select input 1
        l_s = 2'b01;
        #10;
        assert (l_out === l_in1);

        // Test 3: Select input 2
        l_s = 2'b10;
        #10;
        assert (l_out === l_in2);

        // Test 4: Select input 3
        l_s = 2'b11;
        #10;
        assert (l_out === l_in3);

        $finish;
    end

endmodule