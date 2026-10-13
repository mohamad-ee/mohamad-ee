`timescale 1ns / 1ps
module bcd_converter (
    input [15:0] switch,
    output reg [3:0] dec_digits0,
    output reg [3:0] dec_digits1,
    output reg [3:0] dec_digits2,
    output reg [3:0] dec_digits3,
    output reg [3:0] dec_digits4
);

  reg [15:0] temp;

  always @(*) begin
    temp = switch;

    dec_digits0 = temp % 10;
    temp = temp / 10;

    dec_digits1 = temp % 10;
    temp = temp / 10;

    dec_digits2 = temp % 10;
    temp = temp / 10;

    dec_digits3 = temp % 10;
    temp = temp / 10;

    dec_digits4 = temp % 10;
  end


endmodule
