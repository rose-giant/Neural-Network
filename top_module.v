`include "controller.v"
`include "datapath.v"

module top(input [31:0] x1, x2, x3, x4 , 
           input clk, rst, init, start, done, write_reg,
           output [15:0] max_index);

        controller controller_instance
        (start, clk, done, write_reg, init, rst, x1, x2, x3, x4);

        datapath datapath_instance(x1, x2, x3, x4,
        rst, clk, init, start , write_reg ,
        max_index, done);

endmodule