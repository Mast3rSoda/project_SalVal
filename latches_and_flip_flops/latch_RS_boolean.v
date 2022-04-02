module latch_RS_boolean(
	input Clk,R,S,
	output Q);
	wire R_g,S_g,Qa,Qb;
	assign R_g = R & Clk;
	assign S_g = S & Clk;
	assign Qa = ~(R_g | Qb);
	assign Qb = ~(S_g | Qa);
	assign Q = Qa;
endmodule