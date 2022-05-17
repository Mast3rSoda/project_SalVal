module flip_flop_D_posedge (
    input clk,D, 
    output reg Q);
    
    always @ (posedge clk)
        if (clk)
            Q = D;
endmodule