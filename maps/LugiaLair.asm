	const_def 2 ; object constants
	const LUGIALAIR_LUGIA

LugiaLair_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SpawnRealLugia

.SpawnRealLugia:
	writebyte LUGIA
	special CheckOwnedMon
	iftrue .end
	writebyte ARTICUNO
	special CheckOwnedMon
	iffalse .end
	writebyte ZAPDOS
	special CheckOwnedMon
	iffalse .end
	writebyte MOLTRES
	special CheckOwnedMon
	iffalse .end
	appear LUGIALAIR_LUGIA
.end
	return

Lugia:
	opentext
	writetext LugiaText
	cry LUGIA
	waitsfx
	waitbutton
	closetext
	writebyte ARTICUNO
	special CheckOwnedMon
	iffalse .BossLugia
	writebyte ZAPDOS
	special CheckOwnedMon
	iffalse .BossLugia
	writebyte MOLTRES
	special CheckOwnedMon
	iffalse .BossLugia
	loadwildmon LUGIA, 50
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	reloadmapafterbattle
	special InitRoamArticuno
	special InitRoamZapdos
	special InitRoamMoltres
	disappear LUGIALAIR_LUGIA
	setevent EVENT_FOUGHT_LUGIA
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
