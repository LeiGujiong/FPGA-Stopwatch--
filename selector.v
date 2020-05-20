//4 input 1 output
//per 5ms change the output
//clk T = 1ms
module selector (clk,sys_rst_n,in0,in1,in2,in3,out,bit);

//define parameter
parameter DATA0 = 0;
parameter DATA1 = 1;
parameter DATA2 = 2;
parameter DATA3 = 3;

//declare input
input clk;
input [3:0] in0,in1,in2,in3;
input sys_rst_n;

//declare output
output [3:0] out;
output [1:0] bit;

//declare reg
reg [1:0] stcur;
reg [1:0] stnext;
reg [2:0] ms5_cnt = 0;
reg [3:0] out;

// output can be defined reg it doesn't need to define bit_reg
reg [1:0] bit_reg;

wire ms5_en;

//state shift
always @(posedge clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
    stcur <= DATA0;
  else
    stcur <= stnext;
end

//creat a new state
always @(ms5_en or negedge sys_rst_n or stcur)
begin
  if(!sys_rst_n)
    stnext <= DATA0;
  case(stcur)
    DATA0:
      if(ms5_en)
	stnext <= DATA1;
      else
	stnext <= DATA0;
    DATA1:
      if(ms5_en)
	stnext <= DATA2;
      else
	stnext <= DATA1;
    DATA2:
      if(ms5_en)
	stnext <= DATA3;
      else
	stnext <= DATA2;
    DATA3:
      if(ms5_en)
	stnext <= DATA0;
      else
	stnext <= DATA3;
  endcase
end

//creat output
always @(posedge clk)
begin
  case(stnext)
    DATA0:
    begin
      if(ms5_en)
      begin
        out <= in0;
        ms5_cnt = 0;
        bit_reg <= 0;
      end
      else
      begin
        out <= in0;
        ms5_cnt <= ms5_cnt + 1;
        bit_reg <= 0;
      end
    end
    DATA1:
    begin
      if(ms5_en)
      begin
        out <= in1;
        ms5_cnt = 0;
        bit_reg <= 1;
      end
      else
      begin
        out <= in1;
        ms5_cnt <= ms5_cnt + 1;
        bit_reg <= 1;
      end
    end
    DATA2:
    begin
      if(ms5_en)
      begin
        out <= in2;
        ms5_cnt = 0;
        bit_reg <= 2;
      end
      else
      begin
        out <= in2;
        ms5_cnt <= ms5_cnt + 1;
        bit_reg <= 2;
      end
    end
    DATA3:
    begin
      if(ms5_en)
      begin
        out <= in3;
        ms5_cnt = 0;
        bit_reg <= 3;
      end
      else
      begin
        out <= in3;
        ms5_cnt <= ms5_cnt + 1;
        bit_reg <= 3;
      end
    end
  endcase
end

assign ms5_en = (ms5_cnt == 3'd4)?1:0;
assign bit = bit_reg;

endmodule
