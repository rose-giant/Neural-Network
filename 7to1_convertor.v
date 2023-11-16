module to1_convertor(input [31:0] port_in, output converted_out);

    assign converted_out = port_in[0] | port_in[1] | port_in[2] | port_in[3] |
    port_in[4] | port_in[5] | port_in[6] | port_in[7] | port_in[8] | port_in[9] |
    port_in[10] | port_in[11] | port_in[12] | port_in[13] | port_in[14] | port_in[15] |
    port_in[16] | port_in[17] | port_in[18] | port_in[19] | port_in[20] | port_in[21] |
    port_in[22] | port_in[23] | port_in[24] | port_in[24] | port_in[25] | port_in[26] |
    port_in[27] | port_in[28] | port_in[29] | port_in[30] | port_in[31];

endmodule