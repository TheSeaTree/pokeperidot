	const_def 2 ; object constants

AzaleaApartmentRight2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaApartmentRight2FGrampsScript:
	jumptextfaceplayer AzaleaApartmentRight2FGrampsText
	
AzaleaApartmentRight2FGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_AZALEA_APARTMENT_GOT_BERRY_JUICE
	iftrue .GotJuice
	writetext AzaleaApartmentRight2FGrannyText
	waitbutton
	verbosegiveitem BERRY_JUICE
	iffalse .BagFull
	writetext AzaleaApartmentRight2FGrannyMoreJuice
	waitbutton
	writetext PlayerMoreBerryJuice
	playsound SFX_ITEM
	giveitem BERRY_JUICE, 6
	waitsfx
	writetext PutAwayBerryJuiceText
	waitbutton
	setevent EVENT_AZALEA_APARTMENT_GOT_BERRY_JUICE
	
.GotJuice
	writetext AzaleaApartmentRight2FGrannyAfter
	waitbutton
	closetext
	end
	
.BagFull
	writetext AzaleaApartmentRight2FBagFull
	waitbutton
	closetext
	end
	
AzaleaApartmentRight2FSuperNerdScript:
	jumptextfaceplayer AzaleaApartmentRight2FSuperNerdText
	
AzaleaApartmentRight2FGrampsText:
	text "I heard that a"
	line "real young kid"
	cont "upstairs bought"
	cont "the whole top"
	cont "floor for himself."
	
	para "Good for him, I"
	line "say! Living in the"
	cont "city ain't cheap,"
	cont "and to do so alone"
	cont "at his age is"
	cont "wonderful!"
	done

AzaleaApartmentRight2FGrannyText:
	text "Oh, a visitor?"
	
	para "We don't get too"
	line "many of those any-"
	cont "more."
	
	para "Thank you for"
	line "coming to spend"
	cont "time with us."
	
	para "I can't let you go"
	line "empty-handed."
	cont "Please, take this."
	done
	
AzaleaApartmentRight2FGrannyMoreJuice:
	text "Your #MON must"
	line "want some too."
	done
	
PlayerMoreBerryJuice:
	text "<PLAYER> received 6"
	line "more BERRY JUICE."
	done
	
PutAwayBerryJuiceText:
	text "<PLAYER> put the"
	line "BERRY JUICE in"
	cont "the ITEM POCKET."
	done
	
AzaleaApartmentRight2FGrannyAfter:
	text "I can't help but"
	line "feed any hungry-"
	cont "looking trainers"
	cont "and their #MON."
	done
	
AzaleaApartmentRight2FBagFull:
	text "Oh, you don't have"
	line "enough room for my"
	cont "gift."
	
	para "Please free up"
	line "some room and come"
	cont "back. It will be"
	cont "waiting right here"
	cont "for you."
	done

AzaleaApartmentRight2FSuperNerdText:
	text "The old couple"
	line "next door are very"
	cont "sweet. I would"
	cont "visit them more,"
	cont "but I've been so"
	cont "busy with work."
	done

AzaleaApartmentRight2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  0, AZALEA_APARTMENT_RIGHT, 3
	warp_event  4,  0, AZALEA_APARTMENT_RIGHT_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 10,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRight2FGrampsScript, -1	
	object_event  9,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRight2FGrannyScript, -1	
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRight2FSuperNerdScript, -1	
