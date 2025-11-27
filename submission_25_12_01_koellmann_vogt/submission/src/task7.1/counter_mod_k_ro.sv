/**
 * Counter which has the rollover signal as output.
 * The signal o_roll_over is high in every clock cycle after a rollover occurred and low in all other cycles.
 *
 * Assume k=3, then:
 * cycle     | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | ...
 * mod k     | 0 | 1 | 2 | 0 | 1 | 2 | 0 | 1 | 2 | 0 |  1 | ...
 * rollover: | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 |  0 | ...
 *
 *
 * @param i_clk input clock.
 * @param i_reset reset signal which resets the counter's value to zero.
 * @param i_k value k which is used for the modulo computation.
 * @param o_roll_over set to rollover signal which is high in every clock cycle after a rollover occurred; low else.
 **/
module counter_mod_k_ro #(parameter N=8) ( input  logic         i_clk,
                                           input  logic         i_reset,
                                           input  logic [N-1:0] i_k,
                                           output logic         o_roll_over );
  logic [N-1:0] count;

  counter_mod_k_count #(.N(N)) counter_inst (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_k(i_k),
    .o_count(count)
  );

  // Rollover-Signal: high im Takt NACH dem Übergang von k-1 zu 0
  always_ff @(posedge i_clk, posedge i_reset)
  begin
    if (i_reset)
      o_roll_over <= 1'b0;
    else
      o_roll_over <= (count == i_k - 1);
  end
endmodule