module top_mux2a1 (
    input wire A,
    input wire B,
    input wire S,
    output wire Y
);

wire notS;
wire and1_out;
wire and2_out;

// ~S
not_gate U1 (
    .A(S),
    .Y(notS)
);

// ~S & A
and_gate U2 (
    .A(notS),
    .B(A),
    .Y(and1_out)
);

// S & B
and_gate U3 (
    .A(S),
    .B(B),
    .Y(and2_out)
);

// (~S & A) | (S & B)
or_gate U4 (
    .A(and1_out),
    .B(and2_out),
    .Y(Y)
);

endmodule
