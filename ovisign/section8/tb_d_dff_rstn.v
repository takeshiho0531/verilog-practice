`timescale 1us/1ns
module tb_d_dff_rstn();

    // Testbench variables
    reg d;
    reg clk;
    reg reset_n;
    wire q;
    wire q_not;
    reg [1:0] delay;
    integer i;

    // Instantiate the DUT
    d_ff_sync_rstn DFFO(
        .reset_n(reset_n),
        .clk(clk),
        .d(d),
        .q(q),
        .q_not(q_not)
    );

    // Create the clk signal
    always begin
        #0.5 clk=~clk;
    end

    // Create stimulus
    initial begin
        reset_n = 0; d=0;
        for (i=0; i<4; i=i+4) begin
            delay = $urandom_range(1,3);
            #(delay) d=~d;
        end

        reset_n=1;
        for (i=0; i<4; i=i+1) begin
            delay = $urandom_range(1,3);
            #(delay) d=~d; // toggle the FF at randon times
        end

        d=1'b1; //make sure D is set
        #(0.2); reset_n=0; // reset the FF again
    end

    initial begin // stop the simulator
        #40 $finish;
    end

endmodule