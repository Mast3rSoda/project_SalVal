module binary_bcd_4_bits_board (
    input [3:0] SW,
    output [6:0] HEX0,
	 output [6:0] HEX1);
	 
	 binary_BCD_4_bits(SW,HEX0,HEX1);
endmodule
