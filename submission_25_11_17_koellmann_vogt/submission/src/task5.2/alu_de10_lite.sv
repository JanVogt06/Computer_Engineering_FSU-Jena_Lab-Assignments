/**
 * Top-level module of the basic alu.
 * The alu operates on the 4-bit binary numbers in SW[3:0] and SW[7:4].
 * The two input numbers are shown on displays HEX0 and HEX1.
 * The control signal is shown using LEDR1 and LEDR0.
 * The result is shown on display HEX2.
 * The carry out is shown via LEDR7.
 *
 * @param SW bits of ten switch buttons SW9 - SW0.
 * @param LEDR output bits corresponding to the board's ten leds LEDR9 - LEDR0.
 * @param HEX0 output bits which drive the seven-segment display HEX0.
 * @param HEX1 output bits which drive the seven-segment display HEX1.
 * @param HEX2 output bits which drive the seven-segment display HEX2.
 **/
module alu_de10_lite( 
    input  logic [9:0] SW,
    output logic [9:0] LEDR,
    output logic [6:0] HEX0,
    output logic [6:0] HEX1,
    output logic [6:0] HEX2 
);
    logic [1:0] l_alu_ctrl;
    logic [3:0] l_a;
    logic [3:0] l_b;
    logic [3:0] l_result;
    logic       l_carry_out;

    assign l_alu_ctrl = SW[9:8];
    assign l_a        = SW[3:0];
    assign l_b        = SW[7:4];

    alu #(.N(4)) alu_4( 
        .i_a        (l_a),
        .i_b        (l_b),
        .i_alu_ctrl (l_alu_ctrl),
        .o_result   (l_result),
        .o_carry_out(l_carry_out)
    );

    decoder decoder_hex0( 
        .i_binary_number    (l_a),
        .o_display(HEX0)
    );

    decoder decoder_hex1( 
        .i_binary_number    (l_b),
        .o_display(HEX1)
    );

    decoder decoder_hex2( 
        .i_binary_number    (l_result),
        .o_display(HEX2)
    );

    // Wire LEDs
    assign LEDR[0]   = l_alu_ctrl[0];  // Control bit 0
    assign LEDR[1]   = l_alu_ctrl[1];  // Control bit 1
    assign LEDR[6:2] = 5'b0;           // Unused LEDs
    assign LEDR[7]   = l_carry_out;    // Carry out
    assign LEDR[9:8] = 2'b0;           // Unused LEDs

endmodule