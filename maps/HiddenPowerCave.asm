	const_def 2 ; object constants
	const HIDDEN_POWER_GUY

HiddenPowerCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HiddenPowerGuy:
	opentext
	checkevent EVENT_GOT_TM_HIDDEN_POWER
	iftrue .gotTM
	writetext HiddenPowerGuyText
	waitbutton
	verbosegiveitem TM_HIDDEN_POWER
	setevent EVENT_GOT_TM_HIDDEN_POWER
	jump .gotTM
	
.gotTM
	writetext HiddenPowerGuyAfter
	waitbutton
	closetext
	end
	
CherrygroveHiddenRareCandy:
	hiddenitem REVIVE, EVENT_CHERRYGROVE_HIDDEN_RARE_CANDY
	
CherrygroveHiddenNugget:
	hiddenitem NUGGET, EVENT_CHERRYGROVE_HIDDEN_NUGGET

HiddenPowerGuyText:
	text "The best part of"
	line "hiking is when you"
	cont "discover a hidden"
	cont "area!"
	
	para "Let me share the"
	line "excitement of"
	cont "hiking with you!"
	done
	
HiddenPowerGuyAfter:
	text "That TM is HIDDEN"
	line "POWER."
	
	para "It's a mysterious "
	line "move."
	
	para "I don't know much"
	line "about it myself."
	
	para "What I do know is"
	line "that it changes"
	cont "with each #MON"
	cont "using it."
	done

HiddenPowerCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  7, PAVONA_VILLAGE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9,  4, BGEVENT_ITEM, CherrygroveHiddenRareCandy
	bg_event  5,  7, BGEVENT_ITEM, CherrygroveHiddenNugget

	db 1 ; object events
	object_event  4,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
