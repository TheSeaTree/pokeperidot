	const_def 2 ; object constants

SeaRoute5_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetEvents
	callback MAPCALLBACK_TILES, .SmashWall
	
.SetEvents
	checkevent EVENT_SEA_ROUTE_5_HIDDEN_CAVE_OPEN
	iftrue .done
	setevent EVENT_LUGIA_CAVE_B2F_BOULDER_1
	setevent EVENT_LUGIA_CAVE_B2F_BOULDER_2
	setevent EVENT_LUGIA_CAVE_B2F_BOULDER_3
	setevent EVENT_LUGIA_CAVE_B2F_BOULDER_4
	setevent EVENT_LUGIA_CAVE_B2F_BOULDER_5
	setevent EVENT_LUGIA_CAVE_B2F_BOULDER_6
.done
	return
	
.SmashWall:
	checkevent EVENT_SEA_ROUTE_5_HIDDEN_CAVE_OPEN
	iffalse .skip
	changeblock  4, 10, $73
.skip
	return

SandstormGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_SANDSTORM
	iftrue .Sandstorm
	writetext SandstormGuyText
	buttonsound
	verbosegiveitem TM_SANDSTORM
	setevent EVENT_GOT_TM_SANDSTORM
	
.Sandstorm:
	writetext TMSandstormExplaination
	buttonsound
	closetext
	end

SandstormGuyText:
	text "When the wind"
	line "picks up out here,"
	cont "sand will get all"
	cont "over the place."
	
	para "Wanna see what I"
	line "mean? Take this."
	done
	
TMSandstormExplaination:
	text "That TM is for"
	line "SANDSTORM."
	
	para "It will whip sand"
	line "around, and hurt"
	cont "any #MON that"
	cont "aren't GROUND,"
	cont "STEEL, or ROCK."
	
	para "I should catch"
	line "some of those if"
	cont "I'm going to stand"
	cont "around out here"
	cont "all day."
	done

SeaRoute5_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15, 29, ROUTE_6_GATE, 1
	warp_event 16, 29, ROUTE_6_GATE, 2
	warp_event  4, 11, LUGIA_CAVE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 30,  6, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SandstormGuy, -1
	object_event 12, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
