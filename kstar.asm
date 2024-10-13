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
                         
    bullet db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,15,0,15,0,15,0,15,0,15,0,15,0,15,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,


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
    
    ; Definir o texto em ASCII para o setor 1
    setor1_l1 db '   _____      __                ___ ', 0
    setor1_l2 db '  / ___/___  / /_____  _____   <  / ', 0
    setor1_l3 db '  \__ \/ _ \/ __/ __ \/ ___/   / /  ', 0
    setor1_l4 db ' ___/ /  __/ /_/ /_/ / /      / /   ', 0
    setor1_l5 db '/____/\___/\__/\____/_/      /_/    ', 0
    LENGTH_SETOR1 equ 37

    setor2_l1 db '   _____      __                ___  ', 0
    setor2_l2 db '  / ___/___  / /_____  _____   |__ \ ', 0
    setor2_l3 db '  \__ \/ _ \/ __/ __ \/ ___/   __/ / ', 0
    setor2_l4 db ' ___/ /  __/ /_/ /_/ / /      / __/  ', 0
    setor2_l5 db '/____/\___/\__/\____/_/      /____/  ', 0
    LENGTH_SETOR2 equ 38
    
    setor3_l1 db '   _____      __                _____ ', 0
    setor3_l2 db '  / ___/___  / /_____  _____   |__  / ', 0
    setor3_l3 db '  \__ \/ _ \/ __/ __ \/ ___/    /_ <  ', 0
    setor3_l4 db ' ___/ /  __/ /_/ /_/ / /      ___/ /  ', 0
    setor3_l5 db '/____/\___/\__/\____/_/      /____/   ', 0
    LENGTH_SETOR3 equ 39               
    
    DEPLAY_TICKETS equ 73
    
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
    inc ax
    
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
        call delete_model
        
        inc di
        mov bl, cl
        call render_model
        pop ax
        ret
endp

render_model_left proc
        push ax
        call delete_model
        pop ax
        
        push ax
        dec di
        mov bl, cl
        call render_model
        pop ax
        ret
endp

render_model proc
    push ax
    push cx
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
    
    pop di
    pop cx
    pop ax
    
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

delete_model proc
    xor bl, bl
    call render_model
    ret
endp

;linha inicial em ax
render_enemy_ship proc
    mov di, SCREEN_WIDTH - MODEL_WIDTH
    push ax
    call delete_model


    move_left_loop:
        cmp di, 0
        je end_render_enemy_ship
        
        ;;;;;;;;;;;;;;; Verifica??o de colis?o;;;;;;;
        push di
        push ax
        push bx

        xor bx, bx
        mov bx, 320           
        mul bx               
        add di, ax
        
        ;se encontra pixel branco deveria apagar a nave
        cmp byte ptr [es: di], 15
        je end_render_enemy_ship
        pop bx
        pop ax
        pop di
        ;;;;;;;;;;;;;;;;;;;;;;;

        push ax
        call set_execution_pace
        mov cl, 9
        mov bh, 1
        pop ax
        call render_model_left
        jmp move_left_loop  
    
    end_render_enemy_ship: 
        call delete_model
        pop ax
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

render_game_screen proc
    push ax
    xor di, di
   
    mov bl, 15
    mov ax, 20
    call render_model
    
    mov bl, 15
    mov ax, 40
    call render_model
    
    mov bl, 15
    mov ax, 60
    call render_model
    
    mov bl, 15
    mov ax, 80
    call render_model
    
    mov bl, 15
    mov ax, 100
    call render_model
    
    mov bl, 15
    mov ax, 120
    call render_model
    
    mov bl, 15
    mov ax, 140
    call render_model
    
    mov bl, 15
    mov ax, 160
    call render_model
    
    mov di, 32
    mov bl, 15
    mov ax, 100
    call render_model
    
    mov ax, 100
    call render_enemy_ship
    mov ax, 80
    call render_enemy_ship
    pop ax
    ret
endp

handle_input proc
    push ax
    xor ax, ax
    int 16h ; Espera por uma tecla pressionada, retorna o c?digo em AL
    cmp al, 1
    je button_jogar
    cmp al, 0
    je button_sair
    button_jogar: 
        call render_button_jogar
        jmp end_handle_input
    button_sair: 
        call render_button_sair
        jmp end_handle_input
    end_handle_input:
        pop ax
        ret
endp


set_execution_pace:
    push ax
    xor ax, ax
    mov ah, 86H
    mov cx, 00       ; 16 bits mais significativos
    mov dx, 600H          ; 16 bits menos significativos
    int 15h
    pop ax
    ret
endp

render_setor_1 proc
    mov bl, 05h  ; Cor magenta para o texto
    xor dx, dx
    mov cx, LENGTH_SETOR1
    
    ; Define a posi??o inicial para renderizar cada linha (coluna = 10, linha = 2)
    mov dh, 10
    mov dl, 2

    mov si, offset setor1_l1
    call render_string
    inc dh
    mov si, offset setor1_l2
    call render_string
    inc dh 
    mov si, offset setor1_l3
    call render_string
    inc dh
    mov si, offset setor1_l4
    call render_string
    inc dh
    mov si, offset setor1_l5
    call render_string

    call delay_4_seconds
    call clear_screen
    call render_game_screen
    
    ret
endp

delay_4_seconds proc
    ; Obt?m o valor atual do contador de ticks
    mov ah, 00h
    int 1Ah               ; Interrup??o BIOS - L? o timer
    mov bx, dx            ; Salva o valor inicial de ticks em BX

    ; Calcula o n?mero de ticks necess?rios para 4 segundos
    ; 4 segundos = 4 * (18.2 ticks por segundo) ? 73 ticks
    add bx, DEPLAY_TICKETS ; Adiciona 73 ticks ao valor inicial

    wait_loop:
        ; Verifica o valor atual do contador de ticks
        mov ah, 00h
        int 1Ah
        cmp dx, bx            ; Verifica se o tempo desejado passou
        jb wait_loop          ; Se ainda n?o passou, continua esperando

    ret
endp

render_setor_2 proc
    mov bl, 04h  ; Cor vermhlo para o texto
    xor dx, dx
    mov cx, LENGTH_SETOR2
    
    ; Define a posi??o inicial para renderizar cada linha (coluna = 10, linha = 2)
    mov dh, 10
    mov dl, 2

    mov si, offset setor2_l1
    call render_string
    inc dh
    mov si, offset setor2_l2
    call render_string
    inc dh 
    mov si, offset setor2_l3
    call render_string
    inc dh
    mov si, offset setor2_l4
    call render_string
    inc dh
    mov si, offset setor2_l5
    call render_string

    ret
endp

render_setor_3 proc
    mov bl, 01h  ; Cor azul para o texto
    xor dx, dx
    mov cx, LENGTH_SETOR3
    
    ; Define a posi??o inicial para renderizar cada linha (coluna = 10, linha = 2)
    mov dh, 10
    mov dl, 2

    mov si, offset setor3_l1
    call render_string
    inc dh
    mov si, offset setor3_l2
    call render_string
    inc dh 
    mov si, offset setor3_l3
    call render_string
    inc dh
    mov si, offset setor3_l4
    call render_string
    inc dh
    mov si, offset setor3_l5
    call render_string

    ret
endp

clear_screen proc
    ; Configura o segmento de v?deo para A000h
    mov ax, 0A000h
    mov es, ax            ; Especifica o segmento de mem?ria de v?deo

    ; Inicia a posi??o de mem?ria de v?deo em 0:0
    xor di, di            ; DI = 0 (in?cio da mem?ria de v?deo)

    ; Preenche toda a tela (320 * 200 = 64000 bytes) com a cor preta (0)
    mov cx, 64000         ; N?mero total de pixels
    xor al, al

    rep stosb                 ; Preenche cada byte (pixel) com a cor em AL

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
    
    ;mov al, 1
    ;call render_starting_screen
    
    call render_setor_1
    ;call render_game_screen
    
    ;game_loop:
        ;jmp game_loop
        
end start