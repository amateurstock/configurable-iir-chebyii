module i16_mul(
    input signed [15:0] A,
    input signed [15:0] B,
    output signed [31:0] P
);

assign P = A * B;

endmodule

