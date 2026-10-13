`timescale 1ns / 1ps

module adder8_behavioral (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire       cin,
    output reg  [7:0] sum,
    output reg        cout
);

    always @(*) begin
        {cout, sum} = {1'b0, a} + {1'b0, b} + cin;
    end

endmodule