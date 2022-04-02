module latch_RS_board(
       input [3:0]SW,
		 output LEDR0);
		 
		 latch_RS_boolean(SW[2],SW[1],SW[0],LEDR0);
		 
endmodule