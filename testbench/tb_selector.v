//testbench of selector

`timescale 1ms/100us

module tb_selector;

//declare inputs to DUT
reg clk_tb;
reg [3:0] in0_tb,in1_tb,in2_tb,in3_tb;
reg sys_rst_n_tb;

//declare output of DUT
wire [3:0] out_tb;
wire [1:0]bit_tb;

//instanceing the DUT
selector u1(
.clk(clk_tb),
.sys_rst_n(sys_rst_n_tb),
.in0(in0_tb),
.in1(in1_tb),
.in2(in2_tb),
.in3(in3_tb),
.out(out_tb),
.bit(bit_tb)
);

//creat clk 1kHz
initial
  clk_tb = 0;
  always
  begin
    #0.5 clk_tb = ~clk_tb;
  end

initial
begin
sys_rst_n_tb = 1;
#10 sys_rst_n_tb = 0;
#11 sys_rst_n_tb = 1;
end

//creat in0~3
  always
  begin
  in0_tb <= 1;
  in1_tb <= 2;
  in2_tb <= 3;
  in3_tb <= 4;
  #1
  in0_tb <= 2;
  in1_tb <= 5;
  in2_tb <= 3;
  in3_tb <= 1;
  #1
  in0_tb <= 3;
  in1_tb <= 9;
  in2_tb <= 7;
  in3_tb <= 3;
  #1
  in0_tb <= 2;
  in1_tb <= 2;
  in2_tb <= 6;
  in3_tb <= 0;

  end

endmodule
