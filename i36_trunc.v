module i36_trunc(
    input signed [35:0] A,
    output reg signed [15:0] B_sat,
    output reg signed [17:0] B
);

wire signed [35:0] shifted_inter = (A >>> 14);
wire signed [21:0] shifted = shifted_inter[21:0];

always @(*) begin
    B = $signed(shifted[17:0]);
    if (shifted > 22'sd32767) B_sat = 16'sd32767;
    else if (shifted < -22'sd32768) B_sat = -16'sd32768;
    else B_sat = $signed(shifted[15:0]);
end

endmodule

