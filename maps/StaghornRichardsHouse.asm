	const_def 2 ; object constants

StaghornRichardsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Richard:
	faceplayer
	opentext
	trade NPC_TRADE_RICHARD
	waitbutton
	closetext
	turnobject LAST_TALKED, DOWN
	end

StaghornRichardsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, STAGHORN_TOWN, 9
	warp_event  3,  7, STAGHORN_TOWN, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Richard, -1
