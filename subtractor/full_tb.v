
module fs_tb();
    wire d, bout;
    reg a, b, bin;

    full_sub_simple uut(a,b,bin,d,bout);

    initial begin
        $dumpfile("fs.vcd");
        $dumpvars(1, fs_tb);
        $display("A B Bin | D Bout");
        $monitor("%b %b %b | %b %b",a,b,bin,d,bout);
        a=0;b=0;bin=0;#10;
        a=0;b=1;bin=0;#10;
        a=1;b=0;bin=0;#10;
        a=1;b=1;bin=0;#10;
        a=0;b=0;bin=1;#10;
        a=0;b=1;bin=1;#10;
        a=1;b=0;bin=1;#10;
        a=1;b=1;bin=1;#10;
        $finish;
    end
endmodule