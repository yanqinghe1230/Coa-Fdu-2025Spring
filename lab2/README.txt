以下是对每个目录中文件的说明：
dat目录下为用到的数据文件以及资源文件。
数据文件部分：memfile.dat用于测试基础指令，memfileext.dat用于测试拓展指令，TestIO.dat用于上板测试IO接口。
资源文件：Nexys4DDR_Master.xdc是用于上板测试的引脚锁定文件。

test目录下为用到的测试文件：
tb_mips.sv是用于测试基础指令及拓展指令的测试文件。

src目录下为实验源代码，包含MIPS处理器及含IO接口的MIPS处理器中的所有模块。
除模块文件外，还有两个top文件：top.sv是普通MIPS处理器的顶层文件，topio.sv是含IO接口的MIPS处理器的顶层文件。