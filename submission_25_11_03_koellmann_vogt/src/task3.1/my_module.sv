module my_module(
        output wire o_c,
        input wire i_a,
        input wire i_b
    );

    wire l_x;

    not gate0(l_x, i_a);
    or gate1(o_c, l_x, i_b);
endmodule