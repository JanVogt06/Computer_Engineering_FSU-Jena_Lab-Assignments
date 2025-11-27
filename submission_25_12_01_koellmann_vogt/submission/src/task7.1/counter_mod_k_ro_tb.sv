/**
 * Testbench of the modulo-k counter which has the rollover signal as output.
 **/
module counter_mod_k_ro_tb;
  parameter N = 3;
  logic l_clk;
  logic l_reset;

  logic l_roll_over;
  logic [2:0] l_k;

  // reset
  initial
    begin
      l_reset <= 1;
      #3;
      l_reset <= 0;
    end

  counter_mod_k_ro #(.N(N)) dut ( .i_clk(l_clk),
                                  .i_reset(l_reset),
                                  .i_k(l_k),
                                  .o_roll_over(l_roll_over) );

  initial
    begin
      l_clk = 0;
      forever #5 l_clk = ~l_clk;
    end

  initial
    begin
      $dumpfile("dump_counter_mod_k_ro.vcd");
      $dumpvars;

      l_k = 4;

      #10;
      assert( l_roll_over == 1'b0 )
      #10;
      assert( l_roll_over == 1'b0 )
      #10;
      assert( l_roll_over == 1'b0 )
      #10;
      assert( l_roll_over == 1'b1 )
      #10;
      assert( l_roll_over == 1'b0 )
      #10;
      assert( l_roll_over == 1'b0 )
      #10;
      assert( l_roll_over == 1'b0 )
      #10;
      assert( l_roll_over == 1'b1 )
      #10;
      assert( l_roll_over == 1'b0 )
      #10;
      assert( l_roll_over == 1'b0 )

      $finish;
    end
endmodule