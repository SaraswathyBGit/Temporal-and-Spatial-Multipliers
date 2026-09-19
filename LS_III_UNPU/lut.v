`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 16:04:13
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


module lut(input [3:0]in,        input [7:0]a,b,c,d,     output reg [8:0]out

    );
    
    always @(*)
        case (in[3:0])  
            4'b0000: out = 8'b0;
            4'b0001: out = a;
            4'b0010: out = b;
            4'b0011: out = a+b;
            4'b0100: out = c;
            4'b0101: out = a+c;
            4'b0110: out = b+c;
            4'b0111: out = c+b+a;
            4'b1000: out = d;
            4'b1001: out = d+a;
            4'b1010: out = d+b;
            4'b1011: out = d+b+a;
            4'b1100: out = d+c;
            4'b1101: out = d+c+a;
            4'b1110: out = d+c+b;
            4'b1111: out = d+c+b+a; 
            default: out = 8'h00; 
        endcase

    
endmodule
