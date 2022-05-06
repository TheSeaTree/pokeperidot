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
	priorityjump PowerPlantItemfinderEvent
	end

.DummyScene1:
	end

.CardKeyShutterCallback:
	changeblock  4,  8, $07 ; open shutter
	changeblock  4, 16, $72 ; open shutter
	changeblock  6, 16, $73 ; open shutter
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
	iftrue .AskRevive
	checkitem DOME_FOSSIL
	iftrue .AskRevive
	checkitem OLD_AMBER
	iftrue .AskRevive
	checkitem SABRE_FOSSIL
	iffalse .NoFossils
.AskRevive
	writetext FossilMenuText
	special SelectFossilsMenu
	ifequal HELIX_FOSSIL, ResurrectHelixFossil
	ifequal DOME_FOSSIL, ResurrectDomeFossil
	ifequal OLD_AMBER, ResurrectOldAmber
	ifequal SABRE_FOSSIL, ResurrectSabreFossil
.maybe_later
	writetext MaybeLaterText
	jump .end

.WaitingFossil
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NotDone
	writetext PowerPlantFossilGuyWaiting
	waitbutton
	checkevent EVENT_GAVE_DOME_FOSSIL
	iftrue .GiveKabuto
	checkevent EVENT_GAVE_OLD_AMBER
	iftrue .GiveAerodactyl	

;.GiveOmanyte
	pokenamemem OMANYTE, MEM_BUFFER_0
	writetext GiveRevivedFossilText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	pokenamemem OMANYTE, MEM_BUFFER_0
	writetext ReceiveRevivedFossilText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke OMANYTE, 30
	clearevent EVENT_GAVE_HELIX_FOSSIL
	jump .DoneFossil

.GiveKabuto
	pokenamemem KABUTO, MEM_BUFFER_0
	writetext GiveRevivedFossilText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	pokenamemem KABUTO, MEM_BUFFER_0
	writetext ReceiveRevivedFossilText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke KABUTO, 30
	clearevent EVENT_GAVE_DOME_FOSSIL
	jump .DoneFossil
	
.GiveAerodactyl
	pokenamemem OMANYTE, MEM_BUFFER_0
	writetext GiveRevivedFossilText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	pokenamemem AERODACTYL, MEM_BUFFER_0
	writetext ReceiveRevivedFossilText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke AERODACTYL, 40
	clearevent EVENT_GAVE_OLD_AMBER
.DoneFossil
	writetext PowerPlantFossilGuyThanks
	jump .end
	
.NotDone
	writetext PowerPlantFossilGuyWorking
	jump .end
	
.NoRoom
	writetext NoRoomForFossil
	jump .end
	
.NoFossils
	writetext NoFossilsText
.end
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end
	
ResurrectHelixFossil:
	itemtotext HELIX_FOSSIL, MEM_BUFFER_0
	writetext IdentifyFossilText
	waitbutton
	writetext AskResurrectFossilText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	takeitem HELIX_FOSSIL
	setevent EVENT_GAVE_HELIX_FOSSIL
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump FossilResurrectionGuy.NotDone
	
ResurrectDomeFossil:
	itemtotext DOME_FOSSIL, MEM_BUFFER_0
	writetext IdentifyFossilText
	waitbutton
	writetext AskResurrectFossilText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	takeitem DOME_FOSSIL
	setevent EVENT_GAVE_DOME_FOSSIL
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump FossilResurrectionGuy.NotDone
	
ResurrectOldAmber:
	itemtotext OLD_AMBER, MEM_BUFFER_0
	writetext IdentifyOldAmberText
	waitbutton
	writetext AskResurrectFossilText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	takeitem OLD_AMBER
	setevent EVENT_GAVE_OLD_AMBER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump FossilResurrectionGuy.NotDone

ResurrectSabreFossil:
	
	itemtotext SABRE_FOSSIL, MEM_BUFFER_0
	writetext IdentifyFossilText
	waitbutton
	checkevent EVENT_SKELEGON_BATTLED
	iftrue .NotFirstTime
	writetext AskResurrectFossilText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	writetext SabreFossilResurrectionText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	playsound SFX_TRANSACTION
	waitsfx
	opentext
	writetext SabreFossilExaminationText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, POWERPLANT1FB_SCIENTIST2, 15
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	opentext
	writetext SabreFossilAlarmText
	waitbutton
	closetext
	scall .PitchBlack
	opentext
	writetext SkelegonCryText
	cry SKELEGON
	waitsfx
	loadwildmon SKELEGON, 45
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	takeitem SABRE_FOSSIL
	setevent EVENT_SKELEGON_BATTLED
	faceplayer
	opentext
	writetext SabreFossilAfterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.PitchBlack
	jumpstd darkenroom
	end

.NotFirstTime
	writetext AskResurrectSabreFossilText
	yesorno
	iffalse FossilResurrectionGuy.maybe_later
	writetext SabreFossilResurrectionText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	opentext
	writetext SabreFossilGetReadyText
	waitbutton
	closetext
	scall .PitchBlack
	opentext
	writetext SkelegonCryText
	cry SKELEGON
	waitsfx
	loadwildmon SKELEGON, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	takeitem SABRE_FOSSIL
	faceplayer
	opentext
	writetext SabreFossilRematchAfterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

PowerPlantItemfinderEvent:
	pause 8
	opentext
	writetext MahoganyTownPowerPlantCompleted
	buttonsound
	verbosegiveitem ITEMFINDER
	writetext MahoganyTownPowerPlantAfterItemfinder
	buttonsound
	setscene SCENE_FINISHED
	setevent EVENT_POWER_PLANT_1F_MUK
	setevent EVENT_RETURNED_MACHINE_PART
	closetext
	applymovement POWERPLANT1FB_ADMIN, PowerPlantAdminWalkAway
	disappear POWERPLANT1FB_ADMIN
	end

PowerPlantAdmin:
	jumptextfaceplayer MahoganyTownPowerPlantAfterItemfinder
	
PowerPlant1FBreakGuyScript:
	jumptextfaceplayer PowerPlant1FBreakGuyText
	
PowerPlant1FNamelessScript:
	jumptextfaceplayer PowerPlant1FNamelessText
	
PowerPlant1FHardWorkerScript:
	jumptextfaceplayer PowerPlant1FHardWorkerText
	
PowerPlant1FMonitorScript:
	jumptextfaceplayer PowerPlant1FMonitorText

PowerPlant1FWaterCoolingGuy:
	jumptextfaceplayer PowerPlant1FWaterCoolingGuyText

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
	line "I promised you."
	
	para "It's an"
	line "ITEMFINDER!"
	done

MahoganyTownPowerPlantAfterItemfinder:
	text "This tool can"
	line "detect any hidden"
	cont "items that are"
	cont "nearby."

	para "It's very handy"
	line "for trainers who"
	cont "aren't good at"
	cont "finding secrets"
	cont "on their own."

	para "I'm sorry to cut"
	line "this short, but I"
	cont "have so much work"
	cont "to catch up on."

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
	
IdentifyOldAmberText:
	text "Oh, you have an"
	line "OLD AMBER?"
	done
	
IdentifyFossilText:
	text "Oh, you have a"
	line "@"
	text_ram wStringBuffer3
	text "?"
	done

AskResurrectFossilText:
	text "Would you like me"
	line "to try and revive"
	cont "it into a #MON?"
	done

FossilMenuText:
	text "Do you have any"
	line "FOSSILS you could"
	cont "give to me?"
	
	para "Please note that"
	line "I can only revive"
	cont "one at a time."
	done
	
MaybeLaterText:
	text "Do you still want"
	line "to hold onto your"
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
	
SabreFossilResurrectionText:
	text "Okay, let me just"
	line "get this into the"
	cont "machine to examine"
	cont "it…"
	done
	
SabreFossilExaminationText:
	text "Hm…"
	
	para "I've never seen a"
	line "fossil quite like"
	cont "this one before…"
	done
	
SabreFossilAlarmText:
	text "…Something's not"
	line "right here-"
	done

SkelegonCryText:
	text "Gwaaah!"
	done
	
SabreFossilAfterText:
	text "Woah!"
	
	para "It looked like a"
	line "GHOST #MON was"
	cont "inhabiting that"
	cont "FOSSIL!"
	
	para "It must not have"
	line "liked being put"
	cont "into the machine."
	
	para "Thank you for"
	line "that!"
	
	para "If you weren't here"
	line "to stop it, I"
	cont "would have been a"
	cont "goner!"
	
	para "While that was a"
	line "frightening exper-"
	cont "ience, I will not"
	cont "allow it to deter"
	cont "my research!"
	
	para "I will continue to"
	line "accept FOSSILs,"
	cont "but you need to"
	cont "promise to stop"
	cont "any that become"
	cont "rampant!"
	done
	
PowerPlantFossilGuyWaiting:
	text "There you are!"
	
	para "My experiment was"
	line "a success!"
	done

GiveRevivedFossilText:
	text "I resurrected your"
	line "FOSSIL into a"
	cont "living @"
	text_ram wStringBuffer3
	text "!"
	
	para "Isn't that amazi-"
	line "ng? I'm sure you"
	cont "will want it now."
	done

ReceiveRevivedFossilText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
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

AskResurrectSabreFossilText:
	text "The SKELEGON resu-"
	line "rrected from this"
	cont "FOSSIL may react"
	cont "violently to us."

	para "Are you prepared"
	line "for a battle?"
	done

ResurrectSabreFossilText:
	text "Okay, let me just"
	line "put this into the"
	cont "machine…"
	done

SabreFossilGetReadyText:
	text "Okay, here it"
	line "comes!"
	done

SabreFossilRematchAfterText:
	text "I will never get"
	line "used to how feroc-"
	cont "ious that #MON"
	cont "can be!"

	para "You're really some-"
	line "thing for being"
	cont "able to battle it!"
	done

PowerPlant1FBreakGuyText:
	text "Welcome to the"
	line "POWER PLANT!"
	
	para "Apologies, I can't"
	line "help you. I'm on"
	cont "break right now."
	
	para "It's important to"
	line "get some time away"
	cont "from the screen"
	cont "every once in a"
	cont "while."
	done
	
PowerPlant1FNamelessText:
	text "The guy at the"
	line "next desk over is"
	cont "a real workaholic!"
	
	para "I ask him to lunch"
	line "every now & then,"
	cont "but he refuses to"
	cont "leave his desk."
	
	para "It can't be"
	line "healthy for him."
	done
	
PowerPlant1FHardWorkerText:
	text "Please, leave me"
	line "be. I am working"
	cont "on an important"
	cont "project right now,"
	cont "and must focus."
	done
	
PowerPlant1FMonitorText:
	text "I monitor the gen-"
	line "erator's activity"
	cont "from this PC."
	
	para "I'm also closest"
	cont "to the door just"
	cont "in case anything"
	cont "goes wrong."
	done
	
PowerPlant1FWaterCoolingGuyText:
	text "The generators run"
	line "so hot that we"
	cont "needed to submerge"
	cont "them in water to"
	cont "keep cool."
	
	para "GRIMER must have"
	line "been attracted to"
	cont "the warm water."
	done

PowerPlant1FB_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 21, RUGOSA_CITY, 3
	warp_event  6, 21, RUGOSA_CITY, 11
	warp_event 25, 20, POWER_PLANT_2F_B, 1
	warp_event  3, 10, POWER_PLANT_2F_B, 2

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  6, 20, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlantAdmin, EVENT_RETURNED_MACHINE_PART
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBHyperPotion, EVENT_POWER_PLANT_HYPER_POTION
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBMetalCoat, EVENT_POWER_PLANT_METAL_COAT
	object_event  0, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBPPUp, EVENT_POWER_PLANT_PP_UP
	object_event  7, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant1FBreakGuyScript, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FossilResurrectionGuy, -1 ; Fossil Guy
	object_event 24, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant1FNamelessScript, -1
	object_event 28, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant1FHardWorkerScript, -1
	object_event 16, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant1FMonitorScript, -1
	object_event 14, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant1FWaterCoolingGuy, -1
