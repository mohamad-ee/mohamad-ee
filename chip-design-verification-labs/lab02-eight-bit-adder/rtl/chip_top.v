`timescale 1ns / 1ps

module chip_top (
    input  wire [15:0] SW,
    input  wire        cin,
    output wire [8:0]  LED
);

    adder8_structural dut (
//  adder8_behavioral dut (
        .a(SW[7:0]),
        .b(SW[15:8]),
        .cin(cin),
        .sum(LED[7:0]),
        .cout(LED[8])
    );

endmodule