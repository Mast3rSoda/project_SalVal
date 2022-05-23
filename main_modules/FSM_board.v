module FSM_board(
	input KEY0,
	input [1:0] SW,
	output [9:0] LEDR);
	
	FSM_user_coding(KEY0,SW[0],SW[1],LEDR[9],LEDR[8:0]);
	
endmodule