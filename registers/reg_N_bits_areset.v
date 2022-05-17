module reg_N_bits_areset #(parameter N=8)
	  (input clk,reset,
		input [N-1:0] D,
		output reg [N-1:0] Q);

		always @(posedge clk, posedge reset)
			if (reset)
				Q <= 0;
			else
				Q <= D;

	
endmodule	