module d_ff_sync_rstn(
    input reset_n,
    input clk,
    input d,
    output reg q,
    output q_not
);
    // The D-Flip Flop has a positive edge clock
    // reset_n is synchronus with the clk signal
    // Use non-blocking operator for sequential logic
    always @(posedge) begin // sequentialなのはalways blockの中に入れる
        if (!reset_n) // 依存配列にposedgeしか入ってないからいつでもresetするわけではない
            q<=1'b0;
        else
            q<=d;
    end

    assign q_not = ~q;
endmodule