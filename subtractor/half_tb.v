
module hs_tb();
    //ip op declare
    wire d, bo;
    reg a,b;

    //instantiate module
    half_sub uut(a,b,d,bo);

    //cases
    initial begin
        //name of dump file for gtkwave
        $dumpfile("halfsub.vcd");
        $dumpvars(1, hs_tb);

        //output display - display for single time dispay, monitor to display every case
        $display("A B | D Bout");
        $monitor("%d %d | %d %d", a, b, d, bo);
       a=0;b=0;#10;
       a=0;b=1;#10;
       a=1;b=0;#10;
       a=1;b=1;#10;

       $finish;
    end

endmodule