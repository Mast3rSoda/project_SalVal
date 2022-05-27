module my_ram_32x4_code(
	input [4:0] address,
	input clk,
	input [3:0] data_in,
	input write_enable,
	output [3:0] data_out);
	
	reg [3:0] memory_array[31:0];
	reg [4:0] reg_address;
	reg [3:0] reg_data_in;
	reg reg_write;
	
	always @(posedge clk)
		begin
			reg_address <= address;
			reg_data_in <= data_in;
			reg_write <= write_enable;
		end
	always @(*)
		if (reg_write) memory_array[reg_address] = reg_data_in;
			assign data_out = memory_array[reg_address];
endmodule