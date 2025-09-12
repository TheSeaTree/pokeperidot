	const_def 2 ; object constants

PectiniaApartmentLeft2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaApartmentLeft2FGameboyKid:
	faceplayer
	opentext
	writetext PectiniaApartmentLeft2FGameboyKidText
	waitbutton
	checkevent EVENT_AZALEA_APARTMENT_GOT_LIGHT_BALL
	iftrue .NoPikachu
	writebyte PIKACHU
	special FindPartyMonThatSpecies
	iffalse .NoPikachu
	writetext GameboyKidNoticesPikachuText
	waitbutton
	verbosegiveitem LIGHT_BALL
	iffalse .NoRoom
	writetext PectiniaApartmentLeft2FGameboyKidAfterText
	waitbutton
	
.NoPikachu
	closetext
	end
	
.NoRoom
	writetext NoRoomLightBall
	waitbutton
	closetext
	end
	
PectiniaApartmentLeft2FMother:
	jumptextfaceplayer PectiniaApartmentLeft2FMotherText
	
PectiniaApartmentLeft2FSuperNerd:
	jumptextfaceplayer PectiniaApartmentLeft2FSuperNerdText

PectiniaApartmentLeft2FPikachu:
	opentext
	writetext PectiniaApartmentLeft2FPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end	

PectiniaApartmentLeft2FPikachuText:
	text "PIKACHU: Chu!"
	done
	
PectiniaApartmentLeft2FMotherText:
	text "It's tough taking"
	line "care of my son"
	cont "while my husband"
	cont "is away on a"
	cont "business trip."
	
	para "At least he"
	line "doesn't get him-"
	cont "self into trouble"
	cont "like some other"
	cont "boys."
	done
	
PectiniaApartmentLeft2FSuperNerdText:
	text "Ugh! Coding is so"
	line "tedious."
	
	para "If I wasn't being"
	line "paid to work from"
	cont "home, I wouldn't"
	cont "do this."
	done
	
PectiniaApartmentLeft2FGameboyKidText:
	text "Man, even after"
	line "getting home I"
	cont "can't put down"
	cont "this game! Thanks,"
	cont "PIKACHU!"
	done
	
GameboyKidNoticesPikachuText:
	text "Oh, you have a"
	line "PIKACHU too?"
	
	para "You know, I found"
	line "these things that"
	cont "my PIKACHU seems"
	cont "to really like."
	
	para "There were two, so"
	line "you can have one"
	cont "and see if your"
	cont "PIKACHU likes it"
	cont "too!"
	done
	
PectiniaApartmentLeft2FGameboyKidAfterText:
	text "Another kid told"
	line "me that can make a"
	cont "PIKACHU really"
	cont "strong!"
	
	para "I'm not allowed to"
	line "battle, so I just"
	cont "let PIKACHU play"
	cont "with it."
	done
	
NoRoomLightBall:
	text "Your BAG is full,"
	line "I get it."
	done

PectiniaApartmentLeft2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  0, PECTINIA_APARTMENT_LEFT, 3
	warp_event  7,  0, PECTINIA_APARTMENT_LEFT_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  2, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeft2FGameboyKid, -1
	object_event  2,  2, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeft2FPikachu, -1
	object_event  2,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeft2FMother, -1
	object_event  7,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeft2FSuperNerd, -1
