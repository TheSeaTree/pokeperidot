	const_def 2 ; object constants
	const CIANWOODMART_CLERK
	const CIANWOODMART_COOLTRAINER_M
	const CIANWOODMART_YOUNGSTER

HepaticaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HepaticaMartClerkScript:
	opentext
	checkevent EVENT_CLEARED_CHURCH
	iftrue .ChurchCleared
	checkevent EVENT_EXPLAINED_BURGLAR
	iftrue .LowStock
	checkevent EVENT_BURGLAR_IN_CIANWOOD
	iftrue .Robbery
	
.ChurchCleared
	pokemart MARTTYPE_STANDARD, MART_CIANWOOD
	closetext
	end

.Robbery
	setevent EVENT_EXPLAINED_BURGLAR
	writetext CianwooMartRobbed
	waitbutton
	jump .LowStock
	end
	
.LowStock
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD_ROBBED
	closetext
	end

HepaticaMartCooltrainerMScript:
	jumptextfaceplayer HepaticaMartCooltrainerMText

HepaticaMartYoungsterScript:
	jumptextfaceplayer HepaticaMartYoungsterText

CianwooMartRobbed:
	text "Oh, this is"
	line "horrible!"
	
	para "Someone just held"
	line "up my mart and"
	cont "stole nearly"
	cont "everything!"
	
	para "Luckily nobody got"
	line "hurt, but I lost a"
	cont "lot of my stock."
	done

HepaticaMartCooltrainerMText:
	text "It's a good thing"
	line "nobody was in the"
	cont "MART when the"
	cont "BURGLAR was here."
	
	para "You beat him and"
	line "his gang all on"
	cont "your own?"
	
	para "Yeah right!"
	done

HepaticaMartYoungsterText:
	text "Wow, this place"
	line "was robbed?"
	
	para "I've never heard"
	line "of that happening"
	cont "before!"
	done

HepaticaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, HEPATICA_TOWN, 2
	warp_event  3,  7, HEPATICA_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HepaticaMartCooltrainerMScript, EVENT_CIANWOOD_FLY_GUY
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, HepaticaMartYoungsterScript, EVENT_CIANWOOD_FLY_GUY
