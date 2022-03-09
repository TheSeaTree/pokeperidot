	const_def 2 ; object constants

PectiniaArcade_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaArcadeSubwayRewardGuy:
	faceplayer
	opentext
	writetext PectiniaArcadeRewardIntroText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end
; Example
.CheckReward:
	giveitem LEFTOVERS
	iffalse .NoSpace
	writebyte 10
	itemtotext LEFTOVERS, MEM_BUFFER_0
	jump .GiveReward
.Reward2
	giveitem LEFTOVERS
	iffalse .NoSpace
	writebyte 20
	itemtotext LEFTOVERS, MEM_BUFFER_0
	jump .GiveReward
.Reward3
	giveitem LEFTOVERS
	iffalse .NoSpace
	writebyte 30
	itemtotext LEFTOVERS, MEM_BUFFER_0
.GiveReward:
	writetext PectiniaArcadeRewardReceiveText
	waitbutton
	itemnotify
	writetext PectiniaArcadeRewardAfterText
	waitbutton
	closetext
	end
.NoSpace
	writetext PectiniaArcadeRewardNoRoomText
	waitbutton
	closetext
	end

PectiniaArcadeYoungster1Text:
	text "Come on… Just a"
	line "little more!"

	para "………………"

	para "No!"
	done

PectiniaArcadeYoungster1LostText:
	text "Why did you have"
	line "to distract me?"

	para "I almost won!"
	done

PectiniaArcadeRewardIntroText:
	text "You're a trainer,"
	line "right?"

	para "Have you checked"
	line "out the BATTLE"
	cont "SUBWAY yet?"

	para "I like to keep up"
	line "with the high"
	cont "scores people set."

	para "I always love to"
	line "meet those who can"
	cont "get a really good"
	cont "streak going!"
	done

PectiniaArcadeRewardReceiveText:
	text "You got a streak"
	line "of @"
	deciram wScriptVar, 1, 3
	text "? Fantastic!"

	para "You've earned this"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

PectiniaArcadeMaxStreakText:
	text "Woah! You got the"
	line "maximum possible"
	cont "streak on the"
	cont "BATTLE SUBWAY?"

	para "You must really"
	line "be some kind of"
	cont "amazing trainer!"

	para "I think you've"
	line "earned these"
	cont "MASTER BALLs!"
	done

PectiniaArcadeRewardNoRoomText:
	text "Aw, that's too bad…"

	para "You PACK can't fit"
	line "this ITEM."

	para "Clear out some"
	line "space, I'll hold"
	cont "onto it for you."
	done	

PectiniaArcadeRewardAfterText:
	text "Next time you get"
	line "a good streak,"
	cont "come see me."

	para "I'll have something"
	line "good to give you."
	done

PectiniaArcade_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, PECTINIA_MALL, 9
	warp_event  5, 15, PECTINIA_MALL, 9

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	object_event 12,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  1, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeSubwayRewardGuy, -1
