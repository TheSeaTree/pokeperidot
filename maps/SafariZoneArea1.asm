	const_def 2 ; object constants

SafariZoneArea1_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRestHouse
	callback MAPCALLBACK_TILES, .Fence
	
.ClearRestHouse:
	clearflag ENGINE_SAFARI_REST_HOUSE
	return

.Fence:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Change
	return

.Change:
	changeblock  0, 10, $15
	changeblock  0, 12, $02
	changeblock  0, 20, $7e
	changeblock  0, 22, $02
	changeblock  2, 12, $7e
	changeblock  2, 20, $7d
	return

SafariZoneArea1MoonStone:
	itemball MOON_STONE

SafariZoneArea1WaterStone:
	itemball MOON_STONE

SafariZoneArea1ScopeLens:
	itemball SCOPE_LENS

SafariZoneArea1FullRestore:
	itemball FULL_RESTORE

SafariZoneArea1PokeDoll:
	itemball POKE_DOLL

SafariZoneArea1HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_SAFARI_ZONE_AREA_2_HIDDEN_FULL_HEAL
	
SafariZoneArea1HiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_SAFARI_ZONE_AREA_2_HIDDEN_GOLD_LEAF

SafariZoneArea1Sign:
	jumptext SafariZoneArea1SignText

SafariZoneArea1RestHouseSign:
	jumptext SafariZoneArea1RestHouseSignText
	
SafariZoneArea1ConstructionSign:
	conditional_event EVENT_BEAT_ELITE_FOUR, .Script

.Script:
	jumptext SafariZoneArea1ConstructionSignText
	
SafariZoneArea1SignText:
	text "SAFARI ZONE-"
	line "AREA 1"
	done

SafariZoneArea1RestHouseSignText:
	text "REST HOUSE"
	done
	
SafariZoneArea1ConstructionSignText:
	text "Construction on"
	line "SAFARI ZONE AREA"
	cont "5 and AREA 6 has"
	cont "begun."
	
	para "Please check back"
	line "later."
	done

SafariZoneArea1_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 32, 33, SAFARI_ZONE_GATE_1F, 3
	warp_event 33, 33, SAFARI_ZONE_GATE_1F, 3
	warp_event 27, 29, SAFARI_ZONE_AREA_1_REST_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 34, 28, BGEVENT_READ, SafariZoneArea1Sign
	bg_event 16,  6, BGEVENT_READ, SafariZoneArea1Sign
	bg_event 28, 30, BGEVENT_READ, SafariZoneArea1RestHouseSign
	bg_event  3, 21, BGEVENT_IFNOTSET, SafariZoneArea1ConstructionSign
	bg_event  2, 12, BGEVENT_IFNOTSET, SafariZoneArea1ConstructionSign
	bg_event 24, 12, BGEVENT_ITEM, SafariZoneArea1HiddenFullHeal
	bg_event 14,  2, BGEVENT_ITEM, SafariZoneArea1HiddenGoldLeaf

	db 5 ; object events
	object_event 28, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea1MoonStone, EVENT_SAFARI_ZONE_MOON_STONE
	object_event 33, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea1WaterStone, EVENT_SAFARI_ZONE_WATER_STONE
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea1FullRestore, EVENT_SAFARI_ZONE_FULL_RESORE
	object_event 27,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea1ScopeLens, EVENT_SAFARI_ZONE_SCOPE_LENS
	object_event  6,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea1PokeDoll, EVENT_SAFARI_ZONE_POKE_DOLL
