`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/16 21:03:15
// Design Name: 
// Module Name: maindec
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


module maindec(input logic clk,input logic reset,
                   input logic [5:0] op,
                   output logic pcwrite, memwrite, irwrite, regwrite,
                   output logic alusrca, branch,branchbne, iord, memtoreg, regdst,
                   output logic [1:0] alusrcb, pcsrc, 
                   output logic [2:0] aluop,
                   output logic immext);

localparam FETCH = 4'b0000;//State 0
localparam DECODE = 4'b0001;// State l
localparam MEMADR = 4'b0010;// State 2
localparam MEMRD = 4'b0011;// State 3
localparam MEMWB = 4'b0100;// State 4
localparam MEMWR = 4'b0101;// State 5
localparam RTYPEEX = 4'b0110;// State 6
localparam RTYPEWB = 4'b0111;// State 7
localparam BEQEX = 4'b1000;// State 8
localparam ADDIEX = 4'b1001;// State 9
localparam IWB = 4'b1010;// state 10
localparam JEX = 4'b1011;// State 1l
localparam BNEEX = 4'b1100;// State 12
localparam ANDIEX = 4'b1101;// State 13
localparam ORIEX = 4'b1110;// state 14
localparam SLTIEX=4'b1111;

localparam LW = 6'b100011;// Opcode for lw
localparam SW = 6'b101011;// Opcode for sw
localparam RTYPE = 6'b000000;// Opcode for R-type
localparam BEQ = 6'b000100;//Opcode for beq
localparam BNE = 6'b000101;//Opcode for bne
localparam ADDI = 6'b001000;//Opcode for addi
localparam ANDI = 6'b001100;//Opcode for andi
localparam ORI = 6'b001101;//Opcode for ori
localparam SLTI=6'b001010; //opcode for slti
localparam J = 6'b000010;// Opcode for j
logic [3:0] state, nextstate;
logic[17:0] controls;

// state register
always_ff@(posedge clk or posedge reset)
         if (reset)
             state <= FETCH;
else
    state <= nextstate;

//next state logic
always_comb case(state)
                FETCH:
                    nextstate = DECODE;
                DECODE:
                case(op)
                    LW:
                        nextstate = MEMADR;
                    SW:
                        nextstate = MEMADR;
                    RTYPE:
                        nextstate = RTYPEEX;
                    BEQ:
                        nextstate = BEQEX;
                    BNE:
                        nextstate = BNEEX;
                    ADDI:
                        nextstate = ADDIEX;
                    ANDI:
                        nextstate = ANDIEX;  
                    ORI:
                        nextstate = ORIEX;
                    SLTI:
                        nextstate=SLTIEX;                                              
                    J:
                        nextstate = JEX;
                    default:
                        nextstate = 5'bx; //never happen
                endcase
                MEMADR:
                case (op)
                    LW:
                        nextstate = MEMRD;
                    SW:
                        nextstate = MEMWR;
                    default:
                        nextstate = 4'bx;
                endcase
                MEMRD:
                    nextstate = MEMWB;
                MEMWB:
                    nextstate = FETCH;
                MEMWR:
                    nextstate = FETCH;
                RTYPEEX:
                    nextstate = RTYPEWB;
                RTYPEWB:
                    nextstate = FETCH;
                BEQEX:
                    nextstate = FETCH;
                BNEEX:
                    nextstate = FETCH;                    
                ADDIEX:
                    nextstate = IWB ;
                ANDIEX:
                    nextstate = IWB ;
                ORIEX:
                    nextstate = IWB ;
                IWB:
                    nextstate = FETCH;
                JEX:
                    nextstate = FETCH;
                default:
                    nextstate = 4'bx; // never happen
            endcase
            // output logic
            assign  {immext,branchbne,pcwrite, memwrite,irwrite,regwrite,
                     alusrca,branch,iord,memtoreg,regdst,
                     alusrcb,pcsrc,aluop} = controls;

always_comb case(state)
                FETCH:
                    controls = 18'h0A020;
                DECODE:
                    controls = 18'h00060;
                MEMADR:
                    controls = 18'h00840;
                MEMRD:
                    controls = 18'h00200;
                MEMWB:
                    controls = 18'h01100;
                MEMWR:
                    controls = 18'h04200;
                RTYPEEX:
                    controls = 18'h00802;
                RTYPEWB:
                    controls = 18'h01080;
                BEQEX:
                    controls = 18'h00c09;
                BNEEX:
                    controls = 18'h10809;
                ADDIEX:
                    controls = 18'h00840;
                IWB:
                    controls = 18'h01000;
                ANDIEX:
                    controls = 18'h20844;
                ORIEX:
                    controls = 18'h20843;
                SLTIEX:
                    controls=18'h20845;
                JEX:
                    controls = 18'h08010;
                default:
                    controls = 18'hxxxxx; // never happen
            endcase
            endmodule

