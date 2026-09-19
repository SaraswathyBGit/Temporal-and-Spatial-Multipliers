`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2024 11:15:37
// Design Name: 
// Module Name: andop
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


module andop(input [7:0]i, input w, output [7:0]o

    );
    
    
    assign o[0]=i[0]&w;
    assign o[1]=i[1]&w;
    assign o[2]=i[2]&w;
    assign o[3]=i[3]&w;
    assign o[4]=i[4]&w;
    assign o[5]=i[5]&w;
    assign o[6]=i[6]&w;
    assign o[7]=i[7]&w;
    
    
    
endmodule

  

