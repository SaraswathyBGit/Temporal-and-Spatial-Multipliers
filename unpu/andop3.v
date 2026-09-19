`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2024 16:05:21
// Design Name: 
// Module Name: andop3
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


module andop3(input [3:0]i, input w, output [3:0]o

    );
    
    
    assign o[0]=i[0]&w;
    assign o[1]=i[1]&w;
    assign o[2]=i[2]&w;
    assign o[3]=i[3]&w;
   
    
    
    
endmodule

