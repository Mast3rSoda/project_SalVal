module array_multiplier_4_bits_board(
	input [7:0]SW,
	output [7:0]LEDR,
	output [6:0] HEX0,HEX2,HEX4,HEX5);
	
	assign LEDR = SW;
	
	wire [7:0]out;
	
	array_multiplier_4_bits(SW[7:4],SW[3:0],out);
	
	decoder_hex_16 A(SW[7:4],HEX2);
	decoder_hex_16 B(SW[3:0],HEX0);
	
	decoder_hex_16 P0(out % 16,HEX4);
	decoder_hex_16 P1(out / 16,HEX5);
	
endmodule