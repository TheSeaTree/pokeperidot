	const_def 2 ; object constants

PastRoute10House1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute10House1CooltrainerFScript:
	jumptextfaceplayer PastRoute10House1CooltrainerFText

PastRoute10House1BulbasaurScript:
	opentext
	writetext PastRoute10House1BulbasaurText
	cry BULBASAUR
	waitbutton
	closetext
	end

PastRoute10House1CooltrainerFText:
	text "My grandpa got me"
	line "this BULBASAUR"
	cont "when he visited"
	cont "another region."

	para "I'm no good at"
	line "battling, but"
	cont "BULBASAUR doesn't"
	cont "seem to mind!"
	done

PastRoute10House1BulbasaurText:
	text "BULBASAUR: Bubba!"
	line "Zoar!"
	done

PastRoute10House1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_10, 5
	warp_event 3,  7, PAST_ROUTE_10, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastRoute10House1CooltrainerFScript, -1
	object_event  4,  5, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastRoute10House1BulbasaurScript, -1
