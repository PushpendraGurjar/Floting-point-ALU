`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 11:57:34 PM
// Design Name: 
// Module Name: Compare
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


 
 
module compare(LS,GT,EQ,A,B,cont);
input [31:0]A,B;
input [2:0]cont;
output LS,GT,EQ;
 
wire [31:0] res;
add_sub AS(res,A,B,1'b1);//res=A-B
assign out = cont[2]&&(~cont[1])&&(~cont[0]);// control signal to activate result
assign LS = ((res[22:0]!=0 && res[31] ==1'b1) ? 1'b1: 1'b0)&& out;
assign GT = ((res[22:0]!=0 && res[31] ==1'b0)? 1'b1: 1'b0)&& out;
assign EQ = (res[22:0]==0 ? 1'b1: 1'b0) && out;
 
endmodule