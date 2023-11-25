%include 'in_out.asm'
section .data
msg db "Наименьшее число: ",0h
A dd '83'
B dd '73'
C dd '30'
section .bss
min resb 10
section .text
global _start
_start:
; ---------- Записываем 'B' в переменную 'min'
mov ecx,[B] ; 'ecx = B'
mov [min],ecx ; 'min = B'
; ---------- Сравниваем 'B' и 'С' (как символы)
cmp ecx,[B] ; Сравниваем 'B' и 'С'
jg check_B ; если 'B<C', то переход на метку 'check_A',
mov ecx,[C] ; иначе 'ecx = C'
mov [min],ecx ; 'min = C'
; ---------- Преобразование 'min(B,C)' из символа в число
check_B:
mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax ; запись преобразованного числа в `min`
; ---------- Сравниваем 'min(B,C)' и 'A' (как числа)
mov ecx,[min]
cmp ecx,[A] ; Сравниваем 'min(B,C)' и 'A'
jl fin ; если 'min(B,C)<A', то переход на 'fin',
mov ecx,[A] ; иначе 'ecx = A'
mov [min],ecx
; ---------- Вывод результата
fin:
mov eax, msg
call sprint ; Вывод сообщения 'Наименьшее число: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход
