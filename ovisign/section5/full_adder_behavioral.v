module full_adder_behavioral(
    input a, // always wire
    input b,
    input carry_in,
    // reg because it is used in a always procedure
    output reg sum,
    output reg carry_out
);
    
    // behavioral style
    always @(a or b or carry_in) begin
        sum = a^b^carry_in;
        carry_out = (a&b) | (carry_in & (a^b));
    end

    // 他の書き方
    // always @(*) begin
        // {carry_out, sum} = a+b+carry_in;
    // end
endmodule