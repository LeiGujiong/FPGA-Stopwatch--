//key_test mode
//if a key has been press for 10ms,it thinks it is enable
module key_test(clk,sys_rst_n,key_in,key_en); //input before,output after

//define parameter
parameter IDLE = 0;
parameter KEY_1ST = 1;
parameter KEY_2ND = 2;

//declare input
input clk;
input sys_rst_n;
input key_in;

//declare output
output key_en;

//declare reg
reg [1:0] stcur_key; //3 state,IDLE,KEY_1ST,KEY_2ND
reg [1:0] stnext_key;
reg [3:0] ms10_cnt_key;

//declare wire
wire ms10_en_key;

//state shift
always @(posedge clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
    stcur_key <= IDLE;
  else
    stcur_key <= stnext_key;
end

//creat a new state
always @(stcur_key or key_in or ms10_en_key)
begin
  case(stcur_key)
    IDLE:
      if(key_in)
	stnext_key <= KEY_1ST;
      else
	stnext_key <= IDLE;
    KEY_1ST:
      if(!key_in)
	stnext_key <= IDLE;
      else
	begin
	  if(ms10_en_key)
	    stnext_key <= KEY_2ND;
	  else
	    stnext_key <= KEY_1ST;
	end
    KEY_2ND:
      if(!key_in)
	stnext_key <= IDLE;
      else
	stnext_key <= KEY_2ND;
    default:stnext_key <= IDLE;
  endcase
end

//ceat output
always @(posedge clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
    ms10_cnt_key <= 4'd0;
  else
    begin
      case(stnext_key)
	IDLE: ms10_cnt_key <= 4'd0;
	KEY_1ST: ms10_cnt_key <= ms10_cnt_key + 1;
	KEY_2ND: ms10_cnt_key <= 4'd0;
	default: ms10_cnt_key <= 4'd0;
      endcase
    end
end

assign ms10_en_key = (ms10_cnt_key == 4'd10)?1:0;
assign key_en = (ms10_cnt_key == 4'd10)?1:0;

endmodule
