`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2024 12:26:53
// Design Name: 
// Module Name: bitmac1
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


module bitmac1#(parameter N=8)(

input [7:0]i,
input [7:0]wt,
input clk,

output reg [7:0]pp,
output reg [7:0]pr





   );
    
   
    wire c[6:0];
    
    reg [7:0] pp1 [0:7];
      
     integer k;
   
    genvar j;
    generate
        for (j=0; j<N; j=j+1)
         
    begin
    
          
    bitcell b1(i[j],~i[j],wt[0],pp[j%N],c[j%N]);
    bitcell b2(i[j],c[j%N],wt[1],pp[(j+1)%N],c[(j+1)%N]);
    bitcell b3(i[j],c[(j+1)%N],wt[2],pp[(j+2)%N],c[(j+2)%N]);
    bitcell b4(i[j],c[(j+2)%N],wt[3],pp[(j+3)%N],c[(j+3)%N]);
    bitcell b5(i[j],c[(j+3)%N],wt[4],pp[(j+4)%N],c[(j+4)%N]);
    bitcell b6(i[j],c[(j+4)%N],wt[5],pp[(j+5)%N],c[(j+5)%N]);
    bitcell b7(i[j],c[(j+5)%N],wt[6],pp[(j+6)%N],c[(j+6)%N]);
    bitcell b8(i[j],c[(j+6)%N],wt[7],pp[(j+7)%N],c[(j+7)%N]);
  
    
  
      end
     
    
    endgenerate
    
   
   
endmodule

