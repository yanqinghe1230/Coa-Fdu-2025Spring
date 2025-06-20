`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/04 03:55:52
// Design Name: 
// Module Name: x7seg
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


module x7seg( input  logic [31:0] data,
              input  logic        reset,
              input  logic        clk,
              output logic [6:0]  a2g,
              output logic [7:0]  an
              ); 
    
    logic [2:0] s;     
    logic [3:0] digit; 
    logic [19:0] clkdiv;
    
    assign s = clkdiv[19:17];
    
    //8个数码管 8选1 
    always_comb
            case(s) 
              0:  digit = data[3:0];
              1:  digit = data[7:4];
              2:  digit = data[11:9];
              3:  digit = 4'b1111;
              4:  digit = data[19:16];
              5:  digit = data[23:20];
              6:  digit = data[27:24];
              7:  digit = data[31:28];
              default: digit = 4'b0000;
              endcase
          
    //7段数码管的使能
    always_comb
        case(s)
            0:  an = 8'b11111110; 
            1:  an = 8'b11111101;
            2:  an = 8'b11111011;
            3:  an = 8'b11110111;
            4:  an = 8'b11101111;
            5:  an = 8'b11011111;
            6:  an = 8'b10111111;
            7:  an = 8'b01111111; 
            default: an = 8'b11111111;
        endcase
        
    // 时钟分频器（20位二进制计数器）
   always @(posedge clk) begin
        clkdiv <= clkdiv + 1;      // 时钟分频器
    end
    Hex7Seg H7(.digit(digit), .a2g(a2g));      
endmodule
