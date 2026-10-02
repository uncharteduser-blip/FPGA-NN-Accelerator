`timescale 1ns/1ps

module register_8bit_tb;

    reg clk;
    reg [7:0] D;

    wire [7:0] Q;

    register_8bit uut (
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    initial begin

        $dumpfile("sim/register_8bit.vcd");
        $dumpvars(0, register_8bit_tb);

        clk = 0;
        D = 8'b00000000;

        #10 D = 8'b10101010;
        #10 D = 8'b11110000;
        #10 D = 8'b00110011;
        #10 D = 8'b11111111;
        #10 D = 8'b00001111;

        #10 $finish;

    end

    always #5 clk = ~clk;

endmodule