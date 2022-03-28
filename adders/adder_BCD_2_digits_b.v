module adder_BCD_2_digits_b(
    input [3:0]X, Y,
    input cin,
    output [6:0]o_X, o_Y, S0, S1,
    output reg error,
	 output [4:0]suma);
    
    decoder_hex_10 d0(X, o_X);
    decoder_hex_10 d1(Y, o_Y);
    
    always @(X or Y) begin
        error = 0;
        if (X > 9 || Y > 9)
            error = 1;
    end
    
    wire [4:0] sum = X + Y + cin;
	 reg [3:0] Z0;
	 reg c1;
	 
	 assign suma = sum;
    
	 always @(sum) begin
			if(sum > 9) begin
				Z0 = 10;
				c1 = 1;
			end
			else begin
				Z0 = 0;
				c1 = 0;
			end
	 end
	 decoder_hex_10 d2((sum-Z0), S0);
	 binary_to_hex_1_bit b(c1, S1);
endmodule