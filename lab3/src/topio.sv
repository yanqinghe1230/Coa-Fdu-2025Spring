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

logic [31:0] writedata, dataadr;
logic memwrite;
logic [31:0] pc,readdata1,readdata2;
logic [31:0] readdata;
logic iord;

imem imem(.a(pc[7:2]),
.rd(readdata1));

mips mips(.clk(CLK100MHZ),
.reset(BTNC),
.pc(pc),
.memwrite(memwrite),
.adr(dataadr),
.writedata(writedata),
.readdata(readdata),
.iord(iord));

dmemorydecoder dmd(.clk(CLK100MHZ),
.writeEN(memwrite),
.addr(dataadr[7:0]),
.writedata(writedata),
.readdata(readdata2),
.reset(BTNC),
.btnl(BTNL),
.btnr(BTNR),
.switch(SW),
.an(AN),
.a2g(A2G));
mux2#(32) muxreaddata(readdata1,readdata2,iord,readdata);
endmodule
