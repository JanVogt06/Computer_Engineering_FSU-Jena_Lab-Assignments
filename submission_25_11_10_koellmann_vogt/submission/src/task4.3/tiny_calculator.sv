/**
 * Top-level entry of the tiny calculator.
 * The calculator adds the 4-bit binary numbers in SW[3:0] and SW[7:4].
 * The two inputs are shown on displays HEX0 and HEX1.
 * The result of the addition is shown on displays HEX2 and HEX3.
 *
 * @param SW bits of switches SW7, SW6, SW5, SW4, SW3, SW2, SW1 and SW0.
 * @param HEX0 output bits which drive the seven-segment display HEX0.
 * @param HEX1 output bits which drive the seven-segment display HEX1.
 * @param HEX2 output bits which drive the seven-segment display HEX2.
 * @param HEX3 output bits which drive the seven-segment display HEX3.
 **/
module tiny_calculator( input  logic [7:0] SW,
                        output logic [6:0] HEX0,
                        output logic [6:0] HEX1,
                        output logic [6:0] HEX2,
                        output logic [6:0] HEX3 );

    // Zwischensignale
    logic [3:0] l_sum;
    logic       l_carry_out;

    // Decoder für erste Eingabe (SW[3:0] -> HEX0)
    decoder_de10_lite decoder_hex0( .SW( SW[3:0] ),
                                    .HEX0( HEX0 ) );

    // Decoder für zweite Eingabe (SW[7:4] -> HEX1)
    decoder_de10_lite decoder_hex1( .SW( SW[7:4] ),
                                    .HEX0( HEX1 ) );

    // 4-Bit Ripple-Carry Adder
    ripple_carry_adder_4 adder( .i_a( SW[3:0] ),
                                .i_b( SW[7:4] ),
                                .i_carry_in( 1'b0 ),
                                .o_s( l_sum ),
                                .o_carry_out( l_carry_out ) );

    // Decoder für untere 4 Bits des Ergebnisses (l_sum -> HEX2)
    decoder_de10_lite decoder_hex2( .SW( l_sum ),
                                    .HEX0( HEX2 ) );

    // Carry-Out auf 4 Bit erweitern
    logic [3:0] l_carry_out_4;
    assign l_carry_out_4[3:1] = 3'b000;
    assign l_carry_out_4[0] = l_carry_out;

    // Decoder für Carry-Out (erweitert auf 4 Bit -> HEX3)
    decoder_de10_lite decoder_hex3( .SW( l_carry_out_4 ),
                                    .HEX0( HEX3 ) );
endmodule