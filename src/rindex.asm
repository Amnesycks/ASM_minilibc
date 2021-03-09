BITS 64
GLOBAL rindex
SECTION .text

rindex:
    PUSH RBP                    ;Initialize all
    MOV RBP,RSP
    XOR RAX, RAX
    XOR RCX, RCX
    CMP RDI, 0                  ;Check if parameter is null
    JE end
    JMP loop

loop:
    CMP BYTE[RDI + RCX], SIL    ;Compare current char with the target value
    JE copy

    CMP BYTE[RDI + RCX], 0      ;compare current char with 0
    JE end

    INC RCX                     ;Go to the next char of string
    JMP loop

copy:
    MOV RAX, RDI                ;Cange the return value by the new index
    ADD RAX, RCX

    CMP BYTE[RDI + RCX], 0      ;compare current char with 0
    JE end

    INC RCX
    JMP loop
    
end:
    LEAVE
    RET

