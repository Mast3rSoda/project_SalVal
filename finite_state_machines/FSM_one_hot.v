module FSM_one_hot(
	input clk,reset,w,
	output reg z,
	output [8:0] y);
	
	reg [8:0] state,next;
	assign y=state;
	
	localparam[8:0]
	A = 9'b000000001,
	B = 9'b000000010,
	C = 9'b000000100,
	D = 9'b000001000,
	E = 9'b000010000,
	F = 9'b000100000,
	G = 9'b001000000,
	H = 9'b010000000,
	I = 9'b100000000;
	
	always @(posedge clk)
		case (state)
			A:
				if(w) next = F;
				else next = B;
			B:
				if(w) next = F;
				else next = C;
			C:
				if(w) next = F;
				else next = D;
			D:
				if(w) next = F;
				else next = E;
			E:
				if(w) next = F;
				else next = E;
			F:
				if(w) next = G;
				else next = B;
			G:
				if(w) next = H;
				else next = B;
			H:
				if(w) next = I;
				else next = B;
			I:
				if(w) next = I;
				else next = B;
		endcase
		
	always @(posedge clk,negedge reset)
		if(~reset)	state <= A;
		else	state<=next;
		
	always @(*)
		if(state==E||state==I) z=1;
		else z=0;
			
endmodule
	