`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Qualcommn
// Engineer: Pushpendra gurjar
// 
// Create Date: 08/02/2024 11:18:34 PM
// Design Name: 
// Module Name: main
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


module main();

//reg  [31:0]a,b;
//reg o;
//wire  [31:0]y;
//wire valid;
 
// div my(y,valid,a,b);
    
//  initial
//  begin   
//  #0
////  o=1;
//  a =  32'h40a00000 ;
//  b =  32'h40c00000 ;
//  #20
//  a =  32'h40a00000;
//  b =  32'h41580000;
//  #20
//  a =  32'h41580000;
//  b =  32'h40a00000;
//  #20
//  a =  32'h41480000;
//  b =  32'h41580000 ;
  
//  #20
//  a=32'h40200000;
//  b=32'h41580000 ; 
  
//  #20
//  a =  32'h41bc0000;
//  b =  32'h41480000 ;
  
  
//  #20
//  a=32'hc1b40000;
//  b =32'hc1580000 ;
  
//  #20
//  a =  32'hc0200000;
//  b =  32'hc1b40000 ;
   
//  #50 $finish;
//  end 
//  endmodule
 
reg [31:0]A,B;
wire [31:0]add_sub,mul,divide;
wire LS,GT,EQ;
reg [2:0] Oper;
ALU Main(add_sub,mul,divide,LS,GT,EQ,A,B,Oper);
initial
begin
#0
//A = 32'b01000001010011100011110101110001; //12.89
//B = 32'b01000010110001010010010111100011; //98.574
A=32'h40c00000;
B=32'h40c00000;
    Oper = 3'b001;
    
#10 Oper = 3'b001;

#10 Oper = 3'b010;

#10 Oper = 3'b011;

#10 Oper = 3'b100;
end
endmodule
