`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 21:51:11
// Design Name: 
// Module Name: stripes
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


module stripes(input [3:0]ip1,ip2,ip3,ip4, input [3:0]wt1,wt2,wt3,wt4, input clk, output reg [9:0]out

    );
    
    wire [3:0]pp11,pp12,pp13,pp14,pp21,pp22,pp23,pp24,pp31,pp32,pp33,pp34,pp41,pp42,pp43,pp44;
    wire [5:0]cyc1;
    wire [6:0]shift1,cyc2;
    wire [7:0]shift2,cyc3;
    wire [8:0]shift3,cyc4;
    
    
    weightmul w1(ip1[3],wt1,pp11);
    weightmul w2(ip2[3],wt2,pp12);
    weightmul w3(ip3[3],wt3,pp13);
    weightmul w4(ip4[3],wt4,pp14);
    
    weightmul e1(ip1[2],wt1,pp21);
    weightmul e2(ip2[2],wt2,pp22);
    weightmul e3(ip3[2],wt3,pp23);
    weightmul e4(ip4[2],wt4,pp24);
    
    weightmul m1(ip1[1],wt1,pp31);
    weightmul m2(ip2[1],wt2,pp32);
    weightmul m3(ip3[1],wt3,pp33);
    weightmul m4(ip4[1],wt4,pp34);
    
    weightmul u1(ip1[0],wt1,pp41);
    weightmul u2(ip2[0],wt2,pp42);
    weightmul u3(ip3[0],wt3,pp43);
    weightmul u4(ip4[0],wt4,pp44);
    
    
    assign cyc1=pp11+pp12+pp13+pp14;
    
    
    assign shift1=cyc1<<1;    
    assign cyc2=shift1+pp21+pp22+pp23+pp24;
    
    assign shift2=cyc2<<1;
    assign cyc3=shift2+pp31+pp32+pp33+pp34;
    
    assign shift3=cyc3<<1;
    assign cyc4=shift3+pp41+pp42+pp43+pp44;
    
    
    always @(posedge clk)
    out<=cyc4;
    
endmodule
