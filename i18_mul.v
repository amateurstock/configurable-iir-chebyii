module i18_mul(
    input signed [17:0] A,
    input signed [15:0] B_coef,
    output signed [33:0] P
);

assign P = A * B_coef;

endmodule

