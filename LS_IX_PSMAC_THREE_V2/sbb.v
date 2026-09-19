`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 11:47:42
// Design Name: 
// Module Name: sbb
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


module sbb(
input [1:0]md,
  input [1:0]mr,
  input wire sx,
  input wire sy,
  output [4:0]p
    );
    
    
    wire [2:0]x,y;
    
    
    assign x=({sx&md[1],md[1:0]});
    assign y=({sy&mr[1],mr[1:0]});
    
    
    supply1 one;
    
    wire w1,w2,w3,w4,w5,w6,w7,W8;
    assign p[0]=x[0]&y[0];
    half ha1(x[1]&y[0],x[0]&y[1],p[1],w1);
    full fa1(~(x[2]&y[0]),x[1]&y[1],w1,w2,w3);
    half ha2(~(x[0]&y[2]),w2,p[2],w4);
    xor x1(w5,one,w3,w4);
    xor x2(p[3],~(x[2]&y[1]),~(x[1]&y[2]),w5);
    assign p[4]=(x[2]^y[2])&(x[1]|x[0])&(y[1]|y[0]);
    

    
endmodule
