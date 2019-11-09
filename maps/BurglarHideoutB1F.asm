	const_def 2 ; object constants
	const BURGLARHIDEOUTB1F_SCIENTIST
	const BURGLARHIDEOUTB1F_LEADER
	const BURGLARHIDEOUTB1F_SAGE1
	const BURGLARHIDEOUTB1F_BIKER1
	const BURGLARHIDEOUTB1F_BIKER2
	const BURGLARHIDEOUTB1F_BIKER3
	const BURGLARHIDEOUTB1F_ITEMBALL1
	
BurglarHideoutB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .HideNastyPlot ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .PasswordShutterCallback

.HideNastyPlot:
	disappear BURGLARHIDEOUTB1F_ITEMBALL1
	end
	
.DummyScene
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
	pause 15
	showemote EMOTE_QUESTION, BURGLARHIDEOUTB1F_LEADER, 15
	opentext
	writetext SageAbbotGreeting
	waitbutton
	closetext
	applymovement BURGLARHIDEOUTB1F_LEADER, AbbotApproachPlayer
	opentext
	writetext SageAbbotChallenge
	waitbutton
	closetext
	winlosstext SageAbbotWinText, 0
	loadtrainer EXECUTIVEM, ABBOT2
	startbattle
	reloadmapafterbattle
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 12
	disappear BURGLARHIDEOUTB1F_LEADER
	disappear BURGLARHIDEOUTB1F_SAGE1
	appear    BURGLARHIDEOUTB1F_ITEMBALL1
	setevent EVENT_CLEARED_BURGLAR_HIDEOUT
	setscene SCENE_FINISHED
	special FadeInQuickly
	end
	
BreakableWallScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .AlreadyBroken
	scall SmashWall
	iffalse .No
	changeblock 4, 0, $44
	reloadmappart
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
.No
	end

.AlreadyBroken:
	jumpstd smashwallbroken
	
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
	waitbutton
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
	reloadmapafterbattle
	turnobject PLAYER, LEFT
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext BikerGuard2ChallengeText
	waitbutton
	closetext
	winlosstext BikerGuard2WinText, 0
	loadtrainer BIKER, RYAN
	startbattle
	reloadmapafterbattle
	turnobject PLAYER, RIGHT
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext BikerGuard3ChallengeText
	waitbutton
	closetext
	winlosstext BikerGuard3WinText, 0
	loadtrainer BIKER, BAM
	startbattle
	reloadmapafterbattle
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
	pause 12
	disappear BURGLARHIDEOUTB1F_BIKER1
	disappear BURGLARHIDEOUTB1F_BIKER2
	disappear BURGLARHIDEOUTB1F_BIKER3
	setevent EVENT_HIDEOUT_BEAT_BIKERS
	special FadeInQuickly
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
	
SmashWall:
	jumpstd smashwall
	
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
	
AbbotApproachPlayer:
	step LEFT
	step UP
	step UP
	step UP
	step_resume
	
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
	line "HELIO was our only"
	cont "gig, did you?"
	
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
	line "I'm very busy-"
	done
	
BurglarHideoutB1FScientistNoticeText:
	text "Wait a second…"
	
	para "You're the kid"
	line "who beat the boss"
	cont "up at HELIO TOWN!"
	done
	
BurglarHideoutB1FScientistWarning:
	text "You made a big"
	line "mistake coming"
	cont "here alone, kid!"
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
	line "is 'please open'."
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
	
SageAbbotGreeting:
	text "YOU!"
	done
	
SageAbbotChallenge:
	text "Are my disciples"
	line "so useless that"
	cont "they can't even"
	cont "handle a mere"
	cont "child?"
	
	para "HELIO TOWN was a"
	line "fluke."
	
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

	db 1 ; coord events
	coord_event  5, 24, SCENE_DEFAULT, BurglarHideoutAbbotScene

	db 3 ; bg events
	bg_event  5,  2, BGEVENT_UP, BreakableWallScript
	bg_event 16, 11, BGEVENT_UP, BurglarHideoutB1FDoor
	bg_event 26, 17, BGEVENT_UP, BurglarHideoutB1FComputer

	db 7 ; object events
	object_event 26, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurglarHideoutB1FScientist, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  6, 28, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event 11,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageLo2, EVENT_CLEARED_BURGLAR_HIDEOUT
	object_event  0, 0, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  0, 0, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  0, 0, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_BEAT_BIKERS
	object_event  6, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurglarHideoutPokeFlute, EVENT_HIDEOUT_POKE_FLUTE
