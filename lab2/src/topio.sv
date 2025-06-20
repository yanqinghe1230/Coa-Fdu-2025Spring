`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/10 17:01:54
// Design Name: 
// Module Name: top
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


module top(input logic CLK100MHZ,
input logic BTNC,
input logic BTNL,
input logic BTNR,
input logic [15:0]SW, //a [15:8] b[7:0]
output logic [7:0] AN,
output logic [6:0] A2G);

logic [31:0] pc,instr;

imem imem(.a(pc[7:2]),
.rd(instr));

logic write;
logic [31:0] dataadr,writedata,readdata;

mips mips(.clk(CLK100MHZ),
.reset(BTNC),
.pc(pc),
.instr(instr),
.memwrite(write),
.aluout(dataadr),
.writedata(writedata),
.readdata(readdata));

dmemorydecoder dmd(.clk(CLK100MHZ),
.writeEN(write),
.addr(dataadr[7:0]),
.writedata(writedata),
.readdata(readdata),
.reset(BTNC),
.btnl(BTNL),
.btnr(BTNR),
.switch(SW),
.an(AN),
.a2g(A2G));
endmodule
