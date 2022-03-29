module binary_BCD_4_bits(
	input [3:0]V,
	output [6:0]d0, d1);

	wire z;
	wire [3:0]A, M;
	
	comparator_over_10_4_bits c(V, z);
	subtract_10_4_bits cA(V,A);
	mux_2_1_4_bits m(V, A, z, M);
	binary_to_hex_decoder_1_bit b(z, d1);
	decoder_hex_10(M, d0);
	
endmodule