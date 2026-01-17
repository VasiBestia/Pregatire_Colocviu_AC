`timescale 1ns/1ps

module automat_finit(
   input  clk,
   input  rst,
   input  x,
   output reg out
);
parameter S0=2'b00,
 S1=2'b01,
 S2=2'b10;  

 reg[1:0] state,next_state;

    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin 
            state<=S0;
        end
        else begin 
            state<=next_state;
        end
    end
    always@(*)
    begin
        next_state=state; 
        case (state)
        S0:if(x==1'b0)begin next_state=S0;end else begin next_state=S1; end
        S1:if(x==1'b0)begin next_state=S2;end else begin next_state=S1; end
        S2:next_state=S2;
        default:next_state=S0;
        endcase
    end

   always@(*)begin
    case (state)
            S0:out=1'b0;
            S1:out=1'b0;
            S2:out=1'b1;
            default:out=1'b0;
        endcase
   end
endmodule