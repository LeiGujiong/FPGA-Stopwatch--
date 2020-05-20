//testbench of stopwatch

`timescale 10ms/100us

module tb_stopwatch;
//declare input to DUT
reg clk_tb;
reg ps_tb;
reg rst_tb;
reg sys_rst_n_tb;

//no output of DUT
stopwatch t1(
.clk_in(clk_tb),
.ps_in(ps_tb),
.rst_in(rst_tb),
.sys_rst_n_in(sys_rst_n_tb)
);


//creat sys_rst_n
initial
begin
	sys_rst_n_tb = 1;
	#0.1 sys_rst_n_tb = 0;
	#0.1 sys_rst_n_tb = 1;
end

//creat clk
initial
	clk_tb = 0;
	always
	begin
		#0.05 clk_tb = ~clk_tb;
	end

//creat ps
initial
	ps_tb = 0;
	always
	begin
		#1 ps_tb = 1;
		#0.9 ps_tb = 0; //useless 9ms
		#1 ps_tb = 1;
		#1 ps_tb = 0; //start
		#2 ps_tb = 1;
		#1.5 ps_tb = 0; //pause
		#100 ps_tb = 1;
		#1.2 ps_tb = 0; //start
		#10000;
	end
//creat rst
initial
	rst_tb = 0;
	always
	begin
	#10 rst_tb = 1;
	#0.7 rst_tb = 0; //useless
	#5 rst_tb = 1;
	#1 rst_tb = 0; //reset
	#10000;
	end
	

endmodule
