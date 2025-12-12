module i36_delay(
    input CLK,
    input RST,
    input [35:0] STORE,
    output reg [35:0] READ
);

always @ (posedge CLK, negedge RST) begin
    if (!RST) begin
        READ <= 0;
    end else begin
        READ <= STORE;
    end
end

endmodule

