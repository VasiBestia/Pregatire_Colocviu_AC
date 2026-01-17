`timescale 1ns/1ps

module multiplicator_4biti(
    output reg [7:0] prod,
    input wire [3:0] a,
    input wire [3:0] b
);
   integer i;
  always @(*) begin
  prod=8'b0;  
  for(i=0;i<4;i=i+1)
        begin    
            if (b[i]==1'b1)
            begin
                prod=prod+(a<<i);
            end 
        end
  end

endmodule