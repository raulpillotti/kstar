model small

.stack 100H  

.data
    max_line_size equ 40 
    
    seed dw 12345    ; Semente inicial
    
    enemy_ship_x dw 160
    ally_ship_y dw 32

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
    tempo_value dw 60

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
    mov tempo_value, 60  ; Define o tempo inicial para 60 segundos

    timer_loop:
        call render_status_bar   ; Exibe o tempo atualizado na tela

        ; Verifica se o tempo chegou a zero
        cmp tempo_value, 0
        je end_timer             ; Se for zero, termina o loop

        mov cx, 000Fh
        mov dx, 4240h
        call sleep

        ; Decrementa o tempo
        dec tempo_value
        jmp timer_loop

    end_timer:
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

;render_enemy_ship_interrupt proc
 ;   push di
 ;  mov di, 160
 ;  push cx
 ;  call delete_model
 

 ;   move_left_interrupt_loop:
 ;      cmp di, 0
 ;      je end_render_enemy_ship_interrupt
 ;      push ax
 ;      call set_enemy_model_speed
 ;      mov cl, 9
 ;        mov bh, 1
  ;      pop ax
  ;      call render_model_left
  ;     jmp move_left_interrupt_loop  
    
  ;  end_render_enemy_ship_interrupt: 
  ;     call delete_model
  ;     pop cx
  ;     pop di
  ;     ret
  ;endp
    
render_game_screen proc
    call render_status_bar
    push ax
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
    mov ax, 100
    call render_model
    
   game_loop:
        push ax
        mov ah, 01h
        int 16h
        cmp ah, 50h
        je up_pressed
        cmp ah, 48h
        je down_pressed
        
        push di
        mov di, ally_ship_y
        call set_ally_model_speed
        
        call delete_model
        mov bl, 15
        dec ax
        call render_model
    
        push ax    
        call random_ax
        
        push di
        mov di, enemy_ship_x
        
        move_enemy_loop:
        push ax
        mov ah, 01h
        int 16h
        cmp ah, 50h
        je up_pressed
        cmp ah, 48h
        je down_pressed
        pop ax
        
        cmp di, 0
        je ally
        push ax
        call set_enemy_model_speed
        mov cl, 9
        mov bh, 1
        pop ax
        call render_model_left
        jmp move_enemy_loop  
    
    ally:
        call delete_model
        pop ax
        pop di
        jmp game_loop
        
    up_pressed:
        pop ax
        call delete_model
        mov bl, 15
        dec ax
        call render_model
        jmp game_loop
        
    down_pressed:
        pop ax
        call delete_model
        mov bl, 15
        inc ax
        call render_model
        jmp game_loop
        
    space_pressed:
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
    pop dx
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
    mov bl, 04h  ; Cor azul para o texto
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