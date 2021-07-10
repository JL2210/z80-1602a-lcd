.include "memorymap.i"

; io ports 0x00 to 0x03 used for PIO
; io ports 0x04 to 0x05 used for LCD
LCD_INST = $04
LCD_DATA = $05

.bank 0 slot 0
.macro lcd_busy_wait
lcd_busy_wait\@:
        in a, (LCD_INST)
        rlca
        jp c, lcd_busy_wait\@
.endm

.section "LCD"
lcd_instruction:
        push af
        lcd_busy_wait
        pop af
        out (LCD_INST), a
        ret

lcd_data:
        push af
        lcd_busy_wait
        pop af
        out (LCD_DATA), a
        ret
.ends
