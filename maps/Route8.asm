	const_def 2 ; object constants
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerKait:
	trainer SWIMMERF, KAIT, EVENT_BEAT_SWIMMERF_KAIT, SwimmerKaitText, SwimmerKaitWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerKaitAfterText
	waitbutton
	closetext
	end
	
TrainerBirdKeeperAlex:
	trainer BIRD_KEEPER, ALEX, EVENT_BEAT_BIRD_KEEPER_ALEX, BirdkeeperAlexText, BirdkeeperAlexWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperAlexAfterText
	waitbutton
	closetext
	end
	
TrainerFirebreatherBrian:
	trainer FIREBREATHER, BRIAN, EVENT_BEAT_FIREBREATHER_BRIAN, FirebreatherBrianText, FirebreatherBrianWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBrianAfterText
	waitbutton
	closetext
	end
	
TrainerLassStephanie:
	trainer LASS, STEPHANIE, EVENT_BEAT_LASS_STEPHANIE, LassStephanieText, LassStephanieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassStephanieAfterText
	waitbutton
	closetext
	end
	
TrainerJugglerRobert:
	trainer JUGGLER, ROBERT, EVENT_BEAT_JUGGLER_ROBERT, JugglerRobertText, JugglerRobertWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerRobertAfterText
	waitbutton
	closetext
	end
	
Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8
	
Route8SunStone:
	itemball SUN_STONE
	
Route8RareCandy:
	itemball RARE_CANDY

Route8Revive:
	itemball REVIVE
	
Route8Rock:
	jumpstd smashrock	
	
SwimmerKaitText:
	text "I am a"
	line "#MON trainer."
	done

SwimmerKaitWinText:
	text "I lost."
	done
	
SwimmerKaitAfterText:
	text "I lost."
	done
	
BirdkeeperAlexText:
	text "I am a"
	line "#MON trainer."
	done

BirdkeeperAlexWinText:
	text "I lost."
	done
	
BirdkeeperAlexAfterText:
	text "I lost."
	done
	
FirebreatherBrianText:
	text "I am a"
	line "#MON trainer."
	done
	
FirebreatherBrianWinText:
	text "I lost."
	done
	
FirebreatherBrianAfterText:
	text "I lost."
	done
	
LassStephanieText:
	text "I am a"
	line "#MON trainer."
	done

LassStephanieWinText:
	text "I lost."
	done
	
LassStephanieAfterText:
	text "I lost."
	done
	
JugglerRobertText:
	text "I am a"
	line "#MON trainer."
	done
	
JugglerRobertWinText:
	text "I lost."
	done
	
JugglerRobertAfterText:
	text "I lost."
	done
	
Route8UndergroundPathSignText:
	text "Underground."
	done

Route8_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 31, 21, ROUTE_6_UNDERGROUND, 7
	warp_event  4, 58, ROUTE_8_GOLDENROD_GATE, 3
	warp_event  4, 59, ROUTE_8_GOLDENROD_GATE, 4
	warp_event 33, 50, ROUTE_8_ROUTE_10_GATE, 1
	warp_event 33, 51, ROUTE_8_ROUTE_10_GATE, 2
	warp_event 15, 45, ROUTE_8_SILK_SCARF_HOUSE, 1
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 30, 22, BGEVENT_READ, Route8UndergroundPathSign

	db 13 ; object events
	object_event 20, 45, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
	object_event  4, 46, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8SunStone, EVENT_ROUTE_8_SUN_STONE
	object_event 10, 69, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8RareCandy, EVENT_ROUTE_8_RARE_CANDY
	object_event 12, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8Revive, EVENT_ROUTE_8_REVIVE
	object_event 24, 21, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerKait, -1
	object_event 18, 35, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAlex, -1
	object_event 17, 53, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBrian, -1
	object_event  9, 58, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerLassStephanie, -1
	object_event 27, 50, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerJugglerRobert, -1
	object_event 29, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
	object_event 20, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
	object_event 25, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
	object_event 23, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
