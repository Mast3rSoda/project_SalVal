module mux_2_1_4_bits (
	input  [7:0] SW, 
	input  KEY0,
	output [3:0] LEDR);
	
//	assign LEDR[0] = KEY0 ? SW[4] : SW[0];
//	assign LEDR[1] = KEY0 ? SW[5] : SW[1];
//	assign LEDR[2] = KEY0 ? SW[6] : SW[2];
//	assign LEDR[3] = KEY0 ? SW[7] : SW[3];
	
	assign LEDR[0] = (~KEY0 & SW[0]) | (KEY0 & SW[4]);
	assign LEDR[1] = (~KEY0 & SW[1]) | (KEY0 & SW[5]);
	assign LEDR[2] = (~KEY0 & SW[2]) | (KEY0 & SW[6]);
	assign LEDR[3] = (~KEY0 & SW[3]) | (KEY0 & SW[7]);
endmodule