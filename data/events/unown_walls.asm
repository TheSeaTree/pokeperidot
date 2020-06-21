unownwall: MACRO
rept _NARG
if \1 == "-"
x = $64
elif \1 >= "Y"
x = 2 * (\1 - "Y") + $60
elif \1 >= "Q"
x = 2 * (\1 - "Q") + $40
elif \1 >= "I"
x = 2 * (\1 - "I") + $20
else
x = 2 * (\1 - "A")
endc
	db x
	shift
endr
	db -1 ; end
ENDM

UnownWalls:
; UNOWNWORDS_STATUE
	; db      $08, $44, $04, $00, $2e, $08, -1
	unownwall "S", "T", "A", "T", "U", "E"
; UNOWNWORDS_FISH
	; db      $0e, $2c, $64, $2c, $0e, -1
	unownwall "F", "I", "S", "H"
; UNOWNWORDS_CLOCK
	; db      $26, $20, $0c, $0e, $46, -1
	unownwall "C", "L", "O", "C", "K"
; UNOWNWORDS_FRIENDS
	; db      $4c, $00, $46, $08, $42, -1
	unownwall "F", "R", "I", "E", "N", "D", "S"
; UNOWNWORDS_VOLCANO
	; db      $0e, $2c, $64, $2c, $0e, -1
	unownwall "V", "O", "L", "C", "A", "N", "O"

MenuHeaders_UnownWalls:
; UNOWNWORDS_STATUE
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_FISH
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, 14, 9
; UNOWNWORDS_CLOCK
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_FRIENDS
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 4, 17, 9
; UNOWNWORDS_VOLCANO
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 4, 17, 9
