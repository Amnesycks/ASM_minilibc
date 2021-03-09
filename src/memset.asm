BITS 64
    GLOBAL memset
    SECTION .text

memset:
    PUSH RBP                    ;Init all
    MOV RBP,RSP
    XOR RCX, RCX
    CMP RDI, 0                  ;Check if parameter is null
    JE end
    JMP loop

loop:
    CMP RCX, RDX                ;Compare if nis reach
    JE end
    MOV BYTE[RDI + RCX], SIL    ;Set the new value
    INC RCX                     ;Go to the next char of string
    JMP loop

end:
    MOV RAX,RDI                 ;Set the string send in parameter as return value
    LEAVE
    RET
