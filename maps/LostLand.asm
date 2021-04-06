	const_def 2 ; object constants
	const LOSTLAND_AERODACTYL
	const LOSTLAND_SCIENTIST1
	const LOSTLAND_SCIENTIST2
	const LOSTLAND_SCIENTIST3
	const LOSTLAND_SCIENTIST4

LostLand_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0
	scene_script .DummyScene1

	db 0 ; callbacks
	
.DummyScene0:
	end
	
.DummyScene1:
	end

LostLandAerodactyl:
	opentext
	writetext LostLandAerodactylText
	cry AERODACTYL
	waitbutton
	closetext
	loadwildmon AERODACTYL, 45
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	end
	
LostLandScientist:
	turnobject LOSTLAND_SCIENTIST1, LEFT
	showemote EMOTE_SHOCK, LOSTLAND_SCIENTIST1, 15
	opentext
	writetext LostLandScientistGreetText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement LOSTLAND_SCIENTIST1, LostLandScientistApproach
	opentext
	writetext LostLandScientistExplainText
	waitbutton
	writetext LostLandScientistAfterText
	waitbutton
	closetext
	applymovement LOSTLAND_SCIENTIST1, LostLandScientistEnd
	setscene SCENE_FINISHED
	end
	
LostLandScientistAfter:
	jumptextfaceplayer LostLandScientistAfterText

LostLandScientist2:
	jumptextfaceplayer LostLandScientist2Text

LostLandScientist3:
	jumptextfaceplayer LostLandScientist3Text
	
LostLandScientist4:
	jumptextfaceplayer LostLandScientist4Text
	
LostLandScientist5:
	jumptextfaceplayer LostLandScientist5Text
	
LostLandScientist6:
	jumptextfaceplayer LostLandScientist6Text
	
LostLandPlayerLeavesCave:
	step DOWN
	step_resume
	
LostLandScientistApproach:
	step LEFT
	step LEFT
	step LEFT
	step_end
	
LostLandScientistEnd:
	step_resume

LostLandAerodactylText:
	text "AERODACTYL:"
	line "Scree-ee!"
	done
	
LostLandScientistGreetText:
	text "Oh, hello there!"
	done
	
LostLandScientistExplainText:
	text "Welcome to what I"
	line "have taken to"
	cont "calling the"
	cont "LOST LAND!"
	
	para "This is a place"
	line "where #MON once"
	cont "thought to be"
	cont "extinct have"
	cont "stayed untouched"
	cont "by time for"
	cont "centuries!"

	para "My team is"
	line "researching the"
	cont "ancient #MON"
	cont "that live here."
	done

LostLandScientistAfterText:
	text "Other than"
	line "AERODACTYL, We"
	cont "have discovered"
	cont "other ancient"
	cont "#MON thriving"
	cont "here as well."
	
	para "I promise I will"
	line "make it worth your"
	cont "while as well!"
	done
	
LostLandScientist2Text:
	text "Using DNA found in"
	line "OLD AMBER, some"
	cont "scientists have"
	cont "been able to"
	cont "revive AERODACTYL."
	
	para "They were thought"
	line "to have been"
	cont "extinct for"
	cont "centuries. Nobody"
	cont "has ever seen one"
	cont "in its natural"
	cont "habitat!"
	done
	
LostLandScientist3Text:
	text "The #MON here"
	line "are likely to be"
	cont "very skittish, as"
	cont "they have never"
	cont "come in contact"
	cont "with people."
	done
	
LostLandScientist4Text:
	text "If you will share"
	line "any of your find-"
	cont "ings with us, it"
	cont "will greatly"
	cont "assist in our"
	cont "research!"
	done

LostLandScientist5Text:
	text "A new face!"

	para "Do you have any"
	line "discoveries to"
	cont "share with us?"
	done

LostLandScientist6Text:
	text "My TOWN MAP gets"
	line "all messed up when"
	cont "we're here."
	
	para "The signal to the"
	line "global positioning"
	cont "satellite must be"
	cont "too weak."
	
	para "…It's spooky think-"
	line "ing about being"
	cont "all alone."
	
	para "We're the only"
	line "people who know"
	cont "this place exists."
	done

LostLand_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8, 31, SEA_ROUTE_2, 1 ;Entrance
	warp_event 44,  9, CHARCOAL_KILN, 1 ;Puzzle Chamber
	warp_event  6, 11, CHARCOAL_KILN, 1 ;Unown Chamber, Change the block here to a cave entrance when the Unown are unlocked.

	db 0 ; coord events
;	coord_event  8, 32, SCENE_DEFAULT, LostLandScientist

	db 0 ; bg events

	db 7 ; object events
	object_event  29,  9, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LostLandAerodactyl, -1
	object_event 12, 32, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientistAfter, -1
	object_event 25, 30, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist2, -1
	object_event 31, 30, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist3, -1
	object_event 48, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist4, -1
	object_event 42, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist5, -1
	object_event 28, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist6, -1
