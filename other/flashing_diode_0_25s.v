module flashing_diode_0_25s(
	input CLOCK_50,
	output reg [7:0] out);
	
	wire c,counter_value;
	
	delay_0_25s delay(CLOCK_50,1'b1,1'b1,c);
	
	counter_mod_M_rollover #(2) counter(c,1'b1,1'b1,counter_value);
	
	always @(counter_value) begin
		case(counter_value) 
			1'b1:
				out=8'b11111111;
			1'b0:
				out=8'b00000000;
		endcase
	end
	
endmodule