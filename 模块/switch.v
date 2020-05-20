//data in,then data out
//1 clk data_out is active,next 1 clk, data_out pause
module switch(clk,data_in,sys_rst_n,data_out);

//declare input
input clk;
input data_in;
input sys_rst_n;

reg Q;

//declare output
output data_out;


//T trigger ,T = 1
always @(posedge clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		Q <= 0;
	else
		Q <= ~Q;
end

//output
assign data_out = data_in & Q;


endmodule
