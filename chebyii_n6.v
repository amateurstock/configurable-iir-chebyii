module chebyii_n6(
    input CLK, RST,

    input signed [15:0] A,
    output signed [15:0] B,

    input signed [15:0] sos0_b_0,
    input signed [15:0] sos0_b_1,
    input signed [15:0] sos0_b_2,
    input signed [15:0] sos0_a_1,
    input signed [15:0] sos0_a_2,

    input signed [15:0] sos1_b_0,
    input signed [15:0] sos1_b_1,
    input signed [15:0] sos1_b_2,
    input signed [15:0] sos1_a_1,
    input signed [15:0] sos1_a_2,

    input signed [15:0] sos2_b_0,
    input signed [15:0] sos2_b_1,
    input signed [15:0] sos2_b_2,
    input signed [15:0] sos2_a_1,
    input signed [15:0] sos2_a_2
);

wire signed [15:0] sos0_out;
i16_biquad sos0(
    .A(A),
    .B(sos0_out),
    .b_0(sos0_b_0),
    .b_1(sos0_b_1),
    .b_2(sos0_b_2),
    .a_1(sos0_a_1),
    .a_2(sos0_a_2),
    .CLK(CLK),
    .RST(RST)
);

wire signed [15:0] sos1_out;
i16_biquad sos1(
    .A(sos0_out),
    .B(sos1_out),
    .b_0(sos1_b_0),
    .b_1(sos1_b_1),
    .b_2(sos1_b_2),
    .a_1(sos1_a_1),
    .a_2(sos1_a_2),
    .CLK(CLK),
    .RST(RST)
);

i16_biquad sos2(
    .A(sos1_out),
    .B(B),
    .b_0(sos2_b_0),
    .b_1(sos2_b_1),
    .b_2(sos2_b_2),
    .a_1(sos2_a_1),
    .a_2(sos2_a_2),
    .CLK(CLK),
    .RST(RST)
);

endmodule

