module bcd_to_dec_2_bits(
	input [3:0]a0, a1,
	output reg error_a0, error_a1,
	output [6:0]o_a0, o_a1);
		
		always @(a0 or a1) begin
			error_a0 = 0;
			error_a1 = 0;
			
			if (a0 > 4'b1001)
				error_a0 = 1;
			if (a1 > 4'b1001)
				error_a1 = 1;
			end
			
			decoder_hex_10 d0(a0[3:0], o_a0);
			decoder_hex_10 d1(a1[3:0], o_a1);

endmodule
		