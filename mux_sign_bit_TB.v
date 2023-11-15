`include "mux_sign_bit.v"

module mux_sign_bit_TB();

    reg I0,I1,S;
    wire mux_out;
    
    mux_sign_bit mux_sign_bit_instance(I0, I1, S, mux_out);

    initial begin
        $dumpfile("muxsignbitTB.vcd");
        $dumpvars(0, mux_sign_bit_TB);

        S = 0; I0 = 0; I1 = 0;
        #10;
        I1 = 1; S = 1;
        #10;
        S = 1;I1 = 1;
        #10;
        I1 = 1; S = 1;
        #10;
        S = 0; I1 = 0;
        #10;
    end

endmodule