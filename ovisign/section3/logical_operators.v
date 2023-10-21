module logical_operators();

    reg [2:0] my_val1 = 3'b111; // 3 bit variable
    reg [3:0] my_val2 = 4'b0000; // 4bit variable
    reg result;

    initial begin
        $monitor("MON my_val1=%b, my_val2=%b, result=%b");
    end

    // Procedure used to generate stimulus
    initial begin
        result = !my_val1; // Logical NOT cf.) bit-wise NOT: ~
        // # result = 0
        #1;
        result = !my_val2;
        // # result = 1(全て0の時のみ1)

        #1;
        result = my_val1 && my_val2; // Logical AND
        // # result = 0

        #1;
        result = my_val1 || my_val2; // # result = 1

        #1;
        my_val1=3'bz0X; // Add some unknown bits
        result = !my_val1; // # result = x

        #1;
        result = my_val1 || my_val2; // # result = x

        #1;
        result = my_val1 && my_val2; // # result = 0
    end
endmodule