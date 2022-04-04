module master_slave_D_b_flip_flop(
	input Clk,D,
	output Q);
	
	wire Qm;
	
	latch_D_b master(~Clk,D,Qm);
	
	latch_D_b slave(Clk,Qm,Q);
	
endmodule