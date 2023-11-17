module mux2to1 #(parameter N = 32)(input[N-1:0] I0,I1,input select, output reg[N-1:0] mux_out);

	assign mux_out=select?I1:I0;
                
endmodule