`timescale 1ns/1ps

module parallel_dot_product_4_tb;

    reg [7:0] x0;
    reg [7:0] x1;
    reg [7:0] x2;
    reg [7:0] x3;

    reg [7:0] w0;
    reg [7:0] w1;
    reg [7:0] w2;
    reg [7:0] w3;

    wire [17:0] result;


    // Unit Under Test
    parallel_dot_product_4 uut (

        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),

        .w0(w0),
        .w1(w1),
        .w2(w2),
        .w3(w3),

        .result(result)

    );


    initial begin

        // Save waveform
        $dumpfile("sim/parallel_dot_product_4.vcd");
        $dumpvars(0, parallel_dot_product_4_tb);


        // Test 1
        x0 = 8'd2;
        x1 = 8'd4;
        x2 = 8'd1;
        x3 = 8'd3;

        w0 = 8'd3;
        w1 = 8'd5;
        w2 = 8'd7;
        w3 = 8'd2;

        #10;


        // Check result
        if (result == 18'd39) begin

            $display("PASS: Result = %d", result);

        end

        else begin

            $display("FAIL: Expected 39, got %d", result);

        end


        #10;
        $finish;

    end

endmodule