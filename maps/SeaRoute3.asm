	const_def 2 ; object constants

SeaRoute3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerBirdKeeperRiley:
	trainer BIRD_KEEPER, RILEY, EVENT_BEAT_BIRD_KEEPER_RILEY, BirdKeeperRileyText, BirdKeeperRileyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRileyAfterText
	waitbutton
	closetext
	end

TrainerSwimmerHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMER_HAROLD, SwimmerHaroldText, SwimmerHaroldWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerHaroldAfterText
	waitbutton
	closetext
	end

TrainerSwimmerSaul:
	trainer SWIMMERM, SAUL, EVENT_BEAT_SWIMMER_SAUL, SwimmerSaulText, SwimmerSaulWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerSaulAfterText
	waitbutton
	closetext
	end

SeaRoute3MaxPotion:
	itemball MAX_POTION
	
SeaRoute3Elixer:
	itemball ELIXER

SeaRoute3SmokeBall:
	itemball SMOKE_BALL

SeaRoute3FruitTree:
	fruittree FRUITTREE_SEA_ROUTE_3
	
BirdKeeperRileyText:
	text "I love to ride the"
	line "winds on the backs"
	cont "of my #MON and"
	cont "taste the salty"
	cont "sea air!"
	done

BirdKeeperRileyWinText:
	text "Prepare for a"
	line "water landing!"
	done

BirdKeeperRileyAfterText:
	text "My #MON allow"
	line "me to reach so"
	cont "many places I"
	cont "couldn't on my own."
	done
	
SwimmerHaroldText:
	text "A trainer?"
	
	para "Evasive maneuver!"
	done
	
SwimmerHaroldWinText:
	text "Fall back!"
	done
	
SwimmerHaroldAfterText:
	text "You're the first"
	line "trainer to see"
	cont "through my veil of"
	cont "ink. I must find a"
	cont "new tactic."
	done

SwimmerSaulText:
	text "Water, water. As"
	line "far as the eye can"
	cont "see."
	
	para "Might I spot a"
	line "trainer cross"
	cont "before me?"
	done

SwimmerSaulWinText:
	text "The sea was no use"
	line "in my battle with"
	cont "thee."
	done

SwimmerSaulAfterText:
	text "I have plenty of"
	line "time to think up"
	cont "some rhymes when I"
	cont "am alone in this"
	cont "ocean."
	done

SeaRoute3_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 22,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRiley, -1
	object_event 21, 25, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmerHarold, -1
	object_event 32, 15, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSwimmerSaul, -1
	object_event 27,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeaRoute3MaxPotion, EVENT_SEA_ROUTE_3_MAX_POTION
	object_event 17, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeaRoute3Elixer, EVENT_SEA_ROUTE_3_ELIXER
	object_event 21, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeaRoute3SmokeBall, EVENT_SEA_ROUTE_3_SMOKE_BALL
	object_event 24,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeaRoute3FruitTree, -1
