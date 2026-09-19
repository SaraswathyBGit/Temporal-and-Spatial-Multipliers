`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2023 09:43:15
// Design Name: 
// Module Name: pp
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


//partial product generation
module pp(a,b,c,m,pp);
input a,b,c;
input [4:0]m;
output [8:0]pp;

reg [8:0]pp=8'b0;
wire [4:0]m2c;


assign m2c=(~m)+1'b1;
always@(a or b or c or m)
begin
    case ({a,b,c})
        3'b000:pp=0;
        3'b001:pp=0;
        3'b010:pp=0;
        3'b011:pp=0;
        3'b100:pp=0;
        3'b101:pp=0;
        3'b110:pp=0;
        
        
        
        /*3'b001:pp={m[4],m[4],m[4],m[4],m[4:0]};
        3'b010:pp={m[4],m[4],m[4],m[4],m[4:0]};
        3'b011:pp={m[5],m[5],m[5],(m[4:0]<<1)};
        3'b100:pp={m2c[5],m2c[5],m2c[5],(m2c[4:0]<<1)};
        3'b101:pp={m2c[4],m2c[4],m2c[4],m2c[4],m2c[4:0]};
        3'b110:pp={m2c[4],m2c[4],m2c[4],m2c[4],m2c[4:0]};*/
        3'b111:pp=0;
     endcase
end

endmodule
