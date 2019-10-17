	const_def 2 ; object constants
	const POWERPLANT1FB_ADMIN
	const POWERPLANT1FB_POKEBALL1
	const POWERPLANT1FB_POKEBALL2
	const POWERPLANT1FB_POKEBALL3
	const POWERPLANT1FB_SCIENTIST1
	const POWERPLANT1FB_SCIENTIST2
	const POWERPLANT1FB_SCIENTIST3
	const POWERPLANT1FB_SCIENTIST4
	const POWERPLANT1FB_SCIENTIST5
	const POWERPLANT1FB_SCIENTIST6

PowerPlant1FB_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.DummyScene0:
	priorityjump PowerPlantPassEvent
	end

.DummyScene1:
	end

.CardKeyShutterCallback:
	changeblock  4,  8, $07 ; open shutter
	return
	
FossilResurrectionGuy:
	faceplayer
	opentext
	checkevent EVENT_GAVE_HELIX_FOSSIL
	iftrue .WaitingFossil
	checkevent EVENT_GAVE_DOME_FOSSIL
	iftrue .WaitingFossil
	checkevent EVENT_GAVE_OLD_AMBER
	iftrue .WaitingFossil
	writetext PowerPlantFossilGuyIntroText
	waitbutton
	checkitem HELIX_FOSSIL
	iftrue .own_helix
	checkitem DOME_FOSSIL
	iftrue .own_dome
	checkitem OLD_AMBER
	iftrue .ask_old_amber
	writetext NoFossilsText
	waitbutton
	closetext
	end

.own_helix
	checkitem DOME_FOSSIL
	iftrue .own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_amber
	writetext AskHelixFossilText
	yesorno
	iftrue ResurrectHelixFossil
	jump .maybe_later

.own_dome
	checkitem OLD_AMBER
	iftrue .ask_dome_amber
	writetext AskDomeFossilText
	yesorno
	iftrue ResurrectDomeFossil
	jump .maybe_later

.own_helix_and_dome
	writetext AskMultipleFossilText
	checkitem OLD_AMBER
	iftrue .ask_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequal 1, ResurrectHelixFossil
	ifequal 2, ResurrectDomeFossil
	jump .maybe_later

.ask_old_amber
	writetext AskOldAmberText
	yesorno
	iftrue ResurrectOldAmber
	jump .maybe_later

.ask_helix_amber
	writetext AskMultipleFossilText
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal 1, ResurrectHelixFossil
	ifequal 2, ResurrectOldAmber
	jump .maybe_later

.ask_dome_amber
	writetext AskMultipleFossilText
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal 1, ResurrectDomeFossil
	ifequal 2, ResurrectOldAmber
	jump .maybe_later

.ask_helix_dome_amber
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal 1, ResurrectHelixFossil
	ifequal 2, ResurrectDomeFossil
	ifequal 3, ResurrectOldAmber
.maybe_later
	writetext MaybeLaterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end
	
.WaitingFossil
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NotDone
	writetext PowerPlantFossilGuyWaiting
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	checkevent EVENT_GAVE_DOME_FOSSIL
	iftrue .GiveKabuto
	checkevent EVENT_GAVE_OLD_AMBER
	iftrue .GiveAerodactyl	

	givepoke OMANYTE, 30
	clearevent EVENT_GAVE_HELIX_FOSSIL
	jump .DoneFossil

.GiveKabuto
	givepoke KABUTO, 30
	clearevent EVENT_GAVE_DOME_FOSSIL
	jump .DoneFossil
	
.GiveAerodactyl
	givepoke AERODACTYL, 40
	clearevent EVENT_GAVE_OLD_AMBER
.DoneFossil
	writetext PowerPlantFossilGuyThanks
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end
	
.NotDone
	writetext PowerPlantFossilGuyWorking
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end
	
.NoRoom
	writetext NoRoomForFossil
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

HelixDomeMenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 5
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "HELIX FOSSIL@"
	db "DOME FOSSIL@"

HelixAmberMenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 5
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "HELIX FOSSIL@"
	db "OLD AMBER@"

DomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 5
	dw .MenuData2
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "DOME FOSSIL@"
	db "OLD AMBER@"

HelixDomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 7
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "HELIX FOSSIL@"
	db "DOME FOSSIL@"
	db "OLD AMBER@"

ResurrectHelixFossil:
	writetext AskHelixFossilText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	takeitem HELIX_FOSSIL
	setevent EVENT_GAVE_HELIX_FOSSIL
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump FossilResurrectionGuy.NotDone
	
ResurrectDomeFossil:
	writetext AskDomeFossilText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	takeitem DOME_FOSSIL
	setevent EVENT_GAVE_DOME_FOSSIL
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump FossilResurrectionGuy.NotDone
	
ResurrectOldAmber:
	writetext AskOldAmberText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	takeitem OLD_AMBER
	setevent EVENT_GAVE_OLD_AMBER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump FossilResurrectionGuy.NotDone

PowerPlantPassEvent:
	pause 8
	opentext
	writetext MahoganyTownPowerPlantCompleted
	buttonsound
	verbosegiveitem PASS
	writetext MahoganyTownPowerPlantAfterPass
	buttonsound
	setscene SCENE_FINISHED
	setevent EVENT_POWER_PLANT_1F_MUK
	setevent EVENT_RETURNED_MACHINE_PART
	closetext
	applymovement POWERPLANT1FB_ADMIN, PowerPlantAdminWalkAway
	disappear POWERPLANT1FB_ADMIN
	end

PowerPlantAdmin:
	jumptextfaceplayer MahoganyTownPowerPlantAfterPass

PowerPlantBMetalCoat:
	itemball METAL_COAT
	
PowerPlantBHyperPotion:
	itemball HYPER_POTION
	
PowerPlantBPPUp:
	itemball PP_UP
	
PowerPlantAdminWalkAway:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MahoganyTownPowerPlantCompleted:
	text "This is much"
	line "better!"
	
	para "Here is the reward"
	line "I promised inside."
	
	para "It's a PASS to"
	line "ride the SUBWAY to"
	cont "PECTINIA CITY."
	done
	
MahoganyTownPowerPlantAfterPass:
	text "I have so much"
	line "work to catch up"
	cont "on now, that I"
	cont "doubt I will find"
	cont "the time for a"
	cont "vacation any time"
	cont "soon."
	
	para "You helped the"
	line "city so much"
	cont "that you deserve"
	cont "to use the TRAIN"
	cont "as often as you"
	cont "would like."
	
	para "Now if you don't"
	line "mind, I have lots"
	cont "of work ahead of"
	cont "me."
	
	para "You're welcome to"
	line "visit me in my"
	cont "office now that"
	cont "we have everything"
	cont "up and running"
	cont "once more."
	done
	
PowerPlantFossilGuyIntroText:
	text "Oh, hello there."
	
	para "I am researching"
	line "a method to revive"
	cont "an extinct #MON"
	cont "using DNA found in"
	cont "its FOSSIL."
	done
	
NoFossilsText:
	text "FOSSILS can be"
	line "very rare. I have"
	cont "only seen a few in"
	cont "my entire life!"
	done
	
AskHelixFossilText:
	text "Oh, you have a"
	line "HELIX FOSSIL?"
	
	para "Would you like me"
	line "to try and revive"
	cont "it into a #MON?"
	done
	
AskDomeFossilText:
	text "Oh, you have a"
	line "DOME FOSSIL?"
	
	para "Would you like me"
	line "to try and revive"
	cont "it into a #MON?"
	done
	
AskOldAmberText:
	text "Oh, you have an"
	line "OLD AMBER?"
	
	para "Would you like me"
	line "to try and revive"
	cont "it into a #MON?"
	done
	
AskMultipleFossilText:
	text "Do you have any"
	line "FOSSILS you could"
	cont "give to me?"
	
	para "Please note that"
	line "I can only revive"
	cont "one at a time."
	done
	
MaybeLaterText:
	text "Do you still want"
	line "to hold onto that"
	cont "FOSSIL?"
	
	para "No problem. If you"
	line "change your mind,"
	cont "come see me."
	done
	
PowerPlantFossilGuyWorking:
	text "This kind of thing"
	line "can take a while."
	
	para "Go for a walk or"
	line "something, maybe" 
	cont "make some room in"
	cont "your party."
	
	para "I'll be done when"
	line "you get back."
	done
	
PowerPlantFossilGuyWaiting:
	text "There you are!"
	
	para "My test was a"
	line "success!"
	
	para "I resurrected your"
	line "FOSSIL into a"
	cont "living #MON!"
	done
	
NoRoomForFossil:
	text "…But you have no"
	line "room to take this"
	cont "#MON with you."
	
	para "Go deposit"
	line "something in the"
	cont "PC. Your #MON"
	cont "is safe with me"
	cont "until then."
	done
	
PowerPlantFossilGuyThanks:
	text "I can not thank"
	line "you enough for the"
	cont "help you have"
	cont "given me for my"
	cont "research!"
	done

PowerPlant1FB_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 21, MAHOGANY_TOWN, 3
	warp_event  6, 21, MAHOGANY_TOWN, 3
	warp_event 25, 20, POWER_PLANT_2F_B, 1
	warp_event  3, 10, POWER_PLANT_2F_B, 2

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  6, 20, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RETURNED_MACHINE_PART
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBHyperPotion, EVENT_POWER_PLANT_HYPER_POTION
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBMetalCoat, EVENT_POWER_PLANT_METAL_COAT
	object_event  0, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBPPUp, EVENT_POWER_PLANT_PP_UP
	object_event  7, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FossilResurrectionGuy, -1 ; Fossil Guy
	object_event 24, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 16, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
