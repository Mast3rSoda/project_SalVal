module counter_T_4_bits_board(
	input KEY0,
	input [1:0]SW,
	output [6:0]HEX0);
	
	wire [3:0]counter_value;
	
	counter_T_4_bits(KEY0,SW[0],SW[1],counter_value);
	decoder_hex_16(counter_value,HEX0);
	
	
endmodule
	