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


module controller(input clk,reset,
                      input logic [5:0] op ,funct,
                      output logic memtoreg, memwrite,
                      output logic [1:0]pcsrc,
                      output logic alusrca,
                      output logic [1:0] alusrcb,
                      output logic regdst, regwrite,
                      output logic branch,branchbne,
                      output logic [2:0] alucontrol,
                      output logic irwrite,
                      output logic pcwrite,
                      output logic iord,immext);
                      
logic [2:0] aluop;

maindec md(clk,reset,op,
           pcwrite,memwrite,irwrite,regwrite,
           alusrca,branch,branchbne,iord,memtoreg,regdst,alusrcb,pcsrc,aluop,immext);
aludec ad(funct, aluop, alucontrol);
endmodule
