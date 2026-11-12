module ha_tb();
    //ip op declare
    wire s,c;
    reg a,b;

    //instantiate module
    half_adder uut(a,b,s,c);

    //cases
    initial begin
        //name of dump file for gtkwave
        $dumpfile("halfAdder.vcd");
        $dumpvars(1, ha_tb);

        //output display - display for single time dispay, monitor to display every case
        $display("A B | S C");
        $monitor("%d %d | %d %d", a, b, s, c);
       a=0;b=0;#10;
       a=0;b=1;#10;
       a=1;b=0;#10;
       a=1;b=1;#10;

       $finish;
    end

endmodule