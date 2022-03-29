module comparator_over_10_5_bits(
	input [4:0]x,
	output reg z);
	
	always @(x) begin
		z = 0;
		if(x>9)
			z = 1;
	end
endmodule