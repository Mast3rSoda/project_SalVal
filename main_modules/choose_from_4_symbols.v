module choose_from_4_symbols(
	input [9:0]SW,
	output [9:0]LEDR,
	output [0:6]HEX0);

	wire [1:0] O;

	assign LEDR = SW;
	
	mux_4_1_2_bits(SW[1:0], SW[3:2], SW[5:4], SW[7:6], SW[9:8], O);
	decoder_7_seg_2_bits(O, HEX0);
	
endmodule