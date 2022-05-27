module FSM_user_coding_3p(
	input clk,reset,w,
	output reg z,
	output [3:0] y);
	
	reg [3:0] state,next;
	assign y=state;
	
	localparam[3:0]
	A = 0,
	B = 1,
	C = 2,
	D = 3,
	E = 4,
	F = 5,
	G = 6,
	H = 7,
	I = 8;
	
	always@(*)
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