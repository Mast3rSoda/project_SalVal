module bcd_to_dec_2_bits_on_board(
	input [7:0]SW, 
	output [9:0]LEDR,
	output [6:0]HEX0, HEX1);
	
	assign LEDR[7:0] = SW;
	
	bcd_to_dec_2_bits(SW[3:0], SW[7:4], LEDR[8], LEDR[9], HEX0, HEX1);
	
endmodule