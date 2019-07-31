	const_def 2 ; object constants
	const ECRUTEAKTHIEFHOUSE_GRAMPS

EcruteakThiefHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakThiefHouseGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_THIEF
	iftrue .HaveTMThief
	writetext EcruteakThiefHouseGrampsText
	waitbutton
	checkevent EVENT_AZALEA_RETURNED_BIKE
	iftrue .HaveBike
	closetext
	end
	
.HaveBike
	writetext EcruteakThiefHouseHaveBikeText
	waitbutton
	closetext
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext EcruteakThiefHouseMaleShowBike
	waitbutton
	jump .GiftThief
	
.Girl
	writetext EcruteakThiefHouseFemaleShowBike
	waitbutton
	
.GiftThief
	showemote EMOTE_SHOCK, ECRUTEAKTHIEFHOUSE_GRAMPS, 15
	writetext EcruteakThiefHouseSurprised
	waitbutton
	verbosegiveitem TM_THIEF
	setevent EVENT_GOT_TM_THIEF
	
.HaveTMThief
	writetext EcruteakThiefHouseTMText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

EcruteakThiefHouseGrampsText:
	text "Some little punk"
	line "stole my brand-new"
	cont "BICYCLE!"
	done
	
EcruteakThiefHouseHaveBikeText:
	text "Oh? A BURGLAR gave"
	line "you a BICYCLE"
	cont "after beating him?"
	
	para "Let me see it."
	done
	
EcruteakThiefHouseMaleShowBike:
	text "<PLAYER> showed"
	line "the man his"
	cont "BICYCLE"
	done
	
EcruteakThiefHouseFemaleShowBike	
	text "<PLAYER> showed"
	line "the man her"
	cont "BICYCLE"
	done

EcruteakThiefHouseSurprised:	
	text "Holy moly! That is"
	line "my BICYCLE!"
	
	para "Look, you seem"
	line "Like a good kid so"
	cont "I won't ask for my"
	cont "BICYCLE back."
	
	para "I'm an old man, I"
	line "don't have much"
	cont "use for one of"
	cont "those things any-"
	cont "way."	
	
	para "I would like to"
	line "reward you for"
	cont "showing that punk"
	cont "what bike thieves"
	cont "get."
	done
	
EcruteakThiefHouseTMText:
	text "That TM contains"
	line "THIEF."
	
	para "Use it if you want"
	line "to take any held"
	cont "items that don't"
	cont "belong to you."
	done

EcruteakThiefHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ECRUTEAK_CITY, 7
	warp_event  3,  7, ECRUTEAK_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakThiefHouseGrampsScript, -1
