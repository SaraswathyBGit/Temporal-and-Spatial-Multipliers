`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 11:37:33
// Design Name: 
// Module Name: psmac
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


module psmac(

  input [7:0]ip1,
  input [7:0]ip2,
  input [7:0]ip3,
  input [7:0]ip4,
  input [1:0]wt1,
  input [1:0]wt2,
  input [1:0]wt3,
  input [1:0]wt4,
  input [1:0]wt5,
  input [1:0]wt6,
  input [1:0]wt7,
  input [1:0]wt8,
  input [1:0]wt9,
  input [1:0]wt10,
  input [1:0]wt11,
  input [1:0]wt12,
  input [1:0]wt13,
  input [1:0]wt14,
  input [1:0]wt15,
  input [1:0]wt16,
  input [15:0]sx,sy,
 
  input clk,
  
  
   output reg [8:0]y
    
    );
    
    
    wire [4:0] pr1,pr2,pr3,pr4,pr5,pr6,pr7,pr8,pr9,pr10,pr11,pr12,pr13,pr14,pr15,pr16;
    
   
    
    
 // BBU1 partial products of mr[3:0]*md[3*0]
    sbb i1(ip1[1:0],wt1[1:0],sx[0],sy[0],pr1);
    sbb i2(ip1[3:2],wt2[1:0],sx[1],sy[1],pr2);
    sbb i3(ip1[5:4],wt3[1:0],sx[2],sy[2],pr3);
    sbb i4(ip1[7:6],wt4[1:0],sx[3],sy[3],pr4); 
    
 // BBU2 partial products of mr[7:4]*md[3*0] 
    sbb i5(ip2[1:0],wt5[1:0],sx[4],sy[4],pr5);
    sbb i6(ip2[3:2],wt6[1:0],sx[5],sy[5],pr6);
    sbb i7(ip2[5:4],wt7[1:0],sx[6],sy[6],pr7);
    sbb i8(ip2[7:6],wt8[1:0],sx[7],sy[7],pr8);
    
 // BBU2 partial products of mr[3:0]*md[7*4]  
    sbb i9(ip3[1:0],wt9[1:0],sx[8],sy[8],pr9);
    sbb i10(ip3[3:2],wt10[1:0],sx[9],sy[9],pr10);
    sbb i11(ip3[5:4],wt11[1:0],sx[10],sy[10],pr11);
    sbb i12(ip3[7:6],wt12[1:0],sx[11],sy[11],pr12);
    
 // BBU2  partial products of mr[7:4]*md[7*4]    
    sbb i13(ip4[1:0],wt13[1:0],sx[12],sy[12],pr13);
    sbb i14(ip4[3:2],wt14[1:0],sx[13],sy[13],pr14);
    sbb i15(ip4[5:4],wt15[1:0],sx[14],sy[14],pr15);
    sbb i16(ip4[7:6],wt16[1:0],sx[15],sy[15],pr16);  
    


      
    always@ (posedge clk)
    
   
     y=pr16+pr15+pr14+pr13+pr12+pr11+pr10+pr9+pr8+pr7+pr6+pr5+pr4+pr3+pr2+pr1;
     
    
    
    
    
    
         
        
   
    
  

    

 endmodule
    
