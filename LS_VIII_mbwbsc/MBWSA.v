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
output reg [16:0]out

    );
    
    wire [8:0]breg1,breg2,breg3,breg4,pp1b1,pp2b1,pp3b1,pp1b2,pp2b2,pp3b2,pp1b3,pp2b3,pp3b3,pp1b4,pp2b4,pp3b4;
    wire [16:0]out1,out2,out3,out4;
    
    booth b1({1'b0,ip1[3:0]},{1'b0,wt1[3:0]},pp1b1,pp2b1,pp3b1);
    booth b2({ip1[7],ip1[7:4]},{1'b0,wt2[3:0]},pp1b2,pp2b2,pp3b2);
    booth b3({1'b0,ip2[3:0]},{wt1[7],wt1[7:4]},pp1b3,pp2b3,pp3b3);
    booth b4({ip2[7],ip2[7:4]},{wt2[7],wt2[7:4]},pp1b4,pp2b4,pp3b4);
    
    assign breg1=pp1b1+(pp2b1<<2)+(pp3b1<<4);
    assign breg2=pp1b2+(pp2b2<<2)+(pp3b2<<4);
    assign breg3=pp1b3+(pp2b3<<2)+(pp3b3<<4);
    assign breg4=pp1b4+(pp2b4<<2)+(pp3b4<<4);
    
   assign out1={breg1[8],breg1[8],breg1[8],breg1[8],breg1[8],breg1[8],breg1[8:0]};
   assign out2=({breg2[8],breg2[8],breg2[8:0]})<<4;
   assign out3=({breg3[8],breg3[8],breg3[8:0]})<<4;
   assign out4=(breg4)<<8;
   
  always @(posedge clk)
  
   begin
   if (mode==2'b00)
   begin 
     out={6'b0,(breg1+breg2+breg3+breg4)};
   end
   else if (mode==2'b01)
   begin
   
   out = out1+out2+out3+out4;
   end
   else
   out={9'b0,pp1b1[3:2]+pp2b1[1:0]+pp1b2[3:2]+pp2b2[1:0]+pp1b3[3:2]+pp2b3[1:0]+pp1b4[3:2]+pp2b4[1:0]};
  end
endmodule
