/**
 * 64-bit carry-lookahead adder using sixteen 4-bit CLA blocks.
 */
module cla_adder_64(
        input  wire [63:0] i_a,
                           i_b,
        input  wire        i_carry_in,
        output wire [63:0] o_s,
        output wire        o_carry_out
    );

    // Carry signals between the 4-bit blocks
    wire [15:0] l_carry;

    // Instantiate 16 CLA blocks, chaining their carry signals
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : cla_blocks
            if (i == 0) begin
                // First block: uses input carry
                cla_block_4 cla_inst(
                    .i_a        (i_a[3:0]),
                    .i_b        (i_b[3:0]),
                    .i_carry_in (i_carry_in),
                    .o_s        (o_s[3:0]),
                    .o_carry_out(l_carry[0])
                );
            end else begin
                // Subsequent blocks: chain carry from previous block
                cla_block_4 cla_inst(
                    .i_a        (i_a[4*i+3:4*i]),
                    .i_b        (i_b[4*i+3:4*i]),
                    .i_carry_in (l_carry[i-1]),
                    .o_s        (o_s[4*i+3:4*i]),
                    .o_carry_out(l_carry[i])
                );
            end
        end
    endgenerate

    // Final carry out comes from the last block
    assign o_carry_out = l_carry[15];

endmodule