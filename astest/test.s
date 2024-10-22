#test.s
.data
    .equ  callSet, 0x2000000
    .equ  writeMask, 0x01

.text
.globl _my_printf
.globl _my_strlen

_my_printf:
    pushq %rbp
    movq %rax, %r8

    call _my_strlen
    movq %rax, %rdx

    movq $callSet + 4, %rax
    movq $writeMask, %rdi
    leaq (%r8), %rsi
    syscall

    popq %rbp

    movq    $0, %rax
    retq

_my_strlen:
    pushq %rbp

    movq %rax, %rdi
    xorq %rcx, %rcx
    notq %rcx
    movq $0, %rax
    repne scasb
    notq %rcx
    decq %rcx
    movq %rcx, %rax
    popq %rbp

    retq

