`include "register.v"

module register_TB();

    reg reset, CLK;
    reg [7:0] D;
    wire [7:0] Q;

    register register_instance(reset, CLK, D, Q);

    initial begin
        $dumpfile("registerTB.vcd");
        $dumpvars(0, register_TB);

        CLK = 0;
        reset = 0;
        D = 0;
        #10;
        CLK = !CLK;
        D = 1;
        #10;
        CLK = !CLK;
        D = 1;
        #10;
        CLK = !CLK;
        D = 0;
        #10;
        CLK = !CLK;
        D = 10;
        #10;
        CLK = !CLK;
        D = 1;
        #10;
        CLK = !CLK;
        D = 1;
        #10;
        reset = 1;
        CLK = !CLK;
        D = 2;
        #10;
        CLK = !CLK;
        D = 4;
        #10;
        CLK = !CLK;
    end

endmodule