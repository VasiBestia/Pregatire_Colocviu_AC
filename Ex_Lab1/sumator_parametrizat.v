`timescale 1ns/1ps

module sumatorparametrizat#(
  parameter n=4
)(
    output [n-1:0]sum,
    output cout,
    input wire [n-1:0] i1,
    input wire [n-1:0] i2
);

assign {cout,sum}=i1+i2;

endmodule