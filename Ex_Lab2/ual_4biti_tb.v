`timescale 1ns/1ps

module tb_ual_4biti;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Sel;
    wire [7:0] Y;

    ual_4biti DUT (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Y(Y)
    );

    initial begin
        $dumpfile("ual_wave.vcd");
        $dumpvars(0, tb_ual_4biti);

        A = 4'd3;  B = 4'd2;  Sel = 1'b0; #10;
        A = 4'd3;  B = 4'd2;  Sel = 1'b1; #10;

        A = 4'd5;  B = 4'd4;  Sel = 1'b0; #10;
        A = 4'd5;  B = 4'd4;  Sel = 1'b1; #10;

        A = 4'd7;  B = 4'd3;  Sel = 1'b0; #10;
        A = 4'd7;  B = 4'd3;  Sel = 1'b1; #10;

        A = 4'd15; B = 4'd15; Sel = 1'b0; #10;
        A = 4'd15; B = 4'd15; Sel = 1'b1; #10;

        $finish;
    end

endmodule
