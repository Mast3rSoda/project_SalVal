module real_time_clock_board(
	input CLOCK_50,
	input [0:3] KEY,
	input [7:0] SW,
	output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,
	output [7:0] LEDR,
	output LEDR9);
	
	real_time_clock clk(
		CLOCK_50,
		1'b1,
		KEY[0],
		~KEY[1],
		~KEY[2],
		~KEY[3],
		SW,
		HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,
		LEDR,
		LEDR9
	);
	
endmodule