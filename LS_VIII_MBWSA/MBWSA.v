`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2023 10:22:34
// Design Name: 
// Module Name: MBWSA
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


module mbswa(
input [7:0]ip1,
input [7:0]ip2,
input [7:0]wt1,
input [7:0]wt2,
input clk,
input [1:0]mode,
output reg [16:0]out1,out2,out3,out4,
output reg [16:0]out

    );
    
    
    wire [8:0]breg1,breg2,breg3,breg4;
    booth b1({1'b0,ip1[3:0]},{1'b0,wt1[3:0]},breg1);
    booth b2({ip1[7],ip1[7:4]},{1'b0,wt2[3:0]},breg2);
    booth b3({1'b0,ip2[3:0]},{wt1[7],wt1[7:4]},breg3);
    booth b4({ip2[7],ip2[7:4]},{wt2[7],wt2[7:4]},breg4);
   
   always @(posedge clk)
  
   begin
   if (mode==2'b00)
   begin 
     out1<=breg1;
     out2<=breg2;
     out3<=breg3;
     out4<=breg4;
   end
   else if (mode==2'b01)
   begin
   out1<={breg1[8],breg1[8],breg1[8],breg1[8],breg1[8],breg1[8],breg1[8],breg1[8],breg1[8:0]};
   out2<=({breg2[8],breg2[8],breg2[8],breg2[8],breg2[8:0]})<<4;
   out3<=({breg3[8],breg3[8],breg3[8],breg3[8],breg3[8]})<<4;
   out4<=(breg4)<<8;
   out <= out1+out2+out3+out4;
   
   end
   else
   out1=0;
  end
endmodule
