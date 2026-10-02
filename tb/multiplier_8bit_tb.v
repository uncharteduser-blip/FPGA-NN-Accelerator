`timescale 1ns/1ps

module multiplier_8bit_tb;

    reg [7:0] A;
    reg [7:0] B;

    wire [15:0] P;

    multiplier_8bit uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin

        $dumpfile("sim/multiplier_8bit.vcd");
        $dumpvars(0, multiplier_8bit_tb);

        // Test 1
        A = 8'd0;
        B = 8'd5;
        #10;

        // Test 2
        A = 8'd3;
        B = 8'd4;
        #10;

        // Test 3
        A = 8'd10;
        B = 8'd7;
        #10;

        // Test 4
        A = 8'd15;
        B = 8'd15;
        #10;

        // Test 5
        A = 8'd255;
        B = 8'd255;
        #10;

        $finish;

    end

endmodule