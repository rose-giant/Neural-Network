module block (input [31:0] x,x2,x3,x4,w1,w2,w3,w4,input mux,clk,rst,output o,output [31:0] xo);
  reg [31:0] d1;
  wire [31:0] d, dm;
  wire [31:0] f;
  wire [31:0] af,am; 
	assign dm = d1;
  //register #(32) input_reg(x, 1'b1,1'b0, clk, rst, dm);
  always @(posedge clk,negedge rst)
    if(rst)
      d1 <= 32'b0;
    else 
      d1 <= x;
	//assign dl=x;
  	//assign xo = mux ? f : d1;
  	assign d = d1;
  	mux2to1 mux_input(d,f,mux,xo);
	PU pu(xo,x2,x3,x4,w1,w2,w3,w4, af);  
  	mux2to1 #(32) mux_sign_bit(af,32'b0,af[31],am);
  	register #(32) middle_reg(am, 1'b1,1'b0, clk, rst, f);
  	assign o = |f;
endmodule


/*module block (input [31:0] x,x2,x3,x4,w1,w2,w3,w4,input mux,clk,rst,output o,output [31:0] xo);
	reg [31:0] d1;
	reg [31:0] f;
	wire [31:0] h1,h2,h3,h4,a1,a2,af,am; 
	always @(posedge clk,negedge rst)
		if(rst)
			d1 <= 32'b0;
		else 
			d1 <= x;
	assign xo = mux ? f : d1;
	multiply m1 (w1,xo,h1);
	multiply m2 (w2,x2,h2);
	multiply m3 (w3,x3,h3);
	multiply m4 (w4,x4,h4);

	
	add A1(h1,h2,a1);
	add A2(h3,h4,a2);
	add A3(a2,a1,af);
	
	assign am = af[31] ? 32'b0:af;
	always@(posedge clk ,negedge rst)
		if(rst)
			f <= 32'b0;
		else
			f <= am;

	assign o = |f;
endmodule
*/
