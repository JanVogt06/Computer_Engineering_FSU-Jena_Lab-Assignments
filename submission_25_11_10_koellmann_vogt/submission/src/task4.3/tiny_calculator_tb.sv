/**
 * Testbench of the tiny calculator.
 */
module tiny_calculator_tb;
    logic [7:0] l_sw;
    logic [6:0] l_hex0, l_hex1, l_hex2, l_hex3;

    tiny_calculator dut(
        .SW  (l_sw),
        .HEX0(l_hex0),
        .HEX1(l_hex1),
        .HEX2(l_hex2),
        .HEX3(l_hex3)
    );

    initial begin
        $dumpfile("dump_tiny_calculator.vcd");
        $dumpvars;

        // Test 1: 0000 + 0000 = 0, Cout=0
        l_sw[3:0] = 4'b0000;
        l_sw[7:4] = 4'b0000;
        #10;
        assert (l_hex0 === 7'b100_0000); // 0
        assert (l_hex1 === 7'b100_0000); // 0
        assert (l_hex2 === 7'b100_0000); // 0
        assert (l_hex3 === 7'b100_0000); // 0

        // Test 2: 0011 + 0010 = 5, Cout=0
        l_sw[3:0] = 4'b0011;
        l_sw[7:4] = 4'b0010;
        #10;
        assert (l_hex0 === 7'b011_0000); // 3
        assert (l_hex1 === 7'b010_0100); // 2
        assert (l_hex2 === 7'b001_0010); // 5
        assert (l_hex3 === 7'b100_0000); // 0

        // Test 3: 0111 + 0001 = 8, Cout=0
        l_sw[3:0] = 4'b0111;
        l_sw[7:4] = 4'b0001;
        #10;
        assert (l_hex0 === 7'b111_1000); // 7
        assert (l_hex1 === 7'b111_1001); // 1
        assert (l_hex2 === 7'b000_0000); // 8
        assert (l_hex3 === 7'b100_0000); // 0

        // Test 4: 1000 + 1000 = 16 (0000), Cout=1
        l_sw[3:0] = 4'b1000;
        l_sw[7:4] = 4'b1000;
        #10;
        assert (l_hex0 === 7'b000_0000); // 8
        assert (l_hex1 === 7'b000_0000); // 8
        assert (l_hex2 === 7'b100_0000); // 0
        assert (l_hex3 === 7'b111_1001); // 1

        // Test 5: 1111 + 1111 = 14 (1110), Cout=1
        l_sw[3:0] = 4'b1111;
        l_sw[7:4] = 4'b1111;
        #10;
        assert (l_hex0 === 7'b000_1110); // F
        assert (l_hex1 === 7'b000_1110); // F
        assert (l_hex2 === 7'b000_0110); // E
        assert (l_hex3 === 7'b111_1001); // 1

        $finish;
    end
endmodule