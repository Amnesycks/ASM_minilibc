BITS 64
GLOBAL strcmp
SECTION .text

strcmp:
    PUSH RBP                    ;Init all
    MOV RBP,RSP
    XOR RCX, RCX
    CMP RDI, 0                  ;Check if parameter is null
    JE end
    CMP RSI, 0
    JE end
    JMP loop

loop:
    MOV BH, BYTE[RDI+RCX]
    MOV BL, BYTE[RSI+RCX]
    CMP BYTE[RDI + RCX], BL      ;Compare the 'x'th char of the two strings
    JNE end
    CMP BYTE[RDI + RCX], 0      ;Check if strings finished
    JE end
    INC RCX                     ;Go to the next char of string
    JMP loop

end:
    MOVZX EAX, BH               ;mov value in bigger register because the result can be negative
    MOVZX EBX, BL
    SUB EAX, EBX
    LEAVE
    RET
