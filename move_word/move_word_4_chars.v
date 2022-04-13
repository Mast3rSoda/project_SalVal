module move_word_4_chars(
	input CLOCK_50,
	input aclr,enable,direction,
	output [6:0] H0,H1,H2,H3);
	
	wire [1:0] counter;
	wire [1:0] c0,c1,c2,c3;
	
	counter_mod_M_1s_interval #(5) c4(CLOCK_50,aclr,enable,counter);
	
	reg [7:0] list;
	reg [1:0] tmp;
	
	always @(counter) begin
		case(direction) 
			1'b01: begin
				list=8'b00011011;
				tmp = counter;
			end
			1'b00: begin
				list=8'b11100100;
				tmp = 4 - counter;
			end
		endcase
	end
			
	mux_4_1_2_bits mux0(list[7:6],list[5:4],list[3:2],list[1:0],tmp,c0);
	mux_4_1_2_bits mux1(list[1:0],list[7:6],list[5:4],list[3:2],tmp,c1);
	mux_4_1_2_bits mux2(list[3:2],list[1:0],list[7:6],list[5:4],tmp,c2);
	mux_4_1_2_bits mux3(list[5:4],list[3:2],list[1:0],list[7:6],tmp,c3);
	
	decoder_7_seg_2_bits dec0(c0,H3);
	decoder_7_seg_2_bits dec1(c1,H2);
	decoder_7_seg_2_bits dec2(c2,H1);
	decoder_7_seg_2_bits dec3(c3,H0);
	
endmodule