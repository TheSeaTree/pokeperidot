	const_def 2 ; object constants

Route9ForestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Donnie:
	faceplayer
	opentext
	trade NPC_TRADE_DONNIE
	waitbutton
	closetext
	turnobject LAST_TALKED, DOWN
	end
	
Route9ForestGateOfficerScript:
	jumptextfaceplayer Route9ForestGateOfficerText
	
Route9ForestGateTeacherScript:
	faceplayer
	opentext
	writetext Route9ForestGateRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route9ForestGateKeepAtItText
	waitbutton
	closetext
	checkflag ENGINE_FLYPOINT_ROUTE_9
	iffalse .SetFlypoint
	end
	
.SetFlypoint
	setflag ENGINE_FLYPOINT_ROUTE_9
	end
	
Route9ForestGateOfficerText:
	text "The forest up"
	line "ahead is home to"
	cont "plenty of BUG-type"
	cont "#MON."
	
	para "Some trainers like"
	line "to train FIRE and"
	cont "FLYING-type"
	cont "#MON here."
	done
	
Route9ForestGateRestAWhileText:
	text "Your #MON look"
	line "to be exhausted!"

	para "You should rest"
	line "them a while."
	done
	
Route9ForestGateKeepAtItText:
	text "There!"

	para "Your #MON are"
	line "looking good!"
	
	para "Good luck"
	line "up ahead!"
	done
	

Route9ForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 3, 7, ROUTE_9, 2
	warp_event 4, 7, ROUTE_9, 2
	warp_event 2, 0, OCCIDENT_FOREST, 1
	warp_event 3, 0, OCCIDENT_FOREST, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 10,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Donnie, -1
	object_event  0,  4, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route9ForestGateOfficerScript, -1
	object_event  8,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route9ForestGateTeacherScript, -1
