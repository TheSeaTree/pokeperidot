	const_def 2 ; object constants

HepaticaCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall
	
.SmashWall:
	checkevent EVENT_NEVERMELTICE_CHAMBER_OPEN
	iffalse .skip
	changeblock 18, 0, $13
.skip
	return

TrainerBurglarKen:
	trainer BURGLAR, KEN, EVENT_BEAT_BURGLAR_KEN, BurglarKenText, BurglarKenWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarKenAfterText
	waitbutton
	closetext
	end	

HepaticaCaveHiker:
	jumptextfaceplayer HepaticaCaveHikerText
	
HepaticaCaveB1FPPUp:
	itemball PP_UP
	
HepaticaCaveB1FBoulder:
	jumpstd strengthboulder
	
HepaticaCaveHikerText:
	text "There are some"
	line "shady guys deeper"
	cont "in this cave."
	
	para "I tried to stop"
	line "them, but there"
	cont "were too many!"
	
	para "All of my #MON"
	line "got their items"
	cont "stolen!"
	done
	
BurglarKenText:
	text "Those idiots let a"
	line "kid all the way up"
	cont "here?"
	
	para "You won't get any"
	line "further!"
	done
	
BurglarKenWinText:
	text "The boss said this"
	line "was gonna be an"
	cont "easy job."
	done

BurglarKenAfterText:
	text "This place wasn't"
	line "supposed to have"
	cont "anyone to stop us!"
	done

HepaticaCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  9,  3, HEPATICA_CAVE_1F, 2
	warp_event 15,  5, HEPATICA_CAVE_B2F, 1
	warp_event 31, 25, HEPATICA_CAVE_B2F, 2
	warp_event 35,  5, HEPATICA_CHURCH, 3
	warp_event 19,  1, NEVERMELTICE_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  19, 24, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaCaveB1FBoulder, -1
	object_event  31, 7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarKen, EVENT_CLEARED_CHURCH
	object_event   4, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, HepaticaCaveHiker, EVENT_CLEARED_CHURCH
	object_event 13, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HepaticaCaveB1FPPUp, CIANWOOD_CAVE_B1F_PP_UP
