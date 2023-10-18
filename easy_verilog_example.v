module easy_verilog_example();

    reg x = 1'b0; // 1bit variable with the value 0
    reg y = 1'b1; // 1bit variable with the value 1
    reg z;

    // a procedure example
    always @(z) begin,
        $display("x=%b, y=%b, z=%b",x,y,z);
    end

    // another procedure example
    initial begin
        #2;
        z = x^y; // bit-wise XOR between the 1 bit variables x and y
        #10;
        y = 0;
        z = x | y; // bit-wise OR between the 1 bit variables x and y
        #10;
        z = ~z;  // bit-wise NOT of the variable z
        #10;
    end
endmodule