.data
n: .long 47

strnu: .asciz "nu este\n"
strda: .asciz "este\n" 

.text
.global main
main:
    mov x, %eax
    mov $1, %ebx
    mov $2, %ecx
    cmp %ecx, %eax
    je afis_da
    mov $0, %edx
    div %ecx
    mov %eax, %ecx

cond: 
    mov x, %eax
    add $1, %ebx
    cmp %eax, %ecx
    jge afis_da 
    mov $0, %edx
    div %ebx
    cmp $0, %edx
    je afis_nu
    jmp cond

afis_nu:

    mov $4, %eax
    mov $1, %ebx
    mov $strnu, %ecx
    mov $9, %edx
    int $0x80
    jmp et_exit

afis_da:

    mov $4, %eax
    mov $1, %ebx
    mov $strda, %ecx
    mov $6, %edx
    int $0x80


et_exit:

    movl $1, %eax
    movl $0, %ebx
    int $0x80