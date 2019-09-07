Route20_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route20SnorlaxEvent:
	opentext
	writetext SnorlaxSleepingText
	waitbutton
	checkitem POKE_FLUTE
	iffalse .noflute
	writetext UseFluteText
	yesorno
	iffalse .noflute
	closetext
	playsound SFX_POKEFLUTE
	waitsfx
	opentext
	writetext SnorlaxWokeUpText
	waitbutton
	closetext
	loadwildmon SNORLAX, 40
	startbattle
	reloadmapafterbattle
	end

.noflute
	closetext
	end

SnorlaxSleepingText:
	text "This #MON is"
	line "sound asleep."
	
	para "It won't budge!"
	done
	
SnorlaxWokeUpText:
	text "The sleeping"
	line "#MON was awoken"
	cont "by the sound of"
	cont "the # FLUTE!"
	
	para "The sleeping"
	line "#MON attacked!"
	done
	
UseFluteText:
	text "Try playing the"
	line "# FLUTE?"
	done
	

Route20_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 39, BLACKTHORN_CITY, 1
	warp_event 10, 39, BLACKTHORN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 28, 16, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route20SnorlaxEvent, -1
