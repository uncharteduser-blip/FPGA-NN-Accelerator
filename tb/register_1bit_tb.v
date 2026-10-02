`timescale 1ns/1ps

module register_1bit_tb;

    reg clk;
    reg D;

    wire Q;

    register_1bit uut (
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    initial begin
        $dumpfile("sim/register_1bit.vcd");
        $dumpvars(0, register_1bit_tb);

        clk = 0;
        D = 0;

        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;

        #10 $finish;
    end

    always #5 clk = ~clk;

endmodule