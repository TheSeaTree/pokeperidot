	const_def 2 ; object constants

AzaleaApartmentLeft2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaApartmentLeft2FGameboyKid:
	faceplayer
	opentext
	writetext AzaleaApartmentLeft2FGameboyKidText
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
	writetext AzaleaApartmentLeft2FGameboyKidAfterText
	waitbutton
	
.NoPikachu
	closetext
	end
	
.NoRoom
	writetext NoRoomLightBall
	waitbutton
	closetext
	end
	
AzaleaApartmentLeft2FMother:
	jumptextfaceplayer AzaleaApartmentLeft2FMotherText

AzaleaApartmentLeft2FPikachu:
	opentext
	writetext AzaleaApartmentLeft2FPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end
	

AzaleaApartmentLeft2FPikachuText:
	text "PIKACHU: Chu!"
	done
	
AzaleaApartmentLeft2FMotherText:
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
	
AzaleaApartmentLeft2FGameboyKidText:
	text "Man, even after"
	line "getting home I"
	cont "can't put down"
	cont "this game! Thanks"
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
	
AzaleaApartmentLeft2FGameboyKidAfterText:
	text "Another kid told"
	line "me that can make a"
	cont "PIKACHU really"
	cont "strong!"
	
	para "I'm not allowed to"
	line "battle, so I just"
	cont "PIKACHU play with"
	cont "it."
	done
	
NoRoomLightBall:
	text "Your BAG is full,"
	line "I get it."
	done

AzaleaApartmentLeft2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  0, AZALEA_APARTMENT_LEFT, 3
	warp_event  7,  0, AZALEA_APARTMENT_LEFT_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  2, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeft2FGameboyKid, -1
	object_event  2,  2, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeft2FPikachu, -1
	object_event  2,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeft2FMother, -1
