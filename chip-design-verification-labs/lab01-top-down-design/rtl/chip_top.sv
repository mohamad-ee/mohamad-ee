`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 08:23:55 PM
// Design Name: 
// Module Name: chip_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module chip_top (
    input  wire switches,
    input  wire push_buttons,
    input  wire clock,
    input  wire reset,
    input  wire uart_rx,
    output wire leds,
    output wire uart_tx
);

    uart_tx u_uart_tx (
        .clock   (clock),
        .reset   (reset),
        .data_in (switches),
        .tx      (uart_tx)
    );

    uart_rx u_uart_rx (
        .clock    (clock),
        .reset    (reset),
        .rx       (uart_rx),
        .data_out (leds)
    );
endmodule
