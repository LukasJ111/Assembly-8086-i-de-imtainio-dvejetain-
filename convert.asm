.model small

.stack 100h

.data
    ivesk    db "Iveskit desimtaini skaiciu:$"
    skaicius dw 0
    
.code
    ;atprintinam zinute ir nauja eilute
  pradzia:
    mov ax, @data
    mov ds, ax

    mov ah, 9
    mov dx, offset ivesk
    int 21h
    
;Perskaitom naujus skaicius iki ENTER
 ciklas:
    mov ah, 1
    int 21h
    cmp al, 0Dh
    je toliau   

    ;Konvertacija i desmintaini pavidala, kad lengviau butu daryt daugyba ir t.t
    sub al, '0'
    ;Perkeliam al i bl, nes dabar naudosim ax daugybai
    mov bl, al

    ;Praeita skaiciu padauginam is 10 ir pridedam nauja
    mov ax, skaicius
    mov cx, 10
    mul cx
    mov skaicius, ax
    add skaicius, bx

    ;Kartojam kol nespaudziama enter
    jmp ciklas
    
 toliau:
   ;skaicius ruosiamas dalybai (16-bitu)
   ;cx isvalomas, kad jame nebebutu '10'
   mov ax, skaicius
   xor cx, cx

 ;Pridedinejam '1' arba '0' kol skaicius nera tuscias (0)
 ciklas1:
   cmp ax, 0

   je spausdinam
   ;Isvalom dx registra ( nes jame uzsilieka liekana, skaicius kuri pushinam )
   xor dx, dx

   mov bx, 2
   div bx

   push dx
   ;cx zinos musu stacko dydi 
   inc cx
   jmp ciklas1

 spausdinam:
   ;Kol ne 0, tol printinam
   cmp cx, 0
   je tikNulis

   pop dx
 
   ;Konvercija i ASCII
   add dx, 30h

   ;Printinam tai ka nupoppinom dx
   mov ah, 2
   int 21h

    ;mazinam stacko dydi po viena
   dec cx

   cmp cx, 0
   je pabaiga

   jmp spausdinam
 
 ;Kai buvo ivestas tiesiog '0'
 tikNulis:
    add dx, 30h
    mov ah, 2
    int 21h
    

 pabaiga:
    MOV    ah, 4Ch
    MOV    al, 0
    INT    21h
 
END pradzia