Route6WaterfallHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route6WaterfallGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_WATERFALL
	iftrue .Waterfall
	writetext WaterfallGuyText
	buttonsound
	verbosegiveitem TM_WATERFALL
	setevent EVENT_GOT_TM_WATERFALL
	
.Waterfall:
	writetext TMWaterfallExplaination
	buttonsound
	closetext
	end
	
WaterfallGuyText:
	text "I find no greater"
	line "joy than being on"
	cont "a high peak. Even"
	cont "when nature wants"
	cont "to keep me down."
	
	para "I can tell by your"
	line "face that you have"
	cont "the same craving."
	
	para "In that case, I"
	line "have just the TM"
	cont "for you!"
	done

TMWaterfallExplaination:
	text "That TM teaches"
	line "WATERFALL."
	
	para "It is a powerful"
	line "WATER-type move"
	cont "that may cause its"
	cont "target to flinch,"
	cont "giving you a free"
	cont "hit."
	
	para "The force from"
	line "this move can even"
	cont "allow your #MON"
	cont "to jet straight up"
	cont "a WATERFALL with"
	cont "ease."
	
	para "Come to think of"
	line "it, there is a big"
	cont "WATERFALL in a"
	cont "nearby cave. Maybe"
	cont "you could go check"
	cont "that one out."
	done

Route6WaterfallHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_6, 4
	warp_event  3,  7, ROUTE_6, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6WaterfallGuy, -1
