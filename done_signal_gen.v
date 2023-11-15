module done_gen(input port_1, port_2, port_3, port_4, output done);

    wire res_1, res_2, res_3, res_4;
    assign res_1 = port_1 & ~port_2 & ~port_3 & ~port_4;
    assign res_2 = ~port_1 & port_2 & ~port_3 & ~port_4;
    assign res_3 = ~port_1 & ~port_2 & port_3 & ~port_4;
    assign res_4 = ~port_1 & ~port_2 & ~port_3 & port_4;

    assign done = res_1 | res_2 | res_3 | res_4;

endmodule