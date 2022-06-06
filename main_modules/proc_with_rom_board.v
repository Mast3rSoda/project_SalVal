module proc_with_rom_board(
	input [9:0] SW,
	input [1:0] KEY,
	output [9:0] LEDR);
	
	proc_with_rom proc(SW[9],SW[0],KEY[0],KEY[1],LEDR[8:0],LEDR[9]);
	
endmodule