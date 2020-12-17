	const_def 2 ; object constants
	const Route3AzaleaGate_OFFICER

Route3AzaleaGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

Route3AzaleaGuardScript:
	jumptextfaceplayer Route3AzaleaGuardText

Route3AzaleaGuardText:
	text "There is a huge"
	line "mountain on ROUTE"
	cont "3 that attracts"
	cont "all sorts of"
	cont "trainers."
	
	para "But you won't be"
	line "able to reach it"
	cont "from this path."
	done

Route3AzaleaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_3, 1
	warp_event  5,  0, ROUTE_3, 2
	warp_event  4,  7, AZALEA_TOWN, 5
	warp_event  5,  7, AZALEA_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route3AzaleaGuardScript, -1
