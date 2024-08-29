`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: QUALCOMMN 
// Engineer: pushpendra 
// 
// Create Date: 08/02/2024 10:17:56 PM
// Design Name: 
// Module Name: mult
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


module mult(a,b,out);
 input   [31:0]a,b;
 output  wire  [31:0]out;
 
 wire [7:0]exp_a,exp_b,exp_c;
 wire [23:0]m1,m2;
 wire[47:0]m;
 reg [22:0]s;// normalised value

   assign  exp_a=a[30:23];
   assign  exp_b=b[30:23];
  
   assign  exp_c= exp_a + exp_b - 127 + m[47];
  
   assign m1={1'b1,a[22:0]};
   assign m2={1'b1,b[22:0]};
   assign m= m1*m2;
  
   assign out[31]=a[31]^b[31];
   assign out[30:23]=exp_c;
   assign out[22:0]=m[47]?m[46:24]:m[45:23];
  
endmodule


 
