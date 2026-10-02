`timescale 1ns/1ps

module ripple_carry_adder_4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    ripple_carry_adder_4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("sim/ripple_carry_adder_4bit.vcd");
        $dumpvars(0, ripple_carry_adder_4bit_tb);

        // Test 1
        A = 4'b0000;
        B = 4'b0000;
        Cin = 0;
        #10;

        // Test 2
        A = 4'b0011;
        B = 4'b0010;
        Cin = 0;
        #10;

        // Test 3
        A = 4'b1011;
        B = 4'b0110;
        Cin = 0;
        #10;

        // Test 4
        A = 4'b1111;
        B = 4'b0001;
        Cin = 0;
        #10;

        // Test 5
        A = 4'b1111;
        B = 4'b1111;
        Cin = 0;
        #10;

        $finish;

    end

endmodule