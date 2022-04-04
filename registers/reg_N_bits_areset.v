module reg_N_bits_areset(
		input clk,reset,
		input [N-1:0] D,
		output reg [N-1:0] Q);
		
		parameter N=8;

		always @(posedge clk, posedge reset)
			if (reset)
				Q <= 0;
			else
				Q <= D;

	
endmodule	