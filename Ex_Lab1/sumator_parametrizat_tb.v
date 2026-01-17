`timescale 1ns/1ps

module sumatorparametrizat_tb();

    parameter n = 4;

    reg [n-1:0] i1;
    reg [n-1:0] i2;

    wire [n-1:0] sum;
    wire cout;

    sumatorparametrizat #(n) uut (
        .sum(sum),
        .cout(cout),
        .i1(i1),
        .i2(i2)
    );

    initial begin
        $dumpfile("sumator_parametrizat_tb_wave.vcd");
        $dumpvars(0, sumatorparametrizat_tb);

        i1 = 4'd12; i2 = 4'd14;
        #10;
        i1 = 4'd10; i2 = 4'd9;
        #10;
        i1 = 4'd8; i2 = 4'd6;
        #10;

        $finish;
    end

endmodule
