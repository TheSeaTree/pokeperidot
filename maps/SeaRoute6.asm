	const_def 2 ; object constants

SeaRoute6_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_UNOWN_CHAMBER_VZ_OPEN
	iffalse .skip
	changeblock  4, 12, $73
.skip
	return
	
TrainerBeautyChelle:
	trainer BEAUTY, CHELLE, EVENT_BEAT_BEAUTY_CHELLE, BeautyChelleText, BeautyChelleWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyChelleAfterText
	waitbutton
	closetext
	end
	
BeautyChelleText:
	text "My hero! You've"
	line "come to rescue m-"
	
	para "…A battle?"
	
	para "…Okay."
	done 

BeautyChelleWinText:
	text "Okay, you had your"
	line "battle."
	
	para "Now will you help"
	line "me?"
	done

BeautyChelleAfterText:
	text "I was on a boat"
	line "with some friends,"
	cont "but I fell over-"
	cont "board."
	
	para "The current swept"
	line "me up before I"
	cont "knew it."
	
	para "I've been on this"
	line "island for so"
	cont "long that I lost"
	cont "track of time."
	done


SeaRoute6_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 13, UNOWN_CHAMBER_VZ, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 21, 22, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBeautyChelle, -1
	object_event  8, 25, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerGlenn, -1
	object_event 16, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerGlenn, -1
	object_event 20, 15, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerGlenn, -1
