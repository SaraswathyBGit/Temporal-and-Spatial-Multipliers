`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 12:52:06
// Design Name: 
// Module Name: lut
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


module lut(input [3:0] in, input [3:0] w, output reg [7:0] out

    );


        
     always @(*)
        case (in[3:0])  
            4'b0000: out = 8'b0;
            4'b0001: out = w;
            4'b0010: out = w<<1;
            4'b0011: out = 3*w;
            4'b0100: out = w<<2;
            4'b0101: out = 5*w;
            4'b0110: out = (3*w)<<1;
            4'b0111: out = 7*w;
            4'b1000: out = w<<3;
            4'b1001: out = 9*w;
            4'b1010: out = (5*w)<<1;
            4'b1011: out = 11*w;
            4'b1100: out = (3*w)<<2;
            4'b1101: out = 13*w;
            4'b1110: out = (7*w)<<1;
            4'b1111: out = 15*w; 
            default: out = 8'h00; 
        endcase

endmodule