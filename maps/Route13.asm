	const_def 2 ; object constants

Route13_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerPokefanMDoug:
	trainer POKEFANM, DOUG, EVENT_BEAT_POKEFANM_DOUG, PokefanMDougText, PokefanMDougWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokefanMDougAfterText
	waitbutton
	closetext
	end
	
TrainerFirebreatherWayne:
	trainer FIREBREATHER, WAYNE, EVENT_BEAT_FIREBREATHER_WAYNE, FirebreatherWayneText, FirebreatherWayneWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FirebreatherWayneAfterText
	waitbutton
	closetext
	end
	
TrainerPokemaniacTyler:
	trainer POKEMANIAC, TYLER, EVENT_BEAT_POKEMANIAC_TYLER, PokemaniacTylerText, PokemaniacTylerWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokemaniacTylerAfterText
	waitbutton
	closetext
	end

BirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoyText, BirdKeeperRoyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterText
	waitbutton
	closetext
	end

BikerJesse:
	trainer BIKER, JESSE, EVENT_BEAT_BIKER_JESSE, BikerJesseText, BikerJesseWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BikerJesseAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerAngie
	trainer SWIMMERF, ANGIE, EVENT_BEAT_SWIMMER_ANGIE, SwimmerAngieText, SwimmerAngieWinText, 0, .AfterScript
	
.AfterScript
	endifjustbattled
	opentext
	writetext SwimmerAngieAfterText
	waitbutton
	closetext
	end

Route13SharpBeak:
	itemball SHARP_BEAK

Route13FruitTree1:
	fruittree FRUITTREE_ROUTE_13_1

Route13FruitTree2:
	fruittree FRUITTREE_ROUTE_13_2
	
Route13Rock:
	jumpstd smashrock
	
PokefanMDougText:
	text "I am a"
	line "#MON trainer!"
	done
	
PokefanMDougWinText:
	text "I lost."
	done
	
PokefanMDougAfterText:
	text "I lost."
	done
	
FirebreatherWayneText:
	text "I am a"
	line "#MON trainer!"
	done
	
FirebreatherWayneWinText:
	text "I lost."
	done
	
FirebreatherWayneAfterText:
	text "I lost."
	done
	
PokemaniacTylerText:
	text "I am a"
	line "#MON trainer!"
	done
	
PokemaniacTylerWinText:
	text "I lost."
	done
	
PokemaniacTylerAfterText:
	text "I lost."
	done

BirdKeeperRoyText:
	text "I am a"
	line "#MON trainer!"
	done
	
BirdKeeperRoyWinText:
	text "I lost."
	done
	
BirdKeeperRoyAfterText:
	text "I lost."
	done
	
BikerJesseText:
	text "I'm gonna tear up"
	line "your team like I"
	cont "tear up this"
	cont "trail!"
	done
	
BikerJesseWinText:
	text "Oh man, wipeout!"
	done
	
BikerJesseAfterText:
	text "Burn rubber and"
	line "leave smoke. That"
	cont "is what I live by!"
	done
	
SwimmerAngieText:
	text "You creep! Can't"
	line "you see I'm"
	cont "changing into my"
	cont "swimsuit?"
	done
	
SwimmerAngieWinText:
	text "Just because you"
	line "won, it doesn't"
	cont "mean you can still"
	cont "look!"
	done

SwimmerAngieAfterText:
	text "What are you still"
	line "doing here?"
	cont "Get lost!"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 16 ; object events
	object_event 24, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPokefanMDoug, -1
	object_event 31, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacTyler, -1
	object_event 34, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, BirdKeeperRoy, -1
	object_event 30,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherWayne, -1
	object_event 23,  6, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, BikerJesse, -1
	object_event 23, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13Rock, -1
	object_event 34,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13Rock, -1
	object_event 35,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13Rock, -1
	object_event 31, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13FruitTree1, -1
	object_event  6, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13FruitTree2, -1
	object_event 11, 14, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerAngie, -1
	object_event 11, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 20, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 34, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route13SharpBeak, EVENT_13_SHARP_BEAK
