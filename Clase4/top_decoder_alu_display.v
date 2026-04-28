//====================================================
// TOP 2: Instanciación de varios módulos combinacionales
//====================================================
// Objetivo:
// - Conectar módulos entre sí
// - Usar señales internas (wire)
// - Flujo de datos entre módulos
//
// Módulos usados:
// - decoder
// - alu4
// - hex7seg
//
// Flujo:
// switches → decoder → alu4 → display
//====================================================

module top_decoder_alu_display (
    input  [1:0] sel,     // Selector para decoder
    input  [3:0] A,       // Operando A
    input  [3:0] B,       // Operando B
    output [6:0] seg      // Display
);

//--------------------------------------------
// SEÑALES INTERNAS
//--------------------------------------------
// Estas señales conectan módulos entre sí
//--------------------------------------------

wire [3:0] dec_out;
wire [3:0] alu_out;

//--------------------------------------------
// INSTANCIA 1: DECODER
//--------------------------------------------

decoder dec0 (
    .in(sel),
    .out(dec_out)
);

//--------------------------------------------
// INSTANCIA 2: ALU
//--------------------------------------------
// La ALU usa:
// - A y B (entradas)
// - dec_out como control (ejemplo didáctico)
//--------------------------------------------

alu4 alu0 (
    .A(A),
    .B(B),
    .op(dec_out),     // operación desde decoder
    .Y(alu_out)
);

//--------------------------------------------
// INSTANCIA 3: DISPLAY
//--------------------------------------------

hex7seg disp0 (
    .bin(alu_out),
    .seg(seg)
);

endmodule
