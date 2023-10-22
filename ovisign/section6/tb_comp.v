`timescale 1us/1ns
module tb_comp(
    // no inputs here
);
    reg a, b;
    wire smaller, greater, equal;

    // Instantiate the DUT
    comparatpr_1bit CMP1(
        .a(a),
        .b(b),
        .smaller(smaller),
        .greater(greater)
    );

    initial begin
        $monitor("a=%b, b=%b, smaller=%b, equal=%b, greater=%b",
        a, b, smaller, equal, greater);

        #1; a=0; b=0;
        #1; a=1; b=0;
        #1; a=1; b=0;
        #1; a=0; b=1;
        #1; a=0; b=1;
        #1; a=1; b=1;
        #1; $stop;
    end
endmodule