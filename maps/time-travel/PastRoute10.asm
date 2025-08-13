	const_def 2 ; object constants
	const PASTROUTE10_TEACHER
	const PASTROUTE10_POKEFANM
	const PASTROUTE10_SUPER_NERD
	const PASTROUTE10_YOUNGSTER
	const PASTROUTE10_POKE_BALL1
	const PASTROUTE10_POKE_BALL2
	const PASTROUTE10_POKE_BALL3

PastRoute10_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .LightsOff
	callback MAPCALLBACK_NEWMAP, .ChangeWarp

.LightsOff
	checkevent EVENT_DEFEATED_SCHOOLHOUSE_TEACHER
	iffalse .LightsOn
	checktime NITE
	iffalse .LightsOn
	changeblock		46, 16, $cd
	changeblock		48, 16, $ce
.LightsOn
	return

.ChangeWarp
	checkevent EVENT_DEFEATED_SCHOOLHOUSE_TEACHER
	iftrue .DontChange
	warpmod 1, PAST_ROUTE_10_SCHOOLHOUSE
	return
.DontChange
	warpmod 1, PAST_ROUTE_10_SCHOOLHOUSE_2
	return

PastRoute10Teacher:
	jumptextfaceplayer PastRoute10TeacherText

PastRoute10PokefanM:
	jumptextfaceplayer PastRoute10PokefanMText

PastRoute10SuperNerd:
	jumptextfaceplayer PastRoute10SuperNerdText

PastRoute10Youngster:
	jumptextfaceplayer PastRoute10YoungsterText

PastRoute10CelebiTeleportMovement:
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_end

PastRoute10Sign:
	jumptext PastRoute10SignText

PastRoute10WildPokemonSign:
	jumptext PastRoute10WildPokemonSignText

PastRoute10InnSign:
	jumptext PastRoute10InnSignText

PastRoute10QuickClaw:
	itemball QUICK_CLAW

PastRoute10FocusSash:
	itemball FOCUS_SASH

PastRoute10RageCandyBar:
	itemball RAGECANDYBAR

PastRoute10HiddenDampCharm:
	hiddenitem DAMP_CHARM, EVENT_ROUTE_10_PAST_HIDDEN_DAMP_CHARM

PastRoute10HiddenMintBerry:
	hiddenitem MINT_BERRY, EVENT_ROUTE_10_PAST_HIDDEN_MINT_BERRY

PastRoute10HiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_ROUTE_10_PAST_HIDDEN_STAR_PIECE

PastRoute10TeacherText:
	text "It's so cozy to"
	line "live in a place"
	cont "close to two other"
	cont "towns while still"
	cont "being surrounded"
	cont "by nature."
	done

PastRoute10PokefanMText:
	text "I moved here from"
	line "PECTINIA CITY."

	para "All of the trees"
	line "make the air so"
	cont "much fresher."

	para "Ahhh!"
	done

PastRoute10SuperNerdText:
	text "I've been seeing"
	line "some scary new"
	cont "#MON coming out"
	cont "after dark."

	para "Do you think they"
	line "might be an omen?"
	done

PastRoute10YoungsterText:
	text "I like to visit"
	line "ELKHORN TOWN more"
	cont "than FAVIA TOWN."

	para "The ZUBAT in the"
	line "gate to FAVIA TOWN"
	cont "scares me…"
	done

PastRoute10SignText:
	text "TABULATA TOWN-"

	para "A flourishing"
	line "bridge between"
	cont "other towns."
	done

PastRoute10WildPokemonSignText:
	text "For your safety,"
	line "do not approach"
	cont "any wild #MON"
	cont "roaming the town."
	done

PastRoute10InnSignText:
	text "TABULATA INN"
	done

PastRoute10_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 47, 17, PAST_ROUTE_10, -1 ; Schoolhouse
	warp_event 27, 27, PAST_ROUTE_10_GATE, 1
	warp_event 28, 27, PAST_ROUTE_10_GATE, 2
	warp_event 49, 21, PAST_ROUTE_10_HOUSE_5, 1
	warp_event 37,  7, PAST_ROUTE_10_HOUSE_1, 1
	warp_event 29, 11, PAST_ROUTE_10_INN, 1
	warp_event 19,  7, PAST_ROUTE_10_HOUSE_2, 1
	warp_event 17, 17, PAST_ROUTE_10_HOUSE_3, 1
	warp_event  7, 11, PAST_ROUTE_10_HOUSE_4, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 16, 10, BGEVENT_READ, PastRoute10Sign
	bg_event 30, 23, BGEVENT_READ, PastRoute10WildPokemonSign
	bg_event 27, 11, BGEVENT_READ, PastRoute10InnSign
	bg_event 45,  4, BGEVENT_ITEM, PastRoute10HiddenDampCharm
	bg_event  2,  4, BGEVENT_ITEM, PastRoute10HiddenMintBerry
	bg_event 26, 14, BGEVENT_ITEM, PastRoute10HiddenStarPiece

	db 7 ; object events
	object_event 25,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastRoute10Teacher, -1
	object_event 14, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute10PokefanM, -1
	object_event 34, 23, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute10SuperNerd, -1
	object_event  6, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastRoute10Youngster, -1
	object_event 58, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute10QuickClaw, EVENT_ROUTE_10_PAST_QUICK_CLAW
	object_event 51,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute10FocusSash, EVENT_ROUTE_10_PAST_FOCUS_SASH
	object_event  1, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute10RageCandyBar, EVENT_ROUTE_10_PAST_RAGECANDYBAR
