BITS 64
    GLOBAL memmove
    SECTION .text

memmove:
    PUSH RBP                    ;Init all
    MOV RBP,RSP
    XOR RCX, RCX

    CMP RDI, 0                  ;Check if all params are good
    JE end
    CMP RSI, 0
    JE end
    CMP RDI, RSI
    JE end

    JMP loop

loop:
    CMP RCX, RDX                ;Check if the number of modifieed elem is good
    JE end
    MOV BL, BYTE[RSI+RCX]       ;Temporary value for the new content
    MOV BYTE[RDI + RCX], BL     ;Change old value by new value
    INC RCX                     ;Go to the next char of string
    JMP loop

end:
    MOV RAX,RDI                 ;Set destination string as return value
    LEAVE
    RET
