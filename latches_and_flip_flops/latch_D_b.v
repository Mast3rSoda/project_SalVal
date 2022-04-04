module latch_D_b (
    input Clk,D, 
    output reg Q);
    
    always @ (D, Clk)
        if (Clk)
            Q = D;
endmodule