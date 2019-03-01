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
	trainer FISHER, BRADY, EVENT_BEAT_FISHER_BRADY, SailorCalvinText, SailorCalvinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorCalvinAfterText
	waitbutton
	closetext
	end	

TrainerFisherNelson:
	trainer FISHER, NELSON, EVENT_BEAT_FISHER_NELSON, SailorCalvinText, SailorCalvinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorCalvinAfterText
	waitbutton
	closetext
	end
	
TrainerSailorJeremy:
	trainer SAILOR, JEREMY, EVENT_BEAT_SAILOR_JEREMY, SailorCalvinText, SailorCalvinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorCalvinAfterText
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
	trainer SAILOR, ROLAND, EVENT_BEAT_SAILOR_ROLAND, SailorCalvinText, SailorCalvinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorCalvinAfterText
	waitbutton
	closetext
	end
	
Route6Rock:
	jumpstd smashrock
	
Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

SailorCalvinText:
	text "I am a"
	line "#MON trainer."
	done
	
SailorCalvinWinText:
	text "I lost."
	done
	
SailorCalvinAfterText:
	text "I lost."
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

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"
	
	para "ROUTE 6-"
	line "ROUTE 7"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	db 1; warp events
	warp_event  3, 19, ROUTE_6_UNDERGROUND, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 18, BGEVENT_READ, Route6UndergroundPathSign

	db 11 ; object events
	object_event 21, 14, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorCalvin, -1
	object_event 52, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerFisherNelson, -1
	object_event 32,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerFisherBrady, -1
	object_event 40,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorJeremy, -1
	object_event 42,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorMiles, -1
	object_event 49,  8, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorRoland, -1
	object_event  6, 21, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, EVENT_GOT_TM_TELEPORT
	object_event  5, 20, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	object_event  6, 18, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	object_event  3, 15, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	object_event  0, 21, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6Rock, -1
	