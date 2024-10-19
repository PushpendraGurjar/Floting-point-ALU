`timescale 1ns / 1ps

module ALU (add_sub,mul,divide,LS,GT,EQ,a,b,o);
input [31:0] a;
input [31:0] b;
input [2:0]o;
output [31:0] add_sub,mul,divide;
output LS,GT,EQ;
reg [31:0] ad,bd,am,bm,ac,bc,aas,bas;
wire [31:0]divide_dummy;
reg op;
wire valid;
always@(*)
begin
if(o==3'b000 || o==3'b001)
begin
if(o==3'b000)
begin
op = 1'b0;
end
else
begin
op = 1'b1;
end
{aas,bas}={a,b};
end
else if(o==3'b010)
{am,bm}={a,b};
else if(o==3'b011)
{ad,bd}={a,b};
else
{ac,bc}={a,b};
end

add_sub as(add_sub,aas,bas,op);
mult m1(mul,am,bm);
div d1(divide_dummy,valid,ad,bd);
assign divide = divide_dummy * valid;
compare c1(LS,GT,EQ,ac,bc,o);
endmodule

 
