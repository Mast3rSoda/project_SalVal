module adder_BCD_2_digits_b_board(
	input [8:0]SW,
	output [6:0]HEX0,HEX1,HEX3,HEX5,
	output [7:0]LEDR,
	output LEDR9);
	
	assign LEDR[7:0] = SW[7:0];
	
	adder_BCD_2_digits_b(SW[7:4],SW[3:0],SW[8],HEX5[6:0],HEX3[6:0],HEX0[6:0],HEX1[6:0],LEDR9);
	
endmodule