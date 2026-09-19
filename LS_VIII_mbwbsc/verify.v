`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2023 21:51:03
// Design Name: 
// Module Name: verify
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


module verify(
input [7:0]ip1,
input [7:0]ip2,
input [7:0]wt1,
input [7:0]wt2


    );
    
    wire [8:0]breg1,breg2,breg3,breg4;
    booth b1({1'b0,ip1[3:0]},{1'b0,wt1[3:0]},breg1);
    booth b2({ip1[7],ip1[7:4]},{1'b0,wt2[3:0]},breg2);
    booth b3({1'b0,ip2[3:0]},{wt1[7],wt1[7:4]},breg3);
    booth b4({ip2[7],ip2[7:4]},{wt2[7],wt2[7:4]},breg4);
   
   
endmodule
