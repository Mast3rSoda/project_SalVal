module adder_A_B_8_bits(
	input [7:0] in,
	input areset, clk,
	output [6:0] oA1, oA2, oB1, oB2, oS1, oS2,
	output reg cout);
	
	wire [7:0]data /* synthesis keep*/;
	
	register_8_bit_with_areset r0(clk, areset, in, data);
	
	decoder_hex_16 dB1((data/16), oA1);
	decoder_hex_16 dB2((data%16), oA2);
	decoder_hex_16 dA1((in/16), oB1);
	decoder_hex_16 dA2((in%16), oB2);
	
	always @(in or data) begin
		cout = 0;
		if((in + data) > 255)
			cout = 1;
	end
		
	wire [7:0] sum = in + data /* synthesis keep*/;
	
	decoder_hex_16 dS1((sum/16), oS1);
	decoder_hex_16 dS2((sum%16), oS2);
	
endmodule