module alu_nzcv_tb;
    parameter N = 32;
    
    logic [N-1:0] l_a, l_b;
    logic [1:0]   l_alu_ctrl;
    logic [N-1:0] l_result;
    logic [3:0]   l_nzcv;

    alu_nzcv #(N) dut(
        .i_a        (l_a),
        .i_b        (l_b),
        .i_alu_ctrl (l_alu_ctrl),
        .o_result   (l_result),
        .o_nzcv     (l_nzcv)
    );

    initial begin
        $dumpfile("dump_alu_nzcv.vcd");
        $dumpvars(0, alu_nzcv_tb);

        l_a = 32'h0000_0000;
        l_b = 32'h0000_0000;
        l_alu_ctrl = 2'b00;
        #10;
        assert (l_result === 32'h0000_0000);
        assert (l_nzcv === 4'b0100);

        l_a = 32'h0000_0000;
        l_b = 32'hffff_ffff;
        l_alu_ctrl = 2'b00;
        #10;
        assert (l_result === 32'hffff_ffff);
        assert (l_nzcv === 4'b1000);

        l_a = 32'h0000_0001;
        l_b = 32'hffff_ffff;
        l_alu_ctrl = 2'b00;
        #10;
        assert (l_result === 32'h0000_0000);
        assert (l_nzcv === 4'b0110);

        l_a = 32'h0000_ffff;
        l_b = 32'h0000_0001;
        l_alu_ctrl = 2'b00;
        #10;
        assert (l_result === 32'h0001_0000);
        assert (l_nzcv === 4'b0000);

        l_a = 32'h0000_0000;
        l_b = 32'h0000_0000;
        l_alu_ctrl = 2'b01;
        #10;
        assert (l_result === 32'h0000_0000);
        assert (l_nzcv === 4'b0110);

        l_a = 32'h0001_0000;
        l_b = 32'h0000_0001;
        l_alu_ctrl = 2'b01;
        #10;
        assert (l_result === 32'h0000_ffff);
        assert (l_nzcv === 4'b0010);

        l_a = 32'hffff_ffff;
        l_b = 32'hffff_ffff;
        l_alu_ctrl = 2'b10;
        #10;
        assert (l_result === 32'hffff_ffff);
        assert (l_nzcv === 4'b1000);

        l_a = 32'hffff_ffff;
        l_b = 32'h7743_3477;
        l_alu_ctrl = 2'b10;
        #10;
        assert (l_result === 32'h7743_3477);
        assert (l_nzcv === 4'b0000);

        l_a = 32'h0000_0000;
        l_b = 32'hffff_ffff;
        l_alu_ctrl = 2'b10;
        #10;
        assert (l_result === 32'h0000_0000);
        assert (l_nzcv === 4'b0100);

        l_a = 32'h0000_0000;
        l_b = 32'hffff_ffff;
        l_alu_ctrl = 2'b11;
        #10;
        assert (l_result === 32'hffff_ffff);
        assert (l_nzcv === 4'b1000);

        $finish;
    end

endmodule