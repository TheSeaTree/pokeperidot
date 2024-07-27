	const_def 2 ; object constants
	const ROUTE27GATE_OFFICER1
	const ROUTE27GATE_OFFICER2
	const ROUTE27GATE_NURSE

Route27Gate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .PC

.PC
	changeblock 0, 0, $2c
	return

Route27GateOfficerMScript:
	jumptext Route27GateOfficerMText

Route27GateOfficerFScript:
	jumptext Route27GateOfficerFText

Route27GateNurseScript:
	opentext
	writetext Route27GateNurseText
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
	writetext Route27GateNurseAfterText
	waitbutton
	closetext
	turnobject ROUTE27GATE_NURSE, UP
	pause 4
	turnobject ROUTE27GATE_NURSE, DOWN
	end

Route27GateOfficerMText:
	text "You won't find any"
	line "#MON on ROUTE"
	cont "22, but there are"
	cont "always trainers"
	cont "around looking for"
	cont "a good battle!"

	para "I even take part"
	line "myself when I'm"
	cont "off duty!"
	done

Route27GateOfficerFText:
	text "Going to ROUTE 22"
	line "for some battles?"

	para "The man who works"
	line "here during the"
	cont "day is quite good!"
	done

Route27GateNurseText:
	text "Are your #MON"
	line "hurt from training"
	cont "on ROUTE 22?"

	para "Let me see, I'll"
	line "fix them right up!"
	done

Route27GateNurseAfterText:
	text "Those trainers can"
	line "be rough."

	para "Be careful out"
	line "there!"
	done

Route27Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, VICTORY_COAST, 3
	warp_event  0,  5, VICTORY_COAST, 4
	warp_event  9,  4, ROUTE_22, 1
	warp_event  9,  5, ROUTE_22, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, 3, 17, 0, OBJECTTYPE_SCRIPT, 0, Route27GateOfficerMScript, -1
	object_event  5,  2, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, Route27GateOfficerFScript, -1
	object_event  4,  2, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route27GateNurseScript, -1
