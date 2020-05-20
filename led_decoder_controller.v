//led active display
//this mode is used to decode input number to led and contoll the display of led
//common cathode digital tube
//I disign it to be a combine logic circuit mode
module led_decoder_controller (num_in,sys_rst_n,ctrl_led,a,b,c,d,e,f,g,h,L0,L1,L2,L3);

//declare input
input [3:0] num_in;
input sys_rst_n;
input [1:0] ctrl_led;

//declare output
output a,b,c,d,e,f,g,h;
output L0,L1,L2,L3;

reg L0 = 1; // low enable
reg L1 = 1;
reg L2 = 1;
reg L3 = 1;
reg a = 0,b = 0,c = 0,d = 0,e = 0,f = 0,g = 0,h = 0;

always @(ctrl_led or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  begin
    a <= 0;b <= 0;c <= 0;d <= 0;e <= 0;f <= 0;g <=0;
    L0 = 1;
    L1 = 1;
    L2 = 1;
    L3 = 1;
  end
  else
  begin
    //decoder input number
    case(num_in)
      0:begin
          a <= 1;b <= 1;c <= 1;d <= 1;e <= 1;f <= 1;g <=0;
        end 
      1:begin 
  	  a <= 0;b <= 1;c <= 1;d <= 0;e <= 0;f <= 0;g <=0;
        end
      2:begin 
  	  a <= 1;b <= 1;c <= 0;d <= 1;e <= 1;f <= 0;g <=1;
        end
      3:begin
	  a <= 1;b <= 1;c <= 1;d <= 1;e <= 0;f <= 0;g <=1;
        end
      4:begin
	  a <= 0;b <= 1;c <= 1;d <= 0;e <= 0;f <= 1;g <=1;
        end
      5:begin
	  a <= 1;b <= 0;c <= 1;d <= 1;e <= 0;f <= 1;g <=1;
        end
      6:begin 
	  a <= 0;b <= 0;c <= 1;d <= 1;e <= 1;f <= 1;g <=1;
        end
      7:begin
	  a <= 1;b <= 1;c <= 1;d <= 0;e <= 0;f <= 0;g <=0;
        end
      8:begin
	  a <= 1;b <= 1;c <= 1;d <= 1;e <= 1;f <= 1;g <=1;
        end
      9:begin
	  a <= 1;b <= 1;c <= 1;d <= 0;e <= 0;f <= 1;g <=1;
        end
    endcase
  //decide whic led should be lighted
    case(ctrl_led)
      0:
      begin
        L0 = 0;
        L1 = 1;
        L2 = 1;
        L3 = 1;
      end
      1:
      begin
        L0 = 1;
        L1 = 0;
        L2 = 1;
        L3 = 1;
      end
      2:
      begin
        L0 = 1;
        L1 = 1;
        L2 = 0;
        L3 = 1;
      end
      3:
      begin
        L0 = 1;
        L1 = 1;
        L2 = 1;
        L3 = 0;
      end
    endcase
  end
end

endmodule
