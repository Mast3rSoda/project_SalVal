module multiplier_N_bits #(parameter N=4)
	(input [N-1:0] a,b,
	output [2*N-1:0] p);
	
	wire [N-1:0] PP[N-1:0]; // cząstkowe iloczyny
	wire [N-1:0] s[1:N-1]; // cząstkowe sumy
	wire cout[1:N-1]; // przeniesienia
	
	genvar i;
	// tworzenie cząstkowych iloczynyów
	generate
		for(i=0;i<N;i=i+1) begin:bl1
			assign PP[i] = a & {N{b[i]}};
		end
	endgenerate
	
	// tworzenie cząstkowych sum
	adder_N_bits #(N) ex1({1'b0,PP[0][N-1:1]},PP[1],1'b0,s[1],cout[1]);
	
	generate
	for(i=2;i<N;i=i+1) begin:bl2
		adder_N_bits #(N) exi({cout[i-1],s[i-1][N-1:1]},
			PP[i],1'b0,s[i],cout[i]);
		end
	endgenerate
	
	// tworzenie rezultatu
	assign p[0] = PP[0][0];
	generate
		for(i=1;i<N-1;i=i+1) begin:bl3
			assign p[i] = s[i][0];
		end
	endgenerate
	
	assign p[2*N-2:N-1] = s[N-1];
	assign p[2*N-1] = cout[N-1];
endmodule