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
	clearevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	jump .DoRegistration
.Postgame
	clearevent EVENT_PLAYERS_HOUSE_MOM_1
	scall HallOfFame_Approach

	writetext HallOfFame_EmilyText
.DoRegistration
	waitbutton
	closetext
	turnobject HALLOFFAME_CHAMPION, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	turnobject HALLOFFAME_CHAMPION, RIGHT
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
	clearevent EVENT_HO_OH_CASTLE_HIDDEN_SACRED_ASH
	clearevent EVENT_MEWTWO_LAB_HIDDEN_BERSERK_GENE
	setevent EVENT_PLAYERS_HOUSE_MOM_2
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
	checkevent EVENT_CAUGHT_RAIKOU
	iftrue .CheckSuicune
	clearevent EVENT_HIDE_RAIKOU
.CheckSuicune
	checkevent EVENT_CAUGHT_SUICUNE
	iftrue .CheckEntei
	clearevent EVENT_HIDE_SUICUNE
.CheckEntei
	checkevent EVENT_CAUGHT_ENTEI
	iftrue .CheckLugiaBoss
	clearevent EVENT_HIDE_ENTEI
.CheckLugiaBoss
	checkevent EVENT_ROAMING_BIRDS
	iffalse .CheckHoOh
.CheckArticuno
	checkevent EVENT_CAUGHT_ARTICUNO
	iftrue .CheckZapdos
	special InitRoamArticuno
.CheckZapdos
	checkevent EVENT_CAUGHT_ZAPDOS
	iftrue .CheckMoltres
	special InitRoamZapdos
.CheckMoltres
	checkevent EVENT_CAUGHT_MOLTRES
	iftrue .CheckHoOh
	special InitRoamMoltres
.CheckHoOh
	checkevent EVENT_CAUGHT_HO_OH
	iftrue .CheckLugia
	clearevent EVENT_FOUGHT_HO_OH
.CheckLugia
	checkevent EVENT_CAUGHT_LUGIA
	iftrue .CheckMewtwo
	clearevent EVENT_FOUGHT_LUGIA
.CheckMewtwo
	checkevent EVENT_CAUGHT_MEWTWO
	iftrue .CheckMew
	clearevent EVENT_FOUGHT_MEWTWO
.CheckMew
	checkevent EVENT_CAUGHT_MEW
	iftrue .CheckCelebi
	clearevent EVENT_FOUGHT_MEW
.CheckCelebi
	checkevent EVENT_CAUGHT_CELEBI
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
	warp_event  4, 13, JOSEPHS_ROOM, 3
	warp_event  5, 13, JOSEPHS_ROOM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4, 12, SPRITE_HOF_CHAMPION, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
