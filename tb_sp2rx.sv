`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2023 21:55:02
// Design Name: 
// Module Name: tb_sp2rx
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


module tb_sp2rx;
logic       reset;
logic       ps2d;
logic       ps2c;
logic       valid;
logic [7:0] d_out;

ps2_rx PS (.*);

always #10 ps2c = ~ps2c;

task init;
reset  = 1'b1;
ps2d   = 1'bz;
ps2c   = 1'b0;
endtask

task d_gen;
ps2d = $urandom();
endtask

initial begin
init();
#10
reset  = 1'b0;
#10
//repeat(75) begin
//d_gen();
//#20;
//end 

ps2d = 1'b0;
#20
ps2d = 1'b1;
#20
ps2d = 1'b1;
#20
ps2d = 1'b0;
#20
ps2d = 1'b1;
#20
ps2d = 1'b0;
#20
ps2d = 1'b0;
#20
ps2d = 1'b1;
#20
ps2d = 1'b0;
#20
ps2d = 1'b0;
#20
ps2d = 1'bz;
#20
$finish();
end

//initial begin
//#1600;
//$finish();
//end

endmodule
