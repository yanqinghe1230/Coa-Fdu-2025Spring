`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/09 16:36:19
// Design Name: 
// Module Name: alu
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


module alu(input logic [31:0] a,b,
input logic [2:0] alucont,
output logic  [31:0] result,
output logic zero
    );
    always_comb
        case(alucont)
            3'b010: result<=a+b; //add
            3'b110: result<=a-b; //sub
            3'b000: result<=a&b; //and
            3'b001: result<=a|b; //or
            3'b111: result<= (a<b)? 32'b1:32'b0; //slt
            default: result<=32'b0;
        endcase
    assign zero = (result == 32'b0);                                     
endmodule
