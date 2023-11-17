
module add (input [31:0] operand_1, operand_2, output reg [31:0] adder_output);

reg [66:0] operand_1_fraction, operand_2_fraction, result_fraction, sum;
reg [7:0]  operand_1_exponent, operand_2_exponent, result_exponent;
reg operand_1_sign, operand_2_sign, result_sign, guard_bit, round_bit, sticky_bit;

always@(*)
  begin    

      begin
        operand_1_fraction = {2'd0,operand_1[22:0],42'd0};
        operand_2_fraction = {2'd0,operand_2[22:0],42'd0};
        operand_1_exponent = operand_1[30:23];
        operand_2_exponent = operand_2[30:23];
        operand_1_sign     = operand_1[31];
        operand_2_sign     = operand_2[31]; 

      end
      
      begin
        if(operand_1_exponent == 0)
        
          begin
            operand_1_exponent = 1;
            operand_1_fraction[65] = 0;   
          end

        else
          operand_1_fraction[65] = 1;
          
        if(operand_2_exponent == 0)
        
          begin
            operand_2_exponent = 1;
            operand_2_fraction[65] = 0;
          end

        else
          operand_2_fraction[65] = 1; 
      end
                  
      begin
          if((operand_1_exponent == 0) && (operand_1_fraction == 0))

            begin
              result_sign     = operand_2_sign;
              result_exponent = operand_2_exponent;
              result_fraction = operand_2_fraction;
            end

          else if((operand_2_exponent == 0) && (operand_2_fraction == 0))

            begin
              result_sign     = operand_1_sign;
              result_exponent = operand_1_exponent;
              result_fraction = operand_1_fraction;
            end 
      end
      
      begin

        if(operand_1_exponent > operand_2_exponent)

          begin
              operand_2_fraction = operand_2_fraction >> (operand_1_exponent - operand_2_exponent);
              result_exponent = operand_1_exponent;
          end

        else if(operand_1_exponent < operand_2_exponent)

          begin
              operand_1_fraction = operand_1_fraction >> (operand_2_exponent - operand_1_exponent);
              result_exponent = operand_2_exponent;
          end

        else

          begin
                result_exponent = operand_1_exponent;  
          end

      end
            
      begin
          if(operand_1_sign == operand_2_sign)
          
            begin
              result_fraction = operand_1_fraction + operand_2_fraction;
              result_sign = operand_1_sign;
            end

          else 
          
          begin
            
            if(operand_1_fraction >= operand_2_fraction)
            
              begin
                result_fraction = operand_1_fraction - operand_2_fraction;
                result_sign = operand_1_sign;
              end

            else 
            
              begin
                result_fraction = operand_2_fraction - operand_1_fraction;
                result_sign = operand_2_sign;
              end
          end
          
      end
      sum = result_fraction; 
     
      begin

        if(result_fraction[66])
        
          begin
            result_fraction = result_fraction >> 1;
            result_exponent = result_exponent + 1;                   
          end

      end
      
      begin

        if(result_fraction[66])
        
          begin
            result_fraction = result_fraction >> 1;
            result_exponent = result_exponent + 1;                
          end
        
        if(result_fraction[65] == 0)
        
          begin

            while((result_fraction[65] == 0) && (result_fraction[64:42] > 0))
            
              begin
                result_fraction = result_fraction << 1;
                result_exponent = result_exponent - 1;            
              end

          end

      end         

      begin
        guard_bit = result_fraction[41]; 
        round_bit = result_fraction[40];

        if(result_fraction[39:0] > 0)
          sticky_bit = 1;

        else
          sticky_bit = 0;  
                         
        if(guard_bit && (result_fraction[42] | round_bit | sticky_bit))
        
          begin
            result_fraction = result_fraction + 67'b0000000000000000000000001000000000000000000000000000000000000000000;
          end
      end
      
      begin
         adder_output[22:0]  = result_fraction[64:42];
         adder_output[30:23] = result_exponent[7:0];
         adder_output[31]    = result_sign;

         if(result_fraction == 0) 
           adder_output = 0;
                    
         if(result_exponent == 8'b11111111)
           result_fraction = 0;
           adder_output[22:0]  = result_fraction[64:42];
      end   
        
  end
  
endmodule