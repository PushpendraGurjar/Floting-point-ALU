`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2024 11:57:34 PM
// Design Name: 
// Module Name: div
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
 
module div(Res,valid,A,B);
input [31:0]A,B;
output [31:0]Res;
reg Sa,Sb,Sc;
reg [22:0]Ma,Mb,Mc;
reg [7:0]Ea,Eb,Ec;
output valid;
reg vali;
reg [31:0] A_dummy,B_dummy;
wire [31:0]mul_out1,add_out1,D_1,D_2,D_3,D_4,D_5,D_6,Y_1;
always @(A,B)
begin
Sa = A[31];
Sb = B[31];
Ma = A[22:0];
Mb = B[22:0];
Ea = A[30:23];
Eb = B[30:23];
Sc = Sa ^ Sb;
Ec = Ea - Eb + 8'd126;
A_dummy = {Sa,Ec,Ma};

B_dummy = {1'b0,8'd126,Mb};
if(Ma != 0 && Mb != 0)
begin
vali = 1'b1;
end
else
vali = 1'b0;
end
// ((-37)/17)*D
 mult INIT(mul_out1,32'hC00B4B4B,B_dummy);
// X0 = 48/17 + (((-37)/17)*D)
add_sub Add1(add_out1,mul_out1,32'h4034B4B5,1'b0);
// Xi+1 = Xi(2 -(D*Xi)) -- 6_times
FP_ITER ITER1(D_1,add_out1,B_dummy);
FP_ITER ITER2(D_2,B_dummy,D_1);
FP_ITER ITER3(D_3,B_dummy,D_2);

FP_ITER ITER4(D_4,B_dummy,D_3);
FP_ITER ITER5(D_5,B_dummy,D_4);
FP_ITER ITER6(D_6,B_dummy,D_5);
 mult FIN(Y_1,D_6,A_dummy);

assign valid = vali;
assign Res = {Sc,Y_1[30:0]};
endmodule

module FP_ITER(Y,A,B);
input [31:0]A,B;
output [31:0]Y;
wire [31:0] mul_out,add_out,res;
// D*xi
 mult MUL(mul_out,A,B);
//2-(D*Xi)
add_sub sub(add_out,32'h4000_0000,mul_out,1'b1);
//Xi+1=Xi(2-(D*Xi))
 mult MUL1(res,add_out,B);
assign Y = res;
endmodule

