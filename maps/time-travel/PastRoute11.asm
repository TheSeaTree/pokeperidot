	const_def 2 ; object constants
	const PASTROUTE11_TEACHER
	const PASTROUTE11_POKEFANM
	const PASTROUTE11_SUPER_NERD
	const PASTROUTE11_YOUNGSTER
	const PASTROUTE11_POKE_BALL1
	const PASTROUTE11_POKE_BALL2
	const PASTROUTE11_POKE_BALL3
	const PASTROUTE11_CELEBI

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

; Bug Catcher talks about how he can meet his friends in Elkhorn so much more easily than the ones in Favia.

CelebiEncounter1:
	showemote EMOTE_SHOCK, PASTROUTE11_CELEBI, 15
	scall PastRoute11CelebiEncounter
	playsound SFX_WARP_TO
	applymovement PASTROUTE11_CELEBI, PastRoute11CelebiTeleportMovement
	setevent EVENT_HIDE_AND_SEEK_CELEBI_2
	clearevent EVENT_HIDE_AND_SEEK_CELEBI_3
	disappear PASTROUTE11_CELEBI
	waitsfx
	jumpstd bosscelebibattle

PastRoute11CelebiEncounter:
	jumpstd weakcelebiencounter
	end

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

PastRoute11_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 27, 27, PAST_ROUTE_11_GATE, 5 ; Favia Gate
	warp_event 28, 27, PAST_ROUTE_11_GATE, 5 ; Favia Gate
	warp_event 47, 17, PAST_ROUTE_11, 3 ; Battle House
	warp_event 49, 21, PAST_ROUTE_11, 4 ; Curse House
	warp_event 37,  7, PAST_ROUTE_11, 5 ; Misc House 1
	warp_event 29, 11, PAST_ROUTE_11_INN, 1
	warp_event 19,  7, PAST_ROUTE_11, 7 ; Misc House 2
	warp_event 17, 17, PAST_ROUTE_11, 8 ; Misc House 3
	warp_event  7, 11, PAST_ROUTE_11, 9 ; Cleanse Tag House

	db 0 ; coord events

	db 3 ; bg events
	bg_event 45,  4, BGEVENT_ITEM, PastRoute11HiddenDampCharm
	bg_event  2,  4, BGEVENT_ITEM, PastRoute11HiddenMintBerry
	bg_event 26, 14, BGEVENT_ITEM, PastRoute11HiddenStarPiece

	db 8 ; object events
	object_event 25,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 34, 23, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute11QuickClaw, EVENT_ROUTE_11_PAST_QUICK_CLAW
	object_event 51,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute11FocusSash, EVENT_ROUTE_11_PAST_FOCUS_SASH
	object_event  1, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute11RageCandyBar, EVENT_ROUTE_11_PAST_RAGECANDYBAR
	object_event 56,  9, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CelebiEncounter1, EVENT_HIDE_AND_SEEK_CELEBI_2
