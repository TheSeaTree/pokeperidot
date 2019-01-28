	const_def 2 ; object constants
	const CIANWOODMART_CLERK
	const CIANWOODMART_COOLTRAINER_M
	const CIANWOODMART_YOUNGSTER

CianwoodMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodMartClerkScript:
	opentext
	checkevent EVENT_EXPLAINED_BURGLAR
	iftrue .LowStock
	checkevent EVENT_BURGLAR_IN_CIANWOOD
	iftrue .Robbery
	pokemart MARTTYPE_STANDARD, MART_CIANWOOD
	closetext
	end
	
.Robbery
	setevent EVENT_EXPLAINED_BURGLAR
	writetext CianwooMartRobbed
	waitbutton
;	closetext
	jump .LowStock
	end
	
.LowStock
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD_ROBBED
	closetext
	end

CianwoodMartCooltrainerMScript:
	faceplayer
	opentext
	writetext CianwoodMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CianwoodMartYoungsterScript:
	jumptextfaceplayer CianwoodMartYoungsterText

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
	
;	para "I don't have much"
;	line "to offer."
;	done
	
CianwoodMartCooltrainerMText:
	text "They're fresh out"
	line "of # BALLS!"

	para "When will they get"
	line "more of them?"
	done

CianwoodMartCooltrainerMText_PokeBallsInStock:
	text "# BALLS are in"
	line "stock! Now I can"
	cont "catch #MON!"
	done

CianwoodMartYoungsterText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #MON poi-"
	line "soned my #MON!"

	para "I just kept going,"
	line "but then my"
	cont "#MON fainted."

	para "You should keep an"
	line "ANTIDOTE with you."
	done

CianwoodMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 4
	warp_event  3,  7, CIANWOOD_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodMartCooltrainerMScript, EVENT_BURGLAR_IN_CIANWOOD
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodMartYoungsterScript, EVENT_BURGLAR_IN_CIANWOOD
