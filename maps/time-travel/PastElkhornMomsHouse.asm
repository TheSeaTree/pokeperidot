	const_def 2 ; object constants

PastElkhornMomsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastElkhornMomScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_MAPLE
	iftrue .Charmander
	pokenamemem BULBASAUR, MEM_BUFFER_0
.MonNameLoaded
	writetext PastElkhornMomText
	waitbutton
	closetext
	end

.Squirtle
	pokenamemem SQUIRTLE, MEM_BUFFER_0
	jump .MonNameLoaded

.Charmander
	pokenamemem CHARMANDER, MEM_BUFFER_0
	jump .MonNameLoaded

PastElkhornDollScript:
	opentext
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_MAPLE
	iftrue .Charmander
	pokenamemem BULBASAUR, MEM_BUFFER_0
.MonNameLoaded
	writetext PastElkhornDollText
	waitbutton
	closetext
	end

.Squirtle
	pokenamemem SQUIRTLE, MEM_BUFFER_0
	jump .MonNameLoaded

.Charmander
	pokenamemem CHARMANDER, MEM_BUFFER_0
	jump .MonNameLoaded

PastElkhornMomText:
	text "I'd really love to"
	line "see my favorite"
	cont "#MON @"
	text_ram wStringBuffer3
	text "<CONT>some day."

	para "They are really"
	line "rare! I've only"
	cont "read about them"
	cont "in books."

	para "Have you ever seen"
	line "one?"
	done

PastElkhornDollText:
	text "It's an adorable"
	line "@"
	text_ram wStringBuffer3
	text " DOLL!"
	done

PastElkhornMomsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ELKHORN_TOWN, 1
	warp_event 3,  7, PAST_ELKHORN_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  5, SPRITE_PAST_MOM, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornMomScript, -1
	object_event 10,  3, SPRITE_PAST_MOM_DOLL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornDollScript, -1
