module FSM_user_coding_1p(
	input clk,reset,w,
	output reg z,
	output [8:0] y);
	
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
			z = 0;
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
				E: begin
						z = 1;
						if(w) state = F;
						else state = E;
					end
				F:
					if(w) state = G;
					else state = B;
				G:
					if(w) state = H;
					else state = B;
				H:
					if(w) state = I;
					else state = B;
				I: begin
						z = 1;
						if(w) state = I;
						else state = B;
					end
			endcase
		end
	
	
endmodule