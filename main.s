.include "memorymap.i"

.org 0
.section "Init" force
main:
	ld sp, $0000

	ld a, %00111000
	       ;;; function set
	          ; 8-bit bus mode
	           ; 2-line display mode
	            ; 5x8 font
	             ;; ignored
	call lcd_instruction

	ld a, %00001111
	       ;;;;; display on/off
	            ; display on
	             ; cursor on
	              ; cursor blink on
	call lcd_instruction

	ld a, %00000110
	       ;;;;;; entry mode set
	             ; increment
	              ; shift off
	call lcd_instruction

	ld a, $00000001
	       ;;;;;;;; clear display
	call lcd_instruction

	ld a, 'H'
	call lcd_data

loop:
	jp loop
.ends
