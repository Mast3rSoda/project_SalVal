module master_slave_D_flip_flop_board(
			input [1:0]SW,
			output LEDR0);
			
			master_slave_D_flip_flop(SW[1],SW[0],LEDR0);
			
endmodule