//====================================================
// TOP 1 (MODIFICADO): MUX + DISPLAY
//====================================================
// Objetivo:
// - Aprender instanciación con MÁS de un módulo
// - Introducir el concepto de selección (MUX)
// - Usar constantes (parameter)
//
// Funcionamiento:
// - Se tienen dos valores constantes
// - El MUX selecciona uno según 'sel'
// - El valor seleccionado se muestra en display
//====================================================

module top_mux_hex7seg (
    input sel,          // Selector del MUX
    output [6:0] seg    // Salida al display
);

//--------------------------------------------
// CONSTANTES (PARAMETERS)
//--------------------------------------------
// Puedes cambiar estos valores fácilmente
//--------------------------------------------

parameter VALOR_0 = 4'b0011; // 3
parameter VALOR_1 = 4'b1010; // A

//--------------------------------------------
// SEÑAL INTERNA
//--------------------------------------------

wire [3:0] mux_out;

//--------------------------------------------
// INSTANCIA 1: MUX
//--------------------------------------------
// Selecciona entre dos constantes
//--------------------------------------------

mux2_4 mux0 (
    .a(VALOR_0),   // Entrada 0
    .b(VALOR_1),   // Entrada 1
    .sel(sel),     // Selector
    .y(mux_out)    // Salida
);

//--------------------------------------------
// INSTANCIA 2: DISPLAY
//--------------------------------------------

hex7seg disp0 (
    .bin(mux_out),
    .seg(seg)
);

endmodule
