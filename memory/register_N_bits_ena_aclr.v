module register_N_bits_ena_aclr #(parameter N=8)
	(input [N-1:0] D,
	input clk,aclr,enable,
	output reg[N-1:0] Q);
	
	always @(posedge clk,negedge aclr)
			if (!aclr) 		Q <= {N{1'b0}};
			else if (enable)	Q <= D;
			else				Q <= Q;
endmodule