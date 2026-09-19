`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 22:09:33
// Design Name: 
// Module Name: weightmul
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


module weightmul(input i, input [3:0]wt, output [3:0]out

    );
    
    and a1(out[0],i,wt[0]);
    and a2(out[1],i,wt[1]);
    and a3(out[2],i,wt[2]);
    and a4(out[3],i,wt[3]);
    
    
    
endmodule
