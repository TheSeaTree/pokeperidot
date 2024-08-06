	const_def 2 ; object constants

Route24_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Postgame

.Postgame
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .Nothing
	changeblock 10, 18, $01
	changeblock 12, 20, $01
.Nothing
	return

TrainerHikerNoah:
	trainer HIKER, NOAH, EVENT_BEAT_HIKER_NOAH, HikerNoahText, HikerNoahWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNoahAfterText
	waitbutton
	closetext
	end	

Route24Foreman:
	jumptextfaceplayer Route24ForemanText

Route24Worker1:
	opentext
	writetext Route24Worker1HitRockText
	earthquake 10
	closetext
	faceplayer
	opentext
	writetext Route24Worker1NoticePlayerText
	waitbutton
	closetext
	end

Route24Worker2:
	jumptextfaceplayer Route24Worker2Text

Route24Worker3:
	jumptext Route24Worker3Text

Route24RareCandy:
	itemball RARE_CANDY

Route24HiddenPowerHerb:
	hiddenitem POWER_HERB, EVENT_ROUTE_24_HIDDEN_POWER_HERB

Route24HiddenGoldLeaf:
	hiddenitem GOLD_LEAF, EVENT_ROUTE_24_HIDDEN_GOLD_LEAF

Route24HiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_ROUTE_24_HIDDEN_SILVER_LEAF

Route24Sign:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .Construction
	jumptext Route24SignText

.Construction
	jumptext Route24ConstructionSignText

Route24ForemanText:
	text "The path up ahead"
	line "is blocked due to"
	cont "a landslide."

	para "If you want to use"
	line "this route, you'd"
	cont "better grab a pick"
	cont "and get to work."
	done

Route24Worker1HitRockText:
	text "HIYA!"
	done

Route24Worker1NoticePlayerText:
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

Route24Worker2Text:
	text "Clearing up rocks"
	line "like this is a"
	cont "tough job, but the"
	cont "money is what"
	cont "makes it all"
	cont "worth doing!"
	done

Route24Worker3Text:
	text "There is way too"
	line "much work to be"
	cont "done for me to"
	cont "have a chat."

	para "Unless it's import-"
	line "ant, leave me be."
	done

HikerNoahText:
	text "The rest of the"
	line "guys went home"
	cont "after clearing up"
	cont "the landslide."

	para "Can you entertain"
	line "me with a battle?"
	done

HikerNoahWinText:
	text "That was fun! Even"
	line "if my #MON were"
	cont "totally smashed!"
	done

HikerNoahAfterText:
	text "I still have so"
	line "much energy even"
	cont "after smashing up"
	cont "all those rocks!"

	para "I hope I can meet"
	line "more trainers to"
	cont "battle here."
	done

Route24SignText:
	text "ROUTE 24"

	para "BOREAS FOREST"
	line "ahead."
	done

Route24ConstructionSignText:
	text "ROUTE 24"
	
	para "Temporarily"
	line "blocked due to"
	cont "landslide."
	done

Route24_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 17,  5, ROUTE_24_GATE, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11, 25, BGEVENT_READ, Route24Sign
	bg_event 13,  5, BGEVENT_ITEM, Route24HiddenPowerHerb
	bg_event 21,  5, BGEVENT_ITEM, Route24HiddenGoldLeaf
	bg_event 27, 14, BGEVENT_ITEM, Route24HiddenSilverLeaf

	db 6 ; object events
	object_event  7, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route24Foreman, EVENT_BEAT_ELITE_FOUR
	object_event 15, 26, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route24Worker1, EVENT_BEAT_ELITE_FOUR
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route24Worker2, EVENT_BEAT_ELITE_FOUR
	object_event 11, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route24Worker3, EVENT_BEAT_ELITE_FOUR
	object_event 13, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerNoah, -1
	object_event 28,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 3, Route24RareCandy, EVENT_ROUTE_24_RARE_CANDY
