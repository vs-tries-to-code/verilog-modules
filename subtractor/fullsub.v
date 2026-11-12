
module full_sub_simple(input a, b, bin, output d, bout);
    assign d = (a^b)^bin;
    assign bout = (~a&b) | bin&(~(a^b));
endmodule