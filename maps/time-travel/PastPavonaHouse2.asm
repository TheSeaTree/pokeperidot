	const_def 2 ; object constants
	const PASTPAVONA_MAPLESMOM1
	const PASTPAVONA_MAPLESMOM2
	const PASTPAVONA_NOTEBOOK

PastPavonaHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MaplesMother:
	faceplayer
	opentext
	checkevent EVENT_HIDE_MAPLES_MOTHER
	iftrue .Studying
	writetext MaplesMotherIntroText
	waitbutton
	checkitem SCHOOLWORK
	iffalse .NoSchoolwork
	writetext MaplesMotherGiveSchoolworkText
	waitbutton
	turnobject PASTPAVONA_MAPLESMOM2, RIGHT
	setevent EVENT_HIDE_MAPLES_MOTHER
	clearevent EVENT_HIDE_CELEBI_BOOK
	moveobject PASTPAVONA_NOTEBOOK, 3, 3
	playsound SFX_GOT_SAFARI_BALLS
	appear PASTPAVONA_NOTEBOOK
	closetext
	faceplayer
	opentext
	writetext MaplesMotherAfterSchoolworkText
	waitbutton
.NoSchoolwork
	closetext
	end

.Studying
	writetext MaplesMotherStudyingText
	waitbutton
	closetext
	end

PastPavonaHouseNotebook:
	opentext
	writetext PastPavonaHouseNotebookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook
	checkevent EVENT_ACTIVATED_CELEBI_ENCOUNTERS
	iftrue .ContinueRead
	clearevent EVENT_HIDE_AND_SEEK_CELEBI_1
	setevent EVENT_ACTIVATED_CELEBI_ENCOUNTERS
.ContinueRead
	writetext PastPavonaCelebiBookText
	waitbutton
	closetext
	end

MaplesMotherIntroText:
	text "My boyfriend"
	line "studies extremely"
	cont "rare #MON."

	para "I get so engrossed"
	line "in his research"
	cont "that I will forget"
	cont "to attend school!"
	done

MaplesMotherGiveSchoolworkText:
	text "Oh? What's this?"

	para "That was very kind"
	line "of you to deliver"
	cont "my missed SCHOOL-"
	cont "WORK, stranger."

	para "I really must get"
	line "to work on catch-"
	cont "ing up on every-"
	cont "thing I've missed!"

	para "If you're inter-"
	line "ested, you can"
	cont "take a look at my"
	cont "boyfriend's note-"
	cont "book."
	done

MaplesMotherAfterSchoolworkText:
	text "Now if you'll ex-"
	line "cuse me, I should"
	cont "catch up on my"
	cont "assignments."
	done

MaplesMotherStudyingText:
	text "Could you please"
	line "not disturb me"
	cont "right now?"

	para "I have lots of"
	line "assignments to"
	cont "catch up on."
	done

PastPavonaHouseNotebookText:
	text "This notebook is"
	line "titled “OF MYTHS"
	cont "& LEGENDS”…"

	para "Open it?"
	done

PastPavonaCelebiBookText:
	text "Some #MON are"
	line "so elusive that"
	cont "they have been"
	cont "able to avoid"
	cont "receiving a name."

	para "The first subject"
	line "of this topic is a"
	cont "#MON stated to"
	cont "be seen in dense"
	cont "forests and around"
	cont "withering plants."

	para "This #MON can"
	line "disappear in an"
	cont "instant and is"
	cont "very skittish"
	cont "around people."

	para "There are rumors"
	line "suggesting it can"
	cont "travel through"
	cont "time and space!"

	para "I have been able"
	line "to personally"
	cont "attest to seeing"
	cont "this #MON my-"
	cont "self."

	para "It was impossible"
	line "to inspect close-"
	cont "ly, but this #-"
	cont "MON had a small"
	cont "green body with a"
	cont "large onion-shaped"
	cont "head. It disappea-"
	cont "red within the"
	cont "blink of an eye!"

	para "It was seen along"
	line "ROUTE 1, causing"
	cont "flowers to bloom."
	done

PastPavonaHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_PAVONA_VILLAGE, 3
	warp_event 3,  7, PAST_PAVONA_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MaplesMother, EVENT_HIDE_CELEBI_BOOK
	object_event  2,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MaplesMother, EVENT_HIDE_MAPLES_MOTHER
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastPavonaHouseNotebook, EVENT_HIDE_CELEBI_BOOK
