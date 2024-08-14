	const_def 2 ; object constants
	const PAVONAPASS1F_POKE_BALL1
	const PAVONAPASS1F_LASS
	const PAVONAPASS1F_ROCK1
	const PAVONAPASS1F_ROCK2
	const PAVONAPASS1F_ROCK3
	const PAVONAPASS1F_BOULDER1
	const PAVONAPASS1F_BOULDER2
	const PAVONAPASS1F_POKEB_ALL2
	const PAVONAPASS1F_SUPERNERD
	const PAVONAPASS1F_RIVAL

PavonaPass1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerLassVicky:
	trainer LASS, VICKY, EVENT_BEAT_LASS_VICKY, LassVickyText, LassVickyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassVickyAfterText
	waitbutton
	closetext
	end		

TrainerPokemaniacTrent:
	trainer POKEMANIAC, TRENT, EVENT_BEAT_POKEMANIAC_TRENT, PokemaniacTrentText, PokemaniacTrentWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacTrentAfterText
	waitbutton
	closetext
	end		
	
PavonaPassRivalScene:
	special FadeOutMusic
	opentext
	writetext PavonaPassRivalText
	waitbutton
	closetext
	playsound SFX_FULL_HEAL
	waitsfx
	opentext
	writetext PavonaPassRivalMuchBetterText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, PAVONAPASS1F_RIVAL, 15
	faceplayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext PavonaPassRivalChallengeText
	waitbutton
	closetext
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Totodile
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .Chikorita
	winlosstext PavonaPassRivalWinText, PavonaPassRivalLossText
	setlasttalked PAVONAPASS1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_3_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext PavonaPassRivalWinText, PavonaPassRivalLossText
	setlasttalked PAVONAPASS1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_3_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext PavonaPassRivalWinText, PavonaPassRivalLossText
	setlasttalked PAVONAPASS1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_3_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PavonaPassRivalAfterText
	waitbutton
	closetext
	applymovement PAVONAPASS1F_RIVAL, PavonaPassRivalLeave
	playsound SFX_WARP_FROM
	waitsfx
	disappear PAVONAPASS1F_RIVAL
	setevent EVENT_RIVAL_PAVONA_PASS
	playmapmusic
	end
	
PavonaPass1FGreatBall:
	itemball GREAT_BALL

PavonaPass1FWaterStone:
	itemball WATER_STONE

PavonaPass1FRock:
	jumpstd smashrock
	
PavonaPass1FBoulder:
	jumpstd strengthboulder

PavonaPass1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_PAVONA_PASS_1F_HIDDEN_RARE_CANDY
	
PavonaPassRivalLeave:
	teleport_from
	step_resume
	
PokemaniacTrentText:
	text "Hey!"
	
	para "I wanted that"
	line "item!"
	done
	
PokemaniacTrentWinText:
	text "No fair!"
	
	para "You caught me off-"
	line "guard!"
	done
	
PokemaniacTrentAfterText:
	text "What was it?"
	
	para "A WATER STONE?"
	
	para "………"
	
	para "Oh, I didn't need"
	line "that after all."
	done
	
LassVickyText:
	text "You'd be surprised"
	line "at how many cute"
	cont "#MON live in"
	cont "caves like this!"
	done
	
LassVickyWinText:
	text "Ooh! I like your"
	line "#MON too!"
	done
	
LassVickyAfterText:
	text "I like to find"
	line "beauty where most"
	cont "people wouldn't"
	cont "think to look."
	done
	
PavonaPassRivalText:
	text "This should be a"
	line "good place to heal"
	cont "up."
	done
	
PavonaPassRivalMuchBetterText:
	text "There."
	line "Much better."
	done
	
PavonaPassRivalChallengeText:
	text "You again?"
	
	para "Look, kid. You may"
	line "have beaten me"
	cont "outside of that"
	cont "GYM, but I have"	
	cont "gotten a lot"
	cont "stronger since"
	cont "then!"
	
	para "Prepare yourself!"
	
	para "My party is"
	line "healed up and"
	cont "ready to test"
	cont "their might!"
	done
	
PavonaPassRivalWinText:
	text "I must have just"
	line "gotten some bad"
	cont "POTIONs."
	
	para "If my team was at"
	line "full strength, you"
	cont "would not have"
	cont "stood a chance!"
	done
	
PavonaPassRivalLossText:
	text "Just as I thought."

	para "That last time was"
	line "a fluke."
	done

PavonaPassRivalAfterText:
	text "…"
	done

PavonaPass1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 41, 15, PAVONA_VILLAGE, 4
	warp_event 27,  7, PAVONA_PASS_B1F, 1
	warp_event 17,  7, PAVONA_PASS_B1F, 2
	warp_event  5,  9, ROUTE_9, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  6, BGEVENT_ITEM, PavonaPass1FHiddenRareCandy

	db 10 ; object events
	object_event 41,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaPass1FGreatBall, EVENT_PAVONA_PASS_1F_GREAT_BALL
	object_event 41,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassVicky, -1
	object_event 38,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaPass1FRock, -1
	object_event 38,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaPass1FRock, -1
	object_event 32,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaPass1FRock, -1
	object_event 39,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaPass1FBoulder, -1
	object_event 36,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaPass1FBoulder, -1
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PavonaPass1FWaterStone, EVENT_PAVONA_PASS_1F_WATER_STONE
	object_event  2,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPokemaniacTrent, -1
	object_event 10,  6, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaPassRivalScene, EVENT_RIVAL_PAVONA_PASS
	