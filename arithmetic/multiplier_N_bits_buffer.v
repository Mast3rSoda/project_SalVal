module multiplier_N_bits_buffer #(parameter N=8)(
		input [N-1:0] data,
		input clk,aclr,EA,EB,
		output [N*2-1:0] P);
		
		wire [N-1:0] A,B;
		wire [N*2-1:0] multiplier_out;
		
		register_N_bits_ena_aclr #(N) regA(data,clk,aclr,EA,A);
		register_N_bits_ena_aclr #(N) regB(data,clk,aclr,EB,B);
	
		multiplier_N_bits #(N) multiplier(A,B,multiplier_out);
	
		register_N_bits_ena_aclr #(N*2) regP(multiplier_out,clk,aclr,1'b1,P);
		
endmodule