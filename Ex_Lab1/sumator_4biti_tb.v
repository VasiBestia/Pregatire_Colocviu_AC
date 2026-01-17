`timescale 1ns/1ps

module sumator4biti_tb();

    reg [3:0] i1;
    reg [3:0] i2;
     initial begin
         $dumpfile("sumator_4biti_tb_wave.vcd");
         $dumpvars(0, sumator4biti_tb);
         i1=12;
         i2=14;
         #10
         i1=10;
         i2=9;
         #10
         i1=8;
         i2=6;
     end
    wire [3:0] sum;
    wire cout;
    sumator4biti uut (
        .sum(sum),
        .cout(cout),
        .i1(i1),
        .i2(i2)
    );

endmodule