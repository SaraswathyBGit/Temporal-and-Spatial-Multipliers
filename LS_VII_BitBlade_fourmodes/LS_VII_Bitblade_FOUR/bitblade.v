`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2023 22:13:25
// Design Name: 
// Module Name: bitblade
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


module bitblade(

  input [7:0]ip1,
  input [7:0]ip2,
  input [7:0]ip3,
  input [7:0]ip4,
  input [7:0]wt1,
  input [7:0]wt2,
  input [7:0]wt3,
  input [7:0]wt4,
  input [15:0]sx,sy,
  input mode,
  input clk,
  
  
   output reg [10:0]y
    
    );

wire [4:0] pr1,pr5,pr9,pr13,pr2,pr6,pr10,pr14,pr3,pr7,pr11,pr15,pr4,pr8,pr12,pr16;
wire [6:0] w1,w4;
wire [8:0] w2,w3;

wire [10:0] w5,w6,w7,x1;
wire [8:0] x2;
 
   
  // Processing Element 1:(<<0)
    bb i1(ip1[1:0],wt1[1:0],sx[0],sy[0],pr1);
    bb i5(ip2[1:0],wt2[1:0],sx[4],sy[4],pr5);
    bb i9(ip3[1:0],wt3[1:0],sx[8],sy[8],pr9);
    bb i13(ip4[1:0],wt4[1:0],sx[12],sy[12],pr13);
    
  // Processing Element 2:(<<2)  
    bb i2(ip1[3:2],wt1[3:2],sx[1],sy[1],pr2);
    bb i6(ip2[3:2],wt2[3:2],sx[5],sy[5],pr6);
    bb i10(ip3[3:2],wt3[3:2],sx[9],sy[9],pr10);
    bb i14(ip4[3:2],wt4[3:2],sx[13],sy[13],pr14);
    
    
  // Processing Element 3:(<<2) 
    bb i3(ip1[5:4],wt1[5:4],sx[2],sy[2],pr3);
    bb i7(ip2[5:4],wt2[5:4],sx[6],sy[6],pr7);
    bb i11(ip3[5:4],wt3[5:4],sx[10],sy[10],pr11);
    bb i15(ip4[5:4],wt4[5:4],sx[14],sy[14],pr15);
    
  
  // Processing Element 4:(<<4) 
    bb i4(ip1[7:6],wt1[7:6],sx[3],sy[3],pr4); 
    bb i8(ip2[7:6],wt2[7:6],sx[7],sy[7],pr8);    
    bb i12(ip3[7:6],wt3[7:6],sx[11],sy[11],pr12);     
    bb i16(ip4[7:6],wt4[7:6],sx[15],sy[15],pr16);  
    
    
  
   // 
   
   assign w1=pr1+pr5+pr9+pr13;
   assign w2=(pr2+pr6+pr10+pr14)<<2;
   assign w3=(pr3+pr7+pr11+pr15)<<2;
   assign w4=pr4+pr8+pr12+pr16;
   assign w5={w1[6],w1[6],w1[6],w1[6],w1};
   assign w6={w2[6],w2[6],w2};
   assign w7={w3[6],w3[6],w3};  
   
   // summation of four 4bx4b multiplications
   
    assign x1=w5+w6+w7+(w4<<4);
    
   // summation of 16 2x2 multiplications
   
    
    assign x2=pr1+pr5+pr9+pr13+pr2+pr6+pr10+pr14+pr3+pr7+pr11+pr15+pr4+pr8+pr12+pr16;
   
  
   
   
   
   always@ (posedge clk)
    
    begin
     if(mode==1'b0)
     y=x2;
     else 
    
     y=x1;
     end 
  
    
    

  
endmodule
