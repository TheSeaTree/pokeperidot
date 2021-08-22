	const_def 2 ; object constants
	const SSMAKOSTERN_FANGIRL
	const SSMAKOSTERN_BURGLAR
	const SSMAKOSTERN_CHAMPION
	const SSMAKOSTERN_OFFICER

SSMakoStern_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOSTERN_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOSTERN_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOSTERN_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT

.DummyScene1:
.DummyScene2:
	end

FangirlSternTeleport1:
	moveobject SSMAKOSTERN_FANGIRL, 13, 4
	jump FangirlSternTeleportContinue
FangirlSternTeleport2:
	moveobject SSMAKOSTERN_FANGIRL, 13, 5
FangirlSternTeleportContinue:
	appear SSMAKOSTERN_FANGIRL
	follow PLAYER, SSMAKOSTERN_FANGIRL
	setscene SCENE_SSMAKOSTERN_FOLLOWING
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT
	end

SSMakoSternFangirl:
	jumpstd emilycompanion

SSMakoSternBurglar:
	opentext
	writetext SSMakoSternBurglarText
	waitbutton
	closetext
	faceplayer
	checkevent EVENT_CLEARED_BURGLAR_HIDEOUT
	iftrue .ClearedHideout
	showemote EMOTE_QUESTION, SSMAKOSTERN_BURGLAR, 15
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext SSMakoSternNoticeMalePlayerText
	jump .Continue
.Girl
	writetext SSMakoSternNoticeFemalePlayerText
.Continue
	waitbutton
	waitbutton SSMakoSternChallengeText
	closetext
	jump .Battle
.ClearedHideout
	showemote EMOTE_SHOCK, SSMAKOSTERN_BURGLAR, 15
	opentext
	writetext SSMakoSternRecognizePlayerText
.Battle
	waitbutton
	closetext
;	SSMakoSternBurglarText SSMakoSternBurglarWinText, 0
;	loadtrainer BURGLAR, RANDY
;	startbattle
	reloadmapafterbattle
	opentext
	writetext SSMakoSternBurglarAfterText
	waitbutton
	playsound SFX_GOT_SAFARI_BALLS
	writetext SSMakoSternPlayerReceivedBagText
	waitbutton
	writetext SSMakoSternMysteriousVoiceText
	waitbutton
	closetext

	moveobject SSMAKOSTERN_OFFICER, 10, 4
	appear SSMAKOSTERN_OFFICER
;	moveobject SSMAKOSTERN_CHAMPION, 10, 4
;	appear SSMAKOSTERN_CHAMPION
;	follow SSMAKOSTERN_CHAMPION, SSMAKOSTERN_OFFICER
	applymovement SSMAKOSTERN_OFFICER, SSMakoSternChampionApproach
;	applymovement SSMAKOSTERN_CHAMPION, SSMakoSternChampionApproach
;	stopfollow
	checkcode VAR_FACING
	ifequal LEFT, .FacingLeft
	applymovement SSMAKOSTERN_OFFICER, SSMakoSternOfficerApproach
	follow SSMAKOSTERN_OFFICER, SSMAKOSTERN_BURGLAR
	applymovement SSMAKOSTERN_OFFICER, SSMakoSternOfficerLeave
	disappear SSMAKOSTERN_OFFICER
	disappear SSMAKOSTERN_BURGLAR

	scall SSMakoSternFangirlScript
	jump .Done

.FacingLeft
	applymovement SSMAKOSTERN_OFFICER, SSMakoSternOfficerApproachLeft
	follow SSMAKOSTERN_OFFICER, SSMAKOSTERN_BURGLAR
	applymovement SSMAKOSTERN_OFFICER, SSMakoSternOfficerLeaveLeft
	disappear SSMAKOSTERN_OFFICER
	disappear SSMAKOSTERN_BURGLAR
	
	scall SSMakoSternFangirlScript
.Done

	disappear SSMAKOSTERN_CHAMPION
	setevent EVENT_SS_MAKO_DEFEATED_BURGLAR
	clearevent EVENT_HIDE_SS_MAKO_FANGIRL

	setscene SCENE_SSMAKOSTERN_FINISHED
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_FINISHED
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_FINISHED
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_FINISHED
	setmapscene SS_MAKO_ENGINE_ROOM, SCENE_SSMAKOENGINEROOM_FINISHED
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_FINISHED
	setmapscene SS_MAKO_2F_ROOMS, SCENE_SSMAKO2FROOMS_FINISHED
	end

SSMakoSternFangirlScript:
	setlasttalked SSMAKOSTERN_FANGIRL
	faceplayer
	faceobject PLAYER, SSMAKOSTERN_FANGIRL
	opentext
	writetext SSMakoSternEmilyAfterText
	waitbutton
	closetext
	applymovement SSMAKOSTERN_FANGIRL, SSMakoFangirlLeave
	disappear SSMAKOSTERN_FANGIRL
	end

SSMakoSternChampionApproach:
	step LEFT
	step LEFT
	step LEFT
	step_resume

SSMakoSternOfficerApproach:
	step LEFT
	step LEFT
	step_resume
	
SSMakoSternOfficerApproachLeft:
	step UP
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_resume

SSMakoSternOfficerLeave:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume
	
SSMakoSternOfficerLeaveLeft:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume

SSMakoFangirlLeave:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume

; Defeat every trainer inside before the crowd disperses.

SSMakoSternBurglarText:
	text "Yeah, waddya'"
	line "want? Can't you"
	cont "see I'm trying to"
	cont "enjoy the oc-"
	done

SSMakoSternNoticeMalePlayerText:
	text "Heh. So you got"
	line "your boyfriend to"
	cont "try and take back"
	cont "your PACK?"
	done

SSMakoSternNoticeFemalePlayerText:
	text "Heh. So you got"
	line "your girlfriend to"
	cont "try and take back"
	cont "your PACK?"
	
SSMakoSternChallengeText:
	text "Look, kid. I don't"
	line "know who you are,"
	cont "but don't make me"
	cont "embarrass you in"
	cont "front of your"
	cont "little girlfriend."
	
	para "You're not gonna"
	line "back down?"
	
	para "Fine by me!"
	
	para "Just make sure you"
	line "don't start crying"
	cont "on me!"
	done

SSMakoSternRecognizePlayerText:
	text "Well if it isn't"
	line "<PLAYER>. What are"
	cont "the odds I snatch"
	cont "your little girl-"
	cont "friend's purse?"

	para "What are you plan-"
	line "ning to do? Play"
	cont "hero and take them"
	cont "back from me?"

	para "Hah! I'm not afraid"
	line "of you!"

	para "ABBOT's other men"
	line "were nothing like"
	cont "me, I promise."

	para "Now let's take"
	line "these new #MON"
	cont "of mine can do!"
	done

SSMakoSternBurglarWinText:
	text "You mean these"
	line "#MON could take"
	cont "down every GYM"
	cont "LEADER?"
	
	para "They must be get-"
	line "ting soft."
	done

SSMakoSternBurglarAfterText:
	text "You can just take"
	line "these #MON!"
	
	para "They wouldn't have"
	line "stood a chance"
	cont "against the ELITE"
	cont "FOUR anyway!"
	done
	
SSMakoSternPlayerReceivedBagText:
	text "<PLAYER> received"
	line "EMILY's PACK."
	done

SSMakoSternMysteriousVoiceText:
	text "???: Not so fast!"
	done
	
SSMakoSternOfficerText:
	text "Battles are"
	line "strictly forbidden"
	cont "on the DECK!"
	done

SSMakoSternVictorText:
	text "What did you say"
	line "your name was?"
	
	para "…………"
	
	para "<PLAYER>, huh?"
	
	para "So you're planning"
	line "to take on the"
	cont "#MON LEAGUE?"
	
	para "Good luck. You'll"
	line "need it."
	
	para "Most people who"
	line "try can't even"
	cont "make it past the"
	cont "first member of"
	cont "the ELITE FOUR."
	
	para "People who have"
	line "been training for"
	cont "years, too!"
	
	para "Some people just"
	line "aren't cut out for"
	cont "being a CHAMPION…"
	
	para "I need to get"
	line "going for now, but"
	cont "why don't you stop"
	cont "by my cabin?"
	
	para "We can talk more"
	line "there."
	done

SSMakoSternEmilyAfterText:
	text "EMILY: Thank you"
	line "so much for your"
	cont "help, <PLAYER>!"

	para "I really don't"
	line "know what I would"
	cont "have done if not"
	cont "for you."

	para "I'm going to head"
	line "down to my cabin,"
	cont "my #MON deserve"
	cont "a long rest after"
	cont "today!"

	para "I'll see you when"
	line "we land at the"
	cont "#MON LEAGUE!"
	done

SSMakoStern_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  4, SS_MAKO_2F, 9
	warp_event 13,  5, SS_MAKO_2F, 10

	db 4 ; coord events
	coord_event 13,  5, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport1
	coord_event 12,  5, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport2
	coord_event 12,  4, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport1
	coord_event 13,  4, SCENE_SSMAKOSTERN_DEFAULT, FangirlSternTeleport2

	db 0 ; bg events

	db 10 ; object events
	object_event  0, 13, SPRITE_FANGIRL, SPRITEMOVEDATA_FOLLOWING, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoSternFangirl, -1
	object_event  4,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoSternBurglar, EVENT_SS_MAKO_DEFEATED_BURGLAR
	object_event  0, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DEFEATED_BURGLAR
	object_event  0, 13, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DEFEATED_BURGLAR
	object_event  9,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
	object_event  9,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
	object_event  9,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
	object_event 11,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
