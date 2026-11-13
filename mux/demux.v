
module demux_1to4 (
    input din,
    input [1:0] sel,
    output reg [3:0] y
);
    always @(*) begin
        y = 4'b0000;
        y[sel] = din;
    end
endmodule


`timescale 1ns / 1ps

module tb_demux_1to4;
    reg din;
    reg [1:0] sel;
    wire [3:0] y;

    demux_1to4 uut (
        .din(din),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("demux_1to4.vcd");
        $dumpvars(0, tb_demux_1to4);

        din = 1; sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        din = 0; sel = 2'b00; #10;
        $finish;
    end
endmodule