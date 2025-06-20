        module datapath(
            input logic clk,reset,
            input logic memtoreg,
            input logic [1:0]pcsrc,
            input logic alusrca,
            input logic [1:0]alusrcb,
            input logic regdst,regwrite,
            input logic [2:0]alucontrol,
            output logic zero,
            output logic [31:0] pc,
            input logic [31:0]instr,
            output logic [31:0]adr,writedata,
            input logic [31:0]readdata,
            input logic pcen,immext
        );
logic [4:0]writereg;
logic [31:0]pcnext,pcjump;
logic [31:0]signimm,signimmsh,zeroimm,imm;
logic [31:0]rd1,rd2,a,srca,srcb,aluresult,aluout,data,wd3;
assign adr=aluout;
flopenr #(32) pcreg(clk,reset,pcen,pcnext,pc);
sl2 immsh(signimm,signimmsh);
regfile rf(clk,regwrite,instr[25:21],instr[20:16],writereg,wd3,rd1,rd2);
flopr2 #(32) f1(clk,reset,rd1,rd2,a,writedata);
mux2 #(5) wrmux(instr[20:16],instr[15:11],regdst,writereg);
signext se(instr[15:0],signimm);
zeroext ze(instr[15:0],zeroimm);
mux2#(32) extmux(signimm,zeroimm,immext,imm);
alu alu(srca,srcb,alucontrol,aluresult,zero);
flopr #(32) f2(clk,aluresult,aluout);
flopr #(32) f3(clk,readdata,data);
mux2 #(32) datamux(aluout,data,memtoreg,wd3);
mux2 #(32) srcamux(pc,a,alusrca,srca);
mux4 #(32) srcbmux(writedata,4,imm,signimmsh,alusrcb,srcb);
assign pcjump={pc[31:28],instr[25:0],2'b00};
mux4#(32) pcmux(aluresult,aluout,pcjump,0,pcsrc,pcnext);
endmodule