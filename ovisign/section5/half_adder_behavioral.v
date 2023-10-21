module half_adder_behavioral(
    input a;
    input b;
    output reg sum;  // behavioralの中はregのみでwireだめ
    output reg carry;
);
// Behavioral style
    always @(a or b) begin
        sum = a^b; // a XOR b
        carry = a&b; //a AND b
    end

endmodule