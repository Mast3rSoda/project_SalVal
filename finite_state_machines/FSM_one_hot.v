module FSM_one_hot(
	input clk,reset,w,
	output reg z,
	output reg [8:0] y);
	
	reg [8:0] next = 9'b000000001;
	
	
	always@(*) begin
		next[0]= ~reset;
		next[1]= y[0] & ~w | y[5] & ~w | y[6] & ~w | y[7] & ~w | y[8] & ~w;
		next[2]= y[1] & ~w;
		next[3]= y[2] & ~w;
		next[4]= y[3] & ~w | y[4] & ~w;
		next[5]= y[4] & w | y[1] & w | y[2] & w | y[3] & w;
		next[6]= y[5] & w;
		next[7]= y[6] & w;
		next[8]= y[7] & w | y[8] & w;
	end
	
	always @(*)
		z = y[4] | y[8];
	
	always @(posedge clk,negedge reset)
		if(~reset)	y = 9'b000000001;
		else	y<=next;
			
endmodule
	