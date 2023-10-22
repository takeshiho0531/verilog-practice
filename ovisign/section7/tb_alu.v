`timescale 1us/1ns
module tb_ALU();

    // Testbench variables
    parameter BUS_WIDTH = 8;
    reg [3:0] opcode;
    reg [BUS_WIDTH-1:0] a,b;
    reg carry_in;
    wire [BUS_WIDTH-1:0] y;
    wire carry_out;
    wire borrow;
    wire zero;
    wire parity;
    wire invalid_op;

    // Instantiate the DUT
    ALU
        // Parameters section
        #(.BUS_WIDTH(BUS_WIDTH))
    ALU0(
        // Ports section
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .opcode(opcode),
        .y(y),
        .carry_out(carry_out),
        .borrow(borrow),
        .zero(zero),
        .parity(parity),
        .invalid_op(invalid_op)
    );

    // create stimulus
    initial begin
        $monitor($time, "opcode=%d, a=%d, b=%d, carry_in=%d, y=%d, carry_out=%b, borrow=%b, zero=%b, parity=%b, invalid_op=%b",
            opcode, a, b, carry_in, y, carry_out, borrow, zero, parity, invalid_op);
        
        #1; $display("\nTest OP_INVALID");
        opcode = 0; a=0; b-0; carry_in=0;

        #1; $display("\nTest OP_ADD");
        opcode=1; a=9;b=33;carry_in=0;

        #1; $display("\nTest OP_ADD_CARRY");
        opcode=2; a=9;b=33;carry_in=1;

        #1; $display("\nTest OP_SUB");
        opcode=3; a=65;b=64;carry_in=0;
        #1; opcode=3; a=65; b=66; carry_in=0;

        #1; $display("\nTest OP_INC");
        opcode=4; a=233;b=69;carry_in=0;

        #1; $display("\nTest OP_DEC");
        opcode=5; a=1;b=3;carry_in=0;

        #1; $display("\nTest OP_AND");
        opcode=6; a=8'b1111_1110;b=8'b0000_0011;

        #1; $display("\nTest OP_NOT");
        opcode=7; a=8'b1111_1110;

        #1; $display("\nTest OP_ROL");
        opcode=8; a=8'b1111_0001;

        #1; $display("\nTest OP_NOT");
        opcode=9; a=8'b1000_0000;
    end
endmodule