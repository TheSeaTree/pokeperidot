	const_def 2 ; object constants
	const HALLOFFAME_CHAMPION

HallOfFame_MapScripts:
	db 2 ; scene scripts
	scene_script .EnterHallOfFame ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.EnterHallOfFame:
	priorityjump .EnterHallOfFameScript
	end

.DummyScene:
	end

.EnterHallOfFameScript:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
	
	turnobject HALLOFFAME_CHAMPION, DOWN
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext

	scall HallOfFame_Approach

	writetext HallOfFame_JosephRegisterText
	jump .DoRegistration
.Postgame
	scall HallOfFame_Approach

	writetext HallOfFame_EmilyText
.DoRegistration
	waitbutton
	closetext
	turnobject HALLOFFAME_CHAMPION, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	turnobject HALLOFFAME_CHAMPION, LEFT
	scall RespawnLegendaries
	setscene SCENE_FINISHED
	pause 15
	writebyte HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setmapscene PLAYERS_HOUSE_1F, SCENE_PLAYERSHOUSE1F_POSTGAME
;	setevent EVENT_TELEPORT_GUY
;	setevent EVENT_RIVAL_SPROUT_TOWER
;	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	clearevent EVENT_PLAYERS_HOUSE_MOM_1
	special HealParty
	halloffame
	end

HallOfFame_Approach:
	follow HALLOFFAME_CHAMPION, PLAYER
	applymovement HALLOFFAME_CHAMPION, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext

RespawnLegendaries:
	writebyte RAIKOU
	special CheckOwnedMon
	iffalse .CheckSuicune
	clearevent EVENT_HIDE_RAIKOU
.CheckSuicune
	writebyte SUICUNE
	special CheckOwnedMon
	iffalse .CheckEntei
	clearevent EVENT_HIDE_SUICUNE
.CheckEntei
	writebyte ENTEI
	special CheckOwnedMon
	iftrue .CheckArticuno
	clearevent EVENT_HIDE_ENTEI
.CheckArticuno
	checkevent EVENT_ROAMING_BIRDS
	iffalse .CheckHoOh
	writebyte ARTICUNO
	special CheckOwnedMon
	iffalse .CheckZapdos
	special InitRoamArticuno
.CheckZapdos
	writebyte ZAPDOS
	special CheckOwnedMon
	iffalse .CheckMoltres
	special InitRoamZapdos
.CheckMoltres
	writebyte MOLTRES
	special CheckOwnedMon
	iftrue .CheckHoOh
	special InitRoamMoltres
.CheckHoOh
	writebyte HO_OH
	special CheckOwnedMon
	iftrue .CheckLugia
	clearevent EVENT_FOUGHT_HO_OH
.CheckLugia
	writebyte LUGIA
	special CheckOwnedMon
	iftrue .CheckMewtwo
	clearevent EVENT_FOUGHT_LUGIA
.CheckMewtwo
	writebyte MEWTWO
	special CheckOwnedMon
	iftrue .CheckMew
	clearevent EVENT_FOUGHT_MEWTWO
.CheckMew
	writebyte MEW
	special CheckOwnedMon
	iftrue .CheckCelebi
	clearevent EVENT_FOUGHT_MEW
.CheckCelebi
	writebyte CELEBI
	special CheckOwnedMon
	iftrue .Done
	clearevent EVENT_FOUGHT_CELEBI
.Done
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "JOSEPH: This is"
	line "the HALL OF FAME."

	para "In this room, a"
	line "record of each"
	cont "CHAMPION and their"
	cont "#MON is created"
	cont "to celebrate their"
	cont "accomplishments."

	para "Please, follow me"
	line "to the machine."
	done

HallOfFame_JosephRegisterText:
	text "Allow me to congr-"
	line "atulate you, new"
	cont "CHAMPION. For your"
	cont "triumph over me"
	cont "on this day."

	para "You and your"
	line "#MON will never"
	cont "be forgotten!"
	done

HallOfFame_EmilyText:
	text "You already know"
	line "how this works, so"
	cont "I won't bore you"
	cont "with the details."

	para "Let's record you"
	line "and your #MON"
	cont "for all to"
	cont "remember."

	para "Congratulations"
	line "once again!"

	para "Oh, <PLAYER>!"

	para "…Could you do me a"
	line "favor?"

	para "Promise me this"
	line "won't be the last"
	cont "time either of us"
	cont "see this room!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, VICTORS_ROOM, 3
	warp_event  5, 13, VICTORS_ROOM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4, 12, SPRITE_HOF_CHAMPION, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
