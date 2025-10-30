module module_with_delays_tb;
    timeunit 1ns;
    timeprecision 1ps;
    
    logic l_a, l_b, l_c, l_d;

    module_with_delays dut(
        .i_a (l_a),
        .i_b (l_b),
        .i_c (l_c),
        .o_d (l_d)
    );

    initial begin
        $dumpfile("dump_module_with_delays.vcd");
        $dumpvars;

        l_a = 1'b1;
        l_b = 1'b1;
        l_c = 1'b1;
        #10;
        assert(l_d === 1'b1);

        l_a = 1'b1;
        l_b = 1'b1;
        l_c = 1'b0;
        #10;
        assert(l_d === 1'b1);

        $finish;
    end
endmodule