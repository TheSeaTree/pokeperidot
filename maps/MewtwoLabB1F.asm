	const_def 2 ; object constants

MewtwoLabB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LightSwitch

.LightSwitch
	checkflag ENGINE_FLASH
	iffalse .Skip
	changeblock 10, 12, $c3
.Skip
	return

MewtwoLabPowerSwitch:
	opentext
	checkflag ENGINE_FLASH
	iftrue .LightsOn
	writetext MewtwoLabPowerSwitchText
	yesorno
	iffalse .no
	writetext MewtwoLabFlipPowerSwitchText
	waitbutton
	closetext
	changeblock 10, 12, $c3
	reloadmappart
	playsound SFX_ENTER_DOOR
	waitsfx
	earthquake 24
	playsound SFX_WARP_TO
	scall MewtwoLabLightUpRoom
	waitsfx
	special FadeInQuickly
	opentext
	writetext MewtwoLabPowerBackOnText
	waitbutton
.no
	closetext
	end

.LightsOn
	writetext MewtwoLabPowerAlreadyOnText
	waitbutton
	closetext
	end

MewtwoLabLightUpRoom:
	jumpstd lightuproom
	end

MewtwoLabB1FNugget:
	itemball NUGGET

MewtwoLabB1FMaxRevive:
	itemball MAX_REVIVE

MewtwoLabB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_MEWTWO_LAB_HIDDEN_RARE_CANDY

MewtwoLabPowerSwitchText:
	text "This switch is"
	line "labeled “BACKUP"
	cont "GENERATOR.”"

	para "Flip it?"
	done

MewtwoLabFlipPowerSwitchText:
	text "Who wouldn't?"
	done

MewtwoLabPowerBackOnText:
	text "The power came"
	line "back on!"
	done

MewtwoLabPowerAlreadyOnText:
	text "The switch won't go"
	line "back up."
	done

MewtwoLabB1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 35, 15, MEWTWO_LAB_1F, 3
	warp_event 22,  8, MEWTWO_LAB_1F, 4
	warp_event 14,  5, MEWTWO_LAB_1F, 5
	warp_event  3,  0, MEWTWO_LAB_1F, 6
	warp_event 27,  6, MEWTWO_LAB_1F, 11
	warp_event 30,  7, MEWTWO_LAB_1F, 12
	warp_event 28, 10, MEWTWO_LAB_1F, 13
	
	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 12, BGEVENT_UP, MewtwoLabPowerSwitch
	bg_event 20, 14, BGEVENT_ITEM, MewtwoLabB1FHiddenRareCandy

	db 2 ; object events
	object_event 0, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MewtwoLabB1FNugget, EVENT_MEWTWO_LAB_NUGGET
	object_event 15,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MewtwoLabB1FMaxRevive, EVENT_MEWTWO_LAB_MAX_REVIVE
