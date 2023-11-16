`define   IDLE    3'b000
`define   INIT    3'b001
`define   FETCH   3'b010
`define   MULT    3'b011
`define   ADD1     3'b100
`define   ADD2     3'b110
`define   WRITE   3'b101

module controller(input start, clk, done, output reg write_reg, init, rst,
                  output reg [31:0] x1, x2, x3, x4);

    reg [2:0] ps, ns;

    always @(posedge clk) begin
        if(rst == 1)
            ps <= 3'b000;
        else
            ps <= ns;
    end

    always @(clk or ps) begin
        case (ps)
            `IDLE: ns = start ? `INIT : `IDLE;
            `INIT: begin
                ns = ~start ? `FETCH : `INIT;
                init = 1;
            end

            `FETCH: ns = `MULT;
            `MULT: ns = `ADD1;
            `ADD1: ns = `ADD2;
            `ADD1: ns = `WRITE;
            `WRITE: begin
                write_reg = 1;
                ns = done ? `IDLE : `FETCH;
            end
            default:
                ns = `INIT;
        endcase
    end

    always @(ps) begin
        
        case (ps)
        `IDLE: {rst} = 1;
        `INIT: begin
            init = 1;
            x1 = 32'b00000000000000000000000000000001;
            x2 = 32'b00000000000000000000000000000001;
            x3 = 32'b00000000000000000000000000000001;
            x4 = 32'b00000000000000000000000000000001;
        end
        `WRITE: begin
            x1 = 32'b00000000000000000000000000000001;
            x2 = 32'b00000000000000000000000000000001;
            x3 = 32'b00000000000000000000000000000001;
            x4 = 32'b00000000000000000000000000000001;
        end
        endcase
    end

endmodule