/*
`timescale 1ns/1ns

module mul_tb;

reg [7:0] IN;
wire signed [7:0] P;

wire [3:0] A = IN[3:0];
wire [3:0] B = IN[7:4];

wire signed [3:0] OUTPUT = P[5:2];
wire OV;

i4_mul MUL1(
    .A(IN[3:0]),
    .B(IN[7:4]),
    .P(P),
    .OV(OV)
);

// Set simulation end
initial begin
    $dumpfile ("waveform.vcd");
    $dumpvars (0, mul_tb);

    IN = 0;

    #2600 $finish;
end

always #10 IN <= IN + 1;

endmodule;
*/

module mul_tb;

reg [7:0] IN;
wire signed [3:0] P;
wire OV;

wire [3:0] A = IN[3:0];
wire [3:0] B = IN[7:4];

i4_mul MUL1(
    .A(A),
    .B(B),
    .P(P),
    .OV(OV)
);

initial begin
    $dumpfile ("waveform.vcd");
    $dumpvars (0, mul_tb);

    IN = 0;

    #2560 $finish;
end

always #10 IN <= IN + 1;

endmodule

