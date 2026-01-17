`timescale 1ns/1ps

module ual_4biti (
    input  [3:0] A,
    input  [3:0] B,
    input  Sel,
    output reg [7:0] Y
);
always @(*) begin  
    case  (Sel)
        1'b1:Y=A*B;
        1'b0:Y=A+B;
        default:Y=8'b0;
    endcase
end
endmodule