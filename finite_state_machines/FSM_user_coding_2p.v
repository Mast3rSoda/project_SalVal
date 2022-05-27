module FSM_user_coding_2p(
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
	
	always@(posedge clk)
		if (!reset)
				state <= A;
		else begin		
			case (state)
				A:
					if(w) state = F;
					else state = B;
				B:
					if(w) state = F;
					else state = C;
				C:
					if(w) state = F;
					else state = D;
				D:
					if(w) state = F;
					else state = E;
				E:
					if(w) state = F;
					else state = E;
				F:
					if(w) state = G;
					else state = B;
				G:
					if(w) state = H;
					else state = B;
				H:
					if(w) state = I;
					else state = B;
				I:
					if(w) state = I;
					else state = B;
			endcase
		end
		
	always @(*)
		if(state==E||state==I) z=1;
		else z=0;
	
	
endmodule