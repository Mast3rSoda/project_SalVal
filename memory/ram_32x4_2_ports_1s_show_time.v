module ram_32x4_2_ports_1s_show_time(
	input CLOCK_50,
	input [4:0] write_addr,
	input [3:0] data,
	input write,
	input reset,
	input enable,
	output [4:0] read_addr,
	output [3:0] out);
	
	wire counter_enable;
	
	delay_1s delay(CLOCK_50,reset,enable,counter_enable);
	
	counter_N_bits #(5) counter(counter_enable,reset,enable,read_addr);
	
	ram_32x4_2_ports ram(CLOCK_50,data,read_addr,write_addr,write,out);
	
endmodule
