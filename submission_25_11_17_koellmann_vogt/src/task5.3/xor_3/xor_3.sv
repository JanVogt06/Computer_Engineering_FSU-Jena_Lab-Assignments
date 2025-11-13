module xor_3 ( 
    input  logic i_in0,
                 i_in1,
                 i_in2,
    output logic o_res 
);
    assign o_res = i_in0 ^ i_in1 ^ i_in2;
endmodule