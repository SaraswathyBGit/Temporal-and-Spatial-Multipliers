`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2023 10:06:57
// Design Name: 
// Module Name: bbu_clk
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


module bbu_clk(

  input [3:0]md,
  input [3:0]mr,
  input [1:0]sx,sy,
  
   output [8:0]y
  
    );
     wire [4:0]pr1,pr2,pr3,pr4;
     wire [8:0]z1,z2,z3;
     
 
    
    ssbb i1(md[1:0],mr[1:0],sx[0],sy[0],pr1);
    ssbb i2(md[3:2],mr[1:0],sx[1],sy[0],pr2);
    ssbb i3(md[1:0],mr[3:2],sx[0],sy[1],pr3);
    ssbb i4(md[3:2],mr[3:2],sx[1],sy[1],pr4);
    
  
 
 
 
assign z1={pr4[4:0],pr1[3:0]};
assign z2= pr2[4:0]+pr3[4:0];
assign z3= (pr2[4]==1&&pr3[4]==1)?({2'b11,z2,2'b00}): (pr2[4]==0&&pr3[4]==0)?({2'b00,z2,2'b00}):({z2[4],z2[4],z2[4:0],2'b00}); 
assign y=z1+z3;
    

 
    
    
    
    
   

endmodule
