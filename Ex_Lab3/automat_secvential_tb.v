`timescale 1ns/1ps

module tb_automat_secvential;

    parameter Width = 8;

    reg clk;
    reg rst_n;
    reg write;
    reg multiply;
    reg display;
    reg [Width-1:0] a;
    reg [Width-1:0] b;
    wire [2*Width-1:0] out;

    automat_secvential #(Width) DUT (
        .clk(clk),
        .rst_n(rst_n),
        .write(write),
        .multiply(multiply),
        .display(display),
        .a(a),
        .b(b),
        .out(out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("automat_wave.vcd");
        $dumpvars(0, tb_automat_secvential);

        rst_n = 0;
        write = 0;
        multiply = 0;
        display = 0;
        a = 0;
        b = 0;
        #12;
        rst_n = 1;

        a = 8'd10;
        b = 8'd20;
        write = 1;
        #10;
        write = 0;
        #10;

        multiply = 1;
        #10;
        multiply = 0;
        #10;

        display = 1;
        #10;
        display = 0;
        #10;

        a = 8'd7;
        b = 8'd3;
        write = 1;
        #10;
        write = 0;
        #10;

        multiply = 1;
        #10;
        multiply = 0;
        #10;

        display = 1;
        #10;
        display = 0;
        #10;

        $finish;
    end

endmodule
