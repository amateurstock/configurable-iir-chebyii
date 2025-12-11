module i16_mul_sat(
    input signed [15:0] A,
    input signed [15:0] B,
    output reg signed [15:0] P
);

// Q1.14 * Q1.14 = Q 2.28, bit shift 14 times to the right to get back to QX.14
wire signed [31:0] test_val = (A * B) >>> 14;

always @(*) begin
    if (test_val > 32767) P = 32767;
    else if (test_val < -32768) P = -32768;
    else P = test_val[15:0];
end

endmodule

