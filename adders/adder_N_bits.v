module adder_N_bits #(parameter N=8)
	(input [N-1:0] A,B,
	input cin,
	output [N-1:0] S,
	output cout);
	
	assign {cout,S} = A + B + cin;
	
endmodule