BITS 64
GLOBAL strlen
SECTION .text

strlen:                         ;Initialize all
    PUSH RBP
    MOV RBP,RSP
    XOR RCX, RCX
    CMP RDI, 0                  ;Check if parameter is null
    JE end
    JMP loop

loop:
    CMP BYTE[RDI + RCX], 0      ;Compare current char with 0
    JE end
    INC RCX                     ;Go to the next char of string
    JMP loop

end:
    MOV RAX,RCX                 ;Set RCX as return value
    LEAVE
    RET
