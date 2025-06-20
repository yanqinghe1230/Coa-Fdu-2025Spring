`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/04 04:04:02
// Design Name: 
// Module Name: Hex7Seg
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


module Hex7Seg(
    input  logic [3:0] digit,
    output logic [6:0] a2g
    );
    
 always_comb
    begin
        case (digit) 
            4'b0000: a2g = 7'b0000001; 
            4'b0001: a2g = 7'b1001111; 
            4'b0010: a2g = 7'b0010010; 
            4'b0011: a2g = 7'b0000110; 
            4'b0100: a2g = 7'b1001100; 
            4'b0101: a2g = 7'b0100100; 
            4'b0110: a2g = 7'b0100000; 
            4'b0111: a2g = 7'b0001111; 
            4'b1000: a2g = 7'b0000000; 
            4'b1001: a2g = 7'b0000100; 
            4'b1111: a2g = 7'b1110110; // =
            default: a2g = 7'b1111111; 
        endcase 
    end
endmodule