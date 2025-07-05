	const_def 2 ; object constants
	const ROUTE16_SNORLAX
	const ROUTE16_FISHER
	const ROUTE16_SUPERNERD
	const ROUTE16_YOUNGSTER1
	const ROUTE16_YOUNGSTER2
	const ROUTE16_TEACHER
	const ROUTE16_FRUIT_TREE1
	const ROUTE16_FRUIT_TREE2
	const ROUTE16_ITEM_BALL

Route16_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerLadJules:
	trainer LAD, JULES, EVENT_BEAT_LAD_JULES, LadJulesText, LadJulesWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LadJulesAfterText
	waitbutton
	closetext
	end
	
TrainerBirdKeeperHugh:
	trainer BIRD_KEEPER, HUGH, EVENT_BEAT_BIRD_KEEPER_HUGH, BirdKeeperHughText, BirdKeeperHughWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BirdKeeperHughAfterText
	waitbutton
	closetext
	end

TrainerPsychicFreddie:
	trainer PSYCHIC_T, FREDDIE, EVENT_BEAT_PSYCHIC_FREDDIE, PsychicFreddieText, PsychicFreddieWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PsychicFreddieAfterText
	waitbutton
	closetext
	end

TrainerFirebreatherRubin:
	trainer FIREBREATHER, RUBIN, EVENT_BEAT_FIREBREATHER_RUBIN, FirebreatherRubinText, FirebreatherRubinWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FirebreatherRubinAfterText
	waitbutton
	closetext
	end

Route16Teacher:
	checkevent EVENT_CAUGHT_SNORLAX
	iftrue .CaughtSnorlax
	jumptextfaceplayer Route16TeacherMissedSnorlaxText
	
.CaughtSnorlax
	jumptextfaceplayer Route16TeacherCaughtSnorlax

Route16SnorlaxEvent:
	opentext
	writetext SnorlaxSleepingText
	waitbutton
	checkitem POKE_FLUTE
	iffalse No_PokeFlute
	writetext UseFluteText
	yesorno
	iffalse No_PokeFlute
	writetext PlayerPlayedFluteText
	playsound SFX_POKEFLUTE
	waitsfx
	closetext
AwokenSnorlaxScript::  ; export (for when you use Poke Flute from pack)
	opentext
	writetext SnorlaxWokeUpText
	waitbutton
	cry SNORLAX
	waitsfx
	writetext SnorlaxAttackedText
	waitbutton
	closetext
	special SnorlaxEvent_SetBattleType
	loadwildmon SNORLAX, 45
	startbattle
	reloadmapafterbattle
	disappear ROUTE16_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	special CheckCaughtCelebi
	iffalse .NoSnorlax
	setevent EVENT_CAUGHT_SNORLAX
	end
.NoSnorlax
	jumptext SnorlaxReturnedHomeText
	end

No_PokeFlute:
	closetext
	end

Route16Sign:
	jumptext Route16SignText

Route16TrainerTipSign:
	jumptext Route16TrainerTipSignText

Route16PoisonBarb:
	itemball POISON_BARB
	
Route16HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_16_HIDDEN_NUGGET
	
Route16HiddenXSpeed:
	hiddenitem X_SPEED, EVENT_ROUTE_16_HIDDEN_X_SPEED
	
Route16HiddenSunStone:
	hiddenitem SUN_STONE, EVENT_ROUTE_16_HIDDEN_SUN_STONE

Route16FruitTree1:
	fruittree FRUITTREE_ROUTE_16_1

Route16FruitTree2:
	fruittree FRUITTREE_ROUTE_16_2

SnorlaxSleepingText:
	text "This #MON is"
	line "sound asleep."
	
	para "It won't budge!"
	done
	
SnorlaxWokeUpText:
	text "The sleeping"
	line "#MON was awoken"
	cont "by the sound of"
	cont "the # FLUTE!"
	done

SnorlaxAttackedText:
	text "The sleeping"
	line "#MON attacked!"
	done

UseFluteText:
	text "Try playing the"
	line "# FLUTE?"
	done

PlayerPlayedFluteText:
	text "<PLAYER> played the"
	line "# FLUTE."
	done

LadJulesText:
	text "Hey! Let me show"
	line "you the new #-"
	cont "MON I just caught!"
	done
	
LadJulesWinText:
	text "I needed more"
	line "#MON…"
	done
	
LadJulesAfterText:
	text "I'm sure there are"
	line "more #MON to"
	cont "catch here."
	
	para "I'm going to keep"
	line "looking in the"
	cont "grass."
	done
	
BirdKeeperHughText:
	text "How dare you cross"
	line "into my territory!"
	
	para "Prepare your"
	line "#MON for a"
	cont "lashing!"
	done
	
BirdKeeperHughWinText:
	text "Your backlash was"
	line "too much for us."
	done
	
BirdKeeperHughAfterText:
	text "Oh well. I can"
	line "just FLY to a new"
	cont "location using my"
	cont "#MON."
	done
	
PsychicFreddieText:
	text "I have been trying"
	line "to get into the"
	cont "dreams of SNORLAX"
	cont "as it sleeps."
	
	para "Allow me to demon-"
	line "strate how."
	done

PsychicFreddieWinText:
	text "Failure? My worst"
	line "nightmare!"
	done

PsychicFreddieAfterText:
	text "Any moment now I"
	line "will wake up, and"
	cont "none of this will"
	cont "have happened."
	
	para "I'm sure of that!"
	done
	
FirebreatherRubinText:
	text "WOOSH!"
	
	para "Hey! Careful!"
	
	para "You almost walked"
	line "right into my"
	cont "fireball!"
	
	para "Do I need to show"
	line "you what will"
	cont "happen if you get"
	cont "caught in one?"
	done
	
FirebreatherRubinWinText:
	text "You ruined my"
	line "whole act!"
	done

FirebreatherRubinAfterText:
	text "Sorry I snapped at"
	line "you, kid."
	
	para "But you gotta be"
	line "careful around"
	cont "fire!"
	done
	
Route16TeacherMissedSnorlaxText:
	text "What did you do to"
	line "make that #MON"
	cont "so grumpy?"
	
	para "I hope it will"
	line "come back some day"
	cont "when it's in a"
	cont "better mood."
	done
	
Route16TeacherCaughtSnorlax:
	text "Wow! I watched"
	line "your battle with"
	cont "the #MON that"
	cont "was blocking this"
	cont "path."
	
	para "It looked very"
	line "strong. You're so"
	cont "lucky to have"
	cont "captured it!"
	done
	
SnorlaxReturnedHomeText:
	text "With a big yawn,"
	line "SNORLAX returned"
	cont "to its home in the"
	cont "mountains."
	
	para "It looked quite"
	line "grumpy…"
	done

Route16SignText:
	text "ROUTE 16"
	
	para "ACROPORA CITY"
	line "ahead."
	done

Route16TrainerTipSignText:
	text "TRAINER TIPS"
	
	para "Be aware of any"
	line "food dropped on"
	cont "the ground."
	
	para "It may attract"
	line "wild #MON."
	done

Route16_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 13, 39, ROUTE_16_ACROPORA_GATE, 1
	warp_event 14, 39, ROUTE_16_ACROPORA_GATE, 2
	warp_event 41,  5, HEAVY_BALL_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 15, 32, BGEVENT_READ, Route16Sign
	bg_event 47, 25, BGEVENT_READ, Route16TrainerTipSign
	bg_event 59, 22, BGEVENT_ITEM, Route16HiddenNugget
	bg_event 11, 30, BGEVENT_ITEM, Route16HiddenXSpeed
	bg_event 12, 19, BGEVENT_ITEM, Route16HiddenSunStone

	db 9 ; object events
	object_event 32, 16, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route16SnorlaxEvent, EVENT_FOUGHT_SNORLAX
	object_event 60, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherRubin, -1
	object_event 54, 22, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, TrainerPsychicFreddie, -1
	object_event 53, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperHugh, -1
	object_event 26, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLadJules, -1
	object_event 33, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16Teacher, -1
	object_event 47, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route16FruitTree1, -1
	object_event 10, 19, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route16FruitTree2, -1
	object_event 29, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route16PoisonBarb, EVENT_ROUTE_16_POISON_BARB
