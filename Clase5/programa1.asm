;-----------------------------------------
; uint32_t cuenta = 0;
; uint8_t i = 0;
;
; for(; cuenta <= 50; cuenta += 2)
; {
;     i++;
; }
;
; uint16_t resultado = i * cuenta;
;-----------------------------------------

ORG 0000H

; Variables en RAM interna
CUENTA0   EQU 30H   ; byte bajo de cuenta uint32_t
CUENTA1   EQU 31H
CUENTA2   EQU 32H
CUENTA3   EQU 33H   ; byte alto
I         EQU 34H   ; uint8_t
RES_L     EQU 35H   ; resultado uint16_t byte bajo
RES_H     EQU 36H   ; resultado uint16_t byte alto

INICIO:
    ; cuenta = 0
    MOV CUENTA0, #00H
    MOV CUENTA1, #00H
    MOV CUENTA2, #00H
    MOV CUENTA3, #00H

    ; i = 0
    MOV I, #00H

FOR_LOOP:
    ; Comparar cuenta > 50
    ; Como cuenta solo llega a 52, basta revisar byte bajo
    MOV A, CUENTA0
    CLR C
    SUBB A, #51       ; si cuenta >= 51, entonces cuenta > 50
    JNC FIN_FOR

    ; i++
    INC I

    ; cuenta += 2, usando suma de 32 bits
    MOV A, CUENTA0
    ADD A, #02H
    MOV CUENTA0, A

    MOV A, CUENTA1
    ADDC A, #00H
    MOV CUENTA1, A

    MOV A, CUENTA2
    ADDC A, #00H
    MOV CUENTA2, A

    MOV A, CUENTA3
    ADDC A, #00H
    MOV CUENTA3, A

    SJMP FOR_LOOP

FIN_FOR:
    ; resultado = i * cuenta
    ; Como cuenta termina en 52, usamos CUENTA0
    MOV A, I
    MOV B, CUENTA0
    MUL AB            ; resultado de 16 bits queda en B:A

    MOV RES_L, A      ; byte bajo
    MOV RES_H, B      ; byte alto

AQUI:
    SJMP AQUI

END
