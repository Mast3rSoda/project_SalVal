module my_ram_32x4_board(
	input [9:0]SW,
	input KEY0,
	output [6:0] HEX0,HEX2,HEX4,HEX5);
	
	wire [3:0] data_out;
	
	my_ram_32x4 RAM_32x4(SW[8:4],~KEY0,SW[3:0],SW[9],data_out);
	
	decoder_hex_16 addr1({3'b000,SW[8]},HEX5);
	decoder_hex_16 addr0(SW[7:4],HEX4);
	
	decoder_hex_16 data(SW[3:0],HEX2);
	decoder_hex_16 out(data_out,HEX0);
	
endmodule