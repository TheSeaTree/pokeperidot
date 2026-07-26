	const_def 2 ; object constants

BoreasCompoundB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LightSwitch

.LightSwitch
	checkflag ENGINE_FLASH
	iffalse .Skip
	changeblock 10, 12, $c3
.Skip
	return

BoreasCompoundPowerSwitch:
	opentext
	checkflag ENGINE_FLASH
	iftrue .LightsOn
	writetext BoreasCompoundPowerSwitchText
	yesorno
	iffalse .no
	writetext BoreasCompoundFlipPowerSwitchText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 12, $c3
	reloadmappart
	closetext
	earthquake 24
	playsound SFX_WARP_TO
	scall BoreasCompoundLightUpRoom
	waitsfx
	special FadeInQuickly
	opentext
	writetext BoreasCompoundPowerBackOnText
	waitbutton
.no
	closetext
	end

.LightsOn
	writetext BoreasCompoundPowerAlreadyOnText
	waitbutton
	closetext
	end

BoreasCompoundLightUpRoom:
	jumpstd lightuproom
	end

BoreasCompoundB1FNugget:
	itemball NUGGET

BoreasCompoundB1FMaxRevive:
	itemball MAX_REVIVE

BoreasCompoundB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_BOREAS_COMPOUND_HIDDEN_RARE_CANDY

BoreasCompoundPowerSwitchText:
	text "This switch is"
	line "labeled “BACKUP"
	cont "GENERATOR.”"

	para "Flip it?"
	done

BoreasCompoundFlipPowerSwitchText:
	text "Who wouldn't?"
	done

BoreasCompoundPowerBackOnText:
	text "The power came"
	line "back on!"
	done

BoreasCompoundPowerAlreadyOnText:
	text "The switch won't go"
	line "back up."
	done

BoreasCompoundB1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 35, 15, BOREAS_COMPOUND_1F, 3
	warp_event 22,  8, BOREAS_COMPOUND_1F, 4
	warp_event 14,  5, BOREAS_COMPOUND_1F, 5
	warp_event  3,  0, BOREAS_COMPOUND_1F, 6
	warp_event 27,  6, BOREAS_COMPOUND_1F, 11
	warp_event 30,  7, BOREAS_COMPOUND_1F, 12
	warp_event 28, 10, BOREAS_COMPOUND_1F, 13
	
	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 12, BGEVENT_UP, BoreasCompoundPowerSwitch
	bg_event 20, 14, BGEVENT_ITEM, BoreasCompoundB1FHiddenRareCandy

	db 2 ; object events
	object_event 0, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoreasCompoundB1FNugget, EVENT_BOREAS_COMPOUND_NUGGET
	object_event 15,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoreasCompoundB1FMaxRevive, EVENT_BOREAS_COMPOUND_MAX_REVIVE
