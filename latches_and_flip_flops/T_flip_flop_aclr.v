module T_flip_flop_aclr(
	input clk,aclr,T,
	output reg Q);
	
	always@(posedge clk, negedge aclr)
		if(!aclr) Q<=1'b0;
		else if(T) Q<=~Q;
		else Q<=Q;
	
endmodule