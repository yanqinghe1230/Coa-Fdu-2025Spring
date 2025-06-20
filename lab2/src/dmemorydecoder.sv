`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/14 21:14:07
// Design Name: 
// Module Name: dmemorydecoder
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


module dmemorydecoder(input logic clk,
input logic writeEN,
input logic [7:0] addr,
input logic [31:0] writedata,
output logic [31:0] readdata,
input logic reset,
input logic btnl,
input logic btnr,
input logic [15:0] switch,
output logic [7:0] an,
output logic [6:0] a2g);

logic pread,pwrite,mwrite;
assign pread=(addr[7]==1'b1)?1:0;
assign pwrite=(addr[7]==1'b1)?writeEN:0;
assign mwrite=writeEN & (addr[7] == 1'b0);

logic [31:0] readdata1,readdata2;
logic [11:0] led;

dmem dmem(.clk(clk),
.we(mwrite),
.a(addr),
.wd(writedata),
.rd(readdata1));

IO io(.clk(clk),
.reset(reset),
.pread(pread),
.pwrite(pwrite),
.addr(addr[3:2]),
.pwritedata(writedata[11:0]),
.preaddata(readdata2),
.buttonl(btnl),
.buttonr(btnr),
.switch(switch),
.led(led));

assign readdata = (addr[7]==1'b1)?readdata2:readdata1;

x7seg x7(
.reset(reset),
.data({switch,4'b0000,led}),
.an(an),
.a2g(a2g),
.clk(clk));
endmodule
