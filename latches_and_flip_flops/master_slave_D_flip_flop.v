module master_slave_D_flip_flop(
	input Clk,D,
	output Q);
	
	wire Qm /*synthesis keep*/;
	
	
	latch_D master(~Clk,D,Qm);
	
	
	latch_D slave(Clk,Qm,Q);
	
endmodule