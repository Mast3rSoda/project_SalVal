module move_word_4_chars_board(
	input CLOCK_50,
	input [2:0]SW,
	output [6:0] HEX0,HEX1,HEX2,HEX3);
	
	move_word_4_chars(CLOCK_50,SW[0],SW[1],SW[2],HEX0,HEX1,HEX2,HEX3);
	
	
endmodule