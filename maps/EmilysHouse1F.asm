	const_def 2 ; object constants
	const EMILYSHOUSE1F_MOM
	const EMILYSHOUSE1F_DAD
	const EMILYSHOUSE1F_BROTHER

EmilysHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EmilysMomScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .NotPostgame
	checkevent EVENT_GOT_EXP_ALL
	iffalse .GetExpAll
.NotPostgame
	checkevent EVENT_BEAT_EMILYS_HOUSE
	iffalse .Normal
	checkevent EVENT_CLAIMED_LUCKY_EGG
	iftrue .GotItem
	writetext EmilysMomHasItemText
	waitbutton
.GiveLuckyEgg
	verbosegiveitem LUCKY_EGG
	iffalse .NoRoom
	setevent EVENT_CLAIMED_LUCKY_EGG
	closetext
	end
	
.Normal
	writetext EmilysMomText
	waitbutton
	closetext
	end

.GotItem:
	writetext EmilysMomAfterText
	waitbutton
	closetext
	end
	
.NoRoom
	writetext EmilysMomNoRoomText
	waitbutton
	closetext
	end

.GetExpAll
	writetext EmilysMomHasItemText
	waitbutton
	verbosegiveitem EXP_ALL
	setevent EVENT_GOT_EXP_ALL
	checkevent EVENT_CLAIMED_LUCKY_EGG
	iffalse .AnotherItem
	closetext
	end

.AnotherItem
	writetext EmilysMomSomethingElseText
	jump .GiveLuckyEgg

EmilysDadScript:
	jumptextfaceplayer EmilysDadText

EmilysBrotherScript:
	jumptextfaceplayer EmilysBrotherText

EmilysTVScript:
	jumptext EmilysTVText

EmilysStoveScript:
	jumptext EmilysStoveText

EmilysFridgeScript:
	jumptext EmilysFridgeText

EmilysMomText:
	text "Hello. Who may you"
	line "be?"
	
	para "…………"
	
	para "Oh! You must be"
	line "the <PLAYER> that"
	cont "EMILY is always"
	cont "going on about!"
	
	para "She has been obse-"
	line "ssed with how you"
	cont "and <RIVAL> each"
	cont "battle."
	done

EmilysMomHasItemText:
	text "Oh, hi <PLAYER>!"

	para "EMILY told me to"
	line "give you this."

	para "She was in a hurry"
	line "to get somewhere,"
	cont "and said she"
	cont "couldn't wait"
	cont "around to give it"
	cont "to you in person."
	done

EmilysMomSomethingElseText:
	text "There was some-"
	line "thing else, too."
	done

EmilysMomNoRoomText:
	text "Didn't EMILY tell"
	line "you to free up"
	cont "some space in your"
	cont "PACK? There is no"
	cont "way this item will"
	cont "fit…"
	done

EmilysMomAfterText:
	text "EMILY is determin-"
	line "ed to be the best"
	cont "#MON TRAINER"
	cont "there ever was!"
	
	para "She says there is"
	line "so much to learn"
	cont "from studying how"
	cont "other trainers"
	cont "battle!"
	done

EmilysDadText:
	text "I'm so proud of my"
	line "little girl's work"
	cont "ethic!"
	
	para "You wouldn't beli-"
	line "eve how much time"
	cont "she spends up in"
	cont "her room studying"
	cont "and planning out"
	cont "#MON battles."
	
	para "When EMILY sets"
	line "her mind to some-"
	cont "thing, there is no"
	cont "stopping her. So"
	cont "you'd better watch"
	cont "out!"
	done

EmilysBrotherText:
	text "EMILY is training"
	line "so often that she"
	cont "is never home for"
	cont "dinner."
	
	para "That means I'm"
	line "always stuck with"
	cont "the dishes!"
	done

EmilysStoveText:
	text "Nothing cooking"
	line "right now…"
	done

EmilysFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "SWEET TEA and"
	line "tasty LEMONADE!"
	done

EmilysTVText:
	text "There's a movie on"
	line "TV: A car exploded"
	cont "into a flash of"
	cont "light, leaving a"
	cont "trail of fire!"

	para "I think I saw this"
	line "one back home…"
	done

EmilysHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, STAGHORN_TOWN, 12
	warp_event  7,  7, STAGHORN_TOWN, 12
	warp_event  9,  0, EMILYS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, EmilysStoveScript
	bg_event  2,  1, BGEVENT_READ, EmilysFridgeScript
	bg_event  4,  1, BGEVENT_READ, EmilysTVScript

	db 3 ; object events
	object_event  7,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EmilysMomScript, -1
	object_event  4,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EmilysDadScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EmilysBrotherScript, -1
