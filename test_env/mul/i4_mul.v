module i4_mul(
    input signed [3:0] A,
    input signed [3:0] B,
    output reg signed [3:0] P,
    output OV
);

// Q1.2 * Q1.2 = Q2.4, bit shift twice to the right to get back to QX.2
wire signed [7:0] test_val = (A * B) >>> 2;
assign OV = (test_val > 7 || test_val < -8);

always @(*) begin
    if (test_val > 7) P = 7;
    else if (test_val < -8) P = -8;
    else P = test_val[3:0];
end


endmodule

