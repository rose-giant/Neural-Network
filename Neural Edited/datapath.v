
`include "block.v"
`include "terminator.v"

module datapath (input clk,rst,m1,m2,m3,m4,input [31:0] x1,x2,x3,x4,output done,output [31:0] out);

	wire [31:0] xo1,xo2,xo3,xo4;
	wire o1,o2,o3,o4;	
	wire [31:0] w;
	wire [31:0] epsilon = 32'b10111110010011001100110011001101;
	parameter one = 32'b00111111100000000000000000000000;
	
	//set the initial value for weight register
	register weight_reg(epsilon, 1'b1,1'b0, clk, rst, w);
	
	//cmputational blocks
	block b1(x1,xo2,xo3,xo4,one,w,w,w,m1,clk,rst,o1,xo1);
	block b2(x2,xo1,xo3,xo4,w,one,w,w,m2,clk,rst,o2,xo2);
	block b3(x3,xo1,xo2,xo4,w,w,one,w,m3,clk,rst,o3,xo3);
	block b4(x4,xo1,xo2,xo3,w,w,w,one,m4,clk,rst,o4,xo4);
	
	//checking the terrmination condition & set the ouput
	terminator t1 (x1,x2,x3,x4,o1,o2,o3,o4,done,out);


endmodule





