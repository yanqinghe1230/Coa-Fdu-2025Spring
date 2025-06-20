`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 13:12:44
// Design Name: 
// Module Name: mips
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


module mips(input logic clk,reset,
input logic [31:0] instrF,readdataM,
output logic [31:0] pcF,
output logic memwriteM,
output logic [31:0] aluoutM,
output logic [31:0] writedataM);
logic [5:0] opD,functD;
logic equalD,pcsrcD,branchD,branchbneD,jumpD,immextD;
logic [2:0] alucontrolE;
logic regwriteE,memtoregE,alusrxcE,regdstE,flushE;
logic regwriteM,memtoregM;
logic regwriteW,memtoregW;

controller c(clk,reset,opD,functD,equalD,flushE,
            pcsrcD,branchD,branchbneD,jumpD,immextD,
            alucontrolE,
            regwriteE,memtoregE,alusrcE,regdstE,regwriteM,memtoregM,memwriteM,
            regwriteW,memtoregW);
            
datapath dp(clk,reset,instrF,
            pcsrcD,branchD,branchbneD,jumpD,immextD,
            alucontrolE,regwriteE,memtoregE,alusrcE,regdstE,
            readdataM,regwriteM,memtoregM,
            regwriteW,memtoregW,
            pcF,opD,functD,equalD,
            flushE,
            aluoutM,writedataM);
endmodule
