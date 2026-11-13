
module t_ff(
    input T, clk,
    output reg Q
);

always @(posedge clk) begin
    if (T)
        Q <= ~Q;
    else
        Q <= Q;
end

endmodule


module t_ff_tb;

reg T, clk;
wire Q;

t_ff uut(T,clk,Q);

initial begin
    clk=0;
    forever #5 clk=~clk;
end

initial begin
$dumpfile("t_ff.vcd");
    $dumpvars(0, t_ff_tb);
    $monitor("T=%b Q=%b",T,Q);

    T=0; #10;
    T=1; #30;
    T=0; #10;

    $finish;
end

endmodule