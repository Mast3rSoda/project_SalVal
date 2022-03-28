module mux_4_1_2_bits_on_board (
	input [7:0]SW,
	input [1:0]KEY,
	output [1:0]LEDR);

	mux_4_1_2_bits m0(SW[1:0], SW[3:2], SW[5:4], SW[7:6], KEY[1:0], LEDR[1:0]);

endmodule