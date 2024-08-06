	const_def 2 ; object constants
	const ROUTE6_POKEFAN_M1

Route6_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorCalvin:
	trainer SAILOR, CALVIN, EVENT_BEAT_SAILOR_CALVIN, SailorCalvinText, SailorCalvinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorCalvinAfterText
	waitbutton
	closetext
	end
	
TrainerFisherBrady:
	trainer FISHER, BRADY, EVENT_BEAT_FISHER_BRADY, FisherBradyText, FisherBradyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBradyAfterText
	waitbutton
	closetext
	end	

TrainerFisherNelson:
	trainer FISHER, NELSON, EVENT_BEAT_FISHER_NELSON, FisherNelsonText, FisherNelsonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherNelsonAfterText
	waitbutton
	closetext
	end
	
TrainerSailorJeremy:
	trainer SAILOR, JEREMY, EVENT_BEAT_SAILOR_JEREMY, SailorJeremyText, SailorJeremyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeremyAfterText
	waitbutton
	closetext
	end

TrainerSailorMiles:
	trainer SAILOR, MILES, EVENT_BEAT_SAILOR_MILES, SailorMilesText, SailorMilesWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorMilesAfterText
	waitbutton
	closetext
	end
	
TrainerSailorRoland:
	trainer SAILOR, ROLAND, EVENT_BEAT_SAILOR_ROLAND, SailorRolandText, SailorRolandWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorRolandAfterText
	waitbutton
	closetext
	end
	
Route6LassScript:
	jumptextfaceplayer Route6LassText

Route6HiddenPearl:
	hiddenitem PEARL, EVENT_ROUTE_6_HIDDEN_PEARL

Route6Rock:
	jumpstd smashrock
	
Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

SailorCalvinText:
	text "Ahoy there, mate!"
	line "Fancy you for a"
	cont "battle?"
	done
	
SailorCalvinWinText:
	text "Arrgh! Ye bested"
	line "me, matie!"
	done
	
SailorCalvinAfterText:
	text "…Cough, cough!"
	
	para "I can't keep up"
	line "that ridiculous"
	cont "pirate voice all"
	cont "day."
	done
	
FisherNelsonText:
	text "I made quite a"
	line "haul today."
	
	para "Let me see how"
	line "these #MON"
	cont "battle!"
	done
	
FisherNelsonWinText:
	text "This is a terrible"
	line "fishing spot!"
	done
	
FisherNelsonAfterText:
	text "I don't have the"
	line "time anymore to"
	cont "train my #MON."
	
	para "I want them to be"
	line "good as soon as I"
	cont "catch them!"
	done
	
FisherBradyText:
	text "It's been a slow"
	line "day. Entertain me"
	cont "for a while?"
	done
	
FisherBradyWinText:
	text "Good battle! You"
	line "really had me."
	done
	
FisherBradyAfterText:
	text "Fishing is unpred-"
	line "ictable. Sometimes"
	cont "you catch nothing"
	cont "while other times"
	cont "you can't go a"
	cont "minute without a"
	cont "#MON tugging on"
	cont "the line."
	
	para "That's what I love"
	line "about it!"
	done
	
SailorJeremyText:
	text "MACHOP and I own"
	line "our own ship!"
	
	para "It is the greatest"
	line "vessel on the sea!"
	done
	
SailorJeremyWinText:
	text "Show more respect"
	line "to a captain!"
	done
	
SailorJeremyAfterText:
	text "What? You kids"
	line "just ride on the"
	cont "backs of your"
	cont "#MON?"
	
	para "That's absolutely"
	line "absurd!"
	done
	
SailorRolandText:
	text "I've travelled far"
	line "and wide across"
	cont "the sea in search"
	cont "of #MON."
	
	para "I'll show you my"
	line "collection."
	done
	
SailorRolandWinText:
	text "You need to show"
	line "me where you got"
	cont "such powerful"
	cont "#MON from."
	done
	
SailorRolandAfterText:
	text "I wish I could"
	line "afford to travel"
	cont "like you, kid."
	
	para "Being stuck near"
	line "the ocean really"
	cont "limits the #MON"
	cont "I am able to find."
	done
	
SailorMilesText:
	text "Let me share with"
	line "you a tale from my"
	cont "time at sea."
	done
	
SailorMilesWinText:
	text "You're as good at"
	line "listening as you"
	cont "are at battling."
	done
	
SailorMilesAfterText:
	text "Please come back"
	line "to share your own"
	cont "stories."
	done

Route6LassText:
	text "One night while I"
	line "was standing here,"
	cont "I saw the most am-"
	cont "azing thing!"
	
	para "A gigantic #MON"
	line "emerged from the"
	cont "ocean and flew"
	cont "away with sparkl-"
	cont "ing wings of"
	cont "SILVER."
	
	para "I have vowed to"
	line "stay right here"
	cont "until I see that"
	cont "#MON again!"
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"
	
	para "ROUTE 6-"
	line "ROUTE 7"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11, 25, ROUTE_6_UNDERGROUND, 1
	warp_event 37, 15, ROUTE_6_SURFERS_HOUSE, 1
	warp_event 21,  9, ROUTE_6_GATE, 3
	warp_event 11,  7, ROUTE_6_WATERFALL_HOUSE, 1
	warp_event  0, 13, SEA_ROUTE_4_CAVE_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 26, BGEVENT_READ, Route6UndergroundPathSign
	bg_event 43, 22, BGEVENT_ITEM, Route6HiddenPearl

	db 12 ; object events
	object_event 29, 20, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorCalvin, -1
	object_event 60, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerFisherNelson, -1
	object_event 40, 15, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerFisherBrady, -1
	object_event 48, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorJeremy, -1
	object_event 50, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorMiles, -1
	object_event 57, 14, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorRoland, -1
	object_event 18,  6, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route6LassScript, EVENT_FOUGHT_LUGIA
	object_event 14, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, EVENT_GOT_TM_TELEPORT
	object_event 13, 26, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	object_event 14, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	object_event 11, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	object_event  8, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	