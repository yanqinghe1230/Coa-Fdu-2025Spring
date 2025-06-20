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


        module alu(
            input logic [31:0]SrcA,
            input logic [31:0]SrcB,
            input logic [2:0]ALUControl,
            output logic [31:0]ALUResult,
            output logic Zero
        );
assign Zero=(ALUResult==0)?1:0;
always_comb
    case(ALUControl)
        3'b000:
            ALUResult=SrcA&SrcB;//and
        3'b001:
            ALUResult=SrcA|SrcB;//or
        3'b010:
            ALUResult=SrcA+SrcB;//add
        3'b111:
            ALUResult=SrcA<SrcB;//slt
        3'b110:
            ALUResult=SrcA-SrcB;//sub
    endcase
    endmodule
