module adder_A_B_8_bits_board(
		input [7:0]SW,
		input [1:0]KEY,
		output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,
		output LEDR0);
		
		wire[7:0] sum,A,B;
		adder_A_B_8_bits adder(SW,KEY[1],KEY[0],sum,LEDR0,A,B);
		
		decoder_hex_16 hA1((A/16),HEX3);
		decoder_hex_16 hA2((A%16),HEX2);
		
		decoder_hex_16 hB1((B/16),HEX1);
		decoder_hex_16 hB2((B%16),HEX0);
		
		decoder_hex_16 hS1((sum/16),HEX5);
		decoder_hex_16 hS2((sum%16),HEX4);
	
endmodule