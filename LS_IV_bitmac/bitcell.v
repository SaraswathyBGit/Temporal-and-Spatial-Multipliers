`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 19:26:45
// Design Name: 
// Module Name: bitcell
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


module bitcell(
   input i,cin,
   input w,
   output o,cout

    );
    
    wire w1;
    xnor x1(w1,i,w);
    ha ha1(w1,cin,o,cout);
    
    
endmodule
