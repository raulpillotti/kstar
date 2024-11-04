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
    
    TERRAIN_HEIGHT equ 20
    
    ;ship db 0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,0,0,0,0,0,1,1,0,1,1,1,1,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0
    MODEL_HEIGHT equ 9
    MODEL_WIDTH equ 15
    
    SCREEN_WIDTH equ 320
    SCREEN_HALF_WIDTH equ 160
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
                         
    bullet db 15,15,15,15,15,15,15,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,15,15,15,15,15,15,15,15, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, \
        15,15,15,15,15,15,15,0,0,0,0,0,0,0,0,


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
    
    
terrain_1 db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 6, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 6, 6, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 6, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 6, 6, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 6, 6, 6, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 6, 0, 0, 0, 0, 0, \


terrain_2 db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 6, 6, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 6, 6, 6, 6, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 6, 6, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 6, 6, 6, 6, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 6, 6, 6, 6, 6, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 6, 6, 0, 0, 0, 0, 0, \

terrain_3 db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 6, 6, 6, 6, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 6, 6, 6, 6, 6, 6, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 6, 6, 6, 6, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 6, 6, 6, 6, 6, 6, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 6, 6, 6, 6, 6, 6, 0, 0, 0, \
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, \
              0, 0, 6, 6, 6, 6, 0, 0, 0, 0, \

terrain_4 db  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 6, 6, 6, 6, 6, 6, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              6, 6, 6, 6, 6, 6, 6, 6, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 6, 6, 6, 6, 6, 6, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              6, 6, 6, 6, 6, 6, 6, 6, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 6, 6, 6, 6, 6, 6, 11, 11, 11, \

              terrain_5 db  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              6, 6, 6, 6, 6, 6, 6, 6, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 6, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              6, 6, 6, 6, 6, 6, 6, 6, 11, 11, \
              
              terrain_6 db  11, 11, 11, 11, 11, 11, 11, 11, 11, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 6, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 6, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 6, \
              6, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 11, \
              11, 11, 11, 11, 11, 11, 11, 11, 6, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 6, \
              11, 11, 11, 11, 11, 11, 11, 11, 6, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 6, \
              11, 11, 11, 11, 11, 11, 11, 11, 11, 6, \
              6, 6, 6, 6, 6, 6, 6, 6, 6, 11, \


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
    score_value dw 30
    score_value_string db ?,?,?,?,?
    
    tempo_label db 'TEMPO:', 0
    tempo_value dw 60 ; Contador de segundos para 60s
    tempo_value_string db ?,?
    
    count_interno dw 0     ; contador interno para aproximadamente 1 segundo
    count_interno_naves dw 0     ; contador interno para aproximadamente 1 segundo

    endereco_alida_x dw 100
    
    inimiga1_x dw 100
    inimiga1_y dw 160
    inimiga1 dw 1

    inimiga2_x dw 100
    inimiga2_y dw 160
    inimiga2 dw 0
    
    inimiga3_x dw 100
    inimiga3_y dw 160
    inimiga3 dw 0

    total_inimigas dw 10

    seed_render_naves dw 1234

    endereco_bullet1_x dw 100
    endereco_bullet1_y dw 46

    endereco_bullet2_x dw 100
    endereco_bullet2_y dw 46

    endereco_bullet3_x dw 100
    endereco_bullet3_y dw 46
    
    fire dw 0
    
    bullet1 dw 0
    bullet2 dw 0
    bullet3 dw 0
    
    game_stage dw 0
    
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

;recebe tamanho em cx, coluna em di e linha em ax

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

game_flow proc
    inc [game_stage]
    cmp [game_stage], 1
    je stage_2  
    cmp [game_stage], 2
    je stage_3
    cmp [game_stage], 3
    je game_over   

    stage_2:
        call clear_screen
        call render_setor_2
        call render_game_screen

    stage_3:
        call clear_screen
        call render_setor_3
        call render_game_screen

    game_over:
        call clear_screen
        call render_game_over
    ret
endp

start_timer proc
    mov si, [count_interno]

    ; Incrementa si para simular o passar de aproximadamente 1 segundo
    inc si
    mov [count_interno], si
    cmp [count_interno], 100   ; Adapte este n?mero baseado na velocidade de execu??o do loop
    jl short continue_game   ; Se ainda n?o passou 1 segundo, pula para continuar o jogo

    ; Se passou 1 segundo, reseta o contador e decrementa o contador de tempo total
    mov [count_interno], 0

    dec [tempo_value]
    jz timer_end   ; Se o tempo total chegou a zero, vai para game over
    
    ret

    continue_game:
        call render_status_bar   ; Exibe o tempo atualizado na tela
        ret

    timer_end:
        call game_flow
        
    ret
endp

;; cx = tamanho, bx = string buffer; ax = n?mero
copy_int16_to_string_buffer proc
    push ax      ; Salvar registradores utilizados na proc
    push bx
    push cx
    push dx
    
    add bx, cx
    dec bx
    
    loop_copy_to_buffer:
        push cx
        push bx

        mov bx, 10              
        xor dx, dx              
        div bx                  
        add dl, '0'
        pop bx
        mov [bx], dl

        dec bx
        pop cx
        loop loop_copy_to_buffer
        
    pop dx       ; Restaurar registradores utilizados na proc
    pop cx
    pop bx
    pop ax
    ret 
endp


render_timer_tick proc
    push cx
    mov cx, 2
    mov bx, offset tempo_value_string
    mov ax, [tempo_value] 
    call copy_int16_to_string_buffer
    mov cx, 2
    mov bl, 02h
    mov dl, 36              
    mov si, offset tempo_value_string
    call render_string
    
    pop cx
    ret
endp

sub_score_value proc
    cmp [score_value], 0
    jz end_sub_score_value
    sub [score_value], ax
    
    end_sub_score_value: ret
endp

add_score_value proc
    add [score_value], ax
endp

render_score_value proc
    push cx
    mov cx, 5
    mov bx, offset score_value_string
    mov ax, [score_value] 
    call copy_int16_to_string_buffer
    mov cx, 5
    mov bl, 02h
    mov dl, 7              
    mov si, offset score_value_string
    call render_string
    
    pop cx
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

    ;mov bl, 02h  ; Cor verde
    ;mov cx, 5          ; Tamanho do valor do score
    ;mov dl, 7          ; Coluna 7 (ap?s 'SCORE:')
    ;call render_score_value
    ;mov si, offset score_value
    ; call render_string

    ; Renderizar "TEMPO:" na posi??o (linha 0, coluna 30)
    mov bl, 0Fh  ; Cor branca
    mov cx, 6          ; Tamanho do texto 'TEMPO:'
    mov dl, 30         ; Coluna 30 (alinhado ? direita)
    mov si, offset tempo_label
    call render_string
    
    call render_timer_tick
    call render_score_value
    
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

fill_bottom_20_rows_with_brown proc
    mov ax, 0A000h
    mov es, ax            
    mov di, 320 * 180      

    mov cx, 20             
    mov al, 6             
    fill_row:
        push cx                
        mov cx, 320           
        rep stosb              
        pop cx                
        loop fill_row          
    ret
endp

render_terrain proc
    call fill_bottom_20_rows_with_brown
    push ax
    push cx
    push di
    xor di, di
    mov cx, TERRAIN_HEIGHT
   
    
    mov ax, SCREEN_HEIGHT - 20
    mov cx, 10

    
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_1
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_2
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_3
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_4
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_5
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_6
    call render_pixel_string
    inc ax
    pop cx
    
    ;;;
    mov di, SCREEN_WIDTH / 2
    mov ax, SCREEN_HEIGHT - 20 
    mov cx, 10
    
push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_1
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_2
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_3
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_4
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_5
    call render_pixel_string
    inc ax
    pop cx
    
    push cx
    mov cx, SCREEN_HALF_WIDTH
    mov si, offset terrain_6
    call render_pixel_string
    inc ax
    pop cx

    pop di
    pop cx    
    pop ax
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

render_enemy_ships proc

    call render_enemy_ship1
    call render_enemy_ship2
    call render_enemy_ship3

    ret
endp

render_enemy_ship1 proc
    cmp [inimiga1], 0
    je endEnemy1

    mov ax, [inimiga1_x]
    mov di, [inimiga1_y]

    call delete_model

    dec di
    jz deleteEnemy1

    mov [inimiga1_y], di

    mov bh, 1
    mov bl, 9

    call render_model
    jmp endEnemy1

    deleteEnemy1:
      push ax
      mov ax, 10
      call sub_score_value
      pop ax
      mov [inimiga1], 0
      call delete_model

    endEnemy1:

    ret
endp

render_enemy_ship2 proc
    cmp [inimiga2], 0
    je endEnemy2

    mov ax, [inimiga2_x]
    mov di, [inimiga2_y]

    call delete_model

    dec di
    jz deleteEnemy2

    mov [inimiga2_y], di

    mov bh, 1
    mov bl, 9

    call render_model
    jmp endEnemy2

    deleteEnemy2:
      push ax
      mov ax, 10
      call sub_score_value
      pop ax
      mov [inimiga2], 0
      call delete_model

    endEnemy2:

    ret
endp

render_enemy_ship3 proc
    cmp [inimiga3], 0
    je endEnemy3

    mov ax, [inimiga3_x]
    mov di, [inimiga3_y]

    call delete_model

    dec di
    jz deleteEnemy3
    mov [inimiga3_y], di

    mov bh, 1
    mov bl, 9

    call render_model
    jmp endEnemy3

    deleteEnemy3:
      push ax
      mov ax, 10
      call sub_score_value
      pop ax
      mov [inimiga3], 0
      call delete_model

    endEnemy3:

    ret
endp

generate_random_x proc
    mov ax, [seed_render_naves]

    imul ax
    add ax, 12345

    mov [seed_render_naves], ax

    mov cx, 141
    xor dx, dx
    div cx
    add dx, 20
    mov ax, dx

    ret
endp

activate_enemy_ship proc

    inc [count_interno_naves]

    cmp [count_interno_naves], 180   ; Adapte este n?mero baseado na velocidade de execu??o do loop
    jl short no_activation_inimiga   ; Se ainda n?o passou 1 segundo, pula para continuar o jogo

    mov [count_interno_naves], 0

    render_enemy:
      ; Procura uma nave não ativa e a ativa
      cmp [inimiga1], 0
      je activate_enemy1
      cmp [inimiga2], 0
      je activate_enemy2
      cmp [inimiga3], 0
      je activate_enemy3

      ; Se todas as naves estiverem ativas, não faz nada
      jmp no_activation_inimiga

      activate_enemy1:
          mov [inimiga1], 1
          call generate_random_x          ; Gera a posição aleatória x
          mov [inimiga1_x], ax    ; Usa o valor gerado
          mov [inimiga1_y], 300 ; Alterar para 160 conforme está no trabalho depois
          dec [total_inimigas]
          ret

      activate_enemy2:
          mov [inimiga2], 1
          call generate_random_x          ; Gera a posição aleatória x
          mov [inimiga2_x], ax    ; Usa o valor gerado
          mov [inimiga2_y], 300 ; Alterar para 160 conforme está no trabalho depois
          dec [total_inimigas]
          ret

      activate_enemy3:
          mov [inimiga3], 1
          call generate_random_x          ; Gera a posição aleatória x
          mov [inimiga3_x], ax    ; Usa o valor gerado
          mov [inimiga3_y], 300 ; Alterar para 160 conforme está no trabalho depois
          dec [total_inimigas]
          ret

    no_activation_inimiga:
    ret
endp

check_collision_enemy1 proc

  mov dx, [inimiga1_x]      ; Carrega a coordenada X da nave inimiga em dx
  mov si, [inimiga1_y]      ; Carrega a coordenada Y da nave inimiga em si

  ; Verifica se o projétil está dentro da largura da nave inimiga (X-Axis)
  mov bx, ax                ; Copia ax (posição X do projétil) para bx
  sub bx, dx                ; Calcula a diferença bx = ax - dx
  cmp bx, 0                 ; Verifica se o projétil está à esquerda da nave
  jl short check_opposite1_x ; Se estiver à esquerda, verifica no sentido oposto

  cmp bx, MODEL_WIDTH       ; Verifica se a diferença é maior que a largura da nave
  jge short finally_collision1 ; Se estiver à direita da nave, não há colisão
  jmp short check_y_axis1    ; Se estiver dentro, verifica o eixo Y

  check_opposite1_x:
    ; Se o projétil estiver à esquerda, inverte a lógica para lidar com a situação contrária
    mov bx, dx
    sub bx, ax                ; Calcula a diferença bx = dx - ax
    cmp bx, 0
    jl short finally_collision1 ; Se ainda for fora, não há colisão

    cmp bx, MODEL_WIDTH
    jge short finally_collision1 ; Se ainda for fora, não há colisão

  check_y_axis1:
    ; Verifica se o projétil está dentro da altura da nave inimiga (Y-Axis)
    mov bx, di                ; Copia di (posição Y do projétil) para bx
    sub bx, si                ; Calcula a diferença bx = di - si
    cmp bx, 0                 ; Verifica se o projétil está acima da nave
    jl short check_opposite1_y ; Se estiver acima, verifica no sentido oposto

    cmp bx, MODEL_HEIGHT      ; Verifica se a diferença é maior que a altura da nave
    jge short finally_collision1 ; Se estiver abaixo da nave, não há colisão
    jmp short collision_found1 ; Se estiver dentro, há colisão

  check_opposite1_y:
    ; Se o projétil estiver acima, inverte a lógica para lidar com a situação contrária
    mov bx, si
    sub bx, di                ; Calcula a diferença bx = si - di
    cmp bx, 0
    jl short finally_collision1 ; Se ainda for fora, não há colisão

    cmp bx, MODEL_HEIGHT
    jge short finally_collision1 ; Se ainda for fora, não há colisão

  collision_found1:
    mov ax, [inimiga1_x]      ; Carrega a coordenada X da nave inimiga em dx
    mov di, [inimiga1_y]      ; Carrega a coordenada Y da nave inimiga em si
    mov [inimiga1], 0
    call delete_model

    mov ax, 1                 ; Marca colisão
    ret

  finally_collision1:
    mov ax, 0                 ; Marca sem colisão

    ret
endp

check_collision_enemy2 proc

    mov dx, [inimiga2_x]      ; Carrega a coordenada X da nave inimiga em dx
    mov si, [inimiga2_y]      ; Carrega a coordenada Y da nave inimiga em si

    ; Verifica se o projétil está dentro da largura da nave inimiga (X-Axis)
    mov bx, ax                ; Copia ax (posição X do projétil) para bx
    sub bx, dx                ; Calcula a diferença bx = ax - dx
    cmp bx, 0                 ; Verifica se o projétil está à esquerda da nave
    jl short check_opposite2_x ; Se estiver à esquerda, verifica no sentido oposto

    cmp bx, MODEL_WIDTH       ; Verifica se a diferença é maior que a largura da nave
    jge short finally_collision2 ; Se estiver à direita da nave, não há colisão
    jmp short check_y_axis2    ; Se estiver dentro, verifica o eixo Y

  check_opposite2_x:
      ; Se o projétil estiver à esquerda, inverte a lógica para lidar com a situação contrária
      mov bx, dx
      sub bx, ax                ; Calcula a diferença bx = dx - ax
      cmp bx, 0
      jl short finally_collision2 ; Se ainda for fora, não há colisão

      cmp bx, MODEL_WIDTH
      jge short finally_collision2 ; Se ainda for fora, não há colisão

  check_y_axis2:
      ; Verifica se o projétil está dentro da altura da nave inimiga (Y-Axis)
      mov bx, di                ; Copia di (posição Y do projétil) para bx
      sub bx, si                ; Calcula a diferença bx = di - si
      cmp bx, 0                 ; Verifica se o projétil está acima da nave
      jl short check_opposite2_y ; Se estiver acima, verifica no sentido oposto

      cmp bx, MODEL_HEIGHT      ; Verifica se a diferença é maior que a altura da nave
      jge short finally_collision2 ; Se estiver abaixo da nave, não há colisão
      jmp short collision2_found ; Se estiver dentro, há colisão

  check_opposite2_y:
      ; Se o projétil estiver acima, inverte a lógica para lidar com a situação contrária
      mov bx, si
      sub bx, di                ; Calcula a diferença bx = si - di
      cmp bx, 0
      jl short finally_collision2 ; Se ainda for fora, não há colisão

      cmp bx, MODEL_HEIGHT
      jge short finally_collision2 ; Se ainda for fora, não há colisão

  collision2_found:
      mov ax, [inimiga2_x]      ; Carrega a coordenada X da nave inimiga em dx
      mov di, [inimiga2_y]      ; Carrega a coordenada Y da nave inimiga em si
      mov [inimiga2], 0
    call delete_model
      mov ax, 1                 ; Marca colisão
      ret

  finally_collision2:
      mov ax, 0                 ; Marca sem colisão

  ret
endp

check_collision_enemy3 proc

    mov dx, [inimiga3_x]      ; Carrega a coordenada X da nave inimiga em dx
    mov si, [inimiga3_y]      ; Carrega a coordenada Y da nave inimiga em si

    ; Verifica se o projétil está dentro da largura da nave inimiga (X-Axis)
    mov bx, ax                ; Copia ax (posição X do projétil) para bx
    sub bx, dx                ; Calcula a diferença bx = ax - dx
    cmp bx, 0                 ; Verifica se o projétil está à esquerda da nave
    jl short check_opposite3_x ; Se estiver à esquerda, verifica no sentido oposto

    cmp bx, MODEL_WIDTH       ; Verifica se a diferença é maior que a largura da nave
    jge short finally_collision3 ; Se estiver à direita da nave, não há colisão
    jmp short check_y_axis3    ; Se estiver dentro, verifica o eixo Y

  check_opposite3_x:
      ; Se o projétil estiver à esquerda, inverte a lógica para lidar com a situação contrária
      mov bx, dx
      sub bx, ax                ; Calcula a diferença bx = dx - ax
      cmp bx, 0
      jl short finally_collision3 ; Se ainda for fora, não há colisão

      cmp bx, MODEL_WIDTH
      jge short finally_collision3 ; Se ainda for fora, não há colisão

  check_y_axis3:
      ; Verifica se o projétil está dentro da altura da nave inimiga (Y-Axis)
      mov bx, di                ; Copia di (posição Y do projétil) para bx
      sub bx, si                ; Calcula a diferença bx = di - si
      cmp bx, 0                 ; Verifica se o projétil está acima da nave
      jl short check_opposite3_y ; Se estiver acima, verifica no sentido oposto

      cmp bx, MODEL_HEIGHT      ; Verifica se a diferença é maior que a altura da nave
      jge short finally_collision3 ; Se estiver abaixo da nave, não há colisão
      jmp short collision_found3 ; Se estiver dentro, há colisão

  check_opposite3_y:
      ; Se o projétil estiver acima, inverte a lógica para lidar com a situação contrária
      mov bx, si
      sub bx, di                ; Calcula a diferença bx = si - di
      cmp bx, 0
      jl short finally_collision3 ; Se ainda for fora, não há colisão

      cmp bx, MODEL_HEIGHT
      jge short finally_collision3 ; Se ainda for fora, não há colisão

  collision_found3:
      mov ax, [inimiga3_x]      ; Carrega a coordenada X da nave inimiga em dx
      mov di, [inimiga3_y]      ; Carrega a coordenada Y da nave inimiga em si
      mov [inimiga3], 0
      call delete_model
      mov ax, 1                 ; Marca colisão
      ret

  finally_collision3:
      mov ax, 0                 ; Marca sem colisão

  ret
endp

render_bullet1 proc

    cmp [bullet1], 0
    je endRender1

    mov di, [endereco_bullet1_y]
    mov ax, [endereco_bullet1_x]

    call delete_model

    inc di

    push ax
    push di

    call check_collision_enemy1
    cmp ax, 1
    je restore_and_deleteBullet1

    call check_collision_enemy2
    cmp ax, 1
    je restore_and_deleteBullet1

    call check_collision_enemy3
    cmp ax, 1

    je restore_and_deleteBullet1

    pop di
    pop ax

    cmp di, SCREEN_WIDTH - MODEL_WIDTH
    je deleteBullet1

    mov [endereco_bullet1_y], di
    mov bl, 11

    call render_model
    ret

    restore_and_deleteBullet1:
      pop di
      pop ax

    deleteBullet1:

      mov [bullet1], 0
      dec [fire]
      
      call delete_model

    endRender1:
    ret
endp

render_bullet2 proc

    cmp [bullet2], 0
    je endRender2

    mov di, [endereco_bullet2_y]
    mov ax, [endereco_bullet2_x]

    call delete_model

    inc di

    push ax
    push di

    call check_collision_enemy1
    cmp ax, 1
    je restore_and_deleteBullet2

    call check_collision_enemy2
    cmp ax, 1
    je restore_and_deleteBullet2

    call check_collision_enemy3
    cmp ax, 1
    je restore_and_deleteBullet2

    pop di
    pop ax

    cmp di, SCREEN_WIDTH - MODEL_WIDTH
    je deleteBullet2

    mov [endereco_bullet2_y], di
    mov bl, 11

    call render_model
    ret

    restore_and_deleteBullet2:
      pop di
      pop ax

    deleteBullet2:

      mov [bullet2], 0
      dec [fire]
      
      call delete_model

    endRender2:
    ret
endp

render_bullet3 proc

    cmp [bullet3], 0
    je endRender3

    mov di, [endereco_bullet3_y]
    mov ax, [endereco_bullet3_x]

    call delete_model

    inc di

    push ax
    push di

    call check_collision_enemy1
    cmp ax, 1
    je restore_and_deleteBullet3

    call check_collision_enemy2
    cmp ax, 1
    je restore_and_deleteBullet3

    call check_collision_enemy3
    cmp ax, 1
    je restore_and_deleteBullet3

    pop di
    pop ax

    cmp di, SCREEN_WIDTH - MODEL_WIDTH
    je deleteBullet3

    mov [endereco_bullet3_y], di
    mov bl, 11

    call render_model
    ret

    restore_and_deleteBullet3:
      pop di
      pop ax

    deleteBullet3:

      mov [bullet3], 0
      dec [fire]
      
      call delete_model

    endRender3:
    ret
endp

render_render_bullet proc 

  call render_bullet1
  call render_bullet2
  call render_bullet3

  ret
endp

valid_bullet proc

    cmp [bullet1], 0
    je activate_bullet1
    cmp [bullet2], 0
    je activate_bullet2
    cmp [bullet3], 0
    je activate_bullet3

    jmp no_activation

    activate_bullet1:
        mov ax, [endereco_alida_x]
        mov [endereco_bullet1_x], ax
        mov [endereco_bullet1_y], 46
        mov [bullet1], 1
        inc [fire]
        ret

    activate_bullet2:
        mov ax, [endereco_alida_x]
        mov [endereco_bullet2_x], ax
        mov [endereco_bullet2_y], 46
        mov [bullet2], 1
        inc [fire]
        ret

    activate_bullet3:
        mov ax, [endereco_alida_x]
        mov [endereco_bullet3_x], ax
        mov [endereco_bullet3_y], 46
        mov [bullet3], 1
        inc [fire]
        ret

    no_activation:

    ret
endp

render_game_screen proc
    push ax
    
    call render_ally_ships
    call render_terrain

    mov [tempo_value], 60
    mov [count_interno], 0
    mov [total_inimigas], 10

    game_loop:
        call start_timer

        cmp [total_inimigas], 0
        jne render_naves

        ;; DEPOIS DE RENDERIZAR AS 10 NAVES
        
        ;; pode renderizar mais de 10 naves ao todo, s? n?o podem ser simult?neas 
        ;ret

        render_naves:
          call render_enemy_ships
          call activate_enemy_ship

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
      cmp [fire], 3
      je game_loop ; Se todos os slots estiverem ocupados, volta para o loop do jogo

      call valid_bullet

      jmp game_loop
        
    up_pressed:
        mov di, 32
        mov ax, [endereco_alida_x]
        cmp ax, 20
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