module add (
input [31:0] src1,src2,
output reg [31:0] out
);



reg [66:0] fraction_1;
reg [66:0] fraction_2;
reg [66:0] sum;
reg [66:0] fraction_Ans;
reg [7:0]  exponent_1;
reg [7:0]  exponent_2;
reg [7:0]  exponent_Ans;
reg sign_1;
reg sign_2;
reg sign_Ans;
reg guard_bit;
reg round_bit;
reg sticky_bit;


always@(*)
  begin    

      begin
        fraction_1 = {2'd0,src1[22:0],42'd0};
        fraction_2 = {2'd0,src2[22:0],42'd0};
        exponent_1 = src1[30:23];
        exponent_2 = src2[30:23];
        sign_1     = src1[31];
        sign_2     = src2[31]; 

      end
      
      begin
        if(exponent_1 == 0)begin
          exponent_1 = 1;
          fraction_1[65] = 0;   
        end
        else
          fraction_1[65] = 1;
          
        if(exponent_2 == 0)begin
          exponent_2 = 1;
          fraction_2[65] = 0;
        end
        else
          fraction_2[65] = 1; 
      end
                  
      begin
          if((exponent_1 == 0) && (fraction_1 == 0))
            begin
              sign_Ans     = sign_2;
              exponent_Ans = exponent_2;
              fraction_Ans = fraction_2;
            end
          else if((exponent_2 == 0) && (fraction_2 == 0))
            begin
              sign_Ans     = sign_1;
              exponent_Ans = exponent_1;
              fraction_Ans = fraction_1;
            end 
            
      end
      
      begin
        if(exponent_1 > exponent_2)
          begin
              fraction_2 = fraction_2 >> (exponent_1 - exponent_2);
              exponent_Ans = exponent_1;
          end
        else if(exponent_1 < exponent_2)
          begin
              fraction_1 = fraction_1 >> (exponent_2 - exponent_1);
              exponent_Ans = exponent_2;
          end
        else begin
              exponent_Ans = exponent_1;  
        end
      end
            
      begin
          if(sign_1 == sign_2)begin
            fraction_Ans = fraction_1 + fraction_2;
            sign_Ans = sign_1;
          end
          else begin
            if(fraction_1 >= fraction_2)begin
              fraction_Ans = fraction_1 - fraction_2;
              sign_Ans = sign_1;
            end
            else begin
              fraction_Ans = fraction_2 - fraction_1;
              sign_Ans = sign_2;
            end
          end
          
      end
      sum = fraction_Ans; 
     
      
      begin
        if(fraction_Ans[66])begin
          fraction_Ans = fraction_Ans >> 1;
          exponent_Ans = exponent_Ans + 1;                   
        end
      end
      
      begin
        if(fraction_Ans[66])begin
          fraction_Ans = fraction_Ans >> 1;
          exponent_Ans = exponent_Ans + 1;                
        end 
        if(fraction_Ans[65])begin
        end
        else if(fraction_Ans[65] == 0)begin
          while((fraction_Ans[65] == 0) && (fraction_Ans[64:42] > 0))begin
            fraction_Ans = fraction_Ans << 1;
            exponent_Ans = exponent_Ans - 1;            
          end
        end
      end         

      begin
        guard_bit = fraction_Ans[41]; 
        round_bit = fraction_Ans[40];
        if(fraction_Ans[39:0] > 0)
          sticky_bit = 1;  
        else
          sticky_bit = 0;  
                         
        if(guard_bit && (fraction_Ans[42] | round_bit | sticky_bit))begin
          fraction_Ans = fraction_Ans + 67'b0000000000000000000000001000000000000000000000000000000000000000000;
        end
      end
      
      begin
         out[22:0]  = fraction_Ans[64:42];
         out[30:23] = exponent_Ans[7:0];
         out[31]    = sign_Ans; 
         if(fraction_Ans == 0) 
           out = 0;           
         if(exponent_Ans == 8'b11111111)
           fraction_Ans = 0;
           out[22:0]  = fraction_Ans[64:42];
      end   
        
  end
  
endmodule