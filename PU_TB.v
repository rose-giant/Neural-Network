`include "PU.v"

module PU_TB();

    reg [31:0] x1, x2, x3, x4;
    reg clk, rst;
    wire [31:0] pu_1_out, pu_2_out, pu_3_out, pu_4_out; 
    
    PU PU_instance(clk, rst, x1, x2, x3, x4, pu_1_out, pu_2_out, pu_3_out, pu_4_out);

    initial begin
        $dumpfile("PU_TB.vcd");
        $dumpvars(0, PU_TB);

        #10;
        x1 = 32'b00111111100000000000000000000000;
        x2 = 32'b00111111100000000000000000000000;
        x3 = 32'b00111111100000000000000000000000;
        x4 = 32'b00111111100000000000000000000000;
        #10;

    end

endmodule