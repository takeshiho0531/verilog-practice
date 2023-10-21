module full_adder_dataflow(
    input a, // always wire
    input b,
    input carry_in,
    output sum, // deafult wire
    output carry_out,
)

    // Declare nets to connect the half adders
    wire sum1;
    wire and1;
    wire and2;

    // Implement the cuicuit using dataflow style
    assign sum1 = a^b;
    assign and1 = sum1 & carry_in;
    assign and2 = a & b;

    assign sum = sum1 ^ carry_in;
    assign carry_out = and1 | and2;

endmodule