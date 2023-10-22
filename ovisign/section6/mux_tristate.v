module mux_tristate(
    input a,
    input b,
    input sel,
    output dout
);
    bufif0 B0 (dout,a,sel);
    bufif B1 (dout, b, sel);
endmodule