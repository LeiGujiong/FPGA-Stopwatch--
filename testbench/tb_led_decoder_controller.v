// testbench of led active display

`timescale 1ms/100us

module tb_led_decoder_controller;

//declare inputs to DUT
reg [3:0] num_in_tb;
reg sys_rst_n_tb;
reg [1:0] ctrl_led_tb;

//declare output
wire a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb,h_tb;
wire L0_tb,L1_tb,L2_tb,L3_tb; 

//instancing the DUT
led_decoder_controller u1(
.num_in(num_in_tb),
.sys_rst_n(sys_rst_n_tb),
.ctrl_led(ctrl_led_tb),
.a(a_tb),
.b(b_tb),
.c(c_tb),
.d(d_tb),
.e(e_tb),
.f(f_tb),
.g(g_tb),
.h(h_tb),
.L0(L0_tb),
.L1(L1_tb),
.L2(L2_tb),
.L3(L3_tb)
);

//creat num_in_tb
initial
  num_in_tb = 0;
  always
  begin
    #2 num_in_tb = 1;
    #3 num_in_tb = 2;
    #6 num_in_tb = 4;
    #7 num_in_tb = 5;
    #4 num_in_tb = 3;
    #6 num_in_tb = 4;
    #7 num_in_tb = 5;
    #9 num_in_tb = 6;
    #12 num_in_tb = 7;
    #2 num_in_tb = 8;
    #5 num_in_tb = 9;
    #1 num_in_tb = 0;
    #12 num_in_tb = 7;
    #6 num_in_tb = 4;
    #7 num_in_tb = 5;
    #9 num_in_tb = 6;
    #2 num_in_tb = 8;
    #5 num_in_tb = 9;
  end

//creat ctrl_led_tb
initial
  ctrl_led_tb = 0;
  always
  begin
    #2 ctrl_led_tb = 1;
    #3 ctrl_led_tb = 2;
    #6 ctrl_led_tb = 3;
    #7 ctrl_led_tb = 2;
    #4 ctrl_led_tb = 1;
    #6 ctrl_led_tb = 3;
    #7 ctrl_led_tb = 0;
    #9 ctrl_led_tb = 2;
    #12 ctrl_led_tb = 3;
    #2 ctrl_led_tb = 1;
    #5 ctrl_led_tb = 2;
    #1 ctrl_led_tb = 0;
    #12 ctrl_led_tb = 1;
    #6 ctrl_led_tb = 2;
    #7 ctrl_led_tb = 2;
    #9 ctrl_led_tb = 0;
    #2 ctrl_led_tb = 1;
    #5 ctrl_led_tb = 3;
  end
endmodule
