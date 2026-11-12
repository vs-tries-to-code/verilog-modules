module fa_tb();
    wire s, cout;
    reg a, b, cin;

    full_add_simple uut(a,b,cin,s,cout);

    initial begin
        $dumpfile("fa.vcd");
        $dumpvars(1, fa_tb);
        $display("A B Cin | S Cout");
        $monitor("%b %b %b | %b %b",a,b,cin,s,cout);
        a=0;b=0;cin=0;#10;
        a=0;b=1;cin=0;#10;
        a=1;b=0;cin=0;#10;
        a=1;b=1;cin=0;#10;
        a=0;b=0;cin=1;#10;
        a=0;b=1;cin=1;#10;
        a=1;b=0;cin=1;#10;
        a=1;b=1;cin=1;#10;
        $finish;
    end
endmodule