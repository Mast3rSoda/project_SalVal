module mux_4_1_2_bits (
	input [1:0]U,
	input [1:0]V,
	input [1:0]W,
	input [1:0]X,
	input [1:0]S,
	output [1:0]M);

	mux_4_1_1_bit m0(U[0],V[0],W[0],X[0],S[0],S[1],M[0]);
	mux_4_1_1_bit m1(U[1],V[1],W[1],X[1],S[0],S[1],M[1]);

endmodule