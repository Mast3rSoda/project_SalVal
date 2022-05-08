module counter_mod_M_rollover_board
	(input CLOCK_50,KEY1,KEY2,
	output [4:0] LEDR,
	output LEDR9);
	
	counter_mod_M_rollover #(20) (CLOCK_50,KEY1,KEY2,LEDR,LEDR9);
	
	
endmodule