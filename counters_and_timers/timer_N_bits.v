module timer_N_bits #(parameter N=4)
	(input clk,load,enable,
	input [N-1:0] data,
	output out);
	
	reg [N-1:0] count;
	
	always @(posedge clk)
		if (load) count <= data;
		else if (enable) count <= count - 1;
		else count <= count;
		
	assign out = (count==0);
endmodule