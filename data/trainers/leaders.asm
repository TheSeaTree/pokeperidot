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
	db JASMINE
	db JOEL
	db ENYA
	db WILL
	db BRUNO
	db KAREN
	db KOGA
	db CHAMPION
	db RED
; fallthrough
KantoGymLeaders:
	db BROCK
	db MISTY
	db LT_SURGE
	db PRYCE
	db JANINE
	db SABRINA
	db BLAINE
	db BLUE
	db -1
