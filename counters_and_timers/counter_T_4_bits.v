module counter_T_4_bits(
	input clk,aclr,enable,
	output [3:0] Q);
	
	wire [3:1] c;
	
	assign c[1] = Q[0] & enable;
	assign c[2] = Q[1] & c[1];
	assign c[3] = Q[2] & c[2];
	
	T_flip_flop_aclr ex0(clk,aclr,enable,Q[0]);
	T_flip_flop_aclr ex1(clk,aclr,c[1],Q[1]);
	T_flip_flop_aclr ex2(clk,aclr,c[2],Q[2]);
	T_flip_flop_aclr ex3(clk,aclr,c[3],Q[3]);
endmodule
