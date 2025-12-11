module i32_acc(
    input signed [31:0] A,
    input signed [31:0] B,
    input signed [31:0] C,
    output signed [35:0] S
);

wire signed [35:0] A_ext = {{4{A[31]}}, A};
wire signed [35:0] B_ext = {{4{B[31]}}, B};
wire signed [35:0] C_ext = {{4{C[31]}}, C};

assign S = A_ext + B_ext + C_ext;

endmodule
