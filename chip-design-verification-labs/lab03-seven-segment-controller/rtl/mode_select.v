`timescale 1ns / 1ps

module mode_select #(
    parameter integer PRESS_CYCLES = 100_000_000
)(
    input sys_clk,
    input rst,
    input center_button,
    input down_button,
    input [15:0] switch,

    output reg mode,
    output reg [15:0] stored_value
);

    reg [1:0] center_sync;
    reg [1:0] down_sync;

    reg [26:0] center_count;
    reg [26:0] down_count;

    // Synchronize the buttons to sys_clk.
    always @(posedge sys_clk or negedge rst) begin
        if (!rst) begin
            center_sync <= 2'b00;
            down_sync   <= 2'b00;
        end else begin
            center_sync <= {center_sync[0], center_button};
            down_sync   <= {down_sync[0], down_button};
        end
    end

    // Measure the press duration and store the switches.
    always @(posedge sys_clk or negedge rst) begin
        if (!rst) begin
            center_count <= 27'd0;
            down_count   <= 27'd0;
            stored_value <= 16'd0;
            mode         <= 1'b0;
        end else begin

            // Center button has priority if both are pressed.
            if (center_sync[1]) begin
                down_count <= 27'd0;

                if (center_count < PRESS_CYCLES) begin
                    center_count <= center_count + 1'b1;

                    if (center_count == PRESS_CYCLES - 1) begin
                        stored_value <= switch;
                        mode         <= 1'b0;
                    end
                end

            end else if (down_sync[1]) begin
                center_count <= 27'd0;

                if (down_count < PRESS_CYCLES) begin
                    down_count <= down_count + 1'b1;

                    if (down_count == PRESS_CYCLES - 1) begin
                        stored_value <= switch;
                        mode         <= 1'b1;
                    end
                end

            end else begin
                center_count <= 27'd0;
                down_count   <= 27'd0;
            end
        end
    end

endmodule