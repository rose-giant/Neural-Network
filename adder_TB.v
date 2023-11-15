`include "adder.v"

module adder_TB();

    reg [7:0] operand_1, operand_2;
    wire [7:0] result; 
    wire co;
    
    fulladder fullAdder_instance(operand_1, operand_2, co, result);

    initial begin
        $dumpfile("adderTB.vcd");
        $dumpvars(0, adder_TB);

        #10
        operand_1 = 2;
        operand_2 = 3;
        #10;
        operand_1 = 12;
        operand_2 = 3;
        #10;
        operand_1 = 0;
        operand_2 = 1;
        #10;
        
    end

endmodule