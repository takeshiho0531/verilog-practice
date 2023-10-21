module procedures();

    reg [7:0] var1;
    reg [7:0] var2;
    wire [8:0] sum;
    reg [15:0] product;

    // All the procedures below are executed in parallel

    // continuous assignment (Dataflow style)
    assign sum = var1+var2;

    // Behavioral Style - controlled by the change of var1 or var2
    always @(var1 or var2) begin
        product = var1 * var2;
    end

    // Behavioral sytle - controlled by the change of var1
    always @(var1) begin
        $display("MON_VAR1: var1=%0d", var1);
    end

    // Behavioral style - controlled by the change of var1, var2, sum, product
    always @(*) begin
        $display("MON_ALL: var1=%0d, var2=%0d, sum=%0d, product=%0d", var1, var2, sum, product);
    end

    // Behavioral Style - generate stimulus
    initial begin
         #1; var1=10; var2=99;
         #1; var2=33;
         #1; var1 = var2<<2;
         #1; var2=var2>>3;
         #1; var2=var2+1;
    end
endmodule