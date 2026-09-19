`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 16:21:01
// Design Name: 
// Module Name: unpu
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


module unpu(input [7:0]i, input [7:0]w, input [2:0]itr, input clk, output reg [15:0]out

    );
  
  wire [7:0]o1,o2,o3,o4,o5,o6,o7,o8;
  wire [15:0]r1;
  wire [15:0]r2;
  wire [10:0]r3;
  wire [11:0]r4;
  wire [12:0]r5;
  wire [13:0]r6;
  wire [14:0]r7;
  wire [15:0]r8;
  
  
  
  
   
  andop a1(i,w[0],o1);
  andop a2(i,w[1],o2);
  andop a3(i,w[2],o3);
  andop a4(i,w[3],o4);
  andop a5(i,w[4],o5);
  andop a6(i,w[5],o6);
  andop a7(i,w[6],o7);
  andop a8(i,w[7],o8);
  
  assign r1=o1;
  assign r2=o2<<1;
  assign r3=o3<<2;
  assign r4=o4<<3;
  assign r5=o5<<4;
  assign r6=o6<<5;
  assign r7=o7<<6;
  assign r8=o8<<7;
  
  always @(posedge clk)
  begin
  if (itr==3'b000)
  out<=r1;
  else if(itr==3'b001)
  out<=r1+r2;
  else if(itr==3'b010)
  out<=o1+r2+r3;
  else if(itr==3'b011)
  out<=o1+r2+r3+r4;
  else if(itr==3'b100)
  out<=o1+r2+r3+r4+r5;
  else if(itr==3'b101)
  out<=o1+r2+r3+r4+r5+r6;
  else if(itr==3'b110)
  out<=o1+r2+r3+r4+r5+r6+r7;
  else if(itr==3'b111)
  out<=o1+r2+r3+r4+r5+r6+r7+r8;
  
  
  end
  
    
    
endmodule






