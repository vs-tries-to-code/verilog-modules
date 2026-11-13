module d_ff(input wire d, clk, output reg q, qbar);
    always @(posedge clk) begin
        q <= d;
    end

    always @(*) begin
        qbar = ~q;
    end
endmodule

module tb_d;
    reg clk, d;
    wire q, qbar;

    d_ff uut(d,clk,q,qbar);

    always #5 clk = ~clk;

    initial begin
        clk = 0; d=0; 
        $dumpfile("d_ff.vcd");
        $dumpvars(0, tb_d);
        $monitor("D=%b Q=%b",d,q);
        
        d=0; #10;
        d=1; #10;
        d=0; #10;
        d=1; #10;
        #20 $finish;
    end
endmodule 