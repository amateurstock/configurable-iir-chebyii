// Assume that the inputs are in Q2.4 form
module i8_acc(
    input signed [7:0] A,
    input signed [7:0] B,
    input signed [7:0] C,
    output signed [11:0] S
);

wire signed [11:0] A_ext = {{4{A[7]}}, A};
wire signed [11:0] B_ext = {{4{B[7]}}, B};
wire signed [11:0] C_ext = {{4{C[7]}}, C};

assign S = A_ext + B_ext + C_ext;

endmodule

