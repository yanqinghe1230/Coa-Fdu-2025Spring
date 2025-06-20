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


module top(input clk,reset,
           output [31:0] writedata,dataadr,
           output memwrite
          );
wire [31:0] pc,readdata1,readdata2;
reg [31:0] readdata;
logic iord;

mips mips(clk,reset,pc,memwrite,dataadr,writedata,readdata,iord);
imem imem(pc[7:2],readdata1);
dmem dmem(clk,memwrite,dataadr,writedata,readdata2);
mux2#(32) muxreaddata(readdata1,readdata2,iord,readdata);

endmodule
