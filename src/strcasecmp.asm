BITS 64
GLOBAL strcasecmp
SECTION .text

strcasecmp:
    PUSH RBP                      ;Init all
    MOV RBP,RSP
    XOR RCX, RCX
    CMP RDI, 0                    ;Check if parameter is null
    JE end
    CMP RSI, 0
    JE end
    JMP loop

loop:
    MOV AL, BYTE[RDI + RCX]     ;Put char in temp  register
    MOV BL, BYTE[RSI + RCX]
    
    JMP convert_one

convert_one:                    ;If char is lowercase, convert it to uppercase for 1st string
    CMP AL, 90
    JG convert_two
    CMP AL, 65
    JB  convert_two
    ADD AL, 32
    JMP convert_two

convert_two:                    ;If char is lowercase, convert it to uppercase for 2nd string
    CMP BL, 90
    JG add_loop
    CMP BL, 65
    JB  add_loop
    ADD BL, 32
    JMP add_loop

add_loop:                       ;Perform comparaison
    CMP AL, BL
    JNE end

    CMP AL, 0
    JE end

    CMP BL, 0
    JE end

    INC RCX                     ;Same char we continue loop
    JMP loop
    
end:
    MOVZX RAX, AL               ;Calculate the difference for result
    MOVZX RBX, BL
    SUB RAX, RBX
    LEAVE
    RET
