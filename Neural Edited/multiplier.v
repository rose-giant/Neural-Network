module multiply(input [31:0] operand_1, input [31:0] operand_2, output [31:0] result);

wire prod_sign, product_round, normalised, zero_flag;

wire [8:0] exponent, sum_exponent;

wire [22:0] prod_mantis;

wire [23:0] operand_1_eq, operand_2_eq;

wire [47:0] product, product_normalised;

wire is_prod_zero, prod_overflow, prod_underflow;

assign prod_sign = operand_1[31] ^ operand_2[31];

assign is_prod_zero = (&operand_1[30:23]) | (&operand_2[30:23]);

assign operand_1_eq = (|operand_1[30:23]) ? {1'b1,operand_1[22:0]} : {1'b0,operand_1[22:0]};
assign operand_2_eq = (|operand_2[30:23]) ? {1'b1,operand_2[22:0]} : {1'b0,operand_2[22:0]};

assign product = operand_1_eq * operand_2_eq;			
assign product_round = |product_normalised[22:0];

assign normalised = product[47] ? 1'b1 : 1'b0;	

assign product_normalised = normalised ? product : product << 1;	
assign prod_mantis = product_normalised[46:24] + (product_normalised[23] & product_round); 

assign zero_flag = is_prod_zero ? 1'b0 : (prod_mantis == 23'd0) ? 1'b1 : 1'b0;

assign sum_exponent = operand_1[30:23] + operand_2[30:23];

assign exponent = sum_exponent - 8'd127 + normalised;

assign prod_overflow = ((exponent[8] & !exponent[7]) & !zero_flag) ;
assign prod_underflow = ((exponent[8] & exponent[7]) & !zero_flag) ? 1'b1 : 1'b0; 

assign result = is_prod_zero ? 32'd0 : zero_flag ? {prod_sign,31'd0} : prod_overflow ? {prod_sign,8'hFF,23'd0} : prod_underflow ? {prod_sign,31'd0} : {prod_sign,exponent[7:0],prod_mantis};

endmodule
