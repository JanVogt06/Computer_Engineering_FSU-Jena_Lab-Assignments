module alu_tb;
    parameter N = 8;
    
    logic [N-1:0] l_a, l_b;
    logic [1:0]   l_alu_ctrl;
    logic [N-1:0] l_result;
    logic         l_carry_out;

    alu #(N) dut(
        .i_a        (l_a),
        .i_b        (l_b),
        .i_alu_ctrl (l_alu_ctrl),
        .o_result   (l_result),
        .o_carry_out(l_carry_out)
    );

    initial begin
        $dumpfile("dump_alu.vcd");
        $dumpvars(0, alu_tb);

        l_a = 8'b0000_0000;
        l_b = 8'b0000_0000;
        l_alu_ctrl = 2'b00;
        #10;
        assert (l_result === 8'b0000_0000);
        assert (l_carry_out === 1'b0);

        l_a = 8'b1011_1101;
        l_b = 8'b1010_0101;
        l_alu_ctrl = 2'b00;
        #10;
        assert (l_result === 8'b0110_0010);
        assert (l_carry_out === 1'b1);

        l_a = 8'b1011_1101;
        l_b = 8'b1010_0101;
        l_alu_ctrl = 2'b01;
        #10;
        assert (l_result === 8'b0001_1000);
        assert (l_carry_out === 1'b1);

        l_a = 8'b1011_1101;
        l_b = 8'b1010_0101;
        l_alu_ctrl = 2'b10;
        #10;
        assert (l_result === 8'b1010_0101);
        assert (l_carry_out === 1'b0);

        l_a = 8'b1011_1101;
        l_b = 8'b1010_0101;
        l_alu_ctrl = 2'b11;
        #10;
        assert (l_result === 8'b1011_1101);
        assert (l_carry_out === 1'b0);

        $finish;
    end

endmodule