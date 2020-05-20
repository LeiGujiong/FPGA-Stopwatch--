//testbench of key_test

`timescale 1ms/100us;

module tb_key_test;

//declare input to DUT
reg clk_tb;
reg sys_rst_n_tb;
reg key_in_tb;

//declare output of DUT
wire key_en_tb;

//instancing the DUT
key_test u1 (
.clk(clk_tb),
.sys_rst_n(sys_rst_n_tb),
.key_in(key_in_tb),
.key_en(key_en_tb)
);

//creat 1KHz clock
initial
  clk_tb = 1'b0;
  always
  begin
    #0.5 clk_tb = ~clk_tb;
    #0.5 clk_tb = ~clk_tb;
  end

//key_in
initial
  key_in_tb = 1'b0;
  always
  begin
  #100 key_in_tb = 1'b1;
  #15 key_in_tb = 1'b0;
  #50 key_in_tb = 1'b1;
  #5 key_in_tb = 1'b0;
  #50 key_in_tb = 1'b1;
  #8 key_in_tb = 1'b0;
  #15 key_in_tb = 1'b1;
  #10 key_in_tb = 1'b0;
  end

//key_rst_n
initial
sys_rst_n_tb = 1'b1;

//key_

endmodule
