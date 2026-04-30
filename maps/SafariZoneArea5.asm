	const_def 2 ; object constants

SafariZoneArea5_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Fence

.Fence:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Change
	return

.Change:
	changeblock  30, 12, $15
	changeblock  30, 14, $02
	changeblock  30, 22, $7e
	changeblock  30, 24, $02
	return

SafariZoneArea5Sign:
	jumptext SafariZoneArea5SignText

SafariZoneArea5RestHouseSign:
	jumptext SafariZoneArea5RestHouseSignText

SafariZoneArea5BigMushroom:
	itemball BIG_MUSHROOM

SafariZoneArea5HiddenLeftovers:
	hiddenitem LEFTOVERS, EVENT_SAFARI_ZONE_AREA_5_HIDDEN_LEFTOVERS

SafariZoneArea5HiddenSilverLeaf
	hiddenitem SILVER_LEAF, EVENT_SAFARI_ZONE_AREA_5_HIDDEN_SILVER_LEAF

SafariZoneArea5SignText:
	text "SAFARI ZONE-"
	line "AREA 5"
	done
	
SafariZoneArea5RestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneArea5_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19,  3, SAFARI_ZONE_AREA_5_REST_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 24, 14, BGEVENT_READ, SafariZoneArea5Sign
	bg_event 14, 22, BGEVENT_READ, SafariZoneArea5Sign
	bg_event 20,  4, BGEVENT_READ, SafariZoneArea5RestHouseSign
	bg_event 27, 20, BGEVENT_ITEM, SafariZoneArea5HiddenLeftovers
	bg_event  2, 14, BGEVENT_ITEM, SafariZoneArea5HiddenSilverLeaf

	db 1 ; object events
	object_event  0, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneArea5BigMushroom, EVENT_SAFARI_ZONE_BIG_MUSHROOM
