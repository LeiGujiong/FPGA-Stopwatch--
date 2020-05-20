//将各模块组装

module stopwatch (clk_in,ps_in,rst_in,sys_rst_n_in);
//declare input
input clk_in;
input ps_in;
input rst_in;
input sys_rst_n_in;



//key test 
//ps key test
wire rst_en;
wire ps_en;
wire data_out_clk;

key_test ps_input(
.clk(clk_in),
.sys_rst_n(sys_rst_n_in),
.key_in(ps_in),
.key_en(ps_en)
);
//rst key test
key_test rst_input(
.clk(clk_in),
.sys_rst_n(sys_rst_n_in),
.key_in(rst_in),
.key_en(rst_en)
);

//ps part
wire clk_0;
switch ps(
.clk(ps_en),
.data_in(clk_in),
.sys_rst_n(sys_rst_n_in),
.data_out(clk_0)
);


//counter group
wire [3:0] num_0,num_1,num_2,num_3;
wire ci_0,ci0,ci1,ci2;
s_counter c_0(
.clk(clk_0),
.sys_rst_n(~(rst_en | ~sys_rst_n_in)),
.num_out(),
.ci(ci_0)
);
s_counter c0(
.clk(ci_0),
.sys_rst_n(~(rst_en | ~sys_rst_n_in)),
.num_out(num_0),
.ci(ci0)
);
s_counter c1(
.clk(ci0),
.sys_rst_n(~(rst_en | ~sys_rst_n_in)),
.num_out(num_1),
.ci(ci1)
);
s_counter c2(
.clk(ci1),
.sys_rst_n(~(rst_en | ~sys_rst_n_in)),
.num_out(num_2),
.ci(ci2)
);
s_counter c3(
.clk(ci2),
.sys_rst_n(~(rst_en | ~sys_rst_n_in)),
.num_out(num_3),
.ci()
);


//select part
wire [3:0] slet_out;
wire [1:0] led_ctrl;
selector s1(
.clk(clk_in),
.sys_rst_n(~(rst_en | ~sys_rst_n_in)),
.in0(num_0),
.in1(num_1),
.in2(num_2),
.in3(num_3),
.out(slet_out),
.bit(led_ctrl)
);

//led decoder controller

led_decoder_controller led_d_c(
.num_in(slet_out),
.sys_rst_n(~(rst_en | ~sys_rst_n_in)),
.ctrl_led(led_ctrl)
);

endmodule
