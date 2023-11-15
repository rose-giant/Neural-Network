module fulladder (input [7:0] a, input [7:0] b, output reg c_out, output reg [7:0] sum);  
  
    always @ (a or b) begin  
        {c_out, sum} = a + b;  
    end
    
endmodule  