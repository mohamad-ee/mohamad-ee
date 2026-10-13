`timescale 1ns / 1ps

module chip_top_tb;

    reg sys_clk;
    reg rst;
    reg center_button;
    reg down_button;
    reg [15:0] switch;

    wire [7:0] anode;
    wire [6:0] cathodes;

    // Simulation only: 10 clock cycles = 100 ns.
    chip_top #(.PRESS_CYCLES(10))
     uut (
        .sys_clk(sys_clk),
        .rst(rst),
        .center_button(center_button),
        .down_button(down_button),
        .switch(switch),
        .anode(anode),
        .cathodes(cathodes)
    );

    // 100 MHz clock.
    always #5 sys_clk = ~sys_clk;

    initial begin
        sys_clk       = 0;
        rst           = 0;
        center_button = 0;
        down_button   = 0;
        switch        = 16'h0000;

        // Release the active-low reset.
        #50;
        rst = 1;
        #50;

        // A short press must not store the value.
        switch = 16'h9999;
        center_button = 1;
        #50;
        center_button = 0;
        #100;

        // Store 0x1234 = 4660, decimal mode.
        switch = 16'h1234;
        center_button = 1;
        #100;
        center_button = 0;
        #3_000_000;

        // Change switches without pressing:
        // stored_value must remain 0x1234.
        switch = 16'hABCD;
        #1_000_000;

        // Store 0xABCD, hexadecimal mode.
        down_button = 1;
        #100;
        down_button = 0;
        #3_000_000;

        // Store the maximum value, decimal mode.
        switch = 16'hFFFF;
        center_button = 1;
        #100;
        center_button = 0;
        #3_000_000;

        // Reset must clear the stored value.
        rst = 0;
        #50;
        rst = 1;
        #3_000_000;

        $stop;
    end

endmodule