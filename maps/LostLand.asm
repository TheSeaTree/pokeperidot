	const_def 2 ; object constants
	const LOSTLAND_AERODACTYL
	const LOSTLAND_EGG
	const LOSTLAND_SCIENTIST1
	const LOSTLAND_SCIENTIST2
	const LOSTLAND_SCIENTIST3
	const LOSTLAND_SCIENTIST4
	const LOSTLAND_SCIENTIST5
	const LOSTLAND_SCIENTIST6
	const LOSTLAND_SCIENTIST7

LostLand_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene ; SCENE_LOSTLAND_DEFAULT
	scene_script .DummyScene ; SCENE_LOSTLAND_AERODACTYL
	scene_script .DummyScene ; SCENE_LOSTLAND_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall
	
.DummyScene:
	end

.SmashWall:
	checkevent EVENT_LOST_LAND_HIDDEN_CAVE_OPEN
	iffalse .done
	changeblock  4, 12, $54
.done
	return

LostLandAerodactyl:
	cry AERODACTYL
	showemote EMOTE_QUESTION, PLAYER, 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	moveobject LOSTLAND_AERODACTYL, 30, 9
	appear LOSTLAND_AERODACTYL
	playsound SFX_WING_ATTACK
	waitsfx
	special FadeInQuickly
	showemote EMOTE_SHOCK, PLAYER, 30
	opentext
	writetext LostLandAerodactylText
	cry AERODACTYL
	waitsfx
	closetext
	setlasttalked LOSTLAND_AERODACTYL
	loadwildmon AERODACTYL, 65
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	disappear LOSTLAND_AERODACTYL
	reloadmapafterbattle
	setevent EVENT_LOST_LAND_AERODACTYL
	setscene SCENE_LOSTLAND_FINISHED
	end

LostLandAerodactylEgg:
	opentext
	checkevent EVENT_LOST_LAND_GOT_OLD_AMBER
	iftrue .DontTouch
	checkevent EVENT_LOST_LAND_WAITING_OLD_AMBER
	iftrue .DontTouch
	writetext LostLandScientistStopPlayerText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .FacingRight
	ifequal DOWN, .FacingDown
	ifequal LEFT, .FacingLeft
	turnobject PLAYER, DOWN
	showemote EMOTE_QUESTION, PLAYER, 15
	moveobject LOSTLAND_SCIENTIST7, 30, 14
	appear LOSTLAND_SCIENTIST7
	applymovement LOSTLAND_SCIENTIST7, LostLandScientistEggApproachUp
	jump .Continue
.FacingRight
	turnobject PLAYER, DOWN
	showemote EMOTE_QUESTION, PLAYER, 15
	moveobject LOSTLAND_SCIENTIST7, 30, 13
	appear LOSTLAND_SCIENTIST7
	applymovement LOSTLAND_SCIENTIST7, LostLandScientistEggApproachRight
	jump .Continue
.FacingDown
	showemote EMOTE_QUESTION, PLAYER, 15
	moveobject LOSTLAND_SCIENTIST7, 30, 12
	appear LOSTLAND_SCIENTIST7
	applymovement LOSTLAND_SCIENTIST7, LostLandScientistEggApproachDown
	jump .Continue
.FacingLeft
	turnobject PLAYER, DOWN
	showemote EMOTE_QUESTION, PLAYER, 15
	moveobject LOSTLAND_SCIENTIST7, 31, 13
	appear LOSTLAND_SCIENTIST7
	applymovement LOSTLAND_SCIENTIST7, LostLandScientistEggApproachLeft
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
.Continue
	faceobject PLAYER, LOSTLAND_SCIENTIST7
	opentext
	writetext LostLandScientistCantTakeEggText
	waitbutton
	verbosegiveitem OLD_AMBER
	iffalse .NoRoom
	writetext LostLandScientistExplainOldAmber
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .ContinueLeave
	applymovement LOSTLAND_SCIENTIST7, LostLandScientistEggLeaveLeft
.ContinueLeave
	applymovement LOSTLAND_SCIENTIST7, LostLandScientistEggLeave
	disappear LOSTLAND_SCIENTIST7
	setevent EVENT_LOST_LAND_GOT_OLD_AMBER
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.NoRoom
	writetext LostLandScientistFailedGiveOldAmber
	waitbutton
	closetext
	applymovement LOSTLAND_SCIENTIST7, LostLandScientistEggLeave
	disappear LOSTLAND_SCIENTIST7
	setevent EVENT_LOST_LAND_WAITING_OLD_AMBER
	end

.DontTouch
	writetext LostLandAerodactylEggText
	waitbutton
	closetext
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
	setflag ENGINE_LOST_LAND_VISITED
	setscene SCENE_LOSTLAND_AERODACTYL
	end

LostLandScientistAfter:
	faceplayer
	opentext
	checkevent EVENT_LOST_LAND_GOT_OLD_AMBER
	iftrue .GotOldAmber
	checkevent EVENT_LOST_LAND_WAITING_OLD_AMBER
	iftrue .TryGiveOldAmber
.GotOldAmber
	writetext LostLandScientistAfterText
	waitbutton
	closetext
	end

.TryGiveOldAmber
	writetext LostLandScientistGiveOldAmberText
	verbosegiveitem OLD_AMBER
	iffalse .NoRoom
	writetext LostLandScientistExplainOldAmber
	waitbutton
	closetext
	setevent EVENT_LOST_LAND_GOT_OLD_AMBER
	end

.NoRoom
	writetext LostLandScientistBagStillFullText
	waitbutton
	closetext
	end

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

LostLandStarPiece:
	itemball STAR_PIECE

LostLandPlayerLeavesCave:
	step DOWN
	step_resume
	
LostLandScientistApproach:
	step LEFT
	step LEFT
	step LEFT
	step_end

LostLandScientistEggApproachUp:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_step RIGHT
	step_end

LostLandScientistEggApproachRight:
	step UP
	step UP
	step UP
	step UP
	step_end

LostLandScientistEggApproachDown:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_step RIGHT
	step_end

LostLandScientistEggApproachLeft:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_step UP
	step_end
LostLandScientistEggLeaveLeft:
	step LEFT
LostLandScientistEggLeave:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
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
	text "Our biggest disco-"
	line "very has been an"
	cont "AERODACTYL EGG."

	para "Can you imagine?"
	line "A brand-new EGG"
	cont "of an ancient"
	cont "#MON!"

	para "We haven't been"
	line "able to get very"
	cont "close to the EGG."

	para "As we learned,"
	line "AERODACTYL are"
	cont "very protective of"
	cont "their young."
	done
	
LostLandScientist2Text:
	text "Using DNA found in"
	line "FOSSILs, some"
	cont "scientists in far-"
	cont "away regions have"
	cont "been able to"
	cont "revive these"
	cont "ancient #MON."

	para "Studying them in a"
	line "lab is one thing,"
	cont "but we can observe"
	cont "them in their"
	cont "natural habitat!"
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

LostLandScientistStopPlayerText:
	text "Hey! Wait!"
	line "Don't touch that!"
	done

LostLandScientistCantTakeEggText:
	text "That EGG is the"
	line "first one we have"
	cont "ever encountered"
	cont "in the wild."

	para "I can't allow a"
	line "trainer to take it"
	cont "when we still have"
	cont "so many more tests"
	cont "to perform before"
	cont "it hatches."

	para "If you want your"
	line "own AERODACTYL to"
	cont "train, I can give"
	cont "you this item."
	done

LostLandScientistExplainOldAmber:
	text "There is a coll-"
	line "eague of ours in"
	cont "RUGOSA CITY who"
	cont "specializes in"
	cont "#MON FOSSILs."

	para "Last I heard, he"
	line "was working on a"
	cont "way to revive them"
	cont "into live #MON!"

	para "There is DNA of an"
	line "AERODACTYL inside"
	cont "that OLD AMBER."

	para "If anyone can do"
	line "something with it,"
	cont "he's the man!"
	done

LostLandScientistFailedGiveOldAmber:
	text "It seems you have"
	line "no room for this"
	cont "OLD AMBER."

	para "Come see me by the"
	line "entrance. I'll hold"
	cont "onto it for you."
	done

LostLandScientistGiveOldAmberText:
	text "There you are!"

	para "Here's the OLD"
	line "AMBER I was hold-"
	cont "ing onto for you."
	done

LostLandScientistBagStillFullText:
	text "What? You still"
	line "haven't made room"
	cont "for this?"

	para "What are you wait-"
	line "ing for?"
	done

LostLandAerodactylEggText:
	text "Better leave this"
	line "EGG alone."
	done

LostLand_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10, 31, REMNANT_CAVE_3F, 4
	warp_event 46,  9, LOST_LAND_CAVE_1F, 1
	warp_event 22, 15, LOST_LAND_CAVE_1F, 2
	warp_event  4, 13, LOST_LAND_HIDDEN_CAVE_1F, 1

	db 3 ; coord events
	coord_event 10, 32, SCENE_LOSTLAND_DEFAULT, LostLandScientist
	coord_event 30, 11, SCENE_LOSTLAND_AERODACTYL, LostLandAerodactyl
	coord_event 31, 11, SCENE_LOSTLAND_AERODACTYL, LostLandAerodactyl

	db 0 ; bg events

	db 10 ; object events
	object_event  0,  0, SPRITE_BIG_AERODACTYL, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, PAL_NPC_TREE, OBJECTTYPE_SCRIPT, 0, LostLandAerodactyl, EVENT_LOST_LAND_AERODACTYL
	object_event 31,  8, SPRITE_EGG, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LostLandAerodactylEgg, -1
	object_event 14, 32, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientistAfter, -1
	object_event 27, 30, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist2, -1
	object_event 33, 30, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist3, -1
	object_event 50, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist4, -1
	object_event 44, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist5, -1
	object_event 30, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LostLandScientist6, -1
	object_event  0,  0, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LostLandStarPiece, EVENT_LOST_LAND_STAR_PIECE
