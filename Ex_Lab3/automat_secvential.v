`timescale 1ns/1ps

module automat_secvential
#(
    parameter Width = 8
)
(
    input wire clk,
    input wire rst_n,
    input wire write,
    input wire multiply,
    input wire display,
    input wire [Width-1:0] a,
    input wire [Width-1:0] b,
    output reg [2*Width-1:0] out 
);
parameter S0=2'b00,
S1=2'b01,
S2=2'b10,
S3=2'b11;


reg[1:0] state,next_state;

wire [Width-1:0] regA_out, regB_out;
wire [2*Width-1:0] regRes_out;

reg [Width-1:0] regA_in, regB_in;
reg [2*Width-1:0] regRes_in;

reg weA,weB,weRes;

register
#(Width) regA (
    .clk(clk),
    .rst_n(rst_n),
    .we(weA),
    .oe(1'b1),   
    .data_in(regA_in),
    .data_out(regA_out),
    .disp_out()
);
register
#(Width) regB (
    .clk(clk),
    .rst_n(rst_n),
    .we(weB),
    .oe(1'b1),   
    .data_in(regB_in),
    .data_out(regB_out),
    .disp_out()
);
register
#(2*Width) regRes (
    .clk(clk),
    .rst_n(rst_n),
    .we(weRes),
    .oe(1'b1),   
    .data_in(regRes_in),
    .data_out(regRes_out),
    .disp_out()
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        state <= S0;
    else
        state <= next_state;
end

always@(*) begin
    case(state)
    S0: begin
            if (write)
             next_state = S1;
            else if (multiply)
             next_state = S2;
            else if (display)
             next_state = S3;
            else
             next_state = S0;
            end
    default:next_state=S0;    
    endcase
end

always @(*) begin
        weA = 0; weB = 0; weRes = 0;
        regA_in = a;
        regB_in = b;
        regRes_in = regRes_out;

        case(state)
            S1: begin
                weA = 1;
                weB = 1;
            end
            S2: begin
                regRes_in = regA_out * regB_out;
                weRes = 1;
            end
            S3: begin
                out = regRes_out;
            end
            default: out = 0;
        endcase
    end
endmodule