BITS 64
GLOBAL strpbrk
SECTION .text

strpbrk:
    PUSH RBP                            ;Initialize all
    MOV RBP, RSP
    XOR RCX, RCX
    XOR RBX, RBX
    
    CMP RDI, 0                          ;Check if parameter is null
    JE end_null
    
    CMP RSI, 0
    JE end_null
    
    JMP loop

loop:
    XOR RBX, RBX                        ;Reset RBX
    MOV R8B, BYTE[RSI + RBX]            ;Put current char in R8B
    
    CMP BYTE[RDI + RCX], 0              ;compare current char with 0
    JE end_null

    CMP BYTE[RDI + RCX], R8B            ;Compare current char with the target value
    JE end
    
    INC RCX                             ;Go to the next char of string
    JMP compare_list

compare_list:
    MOV R8B, BYTE[RSI + RBX]
    CMP BYTE[RSI + RBX], 0              ;Check if all list is passed
    JE loop
    
    CMP BYTE[RDI + RCX], R8B            ;Compare current char with the target value
    JE end

    INC RBX
    JMP compare_list
    
end:
    MOV RAX, RDI                        ;Set rdi at good position as return value
    ADD RAX, RCX
    LEAVE
    RET

end_null:
    XOR RAX,RAX                         ;Set null as return value
    LEAVE
    RET
