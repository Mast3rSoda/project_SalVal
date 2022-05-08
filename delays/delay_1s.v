module delay_1s(
	input CLOCK_50,aclr,enable,
	output Q);
	
	//50_000_000 - co sekunde przy clock_50
	localparam x=50_000_000;
	
	localparam intervalSize=clogb2(x);
	
	function integer clogb2(input [31:0] v);
		for (clogb2 = 0; v > 0; clogb2 = clogb2 + 1)
			v = v >> 1;
	endfunction
	
	wire [intervalSize-1:0] counter1_out;
	wire enable_counter2;
	
	counter_mod_M_rollover #(x) counter1(CLOCK_50,aclr,enable,counter1_out);
	
	assign enable_counter2=~|counter1_out;
	
	counter_mod_M_rollover #(2) counter2(CLOCK_50,aclr,enable_counter2,Q);
	
endmodule