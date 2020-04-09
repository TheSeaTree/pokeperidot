	const_def 2 ; object constants
	const LUGIALAIR_LUGIA

LugiaLair_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SpawnRealLugia
	
.SpawnRealLugia:
	writebyte LUGIA
	special CheckOwnedMon
	iffalse .end
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
	loadwildmon LUGIA, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	special InitRoamArticuno
	special InitRoamZapdos
	special InitRoamMoltres
	disappear LUGIALAIR_LUGIA
	setevent EVENT_FOUGHT_LUGIA
	end
	
GiftBirds:
	givepoke ARTICUNO, 50
	givepoke ZAPDOS, 50
	givepoke MOLTRES, 50
	end
	
LugiaText:
	text "Gyaaas!"
	done

LugiaLair_MapEvents:
	db 0, 0 ; filler

	db  1 ; warp events
	warp_event 13, 13, BLACKTHORN_CITY, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 15, BGEVENT_READ, GiftBirds

	db 1 ; object events
	object_event 13,  6, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lugia, EVENT_FOUGHT_LUGIA
