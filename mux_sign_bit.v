module mux_sign_bit(input I0,I1,S, output reg mux_out);

always @(*) begin
   
    if(S)
        mux_out = I1;
    else
        mux_out = I0;
end
                
endmodule