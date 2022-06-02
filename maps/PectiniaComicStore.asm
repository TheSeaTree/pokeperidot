	const_def 2 ; object constants

PectiniaComicStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaComicStoreClerk:
	jumptextfaceplayer PectiniaComicStoreClerkText

PectiniaComicStoreOfficer:
	jumptextfaceplayer PectiniaComicStoreOfficerText

PectiniaComicStoreYoungster:
	jumptextfaceplayer PectiniaComicStoreYoungsterText

PectiniaComicStoreLass:
	jumptextfaceplayer PectiniaComicStoreLassText

PectiniaComicStoreSuperNerd1:
	jumptext PectiniaComicStoreSuperNerd1Text

PectiniaComicStoreSuperNerd2:
	jumptext PectiniaComicStoreSuperNerd2Text

PectiniaComicStoreWilburHeadline:
	jumptext PectiniaComicStoreWilburHeadlineText

PectiniaComicStoreReganHeadline:
	jumptext PectiniaComicStoreReganHeadlineText

PectiniaComicStoreBredeHeadline:
	jumptext PectiniaComicStoreBredeHeadlineText

PectiniaComicStoreAmberHeadline:
	jumptext PectiniaComicStoreAmberHeadlineText

PectiniaComicStoreComicsShelf:
	jumptext PectiniaComicStoreComicsShelfText

PectiniaComicStoreYouBreakIt:
	jumptext PectiniaComicStoreYouBreakItText

PectiniaComicStoreStatues:
	jumptext PectiniaComicStoreStatuesText

PectiniaComicStoreClerkText:
	text "Welcome to my"
	line "COMIC SHOP."

	para "You're a trainer,"
	line "right?"

	para "You're welcome to"
	line "browse through my"
	cont "selection, but I"
	cont "can't sell to you."

	para "I would feel awful"
	line "if any of these"
	cont "rare collectables"
	cont "were damaged in"
	cont "your PACK."
	done

PectiniaComicStoreOfficerText:
	text "Sorry kid, but the"
	line "back room is for"
	cont "employees only."

	para "Move along,"
	line "please."
	done

PectiniaComicStoreYoungsterText:
	text "So many of these"
	line "comics are so cool"
	cont "and rare!"

	para "I wish I could"
	line "afford to buy any"
	cont "of them…"
	done

PectiniaComicStoreLassText:
	text "I don't come in"
	line "here very often."

	para "My boyfriend loves"
	line "these comics, and"
	cont "I wanted to see"
	cont "what all the fuss"
	cont "is about."

	para "Do you have any"
	line "recommendations?"
	done

PectiniaComicStoreSuperNerd1Text:
	text "Did you see the"
	line "new member of the"
	cont "ELITE FOUR?"

	para "I hear she used to"
	line "be a super model!"
	done

PectiniaComicStoreSuperNerd2Text:
	text "Yeah, AMBER is a"
	line "total hottie!"

	para "I want to become"
	line "good at battling"
	cont "just so I can meet"
	cont "her someday!"
	done

PectiniaComicStoreWilburHeadlineText:
	text "'CAN HE STILL HANG"
	line "WITH THE BEST?'"

	para "We discuss ELITE"
	line "FOUR WILBUR and"
	cont "his tenure in the"
	cont "#MON LEAGUE."
	done

PectiniaComicStoreReganHeadlineText:
	text "'I WAS TOTALLY"
	line "MYSTIFIED!'"

	para "Read our review of"
	line "REGAN's latest"
	cont "magic performance."
	done

PectiniaComicStoreBredeHeadlineText:
	text "'THE BENEFITS OF"
	line "ICE BATHS.'"

	para "BREDE discusses"
	line "how his morning"
	cont "routine helps with"
	cont "his training."
	done

PectiniaComicStoreAmberHeadlineText:
	text "'FRESH OFF THE"
	line "RUNWAY AND HEADING"
	cont "TO THE TOP!'"

	para "Exclusive inter-"
	line "view with the new-"
	cont "est ELITE FOUR"
	cont "member, AMBER."
	done

PectiniaComicStoreComicsShelfText:
	text "The shelves are"
	line "lined with comic"
	cont "books of all"
	cont "different kinds."
	done

PectiniaComicStoreYouBreakItText:
	text "NOTICE:"

	para "You break it,"
	line "you buy it."
	done

PectiniaComicStoreStatuesText:
	text "It's full of all"
	line "kinds of statues"
	cont "and figures model-"
	cont "led after #MON."
	done

PectiniaComicStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 11, PECTINIA_MALL, 7
	warp_event  9, 11, PECTINIA_MALL, 7

	db 0 ; coord events

	db 12 ; bg events
	bg_event  4,  0, BGEVENT_READ, PectiniaComicStoreYouBreakIt
	bg_event  3,  5, BGEVENT_READ, PectiniaComicStoreWilburHeadline
	bg_event  5,  5, BGEVENT_READ, PectiniaComicStoreReganHeadline
	bg_event  1,  5, BGEVENT_READ, PectiniaComicStoreBredeHeadline
	bg_event  0,  5, BGEVENT_READ, PectiniaComicStoreAmberHeadline
	bg_event  2,  1, BGEVENT_READ, PectiniaComicStoreStatues
	bg_event  3,  1, BGEVENT_READ, PectiniaComicStoreStatues
	bg_event  4,  5, BGEVENT_READ, PectiniaComicStoreComicsShelf
	bg_event  1,  9, BGEVENT_READ, PectiniaComicStoreComicsShelf
	bg_event  2,  9, BGEVENT_READ, PectiniaComicStoreComicsShelf
	bg_event  4,  9, BGEVENT_READ, PectiniaComicStoreComicsShelf
	bg_event  5,  9, BGEVENT_READ, PectiniaComicStoreComicsShelf

	db 6 ; object events
	object_event  9,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaComicStoreClerk, -1 ; Find a new OW sprite for this guy probably.
	object_event  6,  1, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaComicStoreOfficer, -1
	object_event  3, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaComicStoreYoungster, -1
	object_event  4,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaComicStoreLass, -1
	object_event  0,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaComicStoreSuperNerd1, -1
	object_event  1,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaComicStoreSuperNerd2, -1
