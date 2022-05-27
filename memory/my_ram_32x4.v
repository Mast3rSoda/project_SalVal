module my_ram_32x4(
	input [4:0]address,
	input clk,
	input [3:0] data_in,
	input write_enable,
	output [3:0] data_out);
	
	ram_32x4 ram_instance(
		address,
		clk,
		data_in,
		write_enable,
		data_out);
	
endmodule