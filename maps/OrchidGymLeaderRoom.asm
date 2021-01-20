	const_def 2 ; object constants

OrchidGymLeaderRoom_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetSteps
	
.SetSteps
	special SetFireGymSteps
	return
	
BlackthornEnyaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ENYA
	iftrue .AlreadyGotTM
	writetext EnyaIntroText
	waitbutton
	closetext
	winlosstext EnyaLossText, 0
	loadtrainer ENYA, ENYA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ENYA
	opentext
	writetext GetBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RISINGBADGE
	checkcode VAR_BADGES
.FightDone:
	setevent EVENT_BEAT_FIREBREATHER_KENNY
	setevent EVENT_BEAT_FIREBREATHER_AIDEN
	setevent EVENT_BEAT_JUGGLER_URI
	setevent EVENT_BEAT_JUGGLER_KAI
	setevent EVENT_BEAT_BIKER_DANTE
	setevent EVENT_BEAT_COOLTRAINERF_KARI
	setevent EVENT_BEAT_COOLTRAINERM_TORY
	writetext EnyaExplainBadgeText
	buttonsound
	verbosegiveitem TM_FLAMETHROWER
	iffalse .BagFull
	setevent EVENT_GOT_TM_FLAMETHROWER
	writetext EnyaExplainTMText
	waitbutton
	closetext
	special HealParty
	end

.AlreadyGotTM:
	writetext EnyaAfterText
	waitbutton
.BagFull:
	closetext
	end
	
TrainerCooltrainerFKari:
	trainer COOLTRAINERF, KARI, EVENT_BEAT_COOLTRAINERF_KARI, CooltrainerFKariText, CooltrainerFKariWinText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFKariAfterText
	waitbutton
	closetext
	end	

TrainerCooltrainerMTory:
	trainer COOLTRAINERM, TORY, EVENT_BEAT_COOLTRAINERM_TORY, CooltrainerMToryText, CooltrainerMToryWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMToryAfterText
	waitbutton
	closetext
	end	
	
EnyaIntroText:
	text "Greetings, weary"
	line "traveller."
	
	para "My name is ENYA,"
	line "leader of the"
	cont "ORCHID CITY GYM."
	
	para "I command that"
	line "which cannot be"
	cont "controlled by a"
	cont "normal trainer."
	
	para "FIRE bends to my"
	line "will, and DRAGONs"
	cont "bow to me."
	
	para "Have you come in"
	line "search of battle?"
	
	para "Ha! You make me"
	line "laugh!"
	
	para "Has the heat got-"
	line "ten to your head?"
	
	para "Your #MON will"
	line "kneel to the might"
	cont "of my magic!"
	done
	
EnyaLossText:
	text "I yield!"
	
	para "Your #MON have"
	line "shown their might."
	
	para "I must reward you"
	line "for how well you"
	cont "have trained them."
	
	para "I present to you"
	line "my ???-BADGE."
	done
	
GetBadgeText:
	text "<PLAYER> received"
	line "???-BADGE."
	done
	
EnyaExplainBadgeText:
	text "I know now I can"
	line "trust you with my"
	cont "TM, after your"
	cont "display of skill."
	done
	
EnyaExplainTMText:
	text "That TM will teach"
	line "FLAMETHROWER."
	
	para "A breath move of"
	line "extreme power. Its"
	cont "heat may even"
	cont "anything it touch-"
	cont "ex with a BURN."
	done
	
EnyaAfterText:
	text "With my badge, you"
	line "now have enough to"
	cont "travel to the"
	cont "#MON LEAGUE."
	
	para "Visit the port on"
	line "RUGOSA COAST, and"
	cont "best of luck to"
	cont "you."
	
	para "This battle will"
	line "not be our last."
	done
	
CooltrainerFKariText:
	text "Are you trying to"
	line "escape the heat?"
	
	para "I can't promise my"
	line "#MON will let"
	cont "you!"
	done

CooltrainerFKariWinText:
	text "You busted right"
	line "through my"
	cont "#MON!"
	done

CooltrainerFKariAfterText:
	text "You look good to"
	line "head back down-"
	cont "stairs"
	
	para "Hehe, or do you"
	line "just want to spend"
	cont "more time with me?"
	done

CooltrainerMToryText:
	text "You couldn't make"
	line "it to ENYA in one"
	cont "shot?"
	
	para "Good. I was hoping"
	line "for a battle!"
	done

CooltrainerMToryWinText:
	text "It's lights out"
	line "for my #MON!"
	done

CooltrainerMToryAfterText:
	text "You should be all"
	line "set to head down"
	cont "to the basement"
	cont "again."
	
	para "I can't spend all"
	line "day down there"
	cont "either."
	done

OrchidGymLeaderRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  3, ORCHID_GYM_B1F, 3
	warp_event 10,  3, ORCHID_GYM_B1F, 2
	warp_event  6, 15, ORCHID_GYM_B1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerFKari, -1
	object_event 10,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerMTory, -1
	object_event  7, 10, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornEnyaScript, -1