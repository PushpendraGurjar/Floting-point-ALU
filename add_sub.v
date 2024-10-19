`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 12:06:20 AM
// Design Name: 
// Module Name: add_sub
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


`timescale 1ns / 1ps

module add_sub(y,a,b,o);
input [31:0] a;
input [31:0] b;
input o;
output reg [31:0] y;
reg [23:0]sv;
reg [24:0]as;
reg op;
reg [4:0]n;
reg [24:0]s;
integer i;
always@(*)
begin
  op=a[31]^b[31]^o;
  s=32'b1;
                                  if(a[30:23]>b[30:23])
                                  begin
                                   sv= {1'b1,b[22:0]} >> a[30:23]-b[30:23];
                                   as =op? {1'b1,a[22:0]}-sv :{1'b1,a[22:0]}+sv;
                                   y[31]=a[31];
                                   y[30:23]=a[30:23]+1-n;
                                   y[22:0]=as[23:1]<<n;
                                  end
                                  
                                  
                                  else if(b[30:23]>a[30:23])
                                  begin
                                   sv= {1'b1,a[22:0]} >> b[30:23]-a[30:23];
                                   as =op? {1'b1,b[22:0]}-sv :{1'b1,b[22:0]}+sv;
                                   y[31]=o?~b[31]:b[31];
                                   y[30:23]=b[30:23]+1-n;
                                   y[22:0]=as[23:1]<<n;
                                  end
                                  
                                  
                                  else if(b[30:23]==a[30:23])
                                  begin
                                   if(a[22:0]>=b[22:0])
                                     begin
                                           as =op?{1'b1,a[22:0]}-{1'b1,b[22:0]}:{1'b1,a[22:0]}+{1'b1,b[22:0]};
                                           y[31]=a[31];
                                           y[30:23]=a[30:23]+1-n;
                                           y[22:0]=as[23:1]<<n;
                                     end
                                   else if(b[22:0]>a[22:0])
                                     begin
                                           as =op?{1'b1,b[22:0]}-{1'b1,a[22:0]}:{1'b1,b[22:0]}+{1'b1,a[22:0]};
                                           y[31]=o?~b[31]:b[31];
                                           y[30:23]=b[30:23]+1-n;
                                           y[22:0]=as[23:1]<<n;
                                     end
                                  end
            end
always@(*)
begin
    s=as;
    for(i=0;i<25;i=i+1)
     begin
        if(s[24-i]==1'b1)
        begin
        n=i;
        s=1'b0;
        end
     end
end
endmodule

