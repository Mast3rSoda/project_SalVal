module counter_mod_10_1s_interval_board
	(input CLOCK_50,
	input [1:0]SW,
	output [6:0]HEX0);
	
	wire [3:0]counter;
	
	counter_mod_M_1s_interval #(10)(CLOCK_50,SW[0],SW[1],counter);
	decoder_hex_10(counter,HEX0);
	
endmodule