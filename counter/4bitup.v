module four_up(
    input wire clk,
    output reg [3:0] count
    );
    
    initial begin
        count = 4'b0000; //initialise to 4'b1111 for down counter
    end
    
    always @(posedge clk) begin
      count <= count + 1'b1; //increment, -1'b1 for down counter
    end
endmodule

//testbench

`timescale 1ns / 1ps

module tb_fourup;
    reg clk;
    wire [3:0] count;

    //instantiate module
    four_up uut(clk, count);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        $dumpfile("up4bit.vcd");
        $dumpvars(0, tb_fourup);

        $display("clk | count");
        $monitor("%b  |  %b", clk, count);

        #160 
        $finish;
    end
endmodule
        