.model small

.stack 100H  

.data
    max_line_size equ 40 
    
    title_l1 db ' _ __     ___    _              ', 0
    title_l2 db '| / /___ / __> _| |_  ___  _ _  ', 0
    title_l3 db '|  \|___|\__ \  | |  <_> ||  _> ', 0
    title_l4 db '|_\_\    <___/  |_|  <___||_|   ', 0
    title_l5 db ' ___        _             _ ', 0
    title_l6 db '| . \ ___ _| |_ _ _  ___ | |', 0
    title_l7 db '|  _/<_> | | | |  _>/ . \| |', 0
    title_l8 db '|_|  <___| |_| |_|  \___/|_|', 0
    title_line_size equ 30
    
    button_line_size equ 11
    btn_jogar_l1 db 218,196,196,196,196,196,196,196,196,196,191,0
    btn_jogar_l2 db 179,'  JOGAR  ',179,0
    btn_jogar_l3 db 192,196,196,196,196,196,196,196,196,196,217,0
    
    btn_sair_l1 db 218,196,196,196,196,196,196,196,196,196,191,0
    btn_sair_l2 db 179,'  SAIR   ',179,0
    btn_sair_l3 db 192,196,196,196,196,196,196,196,196,196,217,0
    
    teste db 'raul'
    
    ;ship db 0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,0,0,0,0,0,1,1,0,1,1,1,1,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0
    MODEL_HEIGHT equ 9
    MODEL_WIDTH equ 15
    
    SCREEN_WIDTH equ 320
    SCREEN_HEIGHT equ 200
    
    ship_size_bytes equ 135
    
    deleted_model db    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    
    blue_ship db    09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0,0,0, \
               0,0,09h,09h,0,0,0,0,0,0,0,0,0,0, \
               0,0,09h,09h,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,09h,09h,09h,09h,09h,0,0,0,0,0,0,0, \
               0,0,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h, \
               0,0,09h,09h,09h,09h,09h,0,0,0,0,0,0,0, \
               0,0,09h,09h,0,0,0,0,0,0,0,0,0,0,0, \
               0,0,09h,09h,0,0,0,0,0,0,0,0,0,0,0, \
               09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0,0,0,
    
blue_ship_inverted db 0,0,0,9,9,9,9,9,9,9,9,9,9,9,9, \
                     0,0,0,0,0,0,0,0,0,0,0,9,9,0,0, \
                     0,0,0,0,0,0,0,0,0,0,0,9,9,0,0, \
                     0,0,0,0,0,0,0,0,9,9,9,9,9,0,0, \
                     9,9,9,9,9,9,9,9,9,9,9,9,9,0,0, \
                     0,0,0,0,0,0,0,0,9,9,9,9,9,0,0, \
                     0,0,0,0,0,0,0,0,0,0,0,9,9,0,0, \
                     0,0,0,0,0,0,0,0,0,0,0,9,9,0,0, \
                     0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,


    white_ship db    15,15,15,15,15,15,15,15,15,15,15,15,0,0,0, \
    0,0,15,15,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,15,15,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,15,15,15,15,15,0,0,0,0,0,0,0,0, \
    0,0,15,15,15,15,15,15,15,15,15,15,15,15,15, \
    0,0,15,15,15,15,15,0,0,0,0,0,0,0,0, \
    0,0,15,15,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,15,15,0,0,0,0,0,0,0,0,0,0,0, \
    15,15,15,15,15,15,15,15,15,15,15,15,0,0,0,

    red_ship db    12,12,12,12,12,12,12,12,12,12,12,12,0,0,0, \
    0,0,12,12,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,12,12,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,12,12,12,12,12,0,0,0,0,0,0,0,0, \
    0,0,12,12,12,12,12,12,12,12,12,12,12,12,12, \
    0,0,12,12,12,12,12,0,0,0,0,0,0,0,0, \
    0,0,12,12,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,12,12,0,0,0,0,0,0,0,0,0,0,0, \
    12,12,12,12,12,12,12,12,12,12,12,12,0,0,0,

    setor1 db '   _____      __                ___ ', \
              '  / ___/___  / /_____  _____   <  / ', \
              '  \__ \/ _ \/ __/ __ \/ ___/   / /  ', \
              ' ___/ /  __/ /_/ /_/ / /      / /   ', \
              '/____/\___/\__/\____/_/      /_/    ', 0
    
    setor2 db '   _____      __                ___  ', \
              '  / ___/___  / /_____  _____   |__ \ ', \
              '  \__ \/ _ \/ __/ __ \/ ___/   __/ / ', \
              ' ___/ /  __/ /_/ /_/ / /      / __/  ', \
              '/____/\___/\__/\____/_/      /____/  ', 0
                                        
    setor3 db '   _____      __                _____ ', \
              '  / ___/___  / /_____  _____   |__  / ', \
              '  \__ \/ _ \/ __/ __ \/ ___/    /_ <  ', \
              ' ___/ /  __/ /_/ /_/ / /      ___/ /  ', \
              '/____/\___/\__/\____/_/      /____/   ', 0

    selected_option dw 0

    cr equ 13
    lf equ 10    

.code

;recebe tamanho em cx, coluna em di e linha em ax
render_pixel_string proc
    push cx
    push di
    push ax
    push bx
    
    xor bx, bx
    
    mov bx, 320        
    mul bx             
    add di, ax         
    rep movsb
    
    pop bx
    pop ax
    pop di
    pop cx
    ret
endp


;PIXELS 

;bl = model, bh = inverter(1), ax = linha, di = coluna

render_model_right proc
        push ax
        
        xor bl, bl
        call render_model
        
        inc di
        mov bl, cl
        call render_model
        pop ax
        ret
endp

render_model_left proc
        xor bl, bl
        call render_model
        
        dec di
        mov bl, cl
        call render_model
        ret
endp

render_model proc
    push cx
    push ax
    push di
    mov cx, MODEL_HEIGHT
 
    cmp bl, 0
    je deleted
    cmp bl, 9
    je blue
    cmp bl, 12
    je red
    cmp bl, 15
    je white
    
    deleted:
        mov si, offset deleted_model
        jmp render_model_line_loop
    blue:
        cmp bh, 1
        je render_blue_ship_inverted
        mov si, offset blue_ship
        jmp render_model_line_loop
        render_blue_ship_inverted:
            mov si, offset blue_ship_inverted
            jmp render_model_line_loop
    red: 
        mov si, offset red_ship
        jmp render_model_line_loop
    white: 
        mov si, offset white_ship
        jmp render_model_line_loop
        
    ;fazer isso ship_height vezes
    render_model_line_loop:
        push cx
        mov cx, MODEL_WIDTH
        call render_pixel_string
        inc ax
        pop cx
        loop render_model_line_loop
    
    int 10h
    
    pop di
    pop ax
    pop cx
    
    ret
endp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;STRINGS
render_string proc  
    ; Par?metros:
    ; DS:SI - endere?o da string (offset)
    ; CX - tamanho da string (n?mero de caracteres)
    ; DH, DL - posi??o de in?cio (linha e coluna)
    ; BL - cor
    push es
    mov ah, 13h            
    mov al, 1              
    xor bh, bh             
    push ds
    pop es                 
    mov bp, si             
    int 10h                
    pop es
    ret                   
render_string endp

render_title proc
    mov bl, 0ah
    xor dx, dx
    mov cx, title_line_size
    mov dl, 5
    
    mov si, offset title_l1
    call render_string
    inc dh
    mov si, offset title_l2   
    call render_string
    inc dh
    mov si, offset title_l3
    call render_string
    inc dh
    mov si, offset title_l4   
    call render_string
    inc dh
    mov si, offset title_l5   
    call render_string
    inc dh    
    mov si, offset title_l6   
    call render_string
    inc dh
    mov si, offset title_l7   
    call render_string
    inc dh
    mov si, offset title_l8   
    call render_string
    ret
endp  

; Subprograma para desenhar a caixa do bot?o com cor diferente dependendo da sele??o
render_button_jogar proc
    mov cx, button_line_size
    xor dx, dx
    mov dh, 42
    mov dl, 7
    cmp al, 1
    je jogar_selected
    
    mov bl, 0Fh
    jmp render_jogar_normal
    
    jogar_selected:
        mov bl, 0Ch  ; Cor vermelho claro (selecionado)
    
    render_jogar_normal:
        mov si, offset btn_jogar_l1
        call render_string
        inc dh
        mov si, offset btn_jogar_l2
        call render_string
        inc dh
        mov si, offset btn_jogar_l3
        call render_string
        add dh, 2
        ;push ax
    ret
endp

render_button_sair proc
    mov cx, button_line_size
    cmp al, 2
    je sair_selected

    mov bl, 0Fh
    jmp render_sair_normal
    
    sair_selected:
        mov bl, 0Ch
    
    render_sair_normal:
        mov si, offset btn_sair_l1
        call render_string
        inc dh
        mov si, offset btn_sair_l2
        call render_string
        inc dh
        mov si, offset btn_sair_l3
        call render_string
        inc dh
        ;push ax
    ret
endp

; Tela inicial
render_starting_screen proc
    call render_title
    call render_button_jogar
    call render_button_sair
    xor di, di
    
    ship_right_loop:
        call set_execution_pace
        cmp di, SCREEN_WIDTH - MODEL_WIDTH
        je ship_left_loop
        
        mov cl, 15
        xor bh, bh
        mov ax, 100
        call render_model_right
        jmp ship_right_loop
        
      ship_left_loop:
        call set_execution_pace
        cmp di, 0
        je ship_right_loop
        mov cl, 9
        mov bh, 1
        mov ax, 100
        call render_model_left
        jmp ship_left_loop
        
    ret
endp

; Captura a entrada e move a seleção ou confirma
handle_input proc
  mov ah, 00h
  int 16h ; Espera uma tecla

  cmp al, 72h ; Seta para cima
  je move_up
  cmp al, 80h ; Seta para baixo
  je move_down
  cmp al, 0Dh ; Enter
  je execute_option

  jmp handle_input

  move_up:
    dec selected_option
    jmp render_menu

  move_down:
    inc selected_option
    jmp render_menu

  execute_option:
    cmp selected_option, 0
    je start_game
    cmp selected_option, 1
    je exit_program
    ret

  start_game:
    call render_setor_1
    ret

  exit_program:
    mov ax, 4c00h
    int 21h
    ret
handle_input endp


set_execution_pace:
    xor ax, ax
    mov ah, 86H
    mov cx, 00       ; 16 bits mais significativos
    mov dx, 6000H          ; 16 bits menos significativos
    int 15h
    ret
endp

render_setor_1 proc



  ret
endp

start:
    mov ax, @data
    mov ds, ax 
    mov es, ax
    xor ax, ax
    mov dx, 0A000H    
    mov es, dx

    xor ax, ax
    xor di, di
    mov al, 13H       
    int 10H           
    
    mov al, 1
    call render_starting_screen
            
end start