module comparator_over_10_4_bits(
	input [3:0]x,
	output reg z);
	
	always @(x) begin
		z = 0;
		if(x>9)
			z = 1;
	end
endmodule