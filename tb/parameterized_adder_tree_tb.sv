`timescale 1ns/1ps

module parameterized_adder_tree_tb;

    localparam N = 8;
    localparam Data_Width = 8;

    reg [(2*Data_Width)-1:0] p [0:N-1];

    wire [(2*Data_Width + $clog2(N))-1:0] result;

    parameterized_adder_tree #(
        .N(N),
        .Data_Width(Data_Width)
    ) uut (
        .p(p),
        .result(result)
    );

    initial begin

        $dumpfile("sim/parameterized_adder_tree.vcd");
        $dumpvars(0, parameterized_adder_tree_tb);

        // Give the tree 8 products
        p[0] = 16'd1;
        p[1] = 16'd2;
        p[2] = 16'd3;
        p[3] = 16'd4;
        p[4] = 16'd5;
        p[5] = 16'd6;
        p[6] = 16'd7;
        p[7] = 16'd8;

        #10;

        if (result == 19'd36)
            $display("PASS: result = %d", result);
        else
            $display("FAIL: expected 36, got %d", result);

        #10;
        $finish;

    end

endmodule