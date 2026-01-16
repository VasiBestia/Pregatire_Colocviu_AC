`timescale 1ns/1ps

module comparator_1bit (
    input wire A,
    input wire B,
    output reg less,
    output reg equal,
    output reg greater
);

   always @(*) begin
    less    = 0;
    equal   = 0;
    greater = 0;
   if (A<B)
    begin
             less = 1;
             equal = 0;
             greater = 0;
        end
        else if (A==B)
        begin
             less = 0;
             equal = 1;
             greater = 0;
        end
        else if (A>B)
        begin
             less = 0;
             equal = 0;
             greater = 1;
        end
   end
endmodule