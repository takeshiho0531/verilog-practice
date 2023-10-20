module logical_operators_usage();
    reg [2:0] my_val1 = 3'b111; // 3 bit variable
    reg [3:0] my_val = 4'b0000; // 4 bit variable

    initial begin
        #1;
        if(!my_val1) begin
            $display("GREAT! my_val1=%b", my_val1);
        end else begin
            $display(":(I expected my_val1=0 but my_val1=%b)", my_val1); // # :(I expected my_val1=0 but my_val1=1)
        end

        #1;
        if(!my_val2) begin
            $display("GREAT! my_val2=%b", my_val2); // # GREAT! my_val2=0000
        end else begin
            $display(":(I expected my_val2=0 but my_val2=%b)", my_val2);
        end

        #1;
        if(my_val1 && (!my_val2)) begin
            $display("GREAT! my_val1=%b my_val2=%b", my_val1. my_val2); // GREAT! my_val1=111 my_val2=%b
        end else begin
            display(":(I expected my_val1!=0 && my_val2=0 but my_val1=%b my_val2=%b)", my_val1, my_val2);
        end

        #1;
        while (my_val2<3) begin
            $display("WHILE LOOP my_val2=%d", my_val2);
            my_val2=my_val2+1;
        end
    end
endmodule