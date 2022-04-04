module register_8_bit_with_areset(
	input clk, reset,
	input wire [7:0] data,
	output reg [7:0] out);
	
	always @(posedge clk, posedge reset)
		if (reset) out <= 0;
		else out <= data;
endmodule