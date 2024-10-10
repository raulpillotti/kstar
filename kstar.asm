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
    
    button_line_size equ 10
    btn_jogar_l1 db 218,196,196,196,196,196,196,196,196,196,191,0
    btn_jogar_l2 db 179,'  JOGAR  ',179,0
    btn_jogar_l3 db 192,196,196,196,196,196,196,196,196,196,217,0
    
    btn_sair_l1 db 218,196,196,196,196,196,196,196,196,196,191,0
    btn_sair_l2 db 179,'  SAIR   ',179,0
    btn_sair_l3 db 192,196,196,196,196,196,196,196,196,196,217,0
    
    cr equ 13
    lf equ 10    
    

.code


;PIXELS 
draw_pixel proc 
    mov bx, 320        
    mul bx             
    add di, ax         
    mov al, 12         
    stosb
    ret
endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;STRINGS

; passa tamanho da string em cx pra centralizar na tela
center_string proc
    push cx
    push bx
    
    cmp cx, 0
    jz end_center_string
    
    mov bx, max_line_size
    sub bx, cx            
    shr bx, 1
    mov cx, bx
    
    render_spaces:
        mov al, ' '
        int 10h
        loop render_spaces
    
    end_center_string:
        pop bx
        pop cx
        ret
endp


render_string proc
    mov ah, 0eh         
    xor bh, bh
    cld                 
    
    call center_string
    write_char_loop:
        lodsb               ; Carregar pr?ximo byte da string em AL
        cmp al, 0           ; Verificar se o caractere ? nulo (fim da string)
        je end_render_string
        int 10h            ; Chamar a interrup??o de v?deo para escrever o caractere
        jmp write_char_loop      
        
    end_render_string:
        mov al, cr
        int 10h
        mov al, lf
        int 10h
        ret                  
render_string endp

render_title proc
    mov bl, 0ah
    mov cx, title_line_size
    mov si, offset title_l1   
    call render_string
    mov si, offset title_l2   
    call render_string
    mov si, offset title_l3   
    call render_string
    mov si, offset title_l4   
    call render_string
    mov si, offset title_l5   
    call render_string    
    mov si, offset title_l6   
    call render_string
    mov si, offset title_l7   
    call render_string
    mov si, offset title_l8   
    call render_string
    ret
endp  

; Subprograma para desenhar a caixa do bot?o
render_button_jogar proc
    mov cx, button_line_size
    mov si, offset btn_jogar_l1   
    call render_string
    mov si, offset btn_jogar_l2   
    call render_string
    mov si, offset btn_jogar_l3   
    call render_string
    ret
endp

; Subprograma para desenhar a caixa do bot?o
render_button_sair proc
    mov cx, button_line_size
    mov si, offset btn_sair_l1   
    call render_string
    mov si, offset btn_sair_l2   
    call render_string
    mov si, offset btn_sair_l3   
    call render_string
    ret
endp

; Desenhar linhas em branco
draw_empty_lines proc
    empty_line_loop:
        mov ah, 0eh
        mov al, 0Dh
        int 10h
        mov al, 0Ah
        int 10h
        loop empty_line_loop
    ret
endp

; Tela inicial

render_starting_screen proc
    call render_title
    mov cx, 10 ; N?mero de linhas em branco que deseja desenhar
    call draw_empty_lines
    
    ;; depois tem que trocar as cores se clicar nas flechas pra trocar de bot?o, agora come?a com o jogar como vermelho
    mov bl, 12
    call render_button_jogar
    mov bl, 0fh
    call render_button_sair
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
    mov al, 13H       
    int 10H           
    
    call render_starting_screen
  
    game_loop:
    jmp game_loop
 
end start