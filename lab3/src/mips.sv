`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/02 11:20:48
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
                output logic [31:0] pc,
                output logic memwrite,
                output logic [31:0] adr ,writedata,
                input logic [31:0] readdata,
                output logic iord);

logic memtoreg,alusrca,regdst,regwrite,branch,branchbne,zero,pcwrite,irwrite,pcen,immext;
logic [31:0] instr;
logic [1:0]alusrcb,pcsrc;
logic [2:0] alucontrol;
flopenr #(32) ir(clk,reset,irwrite,readdata,instr);
controller c(clk,reset,instr[31:26],instr[5:0],
             memtoreg, memwrite,pcsrc,
             alusrca,alusrcb, regdst, regwrite,branch,branchbne,
             alucontrol,irwrite,pcwrite,iord,immext);
datapath dp(clk, reset, memtoreg, pcsrc ,
            alusrca,alusrcb, regdst, regwrite,
            alucontrol ,
            zero, pc, instr,
            adr, writedata, readdata,pcen,immext);
assign pcen=pcwrite | (branch & zero) |(branchbne & ~zero);
endmodule
