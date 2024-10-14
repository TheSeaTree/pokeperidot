	const_def 2 ; object constants
	const LUGIALAIR_LUGIA

LugiaLair_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SpawnRealLugia

.SpawnRealLugia:
	checkevent EVENT_REGULAR_LUGIA
	iftrue .end
	checkevent EVENT_CAUGHT_ARTICUNO
	iffalse .end
	checkevent EVENT_CAUGHT_ZAPDOS
	iffalse .end
	checkevent EVENT_CAUGHT_MOLTRES
	iffalse .end
	appear LUGIALAIR_LUGIA
	setevent EVENT_REGULAR_LUGIA
	clearevent EVENT_FOUGHT_LUGIA
.end
	return

Lugia:
	opentext
	writetext LugiaText
	cry LUGIA
	waitsfx
	closetext
	checkevent EVENT_CAUGHT_ARTICUNO
	iffalse .BossLugia
	checkevent EVENT_CAUGHT_ZAPDOS
	iffalse .BossLugia
	checkevent EVENT_CAUGHT_MOLTRES
	iffalse .BossLugia
	special LegendaryEvent_SetBattleType
	loadwildmon LUGIA, 70
	startbattle
	reloadmapafterbattle
	disappear LUGIALAIR_LUGIA
	setevent EVENT_FOUGHT_LUGIA
	special CheckCaughtCelebi
	iffalse .FailedCapture
	setevent EVENT_CAUGHT_LUGIA
.FailedCapture
	end

.BossLugia:
	loadwildmon LUGIA, 50
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	special InitRoamArticuno
	special InitRoamZapdos
	special InitRoamMoltres
	disappear LUGIALAIR_LUGIA
	setevent EVENT_FOUGHT_LUGIA
	setevent EVENT_ROAMING_BIRDS
	end

LugiaText:
	text "Gyaaas!"
	done

LugiaLair_MapEvents:
	db 0, 0 ; filler

	db  1 ; warp events
	warp_event 13, 13, LUGIA_CAVE_GATE_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 13,  7, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lugia, EVENT_FOUGHT_LUGIA
