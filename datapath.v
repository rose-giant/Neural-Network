`include "PU.v"
`include "register.v"
`include "7to1_convertor.v"
`include "mux_sign_bit.v"
`include "done_signal_gen.v"
//`include "decoder.v"

module datapath(input [31:0] x1, x2, x3, x4, 
        input rst, clk, init, start , write_reg,
        output reg [15:0] max_index,
        output done);

        wire [31:0] pu_1_out, pu_2_out, pu_3_out, pu_4_out;
        wire pu_1_to_1, pu_2_to_1, pu_3_to_1, pu_4_to_1;
        wire [31:0] reg_1, reg_2, reg_3, reg_4;
        wire converted1_1, converted1_2, converted1_3, converted1_4;
        wire [31:0] after_mux_sign_1, after_mux_sign_2, after_mux_sign_3, after_mux_sign_4;

        PU PU_instance(clk, rst, x1, x2, x3, x4, pu_1_out, pu_2_out, pu_3_out, pu_4_out);

        register register_1(rst, clk, pu_1_out, reg_1);
        register register_2(rst, clk, pu_2_out, reg_2);
        register register_3(rst, clk, pu_3_out, reg_3);
        register register_4(rst, clk, pu_4_out, reg_4);

        mux_sign_bit mux_sign_bit_1(reg_1, after_mux_sign_1);
        mux_sign_bit mux_sign_bit_2(reg_2, after_mux_sign_2);
        mux_sign_bit mux_sign_bit_3(reg_3, after_mux_sign_3);
        mux_sign_bit mux_sign_bit_4(reg_4, after_mux_sign_4);

        to1_convertor to1_convertor_1(after_mux_sign_1, converted1_1);
        to1_convertor to1_convertor_2(after_mux_sign_2, converted1_2);
        to1_convertor to1_convertor_3(after_mux_sign_3, converted1_3);
        to1_convertor to1_convertor_4(after_mux_sign_4, converted1_4);

        done_gen done_gen_instance(converted1_1, converted1_2, converted1_3, converted1_4, done);
        //if (done) 
                //decoder instanciation
endmodule