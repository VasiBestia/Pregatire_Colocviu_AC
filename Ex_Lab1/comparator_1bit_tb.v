`timescale 1ns/1ps


module comparator_1bit_tb();

reg A, B;
wire less, equal, greater;

initial 
begin
    $dumpfile("comparator_1bit_tb_wave.vcd");
    $dumpvars(0, comparator_1bit_tb);
    A=1;B=0;
    #10;
    A=0;B=1;
    #10;
    A=1;B=1;
    #10; 
end

comparator_1bit uut (
    .A(A),
    .B(B),
    .less(less),
    .equal(equal),
    .greater(greater)
);
endmodule
