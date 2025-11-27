/**
 * Testbench of the clock derived from a counter's rollover signal.
 **/
module clock_tb;
  logic l_reset;
  logic l_roll_over;
  logic l_clk;

  initial
    begin
      l_reset <= 1;
      #3;
      l_reset <= 0;
    end

  clock dut( .i_roll_over(l_roll_over),
             .i_reset(l_reset),
             .o_clk(l_clk) );

  initial begin
    $dumpfile("dump_clock.vcd");
    $dumpvars;

    l_roll_over = 1'b0;
    #10
    assert(l_clk === 1'b1);  // nach Reset: high
    #10
    assert(l_clk === 1'b1);

    l_roll_over = 1'b1;      // 1. posedge -> toggle zu low
    #5
    assert(l_clk === 1'b0);
    #5
    assert(l_clk === 1'b0);

    l_roll_over = 1'b0;
    #5
    assert(l_clk === 1'b0);
    #5
    assert(l_clk === 1'b0);

    l_roll_over = 1'b1;      // 2. posedge -> toggle zu high
    #5
    assert(l_clk === 1'b1);
    #5
    assert(l_clk === 1'b1);

    l_roll_over = 1'b0;
    #5
    assert(l_clk === 1'b1);
    #5
    assert(l_clk === 1'b1);

    l_roll_over = 1'b1;      // 3. posedge -> toggle zu low
    #5
    assert(l_clk === 1'b0);
    #5
    assert(l_clk === 1'b0);

    l_roll_over = 1'b0;
    #5
    assert(l_clk === 1'b0);
    #5
    assert(l_clk === 1'b0);

    $finish;
  end
endmodule