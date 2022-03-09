; These lists determine the battle music and victory music, and whether to
; award HAPPINESS_GYMBATTLE for winning.

; Note: CHAMPION and RED are unused for battle music checks, since they are
; accounted for prior to the list check.

GymLeaders:
	db CECIL
	db CELESTE
	db MURPHY
	db DUANE
	db POSEY
	db ALAN
	db JOEL
	db ENYA
; fallthrough
EliteFour:
	db WILBUR
	db REGAN
	db BREDE
	db AMBER
	db CHAMPION
	db CHAMPIONF
	db RED
	db -1
