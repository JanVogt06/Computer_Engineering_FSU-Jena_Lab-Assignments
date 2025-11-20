module register_file_4( input  logic       i_clk,
                        input  logic [1:0] i_reg_read_0,
                        input  logic [1:0] i_reg_read_1,
                        input  logic [1:0] i_reg_write,
                        input  logic [3:0] i_port_write,
                        input  logic       i_write_enable,
                        output logic [3:0] o_port_read_0,
                        output logic [3:0] o_port_read_1 );

logic [3:0] l_decoded_write;
decoder_2_4 decoder_2_4 ( .i_binary(i_reg_write), .o_one_hot(l_decoded_write));

logic l_write_enable_reg_1, l_write_enable_reg_2, l_write_enable_reg_3, l_write_enable_reg_4;
assign l_write_enable_reg_1 = l_decoded_write[0:0] & i_write_enable;
assign l_write_enable_reg_2 = l_decoded_write[1:1] & i_write_enable;
assign l_write_enable_reg_3 = l_decoded_write[2:2] & i_write_enable;
assign l_write_enable_reg_4 = l_decoded_write[3:3] & i_write_enable;

logic [3:0] l_q_1, l_q_2, l_q_3, l_q_4;
register_en_4 register_1 (.i_clk(i_clk), .i_en(l_write_enable_reg_1), .i_d(i_port_write), .o_q(l_q_1));
register_en_4 register_2 (.i_clk(i_clk), .i_en(l_write_enable_reg_2), .i_d(i_port_write), .o_q(l_q_2));
register_en_4 register_3 (.i_clk(i_clk), .i_en(l_write_enable_reg_3), .i_d(i_port_write), .o_q(l_q_3));
register_en_4 register_4 (.i_clk(i_clk), .i_en(l_write_enable_reg_4), .i_d(i_port_write), .o_q(l_q_4));

mux_4 #4 mux_read_0 (.i_in0(l_q_1), .i_in1(l_q_2), .i_in2(l_q_3), .i_in3(l_q_4), .i_s(i_reg_read_0), .o_out(o_port_read_0));
mux_4 #4 mux_read_1 (.i_in0(l_q_1), .i_in1(l_q_2), .i_in2(l_q_3), .i_in3(l_q_4), .i_s(i_reg_read_1), .o_out(o_port_read_1));

endmodule