	const_def 2 ; object constants
	const Route3AzaleaGate_OFFICER

Route3AzaleaGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

Route6SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext Route6SaffronGuardWelcomeText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route6SaffronGuardMagnetTrainText
	waitbutton
	closetext
	end

Route6SaffronGuardWelcomeText:
	text "Welcome to SAFFRON"
	line "CITY, home of the"
	cont "MAGNET TRAIN!"

	para "…That's what I'd"
	line "normally say, but"

	para "the MAGNET TRAIN"
	line "isn't running now."

	para "It's not getting"
	line "any electricity"

	para "because there's"
	line "something wrong"

	para "with the POWER"
	line "PLANT."
	done

Route6SaffronGuardMagnetTrainText:
	text "The MAGNET TRAIN"
	line "is the most famous"

	para "thing about SAF-"
	line "FRON."
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
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
