`include "done_signal_gen.v"

module done_gen_TB();

    reg port_1, port_2, port_3, port_4;
    wire done;
    
    done_gen done_gen_instance(port_1, port_2, port_3, port_4, done);

    initial begin
        $dumpfile("done_genTB.vcd");
        $dumpvars(0, done_gen_TB);

        #10;
        port_1 = 1; port_2 = 1; port_3 = 0; port_4 = 1;
        #10;
        port_1 = 1; port_2 = 1; port_3 = 0; port_4 = 1;
        #10;
        port_1 = 0; port_2 = 0; port_3 = 0; port_4 = 1;
        #10;
        port_1 = 1; port_2 = 0; port_3 = 0; port_4 = 0;
        #10;
        port_1 = 0; port_2 = 1; port_3 = 0; port_4 = 0;
        #10;
        port_1 = 1; port_2 = 0; port_3 = 1; port_4 = 1;
    end

endmodule