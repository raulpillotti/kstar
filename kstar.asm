model small

.stack 100H  

.data
    max_line_size equ 40 
       
    seed dw 12345    ; Semente inicial

    title_l1 db '  _  __       ___   _                 ',0
    title_l2 db ' | |/ / ___  / __| | |_   __ _   _ _  ',0
    title_l3 db ' |   < |___| \__ \ |  _| / _` | |  _| ',0
    title_l4 db ' |_|\_\      |___/  \__| \__,_| |_|   ',0
    title_l5 db '   ___          _                 _   ',0
    title_l6 db '  | _ \  __ _  | |_   _ _   ___  | |  ',0
    title_l7 db '  |  _/ / _` | |  _| |  _| / _ \ | |  ',0
    title_l8 db '  |_|   \__,_|  \__| |_|   \___/ |_|  ',0
                                   
    title_line_size equ 38
    
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

    magenta_ship db    5,5,5,5,5,5,5,5,5,5,5,5,0,0,0, \
    0,0,5,5,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,5,5,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,5,5,5,5,5,0,0,0,0,0,0,0,0, \
    0,0,5,5,5,5,5,5,5,5,5,5,5,5,5, \
    0,0,5,5,5,5,5,0,0,0,0,0,0,0,0, \
    0,0,5,5,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,5,5,0,0,0,0,0,0,0,0,0,0,0, \
    5,5,5,5,5,5,5,5,5,5,5,5,0,0,0,

    ciano_ship db    3,3,3,3,3,3,3,3,3,3,3,3,0,0,0, \
    0,0,3,3,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,3,3,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,3,3,3,3,3,0,0,0,0,0,0,0,0, \
    0,0,3,3,3,3,3,3,3,3,3,3,3,3,3, \
    0,0,3,3,3,3,3,0,0,0,0,0,0,0,0, \
    0,0,3,3,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,3,3,0,0,0,0,0,0,0,0,0,0,0, \
    3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,

    marrom_ship db    6,6,6,6,6,6,6,6,6,6,6,6,0,0,0, \
    0,0,6,6,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,6,6,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,6,6,6,6,6,0,0,0,0,0,0,0,0, \
    0,0,6,6,6,6,6,6,6,6,6,6,6,6,6, \
    0,0,6,6,6,6,6,0,0,0,0,0,0,0,0, \
    0,0,6,6,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,6,6,0,0,0,0,0,0,0,0,0,0,0, \
    6,6,6,6,6,6,6,6,6,6,6,6,0,0,0,

    cinza_ship db    7,7,7,7,7,7,7,7,7,7,7,7,0,0,0, \
    0,0,7,7,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,7,7,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,7,7,7,7,7,0,0,0,0,0,0,0,0, \
    0,0,7,7,7,7,7,7,7,7,7,7,7,7,7, \
    0,0,7,7,7,7,7,0,0,0,0,0,0,0,0, \
    0,0,7,7,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,7,7,0,0,0,0,0,0,0,0,0,0,0, \
    7,7,7,7,7,7,7,7,7,7,7,7,0,0,0,

    verde_ship db    2,2,2,2,2,2,2,2,2,2,2,2,0,0,0, \
    0,0,2,2,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,2,2,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,2,2,2,2,2,0,0,0,0,0,0,0,0, \
    0,0,2,2,2,2,2,2,2,2,2,2,2,2,2, \
    0,0,2,2,2,2,2,0,0,0,0,0,0,0,0, \
    0,0,2,2,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,2,2,0,0,0,0,0,0,0,0,0,0,0, \
    2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,

    vermelho_ship db    4,4,4,4,4,4,4,4,4,4,4,4,0,0,0, \
    0,0,4,4,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,4,4,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,4,4,4,4,4,0,0,0,0,0,0,0,0, \
    0,0,4,4,4,4,4,4,4,4,4,4,4,4,4, \
    0,0,4,4,4,4,4,0,0,0,0,0,0,0,0, \
    0,0,4,4,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,4,4,0,0,0,0,0,0,0,0,0,0,0, \
    4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,

    amarelo_ship db    0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0,0,0, \
    0,0,0EH,0EH,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,0EH,0EH,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,0EH,0EH,0EH,0EH,0EH,0,0,0,0,0,0,0,0, \
    0,0,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH, \
    0,0,0EH,0EH,0EH,0EH,0EH,0,0,0,0,0,0,0,0, \
    0,0,0EH,0EH,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,0EH,0EH,0,0,0,0,0,0,0,0,0,0,0, \
    0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0,0,0,

    azul_ship db    1,1,1,1,1,1,1,1,1,1,1,1,0,0,0, \
    0,0,1,1,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,1,1,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,1,1,1,1,1,0,0,0,0,0,0,0,0, \
    0,0,1,1,1,1,1,1,1,1,1,1,1,1,1, \
    0,0,1,1,1,1,1,0,0,0,0,0,0,0,0, \
    0,0,1,1,0,0,0,0,0,0,0,0,0,0,0, \
    0,0,1,1,0,0,0,0,0,0,0,0,0,0,0, \
    1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,


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

    game_over_l1 db  '  ____                       ',0
    game_over_l2 db  ' / ___| __ _ _ __ ___   ___  ',0
    game_over_l3 db  '| |  _ / _` | `_ ` _ \ / _ \ ',0
    game_over_l4 db  '| |_| | (_| | | | | | |  __/ ',0
    game_over_l5 db  ' \____|\__,_|_| |_| |_|\___| ',0
    LENGTH_GAME equ 28
    
    game_over_l6 db  '  ___                 ',0
    game_over_l7 db  ' / _ \__   _____ _ __ ',0
    game_over_l8 db  '| | | \ \ / / _ \  __|',0
    game_over_l9 db  '| |_| |\ V /  __/ |   ',0
    game_over_l10 db ' \___/  \_/ \___|_|   ',0
    LENGTH_OVER equ 22              
    
    score_label db 'SCORE:', 0
    score_value db '00000', 0
    tempo_label db 'TEMPO:', 0
    
    tempo_value dw 60 ; Contador de segundos para 60s
    count_interno dw 0     ; contador interno para aproximadamente 1 segundo

    endereco_alida_x dw 100
    
    inimiga_x dw 100
    inimiga_y dw 160

    endereco_bullet1_x dw 100
    endereco_bullet1_y dw 46

    endereco_bullet2_x dw 100
    endereco_bullet2_y dw 46

    endereco_bullet3_x dw 100
    endereco_bullet3_y dw 46
    
    fire dw 0
    
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
        push bx
        push cx
        push ax
        call delete_model
        
        inc di
        mov bl, cl
        call render_model
        pop ax
        pop cx
        pop bx
        ret
endp

render_model_left proc
        push bx
        push cx
        push ax
        call delete_model
        pop ax
        
        push ax
        dec di
        mov bl, cl
        call render_model
        
        pop ax
        pop cx
        pop bx
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

    cmp bl, 1
    je azul

    cmp bl, 2
    je verde

    cmp bl, 3
    je ciano

    cmp bl, 4
    je vermelho
    
    cmp bl, 5
    je magenta

    cmp bl, 6
    je marrom
    
    cmp bl, 7
    je cinza

    cmp bl, 0EH
    je amarelo

    cmp bl, 11
    je bullet_ship
    
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
    ciano: 
        mov si, offset ciano_ship
        jmp render_model_line_loop    
    marrom: 
        mov si, offset marrom_ship
        jmp render_model_line_loop
    cinza: 
        mov si, offset cinza_ship
        jmp render_model_line_loop
    magenta: 
        mov si, offset magenta_ship
        jmp render_model_line_loop
    verde: 
        mov si, offset verde_ship
        jmp render_model_line_loop
    vermelho: 
        mov si, offset vermelho_ship
        jmp render_model_line_loop
    amarelo: 
        mov si, offset amarelo_ship
        jmp render_model_line_loop
    azul:
        mov si, offset azul_ship
        jmp render_model_line_loop
    bullet_ship:
        mov si, offset bullet
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
    push bx
    push es
    mov ah, 13h            
    mov al, 1              
    xor bh, bh             
    push ds
    pop es                 
    mov bp, si             
    int 10h                
    pop es
    pop bx
    ret                   
render_string endp

render_title proc
    mov bl, 0ah
    xor dx, dx
    mov cx, title_line_size
    
    ; Define a posi??o inicial para renderizar cada linha (coluna = 1, linha = 1)
    mov dh, 1
    mov dl, 1
    
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
    xor dx, dx
    mov dh, 45
    mov dl, 7
    cmp al, 1
    je sair_selected
    
    mov bl, 0Fh
    jmp render_sair_normal
    
    sair_selected:
        mov bl, 0Ch  ; Cor vermelho claro (selecionado)
    
    render_sair_normal:
        mov si, offset btn_sair_l1
        call render_string
        inc dh
        mov si, offset btn_sair_l2
        call render_string
        inc dh
        mov si, offset btn_sair_l3
        call render_string
        add dh, 2
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
    push cx
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
        call set_enemy_model_speed
        mov cl, 9
        mov bh, 1
        pop ax
        call render_model_left
        jmp move_left_loop  
    
    end_render_enemy_ship: 
        call delete_model
        pop cx
        pop ax
        ret
endp



; Tela inicial
render_starting_screen proc
    call render_title
    mov bx, 1
    push bx
    mov al, 1
    call render_button_jogar
    xor al, al
    call render_button_sair
    jmp starting_screen_loop
        
    set_jogar_selected_right:
        pop bx
        mov al, 1
        call render_button_jogar
        xor al, al
        call render_button_sair
        xor ah, ah
        int 16h
        mov bx, 1
        push bx
        jmp ship_right_loop
        
    set_sair_selected_right:
        pop bx
        mov al, 1
        call render_button_sair
        xor al, al
        call render_button_jogar
        xor ah, ah
        int 16h
        xor bx, bx
        push bx
        jmp ship_right_loop
        
    set_jogar_selected_left:
        pop bx
        mov al, 1
        call render_button_jogar
        xor al, al
        call render_button_sair
        xor ah, ah
        int 16h
        mov bx, 1
        push bx
        jmp ship_left_loop
        
    set_sair_selected_left:
        pop bx
        mov al, 1
        call render_button_sair
        xor al, al
        call render_button_jogar
        xor ah, ah
        int 16h
        xor bx, bx
        push bx
        jmp ship_left_loop
        
    starting_screen_loop:
        mov ah, 01h
        int 16h
        cmp ah, 50h
        je set_sair_selected_right
        cmp ah, 48h
        je set_jogar_selected_right
        cmp ah, 1ch
        je handle_enter_pressed
        
    ship_right_loop:
        mov ah, 01h
        int 16h
        cmp ah, 50h
        je set_sair_selected_right
        cmp ah, 48h
        je set_jogar_selected_right
        cmp ah, 1ch
        je handle_enter_pressed
        
        call set_ally_model_speed
        cmp di, SCREEN_WIDTH - MODEL_WIDTH
        je ship_left_loop
        mov cl, 15
        xor bh, bh
        mov ax, 100
        call render_model_right
        jmp ship_right_loop
        
      ship_left_loop:
        mov ah, 01h
        int 16h
        cmp ah, 50h
        je set_sair_selected_left
        cmp ah, 48h
        je set_jogar_selected_left
        cmp ah, 1ch
        je handle_enter_pressed
        
        call set_ally_model_speed
        cmp di, 0
        je starting_screen_loop
        mov cl, 9
        mov bh, 1
        mov ax, 100
        call render_model_left
        jmp ship_left_loop
        
        handle_enter_pressed:
        pop bx
        ret
    ret
endp

start_timer proc

    mov si, [count_interno]

    ; Incrementa si para simular o passar de aproximadamente 1 segundo
    inc si
    mov [count_interno], si
    cmp [count_interno], 100   ; Adapte este número baseado na velocidade de execução do loop
    jl short continue_game   ; Se ainda não passou 1 segundo, pula para continuar o jogo

    ; Se passou 1 segundo, reseta o contador e decrementa o contador de tempo total
    mov [count_interno], 0

    dec [tempo_value]
    jz game_over   ; Se o tempo total chegou a zero, vai para game over
    
    ret

    continue_game:
        call render_status_bar   ; Exibe o tempo atualizado na tela
        ret

    game_over:
        call render_game_over  ; Exibe a tela de game over

    ret
endp

render_status_bar proc
    ; Desenha a barra de status no topo da tela
    push ax
    push dx
    push cx
    
    ; Renderizar "SCORE:" na posi??o (linha 0, coluna 0)
    mov bl, 0Fh  ; Cor branca
    mov cx, 6          ; Tamanho do texto 'SCORE:'
    mov dh, 0         ; Posi??o: linha 0, coluna 0
    mov dl, 1          ; Coluna 7 (ap?s 'SCORE:')
    mov si, offset score_label
    call render_string

    ; Renderizar o valor do score na posi??o (linha 0, coluna 7)
    mov bl, 02h  ; Cor verde
    mov cx, 5          ; Tamanho do valor do score
    mov dl, 7          ; Coluna 7 (ap?s 'SCORE:')
    mov si, offset score_value
    call render_string

    ; Renderizar "TEMPO:" na posi??o (linha 0, coluna 30)
    mov bl, 0Fh  ; Cor branca
    mov cx, 6          ; Tamanho do texto 'TEMPO:'
    mov dl, 30         ; Coluna 30 (alinhado ? direita)
    mov si, offset tempo_label
    call render_string

    ; Renderizar o valor do tempo restante na posi??o (linha 0, coluna 37)
    mov bl, 02h  ; Cor verde
    mov cx, 2          ; Tamanho do valor do tempo (2 d?gitos)
    mov dl, 37         ; Coluna 37 (ap?s 'TEMPO:')
    mov si, offset tempo_value
    call render_string

    ; Restaurar registradores
    pop cx
    pop dx
    pop ax
    ret
endp

random_ax proc
    push bx
    push dx
    
    mov ax, [seed]    
    mov bx, 1117
    mul bx           
    add ax, 12345    
    mov [seed], ax
    xor dx, dx        
    mov bx, 201       
    div bx           
    mov ax, dx     
    
    pop dx
    pop bx
    ret
endp

render_enemy_ship_interrupt proc
    ; Inicializa os valores
    mov ax, [inimiga_x]
    mov di, [inimiga_y]
    
    call delete_model
    
    mov bh, 1                      ; Alguma configura??o espec?fica do modelo (cor, etc.)
    mov bl, 9                      ; Modelo da nave inimiga
    
    ; Gera um n?mero aleat?rio entre 0 e 1 para decidir se incrementa ou decrementa em X
    call random_ax                    ; Sup?e que existe uma fun??o que retorna um n?mero aleat?rio em AX
    and ax, 1                      ; Isola o bit menos significativo para ter 0 ou 1
    test ax, ax                    ; Testa o resultado
    jz decrementa_x                ; Se zero, pula para decrementar

incrementa_x:
    ;inc [inimiga_x]                ; Incrementa a posi??o X
    jmp atualiza_y

decrementa_x:
    ;dec [inimiga_x]                ; Decrementa a posi??o X

atualiza_y:
    dec [inimiga_y]                ; Incrementa a posi??o Y independentemente do resultado de X

    ; Renderiza o modelo da nave inimiga
    mov ax, 100
    mov di, [inimiga_y]
    call render_model              ; Chamada para a fun??o que renderiza o modelo

    ret
endp


render_ally_ships proc
    xor di, di
    
    mov bl, 5
    mov ax, 20
    call render_model
    
    mov bl, 3
    mov ax, 40
    call render_model
    
    mov bl, 6
    mov ax, 60
    call render_model
    
    mov bl, 7
    mov ax, 80
    call render_model
    
    mov bl, 2
    mov ax, 100
    call render_model
    
    mov bl, 4
    mov ax, 120
    call render_model
    
    mov bl, 0EH
    mov ax, 140
    call render_model
    
    mov bl, 1
    mov ax, 160
    call render_model
    
    mov di, 32
    mov bl, 15
    mov ax, [endereco_alida_x]
    call render_model

    ret
endp
    
    
render_bullet_one proc

    mov bl, 11
    mov di, [endereco_bullet1_y]
    mov ax, [endereco_bullet1_x]
    inc di
    mov [endereco_bullet1_y], di
    call render_model
    
    ret
endp

render_bullet_two proc

    mov bl, 11
    mov di, [endereco_bullet2_y]
    mov ax, [endereco_bullet2_x]
    inc di
    mov [endereco_bullet2_y], di
    call render_model

    ret
endp

render_bullet_three proc

    mov bl, 11
    mov di, [endereco_bullet3_y]
    mov ax, [endereco_bullet3_x]
    inc di
    mov [endereco_bullet3_y], di
    call render_model

    ret
endp

render_render_bullet proc 
    
    cmp fire, 0
    je finally

    cmp fire, 1
    je bullet_one

    cmp fire, 2
    je bullet_two

    jmp bullet_three

    bullet_one:
        call render_bullet_one
        ret

    bullet_two:
        call render_bullet_one
        call render_bullet_two
        ret
        

    bullet_three:
        call render_bullet_one
        call render_bullet_two
        call render_bullet_three
    
    finally:

    ret
endp

valid_bullet proc

    cmp [fire], 1
    je att_bullet_one
    cmp [fire], 2
    je att_bullet_two
    cmp [fire], 3
    je att_bullet_three

    ret

    att_bullet_one:
        mov ax, [endereco_alida_x]
        mov [endereco_bullet1_x], ax
        ret

    att_bullet_two:
        mov ax, [endereco_alida_x]
        mov [endereco_bullet2_x], ax
        ret

    att_bullet_three:
        mov ax, [endereco_alida_x]
        mov [endereco_bullet3_x], ax

    ret
endp

render_game_screen proc
    push ax
    
    call render_ally_ships

    mov [tempo_value], 60
    mov [count_interno], 0

    game_loop:

        call start_timer

        call render_enemy_ship_interrupt
        
        call render_render_bullet
        
        mov cx, 0
        mov dx, 2710h   ; 1000 em hexadecimal
        call sleep
        
        mov ah, 01h
        int 16h
        jz no_key_pressed   ; Pula para continuar o loop se nenhuma tecla foi pressionada

        ; Se uma tecla foi pressionada, verifica qual foi
        mov ah, 00h
        int 16h
        
        cmp ah, 50h
        je down_pressed
        cmp ah, 48h
        je up_pressed
        cmp al, 20h     ; Compara se a tecla pressionada ? espa?o (0x20)
        je space_pressed
    
    no_key_pressed:
        ; Loop curto de atraso pode ser adicionado aqui se necess?rio
        jmp game_loop

    space_pressed:

        mov ax, [fire]
        inc ax
        mov [fire], ax

        cmp [fire], 4
        je game_loop

        call valid_bullet

        jmp game_loop
        
    up_pressed:
        mov di, 32
        mov ax, [endereco_alida_x]
        cmp ax, 15
        je game_loop
                
        call delete_model
        mov bl, 15
        
        sub ax, 2
        mov [endereco_alida_x], ax
        
        call render_model
        
        jmp game_loop
        
    down_pressed:
        mov di, 32
        mov ax, [endereco_alida_x]
        cmp ax, 170
        je game_loop
        
        call delete_model
        mov bl, 15

        add ax, 2
        mov [endereco_alida_x], ax
        
        call render_model
        
        jmp game_loop
        
    ret
endp

set_ally_model_speed proc
    push dx
    push cx
    mov cx, 0       ; 16 bits mais significativos
    mov dx, 0c350h          ; 16 bits menos significativos
    call sleep
    pop cx
    pop dx
    ret
endp

set_enemy_model_speed proc
    push dx
    push cx
    mov cx, 0      
    mov dx, 061A8h             
    call sleep
    pop cx
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

    mov cx, 003Dh     
    mov dx, 0900h  
    call sleep
    call clear_screen
    call render_game_screen
    
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

    mov cx, 003Dh      
    mov dx, 0900h  
    call sleep
    call clear_screen
    
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
    
    mov cx, 003Dh     
    mov dx, 0900h  
    call sleep
    call clear_screen

    ret
endp

sleep proc
    mov ah, 86h        ; Fun??o de atraso da interrup??o 15h
    int 15h
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

render_game_over proc
    call clear_screen

    mov bl, 04h
    xor dx, dx
    
    mov cx, LENGTH_GAME
    mov dh, 6
    mov dl, 2

    mov si, offset game_over_l1
    call render_string
    inc dh
    mov si, offset game_over_l2
    call render_string
    inc dh 
    mov si, offset game_over_l3
    call render_string
    inc dh
    mov si, offset game_over_l4
    call render_string
    inc dh
    mov si, offset game_over_l5
    call render_string
    
    mov cx, LENGTH_OVER
    mov dh, 12
    mov dl, 17

    mov si, offset game_over_l6
    call render_string
    inc dh
    mov si, offset game_over_l7
    call render_string
    inc dh 
    mov si, offset game_over_l8
    call render_string
    inc dh
    mov si, offset game_over_l9
    call render_string
    inc dh
    mov si, offset game_over_l10
    call render_string
    
    mov cx, 003Dh     
    mov dx, 0900h  
    call sleep
    call clear_screen
    call render_starting_screen

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
    
    mov ax, 1
    call render_starting_screen
    call clear_screen
    
    cmp bx, 0
    je quit
    xor bx, bx
    
    ;call render_setor_1
    call render_game_screen
    
    ;game_loop:
    ;jmp game_loop
    quit: end start
        
end start