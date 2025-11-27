/**
 * Testbench of the modulo-k counter which has the rollover signal as output.
 **/
module counter_mod_k_ro_tb;
  parameter N = 4;
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
      i_clk = 0;
      forever #5 i_clk = ~i_clk;
    end

  initial
    begin
      i_k = N;

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