Route15_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerSuperNerdHal:
	trainer SUPER_NERD, HAL, EVENT_BEAT_SUPER_NERD_HAL, SuperNerdHalText, SuperNerdHalWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SuperNerdHalAfterText
	waitbutton
	closetext
	end
	
TrainerJugglerBlair:
	trainer JUGGLER, BLAIR, EVENT_BEAT_JUGGLER_BLAIR, JugglerBlairText, JugglerBlairWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext JugglerBlairAfterText
	waitbutton
	closetext
	end
	
TrainerBikerMorton:
	trainer BIKER, MORTON, EVENT_BEAT_BIKER_MORTON, BikerMortonText, BikerMortonWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BikerMortonAfterText
	waitbutton
	closetext
	end
	
TrainerBugCatcherTroy:
	trainer BUG_CATCHER, TROY, EVENT_BEAT_BUG_CATCHER_TROY, BugCatcherTroyText, BugCatcherTroyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherTroyAfterText
	waitbutton
	closetext
	end

TrainerBeautyDiane:
	trainer BEAUTY, DIANE, EVENT_BEAT_BEAUTY_DIANE, BeautyDianeText, BeautyDianeWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyDianeAfterText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15Sign2:
	jumptext Route15Sign2Text

Route15Calcium:
	itemball CALCIUM

Route15Thunderstone:
	itemball THUNDERSTONE

Route15TMSludgeBomb:
	itemball TM_SLUDGE_BOMB
	
Route15BigMushroom:
	hiddenitem BIG_MUSHROOM, EVENT_ROUTE_15_HIDDEN_BIG_MUSHROOM
	
Route15Stick:
	hiddenitem STICK, EVENT_ROUTE_15_HIDDEN_STICK
	
SuperNerdHalText:
	text "I just got done"
	line "planning moves for"
	cont "my #MON."
	
	para "Let me test them"
	line "on you!"
	done
	
SuperNerdHalWinText:
	text "Would you mind"
	line "giving me a list"
	cont "of moves your"
	cont "#MON know?"
	done
	
SuperNerdHalAfterText:
	text "Some guy near the"
	line "old PORYGON"
	cont "factory offered an"
	cont "UP-GRADE to me."
	
	para "I was a fool to"
	line "not take it!"
	done
	
JugglerBlairText:
	text "That's right, pay"
	line "attention to my"
	cont "juggling!"
	done
	
JugglerBlairWinText:
	text "It's never worked"
	line "like that before!"
	done
	
JugglerBlairAfterText:
	text "My strategy is to"
	line "distract a trainer"
	cont "with my juggling"
	cont "while we battle."
	
	para "It was working,"
	line "too."

	para "…Until you showed"
	line "up!"
	done

BikerMortonText:
	text "You stay away from"
	line "our TM!"
	done
	
BikerMortonWinText:
	text "Way to spin out,"
	line "team."
	done
	
BikerMortonAfterText:
	text "Normally I won't"
	line "be seen with a BUG"
	cont "CATCHER, but this"
	cont "little dude taught"
	cont "me how to make my"
	cont "POISON #MON"
	cont "strong!"
	done

BugCatcherTroyText:
	text "Did you know some"
	line "BUG #MON may"
	cont "be poisonous?"
	
	para "I thought that was"
	line "fascinating!"
	done
	
BugCatcherTroyWinText:
	text "You've built up an"
	line "immunity."
	done
	
BugCatcherTroyAfterText:
	text "I shared my TM"
	line "with that BIKER."
	done
	
BeautyDianeText:
	text "Hehe! You looked"
	line "at me, didn't you?"
	done
	
BeautyDianeWinText:
	text "How could you let"
	line "me lose like that!"
	done
	
BeautyDianeAfterText:
	text "I love all the"
	line "attention I get on"
	cont "this route!"
	
	para "Hehe!"
	line "I can't get enough!"
	done

Route15SignText:
	text "ROUTE 15"
	
	para "CARNATION TOWN -"
	line "ROUTE 16"
	done

Route15Sign2Text:
	text "TRAINER TIPS"

	para "Exercise caution"
	line "when encountering"
	cont "wild MANKEY."

	para "These #MON are"
	line "quick to anger,"
	cont "and can pose a"
	cont "threat to humans."
	done

Route15_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event 37, 13, BGEVENT_READ, Route15Sign
	bg_event  8, 11, BGEVENT_READ, Route15Sign2
	bg_event  8,  5, BGEVENT_ITEM, Route15BigMushroom
	bg_event 49, 16, BGEVENT_ITEM, Route15Stick

	db 8 ; object events
	object_event 30, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerBlair, -1
	object_event 19,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2,  TrainerSuperNerdHal, -1
	object_event  0, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerMorton, -1
	object_event  2,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherTroy, -1
	object_event  1, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyDiane, -1
	object_event 24, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15Thunderstone, EVENT_ROUTE_15_THUNDERSTONE
	object_event 32,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15Calcium, EVENT_ROUTE_15_CALCIUM
	object_event  1,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, Route15TMSludgeBomb, EVENT_GOT_TM_SLUDGE_BOMB
