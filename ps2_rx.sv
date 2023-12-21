`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2023 20:46:44
// Design Name: 
// Module Name: ps2_rx
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


module ps2_rx(
input reset,
input ps2d,
input ps2c,
output valid,
output  logic [7:0] d_out
    );
 
 //parameter idle   = 2'b00;
 //parameter fetch  = 2'b01;
 //parameter parity =  2'b10;
 
 logic ce;
 logic [3:0] count;
 logic [10:0] dp_reg;
 logic parity;
 
 always_ff @ (negedge ps2c, posedge reset)
 begin
 if(reset)
 ce <= 1'b0;
 else
 if(count != 'b0) 
 ce <= 1'b1;
 end
 
 always_comb
 begin
 if(valid)
 d_out = dp_reg[8:1];
 else
 d_out = 8'b0;
 end
 
 down_counter DC (.ps2c(ps2c),.ce(ce),.count(count));
 sipo_11bit   DT (.ps2c(ps2c),.ps2d(ps2d),.ce(ce),.dp_reg(dp_reg));
 parity_check PC (.parity(parity),.data(dp_reg[8:1]),.valid(valid));
 
 assign parity = dp_reg[9];
endmodule
