module parameterized_dot_product #(
    parameter integer N = 8,
    parameter integer Data_Width = 8
)(
    input  wire [Data_Width-1:0] x [0:N-1],
    input  wire [Data_Width-1:0] w [0:N-1],

    output wire [(2*Data_Width + $clog2(N))-1:0] result
);

    // Product outputs from the parallel multipliers
    wire [(2*Data_Width)-1:0] p [0:N-1];

    // ------------------------------------------------
    // Parallel multiplier
    // ------------------------------------------------
    parameterized_multiplier #(
        .N(N),
        .Data_Width(Data_Width)
    ) multiplier_block (
        .x(x),
        .w(w),
        .p(p)
    );

    // ------------------------------------------------
    // Parameterized adder tree
    // ------------------------------------------------
    parameterized_adder_tree #(
        .N(N),
        .Data_Width(Data_Width)
    ) adder_tree_block (
        .p(p),
        .result(result)
    );

endmodule