	const_def 2 ; object constants
	const MAHOGANYAPARTMENT3F_POKEFANM
	const MAHOGANYAPARTMENT3F_GIRL
	const MAHOGANYAPARTMENT3F_DOLL
	const MAHOGANYAPARTMENT3F_MOM

MahoganyApartment3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyApartment3FGirl:
	faceplayer
	opentext
	checkevent EVENT_GOT_CURSTRAW
	iftrue .GotCurstraw
	writetext MahoganyApartment3FGirlText
	waitbutton
	checkitem POKE_DOLL
	iffalse .End
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext MahoganyApartment3FGirlAsk
	yesorno
	iffalse .End
	takeitem POKE_DOLL
	writetext MahoganyApartment3FTradeText
	playsound SFX_CAUGHT_MON
	disappear MAHOGANYAPARTMENT3F_DOLL
	waitsfx
	givepoke CURSTRAW, 32
	setevent EVENT_GOT_CURSTRAW
	
.GotCurstraw
	writetext MahoganyApartment3FGirlAfter
	waitbutton
.End
	closetext
	end
	
.PartyFull
	writetext MahoganyApartment3FPartyFull
	waitbutton
	closetext
	end
	
MahoganyApartment3FMother:
	checkevent EVENT_GOT_CURSTRAW
	iftrue .GotCurstraw
	jumptextfaceplayer MahoganyApartment3FMotherText
	
.GotCurstraw
	jumptextfaceplayer MahoganyApartment3FMotherAfter
	
MahoganyApartment3FPokefanM:
	jumptextfaceplayer MahoganyApartment3FPokefanMText

MahoganyApartment3FGirlText:
	text "Sometimes at night"
	line "my DOLLY will move"
	cont "all by itself."
	
	para "I wanted a normal"
	line "DOLLY, but this is"
	cont "the only one MOMMY"
	cont "could buy."
	done
	
MahoganyApartment3FGirlAsk:
	text "Do you have a"
	line "DOLLY for me?"
	
	para "Do you want to"
	line "trade me for this"
	cont "one."
	done
	
MahoganyApartment3FGirlAfter:
	text "Thank you! I love"
	line "this new DOLLY so"
	cont "much more than the"
	cont "old one already!"
	
	para "It's so much more"
	line "cuddly!"
	done
	
MahoganyApartment3FPartyFull:
	text "It won't let me"
	line "give you DOLLY"
	cont "when you have 6"
	cont "#MON."
	done
	
MahoganyApartment3FTradeText:
	text "<PLAYER> gave"
	line "away a #DOLL"
	cont "and received"
	cont "CURSTRAW!"
	done
	
MahoganyApartment3FMotherText:
	text "My daughter loves"
	line "to play pretend."
	
	para "She is always"
	line "talking about how"
	cont "her doll can move"
	cont "on its own."
	
	para "Children have such"
	line "wild imaginations!"
	done
	
MahoganyApartment3FMotherAfter:
	text "What? You mean the"
	line "doll I bought was"
	cont "really a #MON?"
	
	para "So my daughter was"
	line "telling the truth"
	cont "after all."
	done
	
MahoganyApartment3FPokefanMText:
	text "I know it's rude to"
	line "say, but I have a"
	cont "weird feeling"
	cont "about the family"
	cont "that moved in next"
	cont "door."
	
	para "Don't get me wrong,"
	line "they are very nice"
	cont "people. It's just…"
	
	para "A feeling,"
	line "I suppose?"
	done

MahoganyApartment3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, MAHOGANY_APARTMENT_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyApartment3FPokefanM, -1
	object_event  7,  7, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyApartment3FGirl, -1
	object_event  6,  7, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOT_CURSTRAW
	object_event 11,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyApartment3FMother, -1
