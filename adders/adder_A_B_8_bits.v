module adder_A_B_8_bits(
	input [7:0] in,
	input clk,reset,
	output [7:0]S,
	output reg cout,
	output [7:0] A,B);
	
	wire [7:0] saved_number /* synthesis keep*/;
	
	reg_N_bits_areset #(8) register(clk,reset,in,saved_number);
	
	assign A = saved_number;
	assign B = in;
	
	wire [8:0] sum = in + saved_number /* synthesis keep*/;
	
	assign S = sum[7:0];
	
	always @(sum) begin
		cout = 0;
		if(sum>255)
			cout = 1;
	end
	
	
endmodule