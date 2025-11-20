module sr_latch_tb;
    logic l_s, l_r, l_q, l_qn;

    // Port-Zuordnung korrigiert
    sr_latch dut ( .i_r(l_r), .i_s(l_s), .o_q(l_q), .o_qn(l_qn) );

    initial begin
        $dumpfile("dump_sr_latch.vcd");
        $dumpvars;

        // Test 1: Reset (R=1, S=0) -> Q=0, Qn=1
        l_s = 0;
        l_r = 1;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        // Test 2: Set (R=0, S=1) -> Q=1, Qn=0
        l_s = 1;
        l_r = 0;
        #10;
        assert (l_q === 1);
        assert (l_qn === 0);

        // Test 3: Hold (R=0, S=0) -> Zustand bleibt
        l_s = 0;
        l_r = 0;
        #10;
        assert (l_q === 1);
        assert (l_qn === 0);

        // Test 4: Reset (R=1, S=0) -> Q=0, Qn=1
        l_s = 0;
        l_r = 1;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        // Test 5: Hold (R=0, S=0) -> Zustand bleibt
        l_s = 0;
        l_r = 0;
        #10;
        assert (l_q === 0);
        assert (l_qn === 1);

        // Test 6: Verbotener Zustand (R=1, S=1) -> beide 0
        l_s = 1;
        l_r = 1;
        #10;
        assert (l_q === 0);
        assert (l_qn === 0);

        $finish;
    end

endmodule