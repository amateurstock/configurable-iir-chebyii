module u16_to_i16(
    input [15:0] A,
    output [15:0] B
);

assign B = {~A[15], A[14:0]};

endmodule

