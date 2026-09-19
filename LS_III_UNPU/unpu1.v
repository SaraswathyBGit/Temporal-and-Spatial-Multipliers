`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2024 10:39:54
// Design Name: 
// Module Name: unpu1
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


module unpu1(input [7:0]a,b,c,d, input [3:0]w1,w2,w3,w4, input clk,  output reg [12:0]out

    );
    
    wire [8:0]out1,out2,out3,out4;
    wire [9:0]out2s;
    wire [10:0]out3s;
    wire [11:0]out4s;
    
    
        
    lut l1({w1[0],w2[0],w3[0],w4[0]},a,b,c,d,out1);
    lut l2({w1[1],w2[1],w3[1],w4[1]},a,b,c,d,out2);
    lut l3({w1[2],w2[2],w3[2],w4[2]},a,b,c,d,out3);
    lut l4({w1[3],w2[3],w3[3],w4[3]},a,b,c,d,out4);
    
    assign out2s=out2<<1;
    assign out3s=out3<<2;
    assign out4s=out4<<3;
    
    
    
    always @ (posedge clk)
    out<=out1+out2s+out3s+out4s;
    
    
endmodule
