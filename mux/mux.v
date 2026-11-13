module mux(input [3:0]d, [1:0] sel, output y);
    assign y = d[sel];
endmodule

module mux_tb;
    wire y;
    reg [3:0]d, [1:0]sel;

    mux uut(d,sel,y);

    initial begin 
        $dumpfile("mux.vcd");
        $dumpvars(0, mux_tb);
        d = 4'b1010;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        $finish;
    end
endmodule
