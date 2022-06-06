module proc_with_rom(
	input Run,
	input Resetn,
	input MClock,
	input PClock,
	output [8:0] BusWires,
	output Done);
	
	counter_mod_M #(32) counter(MClock, Resetn, 1'b1, Address);
	
	wire [4:0] Address;
	wire [8:0] Data;
	
	rom_32x9 rom(Address, MClock, Data);
	proc_1 processor(Data, Resetn, PClock, Run, Done, BusWires);

	
endmodule