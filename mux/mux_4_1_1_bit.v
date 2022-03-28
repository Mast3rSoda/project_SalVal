module mux_4_1_1_bit(
	input u,
	input v,
	input w,
	input x,
	input S0,
	input S1,
	output m);
	
	wire [1:0]t;
	
	mux_2_1_1_bit m0(u, v, S0, t[0]);
	mux_2_1_1_bit m1(w, x, S0, t[1]);
	mux_2_1_1_bit m2(t[0], t[1], S1, m);
	
endmodule