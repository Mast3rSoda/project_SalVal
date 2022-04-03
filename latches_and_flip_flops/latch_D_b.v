module latch_D (
    input Clk,D, 
    output reg Q);
    
    always @ (D, Clk)
        if (Clk)
            Q = D;
endmodule