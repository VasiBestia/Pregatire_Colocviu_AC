`timescale 1ns/1ps

module sumator4biti(
    output [3:0]sum,
    output cout,
    input wire [3:0] i1,
    input wire [3:0] i2
);

assign {cout,sum}=i1+i2;

endmodule