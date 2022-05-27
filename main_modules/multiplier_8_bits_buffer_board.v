module multiplier_8_bits_buffer_board(
		input [9:0] SW,
		input KEY0,KEY1,
		output [6:0] HEX0,HEX1,HEX2,HEX3,
		output [15:0]result);
		
//		wire [15:0]result;
		
		multiplier_N_bits_buffer #(8) 
			multiplier(SW[7:0],~KEY1,~KEY0,SW[9],SW[8],result);
		
		decoder_hex_16 d0(result[3:0],HEX0);
		decoder_hex_16 d1(result[7:4],HEX1);
		decoder_hex_16 d2(result[11:8],HEX2);
		decoder_hex_16 d3(result[15:12],HEX3);
		
endmodule