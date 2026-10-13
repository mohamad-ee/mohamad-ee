`timescale 1ns / 1ps

module clk_div (
    input sys_clk,
    input rst,
    output reg pulse_en_2k
);

    reg [15:0] cnt_50k;

    always @(posedge sys_clk or negedge rst) begin
        if (!rst) begin
            cnt_50k     <= 16'd0;
            pulse_en_2k <= 1'b0;
        end else begin
            pulse_en_2k <= 1'b0;

            if (cnt_50k == 16'd49999) begin
                cnt_50k     <= 16'd0;
                pulse_en_2k <= 1'b1;
            end else begin
                cnt_50k <= cnt_50k + 1'b1;
            end
        end
    end

endmodule