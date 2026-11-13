module jk_ff(input wire clk, j , k, output reg q, qbar);
    always @(posedge clk) begin
        case({j,k})
            2'b00: q <= q;       // Hold
            2'b01: q <= 1'b0;    // Reset
            2'b10: q <= 1'b1;    // Set
            2'b11: q <= ~q;      // Toggle
        endcase
    end

    always @(*) begin
        qbar = ~q;
    end
endmodule

`timescale 1ns / 1ps
module tb_jk;
    wire q, qbar;
    reg clk, j, k;

    jk_ff uut(clk,j,k,q,qbar);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("jk_ff.vcd");
        $dumpvars(0, tb_jk);
        clk = 0; j=0; k=0;
        $monitor("J=%b K=%b | Q=%b Q_bar=%b",j, k, q, qbar);
        #10 j = 0; k = 0; // Hold
        #10 j = 1; k = 0; // Set
        #10 j = 0; k = 0; // Hold
        #10 j = 0; k = 1; // Reset
        #10 j = 1; k = 1; // Toggle (0 -> 1)
        #10 j = 1; k = 1; // Toggle (1 -> 0)
        #20 $finish;
    end
endmodule
        