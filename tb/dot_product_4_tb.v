`timescale 1ns/1ps

module dot_product_4_tb;

    reg clk;
    reg reset;
    reg start;

    reg [7:0] x0, x1, x2, x3;
    reg [7:0] w0, w1, w2, w3;

    wire [23:0] result;
    wire done;


    dot_product_4 uut (

        .clk(clk),
        .reset(reset),
        .start(start),

        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),

        .w0(w0),
        .w1(w1),
        .w2(w2),
        .w3(w3),

        .result(result),
        .done(done)

    );


    // Clock
    always #5 clk = ~clk;


    initial begin

        $dumpfile("sim/dot_product_4.vcd");
        $dumpvars(0, dot_product_4_tb);


        // Initial values
        clk = 0;
        reset = 1;
        start = 0;

        x0 = 0;
        x1 = 0;
        x2 = 0;
        x3 = 0;

        w0 = 0;
        w1 = 0;
        w2 = 0;
        w3 = 0;


        // Reset
        #12;
        reset = 0;


        // Test:
        // [2,4,1,3] · [3,5,7,2]
        //
        // = 2×3 + 4×5 + 1×7 + 3×2
        // = 6 + 20 + 7 + 6
        // = 39

        x0 = 8'd2;
        x1 = 8'd4;
        x2 = 8'd1;
        x3 = 8'd3;

        w0 = 8'd3;
        w1 = 8'd5;
        w2 = 8'd7;
        w3 = 8'd2;


        // Start computation
        #3;
        start = 1;

        #10;
        start = 0;


        // Wait for computation to finish
        wait(done);


        // Check result
        if (result == 24'd39) begin

            $display("PASS: Dot product = %d", result);

        end

        else begin

            $display("FAIL: Expected 39, got %d", result);

        end


        #10;
        $finish;

    end

endmodule