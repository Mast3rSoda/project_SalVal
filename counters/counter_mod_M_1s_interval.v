module counter_mod_M_1s_interval #(parameter M=10)
	(input CLOCK_50,aclr,enable,
	output [N-1:0] Q);
	
	localparam intervalSize=clogb2(50000000);
	localparam N = clogb2(M);
	
	function integer clogb2(input [31:0] v);
		for (clogb2 = 0; v > 0; clogb2 = clogb2 + 1)
			v = v >> 1;
	endfunction
	
	wire [intervalSize-1:0] counter1_out /* synthesis keep */;
	wire enable_counter2;
	
	counter_mod_M #(50000000) counter1(CLOCK_50,aclr,enable,counter1_out);
	
	/* jesli 1 counter sie przekreci to enable na drugi */
	assign enable_counter2 = ~|counter1_out;
	
	counter_mod_M #(M) slowed_counter(CLOCK_50,aclr,enable_counter2,Q);
	
endmodule