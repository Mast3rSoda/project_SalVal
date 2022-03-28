module mux_2_1_4_bits_on_board(
	input [7:0]SW,
	input KEY0,
	output [3:0]LEDR);
	
	mux_2_1_4_bits m0(SW[3:0], SW[7:4], KEY0, LEDR);
	
endmodule