BITS 64
GLOBAL strncmp
SECTION .text

strncmp:
    PUSH RBP                    ;Init all
    MOV RBP,RSP
    XOR RAX, RAX
    XOR RBX, RBX
    XOR RCX, RCX
    CMP RDI, 0                  ;Check if parameter is null
    JE end
    CMP RSI, 0
    JE end
    JMP loop

loop:
    CMP RCX, RDX                ;Check if n is reach
    JE end
    
    MOV AL, BYTE[RDI+RCX]
    MOV BL, BYTE[RSI+RCX]

    CMP AL, BL                  ;Compare the 'x'th char of the two strings
    JNE end

    CMP AL, 0                   ;Check if strings finished
    JE end

    CMP BL, 0                   ;Check if strings finished
    JE end

    INC RCX                     ;Go to the next char of string
    JMP loop

end:
    MOVZX RAX, AL               ;mov value in bigger register because the result can be negative
    MOVZX RBX, BL               ;Perform subtraction to get the difference
    SUB RAX, RBX
    LEAVE
    RET
