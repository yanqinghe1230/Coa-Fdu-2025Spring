`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/10 12:47:53
// Design Name: 
// Module Name: controller
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


module controller(input logic clk,reset,
input logic [5:0] opD,functD,
input logic equalD,
input logic flushE,
output logic pcsrcD,branchD,branchbneD,jumpD,immextD,
output logic [2:0] alucontrolE,
output logic regwriteE,memtoregE,alusrcE,regdstE,
output logic regwriteM,memtoregM,memwriteM,
output logic regwriteW,memtoregW
);
logic [2:0] alucontrolD;
logic regwriteD,regdstD;
logic alusrcD;
logic memwriteD,memtoregD;
logic memwriteE;
logic [2:0] aluopD;

maindec md(opD,
            regwriteD,regdstD,
            alusrcD,branchD,branchbneD,
            memwriteD,memtoregD,
            jumpD,immextD,aluopD);
            
aludec ad(functD,aluopD,alucontrolD);

assign pcsrcD=(branchD & equalD)|(branchbneD & equalD);

floprc #(8) regE(clk,reset,flushE,
            {memtoregD,memwriteD,alusrcD,regdstD,regwriteD,alucontrolD},
            {memtoregE,memwriteE,alusrcE,regdstE,regwriteE,alucontrolE});

flopr #(3) regM(clk,reset,
                {memtoregE,memwriteE,regwriteE},
                {memtoregM,memwriteM,regwriteM});
flopr #(2) regW(clk,reset,
                {memtoregM,regwriteM},
                {memtoregW,regwriteW});
endmodule
