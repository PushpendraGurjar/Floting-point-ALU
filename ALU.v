`timescale 1ns / 1ps


module ALU(a,b,o,add_sub,mul,divide,z);
input [31:0] a;
input [31:0] b;
input [2:0]o;
output  [31:0] add_sub,mul,divide;
output z;
reg [31:0] ad,bd,am,bm,ac,bc,aas,bas;
always@(*)
begin
if(o==3'b000 || o==3'b001)
{aas,bas}={a,b};
else if(o==3'b010)
{am,bm}={a,b};
else if(o==3'b011)
{ad,bd}={a,b};
else
{ac,bc}={a,b};
end

add_sub as1(aas,bas,o,add_sub);
f_mult m1(am,bm,mul);
div_ie d1(ad,bd,divide);
comparator c1(ac,bc,z);
endmodule


 
