/*`define   IDLE    3'b000
`define   INIT    3'b001
`define   FETCH   3'b010
`define   MULT    3'b011
`define   ADD1     3'b100
`define   ADD2     3'b101
`define   WRITE   3'b110

module controller (input start,rst, clk,done ,output reg ready,m1,m2,m3,m4);
  
  reg [2:0] ps, ns;
  
  // Sequential part 
  always @(posedge clk) 
   begin
    if (rst)
      ps <= 3'b000;
    else
      ps <= ns;
     end 
  always @(ps or start or done)
  begin
    case (ps)
      `IDLE:  ns = start ? `INIT : `IDLE;
      `INIT:  ns = ~start ? `FETCH : `INIT;
      `FETCH:  ns = `MULT;
      `MULT:  ns = `ADD1;
      `ADD1:  ns = `ADD1;
	`ADD2:  ns = `WRITE;
      `WRITE:  ns = done ? `IDLE : `FETCH;
    endcase
  end
  
  always @(ps)
  begin
    ready = 0;
    case (ps)
      `IDLE: {ready} = 1;
      `INIT: {ready, m1,m2,m3,m4} = 5'b00000;
      `FETCH: ;
      `MULT: ;
      `ADD1: ;
       `ADD2: ;
      `WRITE: {m1,m2,m3,m4} = 4'b1111;
    endcase
  end
  
endmodule */

`define   IDLE    3'b000
`define   INIT    3'b001
`define   FETCH   3'b010
`define   MULT    3'b011
`define   ADD     3'b100
`define   WRITE   3'b101
module controller (input start,rst, clk,done ,output reg ready,m1,m2,m3,m4);
  
  reg [2:0] ps, ns;
  
  // Sequential part 
  always @(posedge clk) 
   begin
    if (rst)
      ps <= 3'b000;
    else
      ps <= ns;
     end 
  always @(ps or start or done)
  begin
    case (ps)
      `IDLE:  ns = start ? `INIT : `IDLE;
      `INIT:  ns = ~start ? `FETCH : `INIT;
      `FETCH:  ns = `MULT;
      `MULT:  ns = `ADD;
      `ADD:  ns = `WRITE;
      `WRITE:  ns = done ? `IDLE : `FETCH;
    endcase
  end
  
  always @(ps)
  begin
    ready = 0;
    case (ps)
      `IDLE: {ready} = 1;
      `INIT: {ready, m1,m2,m3,m4} = 5'b00000;
      `FETCH: ;
      `MULT: ;
      `ADD: ;
      `WRITE: {m1,m2,m3,m4} = 4'b1111;
    endcase
  end
  
endmodule 