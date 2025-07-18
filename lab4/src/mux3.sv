`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 10:33:03
// Design Name: 
// Module Name: mux3
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


module mux3 #(parameter WIDTH=8)
(input logic [WIDTH-1:0] d0,
input logic [WIDTH-1:0] d1,
input logic [WIDTH-1:0] d2,
input logic [1:0] s,
output logic [WIDTH-1:0] y);

assign y=s[1] ? d2:(s[0] ? d1:d0);
endmodule
