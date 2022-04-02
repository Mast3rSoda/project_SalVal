module latch_D(
	input Clk,D,
	output Q);
	wire S,R,S_g,R_g,Qa,Qb;
	assign S = D;
	assign R = ~D;
	assign S_g = ~(S & Clk);
	assign R_g = ~(R & Clk);
	assign Qa = ~(S_g & Qb);
	assign Qb = ~(R_g & Qa);
	assign Q = Qa;
endmodule