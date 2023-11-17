module PU (input [31:0] xo,x2,x3,x4,w1,w2,w3,w4, output [31:0] af);
	wire [31:0] h1,h2,h3,h4,a1,a2; 
	
	//Level 1: Multiply
	multiply m1 (w1,xo,h1);
	multiply m2 (w2,x2,h2);
	multiply m3 (w3,x3,h3);
	multiply m4 (w4,x4,h4);

	//Level 2: ADD
	add A1(h1,h2,a1);
	add A2(h3,h4,a2);
	
	//Level 2: ADD
	add A3(a2,a1,af);
endmodule
