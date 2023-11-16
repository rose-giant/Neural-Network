`include "multiplier.v"
`include "adder.v"

module PU(input clk, rst, input [31:0]x1, x2, x3, x4, w1, w2, w3, w4, output [31:0] result);

    wire [31:0] mult_1_out, mult_2_out, mult_3_out, mult_4_out;
    wire [31:0] adder_1_out, adder_2_out;

    always @(posedge clk) begin
        multiply multiply_instance1(x1, w1, mult_1_out);
        multiply multiply_instance2(x2, w2, mult_2_out);
        multiply multiply_instance3(x3, w3, mult_3_out);
        multiply multiply_instance4(x4, w4, mult_4_out);

        add add_instance1 (mult_1_out, mult_2_out, adder_1_out);
        add add_instance2 (mult_3_out, mult_4_out, adder_2_out);

        add add_instance3 (adder_1_out, adder_2_out, result);
    end
    
endmodule