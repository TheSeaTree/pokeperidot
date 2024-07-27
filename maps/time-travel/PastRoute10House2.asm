	const_def 2 ; object constants

PastRoute10House2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute10House2Caretaker:
	jumptextfaceplayer PastRoute10House2CaretakerText

PastRoute10House2Vulpix:
	opentext
	writetext PastRoute10House2VulpixText
	cry VULPIX
	waitbutton
	closetext
	end

PastRoute10House2Bellossom:
	opentext
	writetext PastRoute10House2BellossomText
	cry BELLOSSOM
	waitbutton
	closetext
	end

PastRoute10House2Butterfree:
	opentext
	writetext PastRoute10House2ButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

PastRoute10House2CaretakerText:
	text "When I was little,"
	line "it was my dream to"
	cont "create a shelter"
	cont "for any #MON"
	cont "in need."

	para "It's hard work that"
	line "keeps me busy."

	para "I hope to some day"
	line "find other kind"
	cont "souls who share my"
	cont "passion for help-"
	cont "ing out #MON."
	done

PastRoute10House2VulpixText:
	text "VULPIX: Fooox!"
	done

PastRoute10House2BellossomText:
	text "BELLOSSOM: Hanaaa!"
	done

PastRoute10House2ButterfreeText:
	text "BUTTERFREE: Freeh!"
	done

PastRoute10House2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_10, 7
	warp_event 3,  7, PAST_ROUTE_10, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, PastRoute10House2Caretaker, -1
	object_event  3,  1, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute10House2Vulpix, -1
	object_event  6,  7, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastRoute10House2Bellossom, -1
	object_event  6,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastRoute10House2Butterfree, -1
