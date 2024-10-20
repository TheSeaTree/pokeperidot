	const_def 2 ; object constants
	const SSMAKO1FROOMS_FANGIRL
	const SSMAKO1FROOMS_TEACHER
	const SSMAKO1FROOMS_GENTLEMAN
	const SSMAKO1FROOMS_TWIN1
	const SSMAKO1FROOMS_TWIN2
	const SSMAKO1FROOMS_SUPER_NERD
	const SSMAKO1FROOMS_FANGIRL2

SSMako1FRooms_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKO1FROOMS_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKO1FROOMS_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKO1FROOMS_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Respawn

.DummyScene0:
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end

.Respawn:
	checkevent EVENT_SS_MAKO_RESPAWN
	iffalse .End
	moveobject SSMAKO1FROOMS_FANGIRL, 1, 1
	jump RoomsFangirlContinueFollow
.End
	return

RoomsFangirlTeleport1:
; Set scene for each of these because it won't work otherwise.
	setscene SCENE_SSMAKO1FROOMS_FOLLOWING
	moveobject SSMAKO1FROOMS_FANGIRL, 1, 0
	jump RoomsFangirlContinueFollow

RoomsFangirlTeleport2:
	setscene SCENE_SSMAKO1FROOMS_FOLLOWING
	moveobject SSMAKO1FROOMS_FANGIRL, 10, 0
	jump RoomsFangirlContinueFollow
	
RoomsFangirlTeleport3:
	setscene SCENE_SSMAKO1FROOMS_FOLLOWING
	moveobject SSMAKO1FROOMS_FANGIRL, 20, 0
	jump RoomsFangirlContinueFollow
	
RoomsFangirlTeleport4:
	setscene SCENE_SSMAKO1FROOMS_FOLLOWING
	moveobject SSMAKO1FROOMS_FANGIRL, 0, 15
	jump RoomsFangirlContinueFollow
	
RoomsFangirlTeleport5:
	setscene SCENE_SSMAKO1FROOMS_FOLLOWING
	moveobject SSMAKO1FROOMS_FANGIRL, 10, 15
	jump RoomsFangirlContinueFollow
	
RoomsFangirlTeleport6:
	setscene SCENE_SSMAKO1FROOMS_FOLLOWING
	moveobject SSMAKO1FROOMS_FANGIRL, 20, 15

RoomsFangirlContinueFollow:
	appear SSMAKO1FROOMS_FANGIRL
	follow PLAYER, SSMAKO1FROOMS_FANGIRL
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_DEFAULT
	clearevent EVENT_SS_MAKO_RESPAWN
	end

SSMako1FRoomsFangirl:
	checkevent EVENT_SS_MAKO_DEFEATED_BURGLAR
	iftrue .After
	jumpstd emilycompanion
.After
	jumptextfaceplayer SSMako1FRoomsFangirlText

TrainerGentlemanWinfred:
	trainer GENTLEMAN, WINFRED, EVENT_BEAT_GENTLEMAN_WINFRED, GentlemanWinfredText, GentlemanWinfredWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, DoneTicket
	opentext
	writetext GentlemanWinfredTicketText
	waitbutton
	closetext
	end
.After
	opentext
	writetext GentlemanWinfredAfterText
	waitbutton
	closetext
	end

TrainerTeacherIlene:
	trainer TEACHER, ILENE, EVENT_BEAT_TEACHER_ILENE, TeacherIleneText, TeacherIleneWinText, 0, .Script

.Script:
	copybytetovar wSSMako1FFightCount
	ifequal  4, .After
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, .IleneDoneTicket
	opentext
	writetext TeacherIleneTicketText
	waitbutton
	closetext
	applymovement SSMAKO1FROOMS_TEACHER, SSMako1FRoomsTeacherMovement
	scall RoomsFangirlTeleport2
	end
.After
	opentext
	writetext TeacherIleneAfterText
	waitbutton
	closetext
	end
.IleneDoneTicket
	scall DoneTicket
	applymovement SSMAKO1FROOMS_TEACHER, SSMako1FRoomsTeacherMovement
	scall RoomsFangirlTeleport2
	end
	

TrainerSuperNerdHerbert:
	trainer SUPER_NERD, HERBERT, EVENT_BEAT_SUPER_NERD_HERBERT, SuperNerdHerbertText, SuperNerdHerbertWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, DoneTicket
	opentext
	writetext SuperNerdHerbertTicketText
	waitbutton
	closetext
	end
.After
	opentext
	writetext SuperNerdHerbertAfterText
	waitbutton
	closetext
	end

TrainerTwinJan:
	trainer TWINS, JANANDANNE1, EVENT_BEAT_TWINS_JAN_AND_ANNE, TwinJanText, TwinJanWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, DoneTicket
	
	turnobject SSMAKO1FROOMS_TWIN2, LEFT
	opentext
	writetext TwinJanTicketText
	waitbutton
	turnobject SSMAKO1FROOMS_TWIN1, RIGHT
	writetext TwinAnneTicketResponseText
	waitbutton
	turnobject SSMAKO1FROOMS_TWIN2, DOWN
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	writetext TwinJanTicketBoyText
	jump .GotGender
.Female
	writetext TwinJanTicketGirlText
.GotGender
	waitbutton
	closetext
	end
.After
	opentext
	writetext TwinJanAfterText
	waitbutton
	closetext
	end

TrainerTwinAnne:
	trainer TWINS, JANANDANNE2, EVENT_BEAT_TWINS_JAN_AND_ANNE, TwinAnneText, TwinAnneWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, DoneTicket

	turnobject SSMAKO1FROOMS_TWIN1, RIGHT
	opentext
	writetext TwinAnneTicketText
	waitbutton
	turnobject SSMAKO1FROOMS_TWIN2, LEFT
	writetext TwinJanTicketResponseText
	waitbutton
	turnobject SSMAKO1FROOMS_TWIN1, DOWN
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	writetext TwinAnneTicketBoyText
	jump .GotGender
.Female
	writetext TwinAnneTicketGirlText
.GotGender
	waitbutton
	closetext
	end
.After
	opentext
	writetext TwinAnneAfterText
	waitbutton
	closetext
	end

DoneTicket:
	opentext
	writetext SSMako1FRoomsVIPTicketLocationText
	waitbutton
	closetext
	setevent EVENT_VIP_TICKET_LOCATION_INFO
	end

SSMakoPlayerBedScript:
	opentext
	writetext SSMakoPlayerBedText
	waitbutton	
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	closetext
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	closetext
	checkevent EVENT_SS_MAKO_DEFEATED_BURGLAR
	iftrue .Landed
	end
.Landed
	setevent EVENT_SS_MAKO_DOCKED
	playsound SFX_ELEVATOR_END
	opentext
	checkevent EVENT_COMING_FROM_LEAGUE
	iftrue .Rugosa
	writetext SSMakoLandedLeagueText
	waitbutton
	closetext
	end
.Rugosa
	writetext SSMakoLandedRugosaText
	waitbutton
	closetext
	end

SSMako1FRoomsTeacherMovement:
	step RIGHT
	step_resume

SSMakoPlayerBedText:
	text "It's a comfy bed!"
	line "Time for a quick"
	cont "rest!"
	done

SSMakoLandedRugosaText:
	text "PA: Attention."
	
	para "The S.S.MAKO has"
	line "landed at RUGOSA"
	cont "COAST."
	done

SSMakoLandedLeagueText:
	text "PA: Attention."

	para "The S.S.MAKO has"
	line "landed at VICTORY"
	cont "COAST."
	done
	
SuperNerdHerbertText:
	text "Excuse me."
	
	para "I was led to"
	line "believe that this"
	cont "room would remain"
	cont "private."
	
	para "Please leave."
	done

SuperNerdHerbertWinText:
	text "I must not have"
	line "used enough RARE"
	cont "CANDY this time…"
	
	para "I will need more"
	line "for my experiment…"
	done

SuperNerdHerbertTicketText:
	text "A VIP TICKET?"
	
	para "Erm… I don't know"
	line "anything about"
	cont "those."
	
	para "Now please, leave"
	line "me be!"
	done

SuperNerdHerbertAfterText:
	text "If you will excuse"
	line "me, I must go back"
	cont "to work."

	para "I mustn't waste any"
	line "time on this trip."
	done

GentlemanWinfredText:
	text "How terribly rude"
	line "of you to enter my"
	cont "cabin unannounced!"
	
	para "Seems I will need"
	line "to give you a les-"
	cont "son in manners"
	cont "that nobody else"
	cont "is willing to!"
	done

GentlemanWinfredWinText:
	text "Hm… Are my methods"
	line "ineffective towar-"
	cont "ds the youth of"
	cont "today?"
	
	para "Nonsense! You two"
	line "are just unteach-"
	cont "able!"
	done

GentlemanWinfredTicketText:
	text "Now what did you"
	line "think was so imp-"
	cont "portant that you"
	cont "came in here with"
	cont "no invitation?"
	
	para "You want a VIP"
	line "TICKET?"
	
	para "Did you think I"
	line "would be here if I"
	cont "knew where to obt-"
	cont "ain one?"
	done

GentlemanWinfredAfterText:
	text "I respect that"
	line "your skills as a"
	cont "trainer allowed"
	cont "you to best me in"
	cont "battle, but I must"
	cont "still ask you to"
	cont "leave me be!"
	done

TeacherIleneText:
	text "I can still turn"
	line "heads just as well"
	cont "as any BEAUTY!"
	done

TeacherIleneWinText:
	text "What? Old? Me?"

	para "Hmph!"

	para "You must need"
	line "glasses!"
	done

TeacherIleneTicketText:
	text "I'm afraid I haven't"
	line "seen anything"
	cont "about a VIP"
	cont "TICKET."

	para "Try asking in the"
	line "other cabins."
	done

TeacherIleneAfterText:
	text "I don't care about"
	line "a child's opinion"
	cont "on my appearance"
	cont "anyway!"
	done
	
TwinJanText:
	text "JAN: Don't under-"
	line "estimate us just"
	cont "because we're"
	cont "young!"
	
	para "ANNE: Yeah! We won"
	line "all of our BADGEs"
	cont "easy peasy!"
	done

TwinJanWinText:
	text "JAN: I hope that"
	line "some day ANNE and"
	cont "I can run a GYM"
	cont "together."
	
	para "ANNE: Everyone"
	line "will battle with"
	cont "two #MON at a"
	cont "time!"
	done

TwinJanAfterText:
	text "JAN: I hope they"
	line "let us battle in"
	cont "the #MON LEAGUE"
	cont "together!"

	para "ANNE: We never"
	line "leave each other's"
	cont "side!"
	done

TwinAnneText:
	text "ANNE: Hey, you"
	line "have a friend to"
	cont "battle with just"
	cont "like us!"

	para "JAN: Um, ANNE…"
	line "I don't think that"
	cont "other girl has any"
	cont "#MON."
	done

TwinAnneWinText:
	text "ANNE: Two against"
	line "one isn't supposed"
	cont "to be fair!"

	para "JAN: I don't think"
	line "we should mess"
	cont "with this trainer."
	done

TwinAnneAfterText:
	text "ANNE: So your"
	line "friend's #MON"
	cont "got stolen?"

	para "JAN: That's"
	line "terrible! I hope"
	cont "you can find them."
	done

TwinJanTicketText:
	text "JAN: Have you"
	line "heard about a VIP"
	cont "TICKET, ANNE?"
	done

TwinAnneTicketResponseText:
	text "ANNE: Nu-uh, I"
	line "haven't."
	done

TwinJanTicketBoyText:
	text "JAN: Sorry mister."
	line "We'd help if we"
	cont "knew anything…"
	done

TwinJanTicketGirlText:
	text "JAN: Sorry miss."
	line "We'd help if we"
	cont "knew anything…"
	done

TwinAnneTicketText:
	text "ANNE: Have you"
	line "heard about a VIP"
	cont "TICKET, JAN?"
	done

TwinJanTicketResponseText:
	text "JAN: I don't"
	line "think I have."
	done

TwinAnneTicketBoyText:
	text "ANNE: Sorry,"
	line "mister. We'd help"
	cont "if we knew any-"
	cont "thing…"
	done

TwinAnneTicketGirlText:
	text "ANNE: Sorry miss."
	line "We'd help if we"
	cont "knew anything…"
	done

SSMako1FRoomsVIPTicketLocationText:
	text "I've heard about a"
	line "man with a VIP"
	cont "TICKET!"

	para "I think he's down"
	line "in the ENGINE ROOM"
	cont "of the ship, down"
	cont "in the basement."
	done

SSMako1FRoomsFangirlText:
	text "Hey <PLAYER>!"

	para "My #MON have"
	line "earned a long"
	cont "rest after today!"

	para "I'll make sure they"
	line "are fighting fit"
	cont "in time for the"
	cont "#MON LEAGUE!"
	done

SSMako1FRooms_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  1,  0, SS_MAKO_1F, 3
	warp_event 10,  0, SS_MAKO_1F, 4
	warp_event 20,  0, SS_MAKO_1F, 5
	warp_event  0, 15, SS_MAKO_1F, 6
	warp_event 10, 15, SS_MAKO_1F, 7
	warp_event 20, 15, SS_MAKO_1F, 8
	warp_event  1, 15, SS_MAKO_1F, 6
	warp_event 11, 15, SS_MAKO_1F, 7
	warp_event 21, 15, SS_MAKO_1F, 8

	db 9 ; coord events
	coord_event  1,  1, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport1
	coord_event 10,  1, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport2
	coord_event 20,  1, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport3
	coord_event  0, 14, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport4
	coord_event 10, 14, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport5
	coord_event 20, 14, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport6
	coord_event  1, 15, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport4
	coord_event 11, 15, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport5
	coord_event 21, 15, SCENE_SSMAKO1F_DEFAULT, RoomsFangirlTeleport6

	db 2 ; bg events
	bg_event 3, 1, BGEVENT_RIGHT, SSMakoPlayerBedScript
	bg_event 3, 2, BGEVENT_RIGHT, SSMakoPlayerBedScript

	db 7 ; object events
	object_event -4, -4, SPRITE_FANGIRL, SPRITEMOVEDATA_COMPANION, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako1FRoomsFangirl, -1
	object_event 12,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerTeacherIlene, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 21,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGentlemanWinfred, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 20, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinJan, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 21, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinAnne, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  1, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdHerbert, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 11, 12, SPRITE_FANGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako1FRoomsFangirl, EVENT_HIDE_SS_MAKO_FANGIRL
