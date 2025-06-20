`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/03 16:48:24
// Design Name: 
// Module Name: maindec
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


module maindec( input logic [5:0] op,
output logic regwrite,regdst,
output logic alusrc,branch,branchbne,
output logic memwrite,memtoreg,
output logic jump,
output logic immext,
output logic [2:0] aluop
    );
    logic[11:0] controls;
    assign{regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop,immext,branchbne}=controls;
    always_comb
        case(op)
            6'b000000: controls<=12'b110000010100; //rtype
            6'b100011: controls<=12'b101001000000; //lw
            6'b101011: controls<=12'b001010000000; //sw
            6'b000100: controls<=12'b000100000100; //beq
            6'b000101: controls<=12'b000000000101; //bne
            6'b001000: controls<=12'b101000000000; //addi
            6'b001100: controls<=12'b101000001010; //andi
            6'b001101: controls<=12'b101000001110; //ori
            6'b001010: controls<=12'b101000010000; //slti
            6'b000010: controls<=12'b000000100000; //j
            default: controls<=12'b0; //nop
        endcase
endmodule
