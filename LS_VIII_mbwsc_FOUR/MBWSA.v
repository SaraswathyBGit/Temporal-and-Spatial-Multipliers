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
input mode,
output reg [10:0]out

    );
    
    wire [8:0]breg1,breg2,breg3,breg4,pp1b1,pp2b1,pp3b1,pp1b2,pp2b2,pp3b2,pp1b3,pp2b3,pp3b3,pp1b4,pp2b4,pp3b4;
    
    
    booth b1({1'b0,ip1[3:0]},{1'b0,wt1[3:0]},pp1b1,pp2b1,pp3b1);
    booth b2({ip1[7],ip1[7:4]},{1'b0,wt2[3:0]},pp1b2,pp2b2,pp3b2);
    booth b3({1'b0,ip2[3:0]},{wt1[7],wt1[7:4]},pp1b3,pp2b3,pp3b3);
    booth b4({ip2[7],ip2[7:4]},{wt2[7],wt2[7:4]},pp1b4,pp2b4,pp3b4);
    
    assign breg1=pp1b1+(pp2b1<<2)+(pp3b1<<4);
    assign breg2=pp1b2+(pp2b2<<2)+(pp3b2<<4);
    assign breg3=pp1b3+(pp2b3<<2)+(pp3b3<<4);
    assign breg4=pp1b4+(pp2b4<<2)+(pp3b4<<4);
    
   
   
  always @(posedge clk)
  
   begin
   if (mode==1'b1)
   
     out=breg1+breg2+breg3+breg4;
  
   else
   out=pp1b1[3:2]+pp2b1[1:0]+pp1b2[3:2]+pp2b2[1:0]+pp1b3[3:2]+pp2b3[1:0]+pp1b4[3:2]+pp2b4[1:0];
  end
endmodule
