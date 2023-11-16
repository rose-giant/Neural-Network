`include "multiplier.v"

module multiply_TB();

    reg [31:0] operand_1, operand_2;
    wire [31:0] result; 
    
    multiply fullAdder_instance(operand_1, operand_2, result);

    initial begin
        $dumpfile("multiplyTB.vcd");
        $dumpvars(0, multiply_TB);

        #10;
        operand_1 = 32'b11111111000001010100100010000;
        operand_2 = 32'b00110000110000000110000100010;
        #10;
        operand_1 = 32'b11111111000001010100100010000;
        operand_2 = 32'b10110000110000000110000100010;
        #10;
        operand_1 = 32'b11111111000001010100100010000;
        operand_2 = 32'b00110000110000000110000100010;
        #10;
    end

endmodule