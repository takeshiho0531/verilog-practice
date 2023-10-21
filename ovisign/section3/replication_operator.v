module replication_operator ();
     reg[7:0] a;
     reg[31:0] b;

     initial begin
        #1; a={4{2'b10}}; // # a=10101010
        $display("a=%b", a);

        #1; a={2{4'b1X0Z}};
        $display("a=%b", a); // a=1x0z1x0z

        #1; a={4'b1010, {4{1'b1}}};
        $display("a=%b", a); // a=10101111

        #1; b = {8{4'b0110}};
        $display("b=%b",b); //# b=01100110011000100010001000100010

        #1; b={{2{8'b0111_0001}}, {4{4'bXZ01}}};
        $display("b=%b", b); // # b=011001011001xz01xz01xz01xz01

        #1; b={{16{2'b10}}};
        $display("b=%b", b); // # b=10101010101010101010101010101010
     end
endmodule