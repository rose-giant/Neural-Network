`include "encoder.v"

module terminator (input [31:0] x1,x2,x3,x4,input o1,o2,o3,o4,output done,output [31:0] out);

	//logic for checking the terminatig condition
	wire [3:0] idx;
	assign idx[0]=o1&~o2&~o3&~o4;
	assign idx[1]=~o1&o2&~o3&~o4;
	assign idx[2]=~o1&~o2&o3&~o4;
	assign idx[3]=~o1&~o2&~o3&o4;
	assign done = |idx;
	
	//set max_idx output to the index of max number
	wire [1:0]max_idx;
	encoder Encoder(idx,max_idx);

	//set max num to output
	assign out = 	(idx[0] == 1)?x1 :
			(idx[1] == 1)?x2 :
			(idx[2] == 1)?x3 :
			(idx[3] == 1)?x4 :
			0;
  
endmodule