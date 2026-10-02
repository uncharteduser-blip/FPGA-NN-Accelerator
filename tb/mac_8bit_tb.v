`timescale 1ns/1ps

module mac_8bit_tb;

    reg clk;
    reg reset;

    reg [7:0] A;
    reg [7:0] B;

    wire [15:0] ACC;

    mac_8bit uut (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .ACC(ACC)
    );

    initial begin

        $dumpfile("sim/mac_8bit.vcd");
        $dumpvars(0, mac_8bit_tb);

        clk = 0;
        reset = 1;
        A = 0;
        B = 0;

        #10;

        reset = 0;

        // 2 × 3 = 6
        A = 8'd2;
        B = 8'd3;
        #10;

        // 4 × 5 = 20
        A = 8'd4;
        B = 8'd5;
        #10;

        // 1 × 7 = 7
        A = 8'd1;
        B = 8'd7;
        #10;

        // 10 × 2 = 20
        A = 8'd10;
        B = 8'd2;
        #10;

        $finish;

    end

    always #5 clk = ~clk;

endmodule