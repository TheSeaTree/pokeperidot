	const_def 2 ; object constants

PastFaviaEggTutorHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EggMoveTutor:
	faceplayer
	opentext
;	checkcode VAR_PARTYCOUNT
;	ifgreater 0, .DontGive
;	givepoke PSYDUCK, 10
;	givepoke PSYDUCK, 10
;	giveitem CARBOS, 50
;	giveitem BRICK_PIECE, 50
;.DontGive
	special SpecialEggTutor
	waitbutton
	closetext
	end

PastFaviaEggTutorHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 1
	warp_event 3,  7, PAST_FAVIA_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EggMoveTutor, -1
