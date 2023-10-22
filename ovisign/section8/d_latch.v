// enableの時のみdとqが一致する、そうでない時qは変化しない
module d_latch(
    input d;
    input enable,
    output q,
    output q_not
);
    reg dlatch;

    // The D-Latch is level sensitive
    always @(enable otr d) begin
        if(enable)
            dlatch<=d;
    end

    assign q=dlatch;
    assign q_not=~q;
endmodule