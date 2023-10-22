`timescale 1us/1ns
module tb_logiv(
    // NO inputs here
);

    reg a;
    reg b;
    wire c;

    // Instantiate the DUT
    some_logic LOGIC(
        .a(a),
        .b(b),
        .c(c)
    );

    // Toggle a and b
    initial begin
        $monitor("a=%b, b=%b, c=%b", a, b, c);
        #1; a=0; b=0;
        #1; a=1; b=0;
        #1; a=0; b=1;
        #1; a=1; b=1;
        #1;
    end
endmodule