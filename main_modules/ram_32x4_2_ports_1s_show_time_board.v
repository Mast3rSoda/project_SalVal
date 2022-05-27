module ram_32x4_2_ports_1s_show_time_board(
	input CLOCK_50,
	input [9:0] SW,
	input [0:1] KEY,
	output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
	
	wire [3:0] memory_value;
	wire [4:0] read_addr;
	
	ram_32x4_2_ports_1s_show_time (CLOCK_50,SW[8:4],SW[3:0],~KEY[0],KEY[1],SW[9],read_addr,memory_value);
	
	decoder_hex_16 d0(memory_value,HEX0);
	decoder_hex_16 d1(SW[3:0],HEX1);
	decoder_hex_16 d2(read_addr[3:0],HEX2);
	decoder_hex_16 d3({3'b000,read_addr[4]},HEX3);
	decoder_hex_16 d4(SW[7:4],HEX4);
	decoder_hex_16 d5({3'b000,SW[8]},HEX5);
	
endmodule
	
	
	
	
	