module decoder(input port_1, port_2, port_3, port_4,input done, output reg [1:0] num_out);
    
    reg cond;
    cond = done;
    if (cond == 1) begin
        if (port_1 == 1) begin
            
        end
    end

endmodule