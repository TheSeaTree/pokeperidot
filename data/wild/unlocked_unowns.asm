unown_set: MACRO
rept _NARG
	db UNOWN_\1
	shift
endr
	db -1
ENDM

UnlockedUnownLetterSets:
; entries correspond to wUnlockedUnowns bits
	dw .Set_A_G ; ENGINE_UNLOCKED_UNOWNS_A_TO_G
	dw .Set_H_N ; ENGINE_UNLOCKED_UNOWNS_H_TO_N
	dw .Set_O_U ; ENGINE_UNLOCKED_UNOWNS_O_TO_U
	dw .Set_V_Z ; ENGINE_UNLOCKED_UNOWNS_V_TO_Z
.End

.Set_A_G:
	unown_set A, B, C, D, E, F, G
.Set_H_N:
	unown_set H, I, J, K, L, M, N
.Set_O_U:
	unown_set O, P, Q, R, S, T, U
.Set_V_Z:
	unown_set V, W, X, Y, Z
