BattleCommand_BeatUp:
	ret

BattleCommand_BeatUpFailText:
; beatupfailtext

	ld a, [wBeatUpHitAtLeastOnce]
	and a
	ret nz

	jp PrintButItFailed

GetBeatupMonLocation:
	ret
