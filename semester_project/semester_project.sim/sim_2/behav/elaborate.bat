@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 026277c8959e43358eb3f1c0c9f5f9fa -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot mul_tb_behav xil_defaultlib.mul_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
