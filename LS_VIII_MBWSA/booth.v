`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2023 09:40:56
// Design Name: 
// Module Name: booth
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


module booth(

  input [4:0]ip1,
  input [4:0]wt,
  
  
  output [8:0]pr

    );
    
    wire [8:0]pp1,pp2,pp3;
   
    
    pp i1(wt[1],wt[0],1'b0,ip1,pp1);
    pp i2(wt[3],wt[2],wt[1],ip1,pp2);
    pp i3(wt[4],wt[4],wt[3],ip1,pp3);
    
    
    
    
 assign pr=pp1+(pp2<<2)+(pp3<<4);
 
 endmodule
    
