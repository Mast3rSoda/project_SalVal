module detector_with_shift_reg(
	input clk,reset,w,
	output reg z);
	
	reg [3:0] zero_state,one_state;
	reg [3:0] zero_next,one_next;
	
	localparam [3:0]
	A = 0,
	B = 1,
	C = 2,
	D = 3,
	E = 4;
	
	always@(*)
	begin
		case(zero_state)
			A:
				if(w) zero_next = A;
				else zero_next = B;
			B:
				if(w) zero_next = A;
				else zero_next = C;
			C:
				if(w) zero_next = A;
				else zero_next = D;
			D:
				if(w) zero_next = A;
				else zero_next = E;
			E:
				if(w) zero_next = A;
				else zero_next = E;
		endcase
		
		case(one_state)
			A:
				if(w) one_next = B;
				else one_next = A;
			B:
				if(w) one_next = C;
				else one_next = A;
			C:
				if(w) one_next = D;
				else one_next = A;
			D:
				if(w) one_next = E;
				else one_next = A;
			E:
				if(w) one_next = E;
				else one_next = A;
				
		endcase
	end
	
	always @(posedge clk,negedge reset)
		if(~reset)	begin
			zero_state <= A;
			one_state <= A;
		end
		else begin
			zero_state<=zero_next;
			one_state<=one_next;
		end
		
	always @(*)
		if(zero_state==E||one_state==E) z=1;
		else z=0;
	
endmodule