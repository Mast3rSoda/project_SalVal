module counter_mod_M_rollover #(parameter M=20)
	(input clk,aclr,enable,
	output reg [N-1:0] Q,
	output rollover);
	
	localparam N=clogb2(M-1);
	
	function integer clogb2(input [31:0] v);
		for (clogb2 = 0; v > 0; clogb2 = clogb2 + 1)
			v = v >> 1;
	endfunction
	
	always @(posedge clk, negedge aclr)
		if (!aclr) 
			Q <= {N{1'b0}};
		else if (Q == M-1) 
			Q <= {N{1'b0}};
		else if (enable) 
			Q <= Q + 1'b1;
		else 
			Q <= Q;
		
	assign rollover = (Q == M-1);
		
endmodule