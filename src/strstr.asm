BITS 64
GLOBAL strstr
SECTION .text

strstr:
    PUSH RBP                            ;Initialize all
    MOV RBP,RSP
    XOR RCX, RCX

    CMP RSI, 0                          ;Error handling
    JE end_empty
    
    CMP RDI, 0
    JE end_null

    JMP loop

loop:
    XOR RDX, RDX                        ;Prepare all temp register
    MOV AL, BYTE[RDI + RCX]
    MOV BL, BYTE[RSI]
    MOV R8, RCX
    INC RCX

    CMP AL, BL
    JE compare_needle
    
    CMP AL, 0                           ;compare current char with 0
    JE end_null

compare_needle:
    MOV AL, BYTE[RDI + R8]              ;Incremeante all register used in loop
    MOV BL, BYTE[RSI + RDX]
    INC RDX
    INC R8

    CMP BL, 0
    JE end

    CMP AL, 0                           ;compare current char with 0
    JE end_null

    CMP AL, BL
    JNE loop
    JMP compare_needle

end:
    DEC RCX                             ;Set rdi at good position as return value
    MOV RAX, RDI
    ADD RAX, RCX
    LEAVE
    RET

end_null:
    XOR RAX, RAX                         ;Set null as return value
    LEAVE
    RET

end_empty:                              ;Special case for return an empty string
    MOV RAX, RDI
    LEAVE
    RET
