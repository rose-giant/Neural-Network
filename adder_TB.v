`include "adder.v"

module add_TB();

    reg [31:0] operand_1, operand_2;
    wire [31:0] result; 
    
    add fullAdder_instance(operand_1, operand_2, result);

    initial begin
        $dumpfile("addTB.vcd");
        $dumpvars(0, add_TB);

        #10;
        operand_1 = 32'b10000000000000000000000010000;
        operand_2 = 32'b00000000000000000000000000010;
        #10;
        operand_1 = 32'b10000000000000000000000010000;
        operand_2 = 32'b10000000000000000000000000010;
        #10;
        operand_1 = 32'b00000000000000000000000010000;
        operand_2 = 32'b00000000000000000000000000010;
        #10;
    end

endmodule