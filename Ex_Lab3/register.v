`timescale 1ns/1ps

module register
#(
  parameter Width=8 
)(
    input  wire clk,
    input wire rst_n,
    input wire we,
    input wire oe,    
    input wire [Width-1:0]  data_in,
    output reg [Width-1:0] data_out,
    output [Width-1:0] disp_out
);
reg [Width-1:0] reg_val;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        reg_val<={Width{1'b0}};
    end
    else if(we==1'b1) 
    begin 
        reg_val<=data_in;
    end
end

always@(*)
begin
    if (oe==1'b0)
    begin
        data_out=reg_val;
    end 
    else
    begin 
         data_out={Width{1'b0}};
    end
end

assign disp_out=reg_val;

endmodule