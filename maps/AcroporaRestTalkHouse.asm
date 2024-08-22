	const_def 2 ; object constants
	const RESTTALKHOUSE_GRAMPS
	const RESTTALKHOUSE_GRANNY

AcroporaRestTalkHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RestTalkGrannyScript:
	checktime NITE
	iftrue .NiteScript
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_REST
	iftrue .GotTM
	writetext RestTalkGrannyDayText
	waitbutton
	verbosegiveitem TM_REST
	setevent EVENT_GOT_TM_REST

.GotTM
	writetext RestTalkGrannyAfter
	waitbutton
	closetext
	end

.NiteScript:
	showemote EMOTE_SLEEP, RESTTALKHOUSE_GRANNY, 15
	jumptext RestTalkGrannyNiteText

RestTalkGrampsScript:
	checktime NITE
	iffalse .NotNite
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_SLEEP_TALK
	iftrue .GotTM
	writetext RestTalkGrampsNiteText
	waitbutton
	checkevent EVENT_GOT_TM_REST
	iffalse .NoRest
	writetext RestTalkGrampsGiveTMSleepTalk
	verbosegiveitem TM_SLEEP_TALK
	setevent EVENT_GOT_TM_SLEEP_TALK

.GotTM
	writetext RestTalkGrampsAfter
	waitbutton
.NoRest
	closetext
	end

.NotNite:
	showemote EMOTE_SLEEP, RESTTALKHOUSE_GRAMPS, 15
	jumptext RestTalkGrampsDayText

RestTalkGrannyDayText:
	text "My lazy, good-for-"
	line "nothing husband"
	cont "just sleeps at the"
	cont "table all day!"
	
	para "You know, it must"
	line "have something to"
	cont "do with this item"
	cont "he brought home."
	
	para "Here. It's for the"
	line "best I get rid of"
	cont "it."
	done
	
RestTalkGrannyAfter:
	text "That TM contains"
	line "REST."
	
	para "It lets your"
	line "#MON take a nap"
	cont "and regain its"
	cont "health."
	
	para "My husband isn't a"
	line "#MON, but it is"
	cont "still affecting"
	cont "him somehow."
	done
	
RestTalkGrannyNiteText:
	text "…Zzzz…"
	
	para "She seems to be"
	line "murmuring in her"
	cont "sleep."
	done
	
RestTalkGrampsDayText:
	text "…Zzzz…"
	
	para "He's taking a nap"
	line "at the table."
	done
	
RestTalkGrampsNiteText:
	text "When my wife talks"
	line "in her sleep, I"
	cont "can't get any"
	cont "myself. I end up"
	cont "passing out during"
	cont "the day most of"
	cont "the time."
	done
	
RestTalkGrampsGiveTMSleepTalk:
	text "If she is going to"
	line "give away my TMs"
	cont "without asking, I"
	cont "can do the same."
	done
	
RestTalkGrampsAfter:
	text "That TM will teach"
	line "your #MON SLEEP"
	cont "TALK."
	
	para "It will allow your"
	line "#MON to use a"
	cont "move even while"
	cont "sleeping."
	
	para "Despite what my"
	line "wife says, a TM"
	cont "has no effect on a"
	cont "person."
	
	para "Unfortunately,"
	line "it will not affect"
	cont "her sleep talking."
	done

AcroporaRestTalkHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ACROPORA_CITY, 4
	warp_event  4,  7, ACROPORA_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RestTalkGrampsScript, -1
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RestTalkGrannyScript, -1
