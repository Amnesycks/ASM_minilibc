BITS 64
GLOBAL strchr
SECTION .text

strchr:
    PUSH RBP                    ;Initialize all
    MOV RBP,RSP
    XOR RCX, RCX
    CMP RDI, 0                  ;Check if parameter is null
    JE end
    JMP loop

loop:
    CMP BYTE[RDI + RCX], SIL    ;Compare current char with the target value
    JE end
    CMP BYTE[RDI + RCX], 0      ;compare current char with 0
    JE end_null
    INC RCX                     ;Go to the next char of string
    JMP loop

end:
    MOV RAX, RDI                ;Set rdi as return value
    ADD RAX,RCX                 ;Set value of rdi at good pos
    LEAVE
    RET

end_null:
    XOR RAX,RAX                 ;Set null as return value
    LEAVE
    RET
