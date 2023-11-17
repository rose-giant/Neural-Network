/*module Toplevel #(parameter N=32)(input clk,rst,start,input [N-1:0] x1,x2,x3,x4, output[N-1:0] out, output done);

wire m1,m2,m3,m4,ready;
//wire [N-1:0] out;
datapath DP( clk,rst,m1,m2,m3,m4,  x1,x2,x3,x4, done,  out);
controller CO( start, rst,clk,done,ready,m1,m2,m3,m4);
  
endmodule*/

/*module Toplevel #(parameter N=32)(input clk,rst,start,input [N-1:0] x1,x2,x3,x4);

wire m1,m2,m3,m4,done,ready;
wire [N-1:0] out;
datapath DP( clk,rst,m1,m2,m3,m4,  x1,x2,x3,x4, done,  out);
controller CO( start, rst,clk,done,ready,m1,m2,m3,m4);
  
endmodule*/
// `include "datapath.v"
// `include "controller.v"

module Toplevel(input clk,rst,start,input [31:0] x1,x2,x3,x4, output [31:0] out, output done);

wire m1,m2,m3,m4,ready;
//wire [31:0] out;
datapath DP( clk,rst,m1,m2,m3,m4,  x1,x2,x3,x4, done,  out);
controller CO( start, rst,clk,done,ready,m1,m2,m3,m4);
  
endmodule
