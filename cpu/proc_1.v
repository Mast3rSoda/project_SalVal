module proc_1 (
	input [8:0] DIN,
	input Resetn, Clock, Run,
	output reg Done,
	output reg [8:0] BusWires);
	
	// kody stanów automatu
	localparam T0 = 2'b00, T1 = 2'b01, T2 = 2'b10, T3 = 2'b11;
	
	//kody instrukcji
	localparam mv = 3'b000, mvi = 3'b001, add = 3'b010, sub = 3'b011;
	
	wire [8:0] R0, R1, R2, R3, R4, R5, R6, R7;
	wire [8:0] A, G;
	wire [0:8] IR;
	wire [0:7] Xreg, Yreg;
	wire [2:0] InstructionCode;
	wire [0:9] Sel;
	
	reg [0:7] Rin, Rout;
	reg [8:0] Sum;
	reg IRin, DINout, Ain, Gin, Gout, AddSub;
	reg [1:0] Tstep_Q/*synthesis keep*/, Tstep_D;
	
	assign InstructionCode = IR[0:2];
	
	dec3to8 decX (IR[3:5], 1'b1, Xreg);
	dec3to8 decY (IR[6:8], 1'b1, Yreg);
	
	//zarządzanie stanami automatu
	always @(Tstep_Q, Run, Done)
		begin
			case (Tstep_Q)
				T0:
					if (~Run) Tstep_D = T0;
					else Tstep_D = T1;
				T1:
					if (Done) Tstep_D = T0;
					else Tstep_D = T2;
				T2:
					Tstep_D = T3;
				T3:
					Tstep_D = T0;
			endcase
		end

	always @(Tstep_Q or InstructionCode or Xreg or Yreg)
		begin
			Done = 1'b0; 
			Ain = 1'b0;
			Gin = 1'b0; 
			Gout = 1'b0;
			AddSub = 1'b0;
			IRin = 1'b0; 
			DINout = 1'b0; 
			Rin = 8'b0;
			Rout = 8'b0;
			
			case (Tstep_Q)
				T0:
					IRin = 1'b1;
				T1:
					case (InstructionCode)
						mv:
							begin
								Rout = Yreg;
								Rin = Xreg;
								Done = 1'b1;
							end
						mvi:
							begin
								DINout = 1'b1;
								Rin = Xreg;
								Done = 1'b1;
							end
						add, sub:
							begin
								Rout = Xreg;
								Ain = 1'b1;
							end
					endcase
				T2:
					case (InstructionCode)
						add:
							begin
								Rout = Yreg;
								Gin = 1'b1;
							end
						sub:
							begin
								Rout = Yreg;
								AddSub = 1'b1;
								Gin = 1'b1;
							end
					endcase
				T3:
					case (InstructionCode)
					add, sub:
						begin
							Gout = 1'b1;
							Rin = Xreg;
							Done = 1'b1;
						end
					endcase
			endcase
		end
	
	always @(posedge Clock, negedge Resetn)
		if (!Resetn)
			Tstep_Q <= T0;
		else
			Tstep_Q <= Tstep_D;
		
	regn reg_0 (BusWires, Rin[0], Clock, R0);
	regn reg_1 (BusWires, Rin[1], Clock, R1);
	regn reg_2 (BusWires, Rin[2], Clock, R2);
	regn reg_3 (BusWires, Rin[3], Clock, R3);
	regn reg_4 (BusWires, Rin[4], Clock, R4);
	regn reg_5 (BusWires, Rin[5], Clock, R5);
	regn reg_6 (BusWires, Rin[6], Clock, R6);
	regn reg_7 (BusWires, Rin[7], Clock, R7);
	regn reg_A (BusWires, Ain, Clock, A);
	regn reg_IR (DIN[8:0], IRin, Clock, IR);
		
	//ALU
	always @(AddSub or A or BusWires)
		begin
			if (!AddSub)
				Sum = A + BusWires;
			else
				Sum = A - BusWires;
		end
	
	regn reg_G (Sum, Gin, Clock, G);
	
	assign Sel = {Rout, Gout, DINout};
	
	//Bus
	always @(*)
		begin
			if (Sel == 10'b1000000000)
				BusWires = R0;
			else if (Sel == 10'b0100000000)
				BusWires = R1;
			else if (Sel == 10'b0010000000)
				BusWires = R2;
			else if (Sel == 10'b0001000000)
				BusWires = R3;
			else if (Sel == 10'b0000100000)
				BusWires = R4;
			else if (Sel == 10'b0000010000)
				BusWires = R5;
			else if (Sel == 10'b0000001000)
				BusWires = R6;
			else if (Sel == 10'b0000000100)
				BusWires = R7;
			else if (Sel == 10'b0000000010)
				BusWires = G;
			else 
				BusWires = DIN;
		end
endmodule
	
	
module dec3to8(
	input [2:0] W,
	input En,
	output reg [0:7] Y);
	
	always@(W or En)
		begin
			if(En == 1)
				case(W)
					3'b000: Y=8'b10000000;
					3'b001: Y=8'b01000000;
					3'b010: Y=8'b00100000;
					3'b011: Y=8'b00010000;
					3'b100: Y=8'b00001000;
					3'b101: Y=8'b00000100;
					3'b110: Y=8'b00000010;
					3'b111: Y=8'b00000001;
				endcase
			else
				Y = 8'b00000000;
		end
endmodule
	
	
module regn #(parameter n=9)(
	input [n-1:0] R,
	input Rin, Clock,
	output reg [n-1:0] Q);
		
	always @(posedge Clock)
		if(Rin)
			Q <= R;
endmodule
