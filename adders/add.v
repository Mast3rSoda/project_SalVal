module add (
	input X,
	input Y,
	input KEY0,
	output O);
	
	assign O = (~KEY0 & X) | (KEY0 & Y);
	
endmodule