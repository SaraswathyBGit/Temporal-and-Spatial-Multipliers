`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2023 10:08:38
// Design Name: 
// Module Name: ssbb
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


module bb(

  input [1:0]md,
  input [1:0]mr,
  input sx,
  input sy,
  output [5:0]p
    );
    
    wire sx,sy;
    wire [2:0]x,y;
    supply1 one;
    
    assign x=({sx&md[1],md[1:0]});
    assign y=({sy&mr[1],mr[1:0]});
    
    
    
    
    wire w1,w2,w3,w4,w5,w6,w7;
    assign p[0]=x[0]&y[0];
    half ha1(x[1]&y[0],x[0]&y[1],p[1],w1);
    fa fa1(~(x[0]&y[2]),x[1]&y[1],w1,w2,w3);
    half ha2(~(x[2]&y[0]),w2,p[2],w4);
    fa fa2(~(x[2]&y[1]),~(x[1]&y[2]),w3,w5,w6);
    fa fa3(one,w4,w5,p[3],w7);
    fa fa4((x[2]&y[2]),w6,w7,p[4],p[5]);
    
    

    
endmodule

