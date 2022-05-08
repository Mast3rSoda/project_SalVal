module real_time_clock(
	input CLOCK_50,aclr,enable,load_ms,load_s,load_min,
	input [7:0] data,
	output [6:0] H0,H1,H2,H3,H4,H5,
	output [7:0] led,
	output max);
	
	wire [4:0] ms0,ms1,s0,min0;
	wire [3:0] s1,min1;
	wire c0,c1,c2,c3,c4,c5;
	
	delay_10ms delay(CLOCK_50,aclr,enable,c0);
	
	counter_mod_M_rollover_aload #(10) counter0(c0,aclr,enable,load_ms,data[3:0],ms0,c1);
	counter_mod_M_rollover_aload #(10) counter1(~c1,aclr,1'b1,load_ms,data[7:4],ms1,c2);
	counter_mod_M_rollover_aload #(10) counter2(~c2,aclr,1'b1,load_s,data[3:0],s0,c3);
	counter_mod_M_rollover_aload #(6) counter3(~c3,aclr,1'b1,load_s,data[7:4],s1,c4);
	counter_mod_M_rollover_aload #(10) counter4(~c4,aclr,1'b1,load_min,data[3:0],min0,c5);
	counter_mod_M_rollover_aload #(6) counter5(~c5,aclr,1'b1,load_min,data[7:4],min1,max);

	decoder_hex_10 dec0(ms0,H0);
	decoder_hex_10 dec1(ms1,H1);
	decoder_hex_10 dec2(s0,H2);
	decoder_hex_10 dec3({1'b0,s1},H3);
	decoder_hex_10 dec4(min0,H4);
	decoder_hex_10 dec5({1'b0,min1},H5);
	
	assign led = data;
	
endmodule