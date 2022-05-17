module add_subtract#(parameter N=8)
	(input clk,aclr,add_sub,
	input [N-1:0] A,
	output reg [N-1:0] S,
	output reg overflow,carry);	
	
	reg [N-1:0] B;
	
	always @(posedge clk, posedge aclr)
		if (aclr)	B <= {N{1'b0}};
      else			B <= A;
		
   always @(posedge clk, posedge aclr)
      if (aclr)			{carry,S} <= {(N+1){1'b0}};
      else if(!add_sub)	{carry,S} <= S + B;
		else					{carry,S} <= S - B;
		
   always @(posedge clk, posedge aclr)
      if (aclr)	overflow = 1'b0;
      else			overflow = carry ^ S[N-1];
	
endmodule