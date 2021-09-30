Rugosa	const_def 2 ; object constants

RugosaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RugosaGateOfficerScript:
;	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
;	iftrue .Event
;	givepoke GOLBAT, 99
;	giveitem RARE_CANDY
;	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
;	end
;.Event
;	special FountainHappiness
;	special GetFirstPokemonHappiness
;	ifgreater 100 - 1, .QuiteCute
;	showemote EMOTE_FISH, PLAYER, 15
;	end

;.QuiteCute
;	turnobject PLAYER, DOWN
;	showemote EMOTE_HEART, PLAYER, 15
;	end
	
	jumptext RugosaGateOfficerText

RugosaGateOfficerText:
	text "RUGOSA CITY is"
	line "ahead."
	
	para "The city attracts"
	line "a lot of tourism"
	cont "from people who"
	cont "want to meet"
	cont "future #MON"
	cont "LEAGUE CHAMPIONS."
	done

RugosaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, RUGOSA_CITY, 1
	warp_event  5,  0, RUGOSA_CITY, 2
	warp_event  4,  7, RUGOSA_COAST, 3
	warp_event  5,  7, RUGOSA_COAST, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  3, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaGateOfficerScript, -1
