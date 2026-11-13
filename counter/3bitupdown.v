module updown(input wire clk, m, output reg [2:0] count);
    initial begin
        count = 3'b000;
    end

    always @(posedge clk) begin
        if(m)
            count <= count + 1'b1;
        else
            count <= count - 1'b1;
    end
endmodule 


`timescale 1ns / 1ps

module tb_updown;
    reg clk;
    reg m;
    wire [2:0] count; // [2:0] before the count!

    updown uut(clk, m, count);

    always #5 clk = ~clk;
    
    initial begin 
        //initialise inputs for simulation first
        clk  = 0;
        m = 1;
        
        $dumpfile("updown3bit.vcd");
        $dumpvars(0, tb_updown);
        $display("mode clk | count");
        $monitor("%d %d | %b", m, clk, count);

        //switch to down counting after 80ns/ps
        #80 m = 0;
        //outputs of down counting time 
        #80
        $finish;
    end
endmodule