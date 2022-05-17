module accumulator_N_bits_struct #(parameter N=8)
	(input clk,aclr,
	input [N-1:0] A,
	output [N-1:0] S,
	output overflow,carry);	
	
	wire [N-1:0] B,C;
	wire cout,over;
	
	reg_N_bits_areset #(N) reg1(clk,aclr,A,B);
	ripple_carry_adder #(N) adder1(B,S,1'b0,C,cout);
	reg_N_bits_areset #(N) reg2(clk,aclr,C,S);
	flip_flop_D_posedge ffd_carry(clk,cout,carry);
	assign over = cout ^ C[N-1];
	flip_flop_D_posedge ffd_over(clk,over,overflow);
	
endmodule