module xor_3_tb;
    logic l_in0, l_in1, l_in2;
    logic l_res;

    xor_3 dut(
        .i_in0(l_in0),
        .i_in1(l_in1),
        .i_in2(l_in2),
        .o_res(l_res)
    );

    initial begin
        $dumpfile("dump_xor_3.vcd");
        $dumpvars(0, xor_3_tb);

        // Test alle 8 möglichen Kombinationen
        // XOR gibt 1 aus bei ungerader Anzahl von 1en

        // Test 1: 000 -> 0
        {l_in0, l_in1, l_in2} = 3'b000;
        #10;
        assert (l_res === 1'b0);

        // Test 2: 001 -> 1
        {l_in0, l_in1, l_in2} = 3'b001;
        #10;
        assert (l_res === 1'b1);

        // Test 3: 010 -> 1
        {l_in0, l_in1, l_in2} = 3'b010;
        #10;
        assert (l_res === 1'b1);

        // Test 4: 011 -> 0
        {l_in0, l_in1, l_in2} = 3'b011;
        #10;
        assert (l_res === 1'b0);

        // Test 5: 100 -> 1
        {l_in0, l_in1, l_in2} = 3'b100;
        #10;
        assert (l_res === 1'b1);

        // Test 6: 101 -> 0
        {l_in0, l_in1, l_in2} = 3'b101;
        #10;
        assert (l_res === 1'b0);

        // Test 7: 110 -> 0
        {l_in0, l_in1, l_in2} = 3'b110;
        #10;
        assert (l_res === 1'b0);

        // Test 8: 111 -> 1
        {l_in0, l_in1, l_in2} = 3'b111;
        #10;
        assert (l_res === 1'b1);
        $finish;
    end

endmodule