`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2024 20:41:54
// Design Name: 
// Module Name: bitfusion
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


module bitfusion(

  input [7:0]ip1,
  input [7:0]ip2,
  input [7:0]ip3,
  input [7:0]ip4,
  input [1:0]wt1,
  input [1:0]wt2,
  input [1:0]wt3,
  input [1:0]wt4,
  input [1:0]wt5,
  input [1:0]wt6,
  input [1:0]wt7,
  input [1:0]wt8,
  input [1:0]wt9,
  input [1:0]wt10,
  input [1:0]wt11,
  input [1:0]wt12,
  input [1:0]wt13,
  input [1:0]wt14,
  input [1:0]wt15,
  input [1:0]wt16,
  input [15:0]sx,sy,
  input mode,
  input clk,
  
  
   output reg [10:0]y
    
    );
    
   
    wire [4:0] pr1,pr2,pr3,pr4,pr5,pr6,pr7,pr8,pr9,pr10,pr11,pr12,pr13,pr14,pr15,pr16;
    wire [8:0]z1,z2,z3,z4,z5,z6,z7,z8;
    wire [6:0]x1,x2,x3,x4;
    wire [8:0]y1,y2,y3,y4;
   
    
   
    
    
 // BBU1 partial products of mr[3:0]*md[3*0]
    bb i1(ip1[1:0],wt1[1:0],sx[0],sy[0],pr1);
    bb i2(ip1[3:2],wt2[1:0],sx[1],sy[1],pr2);
    bb i3(ip1[5:4],wt3[1:0],sx[2],sy[2],pr3);
    bb i4(ip1[7:6],wt4[1:0],sx[3],sy[3],pr4); 
    
 // BBU2 partial products of mr[7:4]*md[3*0] 
    bb i5(ip2[1:0],wt5[1:0],sx[4],sy[4],pr5);
    bb i6(ip2[3:2],wt6[1:0],sx[5],sy[5],pr6);
    bb i7(ip2[5:4],wt7[1:0],sx[6],sy[6],pr7);
    bb i8(ip2[7:6],wt8[1:0],sx[7],sy[7],pr8);
    
 // BBU2 partial products of mr[3:0]*md[7*4]  
    bb i9(ip3[1:0],wt9[1:0],sx[8],sy[8],pr9);
    bb i10(ip3[3:2],wt10[1:0],sx[9],sy[9],pr10);
    bb i11(ip3[5:4],wt11[1:0],sx[10],sy[10],pr11);
    bb i12(ip3[7:6],wt12[1:0],sx[11],sy[11],pr12);
    
 // BBU2  partial products of mr[7:4]*md[7*4]    
    bb i13(ip4[1:0],wt13[1:0],sx[12],sy[12],pr13);
    bb i14(ip4[3:2],wt14[1:0],sx[13],sy[13],pr14);
    bb i15(ip4[5:4],wt15[1:0],sx[14],sy[14],pr15);
    bb i16(ip4[7:6],wt16[1:0],sx[15],sy[15],pr16);  
    

//bbu1 4bX4b product computation
assign z1=(pr4<<4)+pr1;
assign x1= (pr2[4:0]+pr3[4:0])<<2;
assign z2= (pr2[4]==1&&pr3[4]==1)?({2'b11,x1}): (pr2[4]==0&&pr3[4]==0)?({2'b00,x1}):({x1[6],x1[6],x1}); 
assign y1=z1+z2;
    
//bbu2 4bX4b product computation
assign z3= (pr8<<4)+pr5;
assign x2=(pr6[4:0]+pr7[4:0])<<2;
assign z4= (pr6[4]==1&&pr7[4]==1)?({2'b11,x2}): (pr6[4]==0&&pr7[4]==0)?({2'b00,x2}):({x2[6],x2[6],x2});     
assign y2=z3+z4;  


//bbu3 4bX4b product computation
assign z5=(pr12<<4)+pr9;
assign x3=(pr10[4:0]+pr11[4:0])<<2;
assign z6= (pr10[4]==1&&pr11[4]==1)?({2'b11,x3}): (pr10[4]==0&&pr11[4]==0)?({2'b00,x3}):({x3[6],x3[6],x3}); 
assign y3=z5+z6;

//bbu4 4bX4b product computation
assign z7=(pr16<<4)+pr13;
assign x4= (pr14[4:0]+pr15[4:0])<<2;
assign z8= (pr14[4]==1&&pr15[4]==1)?({2'b11,x4}): (pr14[4]==0&&pr15[4]==0)?({2'b00,x4}):({x4[6],x4[6],x4}); 
assign y4=z7+z8; 


 
    always@ (posedge clk)
    
    begin
     if(mode==1'b0)
     y=pr16+pr15+pr14+pr13+pr12+pr11+pr10+pr9+pr8+pr7+pr6+pr5+pr4+pr3+pr2+pr1;
     else 
     y=y4+y3+y2+y1;
     end
    
    
    
    
    
         
        
   
    
  

    

 endmodule
    
    
    
    


