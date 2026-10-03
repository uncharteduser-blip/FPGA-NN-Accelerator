`timescale 1ns/1ps

module parameterized_dot_product_tb;

    localparam N = 4;
    localparam Data_Width = 8;

    // Input vectors
    reg [Data_Width-1:0] x [0:N-1];
    reg [Data_Width-1:0] w [0:N-1];

    // Final result
    wire [(2*Data_Width + $clog2(N))-1:0] result;

    // ------------------------------------------------
    // Device Under Test
    // ------------------------------------------------
    parameterized_dot_product #(
        .N(N),
        .Data_Width(Data_Width)
    ) uut (
        .x(x),
        .w(w),
        .result(result)
    );

    // ------------------------------------------------
    // Test
    // ------------------------------------------------
    initial begin

        $dumpfile("sim/parameterized_dot_product.vcd");
        $dumpvars(0, parameterized_dot_product_tb);

        // x = [2, 4, 1, 3, 2, 1, 3, 4]
        x[0] = 8'd2;
        x[1] = 8'd4;
        x[2] = 8'd1;
        x[3] = 8'd3;
        x[4] = 8'd2;
        x[5] = 8'd1;
        x[6] = 8'd3;
        x[7] = 8'd4;

        // w = [3, 5, 7, 2, 1, 4, 2, 3]
        w[0] = 8'd3;
        w[1] = 8'd5;
        w[2] = 8'd7;
        w[3] = 8'd2;
        w[4] = 8'd1;
        w[5] = 8'd4;
        w[6] = 8'd2;
        w[7] = 8'd3;

        #10;

        // Expected:
        // 2*3 + 4*5 + 1*7 + 3*2
        // + 2*1 + 1*4 + 3*2 + 4*3
        // = 6 + 20 + 7 + 6 + 2 + 4 + 6 + 12
        // = 63

        if (result == 18'd39)
    $display("PASS: N=%d, Dot product = %d", N, result);
else
    $display("FAIL: Expected 39, got %d", result);
        $finish;

    end

endmodule