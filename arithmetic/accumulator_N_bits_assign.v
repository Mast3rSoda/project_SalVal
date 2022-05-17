module accumulator_N_bits_assign #(parameter N=8)
	(input clk,aclr,
	input [N-1:0] A,
	output reg [N-1:0] S,
	output reg overflow,carry);	
	
	reg [N-1:0] B;
	
	always @(posedge clk, posedge aclr)
		if (aclr)
			B <= {N{1'b0}};
      else
			B <= A;
   always @(posedge clk, posedge aclr)
      if (aclr)
			{carry,S} <= {(N+1){1'b0}};
      else
			{carry,S} <= B + S;
   always @(posedge clk, posedge aclr)
      if (aclr)
			overflow = 1'b0;
      else
			overflow = carry ^ S[N-1];
	
endmodule