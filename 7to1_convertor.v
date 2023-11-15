module to1_convertor(input [6:0] port_in, output converted_out);

    assign converted_out = port_in[0] | port_in[1] | port_in[2] | port_in[3] |
    port_in[4] | port_in[5] | port_in[6];

endmodule