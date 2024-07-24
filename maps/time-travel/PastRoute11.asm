	const_def 2 ; object constants
	const PASTROUTE11_TEACHER
	const PASTROUTE11_POKEFANM
	const PASTROUTE11_SUPER_NERD
	const PASTROUTE11_YOUNGSTER
	const PASTROUTE11_POKE_BALL1
	const PASTROUTE11_POKE_BALL2
	const PASTROUTE11_POKE_BALL3

PastRoute11_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LightsOff

.LightsOff
	checktime NITE
	iffalse .LightsOn
	changeblock		46, 16, $cd
	changeblock		48, 16, $ce
.LightsOn
	return

PastRoute11Teacher:
	jumptextfaceplayer PastRoute11TeacherText

PastRoute11PokefanM:
	jumptextfaceplayer PastRoute11PokefanMText

PastRoute11SuperNerd:
	jumptextfaceplayer PastRoute11SuperNerdText

PastRoute11Youngster:
	jumptextfaceplayer PastRoute11YoungsterText

PastRoute11CelebiTeleportMovement:
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

PastRoute11Sign:
	jumptext PastRoute11SignText

PastRoute11WildPokemonSign:
	jumptext PastRoute11WildPokemonSignText

PastRoute11InnSign:
	jumptext PastRoute11InnSignText

PastRoute11QuickClaw:
	itemball QUICK_CLAW

PastRoute11FocusSash:
	itemball FOCUS_SASH

PastRoute11RageCandyBar:
	itemball RAGECANDYBAR

PastRoute11HiddenDampCharm:
	hiddenitem DAMP_CHARM, EVENT_ROUTE_11_PAST_HIDDEN_DAMP_CHARM

PastRoute11HiddenMintBerry:
	hiddenitem MINT_BERRY, EVENT_ROUTE_11_PAST_HIDDEN_MINT_BERRY

PastRoute11HiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_ROUTE_11_PAST_HIDDEN_STAR_PIECE

PastRoute11TeacherText:
	text "It's so cozy to"
	line "live in a place"
	cont "close to two other"
	cont "towns while still"
	cont "being surrounded"
	cont "by nature."
	done

PastRoute11PokefanMText:
	text "I moved here from"
	line "PECTINIA CITY."

	para "All of the trees"
	line "make the air so"
	cont "much fresher here."

	para "Ahhh!"
	done

PastRoute11SuperNerdText:
	text "I've been seeing"
	line "some scary new"
	cont "#MON coming out"
	cont "after dark."

	para "Do you think they"
	line "might be an omen?"
	done

PastRoute11YoungsterText:
	text "I like to visit"
	line "ELKHORN TOWN more"
	cont "than FAVIA TOWN."

	para "The ZUBAT in the"
	line "gate to FAVIA TOWN"
	cont "scares me…"
	done

PastRoute11SignText:
	text "TABULATA TOWN-"

	para "A flourishing"
	line "bridge between"
	cont "other towns."
	done

PastRoute11WildPokemonSignText:
	text "For your safety,"
	line "do not approach"
	cont "any wild #MON"
	cont "roaming the town."
	done

PastRoute11InnSignText:
	text "TABULATA INN"
	done

PastRoute11_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 27, 27, PAST_ROUTE_11_GATE, 1
	warp_event 28, 27, PAST_ROUTE_11_GATE, 2
	warp_event 47, 17, PAST_ROUTE_11_SCHOOLHOUSE, 1
	warp_event 49, 21, PAST_ROUTE_11_HOUSE_5, 1
	warp_event 37,  7, PAST_ROUTE_11_HOUSE_1, 1
	warp_event 29, 11, PAST_ROUTE_11_INN, 1
	warp_event 19,  7, PAST_ROUTE_11_HOUSE_2, 1
	warp_event 17, 17, PAST_ROUTE_11_HOUSE_3, 1
	warp_event  7, 11, PAST_ROUTE_11_HOUSE_4, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 16, 10, BGEVENT_READ, PastRoute11Sign
	bg_event 30, 23, BGEVENT_READ, PastRoute11WildPokemonSign
	bg_event 27, 11, BGEVENT_READ, PastRoute11InnSign
	bg_event 45,  4, BGEVENT_ITEM, PastRoute11HiddenDampCharm
	bg_event  2,  4, BGEVENT_ITEM, PastRoute11HiddenMintBerry
	bg_event 26, 14, BGEVENT_ITEM, PastRoute11HiddenStarPiece

	db 7 ; object events
	object_event 25,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastRoute11Teacher, -1
	object_event 14, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute11PokefanM, -1
	object_event 34, 23, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute11SuperNerd, -1
	object_event  6, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastRoute11Youngster, -1
	object_event 58, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute11QuickClaw, EVENT_ROUTE_11_PAST_QUICK_CLAW
	object_event 51,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute11FocusSash, EVENT_ROUTE_11_PAST_FOCUS_SASH
	object_event  1, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute11RageCandyBar, EVENT_ROUTE_11_PAST_RAGECANDYBAR
