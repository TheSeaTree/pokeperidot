	const_def 2 ; object constants
	const SUICUNELAIR_SUICUNE

SuicuneLair_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Suicune:
	opentext
	writetext SuicuneText
	cry SUICUNE
	waitsfx
	waitbutton
	closetext
	loadwildmon SUICUNE, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	reloadmapafterbattle
	disappear SUICUNELAIR_SUICUNE
	setevent EVENT_HIDE_SUICUNE
	end
	
SuicuneText:
	text "Susuiiiiii!"
	done

SuicuneLair_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  2, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Suicune, EVENT_HIDE_SUICUNE
