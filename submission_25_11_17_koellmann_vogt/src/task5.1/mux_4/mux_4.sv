module mux_4 #(parameter N=64) ( 
    input  logic [N-1:0] i_in0,
                         i_in1,
                         i_in2,
                         i_in3,
    input  logic [1:0]   i_s,
    output logic [N-1:0] o_out 
);
    logic [N-1:0] l_mux_low, l_mux_high;
    
    // Erste Stufe: wählt zwischen in0/in1 und in2/in3
    mux_2 #(N) mux_low (
        .i_in0(i_in0),
        .i_in1(i_in1),
        .i_s  (i_s[0]),
        .o_out(l_mux_low)
    );
    
    mux_2 #(N) mux_high (
        .i_in0(i_in2),
        .i_in1(i_in3),
        .i_s  (i_s[0]),
        .o_out(l_mux_high)
    );
    
    // Zweite Stufe: wählt zwischen den Ergebnissen
    mux_2 #(N) mux_final (
        .i_in0(l_mux_low),
        .i_in1(l_mux_high),
        .i_s  (i_s[1]),
        .o_out(o_out)
    );
endmodule