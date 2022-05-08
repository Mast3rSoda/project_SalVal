module counter_BCD_3_digits_board(
	input CLOCK_50,KEY0,
	output [6:0]HEX0,HEX1,HEX2,
	output LEDR0);
	
	counter_BCD_3_digits(CLOCK_50,1'b1,KEY0,HEX0,HEX1,HEX2,LEDR0);
	
endmodule