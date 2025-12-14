`timescale 1ns/1ns

module t_sos;

integer data_file;

reg signed [15:0] impulse;
wire signed [15:0] response;
reg CLK, RST;

wire signed [15:0] sos0_b_0 = 16'sd98;
wire signed [15:0] sos0_b_1 = 16'sd51;
wire signed [15:0] sos0_b_2 = 16'sd98;
wire signed [15:0] sos0_a_1 = 16'sd7845;
wire signed [15:0] sos0_a_2 = 16'sd0;

wire signed [15:0] sos1_b_0 = 16'sd16384;
wire signed [15:0] sos1_b_1 = 16'sd16384;
wire signed [15:0] sos1_b_2 = 16'sd0;
wire signed [15:0] sos1_a_1 = 16'sd17589;
wire signed [15:0] sos1_a_2 = -16'sd5811;

wire signed [15:0] sos2_b_0 = 16'sd16384;
wire signed [15:0] sos2_b_1 = -16'sd6928;
wire signed [15:0] sos2_b_2 = 16'sd16384;
wire signed [15:0] sos2_a_1 = 16'sd22801;
wire signed [15:0] sos2_a_2 = -16'sd11728;

wire signed [15:0] sos0_out;
i16_biquad sos0(
    .A(impulse),
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
    .B(response),
    .b_0(sos2_b_0),
    .b_1(sos2_b_1),
    .b_2(sos2_b_2),
    .a_1(sos2_a_1),
    .a_2(sos2_a_2),
    .CLK(CLK),
    .RST(RST)
);

initial begin
    CLK = 0;
    RST = 1;
    #4 RST = ~RST;
    #4 RST = ~RST;
end

initial begin
    $dumpfile ("waveform.vcd");
    $dumpvars (0, t_sos);

    data_file = $fopen("raw_data.txt", "w");
    
    #10 impulse = 16'sb0100000000000000;
    #15 impulse = 16'sb0;

    #2490 $fclose(data_file);
    $finish;
end

always #10 CLK <= ~CLK;

always @ (posedge CLK) begin
    $fwrite(data_file, "%d\n", response);
end

endmodule

