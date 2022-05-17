module multiplier_8_bits_buffer_board(
		input [7:0] SW,
		input KEY1,KEY0,SW9,SW8,
		output [6:0] HEX3,HEX2,HEX1,HEX0,
		output [7:0] LEDR);
		
		wire [15:0]result;
		
		multiplier_N_bits_buffer #(8)(SW,KEY1,~KEY0,SW9,SW8,result);
		
		decoder_hex_16 d0(result[3:0],HEX0);
		decoder_hex_16 d1(result[7:4],HEX1);
		decoder_hex_16 d2(result[11:8],HEX2);
		decoder_hex_16 d3(result[15:12],HEX3);
		
		assign LEDR = SW;
		
		
endmodule