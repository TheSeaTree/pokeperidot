	const_def 2 ; object constants

OrchidGrannysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OrchidGranny:
	faceplayer
	opentext
	writetext OrchidGrannyAskText
	yesorno
	iffalse .decline
	writetext OrchidGrannyStoryText
	waitbutton
	writetext OrchidGrannyGiveShrineKeyText
	waitbutton
	verbosegiveitem SHRINE_KEY
	waitbutton
	closetext
	end

.decline
	writetext OrchidGrannyDeclineText
	waitbutton
	closetext
	end

OrchidGrannysHouseBookshelf:
	jumpstd difficultbookshelf
	
OrchidGrannyAskText:
	text "Hello, young one."
	
	para "When I was a young"
	line "girl, my grandma"
	cont "would tell me all"
	cont "kinds of stories."
	
	para "Would you care if"
	line "I passed a story"
	cont "down to you?"
	done

OrchidGrannyStoryText:
	text "Long ago, when I"
	line "was a little girl,"
	cont "a powerful #MON"
	cont "would protect this"
	cont "place. It kept all"
	cont "of the strong wild"
	cont "#MON away with"
	cont "its loud roar."
	
	para "The elders saw it"
	line "as a guardian to"
	cont "us, and even beli-"
	cont "eved it was the"
	cont "one who stopped"
	cont "the volcano from"
	cont "erupting."
	
	para "One day, the GUAR-"
	line "DIAN mysteriously"
	cont "vanished without a"
	cont "trace!"
	
	para "The elders feared"
	line "this was a bad"
	cont "omen, but I think"
	cont "it left us because"
	cont "we could handle"
	cont "ourselves against"
	cont "the wild #MON."
	
	para "…I'm afraid I'm the"
	line "only one in ORCHID"
	cont "who is old enough"
	cont "to remember this"
	cont "mighty #MON."

	para "Maybe it is still"
	line "out there, resting"
	cont "deep within the"
	cont "volcano."
	done

OrchidGrannyGiveShrineKeyText:
	text "If you are eager"
	line "to learn more, you"
	cont "can visit the"
	cont "SHRINE next to the"
	cont "#MON CENTER."
	
	para "I believe some"
	line "young men live"
	cont "there now, but"
	cont "their master will"
	cont "let you by with"
	cont "this KEY."
	
	; giveitem SHRINE_KEY
	
	done
	
OrchidGrannyShowEnteiText:
	text "Oh my! …Is that"
	line "truly the GUARDIAN"
	cont "from my youth?"
	
	para "I can't believe it!"
	
	para "Thank you so much"
	line "for letting me see"
	cont "it one last time…"
	done

OrchidGrannyDeclineText:
	text "Young people are"
	line "always in such a"
	cont "hurry these days,"
	cont "but I understand."
	
	para "Times change, I"
	line "suppose…"
	done

OrchidGrannysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ORCHID_CITY, 7
	warp_event  4,  7, ORCHID_CITY, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  1, BGEVENT_READ, OrchidGrannysHouseBookshelf
	bg_event  6,  1, BGEVENT_READ, OrchidGrannysHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidGranny, -1
