	const_def 2 ; object constants
	const PASTPECTINIACITY_COOLTRAINERF
	const PASTPECTINIACITY_MOLTRES
	const PASTPECTINIACITY_TWIN
	const PASTPECTINIACITY_SUPER_NERD
	const PASTPECTINIACITY_GROWLITHE
	const PASTPECTINIACITY_POKEFANM
	const PASTPECTINIACITY_SAILOR1
	const PASTPECTINIACITY_SAILOR2
	const PASTPECTINIACITY_MACHOP
	const PASTPECTINIACITY_CELEBI
	const PASTPECTINIACITY_COOLTRAINERM
	const PASTPECTINIACITY_FRUIT_TREE1
	const PASTPECTINIACITY_FRUIT_TREE2
	const PASTPECTINIACITY_FRUIT_TREE3
	const PASTPECTINIACITY_FRUIT_TREE4

PastPectiniaCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Flowers

.Flowers
	checkevent EVENT_BOSS_CELEBI_AVAILABLE
	iffalse .Nothing
	changeblock 48, 18, $04
	changeblock 50, 18, $04
	changeblock 48, 20, $04
	changeblock 50, 22, $04
	changeblock 52, 22, $04
	changeblock 48, 24, $04
	changeblock 52, 26, $04
	changeblock 48, 28, $04
	changeblock 54, 28, $04
.Nothing
	return

PastPectiniaCooltrainerF:
	jumptextfaceplayer PastPectiniaCooltrainerFText

PastPectiniaTwin:
	jumptextfaceplayer PastPectiniaTwinText

PastPectiniaSuperNerd:
	jumptextfaceplayer PastPectiniaSuperNerdText

PastPectiniaCityWorker:
	jumptextfaceplayer PastPectiniaCityWorkerText

PastPectiniaNoctowl:
	opentext
	writetext PastPectiniaNoctowlText
	cry NOCTOWL
	waitbutton
	closetext
	end

PastPectiniaNidoran:
	opentext
	writetext PastPectiniaNidoranText
	cry NIDORAN_M
	waitbutton
	closetext
	end

CelebiEncounter2:
	showemote EMOTE_SHOCK, PASTPECTINIACITY_CELEBI, 15
	scall PastPectiniaCelebiEncounter
	special FadeOutPalettes
	playsound SFX_WARP_TO
	changeblock 48, 18, $04
	changeblock 50, 18, $04
	changeblock 48, 20, $04
	changeblock 50, 22, $04
	changeblock 52, 22, $04
	changeblock 48, 24, $04
	changeblock 52, 26, $04
	changeblock 48, 28, $04
	changeblock 54, 28, $04
	reloadmap
	waitsfx

;	Text box mentioning a white flash/the flowers coming to life?
;	Flowers already in bloom even before the event?

;	special FadeInPalettes
	applymovement PASTPECTINIACITY_CELEBI, PastRoute11CelebiTeleportMovement
	setevent EVENT_HIDE_AND_SEEK_CELEBI_4
;	clearevent EVENT_HIDE_AND_SEEK_CELEBI_3
	disappear PASTPECTINIACITY_CELEBI
	waitsfx
	scall PastPectiniaCelebiAfterEncounter
	playsound SFX_EXIT_BUILDING
	waitsfx
	moveobject PASTPECTINIACITY_COOLTRAINERM, 48, 23
	appear PASTPECTINIACITY_COOLTRAINERM
	checkcode VAR_FACING
	ifequal UP, .FacingUp_Approach
	applymovement PASTPECTINIACITY_COOLTRAINERM, PastPectiniaCooltrainerMovement1
	jump .GiveGSBall
.FacingUp_Approach
	applymovement PASTPECTINIACITY_COOLTRAINERM, PastPectiniaCooltrainerMovement2
.GiveGSBall
	faceobject PLAYER, PASTPECTINIACITY_COOLTRAINERM
	faceobject PASTPECTINIACITY_COOLTRAINERM, PLAYER
	opentext
;	Berry master mentions the bright light bringing his attention to the flowers being in bloom.
;	"I never bother to look, it's too saddening."
;	Thanks the player, believing he did it.

;	Gives the player the GS ball because he thought it could be used to make his garden flourish.
;	Believes it didn't help so the player can take it.
	verbosegiveitem GS_BALL
	closetext
	checkcode VAR_FACING
	ifequal DOWN, .FacingDown_Leaving
	applymovement PASTPECTINIACITY_COOLTRAINERM, PastPectiniaCooltrainerLeaveMovement1
	jump .Done
.FacingDown_Leaving
	applymovement PASTPECTINIACITY_COOLTRAINERM, PastPectiniaCooltrainerLeaveMovement2
.Done
	disappear PASTPECTINIACITY_COOLTRAINERM
	playsound SFX_ENTER_DOOR
	waitsfx
	setevent EVENT_BOSS_CELEBI_AVAILABLE
	end

PastPectiniaCelebiEncounter:
	jumpstd weakcelebiencounter
	end

PastPectiniaCelebiAfterEncounter:
	jumpstd bosscelebibattle
	end

PastPectiniaCitySign:
	jumptext PastPectiniaCitySignText

PastPectiniaSquareSign:
	jumptext PastPectiniaSquareSignText

PastPectiniaCityConstructionSign:
	jumptext PastPectiniaCityConstructionSignText

PastPectiniaCityMartSign:
	jumpstd martsign

PastPectiniaCityLicensePlate:
	jumptext PastPectiniaCityLicensePlateText

PastPectiniaFruitTree:
	checkevent EVENT_BOSS_CELEBI_AVAILABLE
	iffalse .barren
	jumptext PastPectiniaFruitTreeText

.barren
	jumptext PastPectiniaBarrenFruitTreeText

PastPectiniaCityHiddenBrickPiece1:
	hiddenitem BRICK_PIECE, EVENT_PECTINIA_CITY_PAST_HIDDEN_BRICK_PIECE_1

PastPectiniaCityHiddenBrickPiece2:
	hiddenitem BRICK_PIECE, EVENT_PECTINIA_CITY_PAST_HIDDEN_BRICK_PIECE_2

PastPectiniaCityHiddenBrickPiece3:
	hiddenitem BRICK_PIECE, EVENT_PECTINIA_CITY_PAST_HIDDEN_BRICK_PIECE_3

PastPectiniaCityHiddenBrickPiece4:
	hiddenitem BRICK_PIECE, EVENT_PECTINIA_CITY_PAST_HIDDEN_BRICK_PIECE_4

PastPectiniaCityHiddenBrickPiece5:
	hiddenitem BRICK_PIECE, EVENT_PECTINIA_CITY_PAST_HIDDEN_BRICK_PIECE_5

PastPectiniaCityHiddenDirectBall:
	hiddenitem DIRECT_BALL, EVENT_PECTINIA_CITY_PAST_HIDDEN_DIRECT_BALL

PastPectiniaCooltrainerMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

PastPectiniaCooltrainerMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step RIGHT
	turn_head UP
	step_resume

PastPectiniaCooltrainerLeaveMovement1:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

PastPectiniaCooltrainerLeaveMovement2:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

PastPectiniaCooltrainerFText:
	text "I flew my NOCTOWL"
	line "here from a far"
	cont "away town."

	para "I'm letting my"
	line "girl get some"
	cont "rest before I"
	cont "go back home."
	done

PastPectiniaTwinText:
	text "Some day I will"
	line "have a #MON to"
	cont "keep as a pet."

	para "I hope it's a"
	line "GROWLITHE, that's"
	cont "my favorite!"
	done

PastPectiniaSuperNerdText:
	text "My NIDORAN is my"
	line "best friend!"

	para "I make sure to"
	line "give him plenty of"
	cont "time outside his"
	cont "# BALL."
	done

PastPectiniaCityWorkerText:
	text "PECTINIA CITY is"
	line "growing at such a"
	cont "rate that we will"
	cont "need a new"
	cont "apartment complex"
	cont "just to house the"
	cont "influx of people"
	cont "moving here."

	para "My crew is helping"
	line "build this city"
	cont "into something"
	cont "real big."

	para "Maybe we will even"
	line "rival RUGOSA."
	done

PastPectiniaNoctowlText:
	text "NOCTOWL: Hoo-hooo!"
	done

PastPectiniaNidoranText:
	text "NIDORAN: Gau gau!"
	done

PastPectiniaCitySignText:
	text "PECTINIA CITY"
	
	para "The humble city,"
	line "growing daily."
	done

PastPectiniaSquareSignText:
	text "PECTINIA SQUARE"

	para "Where your #MON"
	line "may roam free."
	done

PastPectiniaCityConstructionSignText:
	text "COMING SOON-"
	
	para "PECTINIA APARTMENT"
	line "COMPLEX"
	done

PastPectiniaCityLicensePlateText:
	text "The license plate"
	line "this truck says"
	cont "“OUTATIME”"
	done

PastPectiniaBarrenFruitTreeText:
	text "It's a fruit-"
	line "bearing tree."

	para "…But there doesn't"
	line "seem to be any-"
	cont "thing there."
	done

PastPectiniaFruitTreeText:
	text "It's a fruit-"
	line "bearing tree."

	para "There are BERRIES"
	line "starting to grow"
	cont "on the branches."
	done

PastPectiniaCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 31, 11, PAST_PECTINIA_MART,  1
	warp_event  4, 26, PAST_ROUTE_2_GATE,   2
	warp_event  4, 27, PAST_ROUTE_2_GATE,   3
	warp_event  9,  5, PAST_PECTINIA_GATE,	3
	warp_event 11, 25, PAST_PECTINIA_GYM_SPEECH_HOUSE,  1
	warp_event 17, 25, PAST_PECTINIA_BIKE_HOUSE,  1
	warp_event 51, 25, PAST_PECTINIA_BERRY_HOUSE, 1
	warp_event 40, 17, PAST_PECTINIA_GYM, 1 ; Police Station
	warp_event 37, 11, PAST_PECTINIA_EGG_MOVE_HOUSE,  1
	warp_event 23, 11, PAST_PECTINIA_APARTMENT_1F, 1

	db 0 ; coord events

	db 11 ; bg events
	bg_event  6, 25, BGEVENT_RIGHT, PastPectiniaCitySign
	bg_event 29, 23, BGEVENT_RIGHT, PastPectiniaSquareSign
	bg_event 16, 19, BGEVENT_RIGHT, PastPectiniaCityConstructionSign
	bg_event 32, 11, BGEVENT_RIGHT, PastPectiniaCityMartSign
	bg_event 20, 10, BGEVENT_RIGHT, PastPectiniaCityLicensePlate
	bg_event 21, 16, BGEVENT_ITEM, PastPectiniaCityHiddenBrickPiece1
	bg_event 10, 18, BGEVENT_ITEM, PastPectiniaCityHiddenBrickPiece2
	bg_event 15, 13, BGEVENT_ITEM, PastPectiniaCityHiddenBrickPiece3
	bg_event 20, 19, BGEVENT_ITEM, PastPectiniaCityHiddenBrickPiece4
	bg_event 16, 22, BGEVENT_ITEM, PastPectiniaCityHiddenBrickPiece5
	bg_event 40, 10, BGEVENT_ITEM, PastPectiniaCityHiddenDirectBall

	db 15 ; object events
	object_event 31, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastPectiniaCooltrainerF, -1
	object_event 32, 16, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastPectiniaNoctowl, -1
	object_event 30, 20, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaTwin, -1
	object_event 27, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PastPectiniaSuperNerd, -1
	object_event 26, 18, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PastPectiniaNidoran, -1
	object_event 18, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaCityWorker, -1
	object_event 12, 16, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 17, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 53, 18, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CelebiEncounter2, EVENT_HIDE_AND_SEEK_CELEBI_4
	object_event 55,  0, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOSS_CELEBI_AVAILABLE
	object_event 49, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
	object_event 50, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
	object_event 53, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
	object_event 52, 19, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, PastPectiniaFruitTree, -1
