`timescale 1us/1ns
module tb_adders_tree();

    reg [3:0] a,b;
    reg [7:0] c,d;
    wire [4:0] sum1;
    wire [8:0] sum2;
    wire [9:0] sum3;

    // Instantiate the DUT
    adders_tree ADD(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sum1(sum1),
        .sum2(sum2),
        .sum3(sum3)
    );

    // Create stimulus
    initial begin
        $monitor("a=5d, b=%d, c=%d, d=%d, sum1=%d, sum2=%d",
        a, b, c, d, sum1, sum2);
    end
endmodule