	const_def 2 ; object constants
	const SSMAKO1FROOMS_FANGIRL
	const SSMAKO1FROOMS_TEACHER
	const SSMAKO1FROOMS_GENTLEMAN
	const SSMAKO1FROOMS_TWIN1
	const SSMAKO1FROOMS_TWIN2
	const SSMAKO1FROOMS_SUPER_NERD

SSMako1FRooms_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKO1FROOMS_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKO1FROOMS_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKO1FROOMS_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_DEFAULT
	end

.DummyScene1:
	turnobject SSMAKO1FROOMS_TEACHER, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DummyScene2
	moveobject SSMAKO1FROOMS_FANGIRL, 1, 1
	jump RoomsFangirlContinueFolow
.DummyScene2:
	end

RoomsFangirlTeleport1:
	moveobject SSMAKO1FROOMS_FANGIRL, 1, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport2:
	moveobject SSMAKO1FROOMS_FANGIRL, 10, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport3:
	moveobject SSMAKO1FROOMS_FANGIRL, 20, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport4:
	moveobject SSMAKO1FROOMS_FANGIRL, 0, 15
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport5:
	moveobject SSMAKO1FROOMS_FANGIRL, 10, 15
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport6:
	moveobject SSMAKO1FROOMS_FANGIRL, 20, 15
	jump RoomsFangirlContinueFolow

RoomsFangirlContinueFolow:
	appear SSMAKO1FROOMS_FANGIRL
	follow PLAYER, SSMAKO1FROOMS_FANGIRL
	setscene SCENE_SSMAKO1FROOMS_FOLLOWING
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject SSMAKO1FROOMS_TEACHER, LEFT
	end
	
SSMako1FRoomsFangirl:
	jumpstd emilycompanion

TrainerGentlemanWinfred:
	trainer GENTLEMAN, WINFRED, EVENT_BEAT_GENTLEMAN_WINFRED, SSMako1FRoomsTrainerText, SSMako1FRoomsTrainerWinText, 0, .Script
;	trainer SCHOOLBOY, TIMMY, EVENT_BEAT_GENTLEMAN_WINFRED, SSMako1FRoomsTrainerText, SSMako1FRoomsTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, DoneTicket
	; Text about not knowing anything about the ticket.
	opentext
	writetext PlusOneText
	waitbutton
	closetext
	end
.After
	opentext
	writetext SSMako1FRoomsTrainerAfterText
	waitbutton
	closetext
	end

TrainerTeacherIlene:
	trainer TEACHER, ILENE, EVENT_BEAT_TEACHER_ILENE, TeacherIleneText, TeacherIleneWinText, 0, .Script
;	trainer SCHOOLBOY, TIMMY, EVENT_BEAT_TEACHER_ILENE, TeacherIleneText, TeacherIleneWinText, 0, .Script

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
;	trainer SCHOOLBOY, TIMMY, EVENT_BEAT_SUPER_NERD_HERBERT, SuperNerdHerbertText, SSMako1FRoomsTrainerWinText, 0, .Script

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

TrainerTwinAnita:
	trainer TWINS, ANITAANDLITA1, EVENT_BEAT_TWINS_JAN_AND_ANNE, SSMako1FRoomsTrainerText, SSMako1FRoomsTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, DoneTicket
	opentext
	writetext PlusOneText
	waitbutton
	closetext
	end
.After
	opentext
	writetext SSMako1FRoomsTrainerAfterText
	waitbutton
	closetext
	end


TrainerTwinLita:
	trainer TWINS, ANITAANDLITA2, EVENT_BEAT_TWINS_JAN_AND_ANNE, SSMako1FRoomsTrainerText, SSMako1FRoomsTrainerWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako1FFightCount
	addvar 1
	copyvartobyte wSSMako1FFightCount
	copybytetovar wSSMako1FFightCount
	ifequal  4, DoneTicket
	opentext
	writetext PlusOneText
	waitbutton
	closetext
	end
.After
	opentext
	writetext SSMako1FRoomsTrainerAfterText
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
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	closetext
;	checkevent EVENT_BEAT_BURGLAR_[The one who steals Emily's bag]
;	iftrue .Landed
	end
.Landed
	playsound SFX_ELEVATOR_END
	opentext
	writetext SSMakoLandedText
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
;	checkevent EVENT_COMING_FROM_LEAGUE
;	iftrue, .Rugosa
; Set scenes here as well, for each respective map.
	warpfacing UP, POKEMON_LEAGUE_POKECENTER_1F, 12, 7
	end
.Rugosa
; Set scenes here as well, for each respective map.
;	clearevent EVENT_COMING_FROM_LEAGUE
	warpfacing UP, RUGOSA_PORT, 14, 7
	end

SSMako1FRoomsTeacherMovement:
	step RIGHT
	step_resume

SSMakoPlayerBedText:
	text "It's a comfy bed!"
	line "Time for a quick"
	cont "rest!"
	done

SSMakoLandedText:
	text "We have landed!"
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

	para "I musn't waste any"
	line "time on this trip."
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

SSMako1FRoomsVIPTicketLocationText:
	text "I've heard about a"
	line "man with a VIP"
	cont "TICKET!"

	para "I think he's down"
	line "in the ENGINE ROOM"
	cont "of the ship, down"
	cont "in the basement."
	done

SSMako1FRoomsTrainerText:
	text "I am a"
	line "#MON trainer."
	done

SSMako1FRoomsTrainerWinText:
SSMako1FRoomsTrainerAfterText:
	text "I lost."
	done

PlusOneText:
	text "Plus one!"
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

	db 6 ; object events
	object_event -4, -3, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako1FRoomsFangirl, -1
	object_event 12,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerTeacherIlene, -1
	object_event 21,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGentlemanWinfred, -1
	object_event 20, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinAnita, -1
	object_event 21, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinLita, -1
	object_event  1, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdHerbert, -1
