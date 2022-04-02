module latch_D_board(
			input [1:0]SW,
			output LEDR0);
			
			latch_D(SW[1],SW[0],LEDR0);
			
endmodule