module sr_ff(input wire clk, s, r, output reg q, qbar);
    always @(posedge clk) begin
        case({s, r})
            2'b00: q <= q;
            2'b10: q <= 1'b1;
            2'b01: q <= 1'b0;
            2'b11: q <= 1'bx;
        endcase
    end

    always @(*) begin   
        qbar = ~q;
    end
    
endmodule

`timescale 1ns / 1ps
module sr_tb;
    wire q, qbar;
    reg clk, s, r;

    sr_ff uut(clk, s, r, q, qbar);
        
    always #5 clk = ~clk;

    initial begin 
        $dumpfile("sr.vcd");
        $dumpvars(0, sr_tb);

        //initialise
        clk = 0;
        s=0;
        r=0;

        $monitor("s = %b | r = %b || q = %b | q_bar = %b", s, r, q, qbar);
        #10
        s = 0; r = 0; #10
        s = 1; r = 0; #10
        s = 0; r = 0; #10
        s = 0; r = 1; #10
        s = 0; r = 0; #10
        s = 1; r = 1; #10
        s = 0; r = 0; #10
        #20
        $finish;
    end
endmodule