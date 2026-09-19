`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 20:06:45
// Design Name: 
// Module Name: bitmac
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


module bitmac(

input [7:0]i,
input [7:0]wt,
input clk,
input [3:0]iteration,
output reg [14:0]pr





   );
    
    
    wire c[6:0];
    wire [7:0]pp;
    reg [14:0]pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8;
    
    bitcell b1(i[0],~i[0],wt[0],pp[0],c[0]);
    bitcell b2(i[0],c[0],wt[1],pp[1],c[1]);
    bitcell b3(i[0],c[1],wt[2],pp[2],c[2]);
    bitcell b4(i[0],c[2],wt[3],pp[3],c[3]);
    bitcell b5(i[0],c[3],wt[4],pp[4],c[4]);
    bitcell b6(i[0],c[4],wt[5],pp[5],c[5]);
    bitcell b7(i[0],c[5],wt[6],pp[6],c[6]);
    bitcell b8(i[0],c[6],wt[7],pp[7],c[7]);
    
    always @(posedge clk)
    begin
    if(iteration==4'b0001)
    pp1=pp;
    else if(iteration==4'b0010)
    pp2={pp[7],pp[7],pp[7],pp[7],pp[7],pp[7],pp}<<1;
    else if(iteration==4'b0011)
    pp3={pp[7],pp[7],pp[7],pp[7],pp[7],pp}<<2;
    else if(iteration==4'b0100)
    pp4={pp[7],pp[7],pp[7],pp[7],pp}<<3;
    else if(iteration==4'b0101)
    pp5={pp[7],pp[7],pp[7],pp}<<4;
    else if(iteration==4'b0110)
    pp6={pp[7],pp[7],pp}<<5;
    else if(iteration==4'b0111)
    pp7={pp[7],pp}<<6;
    else if(iteration==4'b1000)
    pp8= pp<<7;
    else if(iteration==4'b1001)
    pr=pp1+pp2+pp3+pp4+pp5+pp6+pp7+pp8;
  
    end
endmodule

