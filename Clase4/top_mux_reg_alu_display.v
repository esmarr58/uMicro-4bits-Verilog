//====================================================
// TOP 3: Instanciación con lógica secuencial
//====================================================
// Objetivo:
// - Introducir registros (memoria)
// - Ver diferencia entre combinacional y secuencial
// - Flujo tipo procesador
//
// Módulos usados:
// - mux2_4
// - reg4
// - alu4
// - hex7seg
//
// Flujo:
// A/B → mux → registro → ALU → display
//====================================================

module top_mux_reg_alu_display (
    input clk,            // Reloj
    input sel,            // Selector del mux
    input [3:0] A,        // Entrada 1
    input [3:0] B,        // Entrada 2
    input [3:0] C,        // Segundo operando ALU
    output [6:0] seg      // Display
);

//--------------------------------------------
// SEÑALES INTERNAS
//--------------------------------------------

wire [3:0] mux_out;
wire [3:0] reg_out;
wire [3:0] alu_out;

//--------------------------------------------
// INSTANCIA 1: MUX
//--------------------------------------------
// Selecciona entre A o B
//--------------------------------------------

mux2_4 mux0 (
    .a(A),
    .b(B),
    .sel(sel),
    .y(mux_out)
);

//--------------------------------------------
// INSTANCIA 2: REGISTRO
//--------------------------------------------
// Guarda el valor seleccionado
//--------------------------------------------

reg4 reg0 (
    .clk(clk),
    .d(mux_out),
    .q(reg_out)
);

//--------------------------------------------
// INSTANCIA 3: ALU
//--------------------------------------------

alu4 alu0 (
    .A(reg_out),
    .B(C),
    .op(2'b00),      // operación fija (ejemplo: suma)
    .Y(alu_out)
);

//--------------------------------------------
// INSTANCIA 4: DISPLAY
//--------------------------------------------

hex7seg disp0 (
    .bin(alu_out),
    .seg(seg)
);

endmodule
