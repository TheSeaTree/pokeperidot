	const_def 2 ; object constants
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWallWarpPanel

.SmashWallWarpPanel:
	checkevent EVENT_ROUTE_7_HIDDEN_CAVE_OPEN
	iffalse .skipcave
	changeblock  22,  4, $73
.skipcave
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .skip
	changeblock  16, 58, $c5
.skip
	return

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

TrainerLassDanni:
	trainer LASS, DANNI, EVENT_BEAT_LASS_DANNI, LassDanniText, LassDanniWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassDanniAfterText
	waitbutton
	closetext
	end

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_7

Route8SunStone:
	itemball SUN_STONE

Route8RareCandy:
	itemball RARE_CANDY

Route8Revive:
	itemball REVIVE

Route8DampCharm:
	itemball DAMP_CHARM

Route8Rock:
	jumpstd smashrock

SwimmerKaitText:
	text "Nothing beats a"
	line "#MON battle as"
	cont "warmup before"
	cont "swimming."
	done

SwimmerKaitWinText:
	text "I could still beat"
	line "you at swimming!"
	done

SwimmerKaitAfterText:
	text "I can swim a mile"
	line "in 5 minutes!"
	done

BirdkeeperAlexText:
	text "Day or night, my"
	line "#MON are always"
	cont "ready to go!"
	done

BirdkeeperAlexWinText:
	text "No! They must have"
	line "been jet-lagged!"
	done

BirdkeeperAlexAfterText:
	text "If you came later,"
	line "my #MON would"
	cont "have had a better"
	cont "chance!"
	done

FirebreatherBrianText:
	text "Augh…"
	line "WHOOSH!"
	done

FirebreatherBrianWinText:
	text "My, that was"
	line "concerning."
	done

FirebreatherBrianAfterText:
	text "I'm feeling a lot"
	line "better after our"
	cont "battle."

	para "I just had a case"
	line "of indigestion."
	done

LassStephanieText:
	text "Cute, round, and"
	line "cuddly."

	para "That is all I want"
	line "from my #MON!"
	done

LassStephanieWinText:
	text "Humph!"

	para "No fair!"
	done

LassStephanieAfterText:
	text "You're nothing"
	line "like the #MON"
	cont "I train."

	para "But your #MON"
	line "seem to love you"
	cont "anyway."
	done

LassDanniText:
	text "I just got done"
	line "changing back into"
	cont "my clothes after a"
	cont "swim."

	para "Oh, a battle?"
	line "Sure!"
	done

LassDanniWinText:
	text "…I'm just tired"
	line "after swimming!"
	done

LassDanniAfterText:
	text "I learned to swim"
	line "so that I could"
	cont "find new #MON."
	done

JugglerRobertText:
	text "Gaze at my mastery"
	line "of gravity!"
	done

JugglerRobertWinText:
	text "No! You made me"
	line "drop my BALLs!"
	done

JugglerRobertAfterText:
	text "…Okay, fine."

	para "I had my #MON"
	line "do the juggling"
	cont "for me…"
	done

Route8UndergroundPathSignText:
	text "UNDERGROUND PATH"
	para "ROUTE 7-"
	line "ROUTE 6"
	done

Route8_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 31, 21, ROUTE_6_UNDERGROUND, 7
	warp_event  4, 58, ROUTE_7_FAVIA_GATE, 3
	warp_event  4, 59, ROUTE_7_FAVIA_GATE, 4
	warp_event 33, 50, ROUTE_7_ROUTE_8_GATE, 1
	warp_event 33, 51, ROUTE_7_ROUTE_8_GATE, 2
	warp_event 15, 45, ROUTE_7_SILK_SCARF_HOUSE, 1
	warp_event 22,  5, ROUTE_7_HIDDEN_CAVE, 1
	warp_event 16, 59, FAVIA_TOWN, 11
	db 0 ; coord events

	db 1 ; bg events
	bg_event 30, 22, BGEVENT_READ, Route8UndergroundPathSign

	db 15 ; object events
	object_event 20, 45, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
	object_event  4, 46, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8SunStone, EVENT_ROUTE_7_SUN_STONE
	object_event 10, 69, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8RareCandy, EVENT_ROUTE_7_RARE_CANDY
	object_event 12, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8Revive, EVENT_ROUTE_7_REVIVE
	object_event  6,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route8DampCharm, EVENT_ROUTE_7_DAMP_CHARM
	object_event 24, 21, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerKait, -1
	object_event 18, 35, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAlex, -1
	object_event 17, 53, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBrian, -1
	object_event  9, 58, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerLassStephanie, -1
	object_event 27, 50, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerJugglerRobert, -1
	object_event 10, 13, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerLassDanni, -1
	object_event 29, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
	object_event 20, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
	object_event 25, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
	object_event 23, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8Rock, -1
