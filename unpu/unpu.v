`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2024 16:07:28
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


module unpu(input [3:0]i1,i2,i3,i4, input [3:0]w1,w2,w3,w4, input [2:0]itr, input itrc, input clk, output reg [9:0]out

    );
  
  reg [7:0] out1,out2,out3,out4;
  
  wire [3:0]r11;
  wire [4:0]r12;
  wire [5:0]r13;
  wire [6:0]r14;
  
  wire [3:0]r21;
  wire [4:0]r22;
  wire [5:0]r23;
  wire [6:0]r24;
  
  wire [3:0]r31;
  wire [4:0]r32;
  wire [5:0]r33;
  wire [6:0]r34;
  
  wire [3:0]r41;
  wire [4:0]r42;
  wire [5:0]r43;
  wire [6:0]r44;
  
  
  
  wire [3:0] o11,o12,o13,o14;
  wire [3:0] o21,o22,o23,o24;
  wire [3:0] o31,o32,o33,o34;
  wire [3:0] o41,o42,o43,o44;
  
  //PE1
  andop1 a11(i1,w1[0],o11);
  andop1 a12(i1,w1[1],o12);
  andop1 a13(i1,w1[2],o13);
  andop1 a14(i1,w1[3],o14);
  
  assign r11=o11;
  assign r12=o12<<1;
  assign r13=o13<<2;
  assign r14=o14<<3;
  
  //PE2
  andop2 a21(i2,w2[0],o21);
  andop2 a22(i2,w2[1],o22);
  andop2 a23(i2,w2[2],o23);
  andop2 a24(i2,w2[3],o24);
  
  assign r21=o21;
  assign r22=o22<<1;
  assign r23=o23<<2;
  assign r24=o24<<3;
  
  
   //PE3
  andop3 a31(i3,w3[0],o31);
  andop3 a32(i3,w3[1],o32);
  andop3 a33(i3,w3[2],o33);
  andop3 a34(i3,w3[3],o34);
  
  assign r31=o31;
  assign r32=o32<<1;
  assign r33=o33<<2;
  assign r34=o34<<3;
  
   //PE4
  andop4 a41(i4,w4[0],o41);
  andop4 a42(i4,w4[1],o42);
  andop4 a43(i4,w4[2],o43);
  andop4 a44(i4,w4[3],o44);
  
  assign r41=o41;
  assign r42=o42<<1;
  assign r43=o43<<2;
  assign r44=o44<<3;
  
   
  always@(posedge clk)
   begin

  if (itr==2'b00&&itrc==1'b1)
  begin
  out1<=r11;
  out2<=r21;
  out3<=r31;
  out4<=r41;
  end
  
  else if(itr==3'b01&&itrc==1'b1)
  begin
  out1<=r11+r12;
  out2<=r21+r22;
  out3<=r31+r32;
  out4<=r41+r42;
  end
  
  else if(itr==3'b10&&itrc==1'b1)
   begin
  out1<=r11+r12+r13;
  out2<=r21+r22+r23;
  out3<=r31+r32+r33;
  out4<=r41+r42+r43;
  end
  
  else if(itr==3'b11&&itrc==1'b1)
   begin
  out1<=r11+r12+r13+r14;
  out2<=r21+r22+r23+r24;
  out3<=r31+r32+r33+r34;
  out4<=r41+r42+r43+r44;
  end
   else if(itrc==0)
  out<=out1+out2+out3+out4;
   end 
       
endmodule

