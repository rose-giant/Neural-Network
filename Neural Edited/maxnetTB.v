`include "Toplevel.v"

module maxnetTB;

reg clk = 0 ,start = 0,rst = 1;
reg[31:0] x1,x2,x3,x4;
wire[31:0] out;
wire done;

Toplevel toplevel(clk,rst,start,x1,x2,x3,x4,out,done);

    initial begin

        $dumpfile("maxnetTB.vcd");
        $dumpvars(0, maxnetTB);

        clk = 0;
        #50;
        clk = !clk;
        #50 rst = 0;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        
        x1 = 32'b00111110010011001100110011001101;
        x2 = 32'b00111110110011001100110011001101;
        x3 = 32'b00111111000110011001100110011010;
        x4 = 32'b00111111010011001100110011001101;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        #50;
        clk = !clk;
        /*x1 = 32'b00111101110011001100110011001101;
        x2 = 32'b00111110100000000000000000000000;
        x4 = 32'b01000000011000000000000000000000;
        x3 = 32'b01000000101001100110011001100110;*/

        /*x1 = 32'b00111101110011001100110011001101;
        x2 = 32'b00111110100000000000000000000000;
        x4 = 32'b00111111010110011001100110011010;
        x3 = 32'b00111111011100110011001100110011;*/
        start = 1;

        #50 start = 0;
        #50;
        clk = !clk;
        #50;
        clk = !clk;

    end

endmodule
