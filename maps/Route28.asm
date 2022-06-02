	const_def 2 ; object constants

Route28_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route28Foreman:
	jumptextfaceplayer Route28ForemanText

Route28Worker1:
	opentext
	writetext Route28Worker1HitRockText
	earthquake 10
	closetext
	faceplayer
	opentext
	writetext Route28Worker1NoticePlayerText
	waitbutton
	closetext
	end

Route28Worker2:
	jumptextfaceplayer Route28Worker2Text

Route28Worker3:
	jumptext Route28Worker3Text

Route28Sign:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .Construction
	jumptext Route28SignText

.Construction
	jumptext Route28ConstructionSignText

Route28ForemanText:
	text "The path up ahead"
	line "is blocked due to"
	cont "a landslide."

	para "If you want to use"
	line "this route, you'd"
	cont "better grab a pick"
	cont "and get to work."
	done

Route28Worker1HitRockText:
	text "HIYA!"
	done

Route28Worker1NoticePlayerText:
	text "I'm hitting these"
	line "rocks with all of"
	cont "my strength, and"
	cont "I'm barely making"
	cont "cracks in them!"

	para "I don't even know"
	line "why we're clearing"
	cont "this route. There's"
	cont "nothing but an"
	cont "abandoned lab on"
	cont "the other end."
	done

Route28Worker2Text:
	text "Clearing up rocks"
	line "like this is a"
	cont "tough job, but the"
	cont "money is what"
	cont "makes it all"
	cont "worth doing!"
	done

Route28Worker3Text:
	text "There is way too"
	line "much work to be"
	cont "done for me to"
	cont "have a chat."

	para "Unless it's import-"
	line "ant, leave me be."
	done

Route28SignText:
	text "ROUTE 22"
	done

Route28ConstructionSignText:
	text "ROUTE 22"
	
	para "Temporarily"
	line "blocked due to"
	cont "landslide."
	done

Route28_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 17,  5, ROUTE_28, 1 ;  Mewtwo forest

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 29, BGEVENT_READ, Route28Sign

	db 4 ; object events
	object_event  7, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28Foreman, -1
	object_event 15, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28Worker1, -1
	object_event 12, 26, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28Worker2, -1
	object_event 11, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28Worker3, -1
