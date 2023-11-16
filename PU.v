`include "multiplier.v"
`include "adder.v"

module PU(input clk, rst, input [31:0]x1, x2, x3, x4, output [31:0] pu_1_out, pu_2_out, pu_3_out, pu_4_out);

    wire [31:0] mult_1_out, mult_2_out, mult_3_out, mult_4_out;
    wire [31:0] adder_1_out, adder_2_out, adder_3_out, adder_4_out,
                adder_5_out, adder_6_out, adder_7_out, adder_8_out;
    
    reg [31:0] epsilon = 32'b00111110010011001100110011001101;
  
    add add1_1(x2, x3, adder_1_out);
    add add2_1(adder_1_out, x4, adder_2_out);
    multiply multiply1_1(adder_2_out, epsilon, mult_1_out);
    add add3_1(mult_1_out, x1, pu_1_out);

    add add1_2(x1, x3, adder_3_out);
    add add2_2(adder_3_out, x4, adder_4_out);
    multiply multiply1_2(adder_4_out, epsilon, mult_2_out);
    add add3_2(mult_2_out, x2, pu_2_out);

    add add1_3(x1, x2, adder_5_out);
    add add2_3(adder_5_out, x4, adder_6_out);
    multiply multiply1_3(adder_6_out, epsilon, mult_3_out);
    add add3_3(mult_3_out, x3, pu_3_out);

    add add1_4(x1, x2, adder_7_out);
    add add2_4(adder_7_out, x3, adder_8_out);
    multiply multiply1_4(adder_8_out, epsilon, mult_4_out);
    add add3_4(mult_4_out, x4, pu_4_out);

endmodule