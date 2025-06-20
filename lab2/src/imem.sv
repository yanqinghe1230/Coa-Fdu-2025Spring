`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/09 16:25:02
// Design Name: 
// Module Name: imem
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


module imem(input logic [5:0] a,
output logic[31:0] rd
    );
    logic [31:0] RAM[63:0];
initial begin
    $readmemh("memfile.dat", RAM);
end
    assign rd=RAM[a];                   
endmodule
