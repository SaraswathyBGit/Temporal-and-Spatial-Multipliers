`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 16:02:24
// Design Name: 
// Module Name: pp
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


module pp(
 input [3:0]ip1,ip2,ip3,ip4,
 input clk,
 
 input [3:0] wt1,wt2,wt3,wt4,
 
 output reg [10:0]out

    );
    
   wire [7:0] pp1,pp2,pp3,pp4;
   
   
    lut l1(ip1,wt1,pp1);
    lut l2(ip2,wt2,pp2);    
    lut l3(ip3,wt3,pp3);
    lut l8(ip4,wt4,pp4);
    
  
    
    always@(posedge clk)
    
    out=pp4+pp3+pp2+pp1;
    
  
    
    
endmodule
