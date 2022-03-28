module mux_2_1_4_bits (
	input  [3:0] X,
	input  [3:0] Y,
	input  s,
	output [3:0] M);
	
	mux_2_1_1_bit m0(X[0], Y[0], s, M[0]);
	mux_2_1_1_bit m1(X[1], Y[1], s, M[1]);
	mux_2_1_1_bit m2(X[2], Y[2], s, M[2]);
	mux_2_1_1_bit m3(X[3], Y[3], s, M[3]);

endmodule