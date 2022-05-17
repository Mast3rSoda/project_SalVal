module array_multiplier_4_bits(
	input [3:0]A,B,
	output [7:0]P);
	
	wire [39:0]w;
 
	and (w[0],A[0],B[0]);
	and (w[1],A[1],B[0]);
	and (w[2],A[2],B[0]);
	and (w[3],A[3],B[0]);
	 
	and (w[4],A[0],B[1]);
	and (w[5],A[1],B[1]);
	and (w[6],A[2],B[1]);
	and (w[7],A[3],B[1]);
	 
	and (w[8],A[0],B[2]);
	and (w[9],A[1],B[2]);
	and (w[10],A[2],B[2]);
	and (w[11],A[3],B[2]);
	 
	and (w[12],A[0],B[3]);
	and (w[13],A[1],B[3]);
	and (w[14],A[2],B[3]);
	and (w[15],A[3],B[3]);
	
	assign P[0] = w[0];
	
	full_adder (1'b0,w[1],w[4],w[16],w[17]);
	full_adder (1'b0,w[2],w[5],w[18],w[19]);
	full_adder (1'b0,w[3],w[6],w[20],w[21]);
	 
	full_adder (w[8],w[17],w[18],w[22],w[23]);
	full_adder (w[9],w[19],w[20],w[24],w[25]);
	full_adder (w[10],w[7],w[21],w[26],w[27]);
	 
	full_adder (w[12],w[23],w[24],w[28],w[29]);
	full_adder (w[13],w[25],w[26],w[30],w[31]);
	full_adder (w[14],w[11],w[27],w[32],w[33]);
	 
	full_adder (1'b0,w[29],w[30],w[34],w[35]);
	full_adder (w[31],w[32],w[35],w[36],w[37]);
	full_adder (w[15],w[33],w[37],w[38],w[39]);
	
	assign P[1]=w[16];
	assign P[2]=w[22];
	assign P[3]=w[28];
	assign P[4]=w[34];
	assign P[5]=w[36];
	assign P[6]=w[38];
	assign P[7]=w[39];
	
endmodule