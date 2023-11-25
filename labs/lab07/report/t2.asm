%include 'in_out.asm'

section .data
    prompt_x db "Введите значение x: ", 0
    prompt_a db "Введите значение a: ", 0
    result_msg db "Результат: ", 0
    new_line db 10, 0

section .bss
    x resd 1     ; переменная для хранения введенного значения x
    a resd 1     ; переменная для хранения введенного значения a
    result resd 1  ; переменная для хранения результата

section .text
global _start

_start:
    ; запрос значения x
    mov edx, prompt_x
    call sprint
    call sread
    mov [x], eax  ; сохраняем x

    ; запрос значения a
    mov edx, prompt_a
    call sprint
    call sread
    mov [a], eax  ; сохраняем a

    ; вычисление и вывод результата
    mov eax, [a]
    cmp eax, 1
    je a_is_1     ; если a=1, переходим к вычислению 10 + x

    imul eax, eax  ; умножаем a на само себя
    jmp print_result

a_is_1:
    add eax, [x]  ; вычисляем 10 + x

print_result:
    mov [result], eax  ; сохраняем результат
    mov edx, result_msg
    call sprint
    mov eax, [result]
    call iprintLF

    ; выход
    call quit
