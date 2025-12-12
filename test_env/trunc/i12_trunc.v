module i8_trunc(
    input signed [11:0] A,
    output reg signed [3:0] B
);

// input is Q???.4, so shift right twice back to Q???.2
wire signed [11:0] rounded = A + 2;
wire signed [9:0] shifted = rounded >>> 2;

always @(*) begin
    if (shifted > 7) B = 7;
    else if (shifted < -8) B = -8;
    else B = $signed(shifted[3:0]);
end

endmodule

