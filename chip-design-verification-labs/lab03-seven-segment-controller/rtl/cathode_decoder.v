`timescale 1ns / 1ps
module cathode_decoder (
    input [3:0] digit,
    output reg [6:0] cathodes
);

  always @(*) begin
    case (digit)
      4'h0: cathodes = 7'b1000000;
      4'h1: cathodes = 7'b1111001;
      4'h2: cathodes = 7'b0100100;
      4'h3: cathodes = 7'b0110000;
      4'h4: cathodes = 7'b0011001;
      4'h5: cathodes = 7'b0010010;
      4'h6: cathodes = 7'b0000010;
      4'h7: cathodes = 7'b1111000;
      4'h8: cathodes = 7'b0000000;
      4'h9: cathodes = 7'b0010000;
      4'hA: cathodes = 7'b0001000;
      4'hB: cathodes = 7'b0000011;
      4'hC: cathodes = 7'b1000110;
      4'hD: cathodes = 7'b0100001;
      4'hE: cathodes = 7'b0000110;
      4'hF: cathodes = 7'b0001110;
      default: cathodes = 7'b1111111;
    endcase
  end

endmodule
