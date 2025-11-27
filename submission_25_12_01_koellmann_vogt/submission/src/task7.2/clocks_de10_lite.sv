/**
 * Top-level module of the custom clocks.
 * The module displays a 10Hz clock signal through LEDR5, a 1Hz signal through LEDR6, and a 0.1Hz signal through LEDR7.
 * Switch button SW0 resets all resettable modules on low.
 *
 * @param MAX10_CLK1_50 MAX10_CLK1_50 clock signal available in the MAX 10 FPGA.
 * @param SW bits of ten switch buttons SW9 - SW0.
 * @param LEDR output bits corresponding to the board's ten leds LEDR9 - LEDR0.
 **/
module clocks_de10_lite( input  logic       MAX10_CLK1_50,
                         input  logic [9:0] SW,
                         output logic [9:0] LEDR );
  logic reset;
  assign reset = ~SW[0];

  logic ro_22;
  counter_mod_k_ro #(.N(22)) counter_mod_k_ro_22 ( .i_clk(MAX10_CLK1_50),
                                                    .i_reset(reset),
                                                    .i_k(2_500_000),
                                                    .o_roll_over(ro_22) );

  logic ro_25;
  counter_mod_k_ro #(.N(25)) counter_mod_k_ro_25 ( .i_clk(MAX10_CLK1_50),
                                                    .i_reset(reset),
                                                    .i_k(25_000_000),
                                                    .o_roll_over(ro_25) );

  logic ro_28;
  counter_mod_k_ro #(.N(28)) counter_mod_k_ro_28 ( .i_clk(MAX10_CLK1_50),
                                                    .i_reset(reset),
                                                    .i_k(250_000_000),
                                                    .o_roll_over(ro_28) );

  clock clock_10hz( .i_roll_over(ro_22),
                    .i_reset(reset),
                    .o_clk(LEDR[5]) );

  clock clock_1hz( .i_roll_over(ro_25),
                   .i_reset(reset),
                   .o_clk(LEDR[6]) );

  clock clock_01hz( .i_roll_over(ro_28),
                    .i_reset(reset),
                    .o_clk(LEDR[7]) );

endmodule