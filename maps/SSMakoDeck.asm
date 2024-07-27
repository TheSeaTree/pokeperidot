	const_def 2 ; object constants
	const SSMAKODECK_FANGIRL
	const SSMAKODECK_BURGLAR
	const SSMAKODECK_CHAMPION
	const SSMAKODECK_OFFICER

SSMakoDeck_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKODECK_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKODECK_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKODECK_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT

.DummyScene1:
.DummyScene2:
	end

FangirlDeckTeleport1:
	moveobject SSMAKODECK_FANGIRL, 13, 4
	jump FangirlDeckTeleportContinue
FangirlDeckTeleport2:
	moveobject SSMAKODECK_FANGIRL, 13, 5
FangirlDeckTeleportContinue:
	appear SSMAKODECK_FANGIRL
	follow PLAYER, SSMAKODECK_FANGIRL
	setscene SCENE_SSMAKODECK_FOLLOWING
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT
	end

SSMakoDeckFangirl:
	checkevent EVENT_SS_MAKO_UNLOCK_2F_DOORS
	iftrue .Deck
	jumptextfaceplayer SSMakoDeckEmilyCrowdText
	
.Deck
	jumpstd emilycompanion

SSMakoDeckBurglar:
	opentext
	writetext SSMakoDeckBurglarText
	waitbutton
	closetext
	faceplayer
	checkevent EVENT_CLEARED_BURGLAR_HIDEOUT
	iftrue .ClearedHideout
	showemote EMOTE_QUESTION, SSMAKODECK_BURGLAR, 15
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext SSMakoDeckNoticeMalePlayerText
	jump .Continue
.Girl
	writetext SSMakoDeckNoticeFemalePlayerText
.Continue
	waitbutton
	writetext SSMakoDeckDoesntRecognizePlayerText
	waitbutton
	playmusic MUSIC_ROCKET_ENCOUNTER
	writetext SSMakoDeckChallengeText
	jump .Battle
.ClearedHideout
	showemote EMOTE_SHOCK, SSMAKODECK_BURGLAR, 15
	opentext
	writetext SSMakoDeckRecognizePlayerText
	waitbutton
	playmusic MUSIC_ROCKET_ENCOUNTER
	writetext SSMakoDeckRecognizePlayerChallengeText
.Battle
	waitbutton
	closetext
;	writecode VAR_MOVEMENT, PLAYER_SURF
;	special ReplaceKrisSprite
	winlosstext SSMakoDeckBurglarWinText, 0
	loadtrainer BURGLAR, RANDY
	startbattle
	reloadmapafterbattle
	opentext
	writetext SSMakoDeckBurglarAfterText
	waitbutton
	playsound SFX_GOT_SAFARI_BALLS
	writetext SSMakoDeckPlayerReceivedBagText
	waitbutton
	writetext SSMakoDeckMysteriousVoiceText
	waitbutton
	closetext

	moveobject SSMAKODECK_OFFICER, 10, 4
	appear SSMAKODECK_OFFICER
	applymovement SSMAKODECK_OFFICER, SSMakoDeckOfficerApproach
	opentext
	writetext SSMakoDeckOfficerText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal LEFT, .FacingLeft
	applymovement SSMAKODECK_OFFICER, SSMakoDeckOfficerApproach
	scall SSMakoDeckBurglarArrestScript
	faceobject SSMAKODECK_OFFICER, PLAYER
	opentext
	writetext SSMakoDeckOfficerStayOutOfTrouble
	waitbutton
	closetext
	applymovement SSMAKODECK_OFFICER, SSMakoLeaveMovement
	jump .Done

.FacingLeft
	applymovement SSMAKODECK_OFFICER, SSMakoDeckOfficerApproachLeft
	scall SSMakoDeckBurglarArrestScript
	applymovement SSMAKODECK_OFFICER, SSMakoDeckOfficerLeaveLeft
	faceobject SSMAKODECK_OFFICER, PLAYER
	opentext
	writetext SSMakoDeckOfficerStayOutOfTrouble
	waitbutton
	closetext
	applymovement SSMAKODECK_OFFICER, SSMakoDeckOfficerContinueLeaveLeft

.Done
	disappear SSMAKODECK_OFFICER
	disappear SSMAKODECK_BURGLAR

	checkcode VAR_YCOORD
	ifequal 4, .Continue_Leaving
	applymovement SSMAKODECK_FANGIRL, SSMakoFangirlApproachPlayer
.Continue_Leaving
	turnobject SSMAKODECK_FANGIRL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext SSMakoDeckEmilyAfterText
	waitbutton
	closetext
	applymovement SSMAKODECK_FANGIRL, SSMakoLeaveMovement
	disappear SSMAKODECK_FANGIRL

	disappear SSMAKODECK_CHAMPION
	setevent EVENT_SS_MAKO_DEFEATED_BURGLAR
	clearevent EVENT_HIDE_SS_MAKO_FANGIRL

	setscene SCENE_SSMAKODECK_FINISHED
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_FINISHED
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_FINISHED
	setmapscene SS_MAKO_LOWER_DECK, SCENE_SSMAKOLOWERDECK_FINISHED
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_FINISHED
	setmapscene SS_MAKO_ENGINE_ROOM, SCENE_SSMAKOENGINEROOM_FINISHED
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_FINISHED
	setmapscene SS_MAKO_2F_ROOMS, SCENE_SSMAKO2FROOMS_FINISHED
	end

SSMakoDeckBurglarArrestScript:
	showemote EMOTE_SHOCK, SSMAKODECK_FANGIRL, 15
	faceobject SSMAKODECK_FANGIRL, SSMAKODECK_OFFICER
	opentext
	writetext SSMakoDeckFangirlExplainText
	waitbutton
	closetext

	checkcode VAR_YCOORD
	ifequal 4, .Above

	opentext
	writetext SSMakoDeckQuestionPlayerText
	waitbutton
	closetext

	showemote EMOTE_SHOCK, PLAYER, 15

	faceobject PLAYER, SSMAKODECK_FANGIRL
	faceobject SSMAKODECK_FANGIRL, PLAYER
	opentext
	writetext SSMakoDeckPlayerReturnTrainerCardText
	waitbutton
	closetext
	
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .Up1
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Up2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Down

	applymovement SSMAKODECK_FANGIRL, SSMakoFangirlApproachOfficer3
	turnobject SSMAKODECK_OFFICER, DOWN
	jump .Scold
	
.Up1
	applymovement SSMAKODECK_FANGIRL, SSMakoFangirlApproachOfficer1
	turnobject SSMAKODECK_FANGIRL, DOWN
	turnobject SSMAKODECK_OFFICER, UP
	jump .Scold
.Up2
	applymovement SSMAKODECK_FANGIRL, SSMakoFangirlApproachOfficer2
	turnobject SSMAKODECK_OFFICER, UP
	jump .Scold
.Down
	applymovement SSMAKODECK_FANGIRL, SSMakoFangirlApproachOfficer1
	turnobject SSMAKODECK_FANGIRL, UP
	turnobject SSMAKODECK_OFFICER, DOWN

.Scold
	opentext
	writetext SSMakoDeckOfficerScoldsPlayerText
	waitbutton
	closetext
	faceobject SSMAKODECK_BURGLAR, SSMAKODECK_OFFICER
	faceobject SSMAKODECK_OFFICER, SSMAKODECK_BURGLAR
	
	applymovement SSMAKODECK_OFFICER, SSMakoDeckOfficerArrest
	jump .Continue
	
.Above
	faceobject SSMAKODECK_OFFICER, PLAYER
	opentext
	writetext SSMakoDeckQuestionPlayerText
	waitbutton
	closetext

	showemote EMOTE_SHOCK, PLAYER, 15

	faceobject PLAYER, SSMAKODECK_OFFICER

	opentext
	writetext SSMakoDeckPlayerShowBagText
	waitbutton
	writetext SSMakoDeckOfficerScoldsPlayerText
	waitbutton
	closetext

	applymovement SSMAKODECK_OFFICER, SSMakoDeckOfficerArrestAbove

	faceobject SSMAKODECK_BURGLAR, SSMAKODECK_OFFICER

.Continue
	opentext
	writetext SSMakoDeckBurglarArrestText
	waitbutton
	closetext
	follow SSMAKODECK_OFFICER, SSMAKODECK_BURGLAR
	end

SSMakoDeckSetTempEvent1:
	scall SSMakoDeckClearTempEvents
	checkcode VAR_FACING
	ifequal DOWN, .DownFacing
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.DownFacing
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end
	
SSMakoDeckSetTempEvent2:
	scall SSMakoDeckClearTempEvents
	checkcode VAR_FACING
	ifequal UP, .UpFacing
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	end

.UpFacing
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	end
	
SSMakoDeckClearTempEvents:
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	end

SSMakoDeckReceptionist:
	setevent EVENT_SS_MAKO_UNLOCK_2F_DOORS
	jumptext SSMakoDeckReceptionistText

SSMakoDeckFisher:
	jumptext SSMakoDeckFisherText

SSMakoDeckHiddenSodaPop1:
	hiddenitem SODA_POP, EVENT_SS_MAKO_HIDDEN_SODA_POP_1

SSMakoDeckHiddenSodaPop2:
	hiddenitem SODA_POP, EVENT_SS_MAKO_HIDDEN_SODA_POP_2

SSMakoDeckHiddenSodaPop3:
	hiddenitem SODA_POP, EVENT_SS_MAKO_HIDDEN_SODA_POP_3

SSMakoDeckHiddenSodaPop4:
	hiddenitem SODA_POP, EVENT_SS_MAKO_HIDDEN_SODA_POP_4

SSMakoDeckOfficerApproach:
	step LEFT
	step LEFT
	step_resume

SSMakoFangirlApproachOfficer1:
	step RIGHT
	step_resume

SSMakoFangirlApproachOfficer2:
	step RIGHT
	step RIGHT
	step DOWN
	step_resume

SSMakoFangirlApproachOfficer3:
	step RIGHT
	step RIGHT
	step UP
	step_resume

SSMakoDeckOfficerApproachLeft:
	step UP
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_resume

SSMakoDeckOfficerArrest:
	step LEFT
	step_resume

SSMakoDeckOfficerArrestAbove:
	step LEFT
	turn_head DOWN
	step_resume

SSMakoLeaveMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume
	
SSMakoDeckOfficerLeaveLeft:
	step RIGHT
	step_resume
	
SSMakoDeckOfficerContinueLeaveLeft:
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume
	
SSMakoFangirlApproachPlayer:
	step LEFT
	step_resume

SSMakoDeckEmilyCrowdText:
	text "There's no way we"
	line "could sneak into"
	cont "the party."
	
	para "We might as well"
	line "head back inside"
	cont "and wait for it to"
	cont "be over."
	done

SSMakoDeckBurglarText:
	text "If you're looking"
	line "for the party,"
	cont "they all headed"
	cont "back insi-"
	done

SSMakoDeckNoticeMalePlayerText:
	text "Heh. So you got"
	line "your boyfriend to"
	cont "try and take back"
	cont "your #MON?"
	done

SSMakoDeckNoticeFemalePlayerText:
	text "Heh. So you got"
	line "your girlfriend to"
	cont "try and take back"
	cont "your #MON?"

SSMakoDeckDoesntRecognizePlayerText:
	text "Look, kid. I don't"
	line "know who you are,"
	cont "but don't make me"
	cont "embarrass you in"
	cont "front of your"
	cont "little girlfriend."
	done

SSMakoDeckChallengeText:
	text "You're not gonna"
	line "back down?"

	para "Fine by me!"

	para "Just make sure you"
	line "don't start crying"
	cont "when you lose!"
	done

SSMakoDeckRecognizePlayerText:
	text "Well if it isn't"
	line "<PLAYER>. What are"
	cont "the odds I snatch"
	cont "your little girl-"
	cont "friend's purse?"

	para "What are you plan-"
	line "ning to do? Play"
	cont "hero and take it"
	cont "back from me?"
	done

SSMakoDeckRecognizePlayerChallengeText:
	text "Hah! I'm not afraid"
	line "of you!"

	para "ABBOT's other men"
	line "were nothing like"
	cont "me, I promise."

	para "Now let's see"
	line "these new #MON"
	cont "of mine can do!"
	done

SSMakoDeckBurglarWinText:
	text "You mean these"
	line "#MON could take"
	cont "down every GYM"
	cont "LEADER?"
	
	para "They must be get-"
	line "ting soft."
	done

SSMakoDeckBurglarAfterText:
	text "You can just take"
	line "these #MON!"

	para "They wouldn't have"
	line "stood a chance"
	cont "against the ELITE"
	cont "FOUR anyway!"
	done
	
SSMakoDeckPlayerReceivedBagText:
	text "<PLAYER> received"
	line "EMILY's PACK."
	done

SSMakoDeckMysteriousVoiceText:
	text "???: Not so fast!"
	done
	
SSMakoDeckOfficerText:
	text "Battles are"
	line "strictly forbidden"
	cont "on the DECK!"
	
	para "Come on, break it"
	line "up!"
	done
	
SSMakoDeckFangirlExplainText:
	text "EMILY: Wait a sec-"
	line "ond!"
	
	para "That thief stole"
	line "my PACK!"
	
	para "We were just try-"
	line "ing to get it back"
	cont "from him!"
	done

SSMakoDeckQuestionPlayerText:
	text "OFFICER: How can I"
	line "be sure you are"
	cont "telling the truth?"
	done

SSMakoDeckPlayerShowBagText:
	text "<PLAYER> took"
	line "EMILY's TRAINER"
	cont "CARD out of her"
	cont "PACK to show the"
	cont "OFFICER."
	done
	
SSMakoDeckPlayerReturnTrainerCardText:
	text "<PLAYER> handed"
	line "EMILY her TRAINER"
	cont "CARD to show the"
	cont "OFFICER."
	done

SSMakoDeckOfficerScoldsPlayerText:
	text "Hm…"
	
	para "Alright, this"
	line "checks out."
	
	para "I really can't"
	line "allow any battles"
	cont "to occur on the"
	cont "DECK, but I will"
	cont "look away just"
	cont "this once…"
	
	para "Don't let it happen"
	line "again!"
	done

SSMakoDeckBurglarArrestText:
	text "As for you."
	
	para "You're coming with"
	line "me. I can't have"
	cont "you causing any"
	cont "more trouble on"
	cont "the ship."
	done
	
SSMakoDeckOfficerStayOutOfTrouble:
	text "Kids, do me a"
	line "favor…"
	
	para "Stay out of"
	line "trouble!"
	done

SSMakoDeckEmilyAfterText:
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

SSMakoDeckReceptionistText:
	text "I'm awfully sorry,"
	line "but the DECK has"
	cont "been reserved for"
	cont "a private party"
	cont "hosted by the"
	cont "CHAMPION."

	para "Please head back"
	line "inside, it will"
	cont "be wrapping up"
	cont "shortly."
	done

SSMakoDeckFisherText:
	text "Urgh…"
	
	para "I never feel good"
	line "after these kinds"
	cont "of parties…"
	
	para "Urgh…"

	para "I always get so"
	line "seasick…"
	done

SSMakoDeck_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  4, SS_MAKO_2F, 9
	warp_event 13,  5, SS_MAKO_2F, 10

	db 7 ; coord events
	coord_event 13,  5, SCENE_SSMAKODECK_DEFAULT, FangirlDeckTeleport1
	coord_event 12,  5, SCENE_SSMAKODECK_DEFAULT, FangirlDeckTeleport2
	coord_event 12,  4, SCENE_SSMAKODECK_DEFAULT, FangirlDeckTeleport1
	coord_event 13,  4, SCENE_SSMAKODECK_DEFAULT, FangirlDeckTeleport2
	coord_event  4,  3, SCENE_SSMAKODECK_FOLLOWING, SSMakoDeckSetTempEvent1
	coord_event  4,  5, SCENE_SSMAKODECK_FOLLOWING, SSMakoDeckSetTempEvent2
	coord_event  5,  4, SCENE_SSMAKODECK_FOLLOWING, SSMakoDeckClearTempEvents

	db 4 ; bg events
	bg_event 11,  2, BGEVENT_ITEM, SSMakoDeckHiddenSodaPop1
	bg_event 10,  7, BGEVENT_ITEM, SSMakoDeckHiddenSodaPop2
	bg_event  6,  6, BGEVENT_ITEM, SSMakoDeckHiddenSodaPop3
	bg_event  8,  4, BGEVENT_ITEM, SSMakoDeckHiddenSodaPop4

	db 10 ; object events
	object_event  0, 13, SPRITE_FANGIRL, SPRITEMOVEDATA_COMPANION, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoDeckFangirl, -1
	object_event  4,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SSMakoDeckBurglar, EVENT_SS_MAKO_DEFEATED_BURGLAR
	object_event  0, 13, SPRITE_JOSEPH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DEFEATED_BURGLAR
	object_event  0, 13, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DEFEATED_BURGLAR
	object_event 11,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoDeckReceptionist, EVENT_SS_MAKO_DECK_CLEARED
	object_event 11,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoDeckReceptionist, EVENT_SS_MAKO_DECK_CLEARED
	object_event 11,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SSMakoDeckFisher, -1
	object_event  8,  3, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
	object_event  9,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
	object_event  9,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SS_MAKO_DECK_CLEARED
