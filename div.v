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
 
module div(a_in,b_in,o,c_out);
parameter m = 8, n = 23;
input [m+n:0] a_in, b_in;
input [1:0]o;
output [m+n:0] c_out;
wire sign, is_zero;
wire [m-1:0] exp, exp_c, shift_index;
wire [n:0] mant, div, shifted;

assign sign = a_in[m+n] ^ b_in[m+n];
assign exp_c = a_in[m+n-1:n] - b_in[m+n-1:n] + {(m-1){1'b1}} + (n-5);

div_q div_inst({1'b1,a_in[n-1:0],{5{1'b0}}}, {1'b1,b_in[n-1:0]}, div);

assign is_zero = (a_in[m+n-1:0] == 'b0) ;
mantshift mant_shifter(div, shifted, shift_index );
assign exp = exp_c - shift_index;
assign mant = shifted;
assign c_out = is_zero ? 'b0 : {sign,exp,mant[n-1:0]};
endmodule


module div_q(a, b, c );
parameter n=23;
input [2*n:0] a;
input [n:0] b;
output [5:0] c;
reg [2*n:0] a1;
reg [n:0] b1;
reg [5:0] i, p1;
always@(a,b) begin
a1 = a; b1 = b; p1 = 'b0;
for(i=1;i<63;i=i+1) begin
if (a1 >= i*b1) p1 = i;
end
end
assign c = p1;
endmodule
module mantshift(mant, shifted, shift_index );
parameter m = 8, n = 23;
input [n:0] mant;
output reg [m-1:0] shift_index;
output reg [n:0] shifted;
reg [n:0] target;
reg [$clog2(n)-1:0] cnt;
always@(mant) begin target = mant;
shift_index = 'b0;
for(cnt = 0; cnt < n+1; cnt = cnt + 1)begin
if (target[cnt]) shift_index = n - cnt;
end
shifted = mant << shift_index; 
end
endmodule

