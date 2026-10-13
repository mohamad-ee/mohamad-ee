`timescale 1ns / 1ps

module tb_adder8;

    reg [7:0] a, b;
    reg cin;

    wire [7:0] sum_beh, sum_str;
    wire cout_beh, cout_str;

    adder8_behavioral dut_beh (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum_beh),
        .cout(cout_beh)
    );

    adder8_structural dut_str (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum_str),
        .cout(cout_str)
    );

    initial begin
        // Test 1: No carry-out
        $display("Time: 0 ns");
        a = 8'd3; b = 8'd4; cin = 1'b0; #10;

        // Test 2: With carry-out
        $display("Time: 10 ns");
        a = 8'd200; b = 8'd100; cin = 1'b0; #10;

        // Test 3: Maximum sum without carry-out
        $display("Time: 20 ns");
        a = 8'd255; b = 8'd0; cin = 1'b0; #10;

        // Test 4: Maximum total result
        $display("Time: 30 ns");
        a = 8'd255; b = 8'd255; cin = 1'b1; #10;

        // Test 5: Carry-in propagation
        $display("Time: 40 ns");
        a = 8'd255; b = 8'd0; cin = 1'b1; #10;

        $finish;
    end

    initial begin
         $monitor("a=%b, b=%b, cin=%b, sum_beh=%b, cout_beh=%b, sum_str=%b, cout_str=%b", a, b, cin, sum_beh, cout_beh, sum_str, cout_str);
    end

endmodule