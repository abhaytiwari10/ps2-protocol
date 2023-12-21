`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2023 21:03:25
// Design Name: 
// Module Name: sipo_9bit
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


module sipo_11bit(
input ps2c,
input ps2d,
input ce,
output [10:0] dp_reg
    );
    logic [10:0] dp = 'b0;
 always_ff @ (negedge ps2c)
 begin 
 if(!ce)
  dp <= dp;
 else
  dp <= {ps2d,dp[8:1]};
 end
 
 assign dp_reg = dp;
endmodule
