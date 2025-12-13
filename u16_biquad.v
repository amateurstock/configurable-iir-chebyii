module u16_biquad(
    input CLK, RST,
    
    input unsigned [15:0] A,
    output signed [15:0] B,

    input signed [15:0] b_0,
    input signed [15:0] b_1,
    input signed [15:0] b_2,
    input signed [15:0] a_1,
    input signed [15:0] a_2
);

wire signed [17:0] feedback;
wire signed [15:0] A_signed;

wire signed [31:0] P_b0;
wire signed [31:0] P_b1;
wire signed [31:0] P_b2;
wire signed [33:0] P_a1;
wire signed [33:0] P_a2;

wire signed [35:0] S_0;
wire signed [35:0] S_1;
wire signed [35:0] S_2;

wire signed [35:0] Z_0;
wire signed [35:0] Z_1;

// Module instantiation
// ---Conversion
u16_to_i16 to_signed(
    .A(A),
    .B(A_signed)
);

// ---Multipliers
i16_mul mul_b0(
    .A(A_signed),
    .B(b_0),
    .P(P_b0)
);

i16_mul mul_b1(
    .A(A_signed),
    .B(b_1),
    .P(P_b1)
);

i16_mul mul_b2(
    .A(A_signed),
    .B(b_2),
    .P(P_b2)
);

i18_mul mul_a1(
    .A(feedback),
    .B_coef(a_1),
    .P(P_a1)
);

i18_mul mul_a2(
    .A(feedback),
    .B_coef(a_2),
    .P(P_a2)
);

// ---Accumulators
i36_acc ACC_0(
    .A(P_a2),
    .B(P_b2),
    ._Z(36'sd0),
    .S(S_0)
);

i36_acc ACC_1(
    .A(P_a1),
    .B(P_b1),
    ._Z(Z_0),
    .S(S_1)
);

i36_acc ACC_2(
    .A(34'sd0),
    .B(P_b0),
    ._Z(Z_1),
    .S(S_2)
);

// ---Time delays
i36_delay DELAY_0(
    .CLK(CLK),
    .RST(RST),
    .STORE(S_0),
    .READ(Z_0)
);

i36_delay DELAY_1(
    .CLK(CLK),
    .RST(RST),
    .STORE(S_1),
    .READ(Z_1)
);

// ---Truncator
i36_trunc OUT(
    .A(S_2),
    .B(feedback),
    .B_sat(B)
);

endmodule

