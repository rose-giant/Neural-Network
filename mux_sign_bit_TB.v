`include "mux_sign_bit.v"

module mux_sign_bit_TB();

    reg [31:0] I1;
    wire [31:0] mux_out;
    
    mux_sign_bit mux_sign_bit_instance(I1, mux_out);

    initial begin
        $dumpfile("muxsignbitTB.vcd");
        $dumpvars(0, mux_sign_bit_TB);

        I1 = 32'b00111110010011001100110011001101;
        #10;
        I1 = 32'b10111110010011001100110011001101;
        #10;
        I1 = 32'b00111110010011001100110011001101;
        #10;
        I1 = 32'b10111110010011001100110011001101;
        #10;
    end

endmodule