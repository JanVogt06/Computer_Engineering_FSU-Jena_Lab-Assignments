module module_with_delays (
        input  wire i_a,
                    i_b,
                    i_c,
        output wire o_d
    );

    timeunit 1ns;
    timeprecision 1ps;

    wire l_x, l_y, l_z;

    not #3 gate0(l_x, i_c);
    and #3 gate1(l_y, i_a, l_x);
    and #3 gate2(l_z, i_b, i_c);

    or #3 gate3(o_d, l_y, l_z);

endmodule