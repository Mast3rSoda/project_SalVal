module counter_BCD_3_digits(
	input CLOCK_50,aclr,enable,
	output [6:0] H0,H1,H2,
	output max);
	
	wire [3:0] h0,h1,h2;
	wire c0,c1,c2;
	
	delay_1s delay(CLOCK_50,aclr,enable,c0);
	
	counter_mod_M_rollover #(10) counter0(c0,aclr,enable,h0,c1);
	counter_mod_M_rollover #(10) counter1(~c1,aclr,enable,h1,c2);
	counter_mod_M_rollover #(10) counter2(~c2,aclr,enable,h2,max);
	
	decoder_hex_10 dec0(h0,H0);
	decoder_hex_10 dec1(h1,H1);
	decoder_hex_10 dec2(h2,H2);
	
endmodule