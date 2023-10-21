module reduction_operators();
    reg [4:0] my_val1=5'b1_111`1; // 5 bit variable
    reg [8:0] my_val2=9'b1_0101_1110;
    reg result;

    // Procedure used to continuously monitor "my_val1", "my_val2", "result"
    initial begin
        $monitor("MON my_val1=%b, my_val2=%b, result=%b", my_val1, my_val2, result);
    end

    // Procedure used to generate stimulus
    initial begin
        result = &my_val1; // AND reduction // # result=1
        #1;
        result=&my_val2; // # result=0

        #1;
        result=~&my_val2; // NAND reduction // #result=1
        #1;
        result=~&my_val1; // # result=0

        #1;
        result=|my_val2; // OR reduction // # result=1

        #1;
        result=~|my_val2; // NOR reduction // # result=0

        #1;
        result=^my_val1; // XOR reduction // # result=1 // 他入力XORの場合１が奇数コかと同値らしい

        #1;
        result=~^my_val1; // NXOR reduction // # result=0
    end    
endmodule