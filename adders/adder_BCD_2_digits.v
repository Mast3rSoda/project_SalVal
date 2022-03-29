module adder_BCD_2_digits(
	input [3:0]X, Y,
	input cin,
	output [6:0]o_X, o_Y, S0, S1,
	output reg error);
	
	decoder_hex_10 d0(X, o_X);
	decoder_hex_10 d1(Y, o_Y);
	
	always @(X or Y) begin
		error = 0;
		if (X > 9 || Y > 9)
			error = 1;
	end
	
	wire [4:0] sum = X + Y + cin;
	wire [3:0] A, M;	
	
	comparator_over_10_5_bits c(sum, z);
	subtract_10_5_bits cB(sum,A);
	mux_2_1_4_bits m(sum[3:0], A, z, M);
	binary_to_hex_decoder_1_bit b(z, S1);
	decoder_hex_10(M, S0);
	
endmodule