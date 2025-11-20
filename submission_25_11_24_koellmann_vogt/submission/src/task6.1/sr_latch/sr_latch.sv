module sr_latch ( input logic i_r, i_s,
                  output logic o_q, o_qn );

    assign o_q = ~(i_r | o_qn);
    assign o_qn = ~(i_s | o_q);
endmodule