`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/17 21:48:22
// Design Name: 
// Module Name: flopr2
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


module flopr2 #(parameter WIDTH=8)
(input logic clk,reset,
input logic [WIDTH-1:0] d1,d2,
output logic [WIDTH-1:0] q1,q2);

always_ff @(posedge clk)
    if(reset)
        begin
            q1<=0;
            q2<=0;
        end
     else
        begin
            q1<=d1;
            q2<=d2;
        end
endmodule
