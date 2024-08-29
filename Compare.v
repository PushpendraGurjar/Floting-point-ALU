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


 
module compare(a,b,y);
input [31:0] a;
input [31:0] b;
output reg y;
reg [31:0] s;
reg [31:0] t;
integer i;

  always@(*)
  begin
  s=a;
  t=b;
    if(s[31]==1'b0 && t[31]==1'b1)
    y=1;
    else if(s[31]==1'b1 && t[31]==1'b0)
    y=0;
    else
    begin
    for(i=0;i<31;i=i+1)
    begin
           if(s[30-i]==1'b1 && t[30-i]==1'b0)
             begin
                y=a[31]?0:1;
                s=0;
                t=0;
             end   
            else if(s[30-i]==1'b0 && t[30-i]==1'b1)
             begin
                y=b[31]?1:0;
                s=0;
                t=0;
             end   
        end
      end
   end
endmodule

 
