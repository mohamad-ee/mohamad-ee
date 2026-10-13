`timescale 1ns / 1ps

module chip_top #(
    parameter integer PRESS_CYCLES = 100_000_000
)(
    input sys_clk,
    input rst,
    input center_button,
    input down_button,
    input [15:0] switch,

    output [7:0] anode,
    output [6:0] cathodes
);

    wire pulse_en_2k;
    wire mode;
    wire [15:0] stored_value;
    wire [3:0] current_digit;

    wire [3:0] dec_digits0;
    wire [3:0] dec_digits1;
    wire [3:0] dec_digits2;
    wire [3:0] dec_digits3;
    wire [3:0] dec_digits4;

    clk_div uut_clk_div (
        .sys_clk(sys_clk),
        .rst(rst),
        .pulse_en_2k(pulse_en_2k)
    );

    mode_select #(
        .PRESS_CYCLES(PRESS_CYCLES)
    ) uut_mode (
        .sys_clk(sys_clk),
        .rst(rst),
        .center_button(center_button),
        .down_button(down_button),
        .switch(switch),
        .mode(mode),
        .stored_value(stored_value)
    );

    bcd_converter uut_bcd (
        .switch(stored_value),
        .dec_digits0(dec_digits0),
        .dec_digits1(dec_digits1),
        .dec_digits2(dec_digits2),
        .dec_digits3(dec_digits3),
        .dec_digits4(dec_digits4)
    );

    anode_selector uut_anode_sel (
        .sys_clk(sys_clk),
        .rst(rst),
        .mode(mode),
        .pulse_en_2k(pulse_en_2k),
        .switch(stored_value),
        .dec_digits0(dec_digits0),
        .dec_digits1(dec_digits1),
        .dec_digits2(dec_digits2),
        .dec_digits3(dec_digits3),
        .dec_digits4(dec_digits4),
        .current_digit(current_digit),
        .anode(anode)
    );

    cathode_decoder uut_decoder (
        .digit(current_digit),
        .cathodes(cathodes)
    );

endmodule