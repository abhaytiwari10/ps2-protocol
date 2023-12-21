`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2023 21:02:52
// Design Name: 
// Module Name: down_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module down_counter(
input ps2c,
input ce,
output [3:0] count
    );
    reg [3:0] count_out = 4'b1011;
    assign count = count_out;
    
    always @ (negedge ps2c)
    begin
    if(!ce)
    count_out <= 4'b1011;
    else
    count_out <= count_out - 1'b1;
    end
endmodule
