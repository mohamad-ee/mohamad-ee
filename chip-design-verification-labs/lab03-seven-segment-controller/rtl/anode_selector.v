`timescale 1ns / 1ps

module anode_selector (
    input sys_clk,
    input rst,
    input mode,
    input pulse_en_2k,
    input [15:0] switch,

    input [3:0] dec_digits0,
    input [3:0] dec_digits1,
    input [3:0] dec_digits2,
    input [3:0] dec_digits3,
    input [3:0] dec_digits4,

    output reg [3:0] current_digit,
    output reg [7:0] anode
);

reg [2:0] ctr_anode;


  always @(posedge sys_clk or negedge rst) begin
    if (!rst) begin
      ctr_anode <= 0;
    end else if (pulse_en_2k) begin
      if (mode == 1'b1) begin

        if (ctr_anode >= 3) ctr_anode <= 0;
        else ctr_anode <= ctr_anode + 1;
      end else begin

        if (ctr_anode >= 4) ctr_anode <= 0;
        else ctr_anode <= ctr_anode + 1;
      end
    end
  end

  always @(posedge sys_clk or negedge rst) begin
    if (!rst) begin
      anode         <= 8'b11111111;
      current_digit <= 4'd0;
    end else if (pulse_en_2k) begin

      if (mode == 1'b1) begin

        // HEX MODE
        case (ctr_anode)
          0: begin
            anode <= 8'b11111110;
            current_digit <= switch[3:0];
          end
          1: begin
            anode <= 8'b11111101;
            current_digit <= switch[7:4];
          end
          2: begin
            anode <= 8'b11111011;
            current_digit <= switch[11:8];
          end
          3: begin
            anode <= 8'b11110111;
            current_digit <= switch[15:12];
          end
          default: begin
            anode <= 8'b11111111;
            current_digit <= 4'd0;
          end
        endcase
      end else begin

        // DEC MODE
        case (ctr_anode)
          0: begin
            anode <= 8'b11111110;
            current_digit <= dec_digits0;
          end
          1: begin
            anode <= 8'b11111101;
            current_digit <= dec_digits1;
          end
          2: begin
            anode <= 8'b11111011;
            current_digit <= dec_digits2;
          end
          3: begin
            anode <= 8'b11110111;
            current_digit <= dec_digits3;
          end
          4: begin
            anode <= 8'b11101111;
            current_digit <= dec_digits4;
          end
          default: begin
            anode <= 8'b11111111;
            current_digit <= 4'd0;
          end
        endcase
      end
    end
  end

endmodule
