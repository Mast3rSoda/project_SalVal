module FSM_board(
	input [1:0]KEY,
	input [1:0] SW,
	output [9:0] LEDR);
	
	FSM_one_hot(~KEY[0],SW[0],SW[1],LEDR[9],LEDR[8:0]);
	
endmodule