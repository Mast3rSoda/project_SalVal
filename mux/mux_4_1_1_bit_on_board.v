module mux_4_1_1_bit_on_board(
	input [3:0]SW,
	input [1:0]KEY,
	output LEDR0);
	
	mux_4_1_1_bit m0(SW[0],SW[1],SW[2],SW[3], KEY[0], KEY[1], LEDR0);
	
endmodule