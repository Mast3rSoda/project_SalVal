module accumulator_N_bits_board
	(input KEY1,KEY0,
	input [7:0] SW,
	output [7:0] LEDR,
	output LEDR9,LEDR8,
	output HEX0,HEX1,HEX2,HEX3);
	
	wire [3:0] A1,A0,S1,S0;
	
	assign {A1,A0} = SW;
	assign {S1,S0} = LEDR;

	accumulator_N_bits_struct #(8) (~KEY1,~KEY0,SW,LEDR,LEDR9,LEDR8);
	
	decoder_hex_16 a1(A1,HEX3);
	decoder_hex_16 a0(A0,HEX2);
	
	decoder_hex_16 s1(S1,HEX1);
	decoder_hex_16 s0(S0,HEX0);
	
endmodule	