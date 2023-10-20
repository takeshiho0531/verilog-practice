module concatenation_operator ();
    
    reg [7:0] a;
    reg [3:0] upper_nibble;
    reg [3:0] lower_niddle;

    initial begin
        #1; a = {4'b1110, 4'b0001}; // # a=11100001
        $display("a=%b", a);

        #1; a= {3'b000, 2'b11, 3'b000};
        $display("a=%b", a); // a=00011000

        #1; a={1'b1, 2'b00, 2'b01, 3'b010};
        $display("a=%b", a); // # a=10001010

        #1; a={a<<1, 1'b1};
        $display("a=%b", a); // #a=00101001 //bとconcatenateしたから一桁追い出された

        #1; {upper_nibble, lower_niddle}=a;
        $display("upper_niddle = %b, lower_niddle = %b", upper_nibble, lower_niddle); // upper_niddle = 0010, lower_niddle = 1001

        #1; {upper_nibble, lower_niddle}={lower_niddle. upper_nibble};
        $display("upper_niddle = %b, lower_niddle = %b", upper_nibble, lower_niddle); // upper_niddle = 1001, lower_niddle = 0010

        #1; a={upper_nibble, lower_niddle}; // #a=10010010
        $display("a=%b", a);
    end
endmodule