	const_def 2 ; object constants

OrchidGrannysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OrchidGranny:
	faceplayer
	opentext
	checkevent EVENT_SHOWN_ENTEI_TO_ORCHID_GRANNY
	iftrue .shown_entei
	checkevent EVENT_GOT_GUARDIAN_KEY
	iftrue .after_key
	writetext OrchidGrannyAskText
	yesorno
	iffalse .decline
	writetext OrchidGrannyStoryText
	waitbutton
	writetext OrchidGrannyHearMore
	yesorno
	iftrue .decline
	writetext OrchidGrannyGiveGuardianKeyText
	waitbutton
	verbosegiveitem GUARDIAN_KEY
	setevent EVENT_GOT_GUARDIAN_KEY
	waitbutton
	closetext
	end

.decline
	writetext OrchidGrannyDeclineText
	waitbutton
	closetext
	end

.after_key
	writebyte ENTEI
	special FindPartyMonThatSpecies
	iftrue .have_entei
	writetext OrchidGrannyAfterText
	waitbutton
	closetext
	end

.have_entei
	writetext OrchidGrannyShowEnteiText
	waitbutton
	closetext
	setevent EVENT_SHOWN_ENTEI_TO_ORCHID_GRANNY
	end

.shown_entei
	writetext OrchidGrannyAfterEnteiText
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

OrchidGrannyHearMore:
	text "I'm sorry, I have"
	line "been speaking for"
	cont "so long."

	para "Does my story bore"
	line "you?"
	done

OrchidGrannyGiveGuardianKeyText:
	text "I only have a"
	line "little more to"
	cont "tell you."
	
	para "There is a cave"
	line "deep within MOLTEN"
	cont "PEAK which has"
	cont "been sealed off"
	cont "for decades."

	para "Rumor has it that"
	line "the GUARDIAN lives"
	cont "behind those"
	cont "locked doors."

	para "I have a KEY which"
	line "is said to be able"
	cont "to unseal the way"
	cont "to the GUARDIAN."

	para "I am in no shape"
	line "to be exploring"
	cont "caves at my age,"
	cont "so you should"
	cont "take this KEY and"
	cont "look for me."

	para "You have been so"
	line "patient with me,"
	cont "you deserve a"
	cont "chance to meet the"
	cont "GUARDIAN of old."
	done

OrchidGrannyAfterText:
	text "It is said the"
	line "GUARDIAN is rest-"
	cont "ing deep within"
	cont "MOLTEN PEAK."

	para "The KEY I gave you"
	line "should let you ac-"
	cont "cess its chamber."
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

OrchidGrannyAfterEnteiText:
	text "Thank you so much"
	line "for letting me"
	cont "meet the GUARDIAN"
	cont "once again."

	para "You have been so"
	line "kind to me."
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
