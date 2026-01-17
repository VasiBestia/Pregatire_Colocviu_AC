`timescale 1ns / 1ps

module tb_multiplicator_4biti;

    reg  [3:0] a;
    reg  [3:0] b;
    wire [7:0] prod;

    multiplicator_4biti DUT (
        .a(a),
        .b(b),
        .prod(prod)
    );

    initial begin
        $dumpfile("tb_multiplicator_4biti_wave.vcd");
        $dumpvars(0, tb_multiplicator_4biti);

        a = 4'd0;  b = 4'd0;  #10;
        a = 4'd3;  b = 4'd2;  #10;
        a = 4'd5;  b = 4'd4;  #10;
        a = 4'd7;  b = 4'd3;  #10;
        a = 4'd15; b = 4'd15; #10;

        $finish;
    end

endmodule
