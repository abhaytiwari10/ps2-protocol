`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2023 21:36:53
// Design Name: 
// Module Name: parity_check
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


module parity_check(
input parity,
input [7:0] data,
output valid
    );
    
    logic [6:0] check_p;
   always_comb begin
   check_p[0] = data[0] ^ data[1];
   check_p[1] = check_p[0] ^ data[2]; 
   check_p[2] = check_p[1] ^ data[3]; 
   check_p[3] = check_p[2] ^ data[4];
   check_p[4] = check_p[3] ^ data[5];
   check_p[5] = check_p[4] ^ data[6];
   check_p[6] = check_p[5] ^ data[7];
   end 
   
   assign valid = (parity == check_p[6]);
endmodule
