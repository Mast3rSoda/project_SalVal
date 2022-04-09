module counter_N_bits
	#(parameter N=4)
	(input clk,aclr,enable,
	output reg [N-1:0] Q);
	
	always @(posedge clk, negedge aclr)
	if (!aclr) Q <= {N{1'b0}};
	else if (enable) Q <= Q + 1'b1;
	else Q <= Q;
endmodule