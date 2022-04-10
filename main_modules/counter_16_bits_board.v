module counter_16_bits_board(
	input KEY0,
	input [1:0]SW,
	output [6:0]HEX0,HEX1,HEX2,HEX3);
	
	wire [15:0]counter_value;
	
	counter_N_bits #(16) counter(KEY0,SW[0],SW[1],counter_value);
	decoder_hex_16(counter_value%16,HEX0);
	decoder_hex_16(counter_value/16,HEX1);
	decoder_hex_16(counter_value/256,HEX2);
	decoder_hex_16(counter_value/4096,HEX3);
	
	
endmodule