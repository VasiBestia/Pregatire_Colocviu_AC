`timescale 1ns/1ps

module tb_Register_if;

    reg clk;
    reg rst_n;
    reg we;
    reg oe;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire [7:0] disp_out;

    Register_if DUT (
        .clk(clk),
        .rst_n(rst_n),
        .we(we),
        .oe(oe),
        .data_in(data_in),
        .data_out(data_out),
        .disp_out(disp_out)
    );

    initial begin
        $dumpfile("register_wave.vcd");
        $dumpvars(0, tb_Register_if);

        clk = 0;
        rst_n = 0;
        we = 0;
        oe = 0;
        data_in = 8'd0;
        #10 rst_n = 1;

        data_in = 8'd15; we = 1; #10;
        we = 0; #10;

        oe = 1; #10;
        oe = 0; #10;

        data_in = 8'd100; we = 1; #10;
        we = 0; #10;

        oe = 1; #10;
        oe = 0; #10;

        rst_n = 0; #10;
        rst_n = 1; #10;

        $finish;
    end

    always #5 clk = ~clk;

endmodule
