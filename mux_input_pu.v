module mux_input_pu(input I0,I1,S, output reg mux_out);

always @(*) begin
   
    if(S)
        mux_out = I1;
    else
        mux_out = I0;
end
                
endmodule