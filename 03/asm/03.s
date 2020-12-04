.set SIZE, 20000

.section .data
fname: .asciz "input"
fmt: .asciz "%u\n"
readmode: .asciz "r"

.section .bss
.lcomm data, SIZE

.section .text
.globl main

main:

    # open input file
    movq $fname, %rdi
    movq $readmode, %rsi
    call fopen
    movq %rax, %rbx

    # read input into memory
    movq $data, %rdi
    movq $1, %rsi
    movq $SIZE, %rdx
    movq %rbx, %rcx
    call fread
    movl %eax, %ebp

    # close input file
    movq %rbx, %rdi
    call fclose

    # compute line length
    xorl %ebx, %ebx
    movq $data, %rcx
lenloop:
    incl %ebx
    incq %rcx
    cmpb $10, (%rcx)
    jne lenloop

    # part 1
    movl $3, %edi
    movl $1, %esi
    call go
    movl %eax, %r12d    # save for part 2

    movq $fmt, %rdi
    movl %eax, %esi
    xorl %eax, %eax
    call printf

    # part 2
    movl $1, %edi
    movl $1, %esi
    call go
    imull %eax, %r12d
    movl $5, %edi
    movl $1, %esi
    call go
    imull %eax, %r12d
    movl $7, %edi
    movl $1, %esi
    call go
    imull %eax, %r12d
    movl $1, %edi
    movl $2, %esi
    call go
    imull %eax, %r12d

    movq $fmt, %rdi
    movl %r12d, %esi
    xorl %eax, %eax
    call printf

    # done
    movl $60, %eax
    movl $0, %edi
    syscall

# ebx stores line length
# ebp stores total byte count
#
# edi is the x velocity
# esi is the y velocity
#
# r8d is the current line number
# r9d stores number of trees
# r10 is just there to point to data, idk if there's a better way to do this
go:

    xorl %r8d, %r8d
    xorl %r9d, %r9d
    movq $data, %r10

treeloop:
    xorl %edx, %edx
    movl %r8d, %eax
    imull %edi, %eax
    divl %ebx           # obtain (line num * x velocity) % line length in edx

    movl %ebx, %eax
    incl %eax
    imull %r8d, %eax
    imull %esi, %eax
    addl %eax, %edx     # now add (line length + 1) * line num * y velocity

    cmpl %ebp, %edx             # first check if it's in bounds
    jg done

    incl %r8d                   # (next line; goes here for nicer jumps below)

    cmpb $35, (%r10, %rdx)      # now check if it's a tree
    jne treeloop
    incl %r9d
    jmp treeloop

done:
    movl %r9d, %eax
    ret
