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

logic 

endmodule