	const_def 2 ; object constants
	const VIOLETMART_CLERK
	const VIOLETMART_GRANNY
	const VIOLETMART_COOLTRAINER_M

VioletMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
	closetext
	end

VioletMartGrannyScript:
	jumptextfaceplayer VioletMartGrannyText

VioletMartTwinScript:
	jumptextfaceplayer VioletMartTwinText

VioletMartGrannyText:
	text "It is important to"
	line "treat your #MON"
	cont "with respect."
	
	para "It will never grow"
	line "to love you if you"
	cont "keep sending it"
	cont "out into battles"
	cont "it can't win!"
	done

VioletMartTwinText:
	text "I'm not a trainer."
	
	para "I just like coming"
	line "here to look at"
	cont "all of the #MON"
	cont "merchandise."
	done

VioletMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIOLET_CITY, 1
	warp_event  3,  7, VIOLET_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartClerkScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartGrannyScript, -1
	object_event  5,  2, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletMartTwinScript, -1
