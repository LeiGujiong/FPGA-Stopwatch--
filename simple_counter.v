//simplified counter
//num_out = 0~9
module s_counter (clk,sys_rst_n,num_out,ci);

//declare input
input clk;
input sys_rst_n;

//declare output
output [3:0] num_out;
output ci;

//declare reg
reg [3:0] num_out;
reg ci;

always @(posedge clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		num_out <= 4'd0;
		ci <= 0;
	end
	else
	begin
		if(num_out == 9)
		begin
			num_out <= 4'd0;
			ci <= 1;
		end
		else
		begin
			num_out <= num_out + 1;
			ci <= 0;
		end
	end
end
endmodule
