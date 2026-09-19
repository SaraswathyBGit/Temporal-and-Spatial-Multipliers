`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2023 19:38:06
// Design Name: 
// Module Name: bpe
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


module bpe(

  input [1:0]a,
  input [1:0]b,
  input wire sa,
  input wire sb,
  output reg [3:0]p
    );
    
    wire w0,w1,w2,w3,w4,w5,w6,w7;
    wire [3:0]z1;
    
    assign w0=a[0]&b[0];
    ha ha1((a[0]&b[1]),(a[1]&b[0]),w1,w2);
    ha ha2((a[1]&b[1]),w2,w3,w4);
    fa fa1((a[1]&b[0]),(a[1]&b[1]),w3,w5,w6);
    assign w7=(a[1]&b[0])^(a[1]&b[1]^w6);
    assign z1=a<<2;
    
    always @(*)
    begin
      if((sa==0)&(sb==0))
      begin
       p[0]=w0;
       p[1]=w1;
       p[2]=w3;
       p[3]=w4;
      end
    else if ((sa==1)&(sb==1)) 
      begin
       p[0]=w0;
       p[1]=w1;
       p[2]=w5;
       p[3]=w7;     
      end
     else if ((sa^sb)==1)
     p=(b[1]==1)?({w7,w5,w1,w0}+z1):({w7,w5,w1,w0});
     else
     p=0;
      
    end
    
    

    
endmodule

