/**
 * Top-level module of the stopwatch.
 * SW0 high: watch runs; SW0 low: watch holds and resets to zero.
 *
 * @param MAX10_CLK1_50 MAX10_CLK1_50 clock signal available in the MAX 10 FPGA.
 * @param SW bits of ten switch buttons SW9 - SW0.
 * @param LEDR output bits corresponding to the board's ten leds LEDR9 - LEDR0.
 * @param HEX0 seven segment display HEX0.
 * @param HEX1 seven segment display HEX1.
 * @param HEX2 seven segment display HEX2.
 * @param HEX3 seven segment display HEX3.
 * @param HEX4 seven segment display HEX4.
 * @param HEX5 seven segment display HEX5.
 **/
module stopwatch_de10_lite( input  logic       MAX10_CLK1_50,
                            input  logic [9:0] SW,
                            output logic [9:0] LEDR,
                            output logic [7:0] HEX0,
                            output logic [7:0] HEX1,
                            output logic [7:0] HEX2,
                            output logic [7:0] HEX3,
                            output logic [7:0] HEX4,
                            output logic [7:0] HEX5 );

  logic reset;
  assign reset = ~SW[0];

  // ==================== 10 Hz (Zehntel-Sekunden) ====================
  logic ro_10hz;
  counter_mod_k_ro #(.N(22)) counter_ro_10hz ( .i_clk(MAX10_CLK1_50),
                                                .i_reset(reset),
                                                .i_k(22'd2_500_000),
                                                .o_roll_over(ro_10hz) );

  logic clk_10hz;
  clock clock_10hz ( .i_roll_over(ro_10hz),
                     .i_reset(reset),
                     .o_clk(clk_10hz) );

  assign LEDR[5] = clk_10hz;

  logic [3:0] count_tenth;
  counter_mod_k_count #(.N(4)) counter_tenth ( .i_clk(clk_10hz),
                                                .i_reset(reset),
                                                .i_k(4'd10),
                                                .o_count(count_tenth) );

  decoder dec_hex0 ( .i_binary_number(count_tenth),
                     .o_display(HEX0[6:0]) );
  assign HEX0[7] = 1'b1;

  // ==================== 1 Hz (Sekunden) ====================
  logic ro_1hz;
  counter_mod_k_ro #(.N(25)) counter_ro_1hz ( .i_clk(MAX10_CLK1_50),
                                               .i_reset(reset),
                                               .i_k(25'd25_000_000),
                                               .o_roll_over(ro_1hz) );

  logic clk_1hz;
  clock clock_1hz ( .i_roll_over(ro_1hz),
                    .i_reset(reset),
                    .o_clk(clk_1hz) );

  assign LEDR[6] = clk_1hz;

  logic [3:0] count_sec;
  counter_mod_k_count #(.N(4)) counter_sec ( .i_clk(clk_1hz),
                                              .i_reset(reset),
                                              .i_k(4'd10),
                                              .o_count(count_sec) );

  decoder dec_hex1 ( .i_binary_number(count_sec),
                     .o_display(HEX1[6:0]) );
  assign HEX1[7] = 1'b0;  // Dezimalpunkt immer an (active low)

  // ==================== 0.1 Hz (Zehner-Sekunden) ====================
  logic ro_01hz;
  counter_mod_k_ro #(.N(28)) counter_ro_01hz ( .i_clk(MAX10_CLK1_50),
                                                .i_reset(reset),
                                                .i_k(28'd250_000_000),
                                                .o_roll_over(ro_01hz) );

  logic clk_01hz;
  clock clock_01hz ( .i_roll_over(ro_01hz),
                     .i_reset(reset),
                     .o_clk(clk_01hz) );

  assign LEDR[7] = clk_01hz;

  logic [3:0] count_tensec;
  counter_mod_k_count #(.N(4)) counter_tensec ( .i_clk(clk_01hz),
                                                 .i_reset(reset),
                                                 .i_k(4'd6),
                                                 .o_count(count_tensec) );

  decoder dec_hex2 ( .i_binary_number(count_tensec),
                     .o_display(HEX2[6:0]) );
  assign HEX2[7] = 1'b1;

  // ==================== HEX3 (Blinkender Strich) ====================
  assign HEX3[6:0] = clk_1hz ? 7'b0111111 : 7'b1111111;  // Strich oder aus
  assign HEX3[7] = 1'b1;

  // ==================== 1/60 Hz (Minuten) ====================
  logic ro_min;
  counter_mod_k_ro #(.N(31)) counter_ro_min ( .i_clk(MAX10_CLK1_50),
                                               .i_reset(reset),
                                               .i_k(31'd1_500_000_000),
                                               .o_roll_over(ro_min) );

  logic clk_min;
  clock clock_min ( .i_roll_over(ro_min),
                    .i_reset(reset),
                    .o_clk(clk_min) );

  assign LEDR[8] = clk_min;

  logic [3:0] count_min;
  counter_mod_k_count #(.N(4)) counter_min ( .i_clk(clk_min),
                                              .i_reset(reset),
                                              .i_k(4'd10),
                                              .o_count(count_min) );

  decoder dec_hex4 ( .i_binary_number(count_min),
                     .o_display(HEX4[6:0]) );
  assign HEX4[7] = 1'b1;

  // ==================== 1/600 Hz (Zehner-Minuten) ====================
  logic ro_tenmin;
  counter_mod_k_ro #(.N(34)) counter_ro_tenmin ( .i_clk(MAX10_CLK1_50),
                                                  .i_reset(reset),
                                                  .i_k(34'd15_000_000_000),
                                                  .o_roll_over(ro_tenmin) );

  logic clk_tenmin;
  clock clock_tenmin ( .i_roll_over(ro_tenmin),
                       .i_reset(reset),
                       .o_clk(clk_tenmin) );

  assign LEDR[9] = clk_tenmin;

  logic [3:0] count_tenmin;
  counter_mod_k_count #(.N(4)) counter_tenmin ( .i_clk(clk_tenmin),
                                                 .i_reset(reset),
                                                 .i_k(4'd6),
                                                 .o_count(count_tenmin) );

  decoder dec_hex5 ( .i_binary_number(count_tenmin),
                     .o_display(HEX5[6:0]) );
  assign HEX5[7] = 1'b1;

  // Unbenutzte LEDs
  assign LEDR[4:0] = 5'b00000;

endmodule
