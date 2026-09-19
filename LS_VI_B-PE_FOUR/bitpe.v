`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2023 12:11:11
// Design Name: 
// Module Name: bitpe
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


module bitpe(
  input [1:0]a,
  input [1:0]b,
  input wire sa,
  input wire sb,
  output reg [4:0]p

    );
    
    wire [2:0]z1;
    wire [1:0]z2,z3,y1,y2;
    wire z4;
    wire [3:0]x1,x2,x3,z5,z6;
    wire [3:0]p1,p2;
    
    
    
    assign z1=(a[1]&b[1])<<2;
    assign z2=(a[1]&b[0])<<1;
    assign z3=(a[0]&b[1])<<1;
    assign z4=(a[0]&b[0]);
    assign y1=(~z2)+1'b1;
    assign y2=(~z3)+1'b1;
    assign x1=z1+{y1[1],y1[1],y1}+{y2[1],y2[1],y2}+z4; //signed
    assign x2=z1+z2+z3+z4; //unsigned
    assign z5=a<<2;
    assign z6=b<<2;
    assign p1=x1+z5;
    assign p2=x1+z6;
    
    
    
    
     always @(*)
    begin
      if((sa==0)&(sb==0))
      begin
      p[3:0]=x2;
      p[4]=0;
      end
      
    else if ((sa==1)&(sb==1)) 
       begin
       p[3:0]=x1;
       p[4]=1'b1&x1[3];
       end  
      
     else if ((sa==1)&(sb==0))
       begin
       p[3:0]=(b[1]==1)?(p1):(x1);
       p[4]=(b[1]==1)?(1'b1&p1[3]):(1'b1&x1[3]);
       end
       
     else
      begin
      p=(a[1]==1)?(p2):(x1);
      p[4]=(a[1]==1)?(1'b1&p2[3]):(1'b1&x1[3]);
      end
      
    end
    
   
    
    
endmodule
