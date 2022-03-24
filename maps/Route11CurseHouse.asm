	const_def 2 ; object constants
	const ROUTE11CURSEHOUSE_MEDIUM
	const ROUTE11CURSEHOUSE_ITEMBALL

Route11CurseHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Medium

.Medium:
	writebyte CURSTRAW
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue .DoNothing
	moveobject ROUTE11CURSEHOUSE_MEDIUM,  -3, -3
.DoNothing:
	return
	
TrainerMediumAnnabel:
	opentext
	writetext MediumAnnabelleText
	waitbutton
	faceplayer
	writetext MediumAnnabelleChallengeText
	waitbutton
	closetext
	winlosstext MediumAnnabelleWinText, 0
	loadtrainer MEDIUM, ANNABELLE
	startbattle
	reloadmapafterbattle
	opentext
	writetext MediumAnnabelleAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	clearevent EVENT_GOT_TM_CURSE
	disappear ROUTE11CURSEHOUSE_MEDIUM
	setevent EVENT_HIDE_MEDIUM_ANNABELLE
	moveobject ROUTE11CURSEHOUSE_ITEMBALL, 3, 3
	appear ROUTE11CURSEHOUSE_ITEMBALL
	wait 8
	special FadeInQuickly
	end
	
TMCurse:
	itemball TM_CURSE
	
MediumAnnabelleText:
	text "You possess…"
	
	para "………………"

	para "………………"
	done
	
MediumAnnabelleChallengeText:
	text "Its twin…"
	done
	
MediumAnnabelleWinText:
	text "………………"
	done
	
MediumAnnabelleAfterText:
	text "………"
	
	para "I'm…"
	
	para "…free………"
	done

Route11CurseHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ROUTE_11, 4
	warp_event  4,  7, ROUTE_11, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, TrainerMediumAnnabel, EVENT_HIDE_MEDIUM_ANNABELLE
	object_event  3,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, TMCurse, EVENT_GOT_TM_CURSE
