	const_def 2 ; object constants
	const BURGLARHIDEOUTB1F_SCIENTIST
	const BURGLARHIDEOUTB1F_LEADER
	const BURGLARHIDEOUTB1F_SAGE1
	const BURGLARHIDEOUTB1F_SAGE2
	const BURGLARHIDEOUTB1F_SAGE3
	const BURGLARHIDEOUTB1F_BIKER1
	const BURGLARHIDEOUTB1F_BIKER2
	const BURGLARHIDEOUTB1F_BIKER3
	const BURGLARHIDEOUTB1F_RIVAL	
	const BURGLARHIDEOUTB1F_ITEMBALL1
	
BurglarHideoutB1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_BURGLARHIDEOUTB1F_RIVAL
	scene_script .DummyScene ; SCENE_BURGLARHIDEOUTB1F_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .PasswordShutterCallback
	
.DummyScene:
	end	

.PasswordShutterCallback:
	checkevent EVENT_HIDEOUT_SAID_PASSWORD
	iftrue .Change
	return

.Change:
	changeblock  18, 10, $0D ; open shutter
	changeblock  20, 10, $0D ; open shutter
	return

BurglarHideoutAbbotScene:
	special FadeOutMusic
	applymovement PLAYER, HideoutRivalStepDown
	applymovement BURGLARHIDEOUTB1F_SAGE3, SageBlockPlayer
;	turnobject PLAYER, UP
;	showemote EMOTE_QUESTION, PLAYER, 15
	showemote EMOTE_SHOCK, BURGLARHIDEOUTB1F_LEADER, 15
	opentext
	writetext SageAbbotGreeting
	waitbutton
	closetext
	applymovement BURGLARHIDEOUTB1F_LEADER, PlayerApproachAbbot
;	turnobject BURGLARHIDEOUTB1F_LEADER, LEFT
	opentext
	writetext SageAbbotText
	waitbutton
	playmusic MUSIC_ROCKET_ENCOUNTER
	writetext SageAbbotChallenge
	waitbutton
	closetext
	setlasttalked BURGLARHIDEOUTB1F_LEADER
	winlosstext SageAbbotWinText, 0
	loadtrainer EXECUTIVEM, ABBOT2
	startbattle
	reloadmapafterbattle
	pause 12
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear BURGLARHIDEOUTB1F_LEADER
	disappear BURGLARHIDEOUTB1F_SAGE2
	disappear BURGLARHIDEOUTB1F_SAGE3
	clearevent EVENT_HIDEOUT_POKE_FLUTE
	setevent EVENT_CLEARED_BURGLAR_HIDEOUT
	setscene SCENE_BURGLARHIDEOUTB1F_FINISHED
	special FadeInQuickly
	end
	
BurglarHideoutB1FDoor:
	opentext
	checkevent EVENT_HIDEOUT_SAID_PASSWORD
	iftrue .used
	writetext PasswordGateText
	waitbutton
	checkevent EVENT_HIDEOUT_KNOW_PASSWORD
	iffalse .nope
	writetext PlayerUsedPassword
	waitbutton
	closetext
	setevent EVENT_HIDEOUT_SAID_PASSWORD
	changeblock  18, 10, $0D ; open shutter
	changeblock  20, 10, $0D ; open shutter
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
	opentext

.used
	farwritetext PasswordGateOpenText
	waitbutton
.nope
	closetext
	end
	
BurglarHideoutB1FComputer:
	opentext
	checkevent EVENT_HIDEOUT_KNOW_PASSWORD
	iftrue .GotPassword
	writetext SecretPasswordText
	waitbutton
	setevent EVENT_HIDEOUT_KNOW_PASSWORD
.GotPassword:
	writetext BurglarHideoutB1FGotPassword
	waitbutton
	closetext
	end

BurglarHideoutB1FScientist:
	opentext
	writetext BurglarHideoutB1FScientistText
	wait 2
	closetext
	faceplayer
	showemote EMOTE_SHOCK, BURGLARHIDEOUTB1F_SCIENTIST, 15
	opentext
	writetext BurglarHideoutB1FScientistNoticeText
	waitbutton
	closetext
	turnobject BURGLARHIDEOUTB1F_SCIENTIST, UP
	scall PlaySecurityAlarm
	faceplayer
	opentext
	writetext BurglarHideoutB1FScientistWarning
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	applymovement BURGLARHIDEOUTB1F_SCIENTIST, ScientistCallsGuardsRight
	applymovement PLAYER, PlayerBikerAmbushRight
	jump .Continue
.FacingUp
	applymovement BURGLARHIDEOUTB1F_SCIENTIST, ScientistCallsGuardsUp
	applymovement PLAYER, PlayerBikerAmbushUp
.Continue
	disappear BURGLARHIDEOUTB1F_SCIENTIST
	moveobject BURGLARHIDEOUTB1F_BIKER1, 24, 24
	appear BURGLARHIDEOUTB1F_BIKER1
	applymovement BURGLARHIDEOUTB1F_BIKER1, Biker1ApproachPlayer
	turnobject PLAYER, LEFT
	moveobject BURGLARHIDEOUTB1F_BIKER2, 24, 24
	appear BURGLARHIDEOUTB1F_BIKER2
	applymovement BURGLARHIDEOUTB1F_BIKER2, Biker2ApproachPlayer
	turnobject PLAYER, RIGHT
	moveobject BURGLARHIDEOUTB1F_BIKER3, 24, 24
	appear BURGLARHIDEOUTB1F_BIKER3
	applymovement BURGLARHIDEOUTB1F_BIKER3, Biker3ApproachPlayer
	turnobject PLAYER, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext BikerGuard1ChallengeText
	waitbutton
	closetext
	winlosstext BikerGuard1WinText, 0
	loadtrainer BIKER, BRANDON
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	ifnotequal $0, .Lost
	turnobject PLAYER, LEFT
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext BikerGuard2ChallengeText
	waitbutton
	closetext
	winlosstext BikerGuard2WinText, 0
	loadtrainer BIKER, RYAN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	ifnotequal $0, .Lost
	turnobject PLAYER, RIGHT
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext BikerGuard3ChallengeText
	waitbutton
	closetext
	winlosstext BikerGuard3WinText, 0
	loadtrainer BIKER, BAM
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	ifnotequal $0, .Lost
	turnobject PLAYER, LEFT
	opentext
	writetext BikerGuard1AfterText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	opentext
	writetext BikerGuard2AfterText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	opentext
	writetext BikerGuard3AfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 36
	disappear BURGLARHIDEOUTB1F_BIKER1
	disappear BURGLARHIDEOUTB1F_BIKER2
	disappear BURGLARHIDEOUTB1F_BIKER3
	setevent EVENT_HIDEOUT_BEAT_BIKERS
	special FadeInQuickly
	playmusic MUSIC_ROCKET_HIDEOUT
.Lost
	end

BurglarHideoutRivalScript:
	playsound SFX_ENTER_DOOR
	moveobject BURGLARHIDEOUTB1F_RIVAL, 3, 12
	appear BURGLARHIDEOUTB1F_RIVAL
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalStepDown
	wait 8
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext HideoutRivalStopPlayerText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, PLAYER, 15
	turnobject PLAYER, UP
	checkcode VAR_XCOORD
	ifgreater 3, .Right
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalApproachLeft
	turnobject PLAYER, RIGHT
	jump BurglarHideoutRivalScriptContinue
	
.Right
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalApproachRight
	turnobject PLAYER, LEFT

BurglarHideoutRivalScriptContinue:
	opentext
	writetext HideoutRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Totodile
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .Chikorita
	winlosstext HideoutRivalWinText, HideoutRivalLossText
	setlasttalked BURGLARHIDEOUTB1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext HideoutRivalWinText, HideoutRivalLossText
	setlasttalked BURGLARHIDEOUTB1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext HideoutRivalWinText, HideoutRivalLossText
	setlasttalked BURGLARHIDEOUTB1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext HideoutRivalAfterText
	waitbutton
	closetext	
	checkcode VAR_XCOORD
	ifequal 3, .Left
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalStartLeaveLeft
	wait 8
	opentext
	writetext HideoutRivalAngryText
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalKickWallLeft
	playsound SFX_COMET_PUNCH
	earthquake 8
	waitsfx
	closetext
	turnobject PLAYER, UP
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalRunOutLeft
	jump .Continue
	
.Left
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalStartLeaveRight
	wait 8
	opentext
	writetext HideoutRivalAngryText
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalKickWallRight
	playsound SFX_COMET_PUNCH
	earthquake 8
	waitsfx
	closetext
	turnobject PLAYER, UP
	applymovement BURGLARHIDEOUTB1F_RIVAL, HideoutRivalRunOutRight
	
.Continue
	playsound SFX_EXIT_BUILDING
	disappear BURGLARHIDEOUTB1F_RIVAL
	waitsfx
	setscene SCENE_BURGLARHIDEOUTB1F_RIVAL
	setmapscene ORCHID_GYM_1F, SCENE_ORCHIDGYM1F_RIVAL
	playmapmusic
	end

TrainerSageLo2:
	trainer SAGE, LO2, EVENT_BEAT_SAGE_LO2, SageLo2Text, SageLo2WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageLo2AfterText
	waitbutton
	closetext
	end		

BurglarHideoutB1FSage:
	jumptextfaceplayer BurglarHideoutB1FSageText

BurglarHideoutPokeFlute:
	itemball POKE_FLUTE
	
ScientistCallsGuardsUp:
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_resume

ScientistCallsGuardsRight:
	run_step DOWN
	run_step DOWN
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_resume
	
PlayerBikerAmbushUp:
	step LEFT
	step LEFT
	turn_head DOWN
	step_resume
	
PlayerBikerAmbushRight:
	step LEFT
	step DOWN
	step_resume
	
Biker1ApproachPlayer:
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step LEFT
	run_step UP
	turn_head RIGHT
	step_end

Biker2ApproachPlayer:
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step RIGHT
	run_step UP
	turn_head LEFT
	step_end

Biker3ApproachPlayer:
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	step_resume
	
SageBlockPlayer:
	step LEFT
	step DOWN
	step_end
	
PlayerApproachAbbot:
;	step DOWN
;	step DOWN
;	step DOWN
;	step DOWN
;	turn_head RIGHT
	step LEFT
	step UP
	step UP
	step UP
	step_resume

HideoutRivalStepDown:
	step DOWN
	step_resume

HideoutRivalApproachLeft:
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	turn_head LEFT
	step_resume
	
HideoutRivalApproachRight:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_resume
	
HideoutRivalStartLeaveLeft:
	step UP
	turn_head LEFT
	step_resume
	
HideoutRivalKickWallLeft:
	turn_step LEFT
	step_resume

HideoutRivalStartLeaveRight:
	step UP
	turn_head RIGHT
	step_resume
	
HideoutRivalKickWallRight:
	turn_step RIGHT
	step_resume
	
HideoutRivalRunOutRight:
	run_step LEFT
	run_step UP
	run_step UP
	run_step UP
	hide_person
	step_end

HideoutRivalRunOutLeft:
	run_step UP
	run_step UP
	run_step UP
	hide_person
	step_end

PlaySecurityAlarm:
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	end
	
SomeBurglarText:
	text "You didn't think"
	line "HEPATICA was our"
	cont "only gig, did you?"
	
	para "Fufufu! Nope!"
	
	para "We've been doing"
	line "this for years!"
	done
	
SomeOtherBurglarText:
	text "Did the stairs"
	line "deceive you?"
	
	para "C'mon kid, think!"
	
	para "We would never"
	line "store our CARD KEY"
	cont "in plain sight!"
	done
	
PasswordGateText:
	text "There doesn't seem"
	line "to be a spot for a"
	cont "key."
	
	para "How else does this"
	line "open?"
	done
	
PlayerUsedPassword:
	text "Maybe…"

	para "<PLAYER> said the"
	line "password aloud."
	done
	
PasswordGateOpenText:
	text "Success! The door"
	line "has opened."
	done
	
BurglarHideoutB1FScientistText:
	text "What do you want?"
	
	para "I'm very busy-"
	done
	
BurglarHideoutB1FScientistNoticeText:
	text "Wait a second…"
	
	para "You're the kid who"
	line "beat the boss up"
	cont "at HEPTAICA TOWN!"
	
	para "You made a big"
	line "mistake coming"
	cont "here alone, kid!"
	done
	
BurglarHideoutB1FScientistWarning:
	text "The guards will"
	line "take care of you!"
	done
	
BikerGuard1ChallengeText:
	text "I get paid too"
	line "well to just let"
	cont "some kid wander"
	cont "around in here."
	done
	
BikerGuard1WinText:
	text "Don't get cocky,"
	line "child."
	
	para "I'm not the only"
	line "one you will need"
	cont "to fight."
	done
	
BikerGuard2ChallengeText:
	text "Trying to play"
	line "hero?"
	
	para "The # FLUTE"
	line "belongs to us now!"
	done
	
BikerGuard2WinText:
	text "How are your"
	line "#MON feeling"
	cont "now, kid?"
	done
	
BikerGuard3ChallengeText:
	text "Don't cry when"
	line "your #MON can't"
	cont "handle all of"
	cont "these battles."
	done
	
BikerGuard3WinText:
	text "The boss wasn't"
	line "kidding when he"
	cont "said to not take"
	cont "you lightly."
	done
	
BikerGuard1AfterText:
	text "Well, you won."
	done
	
BikerGuard2AfterText:
	text "Unfortunately,"
	line "you'll never get"
	cont "any further with-"
	cont "out the password."
	done
	
BikerGuard3AfterText:
	text "Ahahaha!"
	done
	
SecretPasswordText:
	text "The secret phrase"
	line "is “please open”."
	done
	
BurglarHideoutB1FGotPassword:
	text "The password must"
	line "be useful for"
	cont "something around"
	cont "here."
	done
	
SageLo2Text:
	text "Did our dead end"
	line "deceive you?"
	
	para "It doesn't matter."
	
	para "I will be the dead"
	line "end now!"
	done
	
SageLo2WinText:
	text "No!"
	
	para "I refuse to lose"
	line "to a child after"
	cont "my training!"
	done
	
SageLo2AfterText:
	text "Master ABBOT is"
	line "going to be"
	cont "furious!"
	done
	
HideoutRivalStopPlayerText:
	text "Hey! Stop!"
	done
	
HideoutRivalText:
	text "I see you've heard"
	line "about the stolen"
	cont "# FLUTE."
	
	para "You probably don't"
	line "even care about"
	cont "capturing that"
	cont "SNORLAX."
	
	para "What a waste."
	
	para "However, you won't"
	line "be able to get the"
	cont "# FLUTE when I"
	cont "send you back to a"
	cont "#MON CENTER!"
	done

HideoutRivalLossText:
	text "Pathetic."

	para "I knew you"
	line "couldn't best me"
	cont "forever."
	done

HideoutRivalWinText:
	text "I can't stand"
	line "this!"

	para "You got a lucky"
	line "handout at the"
	cont "start of your"
	cont "journey!"

	para "I had to catch my"
	line "own #MON!"
	done

HideoutRivalAfterText:
	text "Fine! Go win back"
	line "the # FLUTE!"
	
	para "Be the hero,"
	line "I don't care!"
	
	para "Clearly you are"
	line "the only trainer I"
	cont "simply can't beat!"
	done

HideoutRivalAngryText:
	text "ARGH!"
	done

BurglarHideoutB1FSageText:
	text "He…"
	
	para "Awaits…"
	done
	
SageAbbotGreeting:
	text "YOU!"
	done
	
SageAbbotText:
	text "Are my disciples"
	line "so useless that"
	cont "they can't even"
	cont "handle a mere"
	cont "child?"
	
	para "You will not stop"
	line "my plan to capture"
	cont "SNORLAX!"
	done
	
SageAbbotChallenge:
	text "HEPATICA TOWN was"
	line "a fluke."
	
	para "I will not stand"
	line "for you ruining my"
	cont "operation again!"
	done
	
SageAbbotWinText:
	text "IMPOSSIBLE!"
	
	para "YOU BRING MY BLOOD"
	line "TO A BOIL, CHILD!"
	
	para "ARGH!"
	done

BurglarHideoutB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 12, BURGLAR_HIDEOUT_1F, 3
	warp_event  3, 12, BURGLAR_HIDEOUT_1F, 4
	warp_event 23,  6, BURGLAR_HIDEOUT_B2F, 1
	warp_event 15,  2, BURGLAR_HIDEOUT_B2F, 2

	db 3 ; coord events
	coord_event  3, 16, SCENE_DEFAULT, BurglarHideoutRivalScript
	coord_event  4, 16, SCENE_DEFAULT, BurglarHideoutRivalScript
	coord_event  5, 23, SCENE_BURGLARHIDEOUTB1F_RIVAL, BurglarHideoutAbbotScene

	db 2 ; bg events
	bg_event 16, 11, BGEVENT_UP, BurglarHideoutB1FDoor
	bg_event 26, 17, BGEVENT_UP, BurglarHideoutB1FComputer

	db 10 ; object events
	object_event 26, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurglarHideoutB1FScientist, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  6, 28, SPRITE_ABBOT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event 11,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageLo2, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event  4, 22, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BurglarHideoutB1FSage, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event  6, 22, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BurglarHideoutB1FSage, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event  0, 0, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  0, 0, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  0, 0, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  0, 0, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurglarHideoutPokeFlute, EVENT_HIDEOUT_POKE_FLUTE
