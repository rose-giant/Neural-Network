`include "7to1_convertor.v"

module to1_convertor_TB();

    reg [6:0]port_in;
    wire converted_out;
    
    to1_convertor to1_convertor_instance(port_in, converted_out);

    initial begin
        $dumpfile("to1_convertorTB.vcd");
        $dumpvars(0, to1_convertor_TB);

        #10;
        port_in = 7'b1000110;
        #10;
        port_in = 7'b1100110;
        #10;
        port_in = 7'b0000000;
        #10;
    end

endmodule