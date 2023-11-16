module mux_sign_bit(input [31:0] I1, output reg [31:0]mux_out);

    reg [31:0] I0 = 32'b00000000000000000000000000000000;
   
    always @(*) begin

        if(!I1[31])
            mux_out = I1;
        else
            mux_out = I0;
    end

endmodule