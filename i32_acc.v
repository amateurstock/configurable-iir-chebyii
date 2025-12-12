module i32_acc(
    input signed [31:0] A,
    input signed [31:0] B,
    input signed [35:0] _Z,
    output signed [35:0] S
);

wire signed [35:0] A_ext = {{4{A[31]}}, A};
wire signed [35:0] B_ext = {{4{B[31]}}, B};

assign S = A_ext + B_ext + _Z;

endmodule
