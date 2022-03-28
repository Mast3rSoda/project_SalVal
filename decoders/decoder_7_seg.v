module decoder_7_seg (
	input [1:0]C,
	output reg [0:6]h);
	
always @*

	case (C)
		2'b00: h = 7'b0011000; //P
		2'b01: h = 7'b0001000; //A
		2'b10: h = 7'b0110000; //E
		2'b11: h = 7'b0000110; //3
	endcase
	
endmodule