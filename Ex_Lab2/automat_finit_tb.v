`timescale 1ns/1ps

module tb_automat_finit;

    reg clk;
    reg rst;
    reg x;
    wire out;

    automat_finit DUT (
        .clk(clk),
        .rst(rst),
        .x(x),
        .out(out)
    );

    initial begin
        $dumpfile("fsm_wave.vcd");
        $dumpvars(0, tb_automat_finit);

        clk = 0;
        rst = 1;
        x = 0;
        #5 rst = 0;

        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        #50 $finish;
    end

    always #5 clk = ~clk;

endmodule
